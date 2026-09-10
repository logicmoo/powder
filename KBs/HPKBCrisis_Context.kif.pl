:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:1412,dialect:kif,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:22298,mappingHash:'5f1e628c0662dd5129c5deca3c808fbe74ebeea2c17071cda1656d04c12d674d',mtPolicy:filename_v1,normalizedDigest:fb433d1015d6df4c2b0bf765bed6f84ee6c1779992fe46da38899d3855c77d30,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:773428,source:'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif',sourceHash:'0ac2a3e59728e409a71080783ac9080ce422748b260778cb206b632ed2f5fd33',warnings:[]}).
x_implies(x_and(x_isa(V1,x_EconomicEmbargo),x_targetedProductType(V1,V2),x_maleficiary(V1,V3)),x_quantityChangeFunction(x_ShortTermFn(V1),V2,x_Kappa(t(V4,V5),x_demandRate(V3,V4,V5)),x_NetDecreasingFunction)) :- x_cid(a65b12506e9123,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9123,x_HPKBCrisisMt).
xc_source_file(a65b12506e9123,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9123,19).
xc_kb_names(a65b12506e9123,["?EMBARGO","?PROD-TYPE","?EMBARGOEE","?PRODUCT","?PRICE"]).
xc_mapping_rows(a65b12506e9123,['implication-implies']).
xc_direction(a65b12506e9123,':BACKWARD').
xc_monotonicity(a65b12506e9123,':DEFAULT').
xc_creator(a65b12506e9123,'Watson').
xc_creation_date(a65b12506e9123,19990827).
x_implies(x_and(x_isa(V1,x_MilitaryOccupation),x_isa(V2,x_Country),x_different(V2,V3),x_isa(V3,x_Country),x_holdsIn(V1,x_territoriesControlled(V3,V4))),x_decreasesCausally(V1,x_territoriesControlled(V2,V4),x_likelihood)) :- x_cid(a65b12506e9124,V1,V2,V3,V4).
xc_microtheory(a65b12506e9124,x_HPKBCrisisMt).
xc_source_file(a65b12506e9124,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9124,34).
xc_kb_names(a65b12506e9124,["?OCCUPATION","?COUNTRY","?OCCUPIER","?REGION"]).
xc_mapping_rows(a65b12506e9124,['implication-implies']).
xc_direction(a65b12506e9124,':BACKWARD').
xc_monotonicity(a65b12506e9124,':DEFAULT').
xc_creator(a65b12506e9124,'Watson').
xc_creation_date(a65b12506e9124,19990819).
x_implies(x_mediators(V1,V2),x_interests(V2,x_thereExists(V3,x_and(x_isa(V3,x_ResolvePeacefully),x_resolvedBy(V1,V3))),x_Positive)) :- x_cid(a65b12506e9125,V1,V2,V3).
xc_microtheory(a65b12506e9125,x_HPKBCrisisMt).
xc_source_file(a65b12506e9125,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9125,49).
xc_kb_names(a65b12506e9125,["?DISPUTE","?AGENT","?RESOLUTION"]).
xc_mapping_rows(a65b12506e9125,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9125,':BACKWARD').
xc_monotonicity(a65b12506e9125,':DEFAULT').
xc_creator(a65b12506e9125,'Huffer').
xc_creation_date(a65b12506e9125,19990819).
x_implies(x_and(x_isa(V1,x_Country),x_deliberateActors(V2,V1),x_different(V3,V1),x_isa(V3,x_Country),x_territoriesControlled(V4,V3),x_isa(V4,x_Organization),x_genlAttributes(V5,x_VitalNationalInterest),'x_decreases-Generic'(V2,V6,x_likelihood),x_goalCategoryForAgent(V4,V6,V5)),'x_increases-Generic'(V2,V1,x_Kappa(t(V7,V8),'x_statusWithAgent-Gradient'(V7,V4,x_StateOfDiplomaticTension,V8)))) :- x_cid(a65b12506e9126,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12506e9126,x_HPKBCrisisMt).
xc_source_file(a65b12506e9126,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9126,62).
xc_kb_names(a65b12506e9126,["?THREAT-COUNTRY","?THREAT-ACT","?ORG-COUNTRY","?CONTROLLING-ORG","?VITAL-INTEREST-CATEGORY","?VITAL-INTEREST","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e9126,['implication-implies']).
xc_direction(a65b12506e9126,':BACKWARD').
xc_monotonicity(a65b12506e9126,':DEFAULT').
xc_creator(a65b12506e9126,'Watson').
xc_creation_date(a65b12506e9126,19990818).
x_implies(x_and(x_isa(V1,x_Country),x_different(V1,V2),x_isa(V2,x_Country),x_deliberateActors(V3,V1),x_territoriesControlled(V4,V2),x_isa(V4,x_Organization),x_genlAttributes(V5,x_VitalNationalInterest),'x_increases-Generic'(V3,V6,x_likelihood),x_goalCategoryForAgent(V4,V6,V5)),'x_decreases-Generic'(V3,V1,x_Kappa(t(V7,V8),'x_statusWithAgent-Gradient'(V7,V4,x_StateOfDiplomaticTension,V8)))) :- x_cid(a65b12506e9127,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12506e9127,x_HPKBCrisisMt).
xc_source_file(a65b12506e9127,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9127,82).
xc_kb_names(a65b12506e9127,["?HELP-COUNTRY","?ORG-COUNTRY","?HELP-ACT","?CONTROLLING-ORG","?VITAL-INTEREST-CATEGORY","?VITAL-INTEREST","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e9127,['implication-implies']).
xc_direction(a65b12506e9127,':BACKWARD').
xc_monotonicity(a65b12506e9127,':DEFAULT').
xc_creator(a65b12506e9127,'Watson').
xc_creation_date(a65b12506e9127,19990818).
x_goals(x_Azerbaijan,x_thereExists(V1,x_and(x_isa(V1,x_MakingFn(x_OilPipeline)),x_eventOccursAt(V1,x_Azerbaijan)))) :- x_cid(a65b12506e9128,V1).
xc_microtheory(a65b12506e9128,x_HPKBCrisisMt).
xc_source_file(a65b12506e9128,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9128,102).
xc_kb_names(a65b12506e9128,["?OIL-PIPELINE-CONSTRUCTION"]).
xc_mapping_rows(a65b12506e9128,['exists-thereexists']).
xc_direction(a65b12506e9128,':FORWARD').
xc_monotonicity(a65b12506e9128,':DEFAULT').
x_goalCategoryForAgent(x_Azerbaijan,x_thereExists(V1,x_and(x_isa(V1,x_MakingFn(x_OilPipeline)),x_eventOccursAt(V1,x_Azerbaijan))),x_StrategicNationalInterest) :- x_cid(a65b12506e9129,V1).
xc_microtheory(a65b12506e9129,x_HPKBCrisisMt).
xc_source_file(a65b12506e9129,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9129,114).
xc_kb_names(a65b12506e9129,["?OIL-PIPELINE-CONSTRUCTION"]).
xc_mapping_rows(a65b12506e9129,['exists-thereexists']).
xc_direction(a65b12506e9129,':FORWARD').
xc_monotonicity(a65b12506e9129,':DEFAULT').
x_implies(x_intentInPlan(V1,V2,V3),x_interests(V1,V3,x_Positive)) :- x_cid(a65b12506e912a,V1,V2,V3).
xc_microtheory(a65b12506e912a,x_HPKBCrisisMt).
xc_source_file(a65b12506e912a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e912a,126).
xc_kb_names(a65b12506e912a,["?AGENT","?PLAN","?INTENT"]).
xc_mapping_rows(a65b12506e912a,['implication-implies']).
xc_direction(a65b12506e912a,':BACKWARD').
xc_monotonicity(a65b12506e912a,':DEFAULT').
xc_creator(a65b12506e912a,'Huffer').
xc_creation_date(a65b12506e912a,19990818).
x_implies(x_intentInPlan(V1,V2,x_thereExists(V3,'x_decreases-Generic'(V3,V4,V5))),x_interests(V1,t(V5,V4,x_Low),x_Positive)) :- x_cid(a65b12506e912b,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e912b,x_HPKBCrisisMt).
xc_source_file(a65b12506e912b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e912b,134).
xc_kb_names(a65b12506e912b,["?AGENT","?PLAN","?SOMETHING","?SOMETHING-ELSE","?PRED"]).
xc_mapping_rows(a65b12506e912b,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e912b,':BACKWARD').
xc_monotonicity(a65b12506e912b,':DEFAULT').
xc_creator(a65b12506e912b,'Huffer').
xc_creation_date(a65b12506e912b,19990818).
x_implies(x_intentInPlan(V1,V2,x_thereExists(V3,'x_increases-Generic'(V3,V4,V5))),x_interests(V1,t(V5,V4,x_High),x_Positive)) :- x_cid(a65b12506e912c,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e912c,x_HPKBCrisisMt).
xc_source_file(a65b12506e912c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e912c,146).
xc_kb_names(a65b12506e912c,["?AGENT","?PLAN","?SOMETHING","?SOMETHING-ELSE","?PRED"]).
xc_mapping_rows(a65b12506e912c,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e912c,':BACKWARD').
xc_monotonicity(a65b12506e912c,':DEFAULT').
xc_creator(a65b12506e912c,'Huffer').
xc_creation_date(a65b12506e912c,19990818).
x_comment(x_implies(x_isa(V1,x_TerroristAgent),x_relationAllExists(x_subEvents,x_CollectionSubsetFn(x_Bombing,x_TheSetOf(V2,x_performedBy(V2,V1))),x_DeployingMateriel)),"As a default, whenever a terrorist agent performs a bombing event, this bombing event has as a subevent an event in which materiels, e.g. explosives, are deployed.") :- x_cid(a65b12506e912d,V1,V2).
xc_microtheory(a65b12506e912d,x_HPKBCrisisMt).
xc_source_file(a65b12506e912d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e912d,158).
xc_kb_names(a65b12506e912d,["?TERRORIST","?OBJ"]).
xc_mapping_rows(a65b12506e912d,['implication-implies']).
xc_direction(a65b12506e912d,':BACKWARD').
xc_monotonicity(a65b12506e912d,':DEFAULT').
xc_creator(a65b12506e912d,'Meyer').
xc_creation_date(a65b12506e912d,19990818).
x_implies(x_and(x_isa(V1,x_Organization),x_territoriesControlled(V1,V2),x_isa(V2,x_Country),x_deliberateActors(V3,V1),x_different(V4,V2),x_isa(V4,x_Country),x_genlAttributes(V5,x_VitalNationalInterest),'x_decreases-Generic'(V3,V6,x_likelihood),x_goalCategoryForAgent(V4,V6,V5)),'x_increases-Generic'(V3,V1,x_Kappa(t(V7,V8),'x_statusWithAgent-Gradient'(V7,V4,x_StateOfDiplomaticTension,V8)))) :- x_cid(a65b12506e912e,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12506e912e,x_HPKBCrisisMt).
xc_source_file(a65b12506e912e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e912e,170).
xc_kb_names(a65b12506e912e,["?THREAT-ORG","?ORG-COUNTRY","?THREAT-ACT","?COUNTRY","?VITAL-INTEREST-CATEGORY","?VITAL-INTEREST","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e912e,['implication-implies']).
xc_direction(a65b12506e912e,':BACKWARD').
xc_monotonicity(a65b12506e912e,':DEFAULT').
xc_creator(a65b12506e912e,'Watson').
xc_creation_date(a65b12506e912e,19990818).
x_implies(x_and(x_isa(V1,x_Organization),x_territoriesControlled(V1,V2),x_isa(V2,x_Country),x_deliberateActors(V3,V1),x_different(V4,V2),x_isa(V4,x_Country),x_genlAttributes(V5,x_VitalNationalInterest),'x_increases-Generic'(V3,V6,x_likelihood),x_goalCategoryForAgent(V4,V6,V5)),'x_decreases-Generic'(V3,V1,x_Kappa(t(V7,V8),'x_statusWithAgent-Gradient'(V7,V4,x_StateOfDiplomaticTension,V8)))) :- x_cid(a65b12506e912f,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12506e912f,x_HPKBCrisisMt).
xc_source_file(a65b12506e912f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e912f,190).
xc_kb_names(a65b12506e912f,["?HELP-ORG","?ORG-COUNTRY","?HELP-ACT","?COUNTRY","?VITAL-INTEREST-CATEGORY","?VITAL-INTEREST","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e912f,['implication-implies']).
xc_direction(a65b12506e912f,':BACKWARD').
xc_monotonicity(a65b12506e912f,':DEFAULT').
xc_creator(a65b12506e912f,'Watson').
xc_creation_date(a65b12506e912f,19990818).
x_implies(x_and(x_isa(V1,x_Country),x_deliberateActors(V2,V1),x_different(V3,V1),x_isa(V3,x_Country),x_genlAttributes(V4,x_VitalNationalInterest),'x_decreases-Generic'(V2,V5,x_likelihood),x_goalCategoryForAgent(V3,V5,V4)),'x_increases-Generic'(V2,V1,x_Kappa(t(V6,V7),'x_statusWithAgent-Gradient'(V6,V3,x_StateOfDiplomaticTension,V7)))) :- x_cid(a65b12506e9130,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9130,x_HPKBCrisisMt).
xc_source_file(a65b12506e9130,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9130,210).
xc_kb_names(a65b12506e9130,["?THREAT-COUNTRY","?THREAT-ACT","?COUNTRY","?VITAL-INTEREST-CATEGORY","?VITAL-INTEREST","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e9130,['implication-implies']).
xc_direction(a65b12506e9130,':BACKWARD').
xc_monotonicity(a65b12506e9130,':DEFAULT').
xc_creator(a65b12506e9130,'Watson').
xc_creation_date(a65b12506e9130,19990818).
x_implies(x_and(x_isa(V1,x_Country),x_deliberateActors(V2,V1),x_different(V3,V1),x_isa(V3,x_Country),x_genlAttributes(V4,x_VitalNationalInterest),'x_increases-Generic'(V2,V5,x_likelihood),x_goalCategoryForAgent(V3,V5,V4)),'x_decreases-Generic'(V2,V1,x_Kappa(t(V6,V7),'x_statusWithAgent-Gradient'(V6,V3,x_StateOfDiplomaticTension,V7)))) :- x_cid(a65b12506e9131,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9131,x_HPKBCrisisMt).
xc_source_file(a65b12506e9131,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9131,228).
xc_kb_names(a65b12506e9131,["?HELP-COUNTRY","?HELP-ACT","?COUNTRY","?VITAL-INTEREST-CATEGORY","?VITAL-INTEREST","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e9131,['implication-implies']).
xc_direction(a65b12506e9131,':BACKWARD').
xc_monotonicity(a65b12506e9131,':DEFAULT').
xc_creator(a65b12506e9131,'Watson').
xc_creation_date(a65b12506e9131,19990818).
x_comment(x_implies(x_and(x_isa(V1,x_MilitaryInvasion),x_followingValue(x_Medium,V2),x_objectActedOn(V1,V3),x_different(V4,V5),'x_power-Military'(V4,V2),x_deliberateActors(V1,V4),x_holdsIn(x_STIB(V1),x_territoriesControlled(V5,V3))),x_decreasesImmediatelyCausally(V1,x_territoriesControlled(V5,V3),x_likelihood)),"This rule says that if a military invasion of a region is conducted by an agent, and that agent has greater than average military power, then the invasion decreases the likelihood that the agent who controlled the region immediately prior to the invasion will retain control of that region.") :- x_cid(a65b12506e9132,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9132,x_HPKBCrisisMt).
xc_source_file(a65b12506e9132,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9132,246).
xc_kb_names(a65b12506e9132,["?INVASION","?POWER-LEVEL","?REGION","?AGENT-1","?AGENT-2"]).
xc_mapping_rows(a65b12506e9132,['implication-implies']).
xc_direction(a65b12506e9132,':BACKWARD').
xc_monotonicity(a65b12506e9132,':DEFAULT').
xc_creator(a65b12506e9132,'Watson').
xc_creation_date(a65b12506e9132,19990818).
x_implies(x_isa(V1,x_TerroristAgent),x_relationAllExists(x_subEvents,x_CollectionSubsetFn(x_Bombing,x_TheSetOf(V2,x_performedBy(V2,V1))),x_DeployingMateriel)) :- x_cid(a65b12506e9133,V1,V2).
xc_microtheory(a65b12506e9133,x_HPKBCrisisMt).
xc_source_file(a65b12506e9133,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9133,265).
xc_kb_names(a65b12506e9133,["?TERRORIST","?OBJ"]).
xc_mapping_rows(a65b12506e9133,['implication-implies']).
xc_direction(a65b12506e9133,':BACKWARD').
xc_monotonicity(a65b12506e9133,':DEFAULT').
xc_creator(a65b12506e9133,'Meyer').
xc_creation_date(a65b12506e9133,19990817).
x_implies(x_and(x_isa(V1,x_DiplomaticRequest),x_inReactionTo(V1,V2),x_senderOfInfo(V1,V3),x_topicOfInfoTransfer(V1,V4),x_genls(V4,x_MakingAnAgreement)),x_mediators(V2,V3)) :- x_cid(a65b12506e9134,V1,V2,V3,V4).
xc_microtheory(a65b12506e9134,x_HPKBCrisisMt).
xc_source_file(a65b12506e9134,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9134,276).
xc_kb_names(a65b12506e9134,["?REQ","?SIT","?MEDIATOR","?AGREEING"]).
xc_mapping_rows(a65b12506e9134,['implication-implies']).
xc_direction(a65b12506e9134,':BACKWARD').
xc_monotonicity(a65b12506e9134,':DEFAULT').
xc_creator(a65b12506e9134,'Zaiss').
xc_creation_date(a65b12506e9134,19990813).
x_implies(x_and(x_isa(V1,x_DeployingMateriel),x_directingAgent(V1,V2),x_isa(V2,x_TerroristGroup)),x_thereExists(V3,x_and(x_goalCategoryForAgent(V2,V3,x_StrategicInterest),x_purposeInEvent(V2,V1,V3)))) :- x_cid(a65b12506e9135,V1,V2,V3).
xc_microtheory(a65b12506e9135,x_HPKBCrisisMt).
xc_source_file(a65b12506e9135,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9135,289).
xc_kb_names(a65b12506e9135,["?DEPLOY","?TERRORIST-ORG","?STRATEGIC-INTEREST"]).
xc_mapping_rows(a65b12506e9135,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9135,':BACKWARD').
xc_monotonicity(a65b12506e9135,':DEFAULT').
xc_creator(a65b12506e9135,'Meyer').
xc_creation_date(a65b12506e9135,19990813).
x_implies(x_and(x_isa(V1,x_DeployingMateriel),x_directingAgent(V1,V2),x_isa(V2,x_TerroristGroup)),x_thereExists(V3,x_and(x_goalCategoryForAgent(V2,V3,x_StrategicInterest),x_purposeInEvent(V2,V1,V3)))) :- x_cid(a65b12506e9136,V1,V2,V3).
xc_microtheory(a65b12506e9136,x_HPKBCrisisMt).
xc_source_file(a65b12506e9136,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9136,304).
xc_kb_names(a65b12506e9136,["?DEPLOY","?TERRORIST-ORG","?STRATEGIC-INTEREST"]).
xc_mapping_rows(a65b12506e9136,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9136,':BACKWARD').
xc_monotonicity(a65b12506e9136,':DEFAULT').
xc_creator(a65b12506e9136,'Meyer').
xc_creation_date(a65b12506e9136,19990813).
x_arg2Isa('x_SKF-38278410',x_TerroristGroup) :- x_cid(a65b12506e9137).
xc_microtheory(a65b12506e9137,x_HPKBCrisisMt).
xc_source_file(a65b12506e9137,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9137,319).
xc_kb_names(a65b12506e9137,[]).
xc_mapping_rows(a65b12506e9137,[]).
xc_direction(a65b12506e9137,':FORWARD').
xc_monotonicity(a65b12506e9137,':DEFAULT').
x_arg1Isa('x_SKF-38278410',x_DeployingMateriel) :- x_cid(a65b12506e9138).
xc_microtheory(a65b12506e9138,x_HPKBCrisisMt).
xc_source_file(a65b12506e9138,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9138,325).
xc_kb_names(a65b12506e9138,[]).
xc_mapping_rows(a65b12506e9138,[]).
xc_direction(a65b12506e9138,':FORWARD').
xc_monotonicity(a65b12506e9138,':DEFAULT').
x_resultIsa('x_SKF-38278410',x_Goal) :- x_cid(a65b12506e9139).
xc_microtheory(a65b12506e9139,x_HPKBCrisisMt).
xc_source_file(a65b12506e9139,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9139,331).
xc_kb_names(a65b12506e9139,[]).
xc_mapping_rows(a65b12506e9139,[]).
xc_direction(a65b12506e9139,':FORWARD').
xc_monotonicity(a65b12506e9139,':DEFAULT').
x_resultIsa('x_SKF-38278410',x_CycFormula) :- x_cid(a65b12506e913a).
xc_microtheory(a65b12506e913a,x_HPKBCrisisMt).
xc_source_file(a65b12506e913a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e913a,337).
xc_kb_names(a65b12506e913a,[]).
xc_mapping_rows(a65b12506e913a,[]).
xc_direction(a65b12506e913a,':FORWARD').
xc_monotonicity(a65b12506e913a,':DEFAULT').
x_arity('x_SKF-38278410',2) :- x_cid(a65b12506e913b).
xc_microtheory(a65b12506e913b,x_HPKBCrisisMt).
xc_source_file(a65b12506e913b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e913b,343).
xc_kb_names(a65b12506e913b,[]).
xc_mapping_rows(a65b12506e913b,[]).
xc_direction(a65b12506e913b,':FORWARD').
xc_monotonicity(a65b12506e913b,':MONOTONIC').
x_isa('x_SKF-38278410',x_SkolemFunction) :- x_cid(a65b12506e913c).
xc_microtheory(a65b12506e913c,x_HPKBCrisisMt).
xc_source_file(a65b12506e913c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e913c,349).
xc_kb_names(a65b12506e913c,[]).
xc_mapping_rows(a65b12506e913c,[]).
xc_direction(a65b12506e913c,':FORWARD').
xc_monotonicity(a65b12506e913c,':MONOTONIC').
x_implies(x_and(x_isa(V1,x_MilitaryInvasion),x_deliberateActors(V1,V2),x_objectActedOn(V1,V3),'x_power-Military'(V2,V4),x_followingValue(x_Medium,V4),x_different(V2,V5),x_holdsIn(x_STIB(V1),x_territoriesControlled(V5,V3))),x_decreasesImmediatelyCausally(V1,x_territoriesControlled(V5,V3),x_likelihood)) :- x_cid(a65b12506e913d,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e913d,x_HPKBCrisisMt).
xc_source_file(a65b12506e913d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e913d,355).
xc_kb_names(a65b12506e913d,["?INVASION","?AGENT-1","?REGION","?POWER-LEVEL","?AGENT-2"]).
xc_mapping_rows(a65b12506e913d,['implication-implies']).
xc_direction(a65b12506e913d,':BACKWARD').
xc_monotonicity(a65b12506e913d,':DEFAULT').
xc_creator(a65b12506e913d,'Watson').
xc_creation_date(a65b12506e913d,19990812).
x_implies(x_and('x_causes-SitProp'(V1,V2),x_goals(V3,V2)),x_beneficiary(V1,V3)) :- x_cid(a65b12506e913e,V1,V2,V3).
xc_microtheory(a65b12506e913e,x_HPKBCrisisMt).
xc_source_file(a65b12506e913e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e913e,373).
xc_kb_names(a65b12506e913e,["?EVT","?GOAL","?AGT"]).
xc_mapping_rows(a65b12506e913e,['implication-implies']).
xc_direction(a65b12506e913e,':BACKWARD').
xc_monotonicity(a65b12506e913e,':DEFAULT').
xc_creator(a65b12506e913e,'Zaiss').
xc_creation_date(a65b12506e913e,19990808).
x_implies(x_and(x_isa(V1,x_TerroristAct),x_eventOccursAt(V1,V2),x_inRegion(V2,V3),x_residenceOfOrganization(V4,V3),x_isa(V4,x_TerroristGroup),x_followingValue(x_MediumAmountFn(x_MilitarySupport),V5),x_givesSupportToAgent(V6,V4,V5)),x_capableOfDoing(V6,V1,x_directingAgent)) :- x_cid(a65b12506e913f,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e913f,x_HPKBCrisisMt).
xc_source_file(a65b12506e913f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e913f,383).
xc_kb_names(a65b12506e913f,["?TERROR","?PLACE","?AREA","?GROUP","?SUPPORT","?AGENT"]).
xc_mapping_rows(a65b12506e913f,['implication-implies']).
xc_direction(a65b12506e913f,':BACKWARD').
xc_monotonicity(a65b12506e913f,':DEFAULT').
xc_creator(a65b12506e913f,'Watson').
xc_creation_date(a65b12506e913f,19990806).
x_isa('x_TakingAmericanHostages-1979',x_TransnationalCrime) :- x_cid(a65b12506e9140).
xc_microtheory(a65b12506e9140,x_HPKBCrisisMt).
xc_source_file(a65b12506e9140,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9140,399).
xc_kb_names(a65b12506e9140,[]).
xc_mapping_rows(a65b12506e9140,[]).
xc_direction(a65b12506e9140,':FORWARD').
xc_monotonicity(a65b12506e9140,':DEFAULT').
x_isa(x_MurderOfRezaMazlouman,x_TransnationalCrime) :- x_cid(a65b12506e9141).
xc_microtheory(a65b12506e9141,x_HPKBCrisisMt).
xc_source_file(a65b12506e9141,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9141,405).
xc_kb_names(a65b12506e9141,[]).
xc_mapping_rows(a65b12506e9141,[]).
xc_direction(a65b12506e9141,':FORWARD').
xc_monotonicity(a65b12506e9141,':DEFAULT').
x_isa('x_AssassinationOfDissident038-2',x_TransnationalCrime) :- x_cid(a65b12506e9142).
xc_microtheory(a65b12506e9142,x_HPKBCrisisMt).
xc_source_file(a65b12506e9142,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9142,411).
xc_kb_names(a65b12506e9142,[]).
xc_mapping_rows(a65b12506e9142,[]).
xc_direction(a65b12506e9142,':FORWARD').
xc_monotonicity(a65b12506e9142,':DEFAULT').
x_isa('x_AssassinationOfDissident038-1',x_TransnationalCrime) :- x_cid(a65b12506e9143).
xc_microtheory(a65b12506e9143,x_HPKBCrisisMt).
xc_source_file(a65b12506e9143,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9143,417).
xc_kb_names(a65b12506e9143,[]).
xc_mapping_rows(a65b12506e9143,[]).
xc_direction(a65b12506e9143,':FORWARD').
xc_monotonicity(a65b12506e9143,':DEFAULT').
x_isa(x_KillingAtMykonosRestaurant,x_TransnationalCrime) :- x_cid(a65b12506e9144).
xc_microtheory(a65b12506e9144,x_HPKBCrisisMt).
xc_source_file(a65b12506e9144,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9144,423).
xc_kb_names(a65b12506e9144,[]).
xc_mapping_rows(a65b12506e9144,[]).
xc_direction(a65b12506e9144,':FORWARD').
xc_monotonicity(a65b12506e9144,':DEFAULT').
x_comment(x_implies(x_and(x_dateOfEvent(V1,V2),x_dateOfEvent(V3,V4),x_holdsIn(x_TimeIntervalInclusiveFn(V1,V3),V5)),x_holdsSometimeDuring(x_TimeIntervalInclusiveFn(V2,V4),V5)),"If something holds throughout the time interval subsuming two events occurring on DATE1 and DATE2, then that something holds sometime during the time interval subsuming DATE1 and DATE2.") :- x_cid(a65b12506e9145,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9145,x_HPKBCrisisMt).
xc_source_file(a65b12506e9145,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9145,429).
xc_kb_names(a65b12506e9145,["?EVENT1","?DATE1","?EVENT2","?DATE2","?SOMETHING"]).
xc_mapping_rows(a65b12506e9145,['implication-implies']).
xc_direction(a65b12506e9145,':BACKWARD').
xc_monotonicity(a65b12506e9145,':DEFAULT').
xc_creator(a65b12506e9145,'Huffer').
xc_creation_date(a65b12506e9145,19990806).
x_implies(x_and(x_holdsIn(x_TimeIntervalInclusiveFn(V1,V2),V3),x_dateOfEvent(V1,V4),x_dateOfEvent(V2,V5)),x_holdsSometimeDuring(x_TimeIntervalInclusiveFn(V4,V5),V3)) :- x_cid(a65b12506e9146,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9146,x_HPKBCrisisMt).
xc_source_file(a65b12506e9146,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9146,443).
xc_kb_names(a65b12506e9146,["?EVENT1","?EVENT2","?SOMETHING","?DATE1","?DATE2"]).
xc_mapping_rows(a65b12506e9146,['implication-implies']).
xc_direction(a65b12506e9146,':BACKWARD').
xc_monotonicity(a65b12506e9146,':DEFAULT').
xc_creator(a65b12506e9146,'Huffer').
xc_creation_date(a65b12506e9146,19990806).
x_comment(x_implies(x_and(x_directingAgent(V1,V2),x_inReactionTo(V1,V3)),x_holdsIn(x_TimeIntervalInclusiveFn(V3,V1),x_interests(V2,V3,x_Positive))),"If an actor does something, or causes something to be done, in reaction to some other action or event, then it follows that throughout the time interval subsuming the triggering action and the reaction that the actor has an interest in the triggering action.") :- x_cid(a65b12506e9147,V1,V2,V3).
xc_microtheory(a65b12506e9147,x_HPKBCrisisMt).
xc_source_file(a65b12506e9147,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9147,456).
xc_kb_names(a65b12506e9147,["?REACTION","?AGENT","?ACTION"]).
xc_mapping_rows(a65b12506e9147,['implication-implies']).
xc_direction(a65b12506e9147,':BACKWARD').
xc_monotonicity(a65b12506e9147,':DEFAULT').
xc_creator(a65b12506e9147,'Huffer').
xc_creation_date(a65b12506e9147,19990806).
x_implies(x_and(x_directingAgent(V1,V2),x_inReactionTo(V1,V3)),x_holdsIn(x_TimeIntervalInclusiveFn(V3,V1),x_interests(V2,V3,x_Positive))) :- x_cid(a65b12506e9148,V1,V2,V3).
xc_microtheory(a65b12506e9148,x_HPKBCrisisMt).
xc_source_file(a65b12506e9148,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9148,469).
xc_kb_names(a65b12506e9148,["?REACTION","?AGENT","?ACTION"]).
xc_mapping_rows(a65b12506e9148,['implication-implies']).
xc_direction(a65b12506e9148,':BACKWARD').
xc_monotonicity(a65b12506e9148,':DEFAULT').
xc_creator(a65b12506e9148,'Huffer').
xc_creation_date(a65b12506e9148,19990806).
x_comment(x_implies(x_ist(V1,x_and(x_goals(V2,V3),x_allies(V4,V2))),x_ist(V1,x_interests(V4,V3,x_Positive))),"If two actors are allies, and one of them has GOAL as a goal, then the other has an interest in GOAL.") :- x_cid(a65b12506e9149,V1,V2,V3,V4).
xc_microtheory(a65b12506e9149,x_HPKBCrisisMt).
xc_source_file(a65b12506e9149,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9149,481).
xc_kb_names(a65b12506e9149,["?MT","?ALLY","?GOAL","?AGENT"]).
xc_mapping_rows(a65b12506e9149,['implication-implies']).
xc_direction(a65b12506e9149,':BACKWARD').
xc_monotonicity(a65b12506e9149,':DEFAULT').
xc_creator(a65b12506e9149,'Huffer').
xc_creation_date(a65b12506e9149,19990806).
x_implies(x_ist(V1,x_and(x_goals(V2,V3),x_allies(V4,V2))),x_ist(V1,x_interests(V4,V3,x_Positive))) :- x_cid(a65b12506e914a,V1,V2,V3,V4).
xc_microtheory(a65b12506e914a,x_HPKBCrisisMt).
xc_source_file(a65b12506e914a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e914a,494).
xc_kb_names(a65b12506e914a,["?MT","?ALLY","?GOAL","?AGENT"]).
xc_mapping_rows(a65b12506e914a,['implication-implies']).
xc_direction(a65b12506e914a,':BACKWARD').
xc_monotonicity(a65b12506e914a,':DEFAULT').
xc_creator(a65b12506e914a,'Huffer').
xc_creation_date(a65b12506e914a,19990806).
x_comment(x_implies(x_and(x_goals(V1,V2),x_allies(V1,V3)),x_interests(V3,V2,x_Positive)),"If two actors are allies, and one of them has GOAL as a goal, then the other has an interest in GOAL.") :- x_cid(a65b12506e914b,V1,V2,V3).
xc_microtheory(a65b12506e914b,x_HPKBCrisisMt).
xc_source_file(a65b12506e914b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e914b,506).
xc_kb_names(a65b12506e914b,["?AGENT","?GOAL","?ALLY"]).
xc_mapping_rows(a65b12506e914b,['implication-implies']).
xc_direction(a65b12506e914b,':BACKWARD').
xc_monotonicity(a65b12506e914b,':DEFAULT').
xc_creator(a65b12506e914b,'Huffer').
xc_creation_date(a65b12506e914b,19990806).
x_implies(x_and(x_allies(V1,V2),x_goals(V1,V3)),x_interests(V2,V3,x_Positive)) :- x_cid(a65b12506e914c,V1,V2,V3).
xc_microtheory(a65b12506e914c,x_HPKBCrisisMt).
xc_source_file(a65b12506e914c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e914c,517).
xc_kb_names(a65b12506e914c,["?AGENT","?ALLY","?GOAL"]).
xc_mapping_rows(a65b12506e914c,['implication-implies']).
xc_direction(a65b12506e914c,':BACKWARD').
xc_monotonicity(a65b12506e914c,':DEFAULT').
xc_creator(a65b12506e914c,'Huffer').
xc_creation_date(a65b12506e914c,19990806).
x_comment(x_implies(x_ist(V1,x_and(x_intentInPlan(V2,V3,V4),x_ist(V3,x_givesSupportToAgent(V5,V2,V6)))),x_ist(V1,x_interests(V5,V4,x_Positive))),"If, in the context of MT, AGENT intends by way of PLAN to accomplish INTENT, and AGENT is supported by SUPPORTER, then in the context of MT, SUPPORTER has an interest in INTENT.") :- x_cid(a65b12506e914d,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e914d,x_HPKBCrisisMt).
xc_source_file(a65b12506e914d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e914d,527).
xc_kb_names(a65b12506e914d,["?MT","?AGENT","?PLAN-MT","?INTENT","?SUPPORTER","?SUPPORT"]).
xc_mapping_rows(a65b12506e914d,['implication-implies']).
xc_direction(a65b12506e914d,':BACKWARD').
xc_monotonicity(a65b12506e914d,':DEFAULT').
xc_creator(a65b12506e914d,'Huffer').
xc_creation_date(a65b12506e914d,19990806).
x_implies(x_ist(V1,x_and(x_intentInPlan(V2,V3,V4),x_ist(V3,x_givesSupportToAgent(V5,V2,V6)))),x_ist(V1,x_interests(V5,V4,x_Positive))) :- x_cid(a65b12506e914e,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e914e,x_HPKBCrisisMt).
xc_source_file(a65b12506e914e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e914e,541).
xc_kb_names(a65b12506e914e,["?MT","?AGENT","?PLAN-MT","?INTENT","?SUPPORTER","?SUPPORT"]).
xc_mapping_rows(a65b12506e914e,['implication-implies']).
xc_direction(a65b12506e914e,':BACKWARD').
xc_monotonicity(a65b12506e914e,':DEFAULT').
xc_creator(a65b12506e914e,'Huffer').
xc_creation_date(a65b12506e914e,19990806).
x_comment(x_implies(x_and(x_intentInPlan(V1,V2,V3),x_ist(V2,x_givesSupportToAgent(V4,V1,V5))),x_ist(V2,x_interests(V4,V3,x_Positive))),"If an actor intends by way of PLAN to accomplish INTENT, and it's true in the context of PLAN that the actor is supported by SUPPORTER, then its true in the context PLAN that SUPPORTER has an interest in INTENT.") :- x_cid(a65b12506e914f,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e914f,x_HPKBCrisisMt).
xc_source_file(a65b12506e914f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e914f,554).
xc_kb_names(a65b12506e914f,["?AGENT","?MT","?INTENT","?SUPPORTER","?SUPPORT"]).
xc_mapping_rows(a65b12506e914f,['implication-implies']).
xc_direction(a65b12506e914f,':BACKWARD').
xc_monotonicity(a65b12506e914f,':DEFAULT').
xc_creator(a65b12506e914f,'Huffer').
xc_creation_date(a65b12506e914f,19990806).
x_implies(x_and(x_intentInPlan(V1,V2,V3),x_ist(V2,x_givesSupportToAgent(V4,V1,V5))),x_ist(V2,x_interests(V4,V3,x_Positive))) :- x_cid(a65b12506e9150,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9150,x_HPKBCrisisMt).
xc_source_file(a65b12506e9150,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9150,567).
xc_kb_names(a65b12506e9150,["?AGENT","?MT","?INTENT","?SUPPORTER","?SUPPORT"]).
xc_mapping_rows(a65b12506e9150,['implication-implies']).
xc_direction(a65b12506e9150,':BACKWARD').
xc_monotonicity(a65b12506e9150,':DEFAULT').
xc_creator(a65b12506e9150,'Huffer').
xc_creation_date(a65b12506e9150,19990806).
x_implies(x_and(x_opponentsInConflict(V1,V2,V3),x_purposeInEvent(V2,V3,V4)),x_holdsIn(V3,x_and(x_agentsInterestsCompete(V1,V2),x_interests(V2,V4,x_Positive),x_interests(V1,x_not(V4),x_Positive)))) :- x_cid(a65b12506e9151,V1,V2,V3,V4).
xc_microtheory(a65b12506e9151,x_HPKBCrisisMt).
xc_source_file(a65b12506e9151,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9151,579).
xc_kb_names(a65b12506e9151,["?AGENT","?COMPETING-AGENT","?CONFLICT","?PURPOSE"]).
xc_mapping_rows(a65b12506e9151,['implication-implies']).
xc_direction(a65b12506e9151,':BACKWARD').
xc_monotonicity(a65b12506e9151,':DEFAULT').
xc_creator(a65b12506e9151,'Huffer').
xc_creation_date(a65b12506e9151,19990806).
x_comment(x_implies(x_and(x_purposeInEvent(V1,V2,V3),x_opponentsInConflict(V1,V4,V2)),x_holdsIn(V2,x_and(x_agentsInterestsCompete(V1,V4),x_interests(V1,V3,x_Positive),x_interests(V4,x_not(V3),x_Positive)))),"If two actors are opponents in a conflict event in which one of the actors has PURPOSE as a purpose, it holds throughout the conflict event that the two actors are competing with respect to PURPOSE.") :- x_cid(a65b12506e9152,V1,V2,V3,V4).
xc_microtheory(a65b12506e9152,x_HPKBCrisisMt).
xc_source_file(a65b12506e9152,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9152,594).
xc_kb_names(a65b12506e9152,["?AGENT","?CONFLICT","?PURPOSE","?COMPETING-AGENT"]).
xc_mapping_rows(a65b12506e9152,['implication-implies']).
xc_direction(a65b12506e9152,':BACKWARD').
xc_monotonicity(a65b12506e9152,':DEFAULT').
xc_creator(a65b12506e9152,'Huffer').
xc_creation_date(a65b12506e9152,19990806).
x_implies(x_and(x_opponentsInConflict(V1,V2,V3),x_purposeInEvent(V1,V3,V4)),x_holdsIn(V3,x_and(x_agentsInterestsCompete(V1,V2),x_interests(V1,V4,x_Positive),x_interests(V2,x_not(V4),x_Positive)))) :- x_cid(a65b12506e9153,V1,V2,V3,V4).
xc_microtheory(a65b12506e9153,x_HPKBCrisisMt).
xc_source_file(a65b12506e9153,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9153,610).
xc_kb_names(a65b12506e9153,["?AGENT","?COMPETING-AGENT","?CONFLICT","?PURPOSE"]).
xc_mapping_rows(a65b12506e9153,['implication-implies']).
xc_direction(a65b12506e9153,':BACKWARD').
xc_monotonicity(a65b12506e9153,':DEFAULT').
xc_creator(a65b12506e9153,'Huffer').
xc_creation_date(a65b12506e9153,19990806).
x_implies(x_and(x_isa(V1,x_Group),x_groupMembers(V1,V2),x_objectTakenCareOf(V3,V1)),x_objectTakenCareOf(V3,V2)) :- x_cid(a65b12506e9154,V1,V2,V3).
xc_microtheory(a65b12506e9154,x_HPKBCrisisMt).
xc_source_file(a65b12506e9154,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9154,625).
xc_kb_names(a65b12506e9154,["?GROUP","?MEMBER","?EVENT"]).
xc_mapping_rows(a65b12506e9154,['implication-implies']).
xc_direction(a65b12506e9154,':BACKWARD').
xc_monotonicity(a65b12506e9154,':DEFAULT').
xc_creator(a65b12506e9154,'Zaiss').
xc_creation_date(a65b12506e9154,19990806).
x_temporallySubsumes(x_MonthFn(V1,x_YearFn(V2)),x_DayFn(V3,x_MonthFn(V1,x_YearFn(V2)))) :- x_cid(a65b12506e9155,V1,V2,V3).
xc_microtheory(a65b12506e9155,x_HPKBCrisisMt).
xc_source_file(a65b12506e9155,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9155,636).
xc_kb_names(a65b12506e9155,["?MONTH","?YEAR","?DAY"]).
xc_mapping_rows(a65b12506e9155,[]).
xc_direction(a65b12506e9155,':BACKWARD').
xc_monotonicity(a65b12506e9155,':DEFAULT').
xc_creator(a65b12506e9155,'Zaiss').
xc_creation_date(a65b12506e9155,19990806).
x_implies(x_and(x_isa(V1,x_CalendarMonth),x_isa(V2,x_IntegerFromFn(1,31))),x_temporallySubsumes(V1,x_DayFn(V2,V1))) :- x_cid(a65b12506e9156,V1,V2).
xc_microtheory(a65b12506e9156,x_HPKBCrisisMt).
xc_source_file(a65b12506e9156,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9156,647).
xc_kb_names(a65b12506e9156,["?MONTH","?NUM"]).
xc_mapping_rows(a65b12506e9156,['implication-implies']).
xc_direction(a65b12506e9156,':BACKWARD').
xc_monotonicity(a65b12506e9156,':DEFAULT').
xc_creator(a65b12506e9156,'Zaiss').
xc_creation_date(a65b12506e9156,19990806).
x_implies(x_and(x_objectTakenCareOf(V1,V2),x_owns(V3,V2)),x_beneficiary(V1,V3)) :- x_cid(a65b12506e9157,V1,V2,V3).
xc_microtheory(a65b12506e9157,x_HPKBCrisisMt).
xc_source_file(a65b12506e9157,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9157,659).
xc_kb_names(a65b12506e9157,["?EVENT","?OBJ","?OWNER"]).
xc_mapping_rows(a65b12506e9157,['implication-implies']).
xc_direction(a65b12506e9157,':BACKWARD').
xc_monotonicity(a65b12506e9157,':DEFAULT').
xc_creator(a65b12506e9157,'Zaiss').
xc_creation_date(a65b12506e9157,19990806).
x_implies(x_and(x_fromLocation(V1,V2),x_objectFoundInLocation(V2,V3)),x_fromLocation(V1,V3)) :- x_cid(a65b12506e9158,V1,V2,V3).
xc_microtheory(a65b12506e9158,x_HPKBCrisisMt).
xc_source_file(a65b12506e9158,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9158,669).
xc_kb_names(a65b12506e9158,["?TRANSFER","?LOC","?SUPER-LOC"]).
xc_mapping_rows(a65b12506e9158,['implication-implies']).
xc_direction(a65b12506e9158,':BACKWARD').
xc_monotonicity(a65b12506e9158,':MONOTONIC').
xc_creator(a65b12506e9158,'Zaiss').
xc_creation_date(a65b12506e9158,19990806).
x_implies(x_and(x_genlMt(V1,x_HPKBCrisisMt),x_mtTime(V1,V2),x_ist(V1,x_and(x_isa(V3,x_LinearOrderAttributeType),x_isa(V4,x_GenericValueFunction),x_genls(V3,x_InterAgentSupportAttribute),x_goals(V5,V6),x_greaterThan(t(V4,V3),x_NoAmountFn(V3)),x_givesSupportToAgent(V7,V5,t(V4,V3))))),x_holdsSometimeDuring(V8,x_interests(V7,V6,x_Positive))) :- x_cid(a65b12506e9159,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12506e9159,x_HPKBCrisisMt).
xc_source_file(a65b12506e9159,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9159,679).
xc_kb_names(a65b12506e9159,["?MT","?TIME-INTERVAL","?INTER-AGENT-SUPPORT-ATT","?VALUEFN","?SUPPORTED","?GOAL","?SUPPORTER","?TIMEINTERVAL"]).
xc_mapping_rows(a65b12506e9159,['implication-implies']).
xc_direction(a65b12506e9159,':BACKWARD').
xc_monotonicity(a65b12506e9159,':DEFAULT').
xc_creator(a65b12506e9159,'Huffer').
xc_creation_date(a65b12506e9159,19990805).
x_postEvents('x_IraqOrdersUSInspectorsOut-1997','x_PassingUNTravelBanOnIraqiOfficials-1997') :- x_cid(a65b12506e915a).
xc_microtheory(a65b12506e915a,x_HPKBCrisisMt).
xc_source_file(a65b12506e915a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e915a,701).
xc_kb_names(a65b12506e915a,[]).
xc_mapping_rows(a65b12506e915a,[]).
xc_direction(a65b12506e915a,':FORWARD').
xc_monotonicity(a65b12506e915a,':DEFAULT').
x_implies(x_and(x_isa(V1,x_Event),x_inReactionTo(V2,V1),x_startsAfterEndingOf(V2,V1)),x_postEvents(V1,V2)) :- x_cid(a65b12506e915b,V1,V2).
xc_microtheory(a65b12506e915b,x_HPKBCrisisMt).
xc_source_file(a65b12506e915b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e915b,707).
xc_kb_names(a65b12506e915b,["?EARLIER","?LATER"]).
xc_mapping_rows(a65b12506e915b,['implication-implies']).
xc_direction(a65b12506e915b,':FORWARD').
xc_monotonicity(a65b12506e915b,':DEFAULT').
xc_creator(a65b12506e915b,'Watson').
xc_creation_date(a65b12506e915b,19990804).
x_capableOfDoing(x_SaudiHizballah,'x_HYP-TerroristAct-66258087',x_performedBy) :- x_cid(a65b12506e915c).
xc_microtheory(a65b12506e915c,x_HPKBCrisisMt).
xc_source_file(a65b12506e915c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e915c,718).
xc_kb_names(a65b12506e915c,[]).
xc_mapping_rows(a65b12506e915c,[]).
xc_direction(a65b12506e915c,':FORWARD').
xc_monotonicity(a65b12506e915c,':DEFAULT').
x_isa(x_SaudiHizballah,x_DissidentGroup) :- x_cid(a65b12506e915d).
xc_microtheory(a65b12506e915d,x_HPKBCrisisMt).
xc_source_file(a65b12506e915d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e915d,724).
xc_kb_names(a65b12506e915d,[]).
xc_mapping_rows(a65b12506e915d,[]).
xc_direction(a65b12506e915d,':FORWARD').
xc_monotonicity(a65b12506e915d,':DEFAULT').
x_hasStatusWithAgent(x_SaudiHizballah,x_SaudiArabia,x_DissidentStatus) :- x_cid(a65b12506e915e).
xc_microtheory(a65b12506e915e,x_HPKBCrisisMt).
xc_source_file(a65b12506e915e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e915e,730).
xc_kb_names(a65b12506e915e,[]).
xc_mapping_rows(a65b12506e915e,[]).
xc_direction(a65b12506e915e,':FORWARD').
xc_monotonicity(a65b12506e915e,':DEFAULT').
xc_creator(a65b12506e915e,'Watson').
xc_creation_date(a65b12506e915e,19990803).
x_implies(x_and(x_isa(V1,x_TerroristGroup),x_isa(V2,x_TerroristAct),x_eventOccursAt(V2,V3),x_inRegion(V3,V4),x_genls(V5,x_TerroristAct),x_performsInsAtLocation(V1,V5,V4)),x_capableOfDoing(V1,V2,x_performedBy)) :- x_cid(a65b12506e915f,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e915f,x_HPKBCrisisMt).
xc_source_file(a65b12506e915f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e915f,736).
xc_kb_names(a65b12506e915f,["?GROUP","?TERROR-ACT","?PLACE","?LOC","?TERRORISM"]).
xc_mapping_rows(a65b12506e915f,['implication-implies']).
xc_direction(a65b12506e915f,':BACKWARD').
xc_monotonicity(a65b12506e915f,':DEFAULT').
xc_creator(a65b12506e915f,'Watson').
xc_creation_date(a65b12506e915f,19990803).
x_implies(x_dateOfEvent(V1,x_DayFn(V2,V3)),x_temporallyIntersects(V1,V3)) :- x_cid(a65b12506e9160,V1,V2,V3).
xc_microtheory(a65b12506e9160,x_HPKBCrisisMt).
xc_source_file(a65b12506e9160,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9160,750).
xc_kb_names(a65b12506e9160,["?EVENT","?DAY","?MONTH"]).
xc_mapping_rows(a65b12506e9160,['implication-implies']).
xc_direction(a65b12506e9160,':BACKWARD').
xc_monotonicity(a65b12506e9160,':DEFAULT').
xc_creator(a65b12506e9160,'Molloy').
xc_creation_date(a65b12506e9160,19990730).
x_behaviorCapable(x_Iran,x_MilitaryAttack,x_directingAgent) :- x_cid(a65b12506e9161).
xc_microtheory(a65b12506e9161,x_HPKBCrisisMt).
xc_source_file(a65b12506e9161,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9161,759).
xc_kb_names(a65b12506e9161,[]).
xc_mapping_rows(a65b12506e9161,[]).
xc_direction(a65b12506e9161,':FORWARD').
xc_monotonicity(a65b12506e9161,':DEFAULT').
xc_creator(a65b12506e9161,'Watson').
xc_creation_date(a65b12506e9161,19990729).
x_goals(x_Iran,x_territoriesControlled(x_Iran,x_TheTumbsIslands)) :- x_cid(a65b12506e9162).
xc_microtheory(a65b12506e9162,x_HPKBCrisisMt).
xc_source_file(a65b12506e9162,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9162,765).
xc_kb_names(a65b12506e9162,[]).
xc_mapping_rows(a65b12506e9162,[]).
xc_direction(a65b12506e9162,':FORWARD').
xc_monotonicity(a65b12506e9162,':DEFAULT').
x_goals(x_Iran,x_territoriesControlled(x_Iran,x_AbuMusaIsland)) :- x_cid(a65b12506e9163).
xc_microtheory(a65b12506e9163,x_HPKBCrisisMt).
xc_source_file(a65b12506e9163,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9163,772).
xc_kb_names(a65b12506e9163,[]).
xc_mapping_rows(a65b12506e9163,[]).
xc_direction(a65b12506e9163,':FORWARD').
xc_monotonicity(a65b12506e9163,':DEFAULT').
x_deliberateActors(x_IraqInvadingKuwait,x_Iraq) :- x_cid(a65b12506e9164).
xc_microtheory(a65b12506e9164,x_HPKBCrisisMt).
xc_source_file(a65b12506e9164,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9164,779).
xc_kb_names(a65b12506e9164,[]).
xc_mapping_rows(a65b12506e9164,[]).
xc_direction(a65b12506e9164,':FORWARD').
xc_monotonicity(a65b12506e9164,':DEFAULT').
x_mtTime(x_PersianGulfWarMt,x_PersianGulfWar) :- x_cid(a65b12506e9165).
xc_microtheory(a65b12506e9165,x_HPKBCrisisMt).
xc_source_file(a65b12506e9165,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9165,785).
xc_kb_names(a65b12506e9165,[]).
xc_mapping_rows(a65b12506e9165,[]).
xc_direction(a65b12506e9165,':FORWARD').
xc_monotonicity(a65b12506e9165,':MONOTONIC').
xc_creator(a65b12506e9165,'Rode').
xc_creation_date(a65b12506e9165,19990729).
x_comment(x_OperationDesertStorm,"The overall military operation\n carried out by coalition of forces (led by the\n #$UnitedStatesOfAmerica) against #$Iraq during the #$PersianGulfWar.  The operation\nincluded air attacks on targets in #$Iraq as well as air and ground\nattacks against #$Iraq's forces inside #$Kuwait.") :- x_cid(a65b12506e9166).
xc_microtheory(a65b12506e9166,x_HPKBCrisisMt).
xc_source_file(a65b12506e9166,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9166,791).
xc_kb_names(a65b12506e9166,[]).
xc_mapping_rows(a65b12506e9166,[]).
xc_direction(a65b12506e9166,':FORWARD').
xc_monotonicity(a65b12506e9166,':DEFAULT').
xc_creator(a65b12506e9166,'ABelasco').
xc_creation_date(a65b12506e9166,19990722).
x_exceptWhen(x_temporallyIntersects(V1,V2),x_implies(x_and(x_temporallyContinuous(V3),x_temporallySubsumes(V3,V1),x_temporallySubsumes(V3,V2)),x_temporallySubsumes(V3,x_TimeIntervalBetweenFn(V1,V2)))) :- x_cid(a65b12506e9167,V1,V2,V3).
xc_microtheory(a65b12506e9167,x_HPKBCrisisMt).
xc_source_file(a65b12506e9167,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9167,801).
xc_kb_names(a65b12506e9167,["?SHORT1","?SHORT2","?LONG"]).
xc_mapping_rows(a65b12506e9167,['implication-implies']).
xc_direction(a65b12506e9167,':BACKWARD').
xc_monotonicity(a65b12506e9167,':DEFAULT').
xc_creator(a65b12506e9167,'ABelasco').
xc_creation_date(a65b12506e9167,19990713).
x_exceptWhen(x_endsAfterEndingOf(V1,V2),x_implies(x_and(x_temporallyContinuous(V3),x_temporallySubsumes(V3,V1),x_temporallySubsumes(V3,V2)),x_temporallySubsumes(V3,x_TimeIntervalInclusiveFn(V1,V2)))) :- x_cid(a65b12506e9168,V1,V2,V3).
xc_microtheory(a65b12506e9168,x_HPKBCrisisMt).
xc_source_file(a65b12506e9168,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9168,815).
xc_kb_names(a65b12506e9168,["?SHORT1","?SHORT2","?LONG"]).
xc_mapping_rows(a65b12506e9168,['implication-implies']).
xc_direction(a65b12506e9168,':BACKWARD').
xc_monotonicity(a65b12506e9168,':DEFAULT').
xc_creator(a65b12506e9168,'ABelasco').
xc_creation_date(a65b12506e9168,19990713).
x_exceptWhen(x_startsAfterStartingOf(V1,V2),x_implies(x_and(x_temporallyContinuous(V3),x_temporallySubsumes(V3,V1),x_temporallySubsumes(V3,V2)),x_temporallySubsumes(V3,x_TimeIntervalInclusiveFn(V1,V2)))) :- x_cid(a65b12506e9169,V1,V2,V3).
xc_microtheory(a65b12506e9169,x_HPKBCrisisMt).
xc_source_file(a65b12506e9169,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9169,829).
xc_kb_names(a65b12506e9169,["?SHORT1","?SHORT2","?LONG"]).
xc_mapping_rows(a65b12506e9169,['implication-implies']).
xc_direction(a65b12506e9169,':BACKWARD').
xc_monotonicity(a65b12506e9169,':DEFAULT').
xc_creator(a65b12506e9169,'ABelasco').
xc_creation_date(a65b12506e9169,19990713).
x_implies(x_and(x_temporallyContinuous(V1),x_temporallySubsumes(V1,V2),x_temporallySubsumes(V1,V3)),x_temporallySubsumes(V1,x_TimeIntervalBetweenFn(V2,V3))) :- x_cid(a65b12506e916a,V1,V2,V3).
xc_microtheory(a65b12506e916a,x_HPKBCrisisMt).
xc_source_file(a65b12506e916a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e916a,843).
xc_kb_names(a65b12506e916a,["?LONG","?SHORT1","?SHORT2"]).
xc_mapping_rows(a65b12506e916a,['implication-implies']).
xc_direction(a65b12506e916a,':BACKWARD').
xc_monotonicity(a65b12506e916a,':DEFAULT').
xc_creator(a65b12506e916a,'ABelasco').
xc_creation_date(a65b12506e916a,19990713).
x_implies(x_and(x_temporallyContinuous(V1),x_temporallySubsumes(V1,V2),x_temporallySubsumes(V1,V3)),x_temporallySubsumes(V1,x_TimeIntervalInclusiveFn(V2,V3))) :- x_cid(a65b12506e916b,V1,V2,V3).
xc_microtheory(a65b12506e916b,x_HPKBCrisisMt).
xc_source_file(a65b12506e916b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e916b,855).
xc_kb_names(a65b12506e916b,["?LONG","?SHORT1","?SHORT2"]).
xc_mapping_rows(a65b12506e916b,['implication-implies']).
xc_direction(a65b12506e916b,':BACKWARD').
xc_monotonicity(a65b12506e916b,':DEFAULT').
xc_creator(a65b12506e916b,'ABelasco').
xc_creation_date(a65b12506e916b,19990713).
x_implies(x_and(x_isa(V1,x_Country),x_goalCategoryForAgent(V1,V2,x_FuelSupplyGoal)),x_goalCategoryForAgent(V1,V2,x_StrategicNationalInterest)) :- x_cid(a65b12506e916c,V1,V2).
xc_microtheory(a65b12506e916c,x_HPKBCrisisMt).
xc_source_file(a65b12506e916c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e916c,867).
xc_kb_names(a65b12506e916c,["?AGENT","?GOAL"]).
xc_mapping_rows(a65b12506e916c,['implication-implies']).
xc_direction(a65b12506e916c,':BACKWARD').
xc_monotonicity(a65b12506e916c,':DEFAULT').
xc_creator(a65b12506e916c,'Curtis').
xc_creation_date(a65b12506e916c,19990611).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_deliberateActors(V1,V2),x_isa(V2,x_Country),x_maleficiary(V1,V3),x_territoriesControlled(V3,V4),x_isa(V4,x_Country)),'x_increases-Generic'(V1,V2,x_Kappa(t(V5,V6),'x_statusWithAgent-Gradient'(V5,V3,x_StateOfDiplomaticTension,V6)))) :- x_cid(a65b12506e916d,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e916d,x_HPKBCrisisMt).
xc_source_file(a65b12506e916d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e916d,877).
xc_kb_names(a65b12506e916d,["?ATTACK","?COUNTRY-1","?ACTOR","?COUNTRY-2","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e916d,['implication-implies']).
xc_direction(a65b12506e916d,':BACKWARD').
xc_monotonicity(a65b12506e916d,':DEFAULT').
xc_creator(a65b12506e916d,'Watson').
xc_creation_date(a65b12506e916d,19990607).
x_implies(x_and(x_isa(V1,x_HostileSocialAction),x_deliberateActors(V1,V2),x_isa(V2,x_Country),x_maleficiary(V1,V3),x_territoriesControlled(V3,V4),x_isa(V4,x_Country)),'x_increases-Generic'(V1,V2,x_Kappa(t(V5,V6),'x_statusWithAgent-Gradient'(V5,V3,x_StateOfDiplomaticTension,V6)))) :- x_cid(a65b12506e916e,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e916e,x_HPKBCrisisMt).
xc_source_file(a65b12506e916e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e916e,894).
xc_kb_names(a65b12506e916e,["?ATTACK","?COUNTRY-1","?ACTOR","?COUNTRY-2","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e916e,['implication-implies']).
xc_direction(a65b12506e916e,':BACKWARD').
xc_monotonicity(a65b12506e916e,':DEFAULT').
xc_creator(a65b12506e916e,'Watson').
xc_creation_date(a65b12506e916e,19990607).
x_implies(x_and(x_isa(V1,x_ShowingSupportForSomeone),x_deliberateActors(V1,V2),x_isa(V2,x_Country),x_beneficiary(V1,V3),x_territoriesControlled(V3,V4),x_isa(V4,x_Country)),'x_decreases-Generic'(V1,V2,x_Kappa(t(V5,V6),'x_statusWithAgent-Gradient'(V5,V3,x_StateOfDiplomaticTension,V6)))) :- x_cid(a65b12506e916f,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e916f,x_HPKBCrisisMt).
xc_source_file(a65b12506e916f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e916f,911).
xc_kb_names(a65b12506e916f,["?HELP","?COUNTRY-2","?ACTOR","?COUNTRY-1","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e916f,['implication-implies']).
xc_direction(a65b12506e916f,':BACKWARD').
xc_monotonicity(a65b12506e916f,':DEFAULT').
xc_creator(a65b12506e916f,'Watson').
xc_creation_date(a65b12506e916f,19990607).
x_implies(x_and(x_isa(V1,x_ShowingSupportForSomeone),x_deliberateActors(V1,V2),x_beneficiary(V1,V3),x_isa(V3,x_Country),x_territoriesControlled(V2,V4),x_isa(V4,x_Country)),'x_decreases-Generic'(V1,V2,x_Kappa(t(V5,V6),'x_statusWithAgent-Gradient'(V5,V3,x_StateOfDiplomaticTension,V6)))) :- x_cid(a65b12506e9170,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e9170,x_HPKBCrisisMt).
xc_source_file(a65b12506e9170,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9170,928).
xc_kb_names(a65b12506e9170,["?HELP","?ACTOR","?COUNTRY-1","?COUNTRY-2","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e9170,['implication-implies']).
xc_direction(a65b12506e9170,':BACKWARD').
xc_monotonicity(a65b12506e9170,':DEFAULT').
xc_creator(a65b12506e9170,'Watson').
xc_creation_date(a65b12506e9170,19990607).
x_implies(x_and(x_isa(V1,x_GeographicalRegion),x_positiveVestedInterest(V2,V1),x_isa(V2,x_IndependentCountry),x_positiveVestedInterest(V3,V1),x_isa(V3,x_IndependentCountry),x_agentsInterestsCompeteAbout(V2,V3,V1)),x_conflictingInterestsWRT(V1,V2,V3,x_and(x_desires(V2,'x_powerInRegion-Geopolitical'(V3,V1,x_Low)),x_desires(V2,'x_powerInRegion-Geopolitical'(V2,V1,x_High)),x_desires(V3,'x_powerInRegion-Geopolitical'(V2,V1,x_Low)),x_desires(V3,'x_powerInRegion-Geopolitical'(V3,V1,x_High))))) :- x_cid(a65b12506e9171,V1,V2,V3).
xc_microtheory(a65b12506e9171,x_HPKBCrisisMt).
xc_source_file(a65b12506e9171,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9171,945).
xc_kb_names(a65b12506e9171,["?OBJ","?AGT1","?AGT2"]).
xc_mapping_rows(a65b12506e9171,['implication-implies']).
xc_direction(a65b12506e9171,':BACKWARD').
xc_monotonicity(a65b12506e9171,':DEFAULT').
xc_creator(a65b12506e9171,'DaleAlbericci').
xc_creation_date(a65b12506e9171,19990603).
x_implies(x_and(x_isa(V1,x_CrimeDetection),x_eventInvolved(V1,V2),x_isa(V2,x_CriminalAct),x_deliberateActors(V2,V3),x_isa(V3,x_CovertAgent)),x_decreasesCausally(V1,x_secrecyOfOperations(V3,x_VeryHigh),x_likelihood)) :- x_cid(a65b12506e9172,V1,V2,V3).
xc_microtheory(a65b12506e9172,x_HPKBCrisisMt).
xc_source_file(a65b12506e9172,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9172,968).
xc_kb_names(a65b12506e9172,["?DETECTION","?CRIME","?AGENT"]).
xc_mapping_rows(a65b12506e9172,['implication-implies']).
xc_direction(a65b12506e9172,':BACKWARD').
xc_monotonicity(a65b12506e9172,':DEFAULT').
xc_creator(a65b12506e9172,'Watson').
xc_creation_date(a65b12506e9172,19990604).
x_implies(x_and(x_obligationParts(x_ModernInternationalRelationsCOC,V1),x_actionViolatesObligation(V2,V1),x_maleficiary(V2,V3),x_beliefs(V3,x_deliberateActors(V2,V4))),'x_increases-Generic'(V2,V4,x_Kappa(t(V5,V6),'x_statusWithAgent-Gradient'(V5,V3,x_StateOfDiplomaticTension,V6)))) :- x_cid(a65b12506e9173,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e9173,x_HPKBCrisisMt).
xc_source_file(a65b12506e9173,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9173,982).
xc_kb_names(a65b12506e9173,["?OBLIGATION","?VIOLATION","?MAL","?ACTOR","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e9173,['implication-implies']).
xc_direction(a65b12506e9173,':BACKWARD').
xc_monotonicity(a65b12506e9173,':DEFAULT').
xc_creator(a65b12506e9173,'Watson').
xc_creation_date(a65b12506e9173,19990604).
x_implies(x_and(x_obligationParts(x_ModernInternationalRelationsCOC,V1),x_obligatedAgent(V1,V2),x_actionViolatesObligation(V3,V1),x_deliberateActors(V3,V4),x_different(V4,V2)),x_increasesImmediatelyCausally(V3,V4,x_Kappa(t(V5,V6),'x_statusWithAgent-Gradient'(V5,V2,x_StateOfDiplomaticTension,V6)))) :- x_cid(a65b12506e9174,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e9174,x_HPKBCrisisMt).
xc_source_file(a65b12506e9174,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9174,998).
xc_kb_names(a65b12506e9174,["?OBLIGATION","?SIGNEE","?VIOLATION","?VIOLATOR","?AGT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e9174,['implication-implies']).
xc_direction(a65b12506e9174,':BACKWARD').
xc_monotonicity(a65b12506e9174,':DEFAULT').
xc_creator(a65b12506e9174,'Watson').
xc_creation_date(a65b12506e9174,19990604).
x_comment(x_implies(x_and(x_isa(V1,x_Country),x_isa(V2,x_AttackOnTangible),x_isa(V3,x_Country),x_maleficiary(V2,V3),x_deliberateActors(V2,V1)),x_actionViolatesObligation(V2,x_NoFirstStrike)),"Exceptions are stated for cases in which\nthe agent is attacking an opponent in war, and in which the opponent\nhas previously attacked the agent.") :- x_cid(a65b12506e9175,V1,V2,V3).
xc_microtheory(a65b12506e9175,x_HPKBCrisisMt).
xc_source_file(a65b12506e9175,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9175,1014).
xc_kb_names(a65b12506e9175,["?AGGRESSOR","?ATTACK","?VICTIM"]).
xc_mapping_rows(a65b12506e9175,['implication-implies']).
xc_direction(a65b12506e9175,':BACKWARD').
xc_monotonicity(a65b12506e9175,':DEFAULT').
xc_creator(a65b12506e9175,'Nichols').
xc_creation_date(a65b12506e9175,19990603).
x_exceptWhen(x_trueFormula(x_thereExists(V1,x_thereExists(V2,x_and(x_isa(V2,x_ConflictEvent),x_isa(V1,x_AttackOnTangible),x_subEvents(V2,V3),x_subEvents(V2,V1),x_startsAfterStartingOf(V3,V1),x_maleficiary(V1,V4),x_deliberateActors(V1,V5))))),x_implies(x_and(x_isa(V4,x_Country),x_isa(V3,x_AttackOnTangible),x_isa(V5,x_Country),x_maleficiary(V3,V5),x_deliberateActors(V3,V4)),x_actionViolatesObligation(V3,x_NoFirstStrike))) :- x_cid(a65b12506e9176,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9176,x_HPKBCrisisMt).
xc_source_file(a65b12506e9176,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9176,1030).
xc_kb_names(a65b12506e9176,["?PREVIOUS-ATTACK","?CONFLICT","?ATTACK","?AGGRESSOR","?VICTIM"]).
xc_mapping_rows(a65b12506e9176,['exists-thereexists','exists-thereexists','implication-implies']).
xc_direction(a65b12506e9176,':BACKWARD').
xc_monotonicity(a65b12506e9176,':DEFAULT').
xc_creator(a65b12506e9176,'Nichols').
xc_creation_date(a65b12506e9176,19990603).
x_exceptWhen(x_trueFormula(x_thereExists(V1,x_and(x_isa(V1,x_WagingWar),x_subEvents(V1,V2),x_opponentsInConflict(V3,V4,V1)))),x_implies(x_and(x_isa(V3,x_Country),x_isa(V2,x_AttackOnTangible),x_isa(V4,x_Country),x_maleficiary(V2,V4),x_deliberateActors(V2,V3)),x_actionViolatesObligation(V2,x_NoFirstStrike))) :- x_cid(a65b12506e9177,V1,V2,V3,V4).
xc_microtheory(a65b12506e9177,x_HPKBCrisisMt).
xc_source_file(a65b12506e9177,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9177,1057).
xc_kb_names(a65b12506e9177,["?WAR","?ATTACK","?AGGRESSOR","?VICTIM"]).
xc_mapping_rows(a65b12506e9177,['exists-thereexists','implication-implies']).
xc_direction(a65b12506e9177,':BACKWARD').
xc_monotonicity(a65b12506e9177,':DEFAULT').
xc_creator(a65b12506e9177,'Nichols').
xc_creation_date(a65b12506e9177,19990603).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_deliberateActors(V1,V2),x_isa(V2,x_Country),x_maleficiary(V1,V3),x_isa(V3,x_Country)),x_actionViolatesObligation(V1,x_NoFirstStrike)) :- x_cid(a65b12506e9178,V1,V2,V3).
xc_microtheory(a65b12506e9178,x_HPKBCrisisMt).
xc_source_file(a65b12506e9178,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9178,1078).
xc_kb_names(a65b12506e9178,["?ATTACK","?AGGRESSOR","?VICTIM"]).
xc_mapping_rows(a65b12506e9178,['implication-implies']).
xc_direction(a65b12506e9178,':BACKWARD').
xc_monotonicity(a65b12506e9178,':DEFAULT').
xc_creator(a65b12506e9178,'Nichols').
xc_creation_date(a65b12506e9178,19990603).
x_implies(x_and(x_positiveVestedInterest(V1,x_PersianGulfRegion),x_isa(V1,x_IndependentCountry),x_positiveVestedInterest(V2,x_PersianGulfRegion),x_isa(V2,x_IndependentCountry),x_isa(V3,x_IndependentCountry),x_religionOfRule(V3,x_Islam),x_different(V3,V1,V2)),x_coincidingInterestsWRT(x_PersianGulfRegion,V1,V2,x_thereExists(V4,'x_prevents-SitProp'(V4,x_thereExists(V5,x_isa(V5,x_CollectionSubsetFn(x_PoliticalEvent,x_TheSetOf(V6,x_and(x_hasAttributes(V6,x_UnrestFn(x_InfluenceFn(x_OfFn(x_Islam)))),x_performedBy(V6,V3)))))))))) :- x_cid(a65b12506e9179,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e9179,x_HPKBCrisisMt).
xc_source_file(a65b12506e9179,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9179,1091).
xc_kb_names(a65b12506e9179,["?AGT1","?AGT2","?IND","?SIT","?EVT","?OBJ"]).
xc_mapping_rows(a65b12506e9179,['implication-implies','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9179,':BACKWARD').
xc_monotonicity(a65b12506e9179,':DEFAULT').
xc_creator(a65b12506e9179,'DaleAlbericci').
xc_creation_date(a65b12506e9179,19990603).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_positiveVestedInterest(V1,'x_Caucasus-Region'),x_different(V1,V2),x_isa(V2,x_IndependentCountry),x_positiveVestedInterest(V2,'x_Caucasus-Region')),x_coincidingInterestsWRT(x_PersianGulfRegion,V1,V2,x_forAll(V3,x_and(x_geographicalSubRegions(V3,'x_Caucasus-Region'),x_different('x_Caucasus-Region',V3),x_politicalStability(V3,x_MediumToVeryHigh))))) :- x_cid(a65b12506e917a,V1,V2,V3).
xc_microtheory(a65b12506e917a,x_HPKBCrisisMt).
xc_source_file(a65b12506e917a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e917a,1120).
xc_kb_names(a65b12506e917a,["?AGT1","?AGT2","?REGION"]).
xc_mapping_rows(a65b12506e917a,['implication-implies','forall-forall']).
xc_direction(a65b12506e917a,':BACKWARD').
xc_monotonicity(a65b12506e917a,':DEFAULT').
xc_creator(a65b12506e917a,'DaleAlbericci').
xc_creation_date(a65b12506e917a,19990603).
x_implies(x_and(x_positiveVestedInterest(V1,x_PersianGulfRegion),x_isa(V1,x_IndependentCountry),x_positiveVestedInterest(V2,x_PersianGulfRegion),x_isa(V2,x_IndependentCountry),x_isa(V3,x_IndependentCountry),x_religionOfRule(V3,x_Islam),x_different(V3,V1,V2)),x_coincidingInterestsWRT(x_PersianGulfRegion,V1,V2,x_forAll(V4,x_and(x_isa(V4,x_GeopoliticalEntity),x_geographicalSubRegions(V4,x_PersianGulfRegion),x_politicalStability(V4,x_MediumToVeryHigh),x_and(x_hasStatusWithAgent(V4,V1,x_FullDiplomaticRecognition),x_hasStatusWithAgent(V4,V2,x_FullDiplomaticRecognition)))))) :- x_cid(a65b12506e917b,V1,V2,V3,V4).
xc_microtheory(a65b12506e917b,x_HPKBCrisisMt).
xc_source_file(a65b12506e917b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e917b,1139).
xc_kb_names(a65b12506e917b,["?AGT1","?AGT2","?IND","?REGION"]).
xc_mapping_rows(a65b12506e917b,['implication-implies','forall-forall']).
xc_direction(a65b12506e917b,':BACKWARD').
xc_monotonicity(a65b12506e917b,':DEFAULT').
xc_creator(a65b12506e917b,'DaleAlbericci').
xc_creation_date(a65b12506e917b,19990603).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_positiveVestedInterest(V1,'x_Caucasus-Region'),x_isa(V2,x_IndependentCountry),x_positiveVestedInterest(V2,'x_Caucasus-Region'),x_isa(V3,x_IndependentCountry),x_religionOfRule(V3,x_Islam),x_different(V3,V1,V2)),x_coincidingInterestsWRT(x_PersianGulfRegion,V1,V2,x_thereExists(V4,'x_prevents-SitProp'(V4,x_thereExists(V5,x_isa(V5,x_CollectionSubsetFn(x_PoliticalEvent,x_TheSetOf(V6,x_and(x_hasAttributes(V6,'x_Promotion-AdvocacyFn'(x_OfFn(x_InfluenceFn(x_OfFn(x_Islam))),x_InFn('x_Caucasus-Region'))),x_performedBy(V6,V3)))))))))) :- x_cid(a65b12506e917c,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e917c,x_HPKBCrisisMt).
xc_source_file(a65b12506e917c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e917c,1163).
xc_kb_names(a65b12506e917c,["?AGT1","?AGT2","?IND","?SIT","?EVT","?OBJ"]).
xc_mapping_rows(a65b12506e917c,['implication-implies','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e917c,':BACKWARD').
xc_monotonicity(a65b12506e917c,':DEFAULT').
xc_creator(a65b12506e917c,'DaleAlbericci').
xc_creation_date(a65b12506e917c,19990603).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_positiveVestedInterest(V1,x_CaspianRegion),x_isa(V2,x_IndependentCountry),x_positiveVestedInterest(V2,x_CaspianRegion),x_isa(V3,x_IndependentCountry),x_religionOfRule(V3,x_Islam),x_different(V3,V1,V2)),x_coincidingInterestsWRT(x_PersianGulfRegion,V1,V2,x_thereExists(V4,'x_prevents-SitProp'(V4,x_thereExists(V5,x_isa(V5,x_CollectionSubsetFn(x_PoliticalEvent,x_TheSetOf(V6,x_and(x_hasAttributes(V6,'x_Promotion-AdvocacyFn'(x_OfFn(x_InfluenceFn(x_OfFn(x_Islam))),x_InFn(x_CaspianRegion))),x_performedBy(V6,V3)))))))))) :- x_cid(a65b12506e917d,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e917d,x_HPKBCrisisMt).
xc_source_file(a65b12506e917d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e917d,1194).
xc_kb_names(a65b12506e917d,["?AGT1","?AGT2","?IND","?SIT","?EVT","?OBJ"]).
xc_mapping_rows(a65b12506e917d,['implication-implies','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e917d,':BACKWARD').
xc_monotonicity(a65b12506e917d,':DEFAULT').
xc_creator(a65b12506e917d,'DaleAlbericci').
xc_creation_date(a65b12506e917d,19990603).
x_implies(x_and(x_competingAgents(V1,V2),x_competingAgents(V1,V3),x_different(V2,V3),x_purposeInEvent(V2,V1,V4),x_purposeInEvent(V3,V1,V5)),x_conflictingInterestsWRT(V1,V2,V3,x_and(V4,V5))) :- x_cid(a65b12506e917e,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e917e,x_HPKBCrisisMt).
xc_source_file(a65b12506e917e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e917e,1225).
xc_kb_names(a65b12506e917e,["?COMPETITION","?COMPETITOR1","?COMPETITOR2","?PROP1","?PROP2"]).
xc_mapping_rows(a65b12506e917e,['implication-implies']).
xc_direction(a65b12506e917e,':BACKWARD').
xc_monotonicity(a65b12506e917e,':DEFAULT').
xc_creator(a65b12506e917e,'DaleAlbericci').
xc_creation_date(a65b12506e917e,19990603).
x_implies(x_and(x_goalCategoryForAgent(V1,'x_powerInRegion-Geopolitical'(V2,V3,x_Low),V4),x_goalCategoryForAgent(V5,'x_powerInRegion-Geopolitical'(V2,V3,x_Low),V4)),x_coincidingInterestsWRT(V4,V1,V5,'x_powerInRegion-Geopolitical'(V2,V3,x_Low))) :- x_cid(a65b12506e917f,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e917f,x_HPKBCrisisMt).
xc_source_file(a65b12506e917f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e917f,1239).
xc_kb_names(a65b12506e917f,["?COUNTRY","?OTHER-COUNTRY","?REGION","?GOALATTR","?COUNTRY1"]).
xc_mapping_rows(a65b12506e917f,['implication-implies']).
xc_direction(a65b12506e917f,':BACKWARD').
xc_monotonicity(a65b12506e917f,':DEFAULT').
xc_creator(a65b12506e917f,'DaleAlbericci').
xc_creation_date(a65b12506e917f,19990603).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_positiveVestedInterest(V1,V2),x_positiveVestedInterest(V3,V2),x_isa(V3,x_IndependentCountry),x_isa(V4,x_IndependentCountry),x_religionOfRule(V4,x_Islam),x_different(V4,V1,V3)),x_coincidingInterestsWRT(V2,V1,V3,x_thereExists(V5,'x_prevents-SitProp'(V5,x_thereExists(V6,x_isa(V6,x_CollectionSubsetFn(x_PoliticalEvent,x_TheSetOf(V7,x_and(x_hasAttributes(V7,x_UnrestFn(x_InfluenceFn(x_OfFn(x_Islam)))),x_performedBy(V7,V4)))))))))) :- x_cid(a65b12506e9180,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9180,x_HPKBCrisisMt).
xc_source_file(a65b12506e9180,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9180,1252).
xc_kb_names(a65b12506e9180,["?AGT1","?REGION","?AGT2","?IND","?SIT","?EVT","?OBJ"]).
xc_mapping_rows(a65b12506e9180,['implication-implies','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9180,':BACKWARD').
xc_monotonicity(a65b12506e9180,':DEFAULT').
xc_creator(a65b12506e9180,'DaleAlbericci').
xc_creation_date(a65b12506e9180,19990603).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_positiveVestedInterest(V1,V2),x_positiveVestedInterest(V3,V2),x_isa(V3,x_IndependentCountry),x_isa(V4,x_IndependentCountry)),x_coincidingInterestsWRT(V2,V1,V3,x_and('x_powerInRegion-Generic'(V1,V2,x_High),'x_powerInRegion-Generic'(V3,V2,x_High)))) :- x_cid(a65b12506e9181,V1,V2,V3,V4).
xc_microtheory(a65b12506e9181,x_HPKBCrisisMt).
xc_source_file(a65b12506e9181,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9181,1281).
xc_kb_names(a65b12506e9181,["?AGT1","?REGION","?AGT2","?IND"]).
xc_mapping_rows(a65b12506e9181,['implication-implies']).
xc_direction(a65b12506e9181,':BACKWARD').
xc_monotonicity(a65b12506e9181,':DEFAULT').
xc_creator(a65b12506e9181,'DaleAlbericci').
xc_creation_date(a65b12506e9181,19990603).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_positiveVestedInterest(V1,V2),x_positiveVestedInterest(V3,V2),x_isa(V3,x_IndependentCountry),x_isa(V4,x_IndependentCountry)),x_coincidingInterestsWRT(V2,V1,V3,x_and(x_desires(V1,'x_powerInRegion-Geopolitical'(V3,V5,x_Low)),x_desires(V1,'x_powerInRegion-Geopolitical'(V1,V5,x_High)),x_desires(V3,'x_powerInRegion-Geopolitical'(V1,V5,x_Low)),x_desires(V3,'x_powerInRegion-Geopolitical'(V3,V5,x_High))))) :- x_cid(a65b12506e9182,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9182,x_HPKBCrisisMt).
xc_source_file(a65b12506e9182,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9182,1297).
xc_kb_names(a65b12506e9182,["?AGT1","?REGION","?AGT2","?IND","?OBJ"]).
xc_mapping_rows(a65b12506e9182,['implication-implies']).
xc_direction(a65b12506e9182,':BACKWARD').
xc_monotonicity(a65b12506e9182,':DEFAULT').
xc_creator(a65b12506e9182,'DaleAlbericci').
xc_creation_date(a65b12506e9182,19990603).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_isa(V2,x_IndependentCountry),x_isa(V3,x_IndependentCountry),x_religionOfRule(V3,x_Islam),x_different(V3,V1,V2)),x_coincidingInterestsWRT(V4,V1,V2,x_thereExists(V5,'x_prevents-SitProp'(V5,x_thereExists(V6,x_isa(V6,x_CollectionSubsetFn(x_PoliticalEvent,x_TheSetOf(V7,x_and(x_hasAttributes(V7,x_UnrestFn(x_InfluenceFn(x_OfFn(x_Islam)))),x_performedBy(V7,V3)))))))))) :- x_cid(a65b12506e9183,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9183,x_HPKBCrisisMt).
xc_source_file(a65b12506e9183,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9183,1319).
xc_kb_names(a65b12506e9183,["?AGT1","?AGT2","?IND","?REGION","?SIT","?EVT","?OBJ"]).
xc_mapping_rows(a65b12506e9183,['implication-implies','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9183,':BACKWARD').
xc_monotonicity(a65b12506e9183,':DEFAULT').
xc_creator(a65b12506e9183,'DaleAlbericci').
xc_creation_date(a65b12506e9183,19990603).
x_implies(x_goalCategoryForAgent(V1,'x_powerInRegion-Geopolitical'(V2,V3,x_Low),V4),x_conflictingInterestsWRT(V4,V1,V5,x_goalCategoryForAgent(V1,'x_powerInRegion-Geopolitical'(V2,V3,x_Low),V4))) :- x_cid(a65b12506e9184,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9184,x_HPKBCrisisMt).
xc_source_file(a65b12506e9184,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9184,1346).
xc_kb_names(a65b12506e9184,["?COUNTRY","?OTHER-COUNTRY","?REGION","?GOAL-ATTR","?OTHER_COUNTRY"]).
xc_mapping_rows(a65b12506e9184,['implication-implies']).
xc_direction(a65b12506e9184,':BACKWARD').
xc_monotonicity(a65b12506e9184,':DEFAULT').
xc_creator(a65b12506e9184,'DaleAlbericci').
xc_creation_date(a65b12506e9184,19990603).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_religionOfRule(V1,x_Islam),x_isa(V2,x_IndependentCountry),x_isa(V3,x_IndependentCountry),x_different(V1,V2,V3)),x_coincidingInterestsWRT(V1,V2,V3,x_thereExists(V4,'x_prevents-SitProp'(V4,x_thereExists(V5,x_isa(V5,x_CollectionSubsetFn(x_PoliticalEvent,x_TheSetOf(V6,x_and(x_hasAttributes(V6,x_UnrestFn(x_InfluenceFn(x_OfFn(x_Islam)))),x_performedBy(V6,V1)))))))))) :- x_cid(a65b12506e9185,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e9185,x_HPKBCrisisMt).
xc_source_file(a65b12506e9185,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9185,1357).
xc_kb_names(a65b12506e9185,["?IND","?AGT1","?AGT2","?SIT","?EVT","?OBJ"]).
xc_mapping_rows(a65b12506e9185,['implication-implies','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9185,':BACKWARD').
xc_monotonicity(a65b12506e9185,':DEFAULT').
xc_creator(a65b12506e9185,'DaleAlbericci').
xc_creation_date(a65b12506e9185,19990603).
x_comment(x_EconomicSanctionsImposed,"#$EconomicSanctionsImposed is a relationship between two governments of countries such that one economically punishes the other (see #$ImposingSanctions).  (#$hasStatusWithAgent COUNTRY1 COUNTRY2 #$EconomicSanctionsImposed) means that COUNTRY2 is economically punishing COUNTRY1.") :- x_cid(a65b12506e9186).
xc_microtheory(a65b12506e9186,x_HPKBCrisisMt).
xc_source_file(a65b12506e9186,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9186,1384).
xc_kb_names(a65b12506e9186,[]).
xc_mapping_rows(a65b12506e9186,[]).
xc_direction(a65b12506e9186,':FORWARD').
xc_monotonicity(a65b12506e9186,':DEFAULT').
xc_creator(a65b12506e9186,'DaleAlbericci').
xc_creation_date(a65b12506e9186,19990603).
x_comment(x_SupportOfPursuitOfWMD,"(#$hasStatusWithAgent COUNTRY1 COUNTRY2 #$SupportOfPursuitOfWMD) means that COUNTRY2 supports COUNTRY1 in its pursuit of obtaining elements of and capabilities associated with #$WeaponOfMassDestruction.") :- x_cid(a65b12506e9187).
xc_microtheory(a65b12506e9187,x_HPKBCrisisMt).
xc_source_file(a65b12506e9187,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9187,1390).
xc_kb_names(a65b12506e9187,[]).
xc_mapping_rows(a65b12506e9187,[]).
xc_direction(a65b12506e9187,':FORWARD').
xc_monotonicity(a65b12506e9187,':DEFAULT').
xc_creator(a65b12506e9187,'DaleAlbericci').
xc_creation_date(a65b12506e9187,19990603).
x_comment(x_SupportOfPursuitOfMissileCapability,"(#$hasStatusWithAgent COUNTRY1 COUNTRY2 #$SupportOfPursuitOfMissileCapability) means that COUNTRY2 supports COUNTRY1 in its pursuit of obtaining missiles and missile launch capability.") :- x_cid(a65b12506e9188).
xc_microtheory(a65b12506e9188,x_HPKBCrisisMt).
xc_source_file(a65b12506e9188,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9188,1396).
xc_kb_names(a65b12506e9188,[]).
xc_mapping_rows(a65b12506e9188,[]).
xc_direction(a65b12506e9188,':FORWARD').
xc_monotonicity(a65b12506e9188,':DEFAULT').
xc_creator(a65b12506e9188,'DaleAlbericci').
xc_creation_date(a65b12506e9188,19990603).
x_comment(x_OppositionToSponsorshipOfTerrorism,"(#$hasStatusWithAgent COUNTRY1 COUNTRY2 #$OppositionToSponsorshipOfTerrorism) means that COUNTRY2 opposes COUNTRY1 sponsorship of elements of #$TerroristAgents and #$TerroristActs.") :- x_cid(a65b12506e9189).
xc_microtheory(a65b12506e9189,x_HPKBCrisisMt).
xc_source_file(a65b12506e9189,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9189,1402).
xc_kb_names(a65b12506e9189,[]).
xc_mapping_rows(a65b12506e9189,[]).
xc_direction(a65b12506e9189,':FORWARD').
xc_monotonicity(a65b12506e9189,':DEFAULT').
xc_creator(a65b12506e9189,'DaleAlbericci').
xc_creation_date(a65b12506e9189,19990603).
x_comment(x_OppositionToAggressiveBehaviorToNeighbors,"(#$hasStatusWithAgent COUNTRY1 COUNTRY2 #$OppositionToAggressiveBehaviorToNeighbors) means that COUNTRY2 opposes the aggressive behavior that COUNTRY1 exhibits towards its neighboring countries.") :- x_cid(a65b12506e918a).
xc_microtheory(a65b12506e918a,x_HPKBCrisisMt).
xc_source_file(a65b12506e918a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e918a,1408).
xc_kb_names(a65b12506e918a,[]).
xc_mapping_rows(a65b12506e918a,[]).
xc_direction(a65b12506e918a,':FORWARD').
xc_monotonicity(a65b12506e918a,':DEFAULT').
xc_creator(a65b12506e918a,'DaleAlbericci').
xc_creation_date(a65b12506e918a,19990603).
x_comment(x_OppositionToPursuitOfWMD,"(#$hasStatusWithAgent COUNTRY1 COUNTRY2 #$OppositionToPursuitOfWMD) means that COUNTRY2 opposes COUNTRY1 in its pursuit of obtaining elements of and capabilities associated with #$WeaponOfMassDestruction.  See also #$SupportOfPursuitOfWMD.") :- x_cid(a65b12506e918b).
xc_microtheory(a65b12506e918b,x_HPKBCrisisMt).
xc_source_file(a65b12506e918b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e918b,1414).
xc_kb_names(a65b12506e918b,[]).
xc_mapping_rows(a65b12506e918b,[]).
xc_direction(a65b12506e918b,':FORWARD').
xc_monotonicity(a65b12506e918b,':DEFAULT').
xc_creator(a65b12506e918b,'DaleAlbericci').
xc_creation_date(a65b12506e918b,19990603).
x_implies(x_and(x_genls(V1,x_InterAgentRelationTypeAttribute),x_isa(V2,V1),x_hasStatusWithAgent(V3,V4,V2),x_hasStatusWithAgent(V3,V5,V2)),x_coincidingInterestsWRT(V3,V4,V5,x_and(x_hasStatusWithAgent(V3,V4,V2),x_hasStatusWithAgent(V3,V5,V2)))) :- x_cid(a65b12506e918c,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e918c,x_HPKBCrisisMt).
xc_source_file(a65b12506e918c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e918c,1420).
xc_kb_names(a65b12506e918c,["?ATT","?ATT1","?AGENT","?AGENT1","?AGENT2"]).
xc_mapping_rows(a65b12506e918c,['implication-implies']).
xc_direction(a65b12506e918c,':BACKWARD').
xc_monotonicity(a65b12506e918c,':DEFAULT').
xc_creator(a65b12506e918c,'DaleAlbericci').
xc_creation_date(a65b12506e918c,19990603).
x_implies(x_and(x_genls(V1,x_InterAgentRelationTypeAttribute),x_isa(V2,V1),x_negationAttribute(V2,V3),x_isa(V3,V1),x_hasStatusWithAgent(V4,V5,V2),x_hasStatusWithAgent(V4,V6,V3)),x_conflictingInterestsWRT(V4,V5,V6,x_and(x_hasStatusWithAgent(V4,V5,V2),x_hasStatusWithAgent(V4,V6,V3)))) :- x_cid(a65b12506e918d,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e918d,x_HPKBCrisisMt).
xc_source_file(a65b12506e918d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e918d,1435).
xc_kb_names(a65b12506e918d,["?ATT","?ATT1","?ATT2","?AGENT","?AGENT1","?AGENT2"]).
xc_mapping_rows(a65b12506e918d,['implication-implies']).
xc_direction(a65b12506e918d,':BACKWARD').
xc_monotonicity(a65b12506e918d,':DEFAULT').
xc_creator(a65b12506e918d,'DaleAlbericci').
xc_creation_date(a65b12506e918d,19990603).
x_negationAttribute(x_GenericPowerAccord,x_GenericPowerConflict) :- x_cid(a65b12506e918e).
xc_microtheory(a65b12506e918e,x_HPKBCrisisMt).
xc_source_file(a65b12506e918e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e918e,1452).
xc_kb_names(a65b12506e918e,[]).
xc_mapping_rows(a65b12506e918e,[]).
xc_direction(a65b12506e918e,':FORWARD').
xc_monotonicity(a65b12506e918e,':DEFAULT').
xc_creator(a65b12506e918e,'DaleAlbericci').
xc_creation_date(a65b12506e918e,19990603).
x_implies(x_and('x_='(x_MediumToVeryHigh,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Generic'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_GenericPowerAccord)) :- x_cid(a65b12506e918f,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e918f,x_HPKBCrisisMt).
xc_source_file(a65b12506e918f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e918f,1458).
xc_kb_names(a65b12506e918f,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e918f,['implication-implies']).
xc_direction(a65b12506e918f,':BACKWARD').
xc_monotonicity(a65b12506e918f,':DEFAULT').
xc_creator(a65b12506e918f,'DaleAlbericci').
xc_creation_date(a65b12506e918f,19990603).
x_implies(x_and('x_='(x_HighToVeryHigh,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Generic'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_GenericPowerAccord)) :- x_cid(a65b12506e9190,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9190,x_HPKBCrisisMt).
xc_source_file(a65b12506e9190,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9190,1470).
xc_kb_names(a65b12506e9190,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e9190,['implication-implies']).
xc_direction(a65b12506e9190,':BACKWARD').
xc_monotonicity(a65b12506e9190,':DEFAULT').
xc_creator(a65b12506e9190,'DaleAlbericci').
xc_creation_date(a65b12506e9190,19990603).
x_implies(x_and('x_='(x_High,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Generic'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_GenericPowerAccord)) :- x_cid(a65b12506e9191,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9191,x_HPKBCrisisMt).
xc_source_file(a65b12506e9191,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9191,1482).
xc_kb_names(a65b12506e9191,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e9191,['implication-implies']).
xc_direction(a65b12506e9191,':BACKWARD').
xc_monotonicity(a65b12506e9191,':DEFAULT').
xc_creator(a65b12506e9191,'DaleAlbericci').
xc_creation_date(a65b12506e9191,19990603).
x_implies(x_and('x_='(x_LowToVeryLow,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Generic'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_GenericPowerConflict)) :- x_cid(a65b12506e9192,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9192,x_HPKBCrisisMt).
xc_source_file(a65b12506e9192,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9192,1494).
xc_kb_names(a65b12506e9192,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e9192,['implication-implies']).
xc_direction(a65b12506e9192,':BACKWARD').
xc_monotonicity(a65b12506e9192,':DEFAULT').
xc_creator(a65b12506e9192,'DaleAlbericci').
xc_creation_date(a65b12506e9192,19990603).
x_implies(x_and('x_='(x_Low,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Generic'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_GenericPowerConflict)) :- x_cid(a65b12506e9193,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9193,x_HPKBCrisisMt).
xc_source_file(a65b12506e9193,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9193,1506).
xc_kb_names(a65b12506e9193,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e9193,['implication-implies']).
xc_direction(a65b12506e9193,':BACKWARD').
xc_monotonicity(a65b12506e9193,':DEFAULT').
xc_creator(a65b12506e9193,'DaleAlbericci').
xc_creation_date(a65b12506e9193,19990603).
x_comment(x_GenericPowerAccord," GenericPowerAccord is a reciprocal relationship between two governments of countries, such that a power accord exists between them. The power accord is Generic in nature and consists of an agreement, formal or informal, that power in a geographical region may be shared.") :- x_cid(a65b12506e9194).
xc_microtheory(a65b12506e9194,x_HPKBCrisisMt).
xc_source_file(a65b12506e9194,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9194,1518).
xc_kb_names(a65b12506e9194,[]).
xc_mapping_rows(a65b12506e9194,[]).
xc_direction(a65b12506e9194,':FORWARD').
xc_monotonicity(a65b12506e9194,':DEFAULT').
xc_creator(a65b12506e9194,'DaleAlbericci').
xc_creation_date(a65b12506e9194,19990603).
x_isa(x_GenericPowerAccord,x_TeknowledgeConstant) :- x_cid(a65b12506e9195).
xc_microtheory(a65b12506e9195,x_HPKBCrisisMt).
xc_source_file(a65b12506e9195,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9195,1524).
xc_kb_names(a65b12506e9195,[]).
xc_mapping_rows(a65b12506e9195,[]).
xc_direction(a65b12506e9195,':FORWARD').
xc_monotonicity(a65b12506e9195,':MONOTONIC').
xc_creator(a65b12506e9195,'DaleAlbericci').
xc_creation_date(a65b12506e9195,19990603).
x_isa(x_GenericPowerAccord,x_PowerRelationStatusAttribute) :- x_cid(a65b12506e9196).
xc_microtheory(a65b12506e9196,x_HPKBCrisisMt).
xc_source_file(a65b12506e9196,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9196,1530).
xc_kb_names(a65b12506e9196,[]).
xc_mapping_rows(a65b12506e9196,[]).
xc_direction(a65b12506e9196,':FORWARD').
xc_monotonicity(a65b12506e9196,':MONOTONIC').
xc_creator(a65b12506e9196,'DaleAlbericci').
xc_creation_date(a65b12506e9196,19990603).
x_comment(x_GenericPowerConflict," GenericPowerConflict is a reciprocal relationship between two governments of countries, such that a power conflict exists between them. The power conflict is Generic in nature and consists of competing for power in a geographical region. ") :- x_cid(a65b12506e9197).
xc_microtheory(a65b12506e9197,x_HPKBCrisisMt).
xc_source_file(a65b12506e9197,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9197,1536).
xc_kb_names(a65b12506e9197,[]).
xc_mapping_rows(a65b12506e9197,[]).
xc_direction(a65b12506e9197,':FORWARD').
xc_monotonicity(a65b12506e9197,':DEFAULT').
xc_creator(a65b12506e9197,'DaleAlbericci').
xc_creation_date(a65b12506e9197,19990603).
x_isa(x_GenericPowerConflict,x_TeknowledgeConstant) :- x_cid(a65b12506e9198).
xc_microtheory(a65b12506e9198,x_HPKBCrisisMt).
xc_source_file(a65b12506e9198,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9198,1542).
xc_kb_names(a65b12506e9198,[]).
xc_mapping_rows(a65b12506e9198,[]).
xc_direction(a65b12506e9198,':FORWARD').
xc_monotonicity(a65b12506e9198,':MONOTONIC').
xc_creator(a65b12506e9198,'DaleAlbericci').
xc_creation_date(a65b12506e9198,19990603).
x_isa(x_GenericPowerConflict,x_PowerRelationStatusAttribute) :- x_cid(a65b12506e9199).
xc_microtheory(a65b12506e9199,x_HPKBCrisisMt).
xc_source_file(a65b12506e9199,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9199,1548).
xc_kb_names(a65b12506e9199,[]).
xc_mapping_rows(a65b12506e9199,[]).
xc_direction(a65b12506e9199,':FORWARD').
xc_monotonicity(a65b12506e9199,':MONOTONIC').
xc_creator(a65b12506e9199,'DaleAlbericci').
xc_creation_date(a65b12506e9199,19990603).
x_negationAttribute(x_MilitaryPowerAccord,x_MilitaryPowerConflict) :- x_cid(a65b12506e919a).
xc_microtheory(a65b12506e919a,x_HPKBCrisisMt).
xc_source_file(a65b12506e919a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e919a,1554).
xc_kb_names(a65b12506e919a,[]).
xc_mapping_rows(a65b12506e919a,[]).
xc_direction(a65b12506e919a,':FORWARD').
xc_monotonicity(a65b12506e919a,':DEFAULT').
xc_creator(a65b12506e919a,'DaleAlbericci').
xc_creation_date(a65b12506e919a,19990603).
x_implies(x_and('x_='(x_MediumToVeryHigh,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Military'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_MilitaryPowerAccord)) :- x_cid(a65b12506e919b,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e919b,x_HPKBCrisisMt).
xc_source_file(a65b12506e919b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e919b,1560).
xc_kb_names(a65b12506e919b,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e919b,['implication-implies']).
xc_direction(a65b12506e919b,':BACKWARD').
xc_monotonicity(a65b12506e919b,':DEFAULT').
xc_creator(a65b12506e919b,'DaleAlbericci').
xc_creation_date(a65b12506e919b,19990603).
x_implies(x_and('x_='(x_HighToVeryHigh,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Military'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_MilitaryPowerAccord)) :- x_cid(a65b12506e919c,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e919c,x_HPKBCrisisMt).
xc_source_file(a65b12506e919c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e919c,1572).
xc_kb_names(a65b12506e919c,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e919c,['implication-implies']).
xc_direction(a65b12506e919c,':BACKWARD').
xc_monotonicity(a65b12506e919c,':DEFAULT').
xc_creator(a65b12506e919c,'DaleAlbericci').
xc_creation_date(a65b12506e919c,19990603).
x_implies(x_and('x_='(x_High,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Military'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_MilitaryPowerAccord)) :- x_cid(a65b12506e919d,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e919d,x_HPKBCrisisMt).
xc_source_file(a65b12506e919d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e919d,1584).
xc_kb_names(a65b12506e919d,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e919d,['implication-implies']).
xc_direction(a65b12506e919d,':BACKWARD').
xc_monotonicity(a65b12506e919d,':DEFAULT').
xc_creator(a65b12506e919d,'DaleAlbericci').
xc_creation_date(a65b12506e919d,19990603).
x_implies(x_and('x_='(x_LowToVeryLow,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Military'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_MilitaryPowerConflict)) :- x_cid(a65b12506e919e,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e919e,x_HPKBCrisisMt).
xc_source_file(a65b12506e919e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e919e,1596).
xc_kb_names(a65b12506e919e,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e919e,['implication-implies']).
xc_direction(a65b12506e919e,':BACKWARD').
xc_monotonicity(a65b12506e919e,':DEFAULT').
xc_creator(a65b12506e919e,'DaleAlbericci').
xc_creation_date(a65b12506e919e,19990603).
x_implies(x_and('x_='(x_Low,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Military'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_MilitaryPowerConflict)) :- x_cid(a65b12506e919f,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e919f,x_HPKBCrisisMt).
xc_source_file(a65b12506e919f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e919f,1608).
xc_kb_names(a65b12506e919f,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e919f,['implication-implies']).
xc_direction(a65b12506e919f,':BACKWARD').
xc_monotonicity(a65b12506e919f,':DEFAULT').
xc_creator(a65b12506e919f,'DaleAlbericci').
xc_creation_date(a65b12506e919f,19990603).
x_comment(x_MilitaryPowerAccord," MilitaryPowerAccord is a reciprocal relationship between two governments of countries, such that a power accord exists between them. The power accord is military in nature and consists of an agreement, formal or informal, that power in a geographical region may be shared through political or diplomatic means. Sharing power through geopolitical or economic means is not designated by this attribute.") :- x_cid(a65b12506e91a0).
xc_microtheory(a65b12506e91a0,x_HPKBCrisisMt).
xc_source_file(a65b12506e91a0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91a0,1620).
xc_kb_names(a65b12506e91a0,[]).
xc_mapping_rows(a65b12506e91a0,[]).
xc_direction(a65b12506e91a0,':FORWARD').
xc_monotonicity(a65b12506e91a0,':DEFAULT').
xc_creator(a65b12506e91a0,'DaleAlbericci').
xc_creation_date(a65b12506e91a0,19990603).
x_isa(x_MilitaryPowerAccord,x_TeknowledgeConstant) :- x_cid(a65b12506e91a1).
xc_microtheory(a65b12506e91a1,x_HPKBCrisisMt).
xc_source_file(a65b12506e91a1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91a1,1626).
xc_kb_names(a65b12506e91a1,[]).
xc_mapping_rows(a65b12506e91a1,[]).
xc_direction(a65b12506e91a1,':FORWARD').
xc_monotonicity(a65b12506e91a1,':MONOTONIC').
xc_creator(a65b12506e91a1,'DaleAlbericci').
xc_creation_date(a65b12506e91a1,19990603).
x_isa(x_MilitaryPowerAccord,x_PowerRelationStatusAttribute) :- x_cid(a65b12506e91a2).
xc_microtheory(a65b12506e91a2,x_HPKBCrisisMt).
xc_source_file(a65b12506e91a2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91a2,1632).
xc_kb_names(a65b12506e91a2,[]).
xc_mapping_rows(a65b12506e91a2,[]).
xc_direction(a65b12506e91a2,':FORWARD').
xc_monotonicity(a65b12506e91a2,':MONOTONIC').
xc_creator(a65b12506e91a2,'DaleAlbericci').
xc_creation_date(a65b12506e91a2,19990603).
x_comment(x_MilitaryPowerConflict," MilitaryPowerConflict is a reciprocal relationship between two governments of countries, such that a power conflict exists between them. The power conflict is military in nature and consists of competing for power in a geographical region primarily through political or diplomatic means. Competing for power through geopolitical or economic means is not designated by this attribute.") :- x_cid(a65b12506e91a3).
xc_microtheory(a65b12506e91a3,x_HPKBCrisisMt).
xc_source_file(a65b12506e91a3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91a3,1638).
xc_kb_names(a65b12506e91a3,[]).
xc_mapping_rows(a65b12506e91a3,[]).
xc_direction(a65b12506e91a3,':FORWARD').
xc_monotonicity(a65b12506e91a3,':DEFAULT').
xc_creator(a65b12506e91a3,'DaleAlbericci').
xc_creation_date(a65b12506e91a3,19990603).
x_isa(x_MilitaryPowerConflict,x_TeknowledgeConstant) :- x_cid(a65b12506e91a4).
xc_microtheory(a65b12506e91a4,x_HPKBCrisisMt).
xc_source_file(a65b12506e91a4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91a4,1644).
xc_kb_names(a65b12506e91a4,[]).
xc_mapping_rows(a65b12506e91a4,[]).
xc_direction(a65b12506e91a4,':FORWARD').
xc_monotonicity(a65b12506e91a4,':MONOTONIC').
xc_creator(a65b12506e91a4,'DaleAlbericci').
xc_creation_date(a65b12506e91a4,19990603).
x_isa(x_MilitaryPowerConflict,x_PowerRelationStatusAttribute) :- x_cid(a65b12506e91a5).
xc_microtheory(a65b12506e91a5,x_HPKBCrisisMt).
xc_source_file(a65b12506e91a5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91a5,1650).
xc_kb_names(a65b12506e91a5,[]).
xc_mapping_rows(a65b12506e91a5,[]).
xc_direction(a65b12506e91a5,':FORWARD').
xc_monotonicity(a65b12506e91a5,':MONOTONIC').
xc_creator(a65b12506e91a5,'DaleAlbericci').
xc_creation_date(a65b12506e91a5,19990603).
x_negationAttribute(x_EconomicPowerConflict,x_EconomicPowerAccord) :- x_cid(a65b12506e91a6).
xc_microtheory(a65b12506e91a6,x_HPKBCrisisMt).
xc_source_file(a65b12506e91a6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91a6,1656).
xc_kb_names(a65b12506e91a6,[]).
xc_mapping_rows(a65b12506e91a6,[]).
xc_direction(a65b12506e91a6,':FORWARD').
xc_monotonicity(a65b12506e91a6,':DEFAULT').
xc_creator(a65b12506e91a6,'DaleAlbericci').
xc_creation_date(a65b12506e91a6,19990603).
x_implies(x_and('x_='(x_MediumToVeryHigh,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Economic'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_EconomicPowerAccord)) :- x_cid(a65b12506e91a7,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e91a7,x_HPKBCrisisMt).
xc_source_file(a65b12506e91a7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91a7,1662).
xc_kb_names(a65b12506e91a7,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e91a7,['implication-implies']).
xc_direction(a65b12506e91a7,':BACKWARD').
xc_monotonicity(a65b12506e91a7,':DEFAULT').
xc_creator(a65b12506e91a7,'DaleAlbericci').
xc_creation_date(a65b12506e91a7,19990603).
x_implies(x_and('x_='(x_HighToVeryHigh,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Economic'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_EconomicPowerAccord)) :- x_cid(a65b12506e91a8,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e91a8,x_HPKBCrisisMt).
xc_source_file(a65b12506e91a8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91a8,1674).
xc_kb_names(a65b12506e91a8,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e91a8,['implication-implies']).
xc_direction(a65b12506e91a8,':BACKWARD').
xc_monotonicity(a65b12506e91a8,':DEFAULT').
xc_creator(a65b12506e91a8,'DaleAlbericci').
xc_creation_date(a65b12506e91a8,19990603).
x_implies(x_and('x_='(x_High,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Economic'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_EconomicPowerAccord)) :- x_cid(a65b12506e91a9,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e91a9,x_HPKBCrisisMt).
xc_source_file(a65b12506e91a9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91a9,1686).
xc_kb_names(a65b12506e91a9,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e91a9,['implication-implies']).
xc_direction(a65b12506e91a9,':BACKWARD').
xc_monotonicity(a65b12506e91a9,':DEFAULT').
xc_creator(a65b12506e91a9,'DaleAlbericci').
xc_creation_date(a65b12506e91a9,19990603).
x_implies(x_and('x_='(x_LowToVeryLow,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Economic'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_EconomicPowerConflict)) :- x_cid(a65b12506e91aa,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e91aa,x_HPKBCrisisMt).
xc_source_file(a65b12506e91aa,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91aa,1698).
xc_kb_names(a65b12506e91aa,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e91aa,['implication-implies']).
xc_direction(a65b12506e91aa,':BACKWARD').
xc_monotonicity(a65b12506e91aa,':DEFAULT').
xc_creator(a65b12506e91aa,'DaleAlbericci').
xc_creation_date(a65b12506e91aa,19990603).
x_implies(x_and('x_='(x_Low,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Economic'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_EconomicPowerConflict)) :- x_cid(a65b12506e91ab,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e91ab,x_HPKBCrisisMt).
xc_source_file(a65b12506e91ab,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91ab,1710).
xc_kb_names(a65b12506e91ab,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e91ab,['implication-implies']).
xc_direction(a65b12506e91ab,':BACKWARD').
xc_monotonicity(a65b12506e91ab,':DEFAULT').
xc_creator(a65b12506e91ab,'DaleAlbericci').
xc_creation_date(a65b12506e91ab,19990603).
x_comment(x_EconomicPowerAccord," EconomicPowerAccord is a reciprocal relationship between two governments of countries, such that a power accord exists between them. The power accord is Economic in nature and consists of an agreement, formal or informal, that power in a geographical region may be shared through political or diplomatic means. Sharing power through geopolitical or military means is not designated by this attribute.") :- x_cid(a65b12506e91ac).
xc_microtheory(a65b12506e91ac,x_HPKBCrisisMt).
xc_source_file(a65b12506e91ac,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91ac,1722).
xc_kb_names(a65b12506e91ac,[]).
xc_mapping_rows(a65b12506e91ac,[]).
xc_direction(a65b12506e91ac,':FORWARD').
xc_monotonicity(a65b12506e91ac,':DEFAULT').
xc_creator(a65b12506e91ac,'DaleAlbericci').
xc_creation_date(a65b12506e91ac,19990603).
x_isa(x_EconomicPowerAccord,x_TeknowledgeConstant) :- x_cid(a65b12506e91ad).
xc_microtheory(a65b12506e91ad,x_HPKBCrisisMt).
xc_source_file(a65b12506e91ad,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91ad,1728).
xc_kb_names(a65b12506e91ad,[]).
xc_mapping_rows(a65b12506e91ad,[]).
xc_direction(a65b12506e91ad,':FORWARD').
xc_monotonicity(a65b12506e91ad,':MONOTONIC').
xc_creator(a65b12506e91ad,'DaleAlbericci').
xc_creation_date(a65b12506e91ad,19990603).
x_isa(x_EconomicPowerAccord,x_PowerRelationStatusAttribute) :- x_cid(a65b12506e91ae).
xc_microtheory(a65b12506e91ae,x_HPKBCrisisMt).
xc_source_file(a65b12506e91ae,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91ae,1734).
xc_kb_names(a65b12506e91ae,[]).
xc_mapping_rows(a65b12506e91ae,[]).
xc_direction(a65b12506e91ae,':FORWARD').
xc_monotonicity(a65b12506e91ae,':MONOTONIC').
xc_creator(a65b12506e91ae,'DaleAlbericci').
xc_creation_date(a65b12506e91ae,19990603).
x_comment(x_EconomicPowerConflict," EconomicPowerConflict is a reciprocal relationship between two governments of countries, such that a power conflict exists between them. The power conflict is Economic in nature and consists of competing for power in a geographical region primarily through political or diplomatic means. Competing for power through geopolitical or military means is not designated by this attribute.") :- x_cid(a65b12506e91af).
xc_microtheory(a65b12506e91af,x_HPKBCrisisMt).
xc_source_file(a65b12506e91af,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91af,1740).
xc_kb_names(a65b12506e91af,[]).
xc_mapping_rows(a65b12506e91af,[]).
xc_direction(a65b12506e91af,':FORWARD').
xc_monotonicity(a65b12506e91af,':DEFAULT').
xc_creator(a65b12506e91af,'DaleAlbericci').
xc_creation_date(a65b12506e91af,19990603).
x_isa(x_EconomicPowerConflict,x_TeknowledgeConstant) :- x_cid(a65b12506e91b0).
xc_microtheory(a65b12506e91b0,x_HPKBCrisisMt).
xc_source_file(a65b12506e91b0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91b0,1746).
xc_kb_names(a65b12506e91b0,[]).
xc_mapping_rows(a65b12506e91b0,[]).
xc_direction(a65b12506e91b0,':FORWARD').
xc_monotonicity(a65b12506e91b0,':MONOTONIC').
xc_creator(a65b12506e91b0,'DaleAlbericci').
xc_creation_date(a65b12506e91b0,19990603).
x_isa(x_EconomicPowerConflict,x_PowerRelationStatusAttribute) :- x_cid(a65b12506e91b1).
xc_microtheory(a65b12506e91b1,x_HPKBCrisisMt).
xc_source_file(a65b12506e91b1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91b1,1752).
xc_kb_names(a65b12506e91b1,[]).
xc_mapping_rows(a65b12506e91b1,[]).
xc_direction(a65b12506e91b1,':FORWARD').
xc_monotonicity(a65b12506e91b1,':MONOTONIC').
xc_creator(a65b12506e91b1,'DaleAlbericci').
xc_creation_date(a65b12506e91b1,19990603).
x_negationAttribute(x_GeopoliticalPowerConflict,x_GeopoliticalPowerAccord) :- x_cid(a65b12506e91b2).
xc_microtheory(a65b12506e91b2,x_HPKBCrisisMt).
xc_source_file(a65b12506e91b2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91b2,1758).
xc_kb_names(a65b12506e91b2,[]).
xc_mapping_rows(a65b12506e91b2,[]).
xc_direction(a65b12506e91b2,':FORWARD').
xc_monotonicity(a65b12506e91b2,':DEFAULT').
xc_creator(a65b12506e91b2,'DaleAlbericci').
xc_creation_date(a65b12506e91b2,19990603).
x_implies(x_and('x_='(x_MediumToVeryHigh,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Geopolitical'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_GeopoliticalPowerAccord)) :- x_cid(a65b12506e91b3,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e91b3,x_HPKBCrisisMt).
xc_source_file(a65b12506e91b3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91b3,1764).
xc_kb_names(a65b12506e91b3,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e91b3,['implication-implies']).
xc_direction(a65b12506e91b3,':BACKWARD').
xc_monotonicity(a65b12506e91b3,':DEFAULT').
xc_creator(a65b12506e91b3,'DaleAlbericci').
xc_creation_date(a65b12506e91b3,19990603).
x_implies(x_and('x_='(x_HighToVeryHigh,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Geopolitical'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_GeopoliticalPowerAccord)) :- x_cid(a65b12506e91b4,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e91b4,x_HPKBCrisisMt).
xc_source_file(a65b12506e91b4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91b4,1776).
xc_kb_names(a65b12506e91b4,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e91b4,['implication-implies']).
xc_direction(a65b12506e91b4,':BACKWARD').
xc_monotonicity(a65b12506e91b4,':DEFAULT').
xc_creator(a65b12506e91b4,'DaleAlbericci').
xc_creation_date(a65b12506e91b4,19990603).
x_implies(x_and('x_='(x_High,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Geopolitical'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_GeopoliticalPowerAccord)) :- x_cid(a65b12506e91b5,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e91b5,x_HPKBCrisisMt).
xc_source_file(a65b12506e91b5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91b5,1788).
xc_kb_names(a65b12506e91b5,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e91b5,['implication-implies']).
xc_direction(a65b12506e91b5,':BACKWARD').
xc_monotonicity(a65b12506e91b5,':DEFAULT').
xc_creator(a65b12506e91b5,'DaleAlbericci').
xc_creation_date(a65b12506e91b5,19990603).
x_implies(x_and('x_='(x_LowToVeryLow,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Geopolitical'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_GeopoliticalPowerConflict)) :- x_cid(a65b12506e91b6,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e91b6,x_HPKBCrisisMt).
xc_source_file(a65b12506e91b6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91b6,1800).
xc_kb_names(a65b12506e91b6,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e91b6,['implication-implies']).
xc_direction(a65b12506e91b6,':BACKWARD').
xc_monotonicity(a65b12506e91b6,':DEFAULT').
xc_creator(a65b12506e91b6,'DaleAlbericci').
xc_creation_date(a65b12506e91b6,19990603).
x_implies(x_and('x_='(x_Low,V1),x_different(V2,V3),x_goalCategoryForAgent(V2,'x_powerInRegion-Geopolitical'(V3,V4,V1),V5)),x_hasStatusWithAgent(V2,V3,x_GeopoliticalPowerConflict)) :- x_cid(a65b12506e91b7,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e91b7,x_HPKBCrisisMt).
xc_source_file(a65b12506e91b7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91b7,1812).
xc_kb_names(a65b12506e91b7,["?GEN-VALUE","?AGT1","?AGT2","?REGION","?GOALATTR"]).
xc_mapping_rows(a65b12506e91b7,['implication-implies']).
xc_direction(a65b12506e91b7,':BACKWARD').
xc_monotonicity(a65b12506e91b7,':DEFAULT').
xc_creator(a65b12506e91b7,'DaleAlbericci').
xc_creation_date(a65b12506e91b7,19990603).
x_comment(x_GeopoliticalPowerAccord," GeopoliticalPowerAccord is a reciprocal relationship between two governments of countries, such that a power accord exists between them. The power accord is geopolitical in nature and consists of an agreement, formal or informal, that power in a geogaphical region may be shared through political or diplomatic means. Sharing power through economic or military means is not designated by this attribute.") :- x_cid(a65b12506e91b8).
xc_microtheory(a65b12506e91b8,x_HPKBCrisisMt).
xc_source_file(a65b12506e91b8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91b8,1824).
xc_kb_names(a65b12506e91b8,[]).
xc_mapping_rows(a65b12506e91b8,[]).
xc_direction(a65b12506e91b8,':FORWARD').
xc_monotonicity(a65b12506e91b8,':DEFAULT').
xc_creator(a65b12506e91b8,'DaleAlbericci').
xc_creation_date(a65b12506e91b8,19990603).
x_isa(x_GeopoliticalPowerAccord,x_TeknowledgeConstant) :- x_cid(a65b12506e91b9).
xc_microtheory(a65b12506e91b9,x_HPKBCrisisMt).
xc_source_file(a65b12506e91b9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91b9,1830).
xc_kb_names(a65b12506e91b9,[]).
xc_mapping_rows(a65b12506e91b9,[]).
xc_direction(a65b12506e91b9,':FORWARD').
xc_monotonicity(a65b12506e91b9,':MONOTONIC').
xc_creator(a65b12506e91b9,'DaleAlbericci').
xc_creation_date(a65b12506e91b9,19990603).
x_isa(x_GeopoliticalPowerAccord,x_PowerRelationStatusAttribute) :- x_cid(a65b12506e91ba).
xc_microtheory(a65b12506e91ba,x_HPKBCrisisMt).
xc_source_file(a65b12506e91ba,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91ba,1836).
xc_kb_names(a65b12506e91ba,[]).
xc_mapping_rows(a65b12506e91ba,[]).
xc_direction(a65b12506e91ba,':FORWARD').
xc_monotonicity(a65b12506e91ba,':MONOTONIC').
xc_creator(a65b12506e91ba,'DaleAlbericci').
xc_creation_date(a65b12506e91ba,19990603).
x_comment(x_GeopoliticalPowerConflict," GeopoliticalPowerConflict is a reciprocal relationship between two governments of countries, such that a power conflict exists between them. The power conflict is geopolitical in nature and consists of competing for power in a geographical region primarily through political or diplomatic means. Competing for power through economic or military means is not designated by this attribute.") :- x_cid(a65b12506e91bb).
xc_microtheory(a65b12506e91bb,x_HPKBCrisisMt).
xc_source_file(a65b12506e91bb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91bb,1842).
xc_kb_names(a65b12506e91bb,[]).
xc_mapping_rows(a65b12506e91bb,[]).
xc_direction(a65b12506e91bb,':FORWARD').
xc_monotonicity(a65b12506e91bb,':DEFAULT').
xc_creator(a65b12506e91bb,'DaleAlbericci').
xc_creation_date(a65b12506e91bb,19990603).
x_isa(x_GeopoliticalPowerConflict,x_TeknowledgeConstant) :- x_cid(a65b12506e91bc).
xc_microtheory(a65b12506e91bc,x_HPKBCrisisMt).
xc_source_file(a65b12506e91bc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91bc,1848).
xc_kb_names(a65b12506e91bc,[]).
xc_mapping_rows(a65b12506e91bc,[]).
xc_direction(a65b12506e91bc,':FORWARD').
xc_monotonicity(a65b12506e91bc,':MONOTONIC').
xc_creator(a65b12506e91bc,'DaleAlbericci').
xc_creation_date(a65b12506e91bc,19990603).
x_isa(x_GeopoliticalPowerConflict,x_PowerRelationStatusAttribute) :- x_cid(a65b12506e91bd).
xc_microtheory(a65b12506e91bd,x_HPKBCrisisMt).
xc_source_file(a65b12506e91bd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91bd,1854).
xc_kb_names(a65b12506e91bd,[]).
xc_mapping_rows(a65b12506e91bd,[]).
xc_direction(a65b12506e91bd,':FORWARD').
xc_monotonicity(a65b12506e91bd,':MONOTONIC').
xc_creator(a65b12506e91bd,'DaleAlbericci').
xc_creation_date(a65b12506e91bd,19990603).
x_comment(x_PowerRelationStatusAttribute,"A collection of attributes.  Each attribute in this collection specifies a kind of power relationship that can hold between geopolitical entities -- examples include GeopoliticalPowerConflict and GeopoliticalPowerAccord.  Instances will most commonly be used as the arg3 to hasStatusWithAgent") :- x_cid(a65b12506e91be).
xc_microtheory(a65b12506e91be,x_HPKBCrisisMt).
xc_source_file(a65b12506e91be,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91be,1860).
xc_kb_names(a65b12506e91be,[]).
xc_mapping_rows(a65b12506e91be,[]).
xc_direction(a65b12506e91be,':FORWARD').
xc_monotonicity(a65b12506e91be,':DEFAULT').
xc_creator(a65b12506e91be,'DaleAlbericci').
xc_creation_date(a65b12506e91be,19990603).
x_genls(x_PowerRelationStatusAttribute,x_InterAgentRelationTypeAttribute) :- x_cid(a65b12506e91bf).
xc_microtheory(a65b12506e91bf,x_HPKBCrisisMt).
xc_source_file(a65b12506e91bf,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91bf,1866).
xc_kb_names(a65b12506e91bf,[]).
xc_mapping_rows(a65b12506e91bf,[]).
xc_direction(a65b12506e91bf,':FORWARD').
xc_monotonicity(a65b12506e91bf,':MONOTONIC').
xc_creator(a65b12506e91bf,'DaleAlbericci').
xc_creation_date(a65b12506e91bf,19990603).
x_isa(x_PowerRelationStatusAttribute,x_TeknowledgeConstant) :- x_cid(a65b12506e91c0).
xc_microtheory(a65b12506e91c0,x_HPKBCrisisMt).
xc_source_file(a65b12506e91c0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91c0,1872).
xc_kb_names(a65b12506e91c0,[]).
xc_mapping_rows(a65b12506e91c0,[]).
xc_direction(a65b12506e91c0,':FORWARD').
xc_monotonicity(a65b12506e91c0,':MONOTONIC').
xc_creator(a65b12506e91c0,'DaleAlbericci').
xc_creation_date(a65b12506e91c0,19990603).
x_isa(x_PowerRelationStatusAttribute,x_UnorderedAttributeType) :- x_cid(a65b12506e91c1).
xc_microtheory(a65b12506e91c1,x_HPKBCrisisMt).
xc_source_file(a65b12506e91c1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91c1,1878).
xc_kb_names(a65b12506e91c1,[]).
xc_mapping_rows(a65b12506e91c1,[]).
xc_direction(a65b12506e91c1,':FORWARD').
xc_monotonicity(a65b12506e91c1,':MONOTONIC').
xc_creator(a65b12506e91c1,'DaleAlbericci').
xc_creation_date(a65b12506e91c1,19990603).
x_isa(x_PowerRelationStatusAttribute,x_SocialAttributeType) :- x_cid(a65b12506e91c2).
xc_microtheory(a65b12506e91c2,x_HPKBCrisisMt).
xc_source_file(a65b12506e91c2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91c2,1884).
xc_kb_names(a65b12506e91c2,[]).
xc_mapping_rows(a65b12506e91c2,[]).
xc_direction(a65b12506e91c2,':FORWARD').
xc_monotonicity(a65b12506e91c2,':MONOTONIC').
xc_creator(a65b12506e91c2,'DaleAlbericci').
xc_creation_date(a65b12506e91c2,19990603).
x_implies(x_and(x_isa(V1,x_HoldingHostages),x_deliberateActors(V1,V2),x_territoriesControlled(V2,V3),x_isa(V3,x_Country)),x_actionViolatesObligation(V1,'x_InternationalNorm-DontTakeHostages')) :- x_cid(a65b12506e91c3,V1,V2,V3).
xc_microtheory(a65b12506e91c3,x_HPKBCrisisMt).
xc_source_file(a65b12506e91c3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91c3,1890).
xc_kb_names(a65b12506e91c3,["?HOSTAGE","?AGENT","?COUNTRY"]).
xc_mapping_rows(a65b12506e91c3,['implication-implies']).
xc_direction(a65b12506e91c3,':FORWARD').
xc_monotonicity(a65b12506e91c3,':DEFAULT').
xc_creator(a65b12506e91c3,'Watson').
xc_creation_date(a65b12506e91c3,19990603).
x_implies(x_and(x_isa(V1,x_TakingSomeoneHostage),x_deliberateActors(V1,V2),x_territoriesControlled(V2,V3),x_isa(V3,x_Country)),x_actionViolatesObligation(V1,'x_InternationalNorm-DontTakeHostages')) :- x_cid(a65b12506e91c4,V1,V2,V3).
xc_microtheory(a65b12506e91c4,x_HPKBCrisisMt).
xc_source_file(a65b12506e91c4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91c4,1902).
xc_kb_names(a65b12506e91c4,["?HOSTAGE","?AGENT","?COUNTRY"]).
xc_mapping_rows(a65b12506e91c4,['implication-implies']).
xc_direction(a65b12506e91c4,':FORWARD').
xc_monotonicity(a65b12506e91c4,':DEFAULT').
xc_creator(a65b12506e91c4,'Watson').
xc_creation_date(a65b12506e91c4,19990603).
x_comment(x_implies(x_and(x_obligationParts(x_ModernInternationalRelationsCOC,V1),x_maleficiary(V2,V3),x_actionViolatesObligation(V2,V1),x_deliberateActors(V2,V4)),'x_increases-Generic'(V2,V4,x_Kappa(t(V5,V6),'x_statusWithAgent-Gradient'(V5,V3,x_StateOfDiplomaticTension,V6)))),"This rule says: If an agent violates a part of the code of conduct\nexpected in modern international relations and harms another, then\nthat violation tends to increase the level of diplomatic tension\nbetween the agents involved.  Note that the agents to whom the\n#$ModernInternationalRelationsCOC applies are countries, so that\nconstraint is not made explicitly here.") :- x_cid(a65b12506e91c5,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e91c5,x_HPKBCrisisMt).
xc_source_file(a65b12506e91c5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91c5,1914).
xc_kb_names(a65b12506e91c5,["?OBLIGATION","?VIOLATION","?MAL","?ACTOR","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91c5,['implication-implies']).
xc_direction(a65b12506e91c5,':BACKWARD').
xc_monotonicity(a65b12506e91c5,':DEFAULT').
xc_creator(a65b12506e91c5,'Nichols').
xc_creation_date(a65b12506e91c5,19990603).
x_comment(x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_isa(V2,x_Country),x_isa(V3,x_Country),x_territoriesControlled(V4,V2),x_maleficiary(V1,V3),x_deliberateActors(V1,V4)),x_actionViolatesObligation(V1,x_NoFirstStrike)),"This rule says: If one country is deliberately attacked by those in\ncontrol of another country, that attack violates the #$NoFirstStrike\ntenet of modern international relations (which prescribes that no\ncountry should violently attack another).  Note that there are two\n(asserted) exceptions to the rule that attacks violate the\n#$NoFirstStrike principle, namely (a) when the attacking agent was\npreviously attacked and (b) when the two countries are waging a war.") :- x_cid(a65b12506e91c6,V1,V2,V3,V4).
xc_microtheory(a65b12506e91c6,x_HPKBCrisisMt).
xc_source_file(a65b12506e91c6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91c6,1935).
xc_kb_names(a65b12506e91c6,["?ATTACK","?COUNTRY","?VICTIM","?AGGRESSOR"]).
xc_mapping_rows(a65b12506e91c6,['implication-implies']).
xc_direction(a65b12506e91c6,':BACKWARD').
xc_monotonicity(a65b12506e91c6,':DEFAULT').
xc_creator(a65b12506e91c6,'Nichols').
xc_creation_date(a65b12506e91c6,19990603).
x_implies(x_and(x_obligationParts(x_ModernInternationalRelationsCOC,V1),x_actionViolatesObligation(V2,V1),x_deliberateActors(V2,V3),x_maleficiary(V2,V4)),'x_increases-Generic'(V2,V3,x_Kappa(t(V5,V6),'x_statusWithAgent-Gradient'(V5,V4,x_StateOfDiplomaticTension,V6)))) :- x_cid(a65b12506e91c7,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e91c7,x_HPKBCrisisMt).
xc_source_file(a65b12506e91c7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91c7,1956).
xc_kb_names(a65b12506e91c7,["?OBLIGATION","?VIOLATION","?ACTOR","?MAL","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91c7,['implication-implies']).
xc_direction(a65b12506e91c7,':BACKWARD').
xc_monotonicity(a65b12506e91c7,':DEFAULT').
xc_creator(a65b12506e91c7,'Watson').
xc_creation_date(a65b12506e91c7,19990603).
x_exceptWhen(x_trueFormula(x_thereExists(V1,x_and(x_isa(V1,x_WagingWar),x_subEvents(V1,V2),x_opponentsInConflict(V3,V4,V1)))),x_implies(x_and(x_isa(V2,x_AttackOnTangible),x_isa(V5,x_Country),x_isa(V4,x_Country),x_territoriesControlled(V3,V5),x_maleficiary(V2,V4),x_deliberateActors(V2,V3)),x_actionViolatesObligation(V2,x_NoFirstStrike))) :- x_cid(a65b12506e91c8,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e91c8,x_HPKBCrisisMt).
xc_source_file(a65b12506e91c8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91c8,1971).
xc_kb_names(a65b12506e91c8,["?WAR","?ATTACK","?AGGRESSOR","?VICTIM","?COUNTRY"]).
xc_mapping_rows(a65b12506e91c8,['exists-thereexists','implication-implies']).
xc_direction(a65b12506e91c8,':BACKWARD').
xc_monotonicity(a65b12506e91c8,':DEFAULT').
xc_creator(a65b12506e91c8,'Watson').
xc_creation_date(a65b12506e91c8,19990603).
x_exceptWhen(x_trueFormula(x_thereExists(V1,x_thereExists(V2,x_and(x_isa(V2,x_ConflictEvent),x_isa(V1,x_AttackOnTangible),x_subEvents(V2,V3),x_subEvents(V2,V1),x_startsAfterStartingOf(V3,V1),x_maleficiary(V1,V4),x_deliberateActors(V1,V5))))),x_implies(x_and(x_isa(V3,x_AttackOnTangible),x_isa(V6,x_Country),x_isa(V5,x_Country),x_territoriesControlled(V4,V6),x_maleficiary(V3,V5),x_deliberateActors(V3,V4)),x_actionViolatesObligation(V3,x_NoFirstStrike))) :- x_cid(a65b12506e91c9,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e91c9,x_HPKBCrisisMt).
xc_source_file(a65b12506e91c9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91c9,1993).
xc_kb_names(a65b12506e91c9,["?PREVIOUS-ATTACK","?CONFLICT","?ATTACK","?AGGRESSOR","?VICTIM","?COUNTRY"]).
xc_mapping_rows(a65b12506e91c9,['exists-thereexists','exists-thereexists','implication-implies']).
xc_direction(a65b12506e91c9,':BACKWARD').
xc_monotonicity(a65b12506e91c9,':DEFAULT').
xc_creator(a65b12506e91c9,'Watson').
xc_creation_date(a65b12506e91c9,19990603).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_deliberateActors(V1,V2),x_maleficiary(V1,V3),x_isa(V3,x_Country),x_territoriesControlled(V2,V4),x_isa(V4,x_Country)),x_actionViolatesObligation(V1,x_NoFirstStrike)) :- x_cid(a65b12506e91ca,V1,V2,V3,V4).
xc_microtheory(a65b12506e91ca,x_HPKBCrisisMt).
xc_source_file(a65b12506e91ca,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91ca,2021).
xc_kb_names(a65b12506e91ca,["?ATTACK","?AGGRESSOR","?VICTIM","?COUNTRY"]).
xc_mapping_rows(a65b12506e91ca,['implication-implies']).
xc_direction(a65b12506e91ca,':BACKWARD').
xc_monotonicity(a65b12506e91ca,':DEFAULT').
xc_creator(a65b12506e91ca,'Watson').
xc_creation_date(a65b12506e91ca,19990603).
x_implies(x_and(x_isa(V1,x_Country),x_isa(V2,x_Country),x_territoriesControlled(V3,V2),x_opponentsInConflict(V1,V3,V4),x_increasesImmediatelyCausally(V5,V4,x_conflictLevel)),x_increasesImmediatelyCausally(V5,V3,x_Kappa(t(V6,V7),'x_statusWithAgent-Gradient'(V6,V1,x_StateOfDiplomaticTension,V7)))) :- x_cid(a65b12506e91cb,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e91cb,x_HPKBCrisisMt).
xc_source_file(a65b12506e91cb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91cb,2035).
xc_kb_names(a65b12506e91cb,["?COUNTRY-1","?COUNTRY-2","?AGENT","?CONFLICT","?ACT","?ACTOR","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91cb,['implication-implies']).
xc_direction(a65b12506e91cb,':FORWARD').
xc_monotonicity(a65b12506e91cb,':DEFAULT').
xc_creator(a65b12506e91cb,'Watson').
xc_creation_date(a65b12506e91cb,19990603).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_deliberateActors(V1,V2),x_isa(V2,x_Country),x_maleficiary(V1,V3),x_isa(V3,x_Organization),x_different(V4,V2),x_allies(V4,V3),x_isa(V4,x_Country)),'x_increases-Generic'(V1,V2,x_Kappa(t(V5,V6),'x_statusWithAgent-Gradient'(V5,V4,x_StateOfDiplomaticTension,V6)))) :- x_cid(a65b12506e91cc,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e91cc,x_HPKBCrisisMt).
xc_source_file(a65b12506e91cc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91cc,2051).
xc_kb_names(a65b12506e91cc,["?ATTACK","?COUNTRY-2","?ALLY","?COUNTRY-1","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91cc,['implication-implies']).
xc_direction(a65b12506e91cc,':BACKWARD').
xc_monotonicity(a65b12506e91cc,':DEFAULT').
xc_creator(a65b12506e91cc,'Watson').
xc_creation_date(a65b12506e91cc,19990602).
x_implies(x_and(x_isa(V1,x_HostileSocialAction),x_deliberateActors(V1,V2),x_isa(V2,x_Country),x_maleficiary(V1,V3),x_isa(V3,x_Organization),x_different(V4,V2),x_allies(V4,V3),x_isa(V4,x_Country)),'x_increases-Generic'(V1,V2,x_Kappa(t(V5,V6),'x_statusWithAgent-Gradient'(V5,V4,x_StateOfDiplomaticTension,V6)))) :- x_cid(a65b12506e91cd,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e91cd,x_HPKBCrisisMt).
xc_source_file(a65b12506e91cd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91cd,2070).
xc_kb_names(a65b12506e91cd,["?HOSTILITY","?COUNTRY-2","?ALLY","?COUNTRY-1","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91cd,['implication-implies']).
xc_direction(a65b12506e91cd,':BACKWARD').
xc_monotonicity(a65b12506e91cd,':DEFAULT').
xc_creator(a65b12506e91cd,'Watson').
xc_creation_date(a65b12506e91cd,19990602).
x_implies(x_and(x_isa(V1,x_CrimeDetection),x_eventInvolved(V1,V2),x_isa(V2,x_CriminalAct),x_deliberateActors(V2,V3)),x_increasesCausally(V1,x_thereExists(V4,x_and(x_isa(V4,x_LawEnforcementActivity),x_maleficiary(V4,V3))),x_likelihood)) :- x_cid(a65b12506e91ce,V1,V2,V3,V4).
xc_microtheory(a65b12506e91ce,x_HPKBCrisisMt).
xc_source_file(a65b12506e91ce,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91ce,2089).
xc_kb_names(a65b12506e91ce,["?DETECTION","?CRIME","?AGENT","?LAW-ENFORCING"]).
xc_mapping_rows(a65b12506e91ce,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e91ce,':BACKWARD').
xc_monotonicity(a65b12506e91ce,':DEFAULT').
xc_creator(a65b12506e91ce,'Watson').
xc_creation_date(a65b12506e91ce,19990602).
x_implies(x_and(x_isa(V1,x_ShowingSupportForSomeone),x_deliberateActors(V1,V2),x_isa(V2,x_Country),x_beneficiary(V1,V3),x_isa(V3,x_Country)),'x_decreases-Generic'(V1,V2,x_Kappa(t(V4,V5),'x_statusWithAgent-Gradient'(V4,V3,x_StateOfDiplomaticTension,V5)))) :- x_cid(a65b12506e91cf,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e91cf,x_HPKBCrisisMt).
xc_source_file(a65b12506e91cf,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91cf,2106).
xc_kb_names(a65b12506e91cf,["?HELP","?COUNTRY-2","?COUNTRY-1","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91cf,['implication-implies']).
xc_direction(a65b12506e91cf,':BACKWARD').
xc_monotonicity(a65b12506e91cf,':DEFAULT').
xc_creator(a65b12506e91cf,'Watson').
xc_creation_date(a65b12506e91cf,19990602).
x_implies(x_and(x_isa(V1,x_Country),x_isa(V2,x_ConflictEvent),x_isa(V3,x_Country),x_sponsorsAgentInAction(V1,V4,V2),x_opponentsInConflict(V4,V3,V2)),x_increasesCausally(V2,V1,x_Kappa(t(V5,V6),'x_statusWithAgent-Gradient'(V5,V3,x_StateOfDiplomaticTension,V6)))) :- x_cid(a65b12506e91d0,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e91d0,x_HPKBCrisisMt).
xc_source_file(a65b12506e91d0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91d0,2122).
xc_kb_names(a65b12506e91d0,["?COUNTRY-1","?CONFLICT","?COUNTRY-2","?AGENT","?ACTOR","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91d0,['implication-implies']).
xc_direction(a65b12506e91d0,':BACKWARD').
xc_monotonicity(a65b12506e91d0,':DEFAULT').
xc_creator(a65b12506e91d0,'Watson').
xc_creation_date(a65b12506e91d0,19990602).
x_implies(x_and(x_isa(V1,x_ResolvePeacefully),x_performedBy(V1,V2),x_resolvedBy(V3,V1),x_territoriesControlled(V2,V4),x_isa(V4,x_Country),x_isa(V5,x_Country),x_opponentsInConflict(V5,V2,V3)),x_decreasesImmediatelyCausally(V1,V2,x_Kappa(t(V6,V7),'x_statusWithAgent-Gradient'(V6,V5,x_StateOfDiplomaticTension,V7)))) :- x_cid(a65b12506e91d1,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e91d1,x_HPKBCrisisMt).
xc_source_file(a65b12506e91d1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91d1,2138).
xc_kb_names(a65b12506e91d1,["?RESOLUTION","?AGENT","?CONFLICT","?COUNTRY-2","?COUNTRY-1","?ACTOR","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91d1,['implication-implies']).
xc_direction(a65b12506e91d1,':BACKWARD').
xc_monotonicity(a65b12506e91d1,':DEFAULT').
xc_creator(a65b12506e91d1,'Watson').
xc_creation_date(a65b12506e91d1,19990602).
x_implies(x_and(x_isa(V1,x_ResolvePeacefully),x_performedBy(V1,V2),x_isa(V2,x_Country),x_resolvedBy(V3,V1),x_isa(V4,x_Country),x_opponentsInConflict(V2,V4,V3)),x_decreasesImmediatelyCausally(V1,V2,x_Kappa(t(V5,V6),'x_statusWithAgent-Gradient'(V5,V4,x_StateOfDiplomaticTension,V6)))) :- x_cid(a65b12506e91d2,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e91d2,x_HPKBCrisisMt).
xc_source_file(a65b12506e91d2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91d2,2156).
xc_kb_names(a65b12506e91d2,["?RESOLUTION","?COUNTRY-1","?CONFLICT","?COUNTRY-2","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91d2,['implication-implies']).
xc_direction(a65b12506e91d2,':BACKWARD').
xc_monotonicity(a65b12506e91d2,':DEFAULT').
xc_creator(a65b12506e91d2,'Watson').
xc_creation_date(a65b12506e91d2,19990602).
x_implies(x_and(x_isa(V1,x_Country),x_isa(V2,x_Country),x_territoriesControlled(V3,V2),x_opponentsInConflict(V1,V3,V4),'x_decreases-Generic'(V5,V4,x_conflictLevel)),'x_decreases-Generic'(V5,V3,x_Kappa(t(V6,V7),'x_statusWithAgent-Gradient'(V6,V1,x_StateOfDiplomaticTension,V7)))) :- x_cid(a65b12506e91d3,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e91d3,x_HPKBCrisisMt).
xc_source_file(a65b12506e91d3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91d3,2173).
xc_kb_names(a65b12506e91d3,["?COUNTRY-1","?COUNTRY-2","?AGENT","?CONFLICT","?ACT","?ACTOR","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91d3,['implication-implies']).
xc_direction(a65b12506e91d3,':BACKWARD').
xc_monotonicity(a65b12506e91d3,':DEFAULT').
xc_creator(a65b12506e91d3,'Watson').
xc_creation_date(a65b12506e91d3,19990602).
x_implies(x_and(x_isa(V1,x_Country),x_isa(V2,x_Country),x_opponentsInConflict(V1,V2,V3),'x_decreases-Generic'(V4,V3,x_conflictLevel)),'x_decreases-Generic'(V4,V1,x_Kappa(t(V5,V6),'x_statusWithAgent-Gradient'(V5,V2,x_StateOfDiplomaticTension,V6)))) :- x_cid(a65b12506e91d4,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e91d4,x_HPKBCrisisMt).
xc_source_file(a65b12506e91d4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91d4,2189).
xc_kb_names(a65b12506e91d4,["?COUNTRY-1","?COUNTRY-2","?CONFLICT","?ACT","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91d4,['implication-implies']).
xc_direction(a65b12506e91d4,':BACKWARD').
xc_monotonicity(a65b12506e91d4,':DEFAULT').
xc_creator(a65b12506e91d4,'Watson').
xc_creation_date(a65b12506e91d4,19990602).
x_implies(x_and(x_isa(V1,x_DeclaringCeaseFire),x_subEvents(V2,V1),x_isa(V2,x_ConflictEvent)),x_decreasesImmediatelyCausally(V1,V2,x_conflictLevel)) :- x_cid(a65b12506e91d5,V1,V2).
xc_microtheory(a65b12506e91d5,x_HPKBCrisisMt).
xc_source_file(a65b12506e91d5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91d5,2204).
xc_kb_names(a65b12506e91d5,["?CEASE-FIRE","?CONFLICT"]).
xc_mapping_rows(a65b12506e91d5,['implication-implies']).
xc_direction(a65b12506e91d5,':BACKWARD').
xc_monotonicity(a65b12506e91d5,':DEFAULT').
xc_creator(a65b12506e91d5,'Watson').
xc_creation_date(a65b12506e91d5,19990602).
x_implies(x_and(x_isa(V1,x_Country),x_isa(V2,x_Country),x_opponentsInConflict(V1,V2,V3),x_increasesImmediatelyCausally(V4,V3,x_conflictLevel)),x_increasesImmediatelyCausally(V4,V1,x_Kappa(t(V5,V6),'x_statusWithAgent-Gradient'(V5,V2,x_StateOfDiplomaticTension,V6)))) :- x_cid(a65b12506e91d6,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e91d6,x_HPKBCrisisMt).
xc_source_file(a65b12506e91d6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91d6,2215).
xc_kb_names(a65b12506e91d6,["?COUNTRY-1","?COUNTRY-2","?CONFLICT","?ACT","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91d6,['implication-implies']).
xc_direction(a65b12506e91d6,':BACKWARD').
xc_monotonicity(a65b12506e91d6,':DEFAULT').
xc_creator(a65b12506e91d6,'Watson').
xc_creation_date(a65b12506e91d6,19990601).
x_implies(x_and(x_isa(V1,x_Country),x_isa(V2,x_Country),x_territoriesControlled(V3,V2),x_opponentsInConflict(V1,V3,V4),'x_increases-Generic'(V5,V4,x_conflictLevel)),'x_increases-Generic'(V5,V3,x_Kappa(t(V6,V7),'x_statusWithAgent-Gradient'(V6,V1,x_StateOfDiplomaticTension,V7)))) :- x_cid(a65b12506e91d7,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e91d7,x_HPKBCrisisMt).
xc_source_file(a65b12506e91d7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91d7,2230).
xc_kb_names(a65b12506e91d7,["?COUNTRY-1","?COUNTRY-2","?AGENT","?CONFLICT","?ACT","?ACTOR","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91d7,['implication-implies']).
xc_direction(a65b12506e91d7,':BACKWARD').
xc_monotonicity(a65b12506e91d7,':DEFAULT').
xc_creator(a65b12506e91d7,'Watson').
xc_creation_date(a65b12506e91d7,19990601).
x_implies(x_and(x_isa(V1,x_Country),x_isa(V2,x_Country),x_opponentsInConflict(V1,V2,V3),'x_increases-Generic'(V4,V3,x_conflictLevel)),'x_increases-Generic'(V4,V1,x_Kappa(t(V5,V6),'x_statusWithAgent-Gradient'(V5,V2,x_StateOfDiplomaticTension,V6)))) :- x_cid(a65b12506e91d8,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e91d8,x_HPKBCrisisMt).
xc_source_file(a65b12506e91d8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91d8,2246).
xc_kb_names(a65b12506e91d8,["?COUNTRY-1","?COUNTRY-2","?CONFLICT","?ACT","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91d8,['implication-implies']).
xc_direction(a65b12506e91d8,':BACKWARD').
xc_monotonicity(a65b12506e91d8,':DEFAULT').
xc_creator(a65b12506e91d8,'Watson').
xc_creation_date(a65b12506e91d8,19990601).
x_exceptWhen(x_trueFormula(x_thereExists(V1,x_and(x_isa(V1,x_AttackOnTangible),x_subEvents(V2,V1),x_startsAfterStartingOf(V3,V1),x_maleficiary(V1,V4),x_deliberateActors(V1,V5)))),x_implies(x_and(x_isa(V3,x_AttackOnTangible),x_subEvents(V2,V3),x_maleficiary(V3,V5),x_deliberateActors(V3,V4),x_opponentsInConflict(V4,V5,V2)),x_increasesImmediatelyCausally(V3,V2,x_conflictLevel))) :- x_cid(a65b12506e91d9,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e91d9,x_HPKBCrisisMt).
xc_source_file(a65b12506e91d9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91d9,2261).
xc_kb_names(a65b12506e91d9,["?PREVIOUS-ATTACK","?CONFLICT","?ATTACK","?AGENT1","?AGENT2"]).
xc_mapping_rows(a65b12506e91d9,['exists-thereexists','implication-implies']).
xc_direction(a65b12506e91d9,':BACKWARD').
xc_monotonicity(a65b12506e91d9,':DEFAULT').
xc_creator(a65b12506e91d9,'Watson').
xc_creation_date(a65b12506e91d9,19990601).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_deliberateActors(V1,V2),x_maleficiary(V1,V3),x_subEvents(V4,V1),x_opponentsInConflict(V2,V3,V4)),x_increasesImmediatelyCausally(V1,V4,x_conflictLevel)) :- x_cid(a65b12506e91da,V1,V2,V3,V4).
xc_microtheory(a65b12506e91da,x_HPKBCrisisMt).
xc_source_file(a65b12506e91da,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91da,2284).
xc_kb_names(a65b12506e91da,["?ATTACK","?AGENT1","?AGENT2","?CONFLICT"]).
xc_mapping_rows(a65b12506e91da,['implication-implies']).
xc_direction(a65b12506e91da,':BACKWARD').
xc_monotonicity(a65b12506e91da,':DEFAULT').
xc_creator(a65b12506e91da,'Watson').
xc_creation_date(a65b12506e91da,19990601).
x_implies(x_and(x_isa(V1,x_HostileSocialAction),x_deliberateActors(V1,V2),x_maleficiary(V1,V3),x_isa(V3,x_Country),x_territoriesControlled(V2,V4),x_isa(V4,x_Country)),'x_increases-Generic'(V1,V2,x_Kappa(t(V5,V6),'x_statusWithAgent-Gradient'(V5,V3,x_StateOfDiplomaticTension,V6)))) :- x_cid(a65b12506e91db,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e91db,x_HPKBCrisisMt).
xc_source_file(a65b12506e91db,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91db,2297).
xc_kb_names(a65b12506e91db,["?ATTACK","?ACTOR","?COUNTRY-1","?COUNTRY-2","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91db,['implication-implies']).
xc_direction(a65b12506e91db,':BACKWARD').
xc_monotonicity(a65b12506e91db,':DEFAULT').
xc_creator(a65b12506e91db,'Watson').
xc_creation_date(a65b12506e91db,19990601).
x_implies(x_and(x_isa(V1,x_HostileSocialAction),x_deliberateActors(V1,V2),x_isa(V2,x_Country),x_maleficiary(V1,V3),x_isa(V3,x_Country)),'x_increases-Generic'(V1,V2,x_Kappa(t(V4,V5),'x_statusWithAgent-Gradient'(V4,V3,x_StateOfDiplomaticTension,V5)))) :- x_cid(a65b12506e91dc,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e91dc,x_HPKBCrisisMt).
xc_source_file(a65b12506e91dc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91dc,2314).
xc_kb_names(a65b12506e91dc,["?HOSTILE-ACT","?COUNTRY-2","?COUNTRY-1","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91dc,['implication-implies']).
xc_direction(a65b12506e91dc,':BACKWARD').
xc_monotonicity(a65b12506e91dc,':DEFAULT').
xc_creator(a65b12506e91dc,'Watson').
xc_creation_date(a65b12506e91dc,19990601).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_deliberateActors(V1,V2),x_isa(V2,x_Country),x_maleficiary(V1,V3),x_isa(V3,x_Country)),'x_increases-Generic'(V1,V2,x_Kappa(t(V4,V5),'x_statusWithAgent-Gradient'(V4,V3,x_StateOfDiplomaticTension,V5)))) :- x_cid(a65b12506e91dd,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e91dd,x_HPKBCrisisMt).
xc_source_file(a65b12506e91dd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91dd,2330).
xc_kb_names(a65b12506e91dd,["?ATTACK","?COUNTRY-2","?COUNTRY-1","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91dd,['implication-implies']).
xc_direction(a65b12506e91dd,':BACKWARD').
xc_monotonicity(a65b12506e91dd,':DEFAULT').
xc_creator(a65b12506e91dd,'Watson').
xc_creation_date(a65b12506e91dd,19990601).
x_implies(x_and(x_isa(V1,x_ImposingSanctions),x_performedBy(V1,V2),x_isa(V2,x_Country),x_maleficiary(V1,V3),x_isa(V3,x_Country)),x_increasesCausally(V1,V2,x_Kappa(t(V4,V5),'x_statusWithAgent-Gradient'(V4,V3,x_StateOfDiplomaticTension,V5)))) :- x_cid(a65b12506e91de,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e91de,x_HPKBCrisisMt).
xc_source_file(a65b12506e91de,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91de,2346).
xc_kb_names(a65b12506e91de,["?SANCTIONS","?COUNTRY-1","?COUNTRY-2","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91de,['implication-implies']).
xc_direction(a65b12506e91de,':BACKWARD').
xc_monotonicity(a65b12506e91de,':DEFAULT').
xc_creator(a65b12506e91de,'Watson').
xc_creation_date(a65b12506e91de,19990528).
x_implies(x_and(x_isa(V1,x_AnnexingTerritory),x_toPossessor(V1,V2),x_isa(V2,x_GeopoliticalEntity),x_objectOfPossessionTransfer(V1,V3),x_isa(V3,x_GeographicalRegion),x_different(V2,V4),x_isa(V4,x_GeopoliticalEntity)),x_decreasesCausally(V1,x_territoriesControlled(V4,V3),x_likelihood)) :- x_cid(a65b12506e91df,V1,V2,V3,V4).
xc_microtheory(a65b12506e91df,x_HPKBCrisisMt).
xc_source_file(a65b12506e91df,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91df,2362).
xc_kb_names(a65b12506e91df,["?ANNEX","?GEO-ENTITY","?REGION","?OTHER-ENTITY"]).
xc_mapping_rows(a65b12506e91df,['implication-implies']).
xc_direction(a65b12506e91df,':BACKWARD').
xc_monotonicity(a65b12506e91df,':DEFAULT').
xc_creator(a65b12506e91df,'Watson').
xc_creation_date(a65b12506e91df,19990528).
x_implies(x_and(x_isa(V1,x_Country),x_goalCategoryForAgent(V1,V2,x_GeopoliticalStatusGoal)),x_goalCategoryForAgent(V1,V2,x_StrategicNationalInterest)) :- x_cid(a65b12506e91e0,V1,V2).
xc_microtheory(a65b12506e91e0,x_HPKBCrisisMt).
xc_source_file(a65b12506e91e0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91e0,2378).
xc_kb_names(a65b12506e91e0,["?COUNTRY","?STATUS-GOAL"]).
xc_mapping_rows(a65b12506e91e0,['implication-implies']).
xc_direction(a65b12506e91e0,':BACKWARD').
xc_monotonicity(a65b12506e91e0,':DEFAULT').
xc_creator(a65b12506e91e0,'Watson').
xc_creation_date(a65b12506e91e0,19990527).
x_implies(x_and(x_isa(V1,x_MilitaryInvasion),x_successfulForAgents(V1,V2),x_isa(V2,x_Country),x_objectActedOn(V1,V3),x_isa(V3,x_Country),x_geographicalSubRegions(V4,V2),x_isa(V4,x_GeoculturalRegion)),x_increasesImmediatelyCausally(V1,'x_powerInRegion-Geopolitical'(V2,V4,x_MediumToVeryHigh),x_likelihood)) :- x_cid(a65b12506e91e1,V1,V2,V3,V4).
xc_microtheory(a65b12506e91e1,x_HPKBCrisisMt).
xc_source_file(a65b12506e91e1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91e1,2388).
xc_kb_names(a65b12506e91e1,["?INVASION","?INVADER","?INVADED","?REGION"]).
xc_mapping_rows(a65b12506e91e1,['implication-implies']).
xc_direction(a65b12506e91e1,':FORWARD').
xc_monotonicity(a65b12506e91e1,':DEFAULT').
xc_creator(a65b12506e91e1,'Watson').
xc_creation_date(a65b12506e91e1,19990527).
x_goals(x_Iran,x_oilRevenue(x_Iran,x_HighIncomeLevel)) :- x_cid(a65b12506e91e2).
xc_microtheory(a65b12506e91e2,x_HPKBCrisisMt).
xc_source_file(a65b12506e91e2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91e2,2404).
xc_kb_names(a65b12506e91e2,[]).
xc_mapping_rows(a65b12506e91e2,[]).
xc_direction(a65b12506e91e2,':FORWARD').
xc_monotonicity(a65b12506e91e2,':DEFAULT').
x_goalCategoryForAgent(x_Iran,x_oilRevenue(x_Iran,x_HighIncomeLevel),x_StrategicNationalInterest) :- x_cid(a65b12506e91e3).
xc_microtheory(a65b12506e91e3,x_HPKBCrisisMt).
xc_source_file(a65b12506e91e3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91e3,2411).
xc_kb_names(a65b12506e91e3,[]).
xc_mapping_rows(a65b12506e91e3,[]).
xc_direction(a65b12506e91e3,':FORWARD').
xc_monotonicity(a65b12506e91e3,':DEFAULT').
x_increasesCausally('x_AssassinationOfDissident038-2',x_thereExists(V1,x_and(x_isa(V1,x_AttackOnTangible),x_maleficiary(V1,'x_Assassin038-2'))),x_likelihood) :- x_cid(a65b12506e91e4,V1).
xc_microtheory(a65b12506e91e4,x_HPKBCrisisMt).
xc_source_file(a65b12506e91e4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91e4,2418).
xc_kb_names(a65b12506e91e4,["?RETALIATION"]).
xc_mapping_rows(a65b12506e91e4,['exists-thereexists']).
xc_direction(a65b12506e91e4,':FORWARD').
xc_monotonicity(a65b12506e91e4,':DEFAULT').
x_increasesCausally('x_AssassinationOfDissident038-1',x_thereExists(V1,x_and(x_isa(V1,x_AttackOnTangible),x_maleficiary(V1,'x_Assassin038-1'))),x_likelihood) :- x_cid(a65b12506e91e5,V1).
xc_microtheory(a65b12506e91e5,x_HPKBCrisisMt).
xc_source_file(a65b12506e91e5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91e5,2429).
xc_kb_names(a65b12506e91e5,["?RETALIATION"]).
xc_mapping_rows(a65b12506e91e5,['exists-thereexists']).
xc_direction(a65b12506e91e5,':FORWARD').
xc_monotonicity(a65b12506e91e5,':DEFAULT').
x_capableOfDoing(x_UnitedNationsOrganization,'x_TerritorialDispute-SaudiArabia-Yemen',x_mediators) :- x_cid(a65b12506e91e6).
xc_microtheory(a65b12506e91e6,x_HPKBCrisisMt).
xc_source_file(a65b12506e91e6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91e6,2440).
xc_kb_names(a65b12506e91e6,[]).
xc_mapping_rows(a65b12506e91e6,[]).
xc_direction(a65b12506e91e6,':FORWARD').
xc_monotonicity(a65b12506e91e6,':DEFAULT').
x_capableOfDoing(x_UnitedNationsOrganization,'x_TerritorialDispute-SaudiArabia-UAE',x_mediators) :- x_cid(a65b12506e91e7).
xc_microtheory(a65b12506e91e7,x_HPKBCrisisMt).
xc_source_file(a65b12506e91e7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91e7,2446).
xc_kb_names(a65b12506e91e7,[]).
xc_mapping_rows(a65b12506e91e7,[]).
xc_direction(a65b12506e91e7,':FORWARD').
xc_monotonicity(a65b12506e91e7,':DEFAULT').
x_capableOfDoing(x_UnitedNationsOrganization,'x_TerritorialDispute-SaudiArabia-Qatar',x_mediators) :- x_cid(a65b12506e91e8).
xc_microtheory(a65b12506e91e8,x_HPKBCrisisMt).
xc_source_file(a65b12506e91e8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91e8,2452).
xc_kb_names(a65b12506e91e8,[]).
xc_mapping_rows(a65b12506e91e8,[]).
xc_direction(a65b12506e91e8,':FORWARD').
xc_monotonicity(a65b12506e91e8,':DEFAULT').
x_capableOfDoing(x_UnitedNationsOrganization,'x_TerritorialDispute-SaudiArabia-Kuwait',x_mediators) :- x_cid(a65b12506e91e9).
xc_microtheory(a65b12506e91e9,x_HPKBCrisisMt).
xc_source_file(a65b12506e91e9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91e9,2458).
xc_kb_names(a65b12506e91e9,[]).
xc_mapping_rows(a65b12506e91e9,[]).
xc_direction(a65b12506e91e9,':FORWARD').
xc_monotonicity(a65b12506e91e9,':DEFAULT').
x_implies(x_isa(V1,x_Country),x_goalCategoryForAgent(x_GovernmentFn(V1),x_not(x_thereExists(V2,x_and(x_isa(V2,x_Insurgency),x_objectActedOn(V2,x_GovernmentFn(V1))))),x_InternalSecurityGoal)) :- x_cid(a65b12506e91ea,V1,V2).
xc_microtheory(a65b12506e91ea,x_HPKBCrisisMt).
xc_source_file(a65b12506e91ea,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91ea,2464).
xc_kb_names(a65b12506e91ea,["?COUNTRY","?INSURGENCY"]).
xc_mapping_rows(a65b12506e91ea,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e91ea,':BACKWARD').
xc_monotonicity(a65b12506e91ea,':DEFAULT').
xc_creator(a65b12506e91ea,'Watson').
xc_creation_date(a65b12506e91ea,19990526).
x_isa(x_HelpingEventTypeFn(x_MakingFn(x_BiologicalWeaponFn('x_Anthrax-Bacterium'))),x_ScriptType) :- x_cid(a65b12506e91eb).
xc_microtheory(a65b12506e91eb,x_HPKBCrisisMt).
xc_source_file(a65b12506e91eb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91eb,2480).
xc_kb_names(a65b12506e91eb,[]).
xc_mapping_rows(a65b12506e91eb,[]).
xc_direction(a65b12506e91eb,':FORWARD').
xc_monotonicity(a65b12506e91eb,':DEFAULT').
x_genls(x_HelpingEventTypeFn(x_MakingFn(x_BiologicalWeaponFn('x_Anthrax-Bacterium'))),x_HelpingAnAgent) :- x_cid(a65b12506e91ec).
xc_microtheory(a65b12506e91ec,x_HPKBCrisisMt).
xc_source_file(a65b12506e91ec,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91ec,2489).
xc_kb_names(a65b12506e91ec,[]).
xc_mapping_rows(a65b12506e91ec,[]).
xc_direction(a65b12506e91ec,':FORWARD').
xc_monotonicity(a65b12506e91ec,':MONOTONIC').
x_isa(x_HelpingEventTypeFn(x_MakingFn(x_BiologicalWeaponFn('x_Anthrax-Bacterium'))),x_TemporalObjectType) :- x_cid(a65b12506e91ed).
xc_microtheory(a65b12506e91ed,x_HPKBCrisisMt).
xc_source_file(a65b12506e91ed,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91ed,2498).
xc_kb_names(a65b12506e91ed,[]).
xc_mapping_rows(a65b12506e91ed,[]).
xc_direction(a65b12506e91ed,':FORWARD').
xc_monotonicity(a65b12506e91ed,':MONOTONIC').
x_isa(x_CollectionSubsetFn(x_TangibleProduct,x_TheSetOf(V1,x_thereExists(V2,x_exportsThrough(x_Iraq,V1,V2)))),x_ProductType) :- x_cid(a65b12506e91ee,V1,V2).
xc_microtheory(a65b12506e91ee,x_HPKBCrisisMt).
xc_source_file(a65b12506e91ee,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91ee,2507).
xc_kb_names(a65b12506e91ee,["?OBJ","?WATERWAY"]).
xc_mapping_rows(a65b12506e91ee,['exists-thereexists']).
xc_direction(a65b12506e91ee,':FORWARD').
xc_monotonicity(a65b12506e91ee,':MONOTONIC').
xc_creator(a65b12506e91ee,'Meyer').
xc_creation_date(a65b12506e91ee,19990513).
x_implies(x_and(x_isa(V1,x_HostileSocialAction),x_deliberateActors(V1,V2),x_isa(V2,x_Country),x_maleficiary(V1,V3),'x_internationalOrg-MemberCountry'(V4,V3),x_isa(V4,x_InternationalAlliance)),'x_increases-Generic'(V1,V2,x_Kappa(t(V5,V6),'x_statusWithAgent-Gradient'(V5,V4,x_StateOfDiplomaticTension,V6)))) :- x_cid(a65b12506e91ef,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e91ef,x_HPKBCrisisMt).
xc_source_file(a65b12506e91ef,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91ef,2518).
xc_kb_names(a65b12506e91ef,["?ACTION","?COUNTRY","?MEMBER","?ALLIANCE","?AGENT","?TENSION-LEVEL"]).
xc_mapping_rows(a65b12506e91ef,['implication-implies']).
xc_direction(a65b12506e91ef,':BACKWARD').
xc_monotonicity(a65b12506e91ef,':DEFAULT').
xc_creator(a65b12506e91ef,'Watson').
xc_creation_date(a65b12506e91ef,19990513).
x_exceptWhen(x_allies(V1,V2),x_implies(x_and(x_isa(V3,x_MilitaryOccupation),x_isa(V4,x_GeographicalRegion),x_performedBy(V3,V2),x_objectActedOn(V3,V4),x_positiveVestedInterest(V1,V4),x_different(V1,V2)),x_maleficiary(V3,V1))) :- x_cid(a65b12506e91f0,V1,V2,V3,V4).
xc_microtheory(a65b12506e91f0,x_HPKBCrisisMt).
xc_source_file(a65b12506e91f0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91f0,2535).
xc_kb_names(a65b12506e91f0,["?AGENT","?OCCUPIER","?OCCUPATION","?REGION"]).
xc_mapping_rows(a65b12506e91f0,['implication-implies']).
xc_direction(a65b12506e91f0,':BACKWARD').
xc_monotonicity(a65b12506e91f0,':DEFAULT').
xc_creator(a65b12506e91f0,'Watson').
xc_creation_date(a65b12506e91f0,19990513).
x_implies(x_exportsThrough(V1,V2,x_ShippingSystemFn(V3)),x_exportsThrough(V1,V2,V3)) :- x_cid(a65b12506e91f1,V1,V2,V3).
xc_microtheory(a65b12506e91f1,x_HPKBCrisisMt).
xc_source_file(a65b12506e91f1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91f1,2551).
xc_kb_names(a65b12506e91f1,["?COUNTRY","?PRODUCT-TYPE","?WATERWAY"]).
xc_mapping_rows(a65b12506e91f1,['implication-implies']).
xc_direction(a65b12506e91f1,':BACKWARD').
xc_monotonicity(a65b12506e91f1,':DEFAULT').
xc_creator(a65b12506e91f1,'Meyer').
xc_creation_date(a65b12506e91f1,19990512).
x_implies(x_exportsThrough(V1,V2,V3),x_exportsThrough(V1,V2,x_ShippingSystemFn(V3))) :- x_cid(a65b12506e91f2,V1,V2,V3).
xc_microtheory(a65b12506e91f2,x_HPKBCrisisMt).
xc_source_file(a65b12506e91f2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91f2,2560).
xc_kb_names(a65b12506e91f2,["?COUNTRY","?PRODUCT-TYPE","?WATERWAY"]).
xc_mapping_rows(a65b12506e91f2,['implication-implies']).
xc_direction(a65b12506e91f2,':BACKWARD').
xc_monotonicity(a65b12506e91f2,':DEFAULT').
xc_creator(a65b12506e91f2,'Meyer').
xc_creation_date(a65b12506e91f2,19990512).
x_exportsThrough(x_Iraq,x_CollectionSubsetFn(x_TangibleProduct,x_TheSetOf(V1,x_thereExists(V2,x_exportsThrough(x_Iraq,V1,V2)))),x_PersianGulf) :- x_cid(a65b12506e91f3,V1,V2).
xc_microtheory(a65b12506e91f3,x_HPKBCrisisMt).
xc_source_file(a65b12506e91f3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91f3,2569).
xc_kb_names(a65b12506e91f3,["?OBJ","?WATERWAY"]).
xc_mapping_rows(a65b12506e91f3,['exists-thereexists']).
xc_direction(a65b12506e91f3,':FORWARD').
xc_monotonicity(a65b12506e91f3,':DEFAULT').
xc_creator(a65b12506e91f3,'Meyer').
xc_creation_date(a65b12506e91f3,19990512).
x_exportsThrough(x_Iraq,x_PetroleumProduct,x_PersianGulf) :- x_cid(a65b12506e91f4).
xc_microtheory(a65b12506e91f4,x_HPKBCrisisMt).
xc_source_file(a65b12506e91f4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91f4,2580).
xc_kb_names(a65b12506e91f4,[]).
xc_mapping_rows(a65b12506e91f4,[]).
xc_direction(a65b12506e91f4,':FORWARD').
xc_monotonicity(a65b12506e91f4,':DEFAULT').
xc_creator(a65b12506e91f4,'Meyer').
xc_creation_date(a65b12506e91f4,19990512).
x_implies(x_and(x_genls(V1,V2),x_qualifierSubsumes(V3,V4),x_different(x_CollectionQualificationFn(V2,V3),x_CollectionQualificationFn(V1,V4))),x_genls(x_CollectionQualificationFn(V1,V4),x_CollectionQualificationFn(V2,V3))) :- x_cid(a65b12506e91f5,V1,V2,V3,V4).
xc_microtheory(a65b12506e91f5,x_HPKBCrisisMt).
xc_source_file(a65b12506e91f5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91f5,2586).
xc_kb_names(a65b12506e91f5,["?SPEC-COL","?GENL-COL","?GENL-QUAL","?SPEC-QUAL"]).
xc_mapping_rows(a65b12506e91f5,['implication-implies']).
xc_direction(a65b12506e91f5,':FORWARD').
xc_monotonicity(a65b12506e91f5,':DEFAULT').
xc_creator(a65b12506e91f5,'Schwartz').
xc_creation_date(a65b12506e91f5,19990512).
x_actionTypeCategory(x_CollectionQualificationFn('x_Patrolling-Military',x_OfFn(x_CaspianSea)),x_Military) :- x_cid(a65b12506e91f6).
xc_microtheory(a65b12506e91f6,x_HPKBCrisisMt).
xc_source_file(a65b12506e91f6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91f6,2601).
xc_kb_names(a65b12506e91f6,[]).
xc_mapping_rows(a65b12506e91f6,[]).
xc_direction(a65b12506e91f6,':FORWARD').
xc_monotonicity(a65b12506e91f6,':MONOTONIC').
xc_creator(a65b12506e91f6,'Veale').
xc_creation_date(a65b12506e91f6,19990510).
x_positiveVestedInterest(x_Libya,x_SouthernRegionFn(x_EasternRegionFn(x_Algeria))) :- x_cid(a65b12506e91f7).
xc_microtheory(a65b12506e91f7,x_HPKBCrisisMt).
xc_source_file(a65b12506e91f7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91f7,2609).
xc_kb_names(a65b12506e91f7,[]).
xc_mapping_rows(a65b12506e91f7,[]).
xc_direction(a65b12506e91f7,':FORWARD').
xc_monotonicity(a65b12506e91f7,':DEFAULT').
x_positiveVestedInterest(x_Algeria,x_SouthernRegionFn(x_EasternRegionFn(x_Algeria))) :- x_cid(a65b12506e91f8).
xc_microtheory(a65b12506e91f8,x_HPKBCrisisMt).
xc_source_file(a65b12506e91f8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91f8,2617).
xc_kb_names(a65b12506e91f8,[]).
xc_mapping_rows(a65b12506e91f8,[]).
xc_direction(a65b12506e91f8,':FORWARD').
xc_monotonicity(a65b12506e91f8,':DEFAULT').
x_positiveVestedInterest(x_Libya,x_NorthernRegionFn(x_Niger)) :- x_cid(a65b12506e91f9).
xc_microtheory(a65b12506e91f9,x_HPKBCrisisMt).
xc_source_file(a65b12506e91f9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91f9,2625).
xc_kb_names(a65b12506e91f9,[]).
xc_mapping_rows(a65b12506e91f9,[]).
xc_direction(a65b12506e91f9,':FORWARD').
xc_monotonicity(a65b12506e91f9,':DEFAULT').
x_positiveVestedInterest(x_Niger,x_NorthernRegionFn(x_Niger)) :- x_cid(a65b12506e91fa).
xc_microtheory(a65b12506e91fa,x_HPKBCrisisMt).
xc_source_file(a65b12506e91fa,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91fa,2632).
xc_kb_names(a65b12506e91fa,[]).
xc_mapping_rows(a65b12506e91fa,[]).
xc_direction(a65b12506e91fa,':FORWARD').
xc_monotonicity(a65b12506e91fa,':DEFAULT').
x_positiveVestedInterest(x_Libya,x_MaritimeClaimFn(x_Tunisia)) :- x_cid(a65b12506e91fb).
xc_microtheory(a65b12506e91fb,x_HPKBCrisisMt).
xc_source_file(a65b12506e91fb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91fb,2639).
xc_kb_names(a65b12506e91fb,[]).
xc_mapping_rows(a65b12506e91fb,[]).
xc_direction(a65b12506e91fb,':FORWARD').
xc_monotonicity(a65b12506e91fb,':DEFAULT').
x_positiveVestedInterest(x_Tunisia,x_MaritimeClaimFn(x_Tunisia)) :- x_cid(a65b12506e91fc).
xc_microtheory(a65b12506e91fc,x_HPKBCrisisMt).
xc_source_file(a65b12506e91fc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91fc,2646).
xc_kb_names(a65b12506e91fc,[]).
xc_mapping_rows(a65b12506e91fc,[]).
xc_direction(a65b12506e91fc,':FORWARD').
xc_monotonicity(a65b12506e91fc,':DEFAULT').
x_positiveVestedInterest(x_Azerbaijan,'x_Nagorno-Karabakh') :- x_cid(a65b12506e91fd).
xc_microtheory(a65b12506e91fd,x_HPKBCrisisMt).
xc_source_file(a65b12506e91fd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91fd,2653).
xc_kb_names(a65b12506e91fd,[]).
xc_mapping_rows(a65b12506e91fd,[]).
xc_direction(a65b12506e91fd,':FORWARD').
xc_monotonicity(a65b12506e91fd,':DEFAULT').
x_positiveVestedInterest(x_Armenia,'x_Nagorno-Karabakh') :- x_cid(a65b12506e91fe).
xc_microtheory(a65b12506e91fe,x_HPKBCrisisMt).
xc_source_file(a65b12506e91fe,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91fe,2659).
xc_kb_names(a65b12506e91fe,[]).
xc_mapping_rows(a65b12506e91fe,[]).
xc_direction(a65b12506e91fe,':FORWARD').
xc_monotonicity(a65b12506e91fe,':DEFAULT').
x_implies(x_and(x_isa(V1,x_TerritorialDispute),x_territoryDisputed(V1,V2),x_opponentsInConflict(V3,V4,V1)),x_positiveVestedInterest(V3,V2)) :- x_cid(a65b12506e91ff,V1,V2,V3,V4).
xc_microtheory(a65b12506e91ff,x_HPKBCrisisMt).
xc_source_file(a65b12506e91ff,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e91ff,2665).
xc_kb_names(a65b12506e91ff,["?DISPUTE","?REGION","?OPPONENT-1","?OPPONENT-2"]).
xc_mapping_rows(a65b12506e91ff,['implication-implies']).
xc_direction(a65b12506e91ff,':FORWARD').
xc_monotonicity(a65b12506e91ff,':DEFAULT').
xc_creator(a65b12506e91ff,'Watson').
xc_creation_date(a65b12506e91ff,19990510).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_hasBeliefSystems(V1,V2)),x_goalCategoryForAgent(V1,x_forAll(V3,x_implies(x_isa(V3,x_IndependentCountry),x_thereExists(V4,x_increasesCausally(V4,x_TheSetOf(V5,x_and(x_isa(V5,x_CitizensFn(V3)),x_isa(V5,x_BelieverFn(V2)))),x_entityCardinality)))),x_ActionGuidingIdeology)) :- x_cid(a65b12506e9200,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9200,x_HPKBCrisisMt).
xc_source_file(a65b12506e9200,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9200,2676).
xc_kb_names(a65b12506e9200,["?COUNTRY","?SYSTEM","?NATION","?EVENT","?PERSON"]).
xc_mapping_rows(a65b12506e9200,['implication-implies','forall-forall','implication-implies','exists-thereexists']).
xc_direction(a65b12506e9200,':BACKWARD').
xc_monotonicity(a65b12506e9200,':DEFAULT').
xc_creator(a65b12506e9200,'Watson').
xc_creation_date(a65b12506e9200,19990507).
x_exceptWhen(x_affiliatedWith(V1,V2),x_implies(x_and(x_isa(V3,x_MilitaryOccupation),x_isa(V4,x_GeographicalRegion),x_performedBy(V3,V2),x_objectActedOn(V3,V4),x_positiveVestedInterest(V1,V4),x_different(V1,V2)),x_maleficiary(V3,V1))) :- x_cid(a65b12506e9201,V1,V2,V3,V4).
xc_microtheory(a65b12506e9201,x_HPKBCrisisMt).
xc_source_file(a65b12506e9201,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9201,2699).
xc_kb_names(a65b12506e9201,["?AGENT","?OCCUPIER","?OCCUPATION","?REGION"]).
xc_mapping_rows(a65b12506e9201,['implication-implies']).
xc_direction(a65b12506e9201,':BACKWARD').
xc_monotonicity(a65b12506e9201,':DEFAULT').
xc_creator(a65b12506e9201,'Watson').
xc_creation_date(a65b12506e9201,19990507).
x_implies(x_and(x_isa(V1,x_MilitaryOccupation),x_objectActedOn(V1,V2),x_isa(V2,x_GeographicalRegion),x_performedBy(V1,V3),x_positiveVestedInterest(V4,V2),x_different(V4,V3)),x_maleficiary(V1,V4)) :- x_cid(a65b12506e9202,V1,V2,V3,V4).
xc_microtheory(a65b12506e9202,x_HPKBCrisisMt).
xc_source_file(a65b12506e9202,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9202,2715).
xc_kb_names(a65b12506e9202,["?OCCUPATION","?REGION","?OCCUPIER","?AGENT"]).
xc_mapping_rows(a65b12506e9202,['implication-implies']).
xc_direction(a65b12506e9202,':BACKWARD').
xc_monotonicity(a65b12506e9202,':DEFAULT').
xc_creator(a65b12506e9202,'Watson').
xc_creation_date(a65b12506e9202,19990507).
'x_fosters-ActionTypeSitType'(x_Azerbaijan,x_CollectionQualificationFn(x_MakingAnAgreement,x_ForFn(x_ConstructionFn(x_OfFn(x_InfrastructureFn(x_ForFn(x_IndustryFn(x_PetroleumProduct)),x_OfFn(x_Azerbaijan)))))),x_CollectionQualificationFn(x_DevelopmentEvent,x_OfFn(x_BusinessConnectionFn(x_WithFn(x_Iran))))) :- x_cid(a65b12506e9203).
xc_microtheory(a65b12506e9203,x_HPKBCrisisMt).
xc_source_file(a65b12506e9203,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9203,2729).
xc_kb_names(a65b12506e9203,[]).
xc_mapping_rows(a65b12506e9203,[]).
xc_direction(a65b12506e9203,':FORWARD').
xc_monotonicity(a65b12506e9203,':DEFAULT').
xc_creator(a65b12506e9203,'Schwartz').
xc_creation_date(a65b12506e9203,19990416).
x_behaviorCapable(x_Azerbaijan,x_CollectionQualificationFn(x_MakingAnAgreement,x_ForFn(x_ConstructionFn(x_OfFn(x_InfrastructureFn(x_ForFn(x_IndustryFn(x_PetroleumProduct)),x_OfFn(x_Azerbaijan)))))),x_performedBy) :- x_cid(a65b12506e9204).
xc_microtheory(a65b12506e9204,x_HPKBCrisisMt).
xc_source_file(a65b12506e9204,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9204,2747).
xc_kb_names(a65b12506e9204,[]).
xc_mapping_rows(a65b12506e9204,[]).
xc_direction(a65b12506e9204,':FORWARD').
xc_monotonicity(a65b12506e9204,':DEFAULT').
xc_creator(a65b12506e9204,'Schwartz').
xc_creation_date(a65b12506e9204,19990416).
x_actionTypeCategory(x_CollectionQualificationFn(x_MakingAnAgreement,x_ForFn(x_ConstructionFn(x_OfFn(x_InfrastructureFn(x_ForFn(x_IndustryFn(x_PetroleumProduct)),x_OfFn(x_Azerbaijan)))))),x_Political) :- x_cid(a65b12506e9205).
xc_microtheory(a65b12506e9205,x_HPKBCrisisMt).
xc_source_file(a65b12506e9205,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9205,2761).
xc_kb_names(a65b12506e9205,[]).
xc_mapping_rows(a65b12506e9205,[]).
xc_direction(a65b12506e9205,':FORWARD').
xc_monotonicity(a65b12506e9205,':DEFAULT').
xc_creator(a65b12506e9205,'Schwartz').
xc_creation_date(a65b12506e9205,19990416).
x_actionTypeCategory(x_CollectionQualificationFn(x_MakingAnAgreement,x_ForFn(x_ConstructionFn(x_OfFn(x_InfrastructureFn)))),x_Political) :- x_cid(a65b12506e9206).
xc_microtheory(a65b12506e9206,x_HPKBCrisisMt).
xc_source_file(a65b12506e9206,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9206,2775).
xc_kb_names(a65b12506e9206,[]).
xc_mapping_rows(a65b12506e9206,[]).
xc_direction(a65b12506e9206,':FORWARD').
xc_monotonicity(a65b12506e9206,':DEFAULT').
xc_creator(a65b12506e9206,'Schwartz').
xc_creation_date(a65b12506e9206,19990416).
'x_fosters-ActionTypeSitType'(x_Russia,x_CollectionQualificationFn(x_CollectionQualificationFn('x_Patrolling-LawEnforcement',x_OfFn(x_CaspianSea)),x_ForFn(x_Iran)),x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn(x_CommitmentFn(x_MilitarySC,x_ToFn(x_Iran))))) :- x_cid(a65b12506e9207).
xc_microtheory(a65b12506e9207,x_HPKBCrisisMt).
xc_source_file(a65b12506e9207,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9207,2786).
xc_kb_names(a65b12506e9207,[]).
xc_mapping_rows(a65b12506e9207,[]).
xc_direction(a65b12506e9207,':BACKWARD').
xc_monotonicity(a65b12506e9207,':DEFAULT').
'x_fosters-SitTypeSitType'(x_CollectionQualificationFn(x_IncreaseEvent,x_OfFn(x_SecurityFn(x_RegionalSC,x_OfFn(x_Iran)))),x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn(x_CommitmentFn(x_MilitarySC,x_ToFn(x_Iran))))) :- x_cid(a65b12506e9208).
xc_microtheory(a65b12506e9208,x_HPKBCrisisMt).
xc_source_file(a65b12506e9208,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9208,2800).
xc_kb_names(a65b12506e9208,[]).
xc_mapping_rows(a65b12506e9208,[]).
xc_direction(a65b12506e9208,':FORWARD').
xc_monotonicity(a65b12506e9208,':DEFAULT').
xc_creator(a65b12506e9208,'Schwartz').
xc_creation_date(a65b12506e9208,19990416).
'x_fosters-ActionTypeSitType'(x_Russia,x_CollectionQualificationFn(x_CollectionQualificationFn('x_Patrolling-LawEnforcement',x_OfFn(x_CaspianSea)),x_ForFn(x_Iran)),x_CollectionQualificationFn(x_IncreaseEvent,x_OfFn(x_SecurityFn(x_RegionalSC,x_OfFn(x_Iran))))) :- x_cid(a65b12506e9209).
xc_microtheory(a65b12506e9209,x_HPKBCrisisMt).
xc_source_file(a65b12506e9209,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9209,2814).
xc_kb_names(a65b12506e9209,[]).
xc_mapping_rows(a65b12506e9209,[]).
xc_direction(a65b12506e9209,':FORWARD').
xc_monotonicity(a65b12506e9209,':DEFAULT').
xc_creator(a65b12506e9209,'Schwartz').
xc_creation_date(a65b12506e9209,19990416).
x_actionTypeCategory(x_CollectionQualificationFn(x_CollectionQualificationFn('x_Patrolling-LawEnforcement',x_OfFn(x_CaspianSea)),x_ForFn(x_Iran)),x_Military) :- x_cid(a65b12506e920a).
xc_microtheory(a65b12506e920a,x_HPKBCrisisMt).
xc_source_file(a65b12506e920a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e920a,2828).
xc_kb_names(a65b12506e920a,[]).
xc_mapping_rows(a65b12506e920a,[]).
xc_direction(a65b12506e920a,':BACKWARD').
xc_monotonicity(a65b12506e920a,':DEFAULT').
x_behaviorCapable(x_Russia,x_CollectionQualificationFn(x_CollectionQualificationFn('x_Patrolling-LawEnforcement',x_OfFn(x_CaspianSea)),x_ForFn(x_Iran)),x_performedBy) :- x_cid(a65b12506e920b).
xc_microtheory(a65b12506e920b,x_HPKBCrisisMt).
xc_source_file(a65b12506e920b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e920b,2838).
xc_kb_names(a65b12506e920b,[]).
xc_mapping_rows(a65b12506e920b,[]).
xc_direction(a65b12506e920b,':FORWARD').
xc_monotonicity(a65b12506e920b,':DEFAULT').
xc_creator(a65b12506e920b,'Schwartz').
xc_creation_date(a65b12506e920b,19990416).
x_actionTypeCategory(x_CollectionQualificationFn('x_Patrolling-LawEnforcement',x_OfFn(x_CaspianSea)),x_Military) :- x_cid(a65b12506e920c).
xc_microtheory(a65b12506e920c,x_HPKBCrisisMt).
xc_source_file(a65b12506e920c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e920c,2848).
xc_kb_names(a65b12506e920c,[]).
xc_mapping_rows(a65b12506e920c,[]).
xc_direction(a65b12506e920c,':FORWARD').
xc_monotonicity(a65b12506e920c,':DEFAULT').
xc_creator(a65b12506e920c,'Schwartz').
xc_creation_date(a65b12506e920c,19990416).
'x_fosters-ActionTypeSitType'(x_Russia,x_CollectionQualificationFn(x_ProvidingTechnologicalAssistance,x_ToFn(x_ArmyFn(x_Iran))),x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn(x_CommitmentFn(x_MilitarySC,x_ToFn(x_Iran))))) :- x_cid(a65b12506e920d).
xc_microtheory(a65b12506e920d,x_HPKBCrisisMt).
xc_source_file(a65b12506e920d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e920d,2856).
xc_kb_names(a65b12506e920d,[]).
xc_mapping_rows(a65b12506e920d,[]).
xc_direction(a65b12506e920d,':BACKWARD').
xc_monotonicity(a65b12506e920d,':DEFAULT').
'x_fosters-SitTypeSitType'(x_CollectionQualificationFn(x_IncreaseEvent,x_OfFn(x_CapacityFn(x_DefenseSC,x_OfFn(x_Iran)))),x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn(x_CommitmentFn(x_MilitarySC,x_ToFn(x_Iran))))) :- x_cid(a65b12506e920e).
xc_microtheory(a65b12506e920e,x_HPKBCrisisMt).
xc_source_file(a65b12506e920e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e920e,2869).
xc_kb_names(a65b12506e920e,[]).
xc_mapping_rows(a65b12506e920e,[]).
xc_direction(a65b12506e920e,':FORWARD').
xc_monotonicity(a65b12506e920e,':DEFAULT').
xc_creator(a65b12506e920e,'Schwartz').
xc_creation_date(a65b12506e920e,19990416).
'x_fosters-ActionTypeSitType'(x_Russia,x_CollectionQualificationFn(x_ProvidingTechnologicalAssistance,x_ToFn(x_ArmyFn(x_Iran))),x_CollectionQualificationFn(x_IncreaseEvent,x_OfFn(x_CapacityFn(x_DefenseSC,x_OfFn(x_Iran))))) :- x_cid(a65b12506e920f).
xc_microtheory(a65b12506e920f,x_HPKBCrisisMt).
xc_source_file(a65b12506e920f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e920f,2883).
xc_kb_names(a65b12506e920f,[]).
xc_mapping_rows(a65b12506e920f,[]).
xc_direction(a65b12506e920f,':FORWARD').
xc_monotonicity(a65b12506e920f,':DEFAULT').
xc_creator(a65b12506e920f,'Schwartz').
xc_creation_date(a65b12506e920f,19990416).
x_behaviorCapable(x_Russia,x_CollectionQualificationFn(x_ProvidingTechnologicalAssistance,x_ToFn(x_ArmyFn(x_Iran))),x_performedBy) :- x_cid(a65b12506e9210).
xc_microtheory(a65b12506e9210,x_HPKBCrisisMt).
xc_source_file(a65b12506e9210,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9210,2896).
xc_kb_names(a65b12506e9210,[]).
xc_mapping_rows(a65b12506e9210,[]).
xc_direction(a65b12506e9210,':FORWARD').
xc_monotonicity(a65b12506e9210,':DEFAULT').
xc_creator(a65b12506e9210,'Schwartz').
xc_creation_date(a65b12506e9210,19990416).
x_actionTypeCategory(x_CollectionQualificationFn(x_ProvidingTechnologicalAssistance,x_ToFn(x_ArmyFn(x_Iran))),x_Military) :- x_cid(a65b12506e9211).
xc_microtheory(a65b12506e9211,x_HPKBCrisisMt).
xc_source_file(a65b12506e9211,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9211,2905).
xc_kb_names(a65b12506e9211,[]).
xc_mapping_rows(a65b12506e9211,[]).
xc_direction(a65b12506e9211,':FORWARD').
xc_monotonicity(a65b12506e9211,':DEFAULT').
xc_creator(a65b12506e9211,'Schwartz').
xc_creation_date(a65b12506e9211,19990416).
'x_fosters-ActionTypeSitType'(x_UnitedStatesOfAmerica,x_CollectionQualificationFn(x_ProvidingTechnologicalAssistance,x_ToFn(x_Azerbaijan)),x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn(x_CommitmentFn(x_EconomicSC,x_ToFn(x_Azerbaijan))))) :- x_cid(a65b12506e9212).
xc_microtheory(a65b12506e9212,x_HPKBCrisisMt).
xc_source_file(a65b12506e9212,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9212,2914).
xc_kb_names(a65b12506e9212,[]).
xc_mapping_rows(a65b12506e9212,[]).
xc_direction(a65b12506e9212,':BACKWARD').
xc_monotonicity(a65b12506e9212,':DEFAULT').
'x_fosters-ActionTypeSitType'(x_UnitedStatesOfAmerica,x_CollectionQualificationFn(x_ProvidingTechnologicalAssistance,x_ToFn(x_Azerbaijan)),x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn(x_EconomyFn(x_Azerbaijan)))) :- x_cid(a65b12506e9213).
xc_microtheory(a65b12506e9213,x_HPKBCrisisMt).
xc_source_file(a65b12506e9213,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9213,2926).
xc_kb_names(a65b12506e9213,[]).
xc_mapping_rows(a65b12506e9213,[]).
xc_direction(a65b12506e9213,':BACKWARD').
xc_monotonicity(a65b12506e9213,':DEFAULT').
'x_fosters-ActionTypeSitType'(x_UnitedStatesOfAmerica,x_CollectionQualificationFn(x_GrantingMostFavoredNationStatus,x_ToFn(x_Azerbaijan)),x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn(x_CommitmentFn(x_EconomicSC,x_ToFn(x_Azerbaijan))))) :- x_cid(a65b12506e9214).
xc_microtheory(a65b12506e9214,x_HPKBCrisisMt).
xc_source_file(a65b12506e9214,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9214,2937).
xc_kb_names(a65b12506e9214,[]).
xc_mapping_rows(a65b12506e9214,[]).
xc_direction(a65b12506e9214,':BACKWARD').
xc_monotonicity(a65b12506e9214,':DEFAULT').
'x_fosters-ActionTypeSitType'(x_UnitedStatesOfAmerica,x_CollectionQualificationFn(x_GrantingMostFavoredNationStatus,x_ToFn(x_Azerbaijan)),x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn(x_EconomyFn(x_Azerbaijan)))) :- x_cid(a65b12506e9215).
xc_microtheory(a65b12506e9215,x_HPKBCrisisMt).
xc_source_file(a65b12506e9215,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9215,2949).
xc_kb_names(a65b12506e9215,[]).
xc_mapping_rows(a65b12506e9215,[]).
xc_direction(a65b12506e9215,':BACKWARD').
xc_monotonicity(a65b12506e9215,':DEFAULT').
'x_fosters-ActionTypeSitType'(x_UnitedStatesOfAmerica,x_CollectionQualificationFn(x_MakingATradeAgreement,x_WithFn(x_Azerbaijan)),x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn(x_CommitmentFn(x_EconomicSC,x_ToFn(x_Azerbaijan))))) :- x_cid(a65b12506e9216).
xc_microtheory(a65b12506e9216,x_HPKBCrisisMt).
xc_source_file(a65b12506e9216,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9216,2960).
xc_kb_names(a65b12506e9216,[]).
xc_mapping_rows(a65b12506e9216,[]).
xc_direction(a65b12506e9216,':BACKWARD').
xc_monotonicity(a65b12506e9216,':DEFAULT').
'x_fosters-ActionTypeSitType'(x_UnitedStatesOfAmerica,x_CollectionQualificationFn(x_MakingATradeAgreement,x_WithFn(x_Azerbaijan)),x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn(x_EconomyFn(x_Azerbaijan)))) :- x_cid(a65b12506e9217).
xc_microtheory(a65b12506e9217,x_HPKBCrisisMt).
xc_source_file(a65b12506e9217,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9217,2972).
xc_kb_names(a65b12506e9217,[]).
xc_mapping_rows(a65b12506e9217,[]).
xc_direction(a65b12506e9217,':BACKWARD').
xc_monotonicity(a65b12506e9217,':DEFAULT').
'x_fosters-SitTypeSitType'(x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn('x_Relations-InteractionFn'(x_TradeSC,x_BetweenFn(x_UnitedStatesOfAmerica,x_Azerbaijan)))),x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn(x_EconomyFn(x_Azerbaijan)))) :- x_cid(a65b12506e9218).
xc_microtheory(a65b12506e9218,x_HPKBCrisisMt).
xc_source_file(a65b12506e9218,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9218,2983).
xc_kb_names(a65b12506e9218,[]).
xc_mapping_rows(a65b12506e9218,[]).
xc_direction(a65b12506e9218,':BACKWARD').
xc_monotonicity(a65b12506e9218,':DEFAULT').
x_implies(x_isa(V1,x_GeopoliticalEntity),'x_fosters-SitTypeSitType'(x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn('x_Relations-InteractionFn'(x_TradeSC,x_BetweenFn(V2,V1)))),x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn(x_EconomyFn(V1))))) :- x_cid(a65b12506e9219,V1,V2).
xc_microtheory(a65b12506e9219,x_HPKBCrisisMt).
xc_source_file(a65b12506e9219,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9219,2996).
xc_kb_names(a65b12506e9219,["?ENTITY","?AGENT"]).
xc_mapping_rows(a65b12506e9219,['implication-implies']).
xc_direction(a65b12506e9219,':BACKWARD').
xc_monotonicity(a65b12506e9219,':DEFAULT').
xc_creator(a65b12506e9219,'Schwartz').
xc_creation_date(a65b12506e9219,19990416).
x_implies(x_and(x_isa(V1,x_GeopoliticalEntity),x_isa(V2,x_GeopoliticalEntity)),'x_fosters-ActionTypeSitType'(V1,x_CollectionQualificationFn(x_ProvidingTechnologicalAssistance,x_ToFn(V2)),x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn(x_EconomyFn(V2))))) :- x_cid(a65b12506e921a,V1,V2).
xc_microtheory(a65b12506e921a,x_HPKBCrisisMt).
xc_source_file(a65b12506e921a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e921a,3011).
xc_kb_names(a65b12506e921a,["?ENTITY1","?ENTITY2"]).
xc_mapping_rows(a65b12506e921a,['implication-implies']).
xc_direction(a65b12506e921a,':BACKWARD').
xc_monotonicity(a65b12506e921a,':DEFAULT').
xc_creator(a65b12506e921a,'Schwartz').
xc_creation_date(a65b12506e921a,19990416).
x_implies(x_and(x_different(V1,V2),'x_fosters-ActionTypeSitType'(V1,V3,x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn(x_EconomyFn(V2))))),'x_fosters-ActionTypeSitType'(V1,V3,x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn(x_CommitmentFn(x_EconomicSC,x_ToFn(V2)))))) :- x_cid(a65b12506e921b,V1,V2,V3).
xc_microtheory(a65b12506e921b,x_HPKBCrisisMt).
xc_source_file(a65b12506e921b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e921b,3026).
xc_kb_names(a65b12506e921b,["?AGENT1","?AGENT2","?ACTION-TYPE"]).
xc_mapping_rows(a65b12506e921b,['implication-implies']).
xc_direction(a65b12506e921b,':BACKWARD').
xc_monotonicity(a65b12506e921b,':DEFAULT').
xc_creator(a65b12506e921b,'Schwartz').
xc_creation_date(a65b12506e921b,19990416).
x_implies(x_isa(V1,x_TerroristGroup),x_goalCategoryForAgent(V1,x_relationExistsInstance(x_beneficiary,x_ProvidingTechnologicalAssistance,V1),x_StrategicInterest)) :- x_cid(a65b12506e921c,V1).
xc_microtheory(a65b12506e921c,x_HPKBCrisisMt).
xc_source_file(a65b12506e921c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e921c,3043).
xc_kb_names(a65b12506e921c,["?TERRORIST"]).
xc_mapping_rows(a65b12506e921c,['implication-implies']).
xc_direction(a65b12506e921c,':BACKWARD').
xc_monotonicity(a65b12506e921c,':DEFAULT').
xc_creator(a65b12506e921c,'Watson').
xc_creation_date(a65b12506e921c,19990416).
x_goals(x_Libya,x_not(x_thereExists(V1,x_and(x_isa(V1,x_ImposingSanctions),x_maleficiary(V1,x_Libya))))) :- x_cid(a65b12506e921d,V1).
xc_microtheory(a65b12506e921d,x_HPKBCrisisMt).
xc_source_file(a65b12506e921d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e921d,3052).
xc_kb_names(a65b12506e921d,["?SANCTION"]).
xc_mapping_rows(a65b12506e921d,['exists-thereexists']).
xc_direction(a65b12506e921d,':FORWARD').
xc_monotonicity(a65b12506e921d,':DEFAULT').
x_goalCategoryForAgent(x_Libya,x_not(x_thereExists(V1,x_and(x_isa(V1,x_ImposingSanctions),x_maleficiary(V1,x_Libya)))),x_StrategicNationalInterest) :- x_cid(a65b12506e921e,V1).
xc_microtheory(a65b12506e921e,x_HPKBCrisisMt).
xc_source_file(a65b12506e921e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e921e,3064).
xc_kb_names(a65b12506e921e,["?SANCTION"]).
xc_mapping_rows(a65b12506e921e,['exists-thereexists']).
xc_direction(a65b12506e921e,':FORWARD').
xc_monotonicity(a65b12506e921e,':DEFAULT').
x_implies(x_and('x_fosters-SitTypeSitType'(V1,V2),'x_fosters-SitTypeSitType'(V2,V3)),'x_fosters-SitTypeSitType'(V1,V3)) :- x_cid(a65b12506e921f,V1,V2,V3).
xc_microtheory(a65b12506e921f,x_HPKBCrisisMt).
xc_source_file(a65b12506e921f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e921f,3076).
xc_kb_names(a65b12506e921f,["?SIT-TYPE1","?SIT-TYPE2","?SIT-TYPE3"]).
xc_mapping_rows(a65b12506e921f,['implication-implies']).
xc_direction(a65b12506e921f,':BACKWARD').
xc_monotonicity(a65b12506e921f,':DEFAULT').
xc_creator(a65b12506e921f,'Schwartz').
xc_creation_date(a65b12506e921f,19990416).
x_implies(x_and('x_causes-SitTypeSitType'(V1,V2),'x_causes-SitTypeSitType'(V2,V3)),'x_causes-SitTypeSitType'(V1,V3)) :- x_cid(a65b12506e9220,V1,V2,V3).
xc_microtheory(a65b12506e9220,x_HPKBCrisisMt).
xc_source_file(a65b12506e9220,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9220,3086).
xc_kb_names(a65b12506e9220,["?CAUSE","?SIT-TYPE","?EFFECT"]).
xc_mapping_rows(a65b12506e9220,['implication-implies']).
xc_direction(a65b12506e9220,':BACKWARD').
xc_monotonicity(a65b12506e9220,':DEFAULT').
xc_creator(a65b12506e9220,'Schwartz').
xc_creation_date(a65b12506e9220,19990416).
x_implies(x_isa(x_GovernmentFn(V1),x_RegionalGovernment),x_hasAttributes(x_GovernmentFn(V1),'x_Interest-ValueFn'(x_InFn('x_Well-BeingFn'(x_CitizensFn(V1)))))) :- x_cid(a65b12506e9221,V1).
xc_microtheory(a65b12506e9221,x_HPKBCrisisMt).
xc_source_file(a65b12506e9221,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9221,3096).
xc_kb_names(a65b12506e9221,["?COUNTRY"]).
xc_mapping_rows(a65b12506e9221,['implication-implies']).
xc_direction(a65b12506e9221,':BACKWARD').
xc_monotonicity(a65b12506e9221,':DEFAULT').
xc_creator(a65b12506e9221,'JulieF').
xc_creation_date(a65b12506e9221,19990416).
x_implies(x_isa(V1,x_IndependentCountry),x_isa(x_GovernmentFn(V1),x_RegionalGovernment)) :- x_cid(a65b12506e9222,V1).
xc_microtheory(a65b12506e9222,x_HPKBCrisisMt).
xc_source_file(a65b12506e9222,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9222,3110).
xc_kb_names(a65b12506e9222,["?COUNTRY"]).
xc_mapping_rows(a65b12506e9222,['implication-implies']).
xc_direction(a65b12506e9222,':BACKWARD').
xc_monotonicity(a65b12506e9222,':DEFAULT').
xc_creator(a65b12506e9222,'JulieF').
xc_creation_date(a65b12506e9222,19990416).
x_behaviorCapable(x_UnitedStatesOfAmerica,x_CollectionQualificationFn(x_ProvidingTechnologicalAssistance,x_ToFn(x_Azerbaijan)),x_performedBy) :- x_cid(a65b12506e9223).
xc_microtheory(a65b12506e9223,x_HPKBCrisisMt).
xc_source_file(a65b12506e9223,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9223,3119).
xc_kb_names(a65b12506e9223,[]).
xc_mapping_rows(a65b12506e9223,[]).
xc_direction(a65b12506e9223,':BACKWARD').
xc_monotonicity(a65b12506e9223,':DEFAULT').
x_behaviorCapable(x_UnitedStatesOfAmerica,x_CollectionQualificationFn(x_GrantingMostFavoredNationStatus,x_ToFn(x_Azerbaijan)),x_performedBy) :- x_cid(a65b12506e9224).
xc_microtheory(a65b12506e9224,x_HPKBCrisisMt).
xc_source_file(a65b12506e9224,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9224,3127).
xc_kb_names(a65b12506e9224,[]).
xc_mapping_rows(a65b12506e9224,[]).
xc_direction(a65b12506e9224,':BACKWARD').
xc_monotonicity(a65b12506e9224,':DEFAULT').
x_behaviorCapable(x_UnitedStatesOfAmerica,x_CollectionQualificationFn(x_MakingATradeAgreement,x_WithFn(x_Azerbaijan)),x_performedBy) :- x_cid(a65b12506e9225).
xc_microtheory(a65b12506e9225,x_HPKBCrisisMt).
xc_source_file(a65b12506e9225,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9225,3135).
xc_kb_names(a65b12506e9225,[]).
xc_mapping_rows(a65b12506e9225,[]).
xc_direction(a65b12506e9225,':BACKWARD').
xc_monotonicity(a65b12506e9225,':DEFAULT').
x_implies(x_and(x_isa(V1,x_IndustrializedCountry),x_isa(V2,x_Agent)),x_behaviorCapable(V1,x_CollectionQualificationFn(x_ProvidingTechnologicalAssistance,x_ToFn(V2)),x_performedBy)) :- x_cid(a65b12506e9226,V1,V2).
xc_microtheory(a65b12506e9226,x_HPKBCrisisMt).
xc_source_file(a65b12506e9226,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9226,3143).
xc_kb_names(a65b12506e9226,["?COUNTRY","?AGENT"]).
xc_mapping_rows(a65b12506e9226,['implication-implies']).
xc_direction(a65b12506e9226,':BACKWARD').
xc_monotonicity(a65b12506e9226,':DEFAULT').
xc_creator(a65b12506e9226,'Schwartz').
xc_creation_date(a65b12506e9226,19990415).
x_implies(x_and(x_isa(V1,x_Country),x_isa(V2,x_Country)),x_behaviorCapable(V1,x_CollectionQualificationFn(x_GrantingMostFavoredNationStatus,x_ToFn(V2)),x_performedBy)) :- x_cid(a65b12506e9227,V1,V2).
xc_microtheory(a65b12506e9227,x_HPKBCrisisMt).
xc_source_file(a65b12506e9227,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9227,3155).
xc_kb_names(a65b12506e9227,["?COUNTRY1","?COUNTRY2"]).
xc_mapping_rows(a65b12506e9227,['implication-implies']).
xc_direction(a65b12506e9227,':BACKWARD').
xc_monotonicity(a65b12506e9227,':DEFAULT').
xc_creator(a65b12506e9227,'Schwartz').
xc_creation_date(a65b12506e9227,19990415).
x_implies(x_and(x_isa(V1,x_Country),x_isa(V2,x_Country)),x_behaviorCapable(V1,x_CollectionQualificationFn(x_MakingATradeAgreement,x_WithFn(V2)),x_performedBy)) :- x_cid(a65b12506e9228,V1,V2).
xc_microtheory(a65b12506e9228,x_HPKBCrisisMt).
xc_source_file(a65b12506e9228,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9228,3167).
xc_kb_names(a65b12506e9228,["?COUNTRY1","?COUNTRY2"]).
xc_mapping_rows(a65b12506e9228,['implication-implies']).
xc_direction(a65b12506e9228,':BACKWARD').
xc_monotonicity(a65b12506e9228,':DEFAULT').
xc_creator(a65b12506e9228,'Schwartz').
xc_creation_date(a65b12506e9228,19990415).
x_implies(x_isa(V1,x_HumanRightsOrganization),x_goalCategoryForAgent(V1,x_not(x_relationExistsExists(x_maleficiary,x_GenocideCampaign,x_Agent)),x_ActionGuidingIdeology)) :- x_cid(a65b12506e9229,V1).
xc_microtheory(a65b12506e9229,x_HPKBCrisisMt).
xc_source_file(a65b12506e9229,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9229,3179).
xc_kb_names(a65b12506e9229,["?HUMANITARIAN-ORG"]).
xc_mapping_rows(a65b12506e9229,['implication-implies']).
xc_direction(a65b12506e9229,':BACKWARD').
xc_monotonicity(a65b12506e9229,':DEFAULT').
xc_creator(a65b12506e9229,'Watson').
xc_creation_date(a65b12506e9229,19990415).
x_implies(x_isa(V1,x_HumanRightsOrganization),x_goalCategoryForAgent(V1,x_not(x_relationExistsExists(x_maleficiary,x_Persecution,x_Agent)),x_ActionGuidingIdeology)) :- x_cid(a65b12506e922a,V1).
xc_microtheory(a65b12506e922a,x_HPKBCrisisMt).
xc_source_file(a65b12506e922a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e922a,3189).
xc_kb_names(a65b12506e922a,["?HUMANITARIAN-ORG"]).
xc_mapping_rows(a65b12506e922a,['implication-implies']).
xc_direction(a65b12506e922a,':BACKWARD').
xc_monotonicity(a65b12506e922a,':DEFAULT').
xc_creator(a65b12506e922a,'Watson').
xc_creation_date(a65b12506e922a,19990415).
x_implies(x_and(x_isa(V1,x_IdeologicalOrganization),x_hasBeliefSystems(V1,V2)),x_goalCategoryForAgent(V1,x_not(x_thereExists(V3,x_and(x_relationExistsInstance(x_maleficiary,x_Persecution,V3),x_hasBeliefSystems(V3,V2)))),x_ActionGuidingIdeology)) :- x_cid(a65b12506e922b,V1,V2,V3).
xc_microtheory(a65b12506e922b,x_HPKBCrisisMt).
xc_source_file(a65b12506e922b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e922b,3199).
xc_kb_names(a65b12506e922b,["?IDEO-ORG","?SYSTEM","?FELLOW-BELIEVER"]).
xc_mapping_rows(a65b12506e922b,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e922b,':BACKWARD').
xc_monotonicity(a65b12506e922b,':DEFAULT').
xc_creator(a65b12506e922b,'Watson').
xc_creation_date(a65b12506e922b,19990415).
x_goals(x_Azerbaijan,x_economicStability(x_EconomyFn(x_Azerbaijan),x_HighToVeryHigh)) :- x_cid(a65b12506e922c).
xc_microtheory(a65b12506e922c,x_HPKBCrisisMt).
xc_source_file(a65b12506e922c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e922c,3215).
xc_kb_names(a65b12506e922c,[]).
xc_mapping_rows(a65b12506e922c,[]).
xc_direction(a65b12506e922c,':FORWARD').
xc_monotonicity(a65b12506e922c,':DEFAULT').
x_goalCategoryForAgent(x_Azerbaijan,x_economicStability(x_EconomyFn(x_Azerbaijan),x_HighToVeryHigh),x_StrategicNationalInterest) :- x_cid(a65b12506e922d).
xc_microtheory(a65b12506e922d,x_HPKBCrisisMt).
xc_source_file(a65b12506e922d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e922d,3223).
xc_kb_names(a65b12506e922d,[]).
xc_mapping_rows(a65b12506e922d,[]).
xc_direction(a65b12506e922d,':FORWARD').
xc_monotonicity(a65b12506e922d,':DEFAULT').
x_implies(x_and(x_isa(V1,V2),x_typeBehaviorCapable(V2,V3,V4)),x_behaviorCapable(V1,V3,V4)) :- x_cid(a65b12506e922e,V1,V2,V3,V4).
xc_microtheory(a65b12506e922e,x_HPKBCrisisMt).
xc_source_file(a65b12506e922e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e922e,3231).
xc_kb_names(a65b12506e922e,["?INSTANCE","?COL","?SIT-TYPE","?ROLE"]).
xc_mapping_rows(a65b12506e922e,['implication-implies']).
xc_direction(a65b12506e922e,':BACKWARD').
xc_monotonicity(a65b12506e922e,':DEFAULT').
xc_creator(a65b12506e922e,'Schwartz').
xc_creation_date(a65b12506e922e,19990415).
x_subOrganizations(x_GovernmentFn(x_Iran),x_NavyFn(x_Iran)) :- x_cid(a65b12506e922f).
xc_microtheory(a65b12506e922f,x_HPKBCrisisMt).
xc_source_file(a65b12506e922f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e922f,3241).
xc_kb_names(a65b12506e922f,[]).
xc_mapping_rows(a65b12506e922f,[]).
xc_direction(a65b12506e922f,':FORWARD').
xc_monotonicity(a65b12506e922f,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_UnitedStatesOfAmerica),x_NavyFn(x_UnitedStatesOfAmerica)) :- x_cid(a65b12506e9230).
xc_microtheory(a65b12506e9230,x_HPKBCrisisMt).
xc_source_file(a65b12506e9230,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9230,3249).
xc_kb_names(a65b12506e9230,[]).
xc_mapping_rows(a65b12506e9230,[]).
xc_direction(a65b12506e9230,':FORWARD').
xc_monotonicity(a65b12506e9230,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_Oman),x_NavyFn(x_Oman)) :- x_cid(a65b12506e9231).
xc_microtheory(a65b12506e9231,x_HPKBCrisisMt).
xc_source_file(a65b12506e9231,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9231,3257).
xc_kb_names(a65b12506e9231,[]).
xc_mapping_rows(a65b12506e9231,[]).
xc_direction(a65b12506e9231,':FORWARD').
xc_monotonicity(a65b12506e9231,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_Algeria),x_NavyFn(x_Algeria)) :- x_cid(a65b12506e9232).
xc_microtheory(a65b12506e9232,x_HPKBCrisisMt).
xc_source_file(a65b12506e9232,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9232,3265).
xc_kb_names(a65b12506e9232,[]).
xc_mapping_rows(a65b12506e9232,[]).
xc_direction(a65b12506e9232,':FORWARD').
xc_monotonicity(a65b12506e9232,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_UnitedKingdomOfGreatBritainAndNorthernIreland),x_NavyFn(x_UnitedKingdomOfGreatBritainAndNorthernIreland)) :- x_cid(a65b12506e9233).
xc_microtheory(a65b12506e9233,x_HPKBCrisisMt).
xc_source_file(a65b12506e9233,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9233,3273).
xc_kb_names(a65b12506e9233,[]).
xc_mapping_rows(a65b12506e9233,[]).
xc_direction(a65b12506e9233,':FORWARD').
xc_monotonicity(a65b12506e9233,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_France),x_NavyFn(x_France)) :- x_cid(a65b12506e9234).
xc_microtheory(a65b12506e9234,x_HPKBCrisisMt).
xc_source_file(a65b12506e9234,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9234,3281).
xc_kb_names(a65b12506e9234,[]).
xc_mapping_rows(a65b12506e9234,[]).
xc_direction(a65b12506e9234,':FORWARD').
xc_monotonicity(a65b12506e9234,':DEFAULT').
x_subOrganizations(x_GovernmentFn(V1),x_NavyFn(V1)) :- x_cid(a65b12506e9235,V1).
xc_microtheory(a65b12506e9235,x_HPKBCrisisMt).
xc_source_file(a65b12506e9235,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9235,3289).
xc_kb_names(a65b12506e9235,["?COUNTRY"]).
xc_mapping_rows(a65b12506e9235,[]).
xc_direction(a65b12506e9235,':FORWARD').
xc_monotonicity(a65b12506e9235,':DEFAULT').
xc_creator(a65b12506e9235,'Rode').
xc_creation_date(a65b12506e9235,19980604).
x_thereExists(V1,x_and(x_dateOfEvent(V1,x_YearFn(1987)),x_deliberateActors(V1,x_Libya),x_isa(V1,x_MilitaryAttack),x_maleficiary(V1,x_ArmyFn(x_Chad)),x_performedBy(V1,x_ArmyFn(x_Libya)))) :- x_cid(a65b12506e9236,V1).
xc_microtheory(a65b12506e9236,x_HPKBCrisisMt).
xc_source_file(a65b12506e9236,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9236,3297).
xc_kb_names(a65b12506e9236,["?ATTACK"]).
xc_mapping_rows(a65b12506e9236,['exists-thereexists']).
xc_direction(a65b12506e9236,':FORWARD').
xc_monotonicity(a65b12506e9236,':DEFAULT').
x_deliberateActors(x_CWAttackOnChadianTroops,x_Libya) :- x_cid(a65b12506e9237).
xc_microtheory(a65b12506e9237,x_HPKBCrisisMt).
xc_source_file(a65b12506e9237,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9237,3313).
xc_kb_names(a65b12506e9237,[]).
xc_mapping_rows(a65b12506e9237,[]).
xc_direction(a65b12506e9237,':FORWARD').
xc_monotonicity(a65b12506e9237,':DEFAULT').
x_deliberateActors('x_SKF-50893806',x_Libya) :- x_cid(a65b12506e9238).
xc_microtheory(a65b12506e9238,x_HPKBCrisisMt).
xc_source_file(a65b12506e9238,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9238,3319).
xc_kb_names(a65b12506e9238,[]).
xc_mapping_rows(a65b12506e9238,[]).
xc_direction(a65b12506e9238,':FORWARD').
xc_monotonicity(a65b12506e9238,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_Iran),x_ArmyFn(x_Iran)) :- x_cid(a65b12506e9239).
xc_microtheory(a65b12506e9239,x_HPKBCrisisMt).
xc_source_file(a65b12506e9239,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9239,3326).
xc_kb_names(a65b12506e9239,[]).
xc_mapping_rows(a65b12506e9239,[]).
xc_direction(a65b12506e9239,':FORWARD').
xc_monotonicity(a65b12506e9239,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_SaudiArabia),x_ArmyFn(x_SaudiArabia)) :- x_cid(a65b12506e923a).
xc_microtheory(a65b12506e923a,x_HPKBCrisisMt).
xc_source_file(a65b12506e923a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e923a,3334).
xc_kb_names(a65b12506e923a,[]).
xc_mapping_rows(a65b12506e923a,[]).
xc_direction(a65b12506e923a,':FORWARD').
xc_monotonicity(a65b12506e923a,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_Egypt),x_ArmyFn(x_Egypt)) :- x_cid(a65b12506e923b).
xc_microtheory(a65b12506e923b,x_HPKBCrisisMt).
xc_source_file(a65b12506e923b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e923b,3342).
xc_kb_names(a65b12506e923b,[]).
xc_mapping_rows(a65b12506e923b,[]).
xc_direction(a65b12506e923b,':FORWARD').
xc_monotonicity(a65b12506e923b,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_Kuwait),x_ArmyFn(x_Kuwait)) :- x_cid(a65b12506e923c).
xc_microtheory(a65b12506e923c,x_HPKBCrisisMt).
xc_source_file(a65b12506e923c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e923c,3350).
xc_kb_names(a65b12506e923c,[]).
xc_mapping_rows(a65b12506e923c,[]).
xc_direction(a65b12506e923c,':FORWARD').
xc_monotonicity(a65b12506e923c,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_Oman),x_ArmyFn(x_Oman)) :- x_cid(a65b12506e923d).
xc_microtheory(a65b12506e923d,x_HPKBCrisisMt).
xc_source_file(a65b12506e923d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e923d,3358).
xc_kb_names(a65b12506e923d,[]).
xc_mapping_rows(a65b12506e923d,[]).
xc_direction(a65b12506e923d,':FORWARD').
xc_monotonicity(a65b12506e923d,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_UnitedArabEmirates),x_ArmyFn(x_UnitedArabEmirates)) :- x_cid(a65b12506e923e).
xc_microtheory(a65b12506e923e,x_HPKBCrisisMt).
xc_source_file(a65b12506e923e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e923e,3366).
xc_kb_names(a65b12506e923e,[]).
xc_mapping_rows(a65b12506e923e,[]).
xc_direction(a65b12506e923e,':FORWARD').
xc_monotonicity(a65b12506e923e,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_UnitedStatesOfAmerica),x_ArmyFn(x_UnitedStatesOfAmerica)) :- x_cid(a65b12506e923f).
xc_microtheory(a65b12506e923f,x_HPKBCrisisMt).
xc_source_file(a65b12506e923f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e923f,3374).
xc_kb_names(a65b12506e923f,[]).
xc_mapping_rows(a65b12506e923f,[]).
xc_direction(a65b12506e923f,':FORWARD').
xc_monotonicity(a65b12506e923f,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_Syria),x_ArmyFn(x_Syria)) :- x_cid(a65b12506e9240).
xc_microtheory(a65b12506e9240,x_HPKBCrisisMt).
xc_source_file(a65b12506e9240,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9240,3382).
xc_kb_names(a65b12506e9240,[]).
xc_mapping_rows(a65b12506e9240,[]).
xc_direction(a65b12506e9240,':FORWARD').
xc_monotonicity(a65b12506e9240,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_Chad),x_ArmyFn(x_Chad)) :- x_cid(a65b12506e9241).
xc_microtheory(a65b12506e9241,x_HPKBCrisisMt).
xc_source_file(a65b12506e9241,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9241,3390).
xc_kb_names(a65b12506e9241,[]).
xc_mapping_rows(a65b12506e9241,[]).
xc_direction(a65b12506e9241,':FORWARD').
xc_monotonicity(a65b12506e9241,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_Libya),x_ArmyFn(x_Libya)) :- x_cid(a65b12506e9242).
xc_microtheory(a65b12506e9242,x_HPKBCrisisMt).
xc_source_file(a65b12506e9242,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9242,3398).
xc_kb_names(a65b12506e9242,[]).
xc_mapping_rows(a65b12506e9242,[]).
xc_direction(a65b12506e9242,':FORWARD').
xc_monotonicity(a65b12506e9242,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_Algeria),x_ArmyFn(x_Algeria)) :- x_cid(a65b12506e9243).
xc_microtheory(a65b12506e9243,x_HPKBCrisisMt).
xc_source_file(a65b12506e9243,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9243,3406).
xc_kb_names(a65b12506e9243,[]).
xc_mapping_rows(a65b12506e9243,[]).
xc_direction(a65b12506e9243,':FORWARD').
xc_monotonicity(a65b12506e9243,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_Sweden),x_ArmyFn(x_Sweden)) :- x_cid(a65b12506e9244).
xc_microtheory(a65b12506e9244,x_HPKBCrisisMt).
xc_source_file(a65b12506e9244,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9244,3414).
xc_kb_names(a65b12506e9244,[]).
xc_mapping_rows(a65b12506e9244,[]).
xc_direction(a65b12506e9244,':FORWARD').
xc_monotonicity(a65b12506e9244,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_Iraq),x_ArmyFn(x_Iraq)) :- x_cid(a65b12506e9245).
xc_microtheory(a65b12506e9245,x_HPKBCrisisMt).
xc_source_file(a65b12506e9245,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9245,3422).
xc_kb_names(a65b12506e9245,[]).
xc_mapping_rows(a65b12506e9245,[]).
xc_direction(a65b12506e9245,':FORWARD').
xc_monotonicity(a65b12506e9245,':DEFAULT').
x_subOrganizations(x_GovernmentFn(V1),x_ArmyFn(V1)) :- x_cid(a65b12506e9246,V1).
xc_microtheory(a65b12506e9246,x_HPKBCrisisMt).
xc_source_file(a65b12506e9246,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9246,3430).
xc_kb_names(a65b12506e9246,["?COUNTRY"]).
xc_mapping_rows(a65b12506e9246,[]).
xc_direction(a65b12506e9246,':FORWARD').
xc_monotonicity(a65b12506e9246,':DEFAULT').
xc_creator(a65b12506e9246,'Rode').
xc_creation_date(a65b12506e9246,19980604).
x_subOrganizations(x_GovernmentFn(x_Iran),x_AirForceFn(x_Iran)) :- x_cid(a65b12506e9247).
xc_microtheory(a65b12506e9247,x_HPKBCrisisMt).
xc_source_file(a65b12506e9247,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9247,3438).
xc_kb_names(a65b12506e9247,[]).
xc_mapping_rows(a65b12506e9247,[]).
xc_direction(a65b12506e9247,':FORWARD').
xc_monotonicity(a65b12506e9247,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_Kuwait),x_AirForceFn(x_Kuwait)) :- x_cid(a65b12506e9248).
xc_microtheory(a65b12506e9248,x_HPKBCrisisMt).
xc_source_file(a65b12506e9248,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9248,3446).
xc_kb_names(a65b12506e9248,[]).
xc_mapping_rows(a65b12506e9248,[]).
xc_direction(a65b12506e9248,':FORWARD').
xc_monotonicity(a65b12506e9248,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_SaudiArabia),x_AirForceFn(x_SaudiArabia)) :- x_cid(a65b12506e9249).
xc_microtheory(a65b12506e9249,x_HPKBCrisisMt).
xc_source_file(a65b12506e9249,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9249,3454).
xc_kb_names(a65b12506e9249,[]).
xc_mapping_rows(a65b12506e9249,[]).
xc_direction(a65b12506e9249,':FORWARD').
xc_monotonicity(a65b12506e9249,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_Oman),x_AirForceFn(x_Oman)) :- x_cid(a65b12506e924a).
xc_microtheory(a65b12506e924a,x_HPKBCrisisMt).
xc_source_file(a65b12506e924a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e924a,3462).
xc_kb_names(a65b12506e924a,[]).
xc_mapping_rows(a65b12506e924a,[]).
xc_direction(a65b12506e924a,':FORWARD').
xc_monotonicity(a65b12506e924a,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_Qatar),x_AirForceFn(x_Qatar)) :- x_cid(a65b12506e924b).
xc_microtheory(a65b12506e924b,x_HPKBCrisisMt).
xc_source_file(a65b12506e924b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e924b,3470).
xc_kb_names(a65b12506e924b,[]).
xc_mapping_rows(a65b12506e924b,[]).
xc_direction(a65b12506e924b,':FORWARD').
xc_monotonicity(a65b12506e924b,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_UnitedArabEmirates),x_AirForceFn(x_UnitedArabEmirates)) :- x_cid(a65b12506e924c).
xc_microtheory(a65b12506e924c,x_HPKBCrisisMt).
xc_source_file(a65b12506e924c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e924c,3478).
xc_kb_names(a65b12506e924c,[]).
xc_mapping_rows(a65b12506e924c,[]).
xc_direction(a65b12506e924c,':FORWARD').
xc_monotonicity(a65b12506e924c,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_Algeria),x_AirForceFn(x_Algeria)) :- x_cid(a65b12506e924d).
xc_microtheory(a65b12506e924d,x_HPKBCrisisMt).
xc_source_file(a65b12506e924d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e924d,3486).
xc_kb_names(a65b12506e924d,[]).
xc_mapping_rows(a65b12506e924d,[]).
xc_direction(a65b12506e924d,':FORWARD').
xc_monotonicity(a65b12506e924d,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_Sweden),x_AirForceFn(x_Sweden)) :- x_cid(a65b12506e924e).
xc_microtheory(a65b12506e924e,x_HPKBCrisisMt).
xc_source_file(a65b12506e924e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e924e,3494).
xc_kb_names(a65b12506e924e,[]).
xc_mapping_rows(a65b12506e924e,[]).
xc_direction(a65b12506e924e,':FORWARD').
xc_monotonicity(a65b12506e924e,':DEFAULT').
x_subOrganizations(x_GovernmentFn(V1),x_AirForceFn(V1)) :- x_cid(a65b12506e924f,V1).
xc_microtheory(a65b12506e924f,x_HPKBCrisisMt).
xc_source_file(a65b12506e924f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e924f,3502).
xc_kb_names(a65b12506e924f,["?COUNTRY"]).
xc_mapping_rows(a65b12506e924f,[]).
xc_direction(a65b12506e924f,':FORWARD').
xc_monotonicity(a65b12506e924f,':DEFAULT').
xc_creator(a65b12506e924f,'Rode').
xc_creation_date(a65b12506e924f,19980604).
'x_fosters-ActionTypeSitType'(x_UnitedStatesOfAmerica,x_CollectionQualificationFn(x_GrantingMostFavoredNationStatus,x_ToFn(x_Azerbaijan)),x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn('x_Relations-InteractionFn'(x_TradeSC,x_BetweenFn(x_UnitedStatesOfAmerica,x_Azerbaijan))))) :- x_cid(a65b12506e9250).
xc_microtheory(a65b12506e9250,x_HPKBCrisisMt).
xc_source_file(a65b12506e9250,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9250,3510).
xc_kb_names(a65b12506e9250,[]).
xc_mapping_rows(a65b12506e9250,[]).
xc_direction(a65b12506e9250,':BACKWARD').
xc_monotonicity(a65b12506e9250,':DEFAULT').
x_implies(x_and(x_isa(V1,x_GeopoliticalEntity),x_isa(V2,x_GeopoliticalEntity)),'x_fosters-ActionTypeSitType'(V1,x_CollectionQualificationFn(x_GrantingMostFavoredNationStatus,x_ToFn(V2)),x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn('x_Relations-InteractionFn'(x_TradeSC,x_BetweenFn(V1,V2)))))) :- x_cid(a65b12506e9251,V1,V2).
xc_microtheory(a65b12506e9251,x_HPKBCrisisMt).
xc_source_file(a65b12506e9251,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9251,3522).
xc_kb_names(a65b12506e9251,["?ENTITY1","?ENTITY2"]).
xc_mapping_rows(a65b12506e9251,['implication-implies']).
xc_direction(a65b12506e9251,':BACKWARD').
xc_monotonicity(a65b12506e9251,':DEFAULT').
xc_creator(a65b12506e9251,'Schwartz').
xc_creation_date(a65b12506e9251,19990414).
'x_fosters-ActionTypeSitType'(x_UnitedStatesOfAmerica,x_CollectionQualificationFn(x_MakingATradeAgreement,x_WithFn(x_Azerbaijan)),x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn('x_Relations-InteractionFn'(x_TradeSC,x_BetweenFn(x_UnitedStatesOfAmerica,x_Azerbaijan))))) :- x_cid(a65b12506e9252).
xc_microtheory(a65b12506e9252,x_HPKBCrisisMt).
xc_source_file(a65b12506e9252,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9252,3538).
xc_kb_names(a65b12506e9252,[]).
xc_mapping_rows(a65b12506e9252,[]).
xc_direction(a65b12506e9252,':BACKWARD').
xc_monotonicity(a65b12506e9252,':DEFAULT').
x_genlAttributes(x_IslamicRepublic,x_TheocraticRepublic) :- x_cid(a65b12506e9253).
xc_microtheory(a65b12506e9253,x_HPKBCrisisMt).
xc_source_file(a65b12506e9253,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9253,3550).
xc_kb_names(a65b12506e9253,[]).
xc_mapping_rows(a65b12506e9253,[]).
xc_direction(a65b12506e9253,':FORWARD').
xc_monotonicity(a65b12506e9253,':DEFAULT').
xc_creator(a65b12506e9253,'Curtis').
xc_creation_date(a65b12506e9253,19990414).
x_implies(x_and(x_isa(V1,x_GeopoliticalEntity),x_isa(V2,x_GeopoliticalEntity)),'x_fosters-ActionTypeSitType'(V1,x_CollectionQualificationFn(x_MakingATradeAgreement,x_WithFn(V2)),x_CollectionQualificationFn(x_StrengtheningEvent,x_OfFn('x_Relations-InteractionFn'(x_TradeSC,x_BetweenFn(V1,V2)))))) :- x_cid(a65b12506e9254,V1,V2).
xc_microtheory(a65b12506e9254,x_HPKBCrisisMt).
xc_source_file(a65b12506e9254,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9254,3556).
xc_kb_names(a65b12506e9254,["?ENTITY1","?ENTITY2"]).
xc_mapping_rows(a65b12506e9254,['implication-implies']).
xc_direction(a65b12506e9254,':BACKWARD').
xc_monotonicity(a65b12506e9254,':DEFAULT').
xc_creator(a65b12506e9254,'Schwartz').
xc_creation_date(a65b12506e9254,19990414).
x_implies(x_and(x_genls(V1,V2),x_actionTypeCategory(V2,V3)),x_actionTypeCategory(V1,V3)) :- x_cid(a65b12506e9255,V1,V2,V3).
xc_microtheory(a65b12506e9255,x_HPKBCrisisMt).
xc_source_file(a65b12506e9255,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9255,3572).
xc_kb_names(a65b12506e9255,["?SPEC","?ACTION-TYPE","?ATT"]).
xc_mapping_rows(a65b12506e9255,['implication-implies']).
xc_direction(a65b12506e9255,':BACKWARD').
xc_monotonicity(a65b12506e9255,':DEFAULT').
xc_creator(a65b12506e9255,'Schwartz').
xc_creation_date(a65b12506e9255,19990414).
x_implies(x_and('x_fosters-SitTypeSitType'(V1,V2),'x_fosters-ActionTypeSitType'(V3,V4,V1)),'x_fosters-ActionTypeSitType'(V3,V4,V2)) :- x_cid(a65b12506e9256,V1,V2,V3,V4).
xc_microtheory(a65b12506e9256,x_HPKBCrisisMt).
xc_source_file(a65b12506e9256,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9256,3582).
xc_kb_names(a65b12506e9256,["?SIT-TYPE1","?SIT-TYPE2","?AGENT","?ACTION-TYPE"]).
xc_mapping_rows(a65b12506e9256,['implication-implies']).
xc_direction(a65b12506e9256,':BACKWARD').
xc_monotonicity(a65b12506e9256,':DEFAULT').
xc_creator(a65b12506e9256,'Schwartz').
xc_creation_date(a65b12506e9256,19990413).
x_implies(x_and(x_performedBy(V1,V2),x_isa(V1,x_CollectionQualificationFn(x_GrantingMostFavoredNationStatus,x_ToFn(V3)))),x_holdsIn(x_STIF(V1),x_mostFavoredNations(V2,V3))) :- x_cid(a65b12506e9257,V1,V2,V3).
xc_microtheory(a65b12506e9257,x_HPKBCrisisMt).
xc_source_file(a65b12506e9257,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9257,3592).
xc_kb_names(a65b12506e9257,["?GRANTING-MFN","?COUNTRY1","?COUNTRY2"]).
xc_mapping_rows(a65b12506e9257,['implication-implies']).
xc_direction(a65b12506e9257,':BACKWARD').
xc_monotonicity(a65b12506e9257,':DEFAULT').
xc_creator(a65b12506e9257,'Schwartz').
xc_creation_date(a65b12506e9257,19990413).
x_implies(x_isa(V1,x_ShippingLaneOfRegionFn(x_PersianGulf)),x_linksOfCustomarySystem(x_ShippingSystemFn(x_PersianGulf),V1)) :- x_cid(a65b12506e9258,V1).
xc_microtheory(a65b12506e9258,x_HPKBCrisisMt).
xc_source_file(a65b12506e9258,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9258,3606).
xc_kb_names(a65b12506e9258,["?LANE"]).
xc_mapping_rows(a65b12506e9258,['implication-implies']).
xc_direction(a65b12506e9258,':BACKWARD').
xc_monotonicity(a65b12506e9258,':DEFAULT').
xc_creator(a65b12506e9258,'Hunt').
xc_creation_date(a65b12506e9258,19990412).
x_implies('x_causes-SitTypeSitType'(V1,V2),'x_fosters-SitTypeSitType'(V1,V2)) :- x_cid(a65b12506e9259,V1,V2).
xc_microtheory(a65b12506e9259,x_HPKBCrisisMt).
xc_source_file(a65b12506e9259,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9259,3616).
xc_kb_names(a65b12506e9259,["?CAUSE","?EFFECT"]).
xc_mapping_rows(a65b12506e9259,['implication-implies']).
xc_direction(a65b12506e9259,':BACKWARD').
xc_monotonicity(a65b12506e9259,':DEFAULT').
xc_creator(a65b12506e9259,'Schwartz').
xc_creation_date(a65b12506e9259,19990411).
x_implies(x_isa(V1,x_ShippingLaneOfRegionFn(x_PersianGulfRegion)),x_linksOfCustomarySystem(x_ShippingSystemFn(x_PersianGulfRegion),V1)) :- x_cid(a65b12506e925a,V1).
xc_microtheory(a65b12506e925a,x_HPKBCrisisMt).
xc_source_file(a65b12506e925a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e925a,3624).
xc_kb_names(a65b12506e925a,["?LANE"]).
xc_mapping_rows(a65b12506e925a,['implication-implies']).
xc_direction(a65b12506e925a,':BACKWARD').
xc_monotonicity(a65b12506e925a,':DEFAULT').
xc_creator(a65b12506e925a,'Hunt').
xc_creation_date(a65b12506e925a,19990326).
x_relationInstanceAll(x_linksOfCustomarySystem,x_ShippingSystemFn(x_PersianGulfRegion),x_ShippingLaneOfRegionFn(x_PersianGulfRegion)) :- x_cid(a65b12506e925b).
xc_microtheory(a65b12506e925b,x_HPKBCrisisMt).
xc_source_file(a65b12506e925b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e925b,3634).
xc_kb_names(a65b12506e925b,[]).
xc_mapping_rows(a65b12506e925b,[]).
xc_direction(a65b12506e925b,':FORWARD').
xc_monotonicity(a65b12506e925b,':DEFAULT').
xc_creator(a65b12506e925b,'Hunt').
xc_creation_date(a65b12506e925b,19990326).
x_relationInstanceAll(x_linksOfCustomarySystem,x_ShippingSystemFn(x_PersianGulf),x_ShippingLaneOfRegionFn(x_PersianGulf)) :- x_cid(a65b12506e925c).
xc_microtheory(a65b12506e925c,x_HPKBCrisisMt).
xc_source_file(a65b12506e925c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e925c,3642).
xc_kb_names(a65b12506e925c,[]).
xc_mapping_rows(a65b12506e925c,[]).
xc_direction(a65b12506e925c,':FORWARD').
xc_monotonicity(a65b12506e925c,':DEFAULT').
xc_creator(a65b12506e925c,'Hunt').
xc_creation_date(a65b12506e925c,19990326).
x_goals(x_Russia,x_not(x_thereExists(V1,'x_decreases-Generic'(V1,'x_Petroleum-CrudeOil',x_basicPriceForType)))) :- x_cid(a65b12506e925d,V1).
xc_microtheory(a65b12506e925d,x_HPKBCrisisMt).
xc_source_file(a65b12506e925d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e925d,3650).
xc_kb_names(a65b12506e925d,["?EVENT"]).
xc_mapping_rows(a65b12506e925d,['exists-thereexists']).
xc_direction(a65b12506e925d,':FORWARD').
xc_monotonicity(a65b12506e925d,':DEFAULT').
x_goalCategoryForAgent(x_Russia,x_not(x_thereExists(V1,'x_decreases-Generic'(V1,'x_Petroleum-CrudeOil',x_basicPriceForType))),x_StrategicNationalInterest) :- x_cid(a65b12506e925e,V1).
xc_microtheory(a65b12506e925e,x_HPKBCrisisMt).
xc_source_file(a65b12506e925e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e925e,3660).
xc_kb_names(a65b12506e925e,["?EVENT"]).
xc_mapping_rows(a65b12506e925e,['exists-thereexists']).
xc_direction(a65b12506e925e,':FORWARD').
xc_monotonicity(a65b12506e925e,':DEFAULT').
x_goals(x_SaudiArabia,x_not(x_thereExists(V1,'x_decreases-Generic'(V1,x_SaudiArabia,x_oilRevenue)))) :- x_cid(a65b12506e925f,V1).
xc_microtheory(a65b12506e925f,x_HPKBCrisisMt).
xc_source_file(a65b12506e925f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e925f,3670).
xc_kb_names(a65b12506e925f,["?EVENT"]).
xc_mapping_rows(a65b12506e925f,['exists-thereexists']).
xc_direction(a65b12506e925f,':FORWARD').
xc_monotonicity(a65b12506e925f,':DEFAULT').
x_goalCategoryForAgent(x_SaudiArabia,x_not(x_thereExists(V1,'x_decreases-Generic'(V1,x_SaudiArabia,x_oilRevenue))),x_StrategicNationalInterest) :- x_cid(a65b12506e9260,V1).
xc_microtheory(a65b12506e9260,x_HPKBCrisisMt).
xc_source_file(a65b12506e9260,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9260,3680).
xc_kb_names(a65b12506e9260,["?EVENT"]).
xc_mapping_rows(a65b12506e9260,['exists-thereexists']).
xc_direction(a65b12506e9260,':FORWARD').
xc_monotonicity(a65b12506e9260,':DEFAULT').
x_goals(x_Iran,x_not(x_thereExists(V1,'x_decreases-Generic'(V1,x_OPEC,x_oilPriceCharged)))) :- x_cid(a65b12506e9261,V1).
xc_microtheory(a65b12506e9261,x_HPKBCrisisMt).
xc_source_file(a65b12506e9261,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9261,3690).
xc_kb_names(a65b12506e9261,["?EVENT"]).
xc_mapping_rows(a65b12506e9261,['exists-thereexists']).
xc_direction(a65b12506e9261,':FORWARD').
xc_monotonicity(a65b12506e9261,':DEFAULT').
x_goalCategoryForAgent(x_Iran,x_not(x_thereExists(V1,'x_decreases-Generic'(V1,x_OPEC,x_oilPriceCharged))),x_StrategicNationalInterest) :- x_cid(a65b12506e9262,V1).
xc_microtheory(a65b12506e9262,x_HPKBCrisisMt).
xc_source_file(a65b12506e9262,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9262,3700).
xc_kb_names(a65b12506e9262,["?EVENT"]).
xc_mapping_rows(a65b12506e9262,['exists-thereexists']).
xc_direction(a65b12506e9262,':FORWARD').
xc_monotonicity(a65b12506e9262,':DEFAULT').
x_goals(x_Iran,x_not(x_thereExists(V1,'x_decreases-Generic'(V1,'x_Petroleum-CrudeOil',x_basicPriceForType)))) :- x_cid(a65b12506e9263,V1).
xc_microtheory(a65b12506e9263,x_HPKBCrisisMt).
xc_source_file(a65b12506e9263,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9263,3710).
xc_kb_names(a65b12506e9263,["?EVENT"]).
xc_mapping_rows(a65b12506e9263,['exists-thereexists']).
xc_direction(a65b12506e9263,':FORWARD').
xc_monotonicity(a65b12506e9263,':DEFAULT').
x_goalCategoryForAgent(x_Iran,x_not(x_thereExists(V1,'x_decreases-Generic'(V1,'x_Petroleum-CrudeOil',x_basicPriceForType))),x_StrategicNationalInterest) :- x_cid(a65b12506e9264,V1).
xc_microtheory(a65b12506e9264,x_HPKBCrisisMt).
xc_source_file(a65b12506e9264,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9264,3720).
xc_kb_names(a65b12506e9264,["?EVENT"]).
xc_mapping_rows(a65b12506e9264,['exists-thereexists']).
xc_direction(a65b12506e9264,':FORWARD').
xc_monotonicity(a65b12506e9264,':DEFAULT').
x_goals(x_Iran,x_not(x_thereExists(V1,'x_increases-Generic'(V1,x_OPEC,x_oilProduction)))) :- x_cid(a65b12506e9265,V1).
xc_microtheory(a65b12506e9265,x_HPKBCrisisMt).
xc_source_file(a65b12506e9265,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9265,3730).
xc_kb_names(a65b12506e9265,["?EVENT"]).
xc_mapping_rows(a65b12506e9265,['exists-thereexists']).
xc_direction(a65b12506e9265,':FORWARD').
xc_monotonicity(a65b12506e9265,':DEFAULT').
x_goalCategoryForAgent(x_Iran,x_not(x_thereExists(V1,'x_increases-Generic'(V1,x_OPEC,x_oilProduction))),x_StrategicNationalInterest) :- x_cid(a65b12506e9266,V1).
xc_microtheory(a65b12506e9266,x_HPKBCrisisMt).
xc_source_file(a65b12506e9266,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9266,3740).
xc_kb_names(a65b12506e9266,["?EVENT"]).
xc_mapping_rows(a65b12506e9266,['exists-thereexists']).
xc_direction(a65b12506e9266,':FORWARD').
xc_monotonicity(a65b12506e9266,':DEFAULT').
x_relationAllInstance(x_primaryActivityType,x_OilRefinery,x_ProcessingRefinedOil) :- x_cid(a65b12506e9267).
xc_microtheory(a65b12506e9267,x_HPKBCrisisMt).
xc_source_file(a65b12506e9267,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9267,3750).
xc_kb_names(a65b12506e9267,[]).
xc_mapping_rows(a65b12506e9267,[]).
xc_direction(a65b12506e9267,':FORWARD').
xc_monotonicity(a65b12506e9267,':DEFAULT').
xc_creator(a65b12506e9267,'Kean').
xc_creation_date(a65b12506e9267,19971104).
x_relationAllInstance(x_soleProductType,x_OilIndustry,x_PetroleumProduct) :- x_cid(a65b12506e9268).
xc_microtheory(a65b12506e9268,x_HPKBCrisisMt).
xc_source_file(a65b12506e9268,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9268,3756).
xc_kb_names(a65b12506e9268,[]).
xc_mapping_rows(a65b12506e9268,[]).
xc_direction(a65b12506e9268,':FORWARD').
xc_monotonicity(a65b12506e9268,':DEFAULT').
xc_creator(a65b12506e9268,'Kean').
xc_creation_date(a65b12506e9268,19971104).
x_relationAllInstance(x_primaryActivityType,x_OilRefinery,x_RefiningPetroleum) :- x_cid(a65b12506e9269).
xc_microtheory(a65b12506e9269,x_HPKBCrisisMt).
xc_source_file(a65b12506e9269,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9269,3762).
xc_kb_names(a65b12506e9269,[]).
xc_mapping_rows(a65b12506e9269,[]).
xc_direction(a65b12506e9269,':FORWARD').
xc_monotonicity(a65b12506e9269,':DEFAULT').
xc_creator(a65b12506e9269,'Kean').
xc_creation_date(a65b12506e9269,19971107).
x_relationAllInstance(x_actionViolatesObligation,x_BlockingAnInternationalWaterway,x_InternationalOceanLawCOC) :- x_cid(a65b12506e926a).
xc_microtheory(a65b12506e926a,x_HPKBCrisisMt).
xc_source_file(a65b12506e926a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e926a,3768).
xc_kb_names(a65b12506e926a,[]).
xc_mapping_rows(a65b12506e926a,[]).
xc_direction(a65b12506e926a,':FORWARD').
xc_monotonicity(a65b12506e926a,':DEFAULT').
xc_creator(a65b12506e926a,'Nichols').
xc_creation_date(a65b12506e926a,19971112).
x_relationAllInstance(x_soleProductType,x_GasIndustry,x_NaturalGas) :- x_cid(a65b12506e926b).
xc_microtheory(a65b12506e926b,x_HPKBCrisisMt).
xc_source_file(a65b12506e926b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e926b,3774).
xc_kb_names(a65b12506e926b,[]).
xc_mapping_rows(a65b12506e926b,[]).
xc_direction(a65b12506e926b,':FORWARD').
xc_monotonicity(a65b12506e926b,':DEFAULT').
xc_creator(a65b12506e926b,'Davis').
xc_creation_date(a65b12506e926b,19980317).
x_relationAllInstance(x_soleProductType,x_CoalIndustry,x_Coal) :- x_cid(a65b12506e926c).
xc_microtheory(a65b12506e926c,x_HPKBCrisisMt).
xc_source_file(a65b12506e926c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e926c,3780).
xc_kb_names(a65b12506e926c,[]).
xc_mapping_rows(a65b12506e926c,[]).
xc_direction(a65b12506e926c,':FORWARD').
xc_monotonicity(a65b12506e926c,':DEFAULT').
xc_creator(a65b12506e926c,'Davis').
xc_creation_date(a65b12506e926c,19980317).
x_relationAllInstance(x_actionViolatesObligation,x_BlockingAnInternationalWaterway,x_ModernInternationalLawCOC) :- x_cid(a65b12506e926d).
xc_microtheory(a65b12506e926d,x_HPKBCrisisMt).
xc_source_file(a65b12506e926d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e926d,3786).
xc_kb_names(a65b12506e926d,[]).
xc_mapping_rows(a65b12506e926d,[]).
xc_direction(a65b12506e926d,':FORWARD').
xc_monotonicity(a65b12506e926d,':DEFAULT').
xc_creator(a65b12506e926d,'ABelasco').
xc_creation_date(a65b12506e926d,19980911).
x_relationInstanceAll(x_obligatedAgent,x_InternationalOceanLawCOC,x_IndependentCountry) :- x_cid(a65b12506e926e).
xc_microtheory(a65b12506e926e,x_HPKBCrisisMt).
xc_source_file(a65b12506e926e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e926e,3792).
xc_kb_names(a65b12506e926e,[]).
xc_mapping_rows(a65b12506e926e,[]).
xc_direction(a65b12506e926e,':FORWARD').
xc_monotonicity(a65b12506e926e,':DEFAULT').
xc_creator(a65b12506e926e,'Nichols').
xc_creation_date(a65b12506e926e,19971112).
x_relationInstanceAll(x_obligatedAgent,x_ModernInternationalLawCOC,x_IndependentCountry) :- x_cid(a65b12506e926f).
xc_microtheory(a65b12506e926f,x_HPKBCrisisMt).
xc_source_file(a65b12506e926f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e926f,3798).
xc_kb_names(a65b12506e926f,[]).
xc_mapping_rows(a65b12506e926f,[]).
xc_direction(a65b12506e926f,':FORWARD').
xc_monotonicity(a65b12506e926f,':DEFAULT').
xc_creator(a65b12506e926f,'Nichols').
xc_creation_date(a65b12506e926f,19971112).
x_relationInstanceAll(x_knowsAbout,x_InternationalCommunity,x_BlockingAnInternationalWaterway) :- x_cid(a65b12506e9270).
xc_microtheory(a65b12506e9270,x_HPKBCrisisMt).
xc_source_file(a65b12506e9270,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9270,3804).
xc_kb_names(a65b12506e9270,[]).
xc_mapping_rows(a65b12506e9270,[]).
xc_direction(a65b12506e9270,':FORWARD').
xc_monotonicity(a65b12506e9270,':DEFAULT').
xc_creator(a65b12506e9270,'KathyBurns').
xc_creation_date(a65b12506e9270,19971117).
x_implies(x_and(x_isa(V1,x_ImportExportEvent),x_isa(V1,x_TransportFn(x_PetroleumProduct))),x_or(x_isa(V1,x_ConveyViaFn(x_Pipeline)),x_isa(V1,x_TransportViaFn(x_TankerAircraft)),x_isa(V1,x_TransportViaFn(x_TankerShip)),x_isa(V1,x_TransportViaFn(x_TankerTruck)),x_isa(V1,x_TransportViaFn(x_TrainCar)))) :- x_cid(a65b12506e9271,V1).
xc_microtheory(a65b12506e9271,x_HPKBCrisisMt).
xc_source_file(a65b12506e9271,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9271,3810).
xc_kb_names(a65b12506e9271,["?TRANSPORT"]).
xc_mapping_rows(a65b12506e9271,['implication-implies']).
xc_direction(a65b12506e9271,':BACKWARD').
xc_monotonicity(a65b12506e9271,':DEFAULT').
xc_creator(a65b12506e9271,'BillJ').
xc_creation_date(a65b12506e9271,19990315).
x_goals(x_Azerbaijan,'x_powerInRegion-Geopolitical'(x_Azerbaijan,x_CaspianRegion,x_High)) :- x_cid(a65b12506e9272).
xc_microtheory(a65b12506e9272,x_HPKBCrisisMt).
xc_source_file(a65b12506e9272,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9272,3831).
xc_kb_names(a65b12506e9272,[]).
xc_mapping_rows(a65b12506e9272,[]).
xc_direction(a65b12506e9272,':FORWARD').
xc_monotonicity(a65b12506e9272,':DEFAULT').
x_goalCategoryForAgent(x_Azerbaijan,'x_powerInRegion-Geopolitical'(x_Azerbaijan,x_CaspianRegion,x_High),x_StrategicNationalInterest) :- x_cid(a65b12506e9273).
xc_microtheory(a65b12506e9273,x_HPKBCrisisMt).
xc_source_file(a65b12506e9273,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9273,3838).
xc_kb_names(a65b12506e9273,[]).
xc_mapping_rows(a65b12506e9273,[]).
xc_direction(a65b12506e9273,':FORWARD').
xc_monotonicity(a65b12506e9273,':DEFAULT').
x_goals(x_Azerbaijan,x_thereExists(V1,x_and(x_isa(V1,x_Investing),x_beneficiary(V1,x_Azerbaijan),x_performedBy(V1,x_Azerbaijan),x_objectActedOn(V1,x_IndustryOfRegionFn(x_OilIndustry,x_CaspianRegion))))) :- x_cid(a65b12506e9274,V1).
xc_microtheory(a65b12506e9274,x_HPKBCrisisMt).
xc_source_file(a65b12506e9274,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9274,3845).
xc_kb_names(a65b12506e9274,["?INVESTING"]).
xc_mapping_rows(a65b12506e9274,['exists-thereexists']).
xc_direction(a65b12506e9274,':FORWARD').
xc_monotonicity(a65b12506e9274,':DEFAULT').
x_goalCategoryForAgent(x_Azerbaijan,x_thereExists(V1,x_and(x_isa(V1,x_Investing),x_beneficiary(V1,x_Azerbaijan),x_performedBy(V1,x_Azerbaijan),x_objectActedOn(V1,x_IndustryOfRegionFn(x_OilIndustry,x_CaspianRegion)))),x_StrategicNationalInterest) :- x_cid(a65b12506e9275,V1).
xc_microtheory(a65b12506e9275,x_HPKBCrisisMt).
xc_source_file(a65b12506e9275,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9275,3859).
xc_kb_names(a65b12506e9275,["?INVESTING"]).
xc_mapping_rows(a65b12506e9275,['exists-thereexists']).
xc_direction(a65b12506e9275,':FORWARD').
xc_monotonicity(a65b12506e9275,':DEFAULT').
x_goals(x_Azerbaijan,x_thereExists(V1,x_thereExists(V2,x_and(x_isa(V1,x_Organization),x_isa(V2,x_Investing),x_beneficiary(V2,x_Azerbaijan),x_not(x_residenceOfOrganization(V1,x_Azerbaijan)),x_performedBy(V2,V1))))) :- x_cid(a65b12506e9276,V1,V2).
xc_microtheory(a65b12506e9276,x_HPKBCrisisMt).
xc_source_file(a65b12506e9276,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9276,3873).
xc_kb_names(a65b12506e9276,["?FOREIGN-INVESTOR","?INVESTING"]).
xc_mapping_rows(a65b12506e9276,['exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9276,':FORWARD').
xc_monotonicity(a65b12506e9276,':DEFAULT').
x_goalCategoryForAgent(x_Azerbaijan,x_thereExists(V1,x_thereExists(V2,x_and(x_isa(V1,x_Organization),x_isa(V2,x_Investing),x_beneficiary(V2,x_Azerbaijan),x_not(x_residenceOfOrganization(V1,x_Azerbaijan)),x_performedBy(V2,V1)))),x_StrategicNationalInterest) :- x_cid(a65b12506e9277,V1,V2).
xc_microtheory(a65b12506e9277,x_HPKBCrisisMt).
xc_source_file(a65b12506e9277,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9277,3890).
xc_kb_names(a65b12506e9277,["?FOREIGN-INVESTOR","?INVESTING"]).
xc_mapping_rows(a65b12506e9277,['exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9277,':FORWARD').
xc_monotonicity(a65b12506e9277,':DEFAULT').
x_goals(x_Azerbaijan,x_not(x_isa(x_EconomyFn(x_Azerbaijan),x_SocialistEconomicSystem))) :- x_cid(a65b12506e9278).
xc_microtheory(a65b12506e9278,x_HPKBCrisisMt).
xc_source_file(a65b12506e9278,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9278,3907).
xc_kb_names(a65b12506e9278,[]).
xc_mapping_rows(a65b12506e9278,[]).
xc_direction(a65b12506e9278,':FORWARD').
xc_monotonicity(a65b12506e9278,':DEFAULT').
x_goalCategoryForAgent(x_Azerbaijan,x_not(x_isa(x_EconomyFn(x_Azerbaijan),x_SocialistEconomicSystem)),x_StrategicNationalInterest) :- x_cid(a65b12506e9279).
xc_microtheory(a65b12506e9279,x_HPKBCrisisMt).
xc_source_file(a65b12506e9279,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9279,3916).
xc_kb_names(a65b12506e9279,[]).
xc_mapping_rows(a65b12506e9279,[]).
xc_direction(a65b12506e9279,':FORWARD').
xc_monotonicity(a65b12506e9279,':DEFAULT').
x_goals(x_Azerbaijan,x_isa(x_EconomyFn(x_Azerbaijan),x_FreeMarketEconomicSystem)) :- x_cid(a65b12506e927a).
xc_microtheory(a65b12506e927a,x_HPKBCrisisMt).
xc_source_file(a65b12506e927a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e927a,3925).
xc_kb_names(a65b12506e927a,[]).
xc_mapping_rows(a65b12506e927a,[]).
xc_direction(a65b12506e927a,':FORWARD').
xc_monotonicity(a65b12506e927a,':DEFAULT').
x_goalCategoryForAgent(x_Azerbaijan,x_isa(x_EconomyFn(x_Azerbaijan),x_FreeMarketEconomicSystem),x_StrategicNationalInterest) :- x_cid(a65b12506e927b).
xc_microtheory(a65b12506e927b,x_HPKBCrisisMt).
xc_source_file(a65b12506e927b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e927b,3933).
xc_kb_names(a65b12506e927b,[]).
xc_mapping_rows(a65b12506e927b,[]).
xc_direction(a65b12506e927b,':FORWARD').
xc_monotonicity(a65b12506e927b,':DEFAULT').
x_goals(x_Azerbaijan,x_thereExists(V1,x_and(x_greaterThan(V1,0),x_oilProduction(x_EasternRegionFn(x_Azerbaijan),V1)))) :- x_cid(a65b12506e927c,V1).
xc_microtheory(a65b12506e927c,x_HPKBCrisisMt).
xc_source_file(a65b12506e927c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e927c,3941).
xc_kb_names(a65b12506e927c,["?AMOUNT"]).
xc_mapping_rows(a65b12506e927c,['exists-thereexists']).
xc_direction(a65b12506e927c,':FORWARD').
xc_monotonicity(a65b12506e927c,':DEFAULT').
x_goalCategoryForAgent(x_Azerbaijan,x_thereExists(V1,x_and(x_greaterThan(V1,0),x_oilProduction(x_EasternRegionFn(x_Azerbaijan),V1))),x_StrategicNationalInterest) :- x_cid(a65b12506e927d,V1).
xc_microtheory(a65b12506e927d,x_HPKBCrisisMt).
xc_source_file(a65b12506e927d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e927d,3953).
xc_kb_names(a65b12506e927d,["?AMOUNT"]).
xc_mapping_rows(a65b12506e927d,['exists-thereexists']).
xc_direction(a65b12506e927d,':FORWARD').
xc_monotonicity(a65b12506e927d,':DEFAULT').
x_goals(x_Azerbaijan,x_thereExists(V1,x_and(x_isa(V1,x_Investing),x_beneficiary(V1,x_Azerbaijan),x_performedBy(V1,x_Azerbaijan),x_objectActedOn(V1,x_IndustryOfRegionFn(x_OilIndustry,x_Azerbaijan))))) :- x_cid(a65b12506e927e,V1).
xc_microtheory(a65b12506e927e,x_HPKBCrisisMt).
xc_source_file(a65b12506e927e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e927e,3965).
xc_kb_names(a65b12506e927e,["?INVESTING"]).
xc_mapping_rows(a65b12506e927e,['exists-thereexists']).
xc_direction(a65b12506e927e,':FORWARD').
xc_monotonicity(a65b12506e927e,':DEFAULT').
x_goalCategoryForAgent(x_Azerbaijan,x_thereExists(V1,x_and(x_isa(V1,x_Investing),x_beneficiary(V1,x_Azerbaijan),x_performedBy(V1,x_Azerbaijan),x_objectActedOn(V1,x_IndustryOfRegionFn(x_OilIndustry,x_Azerbaijan)))),x_StrategicNationalInterest) :- x_cid(a65b12506e927f,V1).
xc_microtheory(a65b12506e927f,x_HPKBCrisisMt).
xc_source_file(a65b12506e927f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e927f,3979).
xc_kb_names(a65b12506e927f,["?INVESTING"]).
xc_mapping_rows(a65b12506e927f,['exists-thereexists']).
xc_direction(a65b12506e927f,':FORWARD').
xc_monotonicity(a65b12506e927f,':DEFAULT').
x_capableOfDoing(x_UnitedNationsOrganization,'x_TerritorialDispute-Nagorno-Karabakh',x_mediators) :- x_cid(a65b12506e9280).
xc_microtheory(a65b12506e9280,x_HPKBCrisisMt).
xc_source_file(a65b12506e9280,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9280,3993).
xc_kb_names(a65b12506e9280,[]).
xc_mapping_rows(a65b12506e9280,[]).
xc_direction(a65b12506e9280,':FORWARD').
xc_monotonicity(a65b12506e9280,':DEFAULT').
x_implies(x_and(x_obligatedAgent('x_NuclearNon-ProliferationTreaty',V1),x_genls(V2,x_NuclearWeapon),x_relationInstanceExists(x_possesses,V1,V2)),x_or(x_isa(V1,x_NuclearWeaponStateUnderNNPT),x_agentViolatesObligation(V1,'x_NuclearNon-ProliferationTreaty'))) :- x_cid(a65b12506e9281,V1,V2).
xc_microtheory(a65b12506e9281,x_HPKBCrisisMt).
xc_source_file(a65b12506e9281,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9281,3999).
xc_kb_names(a65b12506e9281,["?COUNTRY","?NUKE"]).
xc_mapping_rows(a65b12506e9281,['implication-implies']).
xc_direction(a65b12506e9281,':BACKWARD').
xc_monotonicity(a65b12506e9281,':DEFAULT').
xc_creator(a65b12506e9281,'KathyBurns').
xc_creation_date(a65b12506e9281,19990315).
x_goals(x_Iran,'x_powerInRegion-Economic'(x_Iran,x_PersianGulfRegion,x_MediumToVeryHigh)) :- x_cid(a65b12506e9282).
xc_microtheory(a65b12506e9282,x_HPKBCrisisMt).
xc_source_file(a65b12506e9282,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9282,4012).
xc_kb_names(a65b12506e9282,[]).
xc_mapping_rows(a65b12506e9282,[]).
xc_direction(a65b12506e9282,':FORWARD').
xc_monotonicity(a65b12506e9282,':DEFAULT').
x_goalCategoryForAgent(x_Iran,'x_powerInRegion-Economic'(x_Iran,x_PersianGulfRegion,x_MediumToVeryHigh),x_StrategicNationalInterest) :- x_cid(a65b12506e9283).
xc_microtheory(a65b12506e9283,x_HPKBCrisisMt).
xc_source_file(a65b12506e9283,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9283,4019).
xc_kb_names(a65b12506e9283,[]).
xc_mapping_rows(a65b12506e9283,[]).
xc_direction(a65b12506e9283,':FORWARD').
xc_monotonicity(a65b12506e9283,':DEFAULT').
x_increasesCausally(x_AlQaidaAttackOnUSTroops,x_thereExists(V1,x_and(x_isa(V1,x_AttackOnTangible),x_maleficiary(V1,x_AlQaida))),x_likelihood) :- x_cid(a65b12506e9284,V1).
xc_microtheory(a65b12506e9284,x_HPKBCrisisMt).
xc_source_file(a65b12506e9284,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9284,4026).
xc_kb_names(a65b12506e9284,["?RETALIATION"]).
xc_mapping_rows(a65b12506e9284,['exists-thereexists']).
xc_direction(a65b12506e9284,':FORWARD').
xc_monotonicity(a65b12506e9284,':DEFAULT').
x_increasesCausally('x_AlQaidaUSEmbassyAttack-Tanzania',x_thereExists(V1,x_and(x_isa(V1,x_AttackOnTangible),x_maleficiary(V1,x_AlQaida))),x_likelihood) :- x_cid(a65b12506e9285,V1).
xc_microtheory(a65b12506e9285,x_HPKBCrisisMt).
xc_source_file(a65b12506e9285,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9285,4037).
xc_kb_names(a65b12506e9285,["?RETALIATION"]).
xc_mapping_rows(a65b12506e9285,['exists-thereexists']).
xc_direction(a65b12506e9285,':FORWARD').
xc_monotonicity(a65b12506e9285,':DEFAULT').
x_increasesCausally('x_AlQaidaUSEmbassyAttack-Kenya',x_thereExists(V1,x_and(x_isa(V1,x_AttackOnTangible),x_maleficiary(V1,x_AlQaida))),x_likelihood) :- x_cid(a65b12506e9286,V1).
xc_microtheory(a65b12506e9286,x_HPKBCrisisMt).
xc_source_file(a65b12506e9286,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9286,4048).
xc_kb_names(a65b12506e9286,["?RETALIATION"]).
xc_mapping_rows(a65b12506e9286,['exists-thereexists']).
xc_direction(a65b12506e9286,':FORWARD').
xc_monotonicity(a65b12506e9286,':DEFAULT').
x_increasesCausally('x_HizballahIsraeliEmbassyAttack-1992',x_thereExists(V1,x_and(x_isa(V1,x_AttackOnTangible),x_maleficiary(V1,x_LebaneseHizballah))),x_likelihood) :- x_cid(a65b12506e9287,V1).
xc_microtheory(a65b12506e9287,x_HPKBCrisisMt).
xc_source_file(a65b12506e9287,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9287,4059).
xc_kb_names(a65b12506e9287,["?RETALIATION"]).
xc_mapping_rows(a65b12506e9287,['exists-thereexists']).
xc_direction(a65b12506e9287,':FORWARD').
xc_monotonicity(a65b12506e9287,':DEFAULT').
x_increasesCausally('x_HizballahUSEmbassyAttack-1983',x_thereExists(V1,x_and(x_isa(V1,x_AttackOnTangible),x_maleficiary(V1,x_LebaneseHizballah))),x_likelihood) :- x_cid(a65b12506e9288,V1).
xc_microtheory(a65b12506e9288,x_HPKBCrisisMt).
xc_source_file(a65b12506e9288,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9288,4070).
xc_kb_names(a65b12506e9288,["?RETALIATION"]).
xc_mapping_rows(a65b12506e9288,['exists-thereexists']).
xc_direction(a65b12506e9288,':FORWARD').
xc_monotonicity(a65b12506e9288,':DEFAULT').
x_increasesCausally('x_HizballahUSEmbassyAttack-1984',x_thereExists(V1,x_and(x_isa(V1,x_AttackOnTangible),x_maleficiary(V1,x_LebaneseHizballah))),x_likelihood) :- x_cid(a65b12506e9289,V1).
xc_microtheory(a65b12506e9289,x_HPKBCrisisMt).
xc_source_file(a65b12506e9289,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9289,4081).
xc_kb_names(a65b12506e9289,["?RETALIATION"]).
xc_mapping_rows(a65b12506e9289,['exists-thereexists']).
xc_direction(a65b12506e9289,':FORWARD').
xc_monotonicity(a65b12506e9289,':DEFAULT').
x_increasesCausally(x_AssassinationOfJordanianDiplomat,x_thereExists(V1,x_and(x_isa(V1,x_AttackOnTangible),x_maleficiary(V1,x_AbuNidalOrganization))),x_likelihood) :- x_cid(a65b12506e928a,V1).
xc_microtheory(a65b12506e928a,x_HPKBCrisisMt).
xc_source_file(a65b12506e928a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e928a,4092).
xc_kb_names(a65b12506e928a,["?RETALIATION"]).
xc_mapping_rows(a65b12506e928a,['exists-thereexists']).
xc_direction(a65b12506e928a,':FORWARD').
xc_monotonicity(a65b12506e928a,':DEFAULT').
x_capableOfDoing(x_UnitedNationsOrganization,'x_TerritorialDispute-Libya-Algeria',x_mediators) :- x_cid(a65b12506e928b).
xc_microtheory(a65b12506e928b,x_HPKBCrisisMt).
xc_source_file(a65b12506e928b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e928b,4103).
xc_kb_names(a65b12506e928b,[]).
xc_mapping_rows(a65b12506e928b,[]).
xc_direction(a65b12506e928b,':FORWARD').
xc_monotonicity(a65b12506e928b,':DEFAULT').
x_capableOfDoing(x_UnitedNationsOrganization,'x_TerritorialDispute-Libya-Niger',x_mediators) :- x_cid(a65b12506e928c).
xc_microtheory(a65b12506e928c,x_HPKBCrisisMt).
xc_source_file(a65b12506e928c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e928c,4109).
xc_kb_names(a65b12506e928c,[]).
xc_mapping_rows(a65b12506e928c,[]).
xc_direction(a65b12506e928c,':FORWARD').
xc_monotonicity(a65b12506e928c,':DEFAULT').
x_goals(x_UnitedArabEmirates,x_thereExists(V1,x_and(x_isa(V1,x_PrivatizingAnIndustry),x_fromPossessor(V1,x_UnitedArabEmirates)))) :- x_cid(a65b12506e928d,V1).
xc_microtheory(a65b12506e928d,x_HPKBCrisisMt).
xc_source_file(a65b12506e928d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e928d,4115).
xc_kb_names(a65b12506e928d,["?PRIV"]).
xc_mapping_rows(a65b12506e928d,['exists-thereexists']).
xc_direction(a65b12506e928d,':FORWARD').
xc_monotonicity(a65b12506e928d,':DEFAULT').
x_goalCategoryForAgent(x_UnitedArabEmirates,x_thereExists(V1,x_and(x_isa(V1,x_PrivatizingAnIndustry),x_fromPossessor(V1,x_UnitedArabEmirates))),x_StrategicInterest) :- x_cid(a65b12506e928e,V1).
xc_microtheory(a65b12506e928e,x_HPKBCrisisMt).
xc_source_file(a65b12506e928e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e928e,4126).
xc_kb_names(a65b12506e928e,["?PRIV"]).
xc_mapping_rows(a65b12506e928e,['exists-thereexists']).
xc_direction(a65b12506e928e,':FORWARD').
xc_monotonicity(a65b12506e928e,':DEFAULT').
x_goalCategoryForAgent(x_UnitedArabEmirates,x_thereExists(V1,x_and(x_isa(V1,x_PrivatizingAnIndustry),x_fromPossessor(V1,x_UnitedArabEmirates))),x_StrategicNationalInterest) :- x_cid(a65b12506e928f,V1).
xc_microtheory(a65b12506e928f,x_HPKBCrisisMt).
xc_source_file(a65b12506e928f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e928f,4137).
xc_kb_names(a65b12506e928f,["?PRIV"]).
xc_mapping_rows(a65b12506e928f,['exists-thereexists']).
xc_direction(a65b12506e928f,':FORWARD').
xc_monotonicity(a65b12506e928f,':DEFAULT').
x_implies(x_and(x_allies(V1,V2),x_importsThrough(V1,V3,V4)),x_goalCategoryForAgent(V2,x_pathState(V4,x_PathOpen),x_AidingAllies)) :- x_cid(a65b12506e9290,V1,V2,V3,V4).
xc_microtheory(a65b12506e9290,x_HPKBCrisisMt).
xc_source_file(a65b12506e9290,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9290,4148).
xc_kb_names(a65b12506e9290,["?COUNTRY1","?COUNTRY2","?PROD","?PATH"]).
xc_mapping_rows(a65b12506e9290,['implication-implies']).
xc_direction(a65b12506e9290,':BACKWARD').
xc_monotonicity(a65b12506e9290,':DEFAULT').
xc_creator(a65b12506e9290,'BillJ').
xc_creation_date(a65b12506e9290,19980626).
x_intensionallyTransparent(x_beliefs) :- x_cid(a65b12506e9291).
xc_microtheory(a65b12506e9291,x_HPKBCrisisMt).
xc_source_file(a65b12506e9291,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9291,4159).
xc_kb_names(a65b12506e9291,[]).
xc_mapping_rows(a65b12506e9291,[]).
xc_direction(a65b12506e9291,':FORWARD').
xc_monotonicity(a65b12506e9291,':DEFAULT').
xc_creator(a65b12506e9291,'Rode').
xc_creation_date(a65b12506e9291,19990219).
x_intensionallyTransparent(x_knows) :- x_cid(a65b12506e9292).
xc_microtheory(a65b12506e9292,x_HPKBCrisisMt).
xc_source_file(a65b12506e9292,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9292,4165).
xc_kb_names(a65b12506e9292,[]).
xc_mapping_rows(a65b12506e9292,[]).
xc_direction(a65b12506e9292,':FORWARD').
xc_monotonicity(a65b12506e9292,':DEFAULT').
xc_creator(a65b12506e9292,'Rode').
xc_creation_date(a65b12506e9292,19990219).
x_intensionallyTransparent(x_goals) :- x_cid(a65b12506e9293).
xc_microtheory(a65b12506e9293,x_HPKBCrisisMt).
xc_source_file(a65b12506e9293,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9293,4171).
xc_kb_names(a65b12506e9293,[]).
xc_mapping_rows(a65b12506e9293,[]).
xc_direction(a65b12506e9293,':FORWARD').
xc_monotonicity(a65b12506e9293,':DEFAULT').
xc_creator(a65b12506e9293,'Rode').
xc_creation_date(a65b12506e9293,19990219).
x_intensionallyTransparent(x_behaviorCapable) :- x_cid(a65b12506e9294).
xc_microtheory(a65b12506e9294,x_HPKBCrisisMt).
xc_source_file(a65b12506e9294,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9294,4177).
xc_kb_names(a65b12506e9294,[]).
xc_mapping_rows(a65b12506e9294,[]).
xc_direction(a65b12506e9294,':FORWARD').
xc_monotonicity(a65b12506e9294,':DEFAULT').
xc_creator(a65b12506e9294,'Rode').
xc_creation_date(a65b12506e9294,19990219).
x_comment(x_implies(x_and(x_isa(V1,x_TerroristAttack),x_maleficiary(V1,V2)),'x_causes-SitProp'(V1,x_quantityChangeFunction(x_ShortTermFn(V1),V2,x_politicalStability,x_NetDecreasingFunction))),"This rule states that terrorist attacks cause political\ninstability in the short term.  Along with one other rule it \nhelps express model fragment A4.  See also #$NoteAboutKnowledgeFragment-A4") :- x_cid(a65b12506e9295,V1,V2).
xc_microtheory(a65b12506e9295,x_HPKBCrisisMt).
xc_source_file(a65b12506e9295,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9295,4183).
xc_kb_names(a65b12506e9295,["?ATTACK","?COUNTRY"]).
xc_mapping_rows(a65b12506e9295,['implication-implies']).
xc_direction(a65b12506e9295,':BACKWARD').
xc_monotonicity(a65b12506e9295,':DEFAULT').
xc_creator(a65b12506e9295,'Watson').
xc_creation_date(a65b12506e9295,19990210).
x_implies(x_and(x_actionViolatesObligation(V1,x_ModernInternationalRelationsCOC),x_beliefs(x_InternationalCommunity,x_performedBy(V1,V2))),x_increasesCausally(V1,'x_statusWithAgent-Gradient'(V2,x_InternationalCommunity,x_CredibilityStatus,x_Low),x_likelihood)) :- x_cid(a65b12506e9296,V1,V2).
xc_microtheory(a65b12506e9296,x_HPKBCrisisMt).
xc_source_file(a65b12506e9296,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9296,4198).
xc_kb_names(a65b12506e9296,["?ACT","?AGT"]).
xc_mapping_rows(a65b12506e9296,['implication-implies']).
xc_direction(a65b12506e9296,':BACKWARD').
xc_monotonicity(a65b12506e9296,':DEFAULT').
xc_creator(a65b12506e9296,'ABelasco').
xc_creation_date(a65b12506e9296,19980914).
x_isa(x_MakingFn(x_BiologicalWeaponFn('x_Anthrax-Bacterium')),x_ScriptType) :- x_cid(a65b12506e9297).
xc_microtheory(a65b12506e9297,x_HPKBCrisisMt).
xc_source_file(a65b12506e9297,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9297,4210).
xc_kb_names(a65b12506e9297,[]).
xc_mapping_rows(a65b12506e9297,[]).
xc_direction(a65b12506e9297,':FORWARD').
xc_monotonicity(a65b12506e9297,':DEFAULT').
x_genls(x_MakingFn(x_BiologicalWeaponFn('x_Anthrax-Bacterium')),x_MakingFn(x_BiologicalWeapon)) :- x_cid(a65b12506e9298).
xc_microtheory(a65b12506e9298,x_HPKBCrisisMt).
xc_source_file(a65b12506e9298,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9298,4218).
xc_kb_names(a65b12506e9298,[]).
xc_mapping_rows(a65b12506e9298,[]).
xc_direction(a65b12506e9298,':FORWARD').
xc_monotonicity(a65b12506e9298,':MONOTONIC').
xc_creator(a65b12506e9298,'Schwartz').
xc_creation_date(a65b12506e9298,19990122).
x_capableOfDoing(x_ArabianLiberationArmy,'x_HYP-TerroristAct-66258087',x_performedBy) :- x_cid(a65b12506e9299).
xc_microtheory(a65b12506e9299,x_HPKBCrisisMt).
xc_source_file(a65b12506e9299,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9299,4227).
xc_kb_names(a65b12506e9299,[]).
xc_mapping_rows(a65b12506e9299,[]).
xc_direction(a65b12506e9299,':FORWARD').
xc_monotonicity(a65b12506e9299,':DEFAULT').
x_capableOfDoing(x_IslamicReformMovement,'x_HYP-TerroristAct-66258087',x_performedBy) :- x_cid(a65b12506e929a).
xc_microtheory(a65b12506e929a,x_HPKBCrisisMt).
xc_source_file(a65b12506e929a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e929a,4233).
xc_kb_names(a65b12506e929a,[]).
xc_mapping_rows(a65b12506e929a,[]).
xc_direction(a65b12506e929a,':FORWARD').
xc_monotonicity(a65b12506e929a,':DEFAULT').
x_capableOfDoing('x_MEK-MKO',x_MEKTerrorismSinceTheMidEighties,x_performedBy) :- x_cid(a65b12506e929b).
xc_microtheory(a65b12506e929b,x_HPKBCrisisMt).
xc_source_file(a65b12506e929b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e929b,4239).
xc_kb_names(a65b12506e929b,[]).
xc_mapping_rows(a65b12506e929b,[]).
xc_direction(a65b12506e929b,':FORWARD').
xc_monotonicity(a65b12506e929b,':DEFAULT').
x_implies(x_and(x_isa(V1,x_TerroristAct),x_eventOccursAt(V1,V2),x_isa(V2,x_GeographicalAgent),x_residenceOfOrganization(V3,V2),x_isa(V3,x_TerroristGroup),x_hasStatusWithAgent(V3,V2,x_DissidentStatus)),x_capableOfDoing(V3,V1,x_performedBy)) :- x_cid(a65b12506e929c,V1,V2,V3).
xc_microtheory(a65b12506e929c,x_HPKBCrisisMt).
xc_source_file(a65b12506e929c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e929c,4245).
xc_kb_names(a65b12506e929c,["?TERROR","?AREA","?GROUP"]).
xc_mapping_rows(a65b12506e929c,['implication-implies']).
xc_direction(a65b12506e929c,':FORWARD').
xc_monotonicity(a65b12506e929c,':DEFAULT').
xc_creator(a65b12506e929c,'Watson').
xc_creation_date(a65b12506e929c,19990117).
x_implies(x_and(x_isa(V1,x_TerroristAct),x_eventOccursAt(V1,V2),x_geographicalSubRegions(V3,V2),x_isa(V3,x_GeographicalAgent),x_residenceOfOrganization(V4,V3),x_isa(V4,x_TerroristGroup),x_hasStatusWithAgent(V4,V3,x_DissidentStatus)),x_capableOfDoing(V4,V1,x_performedBy)) :- x_cid(a65b12506e929d,V1,V2,V3,V4).
xc_microtheory(a65b12506e929d,x_HPKBCrisisMt).
xc_source_file(a65b12506e929d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e929d,4259).
xc_kb_names(a65b12506e929d,["?TERROR","?PLACE","?AREA","?GROUP"]).
xc_mapping_rows(a65b12506e929d,['implication-implies']).
xc_direction(a65b12506e929d,':BACKWARD').
xc_monotonicity(a65b12506e929d,':DEFAULT').
xc_creator(a65b12506e929d,'Watson').
xc_creation_date(a65b12506e929d,19990117).
x_implies(x_hasStatusWithAgent(V1,V2,x_Rivals),x_negativeVestedInterest(V2,V1)) :- x_cid(a65b12506e929e,V1,V2).
xc_microtheory(a65b12506e929e,x_HPKBCrisisMt).
xc_source_file(a65b12506e929e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e929e,4274).
xc_kb_names(a65b12506e929e,["?AGENT1","?AGENT2"]).
xc_mapping_rows(a65b12506e929e,['implication-implies']).
xc_direction(a65b12506e929e,':BACKWARD').
xc_monotonicity(a65b12506e929e,':DEFAULT').
xc_creator(a65b12506e929e,'DeSanto').
xc_creation_date(a65b12506e929e,19990114).
x_implies(x_and(x_isa(V1,x_PathArtifact),x_exportsThrough(V2,V3,V1)),x_goalCategoryForAgent(V2,x_not(x_thereExists(V4,x_and(x_isa(V4,x_DestructionEvent),x_objectActedOn(V4,V1)))),x_NationalEconomyGoal)) :- x_cid(a65b12506e929f,V1,V2,V3,V4).
xc_microtheory(a65b12506e929f,x_HPKBCrisisMt).
xc_source_file(a65b12506e929f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e929f,4282).
xc_kb_names(a65b12506e929f,["?PATH","?COUNTRY","?PROD","?DESTRUCTION"]).
xc_mapping_rows(a65b12506e929f,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e929f,':BACKWARD').
xc_monotonicity(a65b12506e929f,':DEFAULT').
xc_creator(a65b12506e929f,'Watson').
xc_creation_date(a65b12506e929f,19990114).
x_implies(x_and(x_isa(V1,x_Weapon),'x_instrument-Generic'(V2,V1),x_isa(V2,x_AttackOnTangible),x_different(V2,V3),x_subEvents(V3,V2),x_isa(V3,x_AttackOnTangible)),'x_instrument-Generic'(V3,V1)) :- x_cid(a65b12506e92a0,V1,V2,V3).
xc_microtheory(a65b12506e92a0,x_HPKBCrisisMt).
xc_source_file(a65b12506e92a0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92a0,4298).
xc_kb_names(a65b12506e92a0,["?WEAPON","?SUB-ATTACK","?ATTACK"]).
xc_mapping_rows(a65b12506e92a0,['implication-implies']).
xc_direction(a65b12506e92a0,':BACKWARD').
xc_monotonicity(a65b12506e92a0,':DEFAULT').
xc_creator(a65b12506e92a0,'Schwartz').
xc_creation_date(a65b12506e92a0,19990114).
x_relationAllExists(x_inputsDestroyed,x_RefiningFn('x_Petroleum-CrudeOil'),'x_Petroleum-CrudeOil') :- x_cid(a65b12506e92a1).
xc_microtheory(a65b12506e92a1,x_HPKBCrisisMt).
xc_source_file(a65b12506e92a1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92a1,4312).
xc_kb_names(a65b12506e92a1,[]).
xc_mapping_rows(a65b12506e92a1,[]).
xc_direction(a65b12506e92a1,':FORWARD').
xc_monotonicity(a65b12506e92a1,':DEFAULT').
x_relationAllExists(x_inputsDestroyed,x_RefiningFn(V1),V1) :- x_cid(a65b12506e92a2,V1).
xc_microtheory(a65b12506e92a2,x_HPKBCrisisMt).
xc_source_file(a65b12506e92a2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92a2,4319).
xc_kb_names(a65b12506e92a2,["?STUFFTYPE"]).
xc_mapping_rows(a65b12506e92a2,[]).
xc_direction(a65b12506e92a2,':FORWARD').
xc_monotonicity(a65b12506e92a2,':DEFAULT').
xc_creator(a65b12506e92a2,'KathyBurns').
xc_creation_date(a65b12506e92a2,19990113).
x_holdsIn(x_Y1Phase2ScenarioConflict,x_goalCategoryForAgent(x_SaudiArabia,x_thereExists(V1,x_and(x_isa(V1,x_Event),x_increasesCausally(V1,x_OPEC,x_Kappa(t(V2,V3),x_productionRate(V2,'x_Petroleum-CrudeOil',V3))))),x_NationalEconomyGoal)) :- x_cid(a65b12506e92a3,V1,V2,V3).
xc_microtheory(a65b12506e92a3,x_HPKBCrisisMt).
xc_source_file(a65b12506e92a3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92a3,4326).
xc_kb_names(a65b12506e92a3,["?EVT","?PRODUCER","?PRODUCTION-RATE"]).
xc_mapping_rows(a65b12506e92a3,['exists-thereexists']).
xc_direction(a65b12506e92a3,':FORWARD').
xc_monotonicity(a65b12506e92a3,':DEFAULT').
xc_creator(a65b12506e92a3,'Watson').
xc_creation_date(a65b12506e92a3,19990105).
x_holdsIn(x_Y1Phase1ScenarioConflict,x_goalCategoryForAgent(x_SaudiArabia,x_thereExists(V1,x_and(x_isa(V1,x_Event),x_increasesCausally(V1,x_OPEC,x_Kappa(t(V2,V3),x_productionRate(V2,'x_Petroleum-CrudeOil',V3))))),x_NationalEconomyGoal)) :- x_cid(a65b12506e92a4,V1,V2,V3).
xc_microtheory(a65b12506e92a4,x_HPKBCrisisMt).
xc_source_file(a65b12506e92a4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92a4,4341).
xc_kb_names(a65b12506e92a4,["?EVT","?PRODUCER","?PRODUCTION-RATE"]).
xc_mapping_rows(a65b12506e92a4,['exists-thereexists']).
xc_direction(a65b12506e92a4,':FORWARD').
xc_monotonicity(a65b12506e92a4,':DEFAULT').
xc_creator(a65b12506e92a4,'Watson').
xc_creation_date(a65b12506e92a4,19990105).
x_goals(x_SaudiArabia,x_thereExists(V1,x_and(x_isa(V1,x_Event),x_increasesCausally(V1,x_SaudiArabia,x_Kappa(t(V2,V3),x_productionRate(V2,x_NaturalGas,V3)))))) :- x_cid(a65b12506e92a5,V1,V2,V3).
xc_microtheory(a65b12506e92a5,x_HPKBCrisisMt).
xc_source_file(a65b12506e92a5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92a5,4356).
xc_kb_names(a65b12506e92a5,["?EVT","?PRODUCER","?PRODUCTION-RATE"]).
xc_mapping_rows(a65b12506e92a5,['exists-thereexists']).
xc_direction(a65b12506e92a5,':FORWARD').
xc_monotonicity(a65b12506e92a5,':DEFAULT').
x_goalCategoryForAgent(x_SaudiArabia,x_thereExists(V1,x_and(x_isa(V1,x_Event),x_increasesCausally(V1,x_SaudiArabia,x_Kappa(t(V2,V3),x_productionRate(V2,x_NaturalGas,V3))))),x_StrategicInterest) :- x_cid(a65b12506e92a6,V1,V2,V3).
xc_microtheory(a65b12506e92a6,x_HPKBCrisisMt).
xc_source_file(a65b12506e92a6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92a6,4370).
xc_kb_names(a65b12506e92a6,["?EVT","?PRODUCER","?PRODUCTION-RATE"]).
xc_mapping_rows(a65b12506e92a6,['exists-thereexists']).
xc_direction(a65b12506e92a6,':FORWARD').
xc_monotonicity(a65b12506e92a6,':DEFAULT').
x_goalCategoryForAgent(x_SaudiArabia,x_thereExists(V1,x_and(x_isa(V1,x_Event),x_increasesCausally(V1,x_SaudiArabia,x_Kappa(t(V2,V3),x_productionRate(V2,x_NaturalGas,V3))))),x_StrategicNationalInterest) :- x_cid(a65b12506e92a7,V1,V2,V3).
xc_microtheory(a65b12506e92a7,x_HPKBCrisisMt).
xc_source_file(a65b12506e92a7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92a7,4384).
xc_kb_names(a65b12506e92a7,["?EVT","?PRODUCER","?PRODUCTION-RATE"]).
xc_mapping_rows(a65b12506e92a7,['exists-thereexists']).
xc_direction(a65b12506e92a7,':FORWARD').
xc_monotonicity(a65b12506e92a7,':DEFAULT').
x_goals(x_SaudiArabia,x_hasMembers(x_WorldTradeOrganization,x_SaudiArabia)) :- x_cid(a65b12506e92a8).
xc_microtheory(a65b12506e92a8,x_HPKBCrisisMt).
xc_source_file(a65b12506e92a8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92a8,4398).
xc_kb_names(a65b12506e92a8,[]).
xc_mapping_rows(a65b12506e92a8,[]).
xc_direction(a65b12506e92a8,':FORWARD').
xc_monotonicity(a65b12506e92a8,':DEFAULT').
x_goalCategoryForAgent(x_SaudiArabia,x_hasMembers(x_WorldTradeOrganization,x_SaudiArabia),x_StrategicInterest) :- x_cid(a65b12506e92a9).
xc_microtheory(a65b12506e92a9,x_HPKBCrisisMt).
xc_source_file(a65b12506e92a9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92a9,4405).
xc_kb_names(a65b12506e92a9,[]).
xc_mapping_rows(a65b12506e92a9,[]).
xc_direction(a65b12506e92a9,':FORWARD').
xc_monotonicity(a65b12506e92a9,':DEFAULT').
x_goalCategoryForAgent(x_SaudiArabia,x_hasMembers(x_WorldTradeOrganization,x_SaudiArabia),x_StrategicNationalInterest) :- x_cid(a65b12506e92aa).
xc_microtheory(a65b12506e92aa,x_HPKBCrisisMt).
xc_source_file(a65b12506e92aa,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92aa,4412).
xc_kb_names(a65b12506e92aa,[]).
xc_mapping_rows(a65b12506e92aa,[]).
xc_direction(a65b12506e92aa,':FORWARD').
xc_monotonicity(a65b12506e92aa,':DEFAULT').
x_implies(x_and(x_isa(V1,x_ExtractingNaturalGas),x_fromLocation(V1,V2)),x_locationState(V2,x_Underground)) :- x_cid(a65b12506e92ab,V1,V2).
xc_microtheory(a65b12506e92ab,x_HPKBCrisisMt).
xc_source_file(a65b12506e92ab,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92ab,4419).
xc_kb_names(a65b12506e92ab,["?EG","?FROM"]).
xc_mapping_rows(a65b12506e92ab,['implication-implies']).
xc_direction(a65b12506e92ab,':BACKWARD').
xc_monotonicity(a65b12506e92ab,':DEFAULT').
xc_creator(a65b12506e92ab,'JulieF').
xc_creation_date(a65b12506e92ab,19981215).
x_comment(x_ExtractingNaturalGas,"Extracting natural gas from the earth; one of the           #$industryActivityTypes of a #$GasIndustry.") :- x_cid(a65b12506e92ac).
xc_microtheory(a65b12506e92ac,x_HPKBCrisisMt).
xc_source_file(a65b12506e92ac,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92ac,4429).
xc_kb_names(a65b12506e92ac,[]).
xc_mapping_rows(a65b12506e92ac,[]).
xc_direction(a65b12506e92ac,':FORWARD').
xc_monotonicity(a65b12506e92ac,':DEFAULT').
xc_creator(a65b12506e92ac,'JulieF').
xc_creation_date(a65b12506e92ac,19981215).
x_implies('x_internationalOrg-MemberCountry'(x_GulfCooperationCouncil,V1),x_holdsIn(x_Y1Phase1ScenarioConflict,x_goals(V1,x_relationExistsInstance('x_pathway-Partial',x_TransportViaFn(x_Ship),x_PersianGulf)))) :- x_cid(a65b12506e92ad,V1).
xc_microtheory(a65b12506e92ad,x_HPKBCrisisMt).
xc_source_file(a65b12506e92ad,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92ad,4435).
xc_kb_names(a65b12506e92ad,["?COUNTRY"]).
xc_mapping_rows(a65b12506e92ad,['implication-implies']).
xc_direction(a65b12506e92ad,':BACKWARD').
xc_monotonicity(a65b12506e92ad,':DEFAULT').
xc_creator(a65b12506e92ad,'Watson').
xc_creation_date(a65b12506e92ad,19981203).
x_holdsIn(x_Y1Phase1ScenarioConflict,x_goals(x_SaudiArabia,x_hasLeaders(x_OPEC,x_SaudiArabia))) :- x_cid(a65b12506e92ae).
xc_microtheory(a65b12506e92ae,x_HPKBCrisisMt).
xc_source_file(a65b12506e92ae,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92ae,4446).
xc_kb_names(a65b12506e92ae,[]).
xc_mapping_rows(a65b12506e92ae,[]).
xc_direction(a65b12506e92ae,':FORWARD').
xc_monotonicity(a65b12506e92ae,':DEFAULT').
xc_creator(a65b12506e92ae,'Watson').
xc_creation_date(a65b12506e92ae,19981202).
x_holdsIn(x_Y1Phase1ScenarioConflict,x_goals(x_SaudiArabia,x_hasLeaders(x_PersianGulfCountries,x_SaudiArabia))) :- x_cid(a65b12506e92af).
xc_microtheory(a65b12506e92af,x_HPKBCrisisMt).
xc_source_file(a65b12506e92af,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92af,4454).
xc_kb_names(a65b12506e92af,[]).
xc_mapping_rows(a65b12506e92af,[]).
xc_direction(a65b12506e92af,':FORWARD').
xc_monotonicity(a65b12506e92af,':DEFAULT').
xc_creator(a65b12506e92af,'Watson').
xc_creation_date(a65b12506e92af,19981202).
x_holdsIn(x_Y1Phase1ScenarioConflict,'x_powerInRegion-Economic'(x_SaudiArabia,x_PersianGulfRegion,x_MediumToVeryHigh)) :- x_cid(a65b12506e92b0).
xc_microtheory(a65b12506e92b0,x_HPKBCrisisMt).
xc_source_file(a65b12506e92b0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92b0,4462).
xc_kb_names(a65b12506e92b0,[]).
xc_mapping_rows(a65b12506e92b0,[]).
xc_direction(a65b12506e92b0,':FORWARD').
xc_monotonicity(a65b12506e92b0,':DEFAULT').
xc_creator(a65b12506e92b0,'Watson').
xc_creation_date(a65b12506e92b0,19981202).
x_holdsIn(x_Y1Phase1ScenarioConflict,'x_powerInRegion-Economic'(x_SaudiArabia,'x_MiddleEast-Region',x_MediumToVeryHigh)) :- x_cid(a65b12506e92b1).
xc_microtheory(a65b12506e92b1,x_HPKBCrisisMt).
xc_source_file(a65b12506e92b1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92b1,4469).
xc_kb_names(a65b12506e92b1,[]).
xc_mapping_rows(a65b12506e92b1,[]).
xc_direction(a65b12506e92b1,':FORWARD').
xc_monotonicity(a65b12506e92b1,':DEFAULT').
xc_creator(a65b12506e92b1,'Watson').
xc_creation_date(a65b12506e92b1,19981202).
x_holdsIn(x_Y1Phase1ScenarioConflict,x_goals(x_SaudiArabia,'x_powerInRegion-Economic'(x_SaudiArabia,x_PersianGulfRegion,x_MediumToVeryHigh))) :- x_cid(a65b12506e92b2).
xc_microtheory(a65b12506e92b2,x_HPKBCrisisMt).
xc_source_file(a65b12506e92b2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92b2,4476).
xc_kb_names(a65b12506e92b2,[]).
xc_mapping_rows(a65b12506e92b2,[]).
xc_direction(a65b12506e92b2,':FORWARD').
xc_monotonicity(a65b12506e92b2,':DEFAULT').
xc_creator(a65b12506e92b2,'Watson').
xc_creation_date(a65b12506e92b2,19981202).
x_holdsIn(x_Y1Phase1ScenarioConflict,x_goals(x_Iran,'x_powerInRegion-Economic'(x_Iran,x_PersianGulfRegion,x_MediumToVeryHigh))) :- x_cid(a65b12506e92b3).
xc_microtheory(a65b12506e92b3,x_HPKBCrisisMt).
xc_source_file(a65b12506e92b3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92b3,4484).
xc_kb_names(a65b12506e92b3,[]).
xc_mapping_rows(a65b12506e92b3,[]).
xc_direction(a65b12506e92b3,':FORWARD').
xc_monotonicity(a65b12506e92b3,':DEFAULT').
xc_creator(a65b12506e92b3,'Watson').
xc_creation_date(a65b12506e92b3,19981202).
x_holdsIn(x_Y1Phase1ScenarioConflict,x_powerInOrganization(x_SaudiArabia,x_OPEC,x_MediumToVeryHigh)) :- x_cid(a65b12506e92b4).
xc_microtheory(a65b12506e92b4,x_HPKBCrisisMt).
xc_source_file(a65b12506e92b4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92b4,4492).
xc_kb_names(a65b12506e92b4,[]).
xc_mapping_rows(a65b12506e92b4,[]).
xc_direction(a65b12506e92b4,':FORWARD').
xc_monotonicity(a65b12506e92b4,':DEFAULT').
xc_creator(a65b12506e92b4,'Watson').
xc_creation_date(a65b12506e92b4,19981202).
x_holdsIn(x_Y1Phase1ScenarioConflict,x_powerInOrganization(x_SaudiArabia,x_GulfCooperationCouncil,x_MediumToVeryHigh)) :- x_cid(a65b12506e92b5).
xc_microtheory(a65b12506e92b5,x_HPKBCrisisMt).
xc_source_file(a65b12506e92b5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92b5,4499).
xc_kb_names(a65b12506e92b5,[]).
xc_mapping_rows(a65b12506e92b5,[]).
xc_direction(a65b12506e92b5,':FORWARD').
xc_monotonicity(a65b12506e92b5,':DEFAULT').
xc_creator(a65b12506e92b5,'Watson').
xc_creation_date(a65b12506e92b5,19981202).
x_holdsIn(x_Y1Phase1ScenarioConflict,x_goals(x_SaudiArabia,x_powerInOrganization(x_SaudiArabia,x_OPEC,x_MediumToVeryHigh))) :- x_cid(a65b12506e92b6).
xc_microtheory(a65b12506e92b6,x_HPKBCrisisMt).
xc_source_file(a65b12506e92b6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92b6,4506).
xc_kb_names(a65b12506e92b6,[]).
xc_mapping_rows(a65b12506e92b6,[]).
xc_direction(a65b12506e92b6,':FORWARD').
xc_monotonicity(a65b12506e92b6,':DEFAULT').
xc_creator(a65b12506e92b6,'Watson').
xc_creation_date(a65b12506e92b6,19981202).
x_holdsIn(x_Y1Phase1ScenarioConflict,x_goals(x_Iran,x_powerInOrganization(x_Iran,x_OPEC,x_MediumToVeryHigh))) :- x_cid(a65b12506e92b7).
xc_microtheory(a65b12506e92b7,x_HPKBCrisisMt).
xc_source_file(a65b12506e92b7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92b7,4514).
xc_kb_names(a65b12506e92b7,[]).
xc_mapping_rows(a65b12506e92b7,[]).
xc_direction(a65b12506e92b7,':FORWARD').
xc_monotonicity(a65b12506e92b7,':DEFAULT').
xc_creator(a65b12506e92b7,'Watson').
xc_creation_date(a65b12506e92b7,19981202).
x_holdsIn(x_Y1Phase1ScenarioConflict,x_goals(x_Qatar,x_relationExistsInstance('x_pathway-Partial',x_TransportViaFn(x_Ship),x_PersianGulf))) :- x_cid(a65b12506e92b8).
xc_microtheory(a65b12506e92b8,x_HPKBCrisisMt).
xc_source_file(a65b12506e92b8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92b8,4522).
xc_kb_names(a65b12506e92b8,[]).
xc_mapping_rows(a65b12506e92b8,[]).
xc_direction(a65b12506e92b8,':FORWARD').
xc_monotonicity(a65b12506e92b8,':DEFAULT').
xc_creator(a65b12506e92b8,'Watson').
xc_creation_date(a65b12506e92b8,19981202).
x_holdsIn(x_Y1Phase1ScenarioConflict,x_goals(x_Kuwait,x_relationExistsInstance('x_pathway-Partial',x_TransportViaFn(x_Ship),x_PersianGulf))) :- x_cid(a65b12506e92b9).
xc_microtheory(a65b12506e92b9,x_HPKBCrisisMt).
xc_source_file(a65b12506e92b9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92b9,4531).
xc_kb_names(a65b12506e92b9,[]).
xc_mapping_rows(a65b12506e92b9,[]).
xc_direction(a65b12506e92b9,':FORWARD').
xc_monotonicity(a65b12506e92b9,':DEFAULT').
xc_creator(a65b12506e92b9,'Watson').
xc_creation_date(a65b12506e92b9,19981202).
x_holdsIn(x_Y1Phase1ScenarioConflict,x_goals(x_UnitedArabEmirates,x_relationExistsInstance('x_pathway-Partial',x_TransportViaFn(x_Ship),x_PersianGulf))) :- x_cid(a65b12506e92ba).
xc_microtheory(a65b12506e92ba,x_HPKBCrisisMt).
xc_source_file(a65b12506e92ba,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92ba,4540).
xc_kb_names(a65b12506e92ba,[]).
xc_mapping_rows(a65b12506e92ba,[]).
xc_direction(a65b12506e92ba,':FORWARD').
xc_monotonicity(a65b12506e92ba,':DEFAULT').
xc_creator(a65b12506e92ba,'Watson').
xc_creation_date(a65b12506e92ba,19981202).
x_holdsIn(x_Y1Phase1ScenarioConflict,x_goals(x_SaudiArabia,x_relationExistsInstance('x_pathway-Partial',x_TransportViaFn(x_Ship),x_PersianGulf))) :- x_cid(a65b12506e92bb).
xc_microtheory(a65b12506e92bb,x_HPKBCrisisMt).
xc_source_file(a65b12506e92bb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92bb,4549).
xc_kb_names(a65b12506e92bb,[]).
xc_mapping_rows(a65b12506e92bb,[]).
xc_direction(a65b12506e92bb,':FORWARD').
xc_monotonicity(a65b12506e92bb,':DEFAULT').
xc_creator(a65b12506e92bb,'Watson').
xc_creation_date(a65b12506e92bb,19981202).
x_holdsIn(x_Y1Phase1ScenarioConflict,x_goals(x_Oman,x_relationExistsInstance('x_pathway-Partial',x_TransportViaFn(x_Ship),x_PersianGulf))) :- x_cid(a65b12506e92bc).
xc_microtheory(a65b12506e92bc,x_HPKBCrisisMt).
xc_source_file(a65b12506e92bc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92bc,4558).
xc_kb_names(a65b12506e92bc,[]).
xc_mapping_rows(a65b12506e92bc,[]).
xc_direction(a65b12506e92bc,':FORWARD').
xc_monotonicity(a65b12506e92bc,':DEFAULT').
xc_creator(a65b12506e92bc,'Watson').
xc_creation_date(a65b12506e92bc,19981202).
x_holdsIn(x_Y1Phase1ScenarioConflict,x_goals(x_Bahrain,x_relationExistsInstance('x_pathway-Partial',x_TransportViaFn(x_Ship),x_PersianGulf))) :- x_cid(a65b12506e92bd).
xc_microtheory(a65b12506e92bd,x_HPKBCrisisMt).
xc_source_file(a65b12506e92bd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92bd,4567).
xc_kb_names(a65b12506e92bd,[]).
xc_mapping_rows(a65b12506e92bd,[]).
xc_direction(a65b12506e92bd,':FORWARD').
xc_monotonicity(a65b12506e92bd,':DEFAULT').
xc_creator(a65b12506e92bd,'Watson').
xc_creation_date(a65b12506e92bd,19981202).
x_holdsIn(x_Y1Phase1ScenarioConflict,x_goals(x_GulfCooperationCouncil,x_relationExistsInstance('x_pathway-Partial',x_TransportViaFn(x_Ship),x_PersianGulf))) :- x_cid(a65b12506e92be).
xc_microtheory(a65b12506e92be,x_HPKBCrisisMt).
xc_source_file(a65b12506e92be,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92be,4576).
xc_kb_names(a65b12506e92be,[]).
xc_mapping_rows(a65b12506e92be,[]).
xc_direction(a65b12506e92be,':FORWARD').
xc_monotonicity(a65b12506e92be,':DEFAULT').
xc_creator(a65b12506e92be,'Watson').
xc_creation_date(a65b12506e92be,19981202).
x_implies(x_and('x_conveyor-Stationary'(V1,V2),x_transportees(V1,V3),x_isa(V3,x_PetroleumProduct)),x_isa(V2,'x_Pipe-ConduitArtifact')) :- x_cid(a65b12506e92bf,V1,V2,V3).
xc_microtheory(a65b12506e92bf,x_HPKBCrisisMt).
xc_source_file(a65b12506e92bf,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92bf,4585).
xc_kb_names(a65b12506e92bf,["?TRANSPORT","?PIPE","?OIL"]).
xc_mapping_rows(a65b12506e92bf,['implication-implies']).
xc_direction(a65b12506e92bf,':BACKWARD').
xc_monotonicity(a65b12506e92bf,':DEFAULT').
xc_creator(a65b12506e92bf,'Foxvog').
xc_creation_date(a65b12506e92bf,19981009).
x_omitFromHPKB(x_implies(x_and(x_isa(V1,x_Country),x_populationDuring(V1,x_MonthFn(V2,x_YearFn(V3)),V4)),x_populationDuring(V1,x_YearFn(V3),V4))) :- x_cid(a65b12506e92c0,V1,V2,V3,V4).
xc_microtheory(a65b12506e92c0,x_HPKBCrisisMt).
xc_source_file(a65b12506e92c0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92c0,4596).
xc_kb_names(a65b12506e92c0,["?COUNTRY","?MONTH","?X","?NR"]).
xc_mapping_rows(a65b12506e92c0,['implication-implies']).
xc_direction(a65b12506e92c0,':BACKWARD').
xc_monotonicity(a65b12506e92c0,':DEFAULT').
xc_creator(a65b12506e92c0,'Colvin').
xc_creation_date(a65b12506e92c0,19980928).
x_omitFromHPKB(x_implies(x_and(x_isa(V1,x_PoliticalInstability),x_doneBy(V1,V2)),x_holdsIn(V1,x_politicalStability(V2,x_Low)))) :- x_cid(a65b12506e92c1,V1,V2).
xc_microtheory(a65b12506e92c1,x_HPKBCrisisMt).
xc_source_file(a65b12506e92c1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92c1,4610).
xc_kb_names(a65b12506e92c1,["?SIT","?REG"]).
xc_mapping_rows(a65b12506e92c1,['implication-implies']).
xc_direction(a65b12506e92c1,':BACKWARD').
xc_monotonicity(a65b12506e92c1,':DEFAULT').
xc_creator(a65b12506e92c1,'Colvin').
xc_creation_date(a65b12506e92c1,19980928).
x_omitFromHPKB(x_implies(x_and(x_isa(V1,x_ProductType),x_isa(V2,x_Rate),x_isa(V3,'x_Path-Customary'),x_exportThroughAmountDuring(V4,V1,V3,V5,V2),x_changesQuantityByFraction(V6,V4,x_Kappa(t(V7,V8),x_exportRateThrough(V7,V1,V3,V9)),V10)),x_changesQuantityByAmount(V6,V4,x_Kappa(t(V11,V12),x_exportRateThrough(V11,V1,V3,V12)),x_TimesFn(V10,V2)))) :- x_cid(a65b12506e92c2,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b12506e92c2,x_HPKBCrisisMt).
xc_source_file(a65b12506e92c2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92c2,4622).
xc_kb_names(a65b12506e92c2,["?PRODUCT","?RATE","?ROUTE","?COUNTRY","?TIME","?EVENT","?EXPORTER","?EXPORT-AMT","?EXPORT-RATE","?FRACTION","?EXP","?EXP-RATE"]).
xc_mapping_rows(a65b12506e92c2,['implication-implies']).
xc_direction(a65b12506e92c2,':BACKWARD').
xc_monotonicity(a65b12506e92c2,':DEFAULT').
xc_creator(a65b12506e92c2,'Schwartz').
xc_creation_date(a65b12506e92c2,19980925).
x_omitFromHPKB(x_implies(x_changesQuantityByAmount(V1,V2,x_Kappa(t(V3,V4),x_exportRateThrough(V3,V5,V6,V4)),V7),x_changesQuantityByAmount(V1,V2,'x_grossDomesticProduct-Slot',V7))) :- x_cid(a65b12506e92c3,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e92c3,x_HPKBCrisisMt).
xc_source_file(a65b12506e92c3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92c3,4643).
xc_kb_names(a65b12506e92c3,["?EVENT","?COUNTRY","?EXP","?EXP-RATE","?PRODUCT","?ROUTE","?AMOUNT"]).
xc_mapping_rows(a65b12506e92c3,['implication-implies']).
xc_direction(a65b12506e92c3,':BACKWARD').
xc_monotonicity(a65b12506e92c3,':DEFAULT').
xc_creator(a65b12506e92c3,'Schwartz').
xc_creation_date(a65b12506e92c3,19980925).
x_omitFromHPKB(x_implies(x_and(x_isa(V1,x_MonetaryFlowRate),x_changesQuantityByAmount(V2,V3,x_Kappa(t(V4,V5),x_exportRateThrough(V4,V6,V7,V5)),V1)),x_changesQuantityByAmount(V2,V3,'x_grossDomesticProduct-Slot',V1))) :- x_cid(a65b12506e92c4,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e92c4,x_HPKBCrisisMt).
xc_source_file(a65b12506e92c4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92c4,4655).
xc_kb_names(a65b12506e92c4,["?AMOUNT","?EVENT","?COUNTRY","?EXP","?EXP-RATE","?PRODUCT","?ROUTE"]).
xc_mapping_rows(a65b12506e92c4,['implication-implies']).
xc_direction(a65b12506e92c4,':BACKWARD').
xc_monotonicity(a65b12506e92c4,':DEFAULT').
xc_creator(a65b12506e92c4,'Schwartz').
xc_creation_date(a65b12506e92c4,19980925).
x_omitFromHPKB(x_implies(x_and(x_basicPriceForType(V1,V2),x_changesQuantityByAmount(V3,V4,x_Kappa(t(V5,V6),x_exportRateThrough(V5,V1,V7,V6)),V8)),x_changesQuantityByAmount(V3,V4,'x_grossDomesticProduct-Slot',x_TimesFn(V8,V2)))) :- x_cid(a65b12506e92c5,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12506e92c5,x_HPKBCrisisMt).
xc_source_file(a65b12506e92c5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92c5,4669).
xc_kb_names(a65b12506e92c5,["?PRODUCT-TYPE","?UNIT-PRICE","?EVENT","?COUNTRY","?EXPORTER","?EXPORT-RATE","?LOC","?EX-CHANGE"]).
xc_mapping_rows(a65b12506e92c5,['implication-implies']).
xc_direction(a65b12506e92c5,':BACKWARD').
xc_monotonicity(a65b12506e92c5,':DEFAULT').
xc_creator(a65b12506e92c5,'Schwartz').
xc_creation_date(a65b12506e92c5,19980925).
x_omitFromHPKB(x_implies(x_and(x_isa(V1,x_PersuadingToAct),x_performedBy(V1,V2),'x_causes-EventEvent'(V1,V3),x_quantityChangeFunction(V3,V4,x_Kappa(t(V5,V6),x_priceChargedFor(x_PlanetEarth,V5,V6)),x_NetIncreasingFunction)),x_quantityInfluenceFunction(V3,V4,x_Kappa(t(V7,V8),x_priceChargedFor(x_PlanetEarth,V7,V8)),x_NetDecreasingFunction))) :- x_cid(a65b12506e92c6,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12506e92c6,x_HPKBCrisisMt).
xc_source_file(a65b12506e92c6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92c6,4684).
xc_kb_names(a65b12506e92c6,["?PERSUADING","?SENDER","?INCREASE-EXPORTS","?PRODUCT-TYPE","?PROD-1","?PRICE-1","?PROD-2","?PRICE-2"]).
xc_mapping_rows(a65b12506e92c6,['implication-implies']).
xc_direction(a65b12506e92c6,':FORWARD').
xc_monotonicity(a65b12506e92c6,':DEFAULT').
xc_creator(a65b12506e92c6,'ABelasco').
xc_creation_date(a65b12506e92c6,19980924).
x_omitFromHPKB(x_implies(x_and(x_isa(V1,x_MilitaryAttack),x_isa(V2,x_GeographicalAgent),x_maleficiary(V1,V2)),x_increasesCausally(V1,x_politicalStability(V2,x_Low),x_likelihood))) :- x_cid(a65b12506e92c7,V1,V2).
xc_microtheory(a65b12506e92c7,x_HPKBCrisisMt).
xc_source_file(a65b12506e92c7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92c7,4703).
xc_kb_names(a65b12506e92c7,["?ATTACK","?GEOPOL"]).
xc_mapping_rows(a65b12506e92c7,['implication-implies']).
xc_direction(a65b12506e92c7,':BACKWARD').
xc_monotonicity(a65b12506e92c7,':DEFAULT').
xc_creator(a65b12506e92c7,'ABelasco').
xc_creation_date(a65b12506e92c7,19980924).
x_omitFromHPKB(x_implies(x_and(x_isa(V1,x_WeaponOfMassDestruction),'x_instrument-Generic'(V2,V1)),x_holdsIn(x_STIF(V2),x_economicStability(x_EconomyFn(x_PlanetEarth),x_Low)))) :- x_cid(a65b12506e92c8,V1,V2).
xc_microtheory(a65b12506e92c8,x_HPKBCrisisMt).
xc_source_file(a65b12506e92c8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92c8,4716).
xc_kb_names(a65b12506e92c8,["?WEAPON","?ATTACK"]).
xc_mapping_rows(a65b12506e92c8,['implication-implies']).
xc_direction(a65b12506e92c8,':BACKWARD').
xc_monotonicity(a65b12506e92c8,':DEFAULT').
xc_creator(a65b12506e92c8,'ABelasco').
xc_creation_date(a65b12506e92c8,19980924).
x_omitFromHPKB(x_implies(x_and(x_isa(V1,x_MilitaryAttack),x_isa(V2,x_Country),x_genls(V3,x_EnergyStuff),x_exports(V4,V3),x_performedBy(V1,V2),x_maleficiary(V1,V4),x_greaterThan(x_QuotientFn(V5,V6),x_Percent(5)),x_productionAmountDuring(x_PlanetEarth,V3,x_YearFn(1997),V6),x_exportAmountDuring(V4,V3,x_YearFn(1997),V5)),x_holdsIn(x_STIF(V1),x_economicStability(x_EconomyFn(x_PlanetEarth),x_Low)))) :- x_cid(a65b12506e92c9,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e92c9,x_HPKBCrisisMt).
xc_source_file(a65b12506e92c9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92c9,4730).
xc_kb_names(a65b12506e92c9,["?ATTACK","?ATTACKER","?ENERGYPRODUCT","?VICTIMNATION","?EXPORTAMOUNT","?WORLDWIDE"]).
xc_mapping_rows(a65b12506e92c9,['implication-implies']).
xc_direction(a65b12506e92c9,':BACKWARD').
xc_monotonicity(a65b12506e92c9,':DEFAULT').
xc_creator(a65b12506e92c9,'ABelasco').
xc_creation_date(a65b12506e92c9,19980924).
x_implies(x_isa(V1,x_BlockingAnInternationalWaterway),x_actionViolatesObligation(V1,x_ModernInternationalLawCOC)) :- x_cid(a65b12506e92ca,V1).
xc_microtheory(a65b12506e92ca,x_HPKBCrisisMt).
xc_source_file(a65b12506e92ca,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92ca,4755).
xc_kb_names(a65b12506e92ca,["?ACT"]).
xc_mapping_rows(a65b12506e92ca,['implication-implies']).
xc_direction(a65b12506e92ca,':FORWARD').
xc_monotonicity(a65b12506e92ca,':DEFAULT').
xc_creator(a65b12506e92ca,'ABelasco').
xc_creation_date(a65b12506e92ca,19980911).
x_implies(x_and(x_isa(V1,x_TakingSomeoneHostage),x_deliberateActors(V1,V2),x_isa(V2,x_Country)),x_actionViolatesObligation(V1,'x_InternationalNorm-DontTakeHostages')) :- x_cid(a65b12506e92cb,V1,V2).
xc_microtheory(a65b12506e92cb,x_HPKBCrisisMt).
xc_source_file(a65b12506e92cb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92cb,4763).
xc_kb_names(a65b12506e92cb,["?HOSTAGE","?COUNTRY"]).
xc_mapping_rows(a65b12506e92cb,['implication-implies']).
xc_direction(a65b12506e92cb,':BACKWARD').
xc_monotonicity(a65b12506e92cb,':DEFAULT').
xc_creator(a65b12506e92cb,'OKeefe').
xc_creation_date(a65b12506e92cb,19980414).
x_implies(x_and(x_isa(V1,x_TakingSomeoneHostage),x_deliberateActors(V1,V2),x_isa(V2,x_InternationalOrganization)),x_actionViolatesObligation(V1,'x_InternationalNorm-DontTakeHostages')) :- x_cid(a65b12506e92cc,V1,V2).
xc_microtheory(a65b12506e92cc,x_HPKBCrisisMt).
xc_source_file(a65b12506e92cc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92cc,4774).
xc_kb_names(a65b12506e92cc,["?HOSTAGE","?ORG"]).
xc_mapping_rows(a65b12506e92cc,['implication-implies']).
xc_direction(a65b12506e92cc,':BACKWARD').
xc_monotonicity(a65b12506e92cc,':DEFAULT').
xc_creator(a65b12506e92cc,'OKeefe').
xc_creation_date(a65b12506e92cc,19980414).
x_implies(x_and(x_isa(V1,x_HoldingHostages),x_deliberateActors(V1,V2),x_isa(V2,x_InternationalOrganization)),x_actionViolatesObligation(V1,'x_InternationalNorm-DontTakeHostages')) :- x_cid(a65b12506e92cd,V1,V2).
xc_microtheory(a65b12506e92cd,x_HPKBCrisisMt).
xc_source_file(a65b12506e92cd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92cd,4785).
xc_kb_names(a65b12506e92cd,["?HOSTAGE","?ORG"]).
xc_mapping_rows(a65b12506e92cd,['implication-implies']).
xc_direction(a65b12506e92cd,':BACKWARD').
xc_monotonicity(a65b12506e92cd,':DEFAULT').
xc_creator(a65b12506e92cd,'OKeefe').
xc_creation_date(a65b12506e92cd,19980414).
x_implies(x_and(x_isa(V1,x_HoldingHostages),x_deliberateActors(V1,V2),x_isa(V2,x_Country)),x_actionViolatesObligation(V1,'x_InternationalNorm-DontTakeHostages')) :- x_cid(a65b12506e92ce,V1,V2).
xc_microtheory(a65b12506e92ce,x_HPKBCrisisMt).
xc_source_file(a65b12506e92ce,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92ce,4796).
xc_kb_names(a65b12506e92ce,["?HOSTAGE","?COUNTRY"]).
xc_mapping_rows(a65b12506e92ce,['implication-implies']).
xc_direction(a65b12506e92ce,':BACKWARD').
xc_monotonicity(a65b12506e92ce,':DEFAULT').
xc_creator(a65b12506e92ce,'OKeefe').
xc_creation_date(a65b12506e92ce,19980414).
x_implies(x_and(x_isa(V1,x_GeopoliticalEntity),x_performedBy(V2,V1),x_isa(V2,x_BombingMission),x_damages(V2,V3),x_distanceBetween(V1,V3,V4)),x_greaterThanOrEqualTo(x_Maximum(x_TheSetOf(V5,x_and(x_genls(V5,x_BomberPlane),x_relationInstanceExistsMany(x_possesses,V1,V5))),x_FunctionToArg(2,x_vehicleRange)),V4)) :- x_cid(a65b12506e92cf,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e92cf,x_HPKBCrisisMt).
xc_source_file(a65b12506e92cf,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92cf,4807).
xc_kb_names(a65b12506e92cf,["?AGENT","?ATTACK","?TARGET","?DIST","?WEAPONTYPE"]).
xc_mapping_rows(a65b12506e92cf,['implication-implies']).
xc_direction(a65b12506e92cf,':BACKWARD').
xc_monotonicity(a65b12506e92cf,':MONOTONIC').
xc_creator(a65b12506e92cf,'Rode').
xc_creation_date(a65b12506e92cf,19980713).
x_implies(x_and(x_isa(V1,x_GeopoliticalEntity),x_performedBy(V2,V1),x_isa(V2,x_MilitaryAircraftMission),x_damages(V2,V3),x_distanceBetween(V1,V3,V4)),x_greaterThanOrEqualTo(x_Maximum(x_TheSetOf(V5,x_and(x_genls(V5,x_MilitaryAircraft),x_relationInstanceExistsMany(x_possesses,V1,V5))),x_FunctionToArg(2,x_vehicleRange)),V4)) :- x_cid(a65b12506e92d0,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e92d0,x_HPKBCrisisMt).
xc_source_file(a65b12506e92d0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92d0,4826).
xc_kb_names(a65b12506e92d0,["?AGENT","?ATTACK","?TARGET","?DIST","?WEAPONTYPE"]).
xc_mapping_rows(a65b12506e92d0,['implication-implies']).
xc_direction(a65b12506e92d0,':BACKWARD').
xc_monotonicity(a65b12506e92d0,':MONOTONIC').
xc_creator(a65b12506e92d0,'Rode').
xc_creation_date(a65b12506e92d0,19980713).
x_implies(x_and(x_genls(V1,x_EnergyStuff),x_exports(V2,V1),x_maleficiary(V3,V2),x_isa(V3,x_MilitaryAttack),x_performedBy(V3,V4),x_isa(V4,x_Country),x_exportAmountDuring(V2,V1,x_YearFn(1997),V5),x_greaterThan(x_QuotientFn(V5,V6),x_Percent(5)),x_productionAmountDuring(x_PlanetEarth,V1,x_YearFn(1997),V6)),x_holdsIn(x_STIF(V3),x_economicStability(x_EconomyFn(x_PlanetEarth),x_Low))) :- x_cid(a65b12506e92d1,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e92d1,x_HPKBCrisisMt).
xc_source_file(a65b12506e92d1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92d1,4845).
xc_kb_names(a65b12506e92d1,["?ENERGYPRODUCT","?VICTIMNATION","?ATTACK","?ATTACKER","?EXPORTAMOUNT","?WORLDWIDE"]).
xc_mapping_rows(a65b12506e92d1,['implication-implies']).
xc_direction(a65b12506e92d1,':BACKWARD').
xc_monotonicity(a65b12506e92d1,':DEFAULT').
xc_creator(a65b12506e92d1,'Lehmann').
xc_creation_date(a65b12506e92d1,19980630).
x_implies(x_and(x_isa(V1,x_UnitOfMeasure),x_greaterThan(t(V1,V2),t(V1,0)),x_exportThroughAmountDuring(V3,V4,V5,V6,t(V1,V2))),x_exportsThrough(V3,V4,V5)) :- x_cid(a65b12506e92d2,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e92d2,x_HPKBCrisisMt).
xc_source_file(a65b12506e92d2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92d2,4869).
xc_kb_names(a65b12506e92d2,["?UNIT","?NUM","?REGION","?PROD","?ROUTE","?DATE"]).
xc_mapping_rows(a65b12506e92d2,['implication-implies']).
xc_direction(a65b12506e92d2,':BACKWARD').
xc_monotonicity(a65b12506e92d2,':DEFAULT').
xc_creator(a65b12506e92d2,'Lehmann').
xc_creation_date(a65b12506e92d2,19980624).
x_implies(x_and(x_isa(V1,x_WeaponOfMassDestruction),'x_instrument-Generic'(V2,V1)),x_holdsIn(x_STIF(V2),x_economicStability(x_EconomyFn(x_PlanetEarth),x_Low))) :- x_cid(a65b12506e92d3,V1,V2).
xc_microtheory(a65b12506e92d3,x_HPKBCrisisMt).
xc_source_file(a65b12506e92d3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92d3,4883).
xc_kb_names(a65b12506e92d3,["?WEAPON","?ATTACK"]).
xc_mapping_rows(a65b12506e92d3,['implication-implies']).
xc_direction(a65b12506e92d3,':BACKWARD').
xc_monotonicity(a65b12506e92d3,':DEFAULT').
xc_creator(a65b12506e92d3,'Lehmann').
xc_creation_date(a65b12506e92d3,19980619).
x_implies(x_and(x_assertedFormula(x_inRegion(V1,V2)),x_inRegion(V1,V2),x_distanceBetween(V2,V3,V4)),x_distanceBetween(V1,V3,V4)) :- x_cid(a65b12506e92d4,V1,V2,V3,V4).
xc_microtheory(a65b12506e92d4,x_HPKBCrisisMt).
xc_source_file(a65b12506e92d4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92d4,4896).
xc_kb_names(a65b12506e92d4,["?OBJ","?LOC1","?LOC2","?INT"]).
xc_mapping_rows(a65b12506e92d4,['implication-implies']).
xc_direction(a65b12506e92d4,':BACKWARD').
xc_monotonicity(a65b12506e92d4,':MONOTONIC').
xc_creator(a65b12506e92d4,'Rode').
xc_creation_date(a65b12506e92d4,19980603).
x_implies(x_and(x_isa(V1,x_BombingMission),x_performedBy(V1,x_AirForceFn(x_Iran))),x_relationInstanceExistsMany(x_deviceUsed,V1,'x_Su-24-Bomber')) :- x_cid(a65b12506e92d5,V1).
xc_microtheory(a65b12506e92d5,x_HPKBCrisisMt).
xc_source_file(a65b12506e92d5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92d5,4908).
xc_kb_names(a65b12506e92d5,["?MISSION"]).
xc_mapping_rows(a65b12506e92d5,['implication-implies']).
xc_direction(a65b12506e92d5,':BACKWARD').
xc_monotonicity(a65b12506e92d5,':MONOTONIC').
xc_creator(a65b12506e92d5,'Rode').
xc_creation_date(a65b12506e92d5,19980603).
x_implies(x_and(x_genls(V1,x_FluidTangibleThing),x_isa(V2,x_Pipeline)),x_or(x_usesObject(V3,V2),x_importFromThroughAmountDuring(V3,V1,V4,V2,x_YearFn(1997),x_CubicFoot(0)))) :- x_cid(a65b12506e92d6,V1,V2,V3,V4).
xc_microtheory(a65b12506e92d6,x_HPKBCrisisMt).
xc_source_file(a65b12506e92d6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92d6,4919).
xc_kb_names(a65b12506e92d6,["?PRODUCT-TYPE","?PIPELINE","?COUNTRY","?COUNTRY2"]).
xc_mapping_rows(a65b12506e92d6,['implication-implies']).
xc_direction(a65b12506e92d6,':BACKWARD').
xc_monotonicity(a65b12506e92d6,':DEFAULT').
xc_creator(a65b12506e92d6,'Schwartz').
xc_creation_date(a65b12506e92d6,19980629).
x_goals(x_SaudiArabia,x_pathState(x_SuezCanal,x_PathOpen)) :- x_cid(a65b12506e92d7).
xc_microtheory(a65b12506e92d7,x_HPKBCrisisMt).
xc_source_file(a65b12506e92d7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92d7,4933).
xc_kb_names(a65b12506e92d7,[]).
xc_mapping_rows(a65b12506e92d7,[]).
xc_direction(a65b12506e92d7,':FORWARD').
xc_monotonicity(a65b12506e92d7,':DEFAULT').
x_goalCategoryForAgent(x_SaudiArabia,x_pathState(x_SuezCanal,x_PathOpen),x_PoliticalGoal) :- x_cid(a65b12506e92d8).
xc_microtheory(a65b12506e92d8,x_HPKBCrisisMt).
xc_source_file(a65b12506e92d8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92d8,4940).
xc_kb_names(a65b12506e92d8,[]).
xc_mapping_rows(a65b12506e92d8,[]).
xc_direction(a65b12506e92d8,':FORWARD').
xc_monotonicity(a65b12506e92d8,':DEFAULT').
x_goalCategoryForAgent(x_SaudiArabia,x_pathState(x_SuezCanal,x_PathOpen),x_StrategicInterest) :- x_cid(a65b12506e92d9).
xc_microtheory(a65b12506e92d9,x_HPKBCrisisMt).
xc_source_file(a65b12506e92d9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92d9,4947).
xc_kb_names(a65b12506e92d9,[]).
xc_mapping_rows(a65b12506e92d9,[]).
xc_direction(a65b12506e92d9,':FORWARD').
xc_monotonicity(a65b12506e92d9,':DEFAULT').
x_goalCategoryForAgent(x_SaudiArabia,x_pathState(x_SuezCanal,x_PathOpen),x_StrategicNationalInterest) :- x_cid(a65b12506e92da).
xc_microtheory(a65b12506e92da,x_HPKBCrisisMt).
xc_source_file(a65b12506e92da,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92da,4954).
xc_kb_names(a65b12506e92da,[]).
xc_mapping_rows(a65b12506e92da,[]).
xc_direction(a65b12506e92da,':FORWARD').
xc_monotonicity(a65b12506e92da,':DEFAULT').
x_goalCategoryForAgent(x_SaudiArabia,x_pathState(x_SuezCanal,x_PathOpen),x_ForeignPolicyGoal) :- x_cid(a65b12506e92db).
xc_microtheory(a65b12506e92db,x_HPKBCrisisMt).
xc_source_file(a65b12506e92db,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92db,4961).
xc_kb_names(a65b12506e92db,[]).
xc_mapping_rows(a65b12506e92db,[]).
xc_direction(a65b12506e92db,':FORWARD').
xc_monotonicity(a65b12506e92db,':DEFAULT').
x_goals(x_SaudiArabia,x_pathState(x_StraitOfHormuz,x_PathOpen)) :- x_cid(a65b12506e92dc).
xc_microtheory(a65b12506e92dc,x_HPKBCrisisMt).
xc_source_file(a65b12506e92dc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92dc,4968).
xc_kb_names(a65b12506e92dc,[]).
xc_mapping_rows(a65b12506e92dc,[]).
xc_direction(a65b12506e92dc,':FORWARD').
xc_monotonicity(a65b12506e92dc,':DEFAULT').
x_goalCategoryForAgent(x_SaudiArabia,x_pathState(x_StraitOfHormuz,x_PathOpen),x_PoliticalGoal) :- x_cid(a65b12506e92dd).
xc_microtheory(a65b12506e92dd,x_HPKBCrisisMt).
xc_source_file(a65b12506e92dd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92dd,4975).
xc_kb_names(a65b12506e92dd,[]).
xc_mapping_rows(a65b12506e92dd,[]).
xc_direction(a65b12506e92dd,':FORWARD').
xc_monotonicity(a65b12506e92dd,':DEFAULT').
x_goalCategoryForAgent(x_SaudiArabia,x_pathState(x_StraitOfHormuz,x_PathOpen),x_StrategicInterest) :- x_cid(a65b12506e92de).
xc_microtheory(a65b12506e92de,x_HPKBCrisisMt).
xc_source_file(a65b12506e92de,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92de,4982).
xc_kb_names(a65b12506e92de,[]).
xc_mapping_rows(a65b12506e92de,[]).
xc_direction(a65b12506e92de,':FORWARD').
xc_monotonicity(a65b12506e92de,':DEFAULT').
x_goalCategoryForAgent(x_SaudiArabia,x_pathState(x_StraitOfHormuz,x_PathOpen),x_StrategicNationalInterest) :- x_cid(a65b12506e92df).
xc_microtheory(a65b12506e92df,x_HPKBCrisisMt).
xc_source_file(a65b12506e92df,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92df,4989).
xc_kb_names(a65b12506e92df,[]).
xc_mapping_rows(a65b12506e92df,[]).
xc_direction(a65b12506e92df,':FORWARD').
xc_monotonicity(a65b12506e92df,':DEFAULT').
x_goalCategoryForAgent(x_SaudiArabia,x_pathState(x_StraitOfHormuz,x_PathOpen),x_ForeignPolicyGoal) :- x_cid(a65b12506e92e0).
xc_microtheory(a65b12506e92e0,x_HPKBCrisisMt).
xc_source_file(a65b12506e92e0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92e0,4996).
xc_kb_names(a65b12506e92e0,[]).
xc_mapping_rows(a65b12506e92e0,[]).
xc_direction(a65b12506e92e0,':FORWARD').
xc_monotonicity(a65b12506e92e0,':DEFAULT').
x_goals(x_UnitedKingdomOfGreatBritainAndNorthernIreland,x_pathState(x_SuezCanal,x_PathOpen)) :- x_cid(a65b12506e92e1).
xc_microtheory(a65b12506e92e1,x_HPKBCrisisMt).
xc_source_file(a65b12506e92e1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92e1,5003).
xc_kb_names(a65b12506e92e1,[]).
xc_mapping_rows(a65b12506e92e1,[]).
xc_direction(a65b12506e92e1,':FORWARD').
xc_monotonicity(a65b12506e92e1,':DEFAULT').
x_goalCategoryForAgent(x_UnitedKingdomOfGreatBritainAndNorthernIreland,x_pathState(x_SuezCanal,x_PathOpen),x_PoliticalGoal) :- x_cid(a65b12506e92e2).
xc_microtheory(a65b12506e92e2,x_HPKBCrisisMt).
xc_source_file(a65b12506e92e2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92e2,5010).
xc_kb_names(a65b12506e92e2,[]).
xc_mapping_rows(a65b12506e92e2,[]).
xc_direction(a65b12506e92e2,':FORWARD').
xc_monotonicity(a65b12506e92e2,':DEFAULT').
x_goalCategoryForAgent(x_UnitedKingdomOfGreatBritainAndNorthernIreland,x_pathState(x_SuezCanal,x_PathOpen),x_StrategicInterest) :- x_cid(a65b12506e92e3).
xc_microtheory(a65b12506e92e3,x_HPKBCrisisMt).
xc_source_file(a65b12506e92e3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92e3,5017).
xc_kb_names(a65b12506e92e3,[]).
xc_mapping_rows(a65b12506e92e3,[]).
xc_direction(a65b12506e92e3,':FORWARD').
xc_monotonicity(a65b12506e92e3,':DEFAULT').
x_goalCategoryForAgent(x_UnitedKingdomOfGreatBritainAndNorthernIreland,x_pathState(x_SuezCanal,x_PathOpen),x_StrategicNationalInterest) :- x_cid(a65b12506e92e4).
xc_microtheory(a65b12506e92e4,x_HPKBCrisisMt).
xc_source_file(a65b12506e92e4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92e4,5024).
xc_kb_names(a65b12506e92e4,[]).
xc_mapping_rows(a65b12506e92e4,[]).
xc_direction(a65b12506e92e4,':FORWARD').
xc_monotonicity(a65b12506e92e4,':DEFAULT').
x_goalCategoryForAgent(x_UnitedKingdomOfGreatBritainAndNorthernIreland,x_pathState(x_SuezCanal,x_PathOpen),x_ForeignPolicyGoal) :- x_cid(a65b12506e92e5).
xc_microtheory(a65b12506e92e5,x_HPKBCrisisMt).
xc_source_file(a65b12506e92e5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92e5,5031).
xc_kb_names(a65b12506e92e5,[]).
xc_mapping_rows(a65b12506e92e5,[]).
xc_direction(a65b12506e92e5,':FORWARD').
xc_monotonicity(a65b12506e92e5,':DEFAULT').
x_goals(x_UnitedKingdomOfGreatBritainAndNorthernIreland,x_pathState(x_StraitOfHormuz,x_PathOpen)) :- x_cid(a65b12506e92e6).
xc_microtheory(a65b12506e92e6,x_HPKBCrisisMt).
xc_source_file(a65b12506e92e6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92e6,5038).
xc_kb_names(a65b12506e92e6,[]).
xc_mapping_rows(a65b12506e92e6,[]).
xc_direction(a65b12506e92e6,':FORWARD').
xc_monotonicity(a65b12506e92e6,':DEFAULT').
x_goalCategoryForAgent(x_UnitedKingdomOfGreatBritainAndNorthernIreland,x_pathState(x_StraitOfHormuz,x_PathOpen),x_PoliticalGoal) :- x_cid(a65b12506e92e7).
xc_microtheory(a65b12506e92e7,x_HPKBCrisisMt).
xc_source_file(a65b12506e92e7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92e7,5045).
xc_kb_names(a65b12506e92e7,[]).
xc_mapping_rows(a65b12506e92e7,[]).
xc_direction(a65b12506e92e7,':FORWARD').
xc_monotonicity(a65b12506e92e7,':DEFAULT').
x_goalCategoryForAgent(x_UnitedKingdomOfGreatBritainAndNorthernIreland,x_pathState(x_StraitOfHormuz,x_PathOpen),x_StrategicInterest) :- x_cid(a65b12506e92e8).
xc_microtheory(a65b12506e92e8,x_HPKBCrisisMt).
xc_source_file(a65b12506e92e8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92e8,5052).
xc_kb_names(a65b12506e92e8,[]).
xc_mapping_rows(a65b12506e92e8,[]).
xc_direction(a65b12506e92e8,':FORWARD').
xc_monotonicity(a65b12506e92e8,':DEFAULT').
x_goalCategoryForAgent(x_UnitedKingdomOfGreatBritainAndNorthernIreland,x_pathState(x_StraitOfHormuz,x_PathOpen),x_StrategicNationalInterest) :- x_cid(a65b12506e92e9).
xc_microtheory(a65b12506e92e9,x_HPKBCrisisMt).
xc_source_file(a65b12506e92e9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92e9,5059).
xc_kb_names(a65b12506e92e9,[]).
xc_mapping_rows(a65b12506e92e9,[]).
xc_direction(a65b12506e92e9,':FORWARD').
xc_monotonicity(a65b12506e92e9,':DEFAULT').
x_goalCategoryForAgent(x_UnitedKingdomOfGreatBritainAndNorthernIreland,x_pathState(x_StraitOfHormuz,x_PathOpen),x_ForeignPolicyGoal) :- x_cid(a65b12506e92ea).
xc_microtheory(a65b12506e92ea,x_HPKBCrisisMt).
xc_source_file(a65b12506e92ea,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92ea,5066).
xc_kb_names(a65b12506e92ea,[]).
xc_mapping_rows(a65b12506e92ea,[]).
xc_direction(a65b12506e92ea,':FORWARD').
xc_monotonicity(a65b12506e92ea,':DEFAULT').
x_goals(x_UnitedStatesOfAmerica,x_pathState(x_StraitOfHormuz,x_PathOpen)) :- x_cid(a65b12506e92eb).
xc_microtheory(a65b12506e92eb,x_HPKBCrisisMt).
xc_source_file(a65b12506e92eb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92eb,5073).
xc_kb_names(a65b12506e92eb,[]).
xc_mapping_rows(a65b12506e92eb,[]).
xc_direction(a65b12506e92eb,':FORWARD').
xc_monotonicity(a65b12506e92eb,':DEFAULT').
x_goalCategoryForAgent(x_UnitedStatesOfAmerica,x_pathState(x_StraitOfHormuz,x_PathOpen),x_PoliticalGoal) :- x_cid(a65b12506e92ec).
xc_microtheory(a65b12506e92ec,x_HPKBCrisisMt).
xc_source_file(a65b12506e92ec,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92ec,5080).
xc_kb_names(a65b12506e92ec,[]).
xc_mapping_rows(a65b12506e92ec,[]).
xc_direction(a65b12506e92ec,':FORWARD').
xc_monotonicity(a65b12506e92ec,':DEFAULT').
x_goalCategoryForAgent(x_UnitedStatesOfAmerica,x_pathState(x_StraitOfHormuz,x_PathOpen),x_StrategicInterest) :- x_cid(a65b12506e92ed).
xc_microtheory(a65b12506e92ed,x_HPKBCrisisMt).
xc_source_file(a65b12506e92ed,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92ed,5087).
xc_kb_names(a65b12506e92ed,[]).
xc_mapping_rows(a65b12506e92ed,[]).
xc_direction(a65b12506e92ed,':FORWARD').
xc_monotonicity(a65b12506e92ed,':DEFAULT').
x_goalCategoryForAgent(x_UnitedStatesOfAmerica,x_pathState(x_StraitOfHormuz,x_PathOpen),x_StrategicNationalInterest) :- x_cid(a65b12506e92ee).
xc_microtheory(a65b12506e92ee,x_HPKBCrisisMt).
xc_source_file(a65b12506e92ee,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92ee,5094).
xc_kb_names(a65b12506e92ee,[]).
xc_mapping_rows(a65b12506e92ee,[]).
xc_direction(a65b12506e92ee,':FORWARD').
xc_monotonicity(a65b12506e92ee,':DEFAULT').
x_goalCategoryForAgent(x_UnitedStatesOfAmerica,x_pathState(x_StraitOfHormuz,x_PathOpen),x_ForeignPolicyGoal) :- x_cid(a65b12506e92ef).
xc_microtheory(a65b12506e92ef,x_HPKBCrisisMt).
xc_source_file(a65b12506e92ef,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92ef,5101).
xc_kb_names(a65b12506e92ef,[]).
xc_mapping_rows(a65b12506e92ef,[]).
xc_direction(a65b12506e92ef,':FORWARD').
xc_monotonicity(a65b12506e92ef,':DEFAULT').
x_goals(x_Canada,x_pathState(x_SuezCanal,x_PathOpen)) :- x_cid(a65b12506e92f0).
xc_microtheory(a65b12506e92f0,x_HPKBCrisisMt).
xc_source_file(a65b12506e92f0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92f0,5108).
xc_kb_names(a65b12506e92f0,[]).
xc_mapping_rows(a65b12506e92f0,[]).
xc_direction(a65b12506e92f0,':FORWARD').
xc_monotonicity(a65b12506e92f0,':DEFAULT').
x_goalCategoryForAgent(x_Canada,x_pathState(x_SuezCanal,x_PathOpen),x_PoliticalGoal) :- x_cid(a65b12506e92f1).
xc_microtheory(a65b12506e92f1,x_HPKBCrisisMt).
xc_source_file(a65b12506e92f1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92f1,5115).
xc_kb_names(a65b12506e92f1,[]).
xc_mapping_rows(a65b12506e92f1,[]).
xc_direction(a65b12506e92f1,':FORWARD').
xc_monotonicity(a65b12506e92f1,':DEFAULT').
x_goalCategoryForAgent(x_Canada,x_pathState(x_SuezCanal,x_PathOpen),x_StrategicInterest) :- x_cid(a65b12506e92f2).
xc_microtheory(a65b12506e92f2,x_HPKBCrisisMt).
xc_source_file(a65b12506e92f2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92f2,5122).
xc_kb_names(a65b12506e92f2,[]).
xc_mapping_rows(a65b12506e92f2,[]).
xc_direction(a65b12506e92f2,':FORWARD').
xc_monotonicity(a65b12506e92f2,':DEFAULT').
x_goalCategoryForAgent(x_Canada,x_pathState(x_SuezCanal,x_PathOpen),x_StrategicNationalInterest) :- x_cid(a65b12506e92f3).
xc_microtheory(a65b12506e92f3,x_HPKBCrisisMt).
xc_source_file(a65b12506e92f3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92f3,5129).
xc_kb_names(a65b12506e92f3,[]).
xc_mapping_rows(a65b12506e92f3,[]).
xc_direction(a65b12506e92f3,':FORWARD').
xc_monotonicity(a65b12506e92f3,':DEFAULT').
x_goalCategoryForAgent(x_Canada,x_pathState(x_SuezCanal,x_PathOpen),x_ForeignPolicyGoal) :- x_cid(a65b12506e92f4).
xc_microtheory(a65b12506e92f4,x_HPKBCrisisMt).
xc_source_file(a65b12506e92f4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92f4,5136).
xc_kb_names(a65b12506e92f4,[]).
xc_mapping_rows(a65b12506e92f4,[]).
xc_direction(a65b12506e92f4,':FORWARD').
xc_monotonicity(a65b12506e92f4,':DEFAULT').
x_goals(x_Canada,x_pathState(x_StraitOfHormuz,x_PathOpen)) :- x_cid(a65b12506e92f5).
xc_microtheory(a65b12506e92f5,x_HPKBCrisisMt).
xc_source_file(a65b12506e92f5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92f5,5143).
xc_kb_names(a65b12506e92f5,[]).
xc_mapping_rows(a65b12506e92f5,[]).
xc_direction(a65b12506e92f5,':FORWARD').
xc_monotonicity(a65b12506e92f5,':DEFAULT').
x_goalCategoryForAgent(x_Canada,x_pathState(x_StraitOfHormuz,x_PathOpen),x_PoliticalGoal) :- x_cid(a65b12506e92f6).
xc_microtheory(a65b12506e92f6,x_HPKBCrisisMt).
xc_source_file(a65b12506e92f6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92f6,5150).
xc_kb_names(a65b12506e92f6,[]).
xc_mapping_rows(a65b12506e92f6,[]).
xc_direction(a65b12506e92f6,':FORWARD').
xc_monotonicity(a65b12506e92f6,':DEFAULT').
x_goalCategoryForAgent(x_Canada,x_pathState(x_StraitOfHormuz,x_PathOpen),x_StrategicInterest) :- x_cid(a65b12506e92f7).
xc_microtheory(a65b12506e92f7,x_HPKBCrisisMt).
xc_source_file(a65b12506e92f7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92f7,5157).
xc_kb_names(a65b12506e92f7,[]).
xc_mapping_rows(a65b12506e92f7,[]).
xc_direction(a65b12506e92f7,':FORWARD').
xc_monotonicity(a65b12506e92f7,':DEFAULT').
x_goalCategoryForAgent(x_Canada,x_pathState(x_StraitOfHormuz,x_PathOpen),x_StrategicNationalInterest) :- x_cid(a65b12506e92f8).
xc_microtheory(a65b12506e92f8,x_HPKBCrisisMt).
xc_source_file(a65b12506e92f8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92f8,5164).
xc_kb_names(a65b12506e92f8,[]).
xc_mapping_rows(a65b12506e92f8,[]).
xc_direction(a65b12506e92f8,':FORWARD').
xc_monotonicity(a65b12506e92f8,':DEFAULT').
x_goalCategoryForAgent(x_Canada,x_pathState(x_StraitOfHormuz,x_PathOpen),x_ForeignPolicyGoal) :- x_cid(a65b12506e92f9).
xc_microtheory(a65b12506e92f9,x_HPKBCrisisMt).
xc_source_file(a65b12506e92f9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92f9,5171).
xc_kb_names(a65b12506e92f9,[]).
xc_mapping_rows(a65b12506e92f9,[]).
xc_direction(a65b12506e92f9,':FORWARD').
xc_monotonicity(a65b12506e92f9,':DEFAULT').
x_goals(x_Japan,x_pathState(x_SuezCanal,x_PathOpen)) :- x_cid(a65b12506e92fa).
xc_microtheory(a65b12506e92fa,x_HPKBCrisisMt).
xc_source_file(a65b12506e92fa,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92fa,5178).
xc_kb_names(a65b12506e92fa,[]).
xc_mapping_rows(a65b12506e92fa,[]).
xc_direction(a65b12506e92fa,':FORWARD').
xc_monotonicity(a65b12506e92fa,':DEFAULT').
x_goalCategoryForAgent(x_Japan,x_pathState(x_SuezCanal,x_PathOpen),x_PoliticalGoal) :- x_cid(a65b12506e92fb).
xc_microtheory(a65b12506e92fb,x_HPKBCrisisMt).
xc_source_file(a65b12506e92fb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92fb,5185).
xc_kb_names(a65b12506e92fb,[]).
xc_mapping_rows(a65b12506e92fb,[]).
xc_direction(a65b12506e92fb,':FORWARD').
xc_monotonicity(a65b12506e92fb,':DEFAULT').
x_goalCategoryForAgent(x_Japan,x_pathState(x_SuezCanal,x_PathOpen),x_StrategicInterest) :- x_cid(a65b12506e92fc).
xc_microtheory(a65b12506e92fc,x_HPKBCrisisMt).
xc_source_file(a65b12506e92fc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92fc,5192).
xc_kb_names(a65b12506e92fc,[]).
xc_mapping_rows(a65b12506e92fc,[]).
xc_direction(a65b12506e92fc,':FORWARD').
xc_monotonicity(a65b12506e92fc,':DEFAULT').
x_goalCategoryForAgent(x_Japan,x_pathState(x_SuezCanal,x_PathOpen),x_StrategicNationalInterest) :- x_cid(a65b12506e92fd).
xc_microtheory(a65b12506e92fd,x_HPKBCrisisMt).
xc_source_file(a65b12506e92fd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92fd,5199).
xc_kb_names(a65b12506e92fd,[]).
xc_mapping_rows(a65b12506e92fd,[]).
xc_direction(a65b12506e92fd,':FORWARD').
xc_monotonicity(a65b12506e92fd,':DEFAULT').
x_goalCategoryForAgent(x_Japan,x_pathState(x_SuezCanal,x_PathOpen),x_ForeignPolicyGoal) :- x_cid(a65b12506e92fe).
xc_microtheory(a65b12506e92fe,x_HPKBCrisisMt).
xc_source_file(a65b12506e92fe,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92fe,5206).
xc_kb_names(a65b12506e92fe,[]).
xc_mapping_rows(a65b12506e92fe,[]).
xc_direction(a65b12506e92fe,':FORWARD').
xc_monotonicity(a65b12506e92fe,':DEFAULT').
x_goals(x_Japan,x_pathState(x_StraitOfHormuz,x_PathOpen)) :- x_cid(a65b12506e92ff).
xc_microtheory(a65b12506e92ff,x_HPKBCrisisMt).
xc_source_file(a65b12506e92ff,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e92ff,5213).
xc_kb_names(a65b12506e92ff,[]).
xc_mapping_rows(a65b12506e92ff,[]).
xc_direction(a65b12506e92ff,':FORWARD').
xc_monotonicity(a65b12506e92ff,':DEFAULT').
x_goalCategoryForAgent(x_Japan,x_pathState(x_StraitOfHormuz,x_PathOpen),x_PoliticalGoal) :- x_cid(a65b12506e9300).
xc_microtheory(a65b12506e9300,x_HPKBCrisisMt).
xc_source_file(a65b12506e9300,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9300,5220).
xc_kb_names(a65b12506e9300,[]).
xc_mapping_rows(a65b12506e9300,[]).
xc_direction(a65b12506e9300,':FORWARD').
xc_monotonicity(a65b12506e9300,':DEFAULT').
x_goalCategoryForAgent(x_Japan,x_pathState(x_StraitOfHormuz,x_PathOpen),x_StrategicInterest) :- x_cid(a65b12506e9301).
xc_microtheory(a65b12506e9301,x_HPKBCrisisMt).
xc_source_file(a65b12506e9301,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9301,5227).
xc_kb_names(a65b12506e9301,[]).
xc_mapping_rows(a65b12506e9301,[]).
xc_direction(a65b12506e9301,':FORWARD').
xc_monotonicity(a65b12506e9301,':DEFAULT').
x_goalCategoryForAgent(x_Japan,x_pathState(x_StraitOfHormuz,x_PathOpen),x_StrategicNationalInterest) :- x_cid(a65b12506e9302).
xc_microtheory(a65b12506e9302,x_HPKBCrisisMt).
xc_source_file(a65b12506e9302,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9302,5234).
xc_kb_names(a65b12506e9302,[]).
xc_mapping_rows(a65b12506e9302,[]).
xc_direction(a65b12506e9302,':FORWARD').
xc_monotonicity(a65b12506e9302,':DEFAULT').
x_goalCategoryForAgent(x_Japan,x_pathState(x_StraitOfHormuz,x_PathOpen),x_ForeignPolicyGoal) :- x_cid(a65b12506e9303).
xc_microtheory(a65b12506e9303,x_HPKBCrisisMt).
xc_source_file(a65b12506e9303,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9303,5241).
xc_kb_names(a65b12506e9303,[]).
xc_mapping_rows(a65b12506e9303,[]).
xc_direction(a65b12506e9303,':FORWARD').
xc_monotonicity(a65b12506e9303,':DEFAULT').
x_goals(x_UnitedStatesOfAmerica,x_pathState(x_SuezCanal,x_PathOpen)) :- x_cid(a65b12506e9304).
xc_microtheory(a65b12506e9304,x_HPKBCrisisMt).
xc_source_file(a65b12506e9304,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9304,5248).
xc_kb_names(a65b12506e9304,[]).
xc_mapping_rows(a65b12506e9304,[]).
xc_direction(a65b12506e9304,':FORWARD').
xc_monotonicity(a65b12506e9304,':DEFAULT').
x_goalCategoryForAgent(x_UnitedStatesOfAmerica,x_pathState(x_SuezCanal,x_PathOpen),x_PoliticalGoal) :- x_cid(a65b12506e9305).
xc_microtheory(a65b12506e9305,x_HPKBCrisisMt).
xc_source_file(a65b12506e9305,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9305,5255).
xc_kb_names(a65b12506e9305,[]).
xc_mapping_rows(a65b12506e9305,[]).
xc_direction(a65b12506e9305,':FORWARD').
xc_monotonicity(a65b12506e9305,':DEFAULT').
x_goalCategoryForAgent(x_UnitedStatesOfAmerica,x_pathState(x_SuezCanal,x_PathOpen),x_StrategicInterest) :- x_cid(a65b12506e9306).
xc_microtheory(a65b12506e9306,x_HPKBCrisisMt).
xc_source_file(a65b12506e9306,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9306,5262).
xc_kb_names(a65b12506e9306,[]).
xc_mapping_rows(a65b12506e9306,[]).
xc_direction(a65b12506e9306,':FORWARD').
xc_monotonicity(a65b12506e9306,':DEFAULT').
x_goalCategoryForAgent(x_UnitedStatesOfAmerica,x_pathState(x_SuezCanal,x_PathOpen),x_StrategicNationalInterest) :- x_cid(a65b12506e9307).
xc_microtheory(a65b12506e9307,x_HPKBCrisisMt).
xc_source_file(a65b12506e9307,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9307,5269).
xc_kb_names(a65b12506e9307,[]).
xc_mapping_rows(a65b12506e9307,[]).
xc_direction(a65b12506e9307,':FORWARD').
xc_monotonicity(a65b12506e9307,':DEFAULT').
x_goalCategoryForAgent(x_UnitedStatesOfAmerica,x_pathState(x_SuezCanal,x_PathOpen),x_ForeignPolicyGoal) :- x_cid(a65b12506e9308).
xc_microtheory(a65b12506e9308,x_HPKBCrisisMt).
xc_source_file(a65b12506e9308,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9308,5276).
xc_kb_names(a65b12506e9308,[]).
xc_mapping_rows(a65b12506e9308,[]).
xc_direction(a65b12506e9308,':FORWARD').
xc_monotonicity(a65b12506e9308,':DEFAULT').
x_goalCategoryForAgent(x_SaudiArabia,x_pathState(x_SuezCanal,x_PathOpen),x_AidingAllies) :- x_cid(a65b12506e9309).
xc_microtheory(a65b12506e9309,x_HPKBCrisisMt).
xc_source_file(a65b12506e9309,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9309,5283).
xc_kb_names(a65b12506e9309,[]).
xc_mapping_rows(a65b12506e9309,[]).
xc_direction(a65b12506e9309,':FORWARD').
xc_monotonicity(a65b12506e9309,':DEFAULT').
x_goalCategoryForAgent(x_SaudiArabia,x_pathState(x_StraitOfHormuz,x_PathOpen),x_AidingAllies) :- x_cid(a65b12506e930a).
xc_microtheory(a65b12506e930a,x_HPKBCrisisMt).
xc_source_file(a65b12506e930a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e930a,5290).
xc_kb_names(a65b12506e930a,[]).
xc_mapping_rows(a65b12506e930a,[]).
xc_direction(a65b12506e930a,':FORWARD').
xc_monotonicity(a65b12506e930a,':DEFAULT').
x_goalCategoryForAgent(x_UnitedKingdomOfGreatBritainAndNorthernIreland,x_pathState(x_SuezCanal,x_PathOpen),x_AidingAllies) :- x_cid(a65b12506e930b).
xc_microtheory(a65b12506e930b,x_HPKBCrisisMt).
xc_source_file(a65b12506e930b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e930b,5297).
xc_kb_names(a65b12506e930b,[]).
xc_mapping_rows(a65b12506e930b,[]).
xc_direction(a65b12506e930b,':FORWARD').
xc_monotonicity(a65b12506e930b,':DEFAULT').
x_goalCategoryForAgent(x_UnitedKingdomOfGreatBritainAndNorthernIreland,x_pathState(x_StraitOfHormuz,x_PathOpen),x_AidingAllies) :- x_cid(a65b12506e930c).
xc_microtheory(a65b12506e930c,x_HPKBCrisisMt).
xc_source_file(a65b12506e930c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e930c,5304).
xc_kb_names(a65b12506e930c,[]).
xc_mapping_rows(a65b12506e930c,[]).
xc_direction(a65b12506e930c,':FORWARD').
xc_monotonicity(a65b12506e930c,':DEFAULT').
x_goalCategoryForAgent(x_UnitedStatesOfAmerica,x_pathState(x_StraitOfHormuz,x_PathOpen),x_AidingAllies) :- x_cid(a65b12506e930d).
xc_microtheory(a65b12506e930d,x_HPKBCrisisMt).
xc_source_file(a65b12506e930d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e930d,5311).
xc_kb_names(a65b12506e930d,[]).
xc_mapping_rows(a65b12506e930d,[]).
xc_direction(a65b12506e930d,':FORWARD').
xc_monotonicity(a65b12506e930d,':DEFAULT').
x_goalCategoryForAgent(x_Canada,x_pathState(x_SuezCanal,x_PathOpen),x_AidingAllies) :- x_cid(a65b12506e930e).
xc_microtheory(a65b12506e930e,x_HPKBCrisisMt).
xc_source_file(a65b12506e930e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e930e,5318).
xc_kb_names(a65b12506e930e,[]).
xc_mapping_rows(a65b12506e930e,[]).
xc_direction(a65b12506e930e,':FORWARD').
xc_monotonicity(a65b12506e930e,':DEFAULT').
x_goalCategoryForAgent(x_Canada,x_pathState(x_StraitOfHormuz,x_PathOpen),x_AidingAllies) :- x_cid(a65b12506e930f).
xc_microtheory(a65b12506e930f,x_HPKBCrisisMt).
xc_source_file(a65b12506e930f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e930f,5325).
xc_kb_names(a65b12506e930f,[]).
xc_mapping_rows(a65b12506e930f,[]).
xc_direction(a65b12506e930f,':FORWARD').
xc_monotonicity(a65b12506e930f,':DEFAULT').
x_goalCategoryForAgent(x_Japan,x_pathState(x_SuezCanal,x_PathOpen),x_AidingAllies) :- x_cid(a65b12506e9310).
xc_microtheory(a65b12506e9310,x_HPKBCrisisMt).
xc_source_file(a65b12506e9310,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9310,5332).
xc_kb_names(a65b12506e9310,[]).
xc_mapping_rows(a65b12506e9310,[]).
xc_direction(a65b12506e9310,':FORWARD').
xc_monotonicity(a65b12506e9310,':DEFAULT').
x_goalCategoryForAgent(x_Japan,x_pathState(x_StraitOfHormuz,x_PathOpen),x_AidingAllies) :- x_cid(a65b12506e9311).
xc_microtheory(a65b12506e9311,x_HPKBCrisisMt).
xc_source_file(a65b12506e9311,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9311,5339).
xc_kb_names(a65b12506e9311,[]).
xc_mapping_rows(a65b12506e9311,[]).
xc_direction(a65b12506e9311,':FORWARD').
xc_monotonicity(a65b12506e9311,':DEFAULT').
x_goalCategoryForAgent(x_UnitedStatesOfAmerica,x_pathState(x_SuezCanal,x_PathOpen),x_AidingAllies) :- x_cid(a65b12506e9312).
xc_microtheory(a65b12506e9312,x_HPKBCrisisMt).
xc_source_file(a65b12506e9312,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9312,5346).
xc_kb_names(a65b12506e9312,[]).
xc_mapping_rows(a65b12506e9312,[]).
xc_direction(a65b12506e9312,':FORWARD').
xc_monotonicity(a65b12506e9312,':DEFAULT').
x_quantityInfluenceFunctionStrength(x_MtTimeFn(x_CIAWorldFactbook1997Mt),x_PetroleumProduct,x_Kappa(t(V1,V2),x_supplyRate(x_Iran,V1,V2)),x_StabilizingFunction,x_Positive) :- x_cid(a65b12506e9313,V1,V2).
xc_microtheory(a65b12506e9313,x_HPKBCrisisMt).
xc_source_file(a65b12506e9313,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9313,5353).
xc_kb_names(a65b12506e9313,["?PRODUCT-1","?PRICE-1"]).
xc_mapping_rows(a65b12506e9313,[]).
xc_direction(a65b12506e9313,':FORWARD').
xc_monotonicity(a65b12506e9313,':DEFAULT').
x_quantityInfluenceFunctionStrength(x_MtTimeFn(x_EIAPagesMt),x_PetroleumProduct,x_Kappa(t(V1,V2),x_supplyRate(x_Libya,V1,V2)),x_StabilizingFunction,x_Positive) :- x_cid(a65b12506e9314,V1,V2).
xc_microtheory(a65b12506e9314,x_HPKBCrisisMt).
xc_source_file(a65b12506e9314,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9314,5363).
xc_kb_names(a65b12506e9314,["?PRODUCT-1","?PRICE-1"]).
xc_mapping_rows(a65b12506e9314,[]).
xc_direction(a65b12506e9314,':FORWARD').
xc_monotonicity(a65b12506e9314,':DEFAULT').
x_quantityInfluenceFunction(x_MtTimeFn(x_CIAWorldFactbook1997Mt),x_PetroleumProduct,x_Kappa(t(V1,V2),x_supplyRate(x_Iran,V1,V2)),x_StabilizingFunction) :- x_cid(a65b12506e9315,V1,V2).
xc_microtheory(a65b12506e9315,x_HPKBCrisisMt).
xc_source_file(a65b12506e9315,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9315,5373).
xc_kb_names(a65b12506e9315,["?PROD","?PRICE"]).
xc_mapping_rows(a65b12506e9315,[]).
xc_direction(a65b12506e9315,':FORWARD').
xc_monotonicity(a65b12506e9315,':DEFAULT').
x_quantityInfluenceFunction(x_MtTimeFn(x_EIAPagesMt),x_PetroleumProduct,x_Kappa(t(V1,V2),x_supplyRate(x_Libya,V1,V2)),x_StabilizingFunction) :- x_cid(a65b12506e9316,V1,V2).
xc_microtheory(a65b12506e9316,x_HPKBCrisisMt).
xc_source_file(a65b12506e9316,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9316,5383).
xc_kb_names(a65b12506e9316,["?PROD","?PRICE"]).
xc_mapping_rows(a65b12506e9316,[]).
xc_direction(a65b12506e9316,':FORWARD').
xc_monotonicity(a65b12506e9316,':DEFAULT').
x_quantityInfluenceFunctionStrength(x_MtTimeFn(x_EIAPagesMt),x_PetroleumProduct,x_Kappa(t(V1,V2),x_priceChargedFor(x_Libya,V1,V2)),x_StabilizingFunction,x_Positive) :- x_cid(a65b12506e9317,V1,V2).
xc_microtheory(a65b12506e9317,x_HPKBCrisisMt).
xc_source_file(a65b12506e9317,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9317,5393).
xc_kb_names(a65b12506e9317,["?PRODUCT-1","?PRICE-1"]).
xc_mapping_rows(a65b12506e9317,[]).
xc_direction(a65b12506e9317,':FORWARD').
xc_monotonicity(a65b12506e9317,':DEFAULT').
x_quantityInfluenceFunction(x_MtTimeFn(x_EIAPagesMt),x_PetroleumProduct,x_Kappa(t(V1,V2),x_priceChargedFor(x_Libya,V1,V2)),x_StabilizingFunction) :- x_cid(a65b12506e9318,V1,V2).
xc_microtheory(a65b12506e9318,x_HPKBCrisisMt).
xc_source_file(a65b12506e9318,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9318,5403).
xc_kb_names(a65b12506e9318,["?PROD","?PRICE"]).
xc_mapping_rows(a65b12506e9318,[]).
xc_direction(a65b12506e9318,':FORWARD').
xc_monotonicity(a65b12506e9318,':DEFAULT').
x_quantityInfluenceFunctionStrength(x_MtTimeFn(x_CIAWorldFactbook1997Mt),x_PetroleumProduct,x_Kappa(t(V1,V2),x_priceChargedFor(x_Iran,V1,V2)),x_StabilizingFunction,x_Positive) :- x_cid(a65b12506e9319,V1,V2).
xc_microtheory(a65b12506e9319,x_HPKBCrisisMt).
xc_source_file(a65b12506e9319,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9319,5413).
xc_kb_names(a65b12506e9319,["?PRODUCT-1","?PRICE-1"]).
xc_mapping_rows(a65b12506e9319,[]).
xc_direction(a65b12506e9319,':FORWARD').
xc_monotonicity(a65b12506e9319,':DEFAULT').
x_quantityInfluenceFunction(x_MtTimeFn(x_CIAWorldFactbook1997Mt),x_PetroleumProduct,x_Kappa(t(V1,V2),x_priceChargedFor(x_Iran,V1,V2)),x_StabilizingFunction) :- x_cid(a65b12506e931a,V1,V2).
xc_microtheory(a65b12506e931a,x_HPKBCrisisMt).
xc_source_file(a65b12506e931a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e931a,5423).
xc_kb_names(a65b12506e931a,["?PROD","?PRICE"]).
xc_mapping_rows(a65b12506e931a,[]).
xc_direction(a65b12506e931a,':FORWARD').
xc_monotonicity(a65b12506e931a,':DEFAULT').
x_implies(x_and(x_isa(V1,x_EconomicEmbargo),x_performedBy(V1,V2),x_maleficiary(V1,V3),x_targetedProductType(V1,V4),x_importanceOfThingInSet(V2,x_TheSetOf(V5,x_importsFrom(V5,x_PetroleumProduct,x_Libya)),V6)),x_quantityInfluenceFunctionStrength(x_ShortTermFn(V1),x_PetroleumProduct,x_Kappa(t(V7,V8),x_supplyRate(V3,V7,V8)),x_NetIncreasingFunction,V6)) :- x_cid(a65b12506e931b,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12506e931b,x_HPKBCrisisMt).
xc_source_file(a65b12506e931b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e931b,5433).
xc_kb_names(a65b12506e931b,["?EMBARGO","?EMBARGOER","?EMBARGOEE","?PROD-TYPE","?X","?LEVEL","?PRODUCT","?SUPPLY"]).
xc_mapping_rows(a65b12506e931b,['implication-implies']).
xc_direction(a65b12506e931b,':FORWARD').
xc_monotonicity(a65b12506e931b,':DEFAULT').
xc_creator(a65b12506e931b,'BillJ').
xc_creation_date(a65b12506e931b,19980626).
x_english(x_implies(x_and(x_isa(V1,x_EconomicEmbargo),x_maleficiary(V1,V2),x_performedBy(V1,V3),x_targetedProductType(V1,V4)),x_quantityInfluenceFunction(x_LongTermFn(V1),x_PetroleumProduct,x_Kappa(t(V5,V6),x_supplyRate(V7,V5,V8)),x_StabilizingFunction)),"This rule follows from a generalization of model fragment A2 (see #$ModelFragmentA2Mt).  The generalization is that compensating mechanisms may take over after any initial short term perturbation.  As a result, supply will stabilize in the long term.") :- x_cid(a65b12506e931c,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12506e931c,x_HPKBCrisisMt).
xc_source_file(a65b12506e931c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e931c,5452).
xc_kb_names(a65b12506e931c,["?EMBARGO","?EMBARGOEE","?EMBARGOER","?PROD-TYPE","?PRODUCT","?SUPPLY","?EMBARGOE","?PRICE"]).
xc_mapping_rows(a65b12506e931c,['implication-implies']).
xc_direction(a65b12506e931c,':FORWARD').
xc_monotonicity(a65b12506e931c,':DEFAULT').
xc_creator(a65b12506e931c,'BillJ').
xc_creation_date(a65b12506e931c,19980626).
x_comment(x_implies(x_and(x_isa(V1,x_EconomicEmbargo),x_maleficiary(V1,V2),x_performedBy(V1,V3),x_targetedProductType(V1,V4)),x_quantityInfluenceFunction(x_LongTermFn(V1),x_PetroleumProduct,x_Kappa(t(V5,V6),x_supplyRate(V7,V5,V8)),x_StabilizingFunction)),"This rule follows from a generalization of model fragment A2 (see #$ModelFragmentA2Mt).  The generalization is that compensating mechanisms may take over after any initial short term perturbation.  As a result, supply will stabilize in the long term.") :- x_cid(a65b12506e931d,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12506e931d,x_HPKBCrisisMt).
xc_source_file(a65b12506e931d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e931d,5469).
xc_kb_names(a65b12506e931d,["?EMBARGO","?EMBARGOEE","?EMBARGOER","?PROD-TYPE","?PRODUCT","?SUPPLY","?EMBARGOE","?PRICE"]).
xc_mapping_rows(a65b12506e931d,['implication-implies']).
xc_direction(a65b12506e931d,':FORWARD').
xc_monotonicity(a65b12506e931d,':DEFAULT').
xc_creator(a65b12506e931d,'BillJ').
xc_creation_date(a65b12506e931d,19980626).
x_implies(x_and(x_isa(V1,x_EconomicEmbargo),x_maleficiary(V1,V2),x_performedBy(V1,V3),x_targetedProductType(V1,V4)),x_quantityInfluenceFunction(x_LongTermFn(V1),x_PetroleumProduct,x_Kappa(t(V5,V6),x_supplyRate(V7,V5,V8)),x_StabilizingFunction)) :- x_cid(a65b12506e931e,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12506e931e,x_HPKBCrisisMt).
xc_source_file(a65b12506e931e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e931e,5486).
xc_kb_names(a65b12506e931e,["?EMBARGO","?EMBARGOEE","?EMBARGOER","?PROD-TYPE","?PRODUCT","?SUPPLY","?EMBARGOE","?PRICE"]).
xc_mapping_rows(a65b12506e931e,['implication-implies']).
xc_direction(a65b12506e931e,':FORWARD').
xc_monotonicity(a65b12506e931e,':DEFAULT').
xc_creator(a65b12506e931e,'BillJ').
xc_creation_date(a65b12506e931e,19980626).
x_implies(x_and(x_isa(V1,x_EconomicEmbargo),x_maleficiary(V1,V2),x_performedBy(V1,V3),x_targetedProductType(V1,V4)),x_quantityInfluenceFunction(x_ShortTermFn(V1),x_PetroleumProduct,x_Kappa(t(V5,V6),x_supplyRate(V2,V5,V6)),x_SpikeFunction)) :- x_cid(a65b12506e931f,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e931f,x_HPKBCrisisMt).
xc_source_file(a65b12506e931f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e931f,5502).
xc_kb_names(a65b12506e931f,["?EMBARGO","?EMBARGOEE","?EMBARGOER","?PROD-TYPE","?PRODUCT","?SUPPLY"]).
xc_mapping_rows(a65b12506e931f,['implication-implies']).
xc_direction(a65b12506e931f,':FORWARD').
xc_monotonicity(a65b12506e931f,':DEFAULT').
xc_creator(a65b12506e931f,'BillJ').
xc_creation_date(a65b12506e931f,19980626).
x_implies(x_and(x_isa(V1,x_EconomicEmbargo),x_maleficiary(V1,V2),x_performedBy(V1,V3),x_targetedProductType(V1,V4)),x_quantityInfluenceFunction(x_ShortTermFn(V1),x_PetroleumProduct,x_Kappa(t(V5,V6),x_supplyRate(V2,V5,V6)),x_NetIncreasingFunction)) :- x_cid(a65b12506e9320,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e9320,x_HPKBCrisisMt).
xc_source_file(a65b12506e9320,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9320,5518).
xc_kb_names(a65b12506e9320,["?EMBARGO","?EMBARGOEE","?EMBARGOER","?PROD-TYPE","?PRODUCT","?PRICE"]).
xc_mapping_rows(a65b12506e9320,['implication-implies']).
xc_direction(a65b12506e9320,':FORWARD').
xc_monotonicity(a65b12506e9320,':DEFAULT').
xc_creator(a65b12506e9320,'BillJ').
xc_creation_date(a65b12506e9320,19980626).
x_thereExists(V1,x_and(x_capableOfDoing(x_UnitedNationsOrganization,V1,x_mediators),x_isa(V1,x_TerritorialDispute),x_opponentsInConflict(x_UnitedArabEmirates,x_Oman,V1))) :- x_cid(a65b12506e9321,V1).
xc_microtheory(a65b12506e9321,x_HPKBCrisisMt).
xc_source_file(a65b12506e9321,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9321,5534).
xc_kb_names(a65b12506e9321,["?CONFLICT"]).
xc_mapping_rows(a65b12506e9321,['exists-thereexists']).
xc_direction(a65b12506e9321,':FORWARD').
xc_monotonicity(a65b12506e9321,':DEFAULT').
x_thereExists(V1,x_and(x_capableOfDoing(x_UnitedNationsOrganization,V1,x_mediators),x_isa(V1,x_TerritorialDispute),x_opponentsInConflict(x_SaudiArabia,x_Oman,V1))) :- x_cid(a65b12506e9322,V1).
xc_microtheory(a65b12506e9322,x_HPKBCrisisMt).
xc_source_file(a65b12506e9322,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9322,5545).
xc_kb_names(a65b12506e9322,["?CONFLICT"]).
xc_mapping_rows(a65b12506e9322,['exists-thereexists']).
xc_direction(a65b12506e9322,':FORWARD').
xc_monotonicity(a65b12506e9322,':DEFAULT').
x_implies(x_and(x_isa(V1,x_PersuadingToAct),'x_causes-EventEvent'(V1,V2),x_performedBy(V1,V3),x_quantityChangeFunction(V2,V4,x_Kappa(t(V5,V6),x_priceChargedFor(x_PlanetEarth,V5,V6)),x_NetIncreasingFunction)),x_quantityInfluenceFunction(V2,V4,x_Kappa(t(V7,V8),x_priceChargedFor(x_PlanetEarth,V7,V8)),x_NetDecreasingFunction)) :- x_cid(a65b12506e9323,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12506e9323,x_HPKBCrisisMt).
xc_source_file(a65b12506e9323,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9323,5556).
xc_kb_names(a65b12506e9323,["?PERSUADING","?INCREASE-EXPORTS","?SENDER","?PRODUCT-TYPE","?PROD-1","?PRICE-1","?PROD-2","?PRICE-2"]).
xc_mapping_rows(a65b12506e9323,['implication-implies']).
xc_direction(a65b12506e9323,':FORWARD').
xc_monotonicity(a65b12506e9323,':DEFAULT').
xc_creator(a65b12506e9323,'BillJ').
xc_creation_date(a65b12506e9323,19980624).
x_implies(x_and(x_genls(V1,x_FluidTangibleThing),x_isa(V2,x_Pipeline)),x_or(x_usesObject(V3,V2),x_exportThroughAmountDuring(V3,V1,V2,x_YearFn(1996),x_BarrelsPerDay(0)))) :- x_cid(a65b12506e9324,V1,V2,V3).
xc_microtheory(a65b12506e9324,x_HPKBCrisisMt).
xc_source_file(a65b12506e9324,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9324,5574).
xc_kb_names(a65b12506e9324,["?PRODUCT-TYPE","?PIPELINE","?COUNTRY"]).
xc_mapping_rows(a65b12506e9324,['implication-implies']).
xc_direction(a65b12506e9324,':BACKWARD').
xc_monotonicity(a65b12506e9324,':DEFAULT').
xc_creator(a65b12506e9324,'Schwartz').
xc_creation_date(a65b12506e9324,19980624).
x_implies(x_and(x_isa(V1,x_EconomicSupport),x_greaterThanOrEqualTo(V1,x_MediumAmountFn(x_EconomicSupport)),x_givesSupportToAgent(V2,V3,V1)),x_positiveVestedInterest(V2,V3)) :- x_cid(a65b12506e9325,V1,V2,V3).
xc_microtheory(a65b12506e9325,x_HPKBCrisisMt).
xc_source_file(a65b12506e9325,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9325,5588).
xc_kb_names(a65b12506e9325,["?SUPPORT-LEVEL","?AGT1","?AGT2"]).
xc_mapping_rows(a65b12506e9325,['implication-implies']).
xc_direction(a65b12506e9325,':BACKWARD').
xc_monotonicity(a65b12506e9325,':DEFAULT').
xc_creator(a65b12506e9325,'OKeefe').
xc_creation_date(a65b12506e9325,19980623).
x_implies(x_and(x_isa(V1,x_MilitarySupport),x_greaterThanOrEqualTo(V1,x_MediumAmountFn(x_MilitarySupport)),x_givesSupportToAgent(V2,V3,V1)),x_positiveVestedInterest(V2,V3)) :- x_cid(a65b12506e9326,V1,V2,V3).
xc_microtheory(a65b12506e9326,x_HPKBCrisisMt).
xc_source_file(a65b12506e9326,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9326,5600).
xc_kb_names(a65b12506e9326,["?SUPPORT-LEVEL","?AGT1","?AGT2"]).
xc_mapping_rows(a65b12506e9326,['implication-implies']).
xc_direction(a65b12506e9326,':BACKWARD').
xc_monotonicity(a65b12506e9326,':DEFAULT').
xc_creator(a65b12506e9326,'OKeefe').
xc_creation_date(a65b12506e9326,19980623).
x_implies(x_and(x_isa(V1,x_TakingSomeoneHostage),x_performedBy(V1,V2)),x_increasesCausally(V1,x_thereExists(V3,x_and(x_isa(V3,x_AttackOnTangible),x_maleficiary(V3,V2))),x_likelihood)) :- x_cid(a65b12506e9327,V1,V2,V3).
xc_microtheory(a65b12506e9327,x_HPKBCrisisMt).
xc_source_file(a65b12506e9327,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9327,5612).
xc_kb_names(a65b12506e9327,["?HOSTAGE","?WHOM","?RESCUE"]).
xc_mapping_rows(a65b12506e9327,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9327,':BACKWARD').
xc_monotonicity(a65b12506e9327,':DEFAULT').
xc_creator(a65b12506e9327,'OKeefe').
xc_creation_date(a65b12506e9327,19980623).
x_implies(x_and(x_isa(V1,x_MilitaryAttack),x_maleficiary(V1,V2),x_isa(V2,x_GeographicalAgent)),x_increasesCausally(V1,x_politicalStability(V2,x_Low),x_likelihood)) :- x_cid(a65b12506e9328,V1,V2).
xc_microtheory(a65b12506e9328,x_HPKBCrisisMt).
xc_source_file(a65b12506e9328,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9328,5627).
xc_kb_names(a65b12506e9328,["?ATTACK","?GEOPOL"]).
xc_mapping_rows(a65b12506e9328,['implication-implies']).
xc_direction(a65b12506e9328,':BACKWARD').
xc_monotonicity(a65b12506e9328,':DEFAULT').
xc_creator(a65b12506e9328,'OKeefe').
xc_creation_date(a65b12506e9328,19980623).
x_implies(x_and(x_isa(V1,x_MilitaryAttack),x_maleficiary(V1,V2),x_isa(V2,x_GeographicalAgent)),x_increasesCausally(V1,x_economicStability(x_EconomyFn(V2),x_Low),x_likelihood)) :- x_cid(a65b12506e9329,V1,V2).
xc_microtheory(a65b12506e9329,x_HPKBCrisisMt).
xc_source_file(a65b12506e9329,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9329,5639).
xc_kb_names(a65b12506e9329,["?ATTACK","?GEOPOL"]).
xc_mapping_rows(a65b12506e9329,['implication-implies']).
xc_direction(a65b12506e9329,':BACKWARD').
xc_monotonicity(a65b12506e9329,':DEFAULT').
xc_creator(a65b12506e9329,'OKeefe').
xc_creation_date(a65b12506e9329,19980623).
x_implies(x_relationInstanceExists(x_possesses,V1,x_Frigate),x_behaviorCapable(V1,x_DestructionFn(x_ModernNavalShip),x_performedBy)) :- x_cid(a65b12506e932a,V1).
xc_microtheory(a65b12506e932a,x_HPKBCrisisMt).
xc_source_file(a65b12506e932a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e932a,5652).
xc_kb_names(a65b12506e932a,["?AGENT"]).
xc_mapping_rows(a65b12506e932a,['implication-implies']).
xc_direction(a65b12506e932a,':BACKWARD').
xc_monotonicity(a65b12506e932a,':MONOTONIC').
xc_creator(a65b12506e932a,'Davis').
xc_creation_date(a65b12506e932a,19980623).
x_implies(x_relationInstanceExists(x_possesses,V1,x_Destroyer),x_behaviorCapable(V1,x_DestructionFn(x_ModernNavalShip),x_performedBy)) :- x_cid(a65b12506e932b,V1).
xc_microtheory(a65b12506e932b,x_HPKBCrisisMt).
xc_source_file(a65b12506e932b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e932b,5661).
xc_kb_names(a65b12506e932b,["?AGENT"]).
xc_mapping_rows(a65b12506e932b,['implication-implies']).
xc_direction(a65b12506e932b,':BACKWARD').
xc_monotonicity(a65b12506e932b,':MONOTONIC').
xc_creator(a65b12506e932b,'Davis').
xc_creation_date(a65b12506e932b,19980623).
x_implies(x_relationInstanceExists(x_possesses,V1,'x_MissileWatercraft-Surface'),x_behaviorCapable(V1,x_DestructionFn(x_ModernNavalShip),x_performedBy)) :- x_cid(a65b12506e932c,V1).
xc_microtheory(a65b12506e932c,x_HPKBCrisisMt).
xc_source_file(a65b12506e932c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e932c,5670).
xc_kb_names(a65b12506e932c,["?AGENT"]).
xc_mapping_rows(a65b12506e932c,['implication-implies']).
xc_direction(a65b12506e932c,':BACKWARD').
xc_monotonicity(a65b12506e932c,':MONOTONIC').
xc_creator(a65b12506e932c,'Davis').
xc_creation_date(a65b12506e932c,19980623).
x_implies(x_officialArmedForces(x_GovernmentFn(V1),V2),x_subOrganizations(V1,V2)) :- x_cid(a65b12506e932d,V1,V2).
xc_microtheory(a65b12506e932d,x_HPKBCrisisMt).
xc_source_file(a65b12506e932d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e932d,5679).
xc_kb_names(a65b12506e932d,["?COUNTRY","?MIL"]).
xc_mapping_rows(a65b12506e932d,['implication-implies']).
xc_direction(a65b12506e932d,':BACKWARD').
xc_monotonicity(a65b12506e932d,':DEFAULT').
xc_creator(a65b12506e932d,'Davis').
xc_creation_date(a65b12506e932d,19980623).
x_implies(x_and(x_isa(V1,x_EconomicEmbargo),x_maleficiary(V1,V2),x_performedBy(V1,V3),x_targetedProductType(V1,V4)),x_quantityInfluenceFunction(x_ShortTermFn(V1),x_PetroleumProduct,x_Kappa(t(V5,V6),x_demandRate(V2,V5,V6)),x_NetDecreasingFunction)) :- x_cid(a65b12506e932e,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e932e,x_HPKBCrisisMt).
xc_source_file(a65b12506e932e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e932e,5688).
xc_kb_names(a65b12506e932e,["?EMBARGO","?EMBARGOEE","?EMBARGOER","?PROD-TYPE","?PRODUCT","?PRICE"]).
xc_mapping_rows(a65b12506e932e,['implication-implies']).
xc_direction(a65b12506e932e,':BACKWARD').
xc_monotonicity(a65b12506e932e,':DEFAULT').
xc_creator(a65b12506e932e,'BillJ').
xc_creation_date(a65b12506e932e,19980623).
x_cyclistNotes(x_industryFacilities,"This needs to be hooked up with #$physicalQuarters.") :- x_cid(a65b12506e932f).
xc_microtheory(a65b12506e932f,x_HPKBCrisisMt).
xc_source_file(a65b12506e932f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e932f,5704).
xc_kb_names(a65b12506e932f,[]).
xc_mapping_rows(a65b12506e932f,[]).
xc_direction(a65b12506e932f,':FORWARD').
xc_monotonicity(a65b12506e932f,':DEFAULT').
xc_creator(a65b12506e932f,'BillJ').
xc_creation_date(a65b12506e932f,19980623).
x_cyclistNotes(x_physicalQuarters,"This needs to be hooked up with #$industryFacilities.") :- x_cid(a65b12506e9330).
xc_microtheory(a65b12506e9330,x_HPKBCrisisMt).
xc_source_file(a65b12506e9330,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9330,5710).
xc_kb_names(a65b12506e9330,[]).
xc_mapping_rows(a65b12506e9330,[]).
xc_direction(a65b12506e9330,':FORWARD').
xc_monotonicity(a65b12506e9330,':DEFAULT').
xc_creator(a65b12506e9330,'BillJ').
xc_creation_date(a65b12506e9330,19980623).
x_distanceBetween('x_Dukhan-UmmSaidPipeline',x_Iran,x_Mile(150,250)) :- x_cid(a65b12506e9331).
xc_microtheory(a65b12506e9331,x_HPKBCrisisMt).
xc_source_file(a65b12506e9331,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9331,5716).
xc_kb_names(a65b12506e9331,[]).
xc_mapping_rows(a65b12506e9331,[]).
xc_direction(a65b12506e9331,':FORWARD').
xc_monotonicity(a65b12506e9331,':DEFAULT').
x_distanceBetween('x_DasIsland-AlBunduqPipeline',x_Iran,x_Mile(150,250)) :- x_cid(a65b12506e9332).
xc_microtheory(a65b12506e9332,x_HPKBCrisisMt).
xc_source_file(a65b12506e9332,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9332,5723).
xc_kb_names(a65b12506e9332,[]).
xc_mapping_rows(a65b12506e9332,[]).
xc_direction(a65b12506e9332,':FORWARD').
xc_monotonicity(a65b12506e9332,':DEFAULT').
x_distanceBetween('x_HulalIsland-BulHaninePipeline',x_Iran,x_Mile(150,250)) :- x_cid(a65b12506e9333).
xc_microtheory(a65b12506e9333,x_HPKBCrisisMt).
xc_source_file(a65b12506e9333,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9333,5730).
xc_kb_names(a65b12506e9333,[]).
xc_mapping_rows(a65b12506e9333,[]).
xc_direction(a65b12506e9333,':FORWARD').
xc_monotonicity(a65b12506e9333,':DEFAULT').
x_distanceBetween('x_HulalIsland-MaydanMahzamPipeline',x_Iran,x_Mile(150,250)) :- x_cid(a65b12506e9334).
xc_microtheory(a65b12506e9334,x_HPKBCrisisMt).
xc_source_file(a65b12506e9334,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9334,5737).
xc_kb_names(a65b12506e9334,[]).
xc_mapping_rows(a65b12506e9334,[]).
xc_direction(a65b12506e9334,':FORWARD').
xc_monotonicity(a65b12506e9334,':DEFAULT').
x_distanceBetween('x_HulalIsland-AlKhalijPipeline',x_Iran,x_Mile(150,250)) :- x_cid(a65b12506e9335).
xc_microtheory(a65b12506e9335,x_HPKBCrisisMt).
xc_source_file(a65b12506e9335,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9335,5744).
xc_kb_names(a65b12506e9335,[]).
xc_mapping_rows(a65b12506e9335,[]).
xc_direction(a65b12506e9335,':FORWARD').
xc_monotonicity(a65b12506e9335,':DEFAULT').
x_assertionConclusionActionType(x_implies(x_alternateRouteFromThrough(V1,V2,V3,V4),x_different(V4,V3)),x_VerifyConclusionImmediate) :- x_cid(a65b12506e9336,V1,V2,V3,V4).
xc_microtheory(a65b12506e9336,x_HPKBCrisisMt).
xc_source_file(a65b12506e9336,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9336,5751).
xc_kb_names(a65b12506e9336,["?FROM-PLACE","?STUFF-TYPE","?ROUTE","?OTHER-ROUTE"]).
xc_mapping_rows(a65b12506e9336,['implication-implies']).
xc_direction(a65b12506e9336,':BACKWARD').
xc_monotonicity(a65b12506e9336,':DEFAULT').
xc_creator(a65b12506e9336,'BillJ').
xc_creation_date(a65b12506e9336,19980622).
x_implies(x_alternateRouteFromThrough(V1,V2,V3,V4),x_different(V3,V4)) :- x_cid(a65b12506e9337,V1,V2,V3,V4).
xc_microtheory(a65b12506e9337,x_HPKBCrisisMt).
xc_source_file(a65b12506e9337,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9337,5760).
xc_kb_names(a65b12506e9337,["?FROM-PLACE","?STUFF-TYPE","?ROUTE","?OTHER-ROUTE"]).
xc_mapping_rows(a65b12506e9337,['implication-implies']).
xc_direction(a65b12506e9337,':BACKWARD').
xc_monotonicity(a65b12506e9337,':DEFAULT').
xc_creator(a65b12506e9337,'BillJ').
xc_creation_date(a65b12506e9337,19980622).
x_not(x_and(x_different(V1,V2),x_alternateRouteFromThrough(V3,V4,V1,V2),x_suppliedWithFromExclusivelyThrough(V5,V4,V3,V1))) :- x_cid(a65b12506e9338,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9338,x_HPKBCrisisMt).
xc_source_file(a65b12506e9338,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9338,5768).
xc_kb_names(a65b12506e9338,["?ROUTE","?ANY-OTHER-ROUTE","?FROM-PLACE","?STUFF-TYPE","?TO-PLACE"]).
xc_mapping_rows(a65b12506e9338,[]).
xc_direction(a65b12506e9338,':BACKWARD').
xc_monotonicity(a65b12506e9338,':DEFAULT').
xc_creator(a65b12506e9338,'BillJ').
xc_creation_date(a65b12506e9338,19980622).
x_implies(x_isa(V1,x_InternationalConflict),x_thereExists(V2,x_thereExists(V3,x_opponentsInConflict(V3,V2,V1)))) :- x_cid(a65b12506e9339,V1,V2,V3).
xc_microtheory(a65b12506e9339,x_HPKBCrisisMt).
xc_source_file(a65b12506e9339,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9339,5778).
xc_kb_names(a65b12506e9339,["?CONFLICT","?COUNTRY-B","?COUNTRY-A"]).
xc_mapping_rows(a65b12506e9339,['implication-implies','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9339,':BACKWARD').
xc_monotonicity(a65b12506e9339,':DEFAULT').
xc_creator(a65b12506e9339,'BillJ').
xc_creation_date(a65b12506e9339,19980619).
x_arg1Isa('x_SKF-13520938',x_InternationalConflict) :- x_cid(a65b12506e933a).
xc_microtheory(a65b12506e933a,x_HPKBCrisisMt).
xc_source_file(a65b12506e933a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e933a,5790).
xc_kb_names(a65b12506e933a,[]).
xc_mapping_rows(a65b12506e933a,[]).
xc_direction(a65b12506e933a,':FORWARD').
xc_monotonicity(a65b12506e933a,':DEFAULT').
x_resultIsa('x_SKF-13520938',x_IntelligentAgent) :- x_cid(a65b12506e933b).
xc_microtheory(a65b12506e933b,x_HPKBCrisisMt).
xc_source_file(a65b12506e933b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e933b,5796).
xc_kb_names(a65b12506e933b,[]).
xc_mapping_rows(a65b12506e933b,[]).
xc_direction(a65b12506e933b,':FORWARD').
xc_monotonicity(a65b12506e933b,':DEFAULT').
x_arity('x_SKF-13520938',1) :- x_cid(a65b12506e933c).
xc_microtheory(a65b12506e933c,x_HPKBCrisisMt).
xc_source_file(a65b12506e933c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e933c,5802).
xc_kb_names(a65b12506e933c,[]).
xc_mapping_rows(a65b12506e933c,[]).
xc_direction(a65b12506e933c,':FORWARD').
xc_monotonicity(a65b12506e933c,':MONOTONIC').
x_isa('x_SKF-13520938',x_SkolemFunction) :- x_cid(a65b12506e933d).
xc_microtheory(a65b12506e933d,x_HPKBCrisisMt).
xc_source_file(a65b12506e933d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e933d,5808).
xc_kb_names(a65b12506e933d,[]).
xc_mapping_rows(a65b12506e933d,[]).
xc_direction(a65b12506e933d,':FORWARD').
xc_monotonicity(a65b12506e933d,':MONOTONIC').
x_arg1Isa('x_SKF-18048205',x_InternationalConflict) :- x_cid(a65b12506e933e).
xc_microtheory(a65b12506e933e,x_HPKBCrisisMt).
xc_source_file(a65b12506e933e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e933e,5814).
xc_kb_names(a65b12506e933e,[]).
xc_mapping_rows(a65b12506e933e,[]).
xc_direction(a65b12506e933e,':FORWARD').
xc_monotonicity(a65b12506e933e,':DEFAULT').
x_resultIsa('x_SKF-18048205',x_IntelligentAgent) :- x_cid(a65b12506e933f).
xc_microtheory(a65b12506e933f,x_HPKBCrisisMt).
xc_source_file(a65b12506e933f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e933f,5820).
xc_kb_names(a65b12506e933f,[]).
xc_mapping_rows(a65b12506e933f,[]).
xc_direction(a65b12506e933f,':FORWARD').
xc_monotonicity(a65b12506e933f,':DEFAULT').
x_arity('x_SKF-18048205',1) :- x_cid(a65b12506e9340).
xc_microtheory(a65b12506e9340,x_HPKBCrisisMt).
xc_source_file(a65b12506e9340,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9340,5826).
xc_kb_names(a65b12506e9340,[]).
xc_mapping_rows(a65b12506e9340,[]).
xc_direction(a65b12506e9340,':FORWARD').
xc_monotonicity(a65b12506e9340,':MONOTONIC').
x_isa('x_SKF-18048205',x_SkolemFunction) :- x_cid(a65b12506e9341).
xc_microtheory(a65b12506e9341,x_HPKBCrisisMt).
xc_source_file(a65b12506e9341,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9341,5832).
xc_kb_names(a65b12506e9341,[]).
xc_mapping_rows(a65b12506e9341,[]).
xc_direction(a65b12506e9341,':FORWARD').
xc_monotonicity(a65b12506e9341,':MONOTONIC').
x_implies(x_and(x_isa(V1,x_Country),x_isa(V2,x_Country),x_opponentsInConflict(V1,V2,V3)),x_isa(V3,x_InternationalConflict)) :- x_cid(a65b12506e9342,V1,V2,V3).
xc_microtheory(a65b12506e9342,x_HPKBCrisisMt).
xc_source_file(a65b12506e9342,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9342,5838).
xc_kb_names(a65b12506e9342,["?COUNTRY-A","?COUNTRY-B","?CONFLICT"]).
xc_mapping_rows(a65b12506e9342,['implication-implies']).
xc_direction(a65b12506e9342,':BACKWARD').
xc_monotonicity(a65b12506e9342,':DEFAULT').
xc_creator(a65b12506e9342,'BillJ').
xc_creation_date(a65b12506e9342,19980619).
x_implies(x_and(x_isa(V1,x_TerroristAttack),'x_instrument-Generic'(V1,V2),x_isa(V2,x_WeaponOfMassDestruction),x_eventOccursAt(V1,V3)),x_maleficiary(V1,V3)) :- x_cid(a65b12506e9343,V1,V2,V3).
xc_microtheory(a65b12506e9343,x_HPKBCrisisMt).
xc_source_file(a65b12506e9343,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9343,5849).
xc_kb_names(a65b12506e9343,["?ATTACK","?WEAPON","?COUNTRY"]).
xc_mapping_rows(a65b12506e9343,['implication-implies']).
xc_direction(a65b12506e9343,':BACKWARD').
xc_monotonicity(a65b12506e9343,':DEFAULT').
xc_creator(a65b12506e9343,'ABelasco').
xc_creation_date(a65b12506e9343,19980619).
x_implies(x_infoTransferred(V1,x_performedBy(V2,V3)),x_infoTransferred(V1,x_deliberateActors(V2,V3))) :- x_cid(a65b12506e9344,V1,V2,V3).
xc_microtheory(a65b12506e9344,x_HPKBCrisisMt).
xc_source_file(a65b12506e9344,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9344,5861).
xc_kb_names(a65b12506e9344,["?ITE","?ACT","?AGT2"]).
xc_mapping_rows(a65b12506e9344,['implication-implies']).
xc_direction(a65b12506e9344,':BACKWARD').
xc_monotonicity(a65b12506e9344,':DEFAULT').
xc_creator(a65b12506e9344,'OKeefe').
xc_creation_date(a65b12506e9344,19980618).
x_implies(x_infoTransferred(V1,x_directingAgent(V2,V3)),x_infoTransferred(V1,x_deliberateActors(V2,V3))) :- x_cid(a65b12506e9345,V1,V2,V3).
xc_microtheory(a65b12506e9345,x_HPKBCrisisMt).
xc_source_file(a65b12506e9345,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9345,5871).
xc_kb_names(a65b12506e9345,["?ITE","?ACT","?AGT2"]).
xc_mapping_rows(a65b12506e9345,['implication-implies']).
xc_direction(a65b12506e9345,':BACKWARD').
xc_monotonicity(a65b12506e9345,':DEFAULT').
xc_creator(a65b12506e9345,'OKeefe').
xc_creation_date(a65b12506e9345,19980618).
x_implies(x_beliefs(V1,x_performedBy(V2,V3)),x_beliefs(V1,x_deliberateActors(V2,V3))) :- x_cid(a65b12506e9346,V1,V2,V3).
xc_microtheory(a65b12506e9346,x_HPKBCrisisMt).
xc_source_file(a65b12506e9346,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9346,5881).
xc_kb_names(a65b12506e9346,["?AGT1","?ACT","?AGT2"]).
xc_mapping_rows(a65b12506e9346,['implication-implies']).
xc_direction(a65b12506e9346,':BACKWARD').
xc_monotonicity(a65b12506e9346,':DEFAULT').
xc_creator(a65b12506e9346,'OKeefe').
xc_creation_date(a65b12506e9346,19980618).
x_implies(x_beliefs(V1,x_directingAgent(V2,V3)),x_beliefs(V1,x_deliberateActors(V2,V3))) :- x_cid(a65b12506e9347,V1,V2,V3).
xc_microtheory(a65b12506e9347,x_HPKBCrisisMt).
xc_source_file(a65b12506e9347,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9347,5891).
xc_kb_names(a65b12506e9347,["?AGT1","?ACT","?AGT2"]).
xc_mapping_rows(a65b12506e9347,['implication-implies']).
xc_direction(a65b12506e9347,':BACKWARD').
xc_monotonicity(a65b12506e9347,':DEFAULT').
xc_creator(a65b12506e9347,'OKeefe').
xc_creation_date(a65b12506e9347,19980618).
x_implies(x_deliberateActors(V1,V2),x_goals(V2,x_not(x_failureForAgents(V1,V2)))) :- x_cid(a65b12506e9348,V1,V2).
xc_microtheory(a65b12506e9348,x_HPKBCrisisMt).
xc_source_file(a65b12506e9348,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9348,5901).
xc_kb_names(a65b12506e9348,["?ACT","?AGT"]).
xc_mapping_rows(a65b12506e9348,['implication-implies']).
xc_direction(a65b12506e9348,':BACKWARD').
xc_monotonicity(a65b12506e9348,':DEFAULT').
xc_creator(a65b12506e9348,'OKeefe').
xc_creation_date(a65b12506e9348,19980618).
x_affiliatedWith(x_Iran,x_BahrainiHizballah) :- x_cid(a65b12506e9349).
xc_microtheory(a65b12506e9349,x_HPKBCrisisMt).
xc_source_file(a65b12506e9349,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9349,5911).
xc_kb_names(a65b12506e9349,[]).
xc_mapping_rows(a65b12506e9349,[]).
xc_direction(a65b12506e9349,':FORWARD').
xc_monotonicity(a65b12506e9349,':DEFAULT').
xc_creator(a65b12506e9349,'Rode').
xc_creation_date(a65b12506e9349,19980605).
x_isa(x_BahrainiHizballah,x_DissidentGroup) :- x_cid(a65b12506e934a).
xc_microtheory(a65b12506e934a,x_HPKBCrisisMt).
xc_source_file(a65b12506e934a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e934a,5917).
xc_kb_names(a65b12506e934a,[]).
xc_mapping_rows(a65b12506e934a,[]).
xc_direction(a65b12506e934a,':FORWARD').
xc_monotonicity(a65b12506e934a,':DEFAULT').
x_hasStatusWithAgent(x_BahrainiHizballah,x_Bahrain,x_DissidentStatus) :- x_cid(a65b12506e934b).
xc_microtheory(a65b12506e934b,x_HPKBCrisisMt).
xc_source_file(a65b12506e934b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e934b,5923).
xc_kb_names(a65b12506e934b,[]).
xc_mapping_rows(a65b12506e934b,[]).
xc_direction(a65b12506e934b,':FORWARD').
xc_monotonicity(a65b12506e934b,':DEFAULT').
xc_creator(a65b12506e934b,'Rode').
xc_creation_date(a65b12506e934b,19980605).
x_negativeVestedInterest(x_BahrainiHizballah,x_Bahrain) :- x_cid(a65b12506e934c).
xc_microtheory(a65b12506e934c,x_HPKBCrisisMt).
xc_source_file(a65b12506e934c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e934c,5929).
xc_kb_names(a65b12506e934c,[]).
xc_mapping_rows(a65b12506e934c,[]).
xc_direction(a65b12506e934c,':FORWARD').
xc_monotonicity(a65b12506e934c,':DEFAULT').
xc_creator(a65b12506e934c,'Rode').
xc_creation_date(a65b12506e934c,19980605).
x_residenceOfOrganization(x_BahrainiHizballah,x_Bahrain) :- x_cid(a65b12506e934d).
xc_microtheory(a65b12506e934d,x_HPKBCrisisMt).
xc_source_file(a65b12506e934d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e934d,5935).
xc_kb_names(a65b12506e934d,[]).
xc_mapping_rows(a65b12506e934d,[]).
xc_direction(a65b12506e934d,':FORWARD').
xc_monotonicity(a65b12506e934d,':DEFAULT').
xc_creator(a65b12506e934d,'Rode').
xc_creation_date(a65b12506e934d,19980605).
x_enforcingAgent(x_ChemicalWeaponsConvention,x_OrganizationForTheProhibitionOfChemicalWeapons) :- x_cid(a65b12506e934e).
xc_microtheory(a65b12506e934e,x_HPKBCrisisMt).
xc_source_file(a65b12506e934e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e934e,5941).
xc_kb_names(a65b12506e934e,[]).
xc_mapping_rows(a65b12506e934e,[]).
xc_direction(a65b12506e934e,':FORWARD').
xc_monotonicity(a65b12506e934e,':DEFAULT').
xc_creator(a65b12506e934e,'OKeefe').
xc_creation_date(a65b12506e934e,19980617).
x_implies(x_and(x_isa(V1,x_GeopoliticalEntity),x_performedBy(V2,V1),x_isa(V2,x_AttackOnTangible),x_deviceUsed(V2,V3),x_isa(V3,V4),x_genls(V4,x_MilitaryHardware)),x_relationInstanceExistsMany(x_possesses,V1,V4)) :- x_cid(a65b12506e934f,V1,V2,V3,V4).
xc_microtheory(a65b12506e934f,x_HPKBCrisisMt).
xc_source_file(a65b12506e934f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e934f,5947).
xc_kb_names(a65b12506e934f,["?AGENT","?ATTACK","?WEAPON","?WEAPONTYPE"]).
xc_mapping_rows(a65b12506e934f,['implication-implies']).
xc_direction(a65b12506e934f,':BACKWARD').
xc_monotonicity(a65b12506e934f,':DEFAULT').
xc_creator(a65b12506e934f,'OKeefe').
xc_creation_date(a65b12506e934f,19980617).
x_implies(x_and(x_isa(V1,x_GeopoliticalEntity),x_performedBy(V2,V1),x_isa(V2,x_AttackOnTangible),x_deviceUsed(V2,V3),x_isa(V3,V4),x_genls(V4,x_Weapon)),x_relationInstanceExistsMany(x_possesses,V1,V4)) :- x_cid(a65b12506e9350,V1,V2,V3,V4).
xc_microtheory(a65b12506e9350,x_HPKBCrisisMt).
xc_source_file(a65b12506e9350,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9350,5961).
xc_kb_names(a65b12506e9350,["?AGENT","?ATTACK","?WEAPON","?WEAPONTYPE"]).
xc_mapping_rows(a65b12506e9350,['implication-implies']).
xc_direction(a65b12506e9350,':BACKWARD').
xc_monotonicity(a65b12506e9350,':DEFAULT').
xc_creator(a65b12506e9350,'OKeefe').
xc_creation_date(a65b12506e9350,19980617).
x_implies(x_and(x_isa(V1,x_HelpingAnAgent),x_beneficiary(V1,V2),x_isa(V2,x_TerroristGroup),x_performedBy(V1,V3),x_isa(V3,x_Country)),x_actionViolatesObligation(V1,'x_InternationalNorm-DontSupportTerrorism')) :- x_cid(a65b12506e9351,V1,V2,V3).
xc_microtheory(a65b12506e9351,x_HPKBCrisisMt).
xc_source_file(a65b12506e9351,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9351,5975).
xc_kb_names(a65b12506e9351,["?SUPPORT","?TERR-GR","?COUNTRY"]).
xc_mapping_rows(a65b12506e9351,['implication-implies']).
xc_direction(a65b12506e9351,':BACKWARD').
xc_monotonicity(a65b12506e9351,':DEFAULT').
xc_creator(a65b12506e9351,'Davis').
xc_creation_date(a65b12506e9351,19971114).
x_arg5Isa('x_SKF-19191321',x_TerroristGroup) :- x_cid(a65b12506e9352).
xc_microtheory(a65b12506e9352,x_HPKBCrisisMt).
xc_source_file(a65b12506e9352,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9352,5988).
xc_kb_names(a65b12506e9352,[]).
xc_mapping_rows(a65b12506e9352,[]).
xc_direction(a65b12506e9352,':FORWARD').
xc_monotonicity(a65b12506e9352,':DEFAULT').
x_arg4Isa('x_SKF-19191321',x_HelpingAnAgent) :- x_cid(a65b12506e9353).
xc_microtheory(a65b12506e9353,x_HPKBCrisisMt).
xc_source_file(a65b12506e9353,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9353,5994).
xc_kb_names(a65b12506e9353,[]).
xc_mapping_rows(a65b12506e9353,[]).
xc_direction(a65b12506e9353,':FORWARD').
xc_monotonicity(a65b12506e9353,':DEFAULT').
x_arg3Isa('x_SKF-19191321',x_Agent) :- x_cid(a65b12506e9354).
xc_microtheory(a65b12506e9354,x_HPKBCrisisMt).
xc_source_file(a65b12506e9354,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9354,6000).
xc_kb_names(a65b12506e9354,[]).
xc_mapping_rows(a65b12506e9354,[]).
xc_direction(a65b12506e9354,':FORWARD').
xc_monotonicity(a65b12506e9354,':DEFAULT').
x_arg2Isa('x_SKF-19191321',x_Agent) :- x_cid(a65b12506e9355).
xc_microtheory(a65b12506e9355,x_HPKBCrisisMt).
xc_source_file(a65b12506e9355,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9355,6006).
xc_kb_names(a65b12506e9355,[]).
xc_mapping_rows(a65b12506e9355,[]).
xc_direction(a65b12506e9355,':FORWARD').
xc_monotonicity(a65b12506e9355,':DEFAULT').
x_arg1Isa('x_SKF-19191321',x_Agent) :- x_cid(a65b12506e9356).
xc_microtheory(a65b12506e9356,x_HPKBCrisisMt).
xc_source_file(a65b12506e9356,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9356,6012).
xc_kb_names(a65b12506e9356,[]).
xc_mapping_rows(a65b12506e9356,[]).
xc_direction(a65b12506e9356,':FORWARD').
xc_monotonicity(a65b12506e9356,':DEFAULT').
x_resultIsa('x_SKF-19191321',x_ShowingSupportForSomeone) :- x_cid(a65b12506e9357).
xc_microtheory(a65b12506e9357,x_HPKBCrisisMt).
xc_source_file(a65b12506e9357,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9357,6018).
xc_kb_names(a65b12506e9357,[]).
xc_mapping_rows(a65b12506e9357,[]).
xc_direction(a65b12506e9357,':FORWARD').
xc_monotonicity(a65b12506e9357,':DEFAULT').
x_arity('x_SKF-19191321',5) :- x_cid(a65b12506e9358).
xc_microtheory(a65b12506e9358,x_HPKBCrisisMt).
xc_source_file(a65b12506e9358,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9358,6024).
xc_kb_names(a65b12506e9358,[]).
xc_mapping_rows(a65b12506e9358,[]).
xc_direction(a65b12506e9358,':FORWARD').
xc_monotonicity(a65b12506e9358,':MONOTONIC').
x_isa('x_SKF-19191321',x_SkolemFunction) :- x_cid(a65b12506e9359).
xc_microtheory(a65b12506e9359,x_HPKBCrisisMt).
xc_source_file(a65b12506e9359,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9359,6030).
xc_kb_names(a65b12506e9359,[]).
xc_mapping_rows(a65b12506e9359,[]).
xc_direction(a65b12506e9359,':FORWARD').
xc_monotonicity(a65b12506e9359,':MONOTONIC').
x_implies(x_decreasesImmediatelyCausally(V1,V2,'x_power-Geopolitical'),x_maleficiary(V1,V2)) :- x_cid(a65b12506e935a,V1,V2).
xc_microtheory(a65b12506e935a,x_HPKBCrisisMt).
xc_source_file(a65b12506e935a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e935a,6036).
xc_kb_names(a65b12506e935a,["?EVENT","?COUNTRY"]).
xc_mapping_rows(a65b12506e935a,['implication-implies']).
xc_direction(a65b12506e935a,':BACKWARD').
xc_monotonicity(a65b12506e935a,':DEFAULT').
xc_creator(a65b12506e935a,'Davis').
xc_creation_date(a65b12506e935a,19971115).
x_implies(x_increasesImmediatelyCausally(V1,V2,'x_power-Geopolitical'),x_beneficiary(V1,V2)) :- x_cid(a65b12506e935b,V1,V2).
xc_microtheory(a65b12506e935b,x_HPKBCrisisMt).
xc_source_file(a65b12506e935b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e935b,6044).
xc_kb_names(a65b12506e935b,["?EVENT","?COUNTRY"]).
xc_mapping_rows(a65b12506e935b,['implication-implies']).
xc_direction(a65b12506e935b,':BACKWARD').
xc_monotonicity(a65b12506e935b,':DEFAULT').
x_implies(x_increasesImmediatelyCausally(V1,V2,'x_power-Military'),x_beneficiary(V1,V2)) :- x_cid(a65b12506e935c,V1,V2).
xc_microtheory(a65b12506e935c,x_HPKBCrisisMt).
xc_source_file(a65b12506e935c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e935c,6052).
xc_kb_names(a65b12506e935c,["?EVENT","?COUNTRY"]).
xc_mapping_rows(a65b12506e935c,['implication-implies']).
xc_direction(a65b12506e935c,':BACKWARD').
xc_monotonicity(a65b12506e935c,':DEFAULT').
xc_creator(a65b12506e935c,'Davis').
xc_creation_date(a65b12506e935c,19971211).
x_implies(x_and(x_bordersOn(x_PersianGulf,V1),x_imports(V1,V2),x_typeBehaviorCapable(V2,x_TransportViaFn(x_Ship),x_transportees)),x_importsThrough(V1,V2,x_StraitOfHormuz)) :- x_cid(a65b12506e935d,V1,V2).
xc_microtheory(a65b12506e935d,x_HPKBCrisisMt).
xc_source_file(a65b12506e935d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e935d,6060).
xc_kb_names(a65b12506e935d,["?COUNTRY","?PTYPE"]).
xc_mapping_rows(a65b12506e935d,['implication-implies']).
xc_direction(a65b12506e935d,':BACKWARD').
xc_monotonicity(a65b12506e935d,':DEFAULT').
xc_creator(a65b12506e935d,'ABelasco').
xc_creation_date(a65b12506e935d,19980410).
x_implies(x_and(x_subOrganizations(V1,V2),x_goalCategoryForAgent(V2,V3,V4)),x_goalCategoryForAgent(V1,V3,V4)) :- x_cid(a65b12506e935e,V1,V2,V3,V4).
xc_microtheory(a65b12506e935e,x_HPKBCrisisMt).
xc_source_file(a65b12506e935e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e935e,6072).
xc_kb_names(a65b12506e935e,["?ORG","?SUBORG","?GOAL","?GOALATT"]).
xc_mapping_rows(a65b12506e935e,['implication-implies']).
xc_direction(a65b12506e935e,':BACKWARD').
xc_monotonicity(a65b12506e935e,':DEFAULT').
xc_creator(a65b12506e935e,'ABelasco').
xc_creation_date(a65b12506e935e,19980410).
x_implies(x_and(x_isa(V1,x_TakingSomeoneHostage),x_performedBy(V1,V2),x_isa(V2,x_InternationalOrganization)),x_beliefs(x_InternationalCommunity,x_performedBy(V1,V2))) :- x_cid(a65b12506e935f,V1,V2).
xc_microtheory(a65b12506e935f,x_HPKBCrisisMt).
xc_source_file(a65b12506e935f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e935f,6082).
xc_kb_names(a65b12506e935f,["?HOSTAGE","?COUNTRY-ORG"]).
xc_mapping_rows(a65b12506e935f,['implication-implies']).
xc_direction(a65b12506e935f,':BACKWARD').
xc_monotonicity(a65b12506e935f,':DEFAULT').
xc_creator(a65b12506e935f,'OKeefe').
xc_creation_date(a65b12506e935f,19980414).
x_implies(x_and(x_isa(V1,x_TakingSomeoneHostage),x_performedBy(V1,V2),x_isa(V2,x_Country)),x_beliefs(x_InternationalCommunity,x_performedBy(V1,V2))) :- x_cid(a65b12506e9360,V1,V2).
xc_microtheory(a65b12506e9360,x_HPKBCrisisMt).
xc_source_file(a65b12506e9360,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9360,6094).
xc_kb_names(a65b12506e9360,["?HOSTAGE","?COUNTRY-ORG"]).
xc_mapping_rows(a65b12506e9360,['implication-implies']).
xc_direction(a65b12506e9360,':BACKWARD').
xc_monotonicity(a65b12506e9360,':DEFAULT').
xc_creator(a65b12506e9360,'OKeefe').
xc_creation_date(a65b12506e9360,19980414).
x_implies(x_and(x_actionViolatesObligation(V1,V2),x_obligationParts(V3,V2)),x_actionViolatesObligation(V1,V3)) :- x_cid(a65b12506e9361,V1,V2,V3).
xc_microtheory(a65b12506e9361,x_HPKBCrisisMt).
xc_source_file(a65b12506e9361,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9361,6106).
xc_kb_names(a65b12506e9361,["?ACT","?OB","?WIDE"]).
xc_mapping_rows(a65b12506e9361,['implication-implies']).
xc_direction(a65b12506e9361,':BACKWARD').
xc_monotonicity(a65b12506e9361,':DEFAULT').
xc_creator(a65b12506e9361,'OKeefe').
xc_creation_date(a65b12506e9361,19980416).
x_implies(x_and(x_isa(V1,x_TerroristAct),x_objectActedOn(V1,V2),x_geographicalSubRegions(V3,V2),x_isa(V3,x_Country)),x_maleficiary(V1,V3)) :- x_cid(a65b12506e9362,V1,V2,V3).
xc_microtheory(a65b12506e9362,x_HPKBCrisisMt).
xc_source_file(a65b12506e9362,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9362,6116).
xc_kb_names(a65b12506e9362,["?ATTACK","?OBJ","?COUNTRY"]).
xc_mapping_rows(a65b12506e9362,['implication-implies']).
xc_direction(a65b12506e9362,':BACKWARD').
xc_monotonicity(a65b12506e9362,':DEFAULT').
xc_creator(a65b12506e9362,'ABelasco').
xc_creation_date(a65b12506e9362,19980424).
x_implies(x_and(x_isa(V1,x_TerroristAct),x_objectActedOn(V1,V2),x_inRegion(V2,V3),x_isa(V3,x_Country)),x_maleficiary(V1,V3)) :- x_cid(a65b12506e9363,V1,V2,V3).
xc_microtheory(a65b12506e9363,x_HPKBCrisisMt).
xc_source_file(a65b12506e9363,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9363,6128).
xc_kb_names(a65b12506e9363,["?ATTACK","?OBJ","?COUNTRY"]).
xc_mapping_rows(a65b12506e9363,['implication-implies']).
xc_direction(a65b12506e9363,':BACKWARD').
xc_monotonicity(a65b12506e9363,':DEFAULT').
xc_creator(a65b12506e9363,'OKeefe').
xc_creation_date(a65b12506e9363,19980421).
x_implies(x_isa(V1,x_BlockingAnInternationalWaterway),x_actionViolatesObligation(V1,x_InternationalOceanLawCOC)) :- x_cid(a65b12506e9364,V1).
xc_microtheory(a65b12506e9364,x_HPKBCrisisMt).
xc_source_file(a65b12506e9364,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9364,6140).
xc_kb_names(a65b12506e9364,["?ACT"]).
xc_mapping_rows(a65b12506e9364,['implication-implies']).
xc_direction(a65b12506e9364,':BACKWARD').
xc_monotonicity(a65b12506e9364,':DEFAULT').
xc_creator(a65b12506e9364,'Nichols').
xc_creation_date(a65b12506e9364,19971112).
x_exceptWhen(x_deliberateActors(V1,V2),x_implies(x_and(x_isa(V1,x_AerialAttack),x_isa(V2,x_Country),x_eventOccursAt(V1,V3),x_inRegion(V3,V2)),x_victim(V1,V2))) :- x_cid(a65b12506e9365,V1,V2,V3).
xc_microtheory(a65b12506e9365,x_HPKBCrisisMt).
xc_source_file(a65b12506e9365,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9365,6148).
xc_kb_names(a65b12506e9365,["?ATTACK","?COUNTRY","?REG"]).
xc_mapping_rows(a65b12506e9365,['implication-implies']).
xc_direction(a65b12506e9365,':BACKWARD').
xc_monotonicity(a65b12506e9365,':DEFAULT').
xc_creator(a65b12506e9365,'OKeefe').
xc_creation_date(a65b12506e9365,19980616).
x_implies(x_and(x_isa(V1,x_TerroristAct),x_objectActedOn(V1,V2),x_isa(V3,x_Country),x_industryFacilities(x_IndustryOfRegionFn(V4,V3),V2)),x_maleficiary(V1,V3)) :- x_cid(a65b12506e9366,V1,V2,V3,V4).
xc_microtheory(a65b12506e9366,x_HPKBCrisisMt).
xc_source_file(a65b12506e9366,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9366,6162).
xc_kb_names(a65b12506e9366,["?ATTACK","?FACILITIES","?COUNTRY","?INDUSTRY"]).
xc_mapping_rows(a65b12506e9366,['implication-implies']).
xc_direction(a65b12506e9366,':BACKWARD').
xc_monotonicity(a65b12506e9366,':DEFAULT').
xc_creator(a65b12506e9366,'BillJ').
xc_creation_date(a65b12506e9366,19980521).
x_implies(x_hasBeliefSystems(V1,x_IslamicSocietyIdeology),x_negativeVestedInterest(V1,x_Israel)) :- x_cid(a65b12506e9367,V1).
xc_microtheory(a65b12506e9367,x_HPKBCrisisMt).
xc_source_file(a65b12506e9367,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9367,6175).
xc_kb_names(a65b12506e9367,["?AGT"]).
xc_mapping_rows(a65b12506e9367,['implication-implies']).
xc_direction(a65b12506e9367,':BACKWARD').
xc_monotonicity(a65b12506e9367,':DEFAULT').
xc_creator(a65b12506e9367,'ABelasco').
xc_creation_date(a65b12506e9367,19980601).
x_implies(x_and('x_internationalOrg-MemberCountry'(x_OECD,V1),x_importsThrough(V1,x_PetroleumProduct,V2)),x_goalCategoryForAgent(x_InternationalEnergyAgency,x_not(x_thereExists(V3,x_and(x_isa(V3,x_BlockingTraffic),x_objectActedOn(V3,V2)))),x_FuelSupplyGoal)) :- x_cid(a65b12506e9368,V1,V2,V3).
xc_microtheory(a65b12506e9368,x_HPKBCrisisMt).
xc_source_file(a65b12506e9368,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9368,6183).
xc_kb_names(a65b12506e9368,["?COUNTRY","?PATH","?BLOCK"]).
xc_mapping_rows(a65b12506e9368,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9368,':BACKWARD').
xc_monotonicity(a65b12506e9368,':DEFAULT').
xc_creator(a65b12506e9368,'ABelasco').
xc_creation_date(a65b12506e9368,19980602).
x_implies('x_internationalOrg-MemberCountry'(x_GulfCooperationCouncil,V1),x_holdsIn(x_Y1Phase2ScenarioConflict,x_goals(V1,x_relationExistsInstance('x_pathway-Partial',x_TransportViaFn(x_Ship),x_PersianGulf)))) :- x_cid(a65b12506e9369,V1).
xc_microtheory(a65b12506e9369,x_HPKBCrisisMt).
xc_source_file(a65b12506e9369,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9369,6199).
xc_kb_names(a65b12506e9369,["?COUNTRY"]).
xc_mapping_rows(a65b12506e9369,['implication-implies']).
xc_direction(a65b12506e9369,':BACKWARD').
xc_monotonicity(a65b12506e9369,':DEFAULT').
xc_creator(a65b12506e9369,'ABelasco').
xc_creation_date(a65b12506e9369,19980603).
x_implies(x_and(x_isa(V1,x_Bombing),x_deviceUsed(V1,V2),x_isa(V2,x_Warplane),x_victim(V1,V3),x_possesses(V3,V4),x_isa(V4,x_AirDefenseSystem)),x_thereExists(V5,x_and(x_isa(V5,x_AntiAircraftFire),x_target(V5,V2),x_temporallySubsumes(V1,V5)))) :- x_cid(a65b12506e936a,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e936a,x_HPKBCrisisMt).
xc_source_file(a65b12506e936a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e936a,6210).
xc_kb_names(a65b12506e936a,["?BOMBING","?PLANE","?VICTIM","?AIR-DEFENSE-SYSTEM","?ANTI-AIRCRAFT-FIRE"]).
xc_mapping_rows(a65b12506e936a,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e936a,':BACKWARD').
xc_monotonicity(a65b12506e936a,':DEFAULT').
xc_creator(a65b12506e936a,'Schwartz').
xc_creation_date(a65b12506e936a,19980616).
x_implies(x_and(x_isa(V1,x_Bombing),x_deviceUsed(V1,V2),x_isa(V2,x_Warplane),x_victim(V1,V3),x_possesses(V3,V4),x_isa(V4,x_AirDefenseSystem)),x_thereExists(V5,x_and(x_isa(V5,x_AntiAircraftFire),x_target(V5,V2),x_temporallySubsumes(V1,V5)))) :- x_cid(a65b12506e936b,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e936b,x_HPKBCrisisMt).
xc_source_file(a65b12506e936b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e936b,6229).
xc_kb_names(a65b12506e936b,["?BOMBING","?PLANE","?VICTIM","?AIR-DEFENSE-SYSTEM","?ANTI-AIRCRAFT-FIRE"]).
xc_mapping_rows(a65b12506e936b,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e936b,':BACKWARD').
xc_monotonicity(a65b12506e936b,':DEFAULT').
xc_creator(a65b12506e936b,'Schwartz').
xc_creation_date(a65b12506e936b,19980616).
x_implies(x_and(x_isa(V1,x_Bombing),x_deviceUsed(V1,V2),x_isa(V2,x_Warplane),x_victim(V1,V3),x_possesses(V3,V4),x_isa(V4,x_AirDefenseSystem)),x_thereExists(V5,x_and(x_isa(V5,x_AntiAircraftFire),x_target(V5,V2),x_temporallySubsumes(V1,V5)))) :- x_cid(a65b12506e936c,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e936c,x_HPKBCrisisMt).
xc_source_file(a65b12506e936c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e936c,6248).
xc_kb_names(a65b12506e936c,["?BOMBING","?PLANE","?VICTIM","?AIR-DEFENSE-SYSTEM","?ANTI-AIRCRAFT-FIRE"]).
xc_mapping_rows(a65b12506e936c,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e936c,':BACKWARD').
xc_monotonicity(a65b12506e936c,':DEFAULT').
xc_creator(a65b12506e936c,'Schwartz').
xc_creation_date(a65b12506e936c,19980616).
x_arg4Isa('x_SKF-1515868',x_SocialBeing) :- x_cid(a65b12506e936d).
xc_microtheory(a65b12506e936d,x_HPKBCrisisMt).
xc_source_file(a65b12506e936d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e936d,6267).
xc_kb_names(a65b12506e936d,[]).
xc_mapping_rows(a65b12506e936d,[]).
xc_direction(a65b12506e936d,':FORWARD').
xc_monotonicity(a65b12506e936d,':DEFAULT').
x_arg3Isa('x_SKF-1515868',x_Warplane) :- x_cid(a65b12506e936e).
xc_microtheory(a65b12506e936e,x_HPKBCrisisMt).
xc_source_file(a65b12506e936e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e936e,6273).
xc_kb_names(a65b12506e936e,[]).
xc_mapping_rows(a65b12506e936e,[]).
xc_direction(a65b12506e936e,':FORWARD').
xc_monotonicity(a65b12506e936e,':DEFAULT').
x_arg2Isa('x_SKF-1515868',x_Bombing) :- x_cid(a65b12506e936f).
xc_microtheory(a65b12506e936f,x_HPKBCrisisMt).
xc_source_file(a65b12506e936f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e936f,6279).
xc_kb_names(a65b12506e936f,[]).
xc_mapping_rows(a65b12506e936f,[]).
xc_direction(a65b12506e936f,':FORWARD').
xc_monotonicity(a65b12506e936f,':DEFAULT').
x_arg1Isa('x_SKF-1515868',x_AirDefenseSystem) :- x_cid(a65b12506e9370).
xc_microtheory(a65b12506e9370,x_HPKBCrisisMt).
xc_source_file(a65b12506e9370,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9370,6285).
xc_kb_names(a65b12506e9370,[]).
xc_mapping_rows(a65b12506e9370,[]).
xc_direction(a65b12506e9370,':FORWARD').
xc_monotonicity(a65b12506e9370,':DEFAULT').
x_resultIsa('x_SKF-1515868',x_AntiAircraftFire) :- x_cid(a65b12506e9371).
xc_microtheory(a65b12506e9371,x_HPKBCrisisMt).
xc_source_file(a65b12506e9371,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9371,6291).
xc_kb_names(a65b12506e9371,[]).
xc_mapping_rows(a65b12506e9371,[]).
xc_direction(a65b12506e9371,':FORWARD').
xc_monotonicity(a65b12506e9371,':DEFAULT').
x_arity('x_SKF-1515868',4) :- x_cid(a65b12506e9372).
xc_microtheory(a65b12506e9372,x_HPKBCrisisMt).
xc_source_file(a65b12506e9372,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9372,6297).
xc_kb_names(a65b12506e9372,[]).
xc_mapping_rows(a65b12506e9372,[]).
xc_direction(a65b12506e9372,':FORWARD').
xc_monotonicity(a65b12506e9372,':MONOTONIC').
x_isa('x_SKF-1515868',x_SkolemFunction) :- x_cid(a65b12506e9373).
xc_microtheory(a65b12506e9373,x_HPKBCrisisMt).
xc_source_file(a65b12506e9373,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9373,6303).
xc_kb_names(a65b12506e9373,[]).
xc_mapping_rows(a65b12506e9373,[]).
xc_direction(a65b12506e9373,':FORWARD').
xc_monotonicity(a65b12506e9373,':MONOTONIC').
x_thereExists(V1,x_and(x_isa(V1,x_AirDefenseSystem),x_possesses(x_SaudiArabia,V1))) :- x_cid(a65b12506e9374,V1).
xc_microtheory(a65b12506e9374,x_HPKBCrisisMt).
xc_source_file(a65b12506e9374,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9374,6309).
xc_kb_names(a65b12506e9374,["?AIR-DEFENSE-SYSTEM"]).
xc_mapping_rows(a65b12506e9374,['exists-thereexists']).
xc_direction(a65b12506e9374,':BACKWARD').
xc_monotonicity(a65b12506e9374,':DEFAULT').
xc_creator(a65b12506e9374,'Schwartz').
xc_creation_date(a65b12506e9374,19980616).
x_thereExists(V1,x_and(x_isa(V1,x_AirDefenseSystem),x_possesses(x_SaudiArabia,V1))) :- x_cid(a65b12506e9375,V1).
xc_microtheory(a65b12506e9375,x_HPKBCrisisMt).
xc_source_file(a65b12506e9375,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9375,6319).
xc_kb_names(a65b12506e9375,["?AIR-DEFENSE-SYSTEM"]).
xc_mapping_rows(a65b12506e9375,['exists-thereexists']).
xc_direction(a65b12506e9375,':BACKWARD').
xc_monotonicity(a65b12506e9375,':DEFAULT').
xc_creator(a65b12506e9375,'Schwartz').
xc_creation_date(a65b12506e9375,19980616).
x_implies(x_and(x_isa(V1,x_Bombing),x_deviceUsed(V1,V2),x_isa(V2,x_Warplane)),x_isa(V1,x_MilitaryOperation)) :- x_cid(a65b12506e9376,V1,V2).
xc_microtheory(a65b12506e9376,x_HPKBCrisisMt).
xc_source_file(a65b12506e9376,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9376,6329).
xc_kb_names(a65b12506e9376,["?BOMBING","?WARPLANE"]).
xc_mapping_rows(a65b12506e9376,['implication-implies']).
xc_direction(a65b12506e9376,':BACKWARD').
xc_monotonicity(a65b12506e9376,':DEFAULT').
xc_creator(a65b12506e9376,'Schwartz').
xc_creation_date(a65b12506e9376,19971119).
x_implies(x_and(x_isa(V1,x_PhysicalDevice),'x_instrument-Generic'(V2,V3),x_groupMembers(V3,V1)),x_deviceUsed(V2,V1)) :- x_cid(a65b12506e9377,V1,V2,V3).
xc_microtheory(a65b12506e9377,x_HPKBCrisisMt).
xc_source_file(a65b12506e9377,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9377,6340).
xc_kb_names(a65b12506e9377,["?DEVICE","?EVENT","?GROUP"]).
xc_mapping_rows(a65b12506e9377,['implication-implies']).
xc_direction(a65b12506e9377,':BACKWARD').
xc_monotonicity(a65b12506e9377,':DEFAULT').
xc_creator(a65b12506e9377,'Schwartz').
xc_creation_date(a65b12506e9377,19971119).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_deliberateActors(V1,V2),x_isa(V2,x_GeopoliticalEntity),x_damages(V1,V3),x_owns(V4,V3),x_hasHeadquartersInCountry(V4,V5)),x_maleficiary(V1,V5)) :- x_cid(a65b12506e9378,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9378,x_HPKBCrisisMt).
xc_source_file(a65b12506e9378,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9378,6351).
xc_kb_names(a65b12506e9378,["?ATTACK","?GEOPOL","?THING","?COMPANY","?COUNTRY"]).
xc_mapping_rows(a65b12506e9378,['implication-implies']).
xc_direction(a65b12506e9378,':BACKWARD').
xc_monotonicity(a65b12506e9378,':DEFAULT').
xc_creator(a65b12506e9378,'OKeefe').
xc_creation_date(a65b12506e9378,19980608).
x_thereExists(V1,x_and(x_beliefs(x_InternationalCommunity,x_performedBy(V1,x_Iran)),x_thereExists(V2,x_deviceUsed(V1,V2)),x_isa(V1,x_MissileAttack),x_performedBy(V1,x_Iran),x_subEvents('x_WarOfTheCities-IranianOffensive',V1))) :- x_cid(a65b12506e9379,V1,V2).
xc_microtheory(a65b12506e9379,x_HPKBCrisisMt).
xc_source_file(a65b12506e9379,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9379,6365).
xc_kb_names(a65b12506e9379,["?FIRING","?SCUDB"]).
xc_mapping_rows(a65b12506e9379,['exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9379,':FORWARD').
xc_monotonicity(a65b12506e9379,':DEFAULT').
x_beliefs(x_InternationalCommunity,x_performedBy('x_MissileAttackOnIsrael-1973',x_Egypt)) :- x_cid(a65b12506e937a).
xc_microtheory(a65b12506e937a,x_HPKBCrisisMt).
xc_source_file(a65b12506e937a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e937a,6381).
xc_kb_names(a65b12506e937a,[]).
xc_mapping_rows(a65b12506e937a,[]).
xc_direction(a65b12506e937a,':FORWARD').
xc_monotonicity(a65b12506e937a,':DEFAULT').
x_supplyFromThroughAmountDuring(x_PlanetEarth,x_PetroleumProduct,x_SaudiArabia,'x_BabElMandeb-Strait',x_YearFn(1995),x_MillionBarrelsPerDay(0,3.4)) :- x_cid(a65b12506e937b).
xc_microtheory(a65b12506e937b,x_HPKBCrisisMt).
xc_source_file(a65b12506e937b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e937b,6388).
xc_kb_names(a65b12506e937b,[]).
xc_mapping_rows(a65b12506e937b,[]).
xc_direction(a65b12506e937b,':BACKWARD').
xc_monotonicity(a65b12506e937b,':DEFAULT').
x_implies(x_and(x_isa(V1,x_AerialAttack),x_eventOccursAt(V1,V2),x_inRegion(V2,V3),x_isa(V3,x_Country)),x_victim(V1,V3)) :- x_cid(a65b12506e937c,V1,V2,V3).
xc_microtheory(a65b12506e937c,x_HPKBCrisisMt).
xc_source_file(a65b12506e937c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e937c,6396).
xc_kb_names(a65b12506e937c,["?ATTACK","?REG","?COUNTRY"]).
xc_mapping_rows(a65b12506e937c,['implication-implies']).
xc_direction(a65b12506e937c,':BACKWARD').
xc_monotonicity(a65b12506e937c,':DEFAULT').
xc_creator(a65b12506e937c,'OKeefe').
xc_creation_date(a65b12506e937c,19980430).
x_beliefs(x_InternationalCommunity,x_performedBy('x_WarOfTheCities-IranianOffensive',x_Iran)) :- x_cid(a65b12506e937d).
xc_microtheory(a65b12506e937d,x_HPKBCrisisMt).
xc_source_file(a65b12506e937d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e937d,6408).
xc_kb_names(a65b12506e937d,[]).
xc_mapping_rows(a65b12506e937d,[]).
xc_direction(a65b12506e937d,':FORWARD').
xc_monotonicity(a65b12506e937d,':DEFAULT').
x_beliefs(x_InternationalCommunity,x_performedBy('x_WarOfTheCities-IraqiOffensive',x_Iraq)) :- x_cid(a65b12506e937e).
xc_microtheory(a65b12506e937e,x_HPKBCrisisMt).
xc_source_file(a65b12506e937e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e937e,6415).
xc_kb_names(a65b12506e937e,[]).
xc_mapping_rows(a65b12506e937e,[]).
xc_direction(a65b12506e937e,':FORWARD').
xc_monotonicity(a65b12506e937e,':DEFAULT').
x_supplyFromThroughAmountDuring(x_PlanetEarth,x_PetroleumProduct,x_UnitedArabEmirates,x_StraitOfHormuz,x_YearFn(1995),x_MillionBarrelsPerDay(2.21477)) :- x_cid(a65b12506e937f).
xc_microtheory(a65b12506e937f,x_HPKBCrisisMt).
xc_source_file(a65b12506e937f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e937f,6422).
xc_kb_names(a65b12506e937f,[]).
xc_mapping_rows(a65b12506e937f,[]).
xc_direction(a65b12506e937f,':BACKWARD').
xc_monotonicity(a65b12506e937f,':DEFAULT').
x_supplyFromThroughAmountDuring(x_PlanetEarth,x_PetroleumProduct,x_Qatar,x_StraitOfHormuz,x_YearFn(1995),x_BarrelsPerDay(436760)) :- x_cid(a65b12506e9380).
xc_microtheory(a65b12506e9380,x_HPKBCrisisMt).
xc_source_file(a65b12506e9380,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9380,6430).
xc_kb_names(a65b12506e9380,[]).
xc_mapping_rows(a65b12506e9380,[]).
xc_direction(a65b12506e9380,':BACKWARD').
xc_monotonicity(a65b12506e9380,':DEFAULT').
x_supplyFromThroughAmountDuring(x_PlanetEarth,x_PetroleumProduct,x_SaudiArabia,x_StraitOfHormuz,x_YearFn(1995),x_MillionBarrelsPerDay(6.30286)) :- x_cid(a65b12506e9381).
xc_microtheory(a65b12506e9381,x_HPKBCrisisMt).
xc_source_file(a65b12506e9381,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9381,6438).
xc_kb_names(a65b12506e9381,[]).
xc_mapping_rows(a65b12506e9381,[]).
xc_direction(a65b12506e9381,':BACKWARD').
xc_monotonicity(a65b12506e9381,':DEFAULT').
x_supplyFromThroughAmountDuring(x_PlanetEarth,x_PetroleumProduct,x_Kuwait,x_StraitOfHormuz,x_YearFn(1995),x_MillionBarrelsPerDay(1.94441)) :- x_cid(a65b12506e9382).
xc_microtheory(a65b12506e9382,x_HPKBCrisisMt).
xc_source_file(a65b12506e9382,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9382,6446).
xc_kb_names(a65b12506e9382,[]).
xc_mapping_rows(a65b12506e9382,[]).
xc_direction(a65b12506e9382,':BACKWARD').
xc_monotonicity(a65b12506e9382,':DEFAULT').
x_supplyFromThroughAmountDuring(x_PlanetEarth,x_PetroleumProduct,x_Bahrain,x_StraitOfHormuz,x_YearFn(1995),x_BarrelsPerDay(240820)) :- x_cid(a65b12506e9383).
xc_microtheory(a65b12506e9383,x_HPKBCrisisMt).
xc_source_file(a65b12506e9383,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9383,6454).
xc_kb_names(a65b12506e9383,[]).
xc_mapping_rows(a65b12506e9383,[]).
xc_direction(a65b12506e9383,':BACKWARD').
xc_monotonicity(a65b12506e9383,':DEFAULT').
x_supplyFromThroughAmountDuring(x_PlanetEarth,x_PetroleumProduct,x_Oman,x_StraitOfHormuz,x_YearFn(1995),x_BarrelsPerDay(0)) :- x_cid(a65b12506e9384).
xc_microtheory(a65b12506e9384,x_HPKBCrisisMt).
xc_source_file(a65b12506e9384,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9384,6462).
xc_kb_names(a65b12506e9384,[]).
xc_mapping_rows(a65b12506e9384,[]).
xc_direction(a65b12506e9384,':BACKWARD').
xc_monotonicity(a65b12506e9384,':DEFAULT').
x_exportAmountDuring(x_WesternEurope,x_PetroleumProduct,x_YearFn(1995),x_MillionBarrelsPerDay(8.538)) :- x_cid(a65b12506e9385).
xc_microtheory(a65b12506e9385,x_HPKBCrisisMt).
xc_source_file(a65b12506e9385,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9385,6470).
xc_kb_names(a65b12506e9385,[]).
xc_mapping_rows(a65b12506e9385,[]).
xc_direction(a65b12506e9385,':BACKWARD').
xc_monotonicity(a65b12506e9385,':DEFAULT').
x_importAmountDuring(x_WesternEurope,x_PetroleumProduct,x_YearFn(1995),x_MillionBarrelsPerDay(15.934)) :- x_cid(a65b12506e9386).
xc_microtheory(a65b12506e9386,x_HPKBCrisisMt).
xc_source_file(a65b12506e9386,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9386,6478).
xc_kb_names(a65b12506e9386,[]).
xc_mapping_rows(a65b12506e9386,[]).
xc_direction(a65b12506e9386,':BACKWARD').
xc_monotonicity(a65b12506e9386,':DEFAULT').
x_implies(x_and(x_isa(V1,x_NavalBlockade),x_maleficiary(V1,V2),x_isa(V2,x_Country),x_exports(V2,V3)),'x_causes-SitProp'(V1,x_quantityChangeFunction(V1,V3,x_Kappa(t(V4,V5),x_priceChargedFor(x_PlanetEarth,V3,V5)),x_NetIncreasingFunction))) :- x_cid(a65b12506e9387,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9387,x_HPKBCrisisMt).
xc_source_file(a65b12506e9387,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9387,6486).
xc_kb_names(a65b12506e9387,["?BLOCKADE","?COUNTRY","?PRODUCT-TYPE","?PRODUCT","?PRICE"]).
xc_mapping_rows(a65b12506e9387,['implication-implies']).
xc_direction(a65b12506e9387,':BACKWARD').
xc_monotonicity(a65b12506e9387,':DEFAULT').
xc_creator(a65b12506e9387,'BillJ').
xc_creation_date(a65b12506e9387,19980608).
x_implies(x_exportAmountDuring(V1,V2,V3,x_BarrelsPerDay(0)),x_exportThroughAmountDuring(V1,V2,V4,V3,x_BarrelsPerDay(0))) :- x_cid(a65b12506e9388,V1,V2,V3,V4).
xc_microtheory(a65b12506e9388,x_HPKBCrisisMt).
xc_source_file(a65b12506e9388,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9388,6502).
xc_kb_names(a65b12506e9388,["?REGION","?PRODUCT-TYPE","?TIME","?PT"]).
xc_mapping_rows(a65b12506e9388,['implication-implies']).
xc_direction(a65b12506e9388,':BACKWARD').
xc_monotonicity(a65b12506e9388,':DEFAULT').
xc_creator(a65b12506e9388,'Schwartz').
xc_creation_date(a65b12506e9388,19980608).
x_implies(x_exportAmountDuring(V1,V2,V3,'x_Barrel-UnitOfVolume'(0)),x_exportAmountDuring(V1,V2,V3,x_BarrelsPerDay(0))) :- x_cid(a65b12506e9389,V1,V2,V3).
xc_microtheory(a65b12506e9389,x_HPKBCrisisMt).
xc_source_file(a65b12506e9389,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9389,6512).
xc_kb_names(a65b12506e9389,["?REGION","?PRODUCT-TYPE","?TIME"]).
xc_mapping_rows(a65b12506e9389,['implication-implies']).
xc_direction(a65b12506e9389,':BACKWARD').
xc_monotonicity(a65b12506e9389,':DEFAULT').
xc_creator(a65b12506e9389,'Schwartz').
xc_creation_date(a65b12506e9389,19980608).
x_implies(x_exportAmountDuring(V1,V2,V3,x_CubicFoot(0)),x_exportAmountDuring(V1,V2,V3,'x_Barrel-UnitOfVolume'(0))) :- x_cid(a65b12506e938a,V1,V2,V3).
xc_microtheory(a65b12506e938a,x_HPKBCrisisMt).
xc_source_file(a65b12506e938a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e938a,6522).
xc_kb_names(a65b12506e938a,["?REGION","?PRODUCT-TYPE","?TIME"]).
xc_mapping_rows(a65b12506e938a,['implication-implies']).
xc_direction(a65b12506e938a,':BACKWARD').
xc_monotonicity(a65b12506e938a,':DEFAULT').
xc_creator(a65b12506e938a,'Schwartz').
xc_creation_date(a65b12506e938a,19980608).
x_bordersOn(x_RedSea,x_WesternRegionFn(x_CoastlineFn(x_SaudiArabia))) :- x_cid(a65b12506e938b).
xc_microtheory(a65b12506e938b,x_HPKBCrisisMt).
xc_source_file(a65b12506e938b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e938b,6532).
xc_kb_names(a65b12506e938b,[]).
xc_mapping_rows(a65b12506e938b,[]).
xc_direction(a65b12506e938b,':FORWARD').
xc_monotonicity(a65b12506e938b,':DEFAULT').
xc_creator(a65b12506e938b,'Kat').
xc_creation_date(a65b12506e938b,19980608).
x_bordersOn(x_PersianGulf,x_EasternRegionFn(x_CoastlineFn(x_SaudiArabia))) :- x_cid(a65b12506e938c).
xc_microtheory(a65b12506e938c,x_HPKBCrisisMt).
xc_source_file(a65b12506e938c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e938c,6540).
xc_kb_names(a65b12506e938c,[]).
xc_mapping_rows(a65b12506e938c,[]).
xc_direction(a65b12506e938c,':FORWARD').
xc_monotonicity(a65b12506e938c,':DEFAULT').
xc_creator(a65b12506e938c,'Kat').
xc_creation_date(a65b12506e938c,19980608).
x_implies(x_and(x_exportAmountDuring(V1,'x_Petroleum-CrudeOil',V2,V3),x_exportAmountDuring(V1,'x_PetroleumProduct-Refined',V2,V4)),x_exportAmountDuring(V1,x_PetroleumProduct,V2,x_PlusFn(V3,V4))) :- x_cid(a65b12506e938d,V1,V2,V3,V4).
xc_microtheory(a65b12506e938d,x_HPKBCrisisMt).
xc_source_file(a65b12506e938d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e938d,6548).
xc_kb_names(a65b12506e938d,["?REGION","?TIME","?CRUDE-OIL-AMOUNT","?REFINED-OIL-AMOUNT"]).
xc_mapping_rows(a65b12506e938d,['implication-implies']).
xc_direction(a65b12506e938d,':BACKWARD').
xc_monotonicity(a65b12506e938d,':DEFAULT').
xc_creator(a65b12506e938d,'Schwartz').
xc_creation_date(a65b12506e938d,19980608).
x_implies(x_and(x_importAmountDuring(V1,'x_Petroleum-CrudeOil',V2,V3),x_importAmountDuring(V1,'x_PetroleumProduct-Refined',V2,V4)),x_importAmountDuring(V1,x_PetroleumProduct,V2,x_PlusFn(V3,V4))) :- x_cid(a65b12506e938e,V1,V2,V3,V4).
xc_microtheory(a65b12506e938e,x_HPKBCrisisMt).
xc_source_file(a65b12506e938e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e938e,6559).
xc_kb_names(a65b12506e938e,["?REGION","?TIME","?CRUDE-OIL-AMOUNT","?REFINED-OIL-AMOUNT"]).
xc_mapping_rows(a65b12506e938e,['implication-implies']).
xc_direction(a65b12506e938e,':BACKWARD').
xc_monotonicity(a65b12506e938e,':DEFAULT').
xc_creator(a65b12506e938e,'Schwartz').
xc_creation_date(a65b12506e938e,19980608).
x_implies(x_and(x_isa(V1,x_ImposingSanctions),x_performedBy(V1,V2),x_isa(V2,x_Country),x_maleficiary(V1,V3),x_different(V2,V3),x_isa(V3,x_Country)),x_isa(V1,x_DiplomaticAction)) :- x_cid(a65b12506e938f,V1,V2,V3).
xc_microtheory(a65b12506e938f,x_HPKBCrisisMt).
xc_source_file(a65b12506e938f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e938f,6570).
xc_kb_names(a65b12506e938f,["?ACT","?COUNTRY-1","?COUNTRY-2"]).
xc_mapping_rows(a65b12506e938f,['implication-implies']).
xc_direction(a65b12506e938f,':BACKWARD').
xc_monotonicity(a65b12506e938f,':DEFAULT').
xc_creator(a65b12506e938f,'Nichols').
xc_creation_date(a65b12506e938f,19980608).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_isa(V2,x_GeographicalAgent),x_damages(V1,x_IndustryOfRegionFn(V3,V2))),x_increasesCausally(V1,x_economicStability(x_EconomyFn(V2),x_Low),x_likelihood)) :- x_cid(a65b12506e9390,V1,V2,V3).
xc_microtheory(a65b12506e9390,x_HPKBCrisisMt).
xc_source_file(a65b12506e9390,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9390,6584).
xc_kb_names(a65b12506e9390,["?ATTACK","?AREA","?INDUSTRY"]).
xc_mapping_rows(a65b12506e9390,['implication-implies']).
xc_direction(a65b12506e9390,':BACKWARD').
xc_monotonicity(a65b12506e9390,':DEFAULT').
xc_creator(a65b12506e9390,'OKeefe').
xc_creation_date(a65b12506e9390,19980608).
x_bordersOn(x_PersianGulf,x_WesternRegionFn(x_CoastlineFn(x_Iran))) :- x_cid(a65b12506e9391).
xc_microtheory(a65b12506e9391,x_HPKBCrisisMt).
xc_source_file(a65b12506e9391,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9391,6598).
xc_kb_names(a65b12506e9391,[]).
xc_mapping_rows(a65b12506e9391,[]).
xc_direction(a65b12506e9391,':FORWARD').
xc_monotonicity(a65b12506e9391,':DEFAULT').
xc_creator(a65b12506e9391,'OKeefe').
xc_creation_date(a65b12506e9391,19980608).
x_implies(x_and(x_isa(V1,'x_Coalition-International'),x_isa(V2,x_Country),x_outputsCreated(V3,V1),x_performedBy(V3,V2),x_isa(V3,x_FoundingAnOrganization)),'x_internationalOrg-MemberCountry'(V1,V2)) :- x_cid(a65b12506e9392,V1,V2,V3).
xc_microtheory(a65b12506e9392,x_HPKBCrisisMt).
xc_source_file(a65b12506e9392,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9392,6606).
xc_kb_names(a65b12506e9392,["?ORG","?COUNTRY","?ACT"]).
xc_mapping_rows(a65b12506e9392,['implication-implies']).
xc_direction(a65b12506e9392,':BACKWARD').
xc_monotonicity(a65b12506e9392,':DEFAULT').
xc_creator(a65b12506e9392,'OKeefe').
xc_creation_date(a65b12506e9392,19980608).
x_implies(x_and(x_geographicalSubRegions('x_MiddleEast-Region',V1),x_isa(V1,x_Country)),x_goals(x_Iran,x_not('x_powerInRegion-Geopolitical'(x_SaudiArabia,V1,x_HighToVeryHigh)))) :- x_cid(a65b12506e9393,V1).
xc_microtheory(a65b12506e9393,x_HPKBCrisisMt).
xc_source_file(a65b12506e9393,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9393,6619).
xc_kb_names(a65b12506e9393,["?COUNTRY"]).
xc_mapping_rows(a65b12506e9393,['implication-implies']).
xc_direction(a65b12506e9393,':BACKWARD').
xc_monotonicity(a65b12506e9393,':DEFAULT').
xc_creator(a65b12506e9393,'OKeefe').
xc_creation_date(a65b12506e9393,19980608).
x_implies(x_and(x_geographicalSubRegions('x_MiddleEast-Region',V1),x_isa(V1,x_Country)),x_goals(x_SaudiArabia,'x_powerInRegion-Geopolitical'(x_SaudiArabia,V1,x_HighToVeryHigh))) :- x_cid(a65b12506e9394,V1).
xc_microtheory(a65b12506e9394,x_HPKBCrisisMt).
xc_source_file(a65b12506e9394,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9394,6631).
xc_kb_names(a65b12506e9394,["?COUNTRY"]).
xc_mapping_rows(a65b12506e9394,['implication-implies']).
xc_direction(a65b12506e9394,':BACKWARD').
xc_monotonicity(a65b12506e9394,':DEFAULT').
xc_creator(a65b12506e9394,'OKeefe').
xc_creation_date(a65b12506e9394,19980608).
x_implies(x_and(x_geographicalSubRegions('x_MiddleEast-Region',V1),x_isa(V1,x_Country)),x_goals(x_SaudiArabia,x_not('x_powerInRegion-Geopolitical'(x_Iran,V1,x_HighToVeryHigh)))) :- x_cid(a65b12506e9395,V1).
xc_microtheory(a65b12506e9395,x_HPKBCrisisMt).
xc_source_file(a65b12506e9395,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9395,6642).
xc_kb_names(a65b12506e9395,["?COUNTRY"]).
xc_mapping_rows(a65b12506e9395,['implication-implies']).
xc_direction(a65b12506e9395,':BACKWARD').
xc_monotonicity(a65b12506e9395,':DEFAULT').
xc_creator(a65b12506e9395,'OKeefe').
xc_creation_date(a65b12506e9395,19980608).
x_implies(x_and(x_geographicalSubRegions('x_MiddleEast-Region',V1),x_isa(V1,x_Country)),x_goals(x_Iran,'x_powerInRegion-Geopolitical'(x_Iran,V1,x_HighToVeryHigh))) :- x_cid(a65b12506e9396,V1).
xc_microtheory(a65b12506e9396,x_HPKBCrisisMt).
xc_source_file(a65b12506e9396,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9396,6654).
xc_kb_names(a65b12506e9396,["?COUNTRY"]).
xc_mapping_rows(a65b12506e9396,['implication-implies']).
xc_direction(a65b12506e9396,':BACKWARD').
xc_monotonicity(a65b12506e9396,':DEFAULT').
xc_creator(a65b12506e9396,'OKeefe').
xc_creation_date(a65b12506e9396,19980608).
x_implies(x_and(x_isa(V1,x_Pipeline),x_holdsIn(V2,x_stateOfDevice(V1,x_FlowControlDeviceClosedState))),x_exportThroughAmountDuring(V3,V4,V1,V2,x_BarrelsPerDay(0))) :- x_cid(a65b12506e9397,V1,V2,V3,V4).
xc_microtheory(a65b12506e9397,x_HPKBCrisisMt).
xc_source_file(a65b12506e9397,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9397,6665).
xc_kb_names(a65b12506e9397,["?PIPELINE","?TIME","?COUNTRY","?PRODUCT"]).
xc_mapping_rows(a65b12506e9397,['implication-implies']).
xc_direction(a65b12506e9397,':BACKWARD').
xc_monotonicity(a65b12506e9397,':DEFAULT').
xc_creator(a65b12506e9397,'BillJ').
xc_creation_date(a65b12506e9397,19980608).
x_not(x_and(x_isa(V1,x_AttackOnTangible),x_damages(V1,V2),x_deviceUsed(V1,V3),x_isa(V3,x_Weapon),x_performedBy(V1,V4),x_inRegion(V2,V4))) :- x_cid(a65b12506e9398,V1,V2,V3,V4).
xc_microtheory(a65b12506e9398,x_HPKBCrisisMt).
xc_source_file(a65b12506e9398,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9398,6677).
xc_kb_names(a65b12506e9398,["?ACT","?TARGET","?FORCE","?COUNTRY"]).
xc_mapping_rows(a65b12506e9398,[]).
xc_direction(a65b12506e9398,':FORWARD').
xc_monotonicity(a65b12506e9398,':MONOTONIC').
xc_creator(a65b12506e9398,'Rode').
xc_creation_date(a65b12506e9398,19980608).
x_thereExists(V1,x_and(x_beliefs(x_InternationalCommunity,x_performedBy(V1,x_Iraq)),x_thereExists(V2,x_deviceUsed(V1,V2)),x_isa(V1,x_MissileAttack),x_isa(V1,x_ShootingAProjectileWeapon),x_maleficiary(V1,x_Iran),x_performedBy(V1,x_Iraq),x_subEvents('x_WarOfTheCities-IraqiOffensive',V1))) :- x_cid(a65b12506e9399,V1,V2).
xc_microtheory(a65b12506e9399,x_HPKBCrisisMt).
xc_source_file(a65b12506e9399,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9399,6690).
xc_kb_names(a65b12506e9399,["?FIRING","?HUSSEIN"]).
xc_mapping_rows(a65b12506e9399,['exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9399,':FORWARD').
xc_monotonicity(a65b12506e9399,':DEFAULT').
x_beliefs(x_InternationalCommunity,x_performedBy('x_MissileAttackOnBaghdad-1988',x_Iran)) :- x_cid(a65b12506e939a).
xc_microtheory(a65b12506e939a,x_HPKBCrisisMt).
xc_source_file(a65b12506e939a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e939a,6708).
xc_kb_names(a65b12506e939a,[]).
xc_mapping_rows(a65b12506e939a,[]).
xc_direction(a65b12506e939a,':FORWARD').
xc_monotonicity(a65b12506e939a,':DEFAULT').
x_exportAmountDuring(x_SaudiArabia,x_PetroleumProduct,x_YearFn(1995),x_BillionDollars(45.0)) :- x_cid(a65b12506e939b).
xc_microtheory(a65b12506e939b,x_HPKBCrisisMt).
xc_source_file(a65b12506e939b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e939b,6715).
xc_kb_names(a65b12506e939b,[]).
xc_mapping_rows(a65b12506e939b,[]).
xc_direction(a65b12506e939b,':BACKWARD').
xc_monotonicity(a65b12506e939b,':DEFAULT').
x_industryFacilities(x_IndustryOfRegionFn(x_OilIndustry,x_SaudiArabia),'x_Iraq-SaudiArabiaPipeline') :- x_cid(a65b12506e939c).
xc_microtheory(a65b12506e939c,x_HPKBCrisisMt).
xc_source_file(a65b12506e939c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e939c,6723).
xc_kb_names(a65b12506e939c,[]).
xc_mapping_rows(a65b12506e939c,[]).
xc_direction(a65b12506e939c,':FORWARD').
xc_monotonicity(a65b12506e939c,':DEFAULT').
xc_creator(a65b12506e939c,'OKeefe').
xc_creation_date(a65b12506e939c,19980605).
x_subOrganizations(x_GovernmentFn(x_Kuwait),x_NavyFn(x_Kuwait)) :- x_cid(a65b12506e939d).
xc_microtheory(a65b12506e939d,x_HPKBCrisisMt).
xc_source_file(a65b12506e939d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e939d,6730).
xc_kb_names(a65b12506e939d,[]).
xc_mapping_rows(a65b12506e939d,[]).
xc_direction(a65b12506e939d,':BACKWARD').
xc_monotonicity(a65b12506e939d,':DEFAULT').
x_subOrganizations(x_GovernmentFn(x_SaudiArabia),x_NavyFn(x_SaudiArabia)) :- x_cid(a65b12506e939e).
xc_microtheory(a65b12506e939e,x_HPKBCrisisMt).
xc_source_file(a65b12506e939e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e939e,6738).
xc_kb_names(a65b12506e939e,[]).
xc_mapping_rows(a65b12506e939e,[]).
xc_direction(a65b12506e939e,':BACKWARD').
xc_monotonicity(a65b12506e939e,':DEFAULT').
x_thereExists(V1,x_and(x_beliefs(x_InternationalCommunity,x_performedBy(V1,x_Iraq)),x_isa(V1,x_MissileAttack),x_maleficiary(V1,x_Israel),x_perpetrator(V1,x_Iraq),x_relationInstanceExists(x_deviceUsed,V1,'x_BallisticMissile-AlHussein'),x_temporallySubsumes(x_PersianGulfWar,V1))) :- x_cid(a65b12506e939f,V1).
xc_microtheory(a65b12506e939f,x_HPKBCrisisMt).
xc_source_file(a65b12506e939f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e939f,6746).
xc_kb_names(a65b12506e939f,["?ATTACK"]).
xc_mapping_rows(a65b12506e939f,['exists-thereexists']).
xc_direction(a65b12506e939f,':FORWARD').
xc_monotonicity(a65b12506e939f,':DEFAULT').
x_implies('x_internationalOrg-MemberCountry'(V1,V2),x_affiliatedWith(V1,x_GovernmentFn(V2))) :- x_cid(a65b12506e93a0,V1,V2).
xc_microtheory(a65b12506e93a0,x_HPKBCrisisMt).
xc_source_file(a65b12506e93a0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93a0,6761).
xc_kb_names(a65b12506e93a0,["?ORG","?COUNTRY"]).
xc_mapping_rows(a65b12506e93a0,['implication-implies']).
xc_direction(a65b12506e93a0,':BACKWARD').
xc_monotonicity(a65b12506e93a0,':DEFAULT').
xc_creator(a65b12506e93a0,'Rode').
xc_creation_date(a65b12506e93a0,19980605).
x_implies(x_negativeVestedInterest(V1,V2),x_vestedInterest(V1,V2)) :- x_cid(a65b12506e93a1,V1,V2).
xc_microtheory(a65b12506e93a1,x_HPKBCrisisMt).
xc_source_file(a65b12506e93a1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93a1,6770).
xc_kb_names(a65b12506e93a1,["?WHO","?WHAT"]).
xc_mapping_rows(a65b12506e93a1,['implication-implies']).
xc_direction(a65b12506e93a1,':BACKWARD').
xc_monotonicity(a65b12506e93a1,':MONOTONIC').
xc_creator(a65b12506e93a1,'Rode').
xc_creation_date(a65b12506e93a1,19980605).
x_implies(x_officialArmedForces(V1,V2),x_subOrganizations(V1,V2)) :- x_cid(a65b12506e93a2,V1,V2).
xc_microtheory(a65b12506e93a2,x_HPKBCrisisMt).
xc_source_file(a65b12506e93a2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93a2,6778).
xc_kb_names(a65b12506e93a2,["?GOVT","?MIL"]).
xc_mapping_rows(a65b12506e93a2,['implication-implies']).
xc_direction(a65b12506e93a2,':BACKWARD').
xc_monotonicity(a65b12506e93a2,':DEFAULT').
xc_creator(a65b12506e93a2,'Rode').
xc_creation_date(a65b12506e93a2,19980604).
x_isa(x_CommitteeForDefenseOfLegitimateRights,x_DissidentGroup) :- x_cid(a65b12506e93a3).
xc_microtheory(a65b12506e93a3,x_HPKBCrisisMt).
xc_source_file(a65b12506e93a3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93a3,6786).
xc_kb_names(a65b12506e93a3,[]).
xc_mapping_rows(a65b12506e93a3,[]).
xc_direction(a65b12506e93a3,':FORWARD').
xc_monotonicity(a65b12506e93a3,':DEFAULT').
x_isa(x_IslamicReformMovement,x_DissidentGroup) :- x_cid(a65b12506e93a4).
xc_microtheory(a65b12506e93a4,x_HPKBCrisisMt).
xc_source_file(a65b12506e93a4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93a4,6792).
xc_kb_names(a65b12506e93a4,[]).
xc_mapping_rows(a65b12506e93a4,[]).
xc_direction(a65b12506e93a4,':FORWARD').
xc_monotonicity(a65b12506e93a4,':DEFAULT').
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_performedBy(V1,V2),x_isa(V2,x_AirForce)),x_isa(V1,x_MilitaryAircraftMission)) :- x_cid(a65b12506e93a5,V1,V2).
xc_microtheory(a65b12506e93a5,x_HPKBCrisisMt).
xc_source_file(a65b12506e93a5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93a5,6798).
xc_kb_names(a65b12506e93a5,["?ATTACK","?AIRFORCE"]).
xc_mapping_rows(a65b12506e93a5,['implication-implies']).
xc_direction(a65b12506e93a5,':BACKWARD').
xc_monotonicity(a65b12506e93a5,':MONOTONIC').
xc_creator(a65b12506e93a5,'Rode').
xc_creation_date(a65b12506e93a5,19980603).
x_exportCapacityDuring(x_LevantRegion,V1,V2,x_PlusAll(x_LevantCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_exportCapacityDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93a6,V1,V2,V3,V4).
xc_microtheory(a65b12506e93a6,x_HPKBCrisisMt).
xc_source_file(a65b12506e93a6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93a6,6809).
xc_kb_names(a65b12506e93a6,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93a6,[]).
xc_direction(a65b12506e93a6,':BACKWARD').
xc_monotonicity(a65b12506e93a6,':DEFAULT').
xc_creator(a65b12506e93a6,'Schwartz').
xc_creation_date(a65b12506e93a6,19980603).
x_exportCapacityDuring('x_MiddleEast-Region',V1,V2,x_PlusAll(x_MiddleEasternCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_exportCapacityDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93a7,V1,V2,V3,V4).
xc_microtheory(a65b12506e93a7,x_HPKBCrisisMt).
xc_source_file(a65b12506e93a7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93a7,6820).
xc_kb_names(a65b12506e93a7,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93a7,[]).
xc_direction(a65b12506e93a7,':BACKWARD').
xc_monotonicity(a65b12506e93a7,':DEFAULT').
xc_creator(a65b12506e93a7,'Schwartz').
xc_creation_date(a65b12506e93a7,19980603).
x_exportCapacityDuring(x_PersianGulfRegion,V1,V2,x_PlusAll(x_PersianGulfCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_exportCapacityDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93a8,V1,V2,V3,V4).
xc_microtheory(a65b12506e93a8,x_HPKBCrisisMt).
xc_source_file(a65b12506e93a8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93a8,6831).
xc_kb_names(a65b12506e93a8,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93a8,[]).
xc_direction(a65b12506e93a8,':BACKWARD').
xc_monotonicity(a65b12506e93a8,':DEFAULT').
xc_creator(a65b12506e93a8,'Schwartz').
xc_creation_date(a65b12506e93a8,19980603).
x_importCapacityDuring(x_LevantRegion,V1,V2,x_PlusAll(x_LevantCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_importCapacityDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93a9,V1,V2,V3,V4).
xc_microtheory(a65b12506e93a9,x_HPKBCrisisMt).
xc_source_file(a65b12506e93a9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93a9,6842).
xc_kb_names(a65b12506e93a9,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93a9,[]).
xc_direction(a65b12506e93a9,':BACKWARD').
xc_monotonicity(a65b12506e93a9,':DEFAULT').
xc_creator(a65b12506e93a9,'Schwartz').
xc_creation_date(a65b12506e93a9,19980603).
x_importCapacityDuring('x_MiddleEast-Region',V1,V2,x_PlusAll(x_MiddleEasternCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_importCapacityDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93aa,V1,V2,V3,V4).
xc_microtheory(a65b12506e93aa,x_HPKBCrisisMt).
xc_source_file(a65b12506e93aa,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93aa,6853).
xc_kb_names(a65b12506e93aa,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93aa,[]).
xc_direction(a65b12506e93aa,':BACKWARD').
xc_monotonicity(a65b12506e93aa,':DEFAULT').
xc_creator(a65b12506e93aa,'Schwartz').
xc_creation_date(a65b12506e93aa,19980603).
x_importCapacityDuring(x_PersianGulfRegion,V1,V2,x_PlusAll(x_PersianGulfCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_importCapacityDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93ab,V1,V2,V3,V4).
xc_microtheory(a65b12506e93ab,x_HPKBCrisisMt).
xc_source_file(a65b12506e93ab,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93ab,6864).
xc_kb_names(a65b12506e93ab,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93ab,[]).
xc_direction(a65b12506e93ab,':BACKWARD').
xc_monotonicity(a65b12506e93ab,':DEFAULT').
xc_creator(a65b12506e93ab,'Schwartz').
xc_creation_date(a65b12506e93ab,19980603).
x_consumptionCapacityDuring(x_LevantRegion,V1,V2,x_PlusAll(x_LevantCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_consumptionCapacityDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93ac,V1,V2,V3,V4).
xc_microtheory(a65b12506e93ac,x_HPKBCrisisMt).
xc_source_file(a65b12506e93ac,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93ac,6875).
xc_kb_names(a65b12506e93ac,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93ac,[]).
xc_direction(a65b12506e93ac,':BACKWARD').
xc_monotonicity(a65b12506e93ac,':DEFAULT').
xc_creator(a65b12506e93ac,'Schwartz').
xc_creation_date(a65b12506e93ac,19980603).
x_consumptionCapacityDuring('x_MiddleEast-Region',V1,V2,x_PlusAll(x_MiddleEasternCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_consumptionCapacityDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93ad,V1,V2,V3,V4).
xc_microtheory(a65b12506e93ad,x_HPKBCrisisMt).
xc_source_file(a65b12506e93ad,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93ad,6886).
xc_kb_names(a65b12506e93ad,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93ad,[]).
xc_direction(a65b12506e93ad,':BACKWARD').
xc_monotonicity(a65b12506e93ad,':DEFAULT').
xc_creator(a65b12506e93ad,'Schwartz').
xc_creation_date(a65b12506e93ad,19980603).
x_consumptionCapacityDuring(x_PersianGulfRegion,V1,V2,x_PlusAll(x_PersianGulfCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_consumptionCapacityDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93ae,V1,V2,V3,V4).
xc_microtheory(a65b12506e93ae,x_HPKBCrisisMt).
xc_source_file(a65b12506e93ae,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93ae,6897).
xc_kb_names(a65b12506e93ae,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93ae,[]).
xc_direction(a65b12506e93ae,':BACKWARD').
xc_monotonicity(a65b12506e93ae,':DEFAULT').
xc_creator(a65b12506e93ae,'Schwartz').
xc_creation_date(a65b12506e93ae,19980603).
x_exportAmountDuring(x_LevantRegion,V1,V2,x_PlusAll(x_LevantCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_exportAmountDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93af,V1,V2,V3,V4).
xc_microtheory(a65b12506e93af,x_HPKBCrisisMt).
xc_source_file(a65b12506e93af,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93af,6908).
xc_kb_names(a65b12506e93af,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93af,[]).
xc_direction(a65b12506e93af,':BACKWARD').
xc_monotonicity(a65b12506e93af,':DEFAULT').
xc_creator(a65b12506e93af,'Schwartz').
xc_creation_date(a65b12506e93af,19980603).
x_exportAmountDuring('x_MiddleEast-Region',V1,V2,x_PlusAll(x_MiddleEasternCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_exportAmountDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93b0,V1,V2,V3,V4).
xc_microtheory(a65b12506e93b0,x_HPKBCrisisMt).
xc_source_file(a65b12506e93b0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93b0,6919).
xc_kb_names(a65b12506e93b0,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93b0,[]).
xc_direction(a65b12506e93b0,':BACKWARD').
xc_monotonicity(a65b12506e93b0,':DEFAULT').
xc_creator(a65b12506e93b0,'Schwartz').
xc_creation_date(a65b12506e93b0,19980603).
x_exportAmountDuring(x_PersianGulfRegion,V1,V2,x_PlusAll(x_PersianGulfCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_exportAmountDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93b1,V1,V2,V3,V4).
xc_microtheory(a65b12506e93b1,x_HPKBCrisisMt).
xc_source_file(a65b12506e93b1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93b1,6930).
xc_kb_names(a65b12506e93b1,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93b1,[]).
xc_direction(a65b12506e93b1,':BACKWARD').
xc_monotonicity(a65b12506e93b1,':DEFAULT').
xc_creator(a65b12506e93b1,'Schwartz').
xc_creation_date(a65b12506e93b1,19980603).
x_importAmountDuring(x_LevantRegion,V1,V2,x_PlusAll(x_LevantCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_importAmountDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93b2,V1,V2,V3,V4).
xc_microtheory(a65b12506e93b2,x_HPKBCrisisMt).
xc_source_file(a65b12506e93b2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93b2,6941).
xc_kb_names(a65b12506e93b2,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93b2,[]).
xc_direction(a65b12506e93b2,':BACKWARD').
xc_monotonicity(a65b12506e93b2,':DEFAULT').
xc_creator(a65b12506e93b2,'Schwartz').
xc_creation_date(a65b12506e93b2,19980603).
x_importAmountDuring('x_MiddleEast-Region',V1,V2,x_PlusAll(x_MiddleEasternCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_importAmountDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93b3,V1,V2,V3,V4).
xc_microtheory(a65b12506e93b3,x_HPKBCrisisMt).
xc_source_file(a65b12506e93b3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93b3,6952).
xc_kb_names(a65b12506e93b3,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93b3,[]).
xc_direction(a65b12506e93b3,':BACKWARD').
xc_monotonicity(a65b12506e93b3,':DEFAULT').
xc_creator(a65b12506e93b3,'Schwartz').
xc_creation_date(a65b12506e93b3,19980603).
x_importAmountDuring(x_PersianGulfRegion,V1,V2,x_PlusAll(x_PersianGulfCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_importAmountDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93b4,V1,V2,V3,V4).
xc_microtheory(a65b12506e93b4,x_HPKBCrisisMt).
xc_source_file(a65b12506e93b4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93b4,6963).
xc_kb_names(a65b12506e93b4,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93b4,[]).
xc_direction(a65b12506e93b4,':BACKWARD').
xc_monotonicity(a65b12506e93b4,':DEFAULT').
xc_creator(a65b12506e93b4,'Schwartz').
xc_creation_date(a65b12506e93b4,19980603).
x_consumptionAmountDuring(x_LevantRegion,V1,V2,x_PlusAll(x_LevantCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_consumptionAmountDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93b5,V1,V2,V3,V4).
xc_microtheory(a65b12506e93b5,x_HPKBCrisisMt).
xc_source_file(a65b12506e93b5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93b5,6974).
xc_kb_names(a65b12506e93b5,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93b5,[]).
xc_direction(a65b12506e93b5,':BACKWARD').
xc_monotonicity(a65b12506e93b5,':DEFAULT').
xc_creator(a65b12506e93b5,'Schwartz').
xc_creation_date(a65b12506e93b5,19980603).
x_consumptionAmountDuring('x_MiddleEast-Region',V1,V2,x_PlusAll(x_MiddleEasternCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_consumptionAmountDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93b6,V1,V2,V3,V4).
xc_microtheory(a65b12506e93b6,x_HPKBCrisisMt).
xc_source_file(a65b12506e93b6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93b6,6985).
xc_kb_names(a65b12506e93b6,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93b6,[]).
xc_direction(a65b12506e93b6,':BACKWARD').
xc_monotonicity(a65b12506e93b6,':DEFAULT').
xc_creator(a65b12506e93b6,'Schwartz').
xc_creation_date(a65b12506e93b6,19980603).
x_consumptionAmountDuring(x_PersianGulfRegion,V1,V2,x_PlusAll(x_PersianGulfCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_consumptionAmountDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93b7,V1,V2,V3,V4).
xc_microtheory(a65b12506e93b7,x_HPKBCrisisMt).
xc_source_file(a65b12506e93b7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93b7,6996).
xc_kb_names(a65b12506e93b7,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93b7,[]).
xc_direction(a65b12506e93b7,':BACKWARD').
xc_monotonicity(a65b12506e93b7,':DEFAULT').
xc_creator(a65b12506e93b7,'Schwartz').
xc_creation_date(a65b12506e93b7,19980603).
x_productionCapacityDuring(x_LevantRegion,V1,V2,x_PlusAll(x_LevantCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_productionCapacityDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93b8,V1,V2,V3,V4).
xc_microtheory(a65b12506e93b8,x_HPKBCrisisMt).
xc_source_file(a65b12506e93b8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93b8,7007).
xc_kb_names(a65b12506e93b8,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93b8,[]).
xc_direction(a65b12506e93b8,':BACKWARD').
xc_monotonicity(a65b12506e93b8,':DEFAULT').
xc_creator(a65b12506e93b8,'Schwartz').
xc_creation_date(a65b12506e93b8,19980603).
x_productionCapacityDuring('x_MiddleEast-Region',V1,V2,x_PlusAll(x_MiddleEasternCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_productionCapacityDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e93b9,V1,V2,V3,V4).
xc_microtheory(a65b12506e93b9,x_HPKBCrisisMt).
xc_source_file(a65b12506e93b9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93b9,7018).
xc_kb_names(a65b12506e93b9,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e93b9,[]).
xc_direction(a65b12506e93b9,':BACKWARD').
xc_monotonicity(a65b12506e93b9,':DEFAULT').
xc_creator(a65b12506e93b9,'Schwartz').
xc_creation_date(a65b12506e93b9,19980603).
x_implies(x_importFromThroughAmountDuring(V1,V2,V3,V4,V5,V6),x_supplyFromThroughAmountDuring(V1,V2,V3,V4,V5,V6)) :- x_cid(a65b12506e93ba,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e93ba,x_HPKBCrisisMt).
xc_source_file(a65b12506e93ba,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93ba,7029).
xc_kb_names(a65b12506e93ba,["?REGION1","?PRODUCT-TYPE","?REGION2","?PT","?TIME","?AMOUNT"]).
xc_mapping_rows(a65b12506e93ba,['implication-implies']).
xc_direction(a65b12506e93ba,':BACKWARD').
xc_monotonicity(a65b12506e93ba,':DEFAULT').
xc_creator(a65b12506e93ba,'Schwartz').
xc_creation_date(a65b12506e93ba,19980603).
x_implies(x_importThroughAmountDuring(V1,V2,V3,V4,V5),x_supplyThroughAmountDuring(V1,V2,V3,V4,V5)) :- x_cid(a65b12506e93bb,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e93bb,x_HPKBCrisisMt).
xc_source_file(a65b12506e93bb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93bb,7037).
xc_kb_names(a65b12506e93bb,["?REGION","?PRODUCT-TYPE","?PT","?TIME","?AMOUNT"]).
xc_mapping_rows(a65b12506e93bb,['implication-implies']).
xc_direction(a65b12506e93bb,':BACKWARD').
xc_monotonicity(a65b12506e93bb,':DEFAULT').
xc_creator(a65b12506e93bb,'Schwartz').
xc_creation_date(a65b12506e93bb,19980603).
x_implies(x_importFromAmountDuring(V1,V2,V3,V4,V5),x_supplyFromAmountDuring(V1,V2,V3,V4,V5)) :- x_cid(a65b12506e93bc,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e93bc,x_HPKBCrisisMt).
xc_source_file(a65b12506e93bc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93bc,7045).
xc_kb_names(a65b12506e93bc,["?REGION1","?PRODUCT-TYPE","?REGION2","?TIME","?AMOUNT"]).
xc_mapping_rows(a65b12506e93bc,['implication-implies']).
xc_direction(a65b12506e93bc,':BACKWARD').
xc_monotonicity(a65b12506e93bc,':DEFAULT').
xc_creator(a65b12506e93bc,'Schwartz').
xc_creation_date(a65b12506e93bc,19980603).
x_implies(x_and(x_isa(V1,x_GeographicalRegion),x_consumptionAmountDuring(V1,V2,V3,V4)),x_demandAmountDuring(V1,V2,V3,V4)) :- x_cid(a65b12506e93bd,V1,V2,V3,V4).
xc_microtheory(a65b12506e93bd,x_HPKBCrisisMt).
xc_source_file(a65b12506e93bd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93bd,7053).
xc_kb_names(a65b12506e93bd,["?REGION","?PRODUCT-TYPE","?TIME","?AMOUNT"]).
xc_mapping_rows(a65b12506e93bd,['implication-implies']).
xc_direction(a65b12506e93bd,':BACKWARD').
xc_monotonicity(a65b12506e93bd,':DEFAULT').
xc_creator(a65b12506e93bd,'Schwartz').
xc_creation_date(a65b12506e93bd,19980603).
x_implies(x_and(x_isa(V1,x_GeographicalRegion),x_different(x_PlanetEarth,V1),x_consumptionAmountDuring(V1,V2,V3,V4)),x_supplyAmountDuring(V1,V2,V3,V4)) :- x_cid(a65b12506e93be,V1,V2,V3,V4).
xc_microtheory(a65b12506e93be,x_HPKBCrisisMt).
xc_source_file(a65b12506e93be,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93be,7063).
xc_kb_names(a65b12506e93be,["?REGION","?PRODUCT-TYPE","?TIME","?AMOUNT"]).
xc_mapping_rows(a65b12506e93be,['implication-implies']).
xc_direction(a65b12506e93be,':BACKWARD').
xc_monotonicity(a65b12506e93be,':DEFAULT').
xc_creator(a65b12506e93be,'Schwartz').
xc_creation_date(a65b12506e93be,19980603).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_TerroristAttack),x_maleficiary(V1,V2)),'x_causes-SitProp'(V1,x_quantityChangeFunction(x_ShortTermFn(V1),V2,x_politicalStability,x_NetDecreasingFunction))),'x_NoteAboutKnowledgeFragment-A4') :- x_cid(a65b12506e93bf,V1,V2).
xc_microtheory(a65b12506e93bf,x_HPKBCrisisMt).
xc_source_file(a65b12506e93bf,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93bf,7074).
xc_kb_names(a65b12506e93bf,["?ATTACK","?COUNTRY"]).
xc_mapping_rows(a65b12506e93bf,['implication-implies']).
xc_direction(a65b12506e93bf,':BACKWARD').
xc_monotonicity(a65b12506e93bf,':DEFAULT').
xc_creator(a65b12506e93bf,'BillJ').
xc_creation_date(a65b12506e93bf,19980603).
x_holdsIn(x_Y1Phase2ScenarioConflict,x_goals(x_GulfCooperationCouncil,x_relationExistsInstance('x_pathway-Partial',x_TransportViaFn(x_Ship),x_PersianGulf))) :- x_cid(a65b12506e93c0).
xc_microtheory(a65b12506e93c0,x_HPKBCrisisMt).
xc_source_file(a65b12506e93c0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93c0,7087).
xc_kb_names(a65b12506e93c0,[]).
xc_mapping_rows(a65b12506e93c0,[]).
xc_direction(a65b12506e93c0,':FORWARD').
xc_monotonicity(a65b12506e93c0,':DEFAULT').
xc_creator(a65b12506e93c0,'ABelasco').
xc_creation_date(a65b12506e93c0,19980603).
x_holdsIn(x_Y1Phase2ScenarioConflict,x_goals(x_Bahrain,x_relationExistsInstance('x_pathway-Partial',x_TransportViaFn(x_Ship),x_PersianGulf))) :- x_cid(a65b12506e93c1).
xc_microtheory(a65b12506e93c1,x_HPKBCrisisMt).
xc_source_file(a65b12506e93c1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93c1,7096).
xc_kb_names(a65b12506e93c1,[]).
xc_mapping_rows(a65b12506e93c1,[]).
xc_direction(a65b12506e93c1,':FORWARD').
xc_monotonicity(a65b12506e93c1,':DEFAULT').
x_holdsIn(x_Y1Phase2ScenarioConflict,x_goals(x_Oman,x_relationExistsInstance('x_pathway-Partial',x_TransportViaFn(x_Ship),x_PersianGulf))) :- x_cid(a65b12506e93c2).
xc_microtheory(a65b12506e93c2,x_HPKBCrisisMt).
xc_source_file(a65b12506e93c2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93c2,7105).
xc_kb_names(a65b12506e93c2,[]).
xc_mapping_rows(a65b12506e93c2,[]).
xc_direction(a65b12506e93c2,':FORWARD').
xc_monotonicity(a65b12506e93c2,':DEFAULT').
x_holdsIn(x_Y1Phase2ScenarioConflict,x_goals(x_SaudiArabia,x_relationExistsInstance('x_pathway-Partial',x_TransportViaFn(x_Ship),x_PersianGulf))) :- x_cid(a65b12506e93c3).
xc_microtheory(a65b12506e93c3,x_HPKBCrisisMt).
xc_source_file(a65b12506e93c3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93c3,7114).
xc_kb_names(a65b12506e93c3,[]).
xc_mapping_rows(a65b12506e93c3,[]).
xc_direction(a65b12506e93c3,':FORWARD').
xc_monotonicity(a65b12506e93c3,':DEFAULT').
x_holdsIn(x_Y1Phase2ScenarioConflict,x_goals(x_UnitedArabEmirates,x_relationExistsInstance('x_pathway-Partial',x_TransportViaFn(x_Ship),x_PersianGulf))) :- x_cid(a65b12506e93c4).
xc_microtheory(a65b12506e93c4,x_HPKBCrisisMt).
xc_source_file(a65b12506e93c4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93c4,7123).
xc_kb_names(a65b12506e93c4,[]).
xc_mapping_rows(a65b12506e93c4,[]).
xc_direction(a65b12506e93c4,':FORWARD').
xc_monotonicity(a65b12506e93c4,':DEFAULT').
x_holdsIn(x_Y1Phase2ScenarioConflict,x_goals(x_Kuwait,x_relationExistsInstance('x_pathway-Partial',x_TransportViaFn(x_Ship),x_PersianGulf))) :- x_cid(a65b12506e93c5).
xc_microtheory(a65b12506e93c5,x_HPKBCrisisMt).
xc_source_file(a65b12506e93c5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93c5,7132).
xc_kb_names(a65b12506e93c5,[]).
xc_mapping_rows(a65b12506e93c5,[]).
xc_direction(a65b12506e93c5,':FORWARD').
xc_monotonicity(a65b12506e93c5,':DEFAULT').
x_holdsIn(x_Y1Phase2ScenarioConflict,x_goals(x_Qatar,x_relationExistsInstance('x_pathway-Partial',x_TransportViaFn(x_Ship),x_PersianGulf))) :- x_cid(a65b12506e93c6).
xc_microtheory(a65b12506e93c6,x_HPKBCrisisMt).
xc_source_file(a65b12506e93c6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93c6,7141).
xc_kb_names(a65b12506e93c6,[]).
xc_mapping_rows(a65b12506e93c6,[]).
xc_direction(a65b12506e93c6,':FORWARD').
xc_monotonicity(a65b12506e93c6,':DEFAULT').
x_holdsIn(x_Y1Phase2ScenarioConflict,x_goals(x_Iran,x_powerInOrganization(x_Iran,x_OPEC,x_MediumToVeryHigh))) :- x_cid(a65b12506e93c7).
xc_microtheory(a65b12506e93c7,x_HPKBCrisisMt).
xc_source_file(a65b12506e93c7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93c7,7150).
xc_kb_names(a65b12506e93c7,[]).
xc_mapping_rows(a65b12506e93c7,[]).
xc_direction(a65b12506e93c7,':FORWARD').
xc_monotonicity(a65b12506e93c7,':DEFAULT').
xc_creator(a65b12506e93c7,'ABelasco').
xc_creation_date(a65b12506e93c7,19980603).
x_holdsIn(x_Y1Phase2ScenarioConflict,x_goals(x_SaudiArabia,x_powerInOrganization(x_SaudiArabia,x_OPEC,x_MediumToVeryHigh))) :- x_cid(a65b12506e93c8).
xc_microtheory(a65b12506e93c8,x_HPKBCrisisMt).
xc_source_file(a65b12506e93c8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93c8,7158).
xc_kb_names(a65b12506e93c8,[]).
xc_mapping_rows(a65b12506e93c8,[]).
xc_direction(a65b12506e93c8,':FORWARD').
xc_monotonicity(a65b12506e93c8,':DEFAULT').
xc_creator(a65b12506e93c8,'ABelasco').
xc_creation_date(a65b12506e93c8,19980603).
x_holdsIn(x_Y1Phase2ScenarioConflict,x_powerInOrganization(x_SaudiArabia,x_GulfCooperationCouncil,x_MediumToVeryHigh)) :- x_cid(a65b12506e93c9).
xc_microtheory(a65b12506e93c9,x_HPKBCrisisMt).
xc_source_file(a65b12506e93c9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93c9,7166).
xc_kb_names(a65b12506e93c9,[]).
xc_mapping_rows(a65b12506e93c9,[]).
xc_direction(a65b12506e93c9,':FORWARD').
xc_monotonicity(a65b12506e93c9,':DEFAULT').
xc_creator(a65b12506e93c9,'ABelasco').
xc_creation_date(a65b12506e93c9,19980603).
x_holdsIn(x_Y1Phase2ScenarioConflict,x_powerInOrganization(x_SaudiArabia,x_OPEC,x_MediumToVeryHigh)) :- x_cid(a65b12506e93ca).
xc_microtheory(a65b12506e93ca,x_HPKBCrisisMt).
xc_source_file(a65b12506e93ca,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93ca,7173).
xc_kb_names(a65b12506e93ca,[]).
xc_mapping_rows(a65b12506e93ca,[]).
xc_direction(a65b12506e93ca,':FORWARD').
xc_monotonicity(a65b12506e93ca,':DEFAULT').
xc_creator(a65b12506e93ca,'ABelasco').
xc_creation_date(a65b12506e93ca,19980603).
x_holdsIn(x_Y1Phase2ScenarioConflict,x_goals(x_Iran,'x_powerInRegion-Economic'(x_Iran,x_PersianGulfRegion,x_MediumToVeryHigh))) :- x_cid(a65b12506e93cb).
xc_microtheory(a65b12506e93cb,x_HPKBCrisisMt).
xc_source_file(a65b12506e93cb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93cb,7180).
xc_kb_names(a65b12506e93cb,[]).
xc_mapping_rows(a65b12506e93cb,[]).
xc_direction(a65b12506e93cb,':FORWARD').
xc_monotonicity(a65b12506e93cb,':DEFAULT').
xc_creator(a65b12506e93cb,'ABelasco').
xc_creation_date(a65b12506e93cb,19980603).
x_holdsIn(x_Y1Phase2ScenarioConflict,x_goals(x_SaudiArabia,'x_powerInRegion-Economic'(x_SaudiArabia,x_PersianGulfRegion,x_MediumToVeryHigh))) :- x_cid(a65b12506e93cc).
xc_microtheory(a65b12506e93cc,x_HPKBCrisisMt).
xc_source_file(a65b12506e93cc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93cc,7188).
xc_kb_names(a65b12506e93cc,[]).
xc_mapping_rows(a65b12506e93cc,[]).
xc_direction(a65b12506e93cc,':FORWARD').
xc_monotonicity(a65b12506e93cc,':DEFAULT').
xc_creator(a65b12506e93cc,'ABelasco').
xc_creation_date(a65b12506e93cc,19980603).
x_holdsIn(x_Y1Phase2ScenarioConflict,'x_powerInRegion-Economic'(x_SaudiArabia,'x_MiddleEast-Region',x_MediumToVeryHigh)) :- x_cid(a65b12506e93cd).
xc_microtheory(a65b12506e93cd,x_HPKBCrisisMt).
xc_source_file(a65b12506e93cd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93cd,7196).
xc_kb_names(a65b12506e93cd,[]).
xc_mapping_rows(a65b12506e93cd,[]).
xc_direction(a65b12506e93cd,':FORWARD').
xc_monotonicity(a65b12506e93cd,':DEFAULT').
xc_creator(a65b12506e93cd,'ABelasco').
xc_creation_date(a65b12506e93cd,19980603).
x_holdsIn(x_Y1Phase2ScenarioConflict,'x_powerInRegion-Economic'(x_SaudiArabia,x_PersianGulfRegion,x_MediumToVeryHigh)) :- x_cid(a65b12506e93ce).
xc_microtheory(a65b12506e93ce,x_HPKBCrisisMt).
xc_source_file(a65b12506e93ce,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93ce,7203).
xc_kb_names(a65b12506e93ce,[]).
xc_mapping_rows(a65b12506e93ce,[]).
xc_direction(a65b12506e93ce,':FORWARD').
xc_monotonicity(a65b12506e93ce,':DEFAULT').
xc_creator(a65b12506e93ce,'ABelasco').
xc_creation_date(a65b12506e93ce,19980603).
x_holdsIn(x_Y1Phase2ScenarioConflict,x_goals(x_SaudiArabia,x_hasLeaders(x_PersianGulfCountries,x_SaudiArabia))) :- x_cid(a65b12506e93cf).
xc_microtheory(a65b12506e93cf,x_HPKBCrisisMt).
xc_source_file(a65b12506e93cf,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93cf,7210).
xc_kb_names(a65b12506e93cf,[]).
xc_mapping_rows(a65b12506e93cf,[]).
xc_direction(a65b12506e93cf,':FORWARD').
xc_monotonicity(a65b12506e93cf,':DEFAULT').
xc_creator(a65b12506e93cf,'ABelasco').
xc_creation_date(a65b12506e93cf,19980603).
x_holdsIn(x_Y1Phase2ScenarioConflict,x_goals(x_SaudiArabia,x_hasLeaders(x_OPEC,x_SaudiArabia))) :- x_cid(a65b12506e93d0).
xc_microtheory(a65b12506e93d0,x_HPKBCrisisMt).
xc_source_file(a65b12506e93d0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93d0,7218).
xc_kb_names(a65b12506e93d0,[]).
xc_mapping_rows(a65b12506e93d0,[]).
xc_direction(a65b12506e93d0,':FORWARD').
xc_monotonicity(a65b12506e93d0,':DEFAULT').
xc_creator(a65b12506e93d0,'ABelasco').
xc_creation_date(a65b12506e93d0,19980603).
x_goals(x_OECD,x_not(x_thereExists(V1,x_and(x_isa(V1,x_BlockingTraffic),x_objectActedOn(V1,x_StraitOfHormuz))))) :- x_cid(a65b12506e93d1,V1).
xc_microtheory(a65b12506e93d1,x_HPKBCrisisMt).
xc_source_file(a65b12506e93d1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93d1,7226).
xc_kb_names(a65b12506e93d1,["?BLOCK"]).
xc_mapping_rows(a65b12506e93d1,['exists-thereexists']).
xc_direction(a65b12506e93d1,':FORWARD').
xc_monotonicity(a65b12506e93d1,':DEFAULT').
x_goalCategoryForAgent(x_OECD,x_not(x_thereExists(V1,x_and(x_isa(V1,x_BlockingTraffic),x_objectActedOn(V1,x_StraitOfHormuz)))),x_StrategicInterest) :- x_cid(a65b12506e93d2,V1).
xc_microtheory(a65b12506e93d2,x_HPKBCrisisMt).
xc_source_file(a65b12506e93d2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93d2,7238).
xc_kb_names(a65b12506e93d2,["?BLOCK"]).
xc_mapping_rows(a65b12506e93d2,['exists-thereexists']).
xc_direction(a65b12506e93d2,':FORWARD').
xc_monotonicity(a65b12506e93d2,':DEFAULT').
x_goalCategoryForAgent(x_OECD,x_not(x_thereExists(V1,x_and(x_isa(V1,x_BlockingTraffic),x_objectActedOn(V1,x_StraitOfHormuz)))),x_StrategicNationalInterest) :- x_cid(a65b12506e93d3,V1).
xc_microtheory(a65b12506e93d3,x_HPKBCrisisMt).
xc_source_file(a65b12506e93d3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93d3,7250).
xc_kb_names(a65b12506e93d3,["?BLOCK"]).
xc_mapping_rows(a65b12506e93d3,['exists-thereexists']).
xc_direction(a65b12506e93d3,':FORWARD').
xc_monotonicity(a65b12506e93d3,':DEFAULT').
x_goals(x_InternationalEnergyAgency,x_not(x_thereExists(V1,x_and(x_isa(V1,x_BlockingTraffic),x_objectActedOn(V1,x_StraitOfHormuz))))) :- x_cid(a65b12506e93d4,V1).
xc_microtheory(a65b12506e93d4,x_HPKBCrisisMt).
xc_source_file(a65b12506e93d4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93d4,7262).
xc_kb_names(a65b12506e93d4,["?BLOCK"]).
xc_mapping_rows(a65b12506e93d4,['exists-thereexists']).
xc_direction(a65b12506e93d4,':FORWARD').
xc_monotonicity(a65b12506e93d4,':DEFAULT').
x_goalCategoryForAgent(x_InternationalEnergyAgency,x_not(x_thereExists(V1,x_and(x_isa(V1,x_BlockingTraffic),x_objectActedOn(V1,x_StraitOfHormuz)))),x_StrategicInterest) :- x_cid(a65b12506e93d5,V1).
xc_microtheory(a65b12506e93d5,x_HPKBCrisisMt).
xc_source_file(a65b12506e93d5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93d5,7274).
xc_kb_names(a65b12506e93d5,["?BLOCK"]).
xc_mapping_rows(a65b12506e93d5,['exists-thereexists']).
xc_direction(a65b12506e93d5,':FORWARD').
xc_monotonicity(a65b12506e93d5,':DEFAULT').
x_goalCategoryForAgent(x_OECD,x_not(x_thereExists(V1,x_and(x_isa(V1,x_BlockingTraffic),x_objectActedOn(V1,x_StraitOfHormuz)))),x_FuelSupplyGoal) :- x_cid(a65b12506e93d6,V1).
xc_microtheory(a65b12506e93d6,x_HPKBCrisisMt).
xc_source_file(a65b12506e93d6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93d6,7286).
xc_kb_names(a65b12506e93d6,["?BLOCK"]).
xc_mapping_rows(a65b12506e93d6,['exists-thereexists']).
xc_direction(a65b12506e93d6,':FORWARD').
xc_monotonicity(a65b12506e93d6,':DEFAULT').
x_goalCategoryForAgent(x_InternationalEnergyAgency,x_not(x_thereExists(V1,x_and(x_isa(V1,x_BlockingTraffic),x_objectActedOn(V1,x_StraitOfHormuz)))),x_FuelSupplyGoal) :- x_cid(a65b12506e93d7,V1).
xc_microtheory(a65b12506e93d7,x_HPKBCrisisMt).
xc_source_file(a65b12506e93d7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93d7,7298).
xc_kb_names(a65b12506e93d7,["?BLOCK"]).
xc_mapping_rows(a65b12506e93d7,['exists-thereexists']).
xc_direction(a65b12506e93d7,':FORWARD').
xc_monotonicity(a65b12506e93d7,':DEFAULT').
x_implies(x_and(x_allies(V1,V2),x_importsThrough(V1,V3,V4)),x_goalCategoryForAgent(V2,x_not(x_thereExists(V5,x_and(x_isa(V5,x_BlockingTraffic),x_objectActedOn(V5,V4)))),x_AidingAllies)) :- x_cid(a65b12506e93d8,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e93d8,x_HPKBCrisisMt).
xc_source_file(a65b12506e93d8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93d8,7310).
xc_kb_names(a65b12506e93d8,["?COUNTRY1","?COUNTRY2","?PROD","?PATH","?BLOCK"]).
xc_mapping_rows(a65b12506e93d8,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e93d8,':BACKWARD').
xc_monotonicity(a65b12506e93d8,':DEFAULT').
xc_creator(a65b12506e93d8,'ABelasco').
xc_creation_date(a65b12506e93d8,19980602).
x_implies(x_and(x_isa(V1,x_TerroristAttack),x_maleficiary(V1,V2)),'x_causes-SitProp'(V1,x_quantityChangeFunction(x_ShortTermFn(V1),V2,x_politicalStability,x_NetDecreasingFunction))) :- x_cid(a65b12506e93d9,V1,V2).
xc_microtheory(a65b12506e93d9,x_HPKBCrisisMt).
xc_source_file(a65b12506e93d9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93d9,7326).
xc_kb_names(a65b12506e93d9,["?ATTACK","?COUNTRY"]).
xc_mapping_rows(a65b12506e93d9,['implication-implies']).
xc_direction(a65b12506e93d9,':BACKWARD').
xc_monotonicity(a65b12506e93d9,':DEFAULT').
xc_creator(a65b12506e93d9,'BillJ').
xc_creation_date(a65b12506e93d9,19980526).
x_relationAllInstance(x_destructivePotentialOf,'x_BallisticMissile-NuclearReEntryVehicle',x_VeryHighAmountFn(x_DestructivePotential)) :- x_cid(a65b12506e93da).
xc_microtheory(a65b12506e93da,x_HPKBCrisisMt).
xc_source_file(a65b12506e93da,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93da,7338).
xc_kb_names(a65b12506e93da,[]).
xc_mapping_rows(a65b12506e93da,[]).
xc_direction(a65b12506e93da,':FORWARD').
xc_monotonicity(a65b12506e93da,':DEFAULT').
xc_creator(a65b12506e93da,'Rode').
xc_creation_date(a65b12506e93da,19980602).
x_relationAllInstance(x_destructivePotentialOf,'x_BallisticMissile-ICBM',x_VeryHighAmountFn(x_DestructivePotential)) :- x_cid(a65b12506e93db).
xc_microtheory(a65b12506e93db,x_HPKBCrisisMt).
xc_source_file(a65b12506e93db,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93db,7345).
xc_kb_names(a65b12506e93db,[]).
xc_mapping_rows(a65b12506e93db,[]).
xc_direction(a65b12506e93db,':FORWARD').
xc_monotonicity(a65b12506e93db,':DEFAULT').
xc_creator(a65b12506e93db,'Rode').
xc_creation_date(a65b12506e93db,19980602).
x_relationAllInstance(x_destructivePotentialOf,'x_BallisticMissile-IntermediateRange',x_MediumAmountFn(x_DestructivePotential)) :- x_cid(a65b12506e93dc).
xc_microtheory(a65b12506e93dc,x_HPKBCrisisMt).
xc_source_file(a65b12506e93dc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93dc,7352).
xc_kb_names(a65b12506e93dc,[]).
xc_mapping_rows(a65b12506e93dc,[]).
xc_direction(a65b12506e93dc,':FORWARD').
xc_monotonicity(a65b12506e93dc,':DEFAULT').
xc_creator(a65b12506e93dc,'Rode').
xc_creation_date(a65b12506e93dc,19980602).
x_relationAllInstance(x_destructivePotentialOf,'x_BallisticMissile-ShortRange',x_MediumAmountFn(x_DestructivePotential)) :- x_cid(a65b12506e93dd).
xc_microtheory(a65b12506e93dd,x_HPKBCrisisMt).
xc_source_file(a65b12506e93dd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93dd,7359).
xc_kb_names(a65b12506e93dd,[]).
xc_mapping_rows(a65b12506e93dd,[]).
xc_direction(a65b12506e93dd,':FORWARD').
xc_monotonicity(a65b12506e93dd,':DEFAULT').
xc_creator(a65b12506e93dd,'Rode').
xc_creation_date(a65b12506e93dd,19980602).
x_relationAllInstance(x_destructivePotentialOf,'x_BallisticMissile-BattlefieldShortRange',x_LowAmountFn(x_DestructivePotential)) :- x_cid(a65b12506e93de).
xc_microtheory(a65b12506e93de,x_HPKBCrisisMt).
xc_source_file(a65b12506e93de,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93de,7366).
xc_kb_names(a65b12506e93de,[]).
xc_mapping_rows(a65b12506e93de,[]).
xc_direction(a65b12506e93de,':FORWARD').
xc_monotonicity(a65b12506e93de,':DEFAULT').
xc_creator(a65b12506e93de,'Rode').
xc_creation_date(a65b12506e93de,19980602).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_GeographicalAgent),x_isa(V2,x_AttackOnTangible),x_isa(V3,x_GeographicalAgent),x_performedBy(V2,V1),x_maleficiary(V2,V3)),x_holdsIn(V2,x_opponents(V1,V3))),x_NoteAbout81Rules) :- x_cid(a65b12506e93df,V1,V2,V3).
xc_microtheory(a65b12506e93df,x_HPKBCrisisMt).
xc_source_file(a65b12506e93df,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93df,7373).
xc_kb_names(a65b12506e93df,["?AGENT","?ATTACK","?VICTIM"]).
xc_mapping_rows(a65b12506e93df,['implication-implies']).
xc_direction(a65b12506e93df,':BACKWARD').
xc_monotonicity(a65b12506e93df,':MONOTONIC').
xc_creator(a65b12506e93df,'Rode').
xc_creation_date(a65b12506e93df,19980602).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_GeographicalAgent),x_isa(V2,x_AttackOnTangible),x_isa(V3,x_GeographicalAgent),x_performedBy(V2,V1),x_maleficiary(V2,V3)),x_holdsIn(V2,x_opponents(V1,V3))),x_NoteAbout77Rules) :- x_cid(a65b12506e93e0,V1,V2,V3).
xc_microtheory(a65b12506e93e0,x_HPKBCrisisMt).
xc_source_file(a65b12506e93e0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93e0,7388).
xc_kb_names(a65b12506e93e0,["?AGENT","?ATTACK","?VICTIM"]).
xc_mapping_rows(a65b12506e93e0,['implication-implies']).
xc_direction(a65b12506e93e0,':BACKWARD').
xc_monotonicity(a65b12506e93e0,':MONOTONIC').
xc_creator(a65b12506e93e0,'Rode').
xc_creation_date(a65b12506e93e0,19980602).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_maleficiary(V1,V2),x_isa(V2,x_GeographicalAgent),x_performedBy(V1,V3),x_isa(V3,x_GeographicalAgent)),x_holdsIn(V1,x_opponents(V3,V2))) :- x_cid(a65b12506e93e1,V1,V2,V3).
xc_microtheory(a65b12506e93e1,x_HPKBCrisisMt).
xc_source_file(a65b12506e93e1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93e1,7403).
xc_kb_names(a65b12506e93e1,["?ATTACK","?VICTIM","?AGENT"]).
xc_mapping_rows(a65b12506e93e1,['implication-implies']).
xc_direction(a65b12506e93e1,':BACKWARD').
xc_monotonicity(a65b12506e93e1,':MONOTONIC').
xc_creator(a65b12506e93e1,'Rode').
xc_creation_date(a65b12506e93e1,19980602).
x_implies(x_and(x_isa(V1,x_NewsOrganization),x_controls(V2,x_NationalPressFn(V3)),x_groupMembers(x_NationalPressFn(V3),V1)),x_controls(V2,V1)) :- x_cid(a65b12506e93e2,V1,V2,V3).
xc_microtheory(a65b12506e93e2,x_HPKBCrisisMt).
xc_source_file(a65b12506e93e2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93e2,7417).
xc_kb_names(a65b12506e93e2,["?ORG","?AGENT","?COUNTRY"]).
xc_mapping_rows(a65b12506e93e2,['implication-implies']).
xc_direction(a65b12506e93e2,':BACKWARD').
xc_monotonicity(a65b12506e93e2,':DEFAULT').
xc_creator(a65b12506e93e2,'Nichols').
xc_creation_date(a65b12506e93e2,19980602).
x_groupMembers(x_NationalPressFn(x_Iran),x_IslamicRepublicNewsAgency) :- x_cid(a65b12506e93e3).
xc_microtheory(a65b12506e93e3,x_HPKBCrisisMt).
xc_source_file(a65b12506e93e3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93e3,7430).
xc_kb_names(a65b12506e93e3,[]).
xc_mapping_rows(a65b12506e93e3,[]).
xc_direction(a65b12506e93e3,':FORWARD').
xc_monotonicity(a65b12506e93e3,':DEFAULT').
xc_creator(a65b12506e93e3,'Nichols').
xc_creation_date(a65b12506e93e3,19980602).
x_controls('x_China-PeoplesRepublic',x_NationalPressFn('x_China-PeoplesRepublic')) :- x_cid(a65b12506e93e4).
xc_microtheory(a65b12506e93e4,x_HPKBCrisisMt).
xc_source_file(a65b12506e93e4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93e4,7437).
xc_kb_names(a65b12506e93e4,[]).
xc_mapping_rows(a65b12506e93e4,[]).
xc_direction(a65b12506e93e4,':FORWARD').
xc_monotonicity(a65b12506e93e4,':DEFAULT').
xc_creator(a65b12506e93e4,'Nichols').
xc_creation_date(a65b12506e93e4,19980602).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_BlockingTraffic),x_isa(V2,x_RegionalGovernment),x_isa(V3,'x_ShippingLane-International'),x_performedBy(V1,V2),x_objectActedOn(V1,V3)),x_thereExists(V4,x_and(x_isa(V4,x_ModernMilitaryOrganization),x_subOrganizations(V2,V4),x_assistingAgent(V1,V4)))),x_NoteAbout47Rules) :- x_cid(a65b12506e93e5,V1,V2,V3,V4).
xc_microtheory(a65b12506e93e5,x_HPKBCrisisMt).
xc_source_file(a65b12506e93e5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93e5,7444).
xc_kb_names(a65b12506e93e5,["?BLOCK","?GOVT","?WATERWAY","?ORG"]).
xc_mapping_rows(a65b12506e93e5,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e93e5,':BACKWARD').
xc_monotonicity(a65b12506e93e5,':DEFAULT').
xc_creator(a65b12506e93e5,'Rode').
xc_creation_date(a65b12506e93e5,19980602).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_BlockingTraffic),x_isa(V2,x_RegionalGovernment),x_isa(V3,'x_ShippingLane-International'),x_performedBy(V1,V2),x_objectActedOn(V1,V3)),x_thereExists(V4,x_and(x_isa(V4,x_ModernMilitaryOrganization),x_subOrganizations(V2,V4),x_assistingAgent(V1,V4)))),x_NoteAbout47Rules) :- x_cid(a65b12506e93e6,V1,V2,V3,V4).
xc_microtheory(a65b12506e93e6,x_HPKBCrisisMt).
xc_source_file(a65b12506e93e6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93e6,7463).
xc_kb_names(a65b12506e93e6,["?BLOCK","?GOVT","?WATERWAY","?ORG"]).
xc_mapping_rows(a65b12506e93e6,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e93e6,':BACKWARD').
xc_monotonicity(a65b12506e93e6,':DEFAULT').
xc_creator(a65b12506e93e6,'Rode').
xc_creation_date(a65b12506e93e6,19980602).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_BlockingTraffic),x_isa(V2,x_RegionalGovernment),x_isa(V3,'x_ShippingLane-International'),x_performedBy(V1,V2),x_objectActedOn(V1,V3)),x_thereExists(V4,x_and(x_isa(V4,x_ModernMilitaryOrganization),x_subOrganizations(V2,V4),x_assistingAgent(V1,V4)))),x_NoteAbout47Rules) :- x_cid(a65b12506e93e7,V1,V2,V3,V4).
xc_microtheory(a65b12506e93e7,x_HPKBCrisisMt).
xc_source_file(a65b12506e93e7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93e7,7482).
xc_kb_names(a65b12506e93e7,["?BLOCK","?GOVT","?WATERWAY","?ORG"]).
xc_mapping_rows(a65b12506e93e7,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e93e7,':BACKWARD').
xc_monotonicity(a65b12506e93e7,':DEFAULT').
xc_creator(a65b12506e93e7,'Rode').
xc_creation_date(a65b12506e93e7,19980602).
x_implies(x_and(x_isa(V1,x_BlockingTraffic),x_objectActedOn(V1,V2),x_isa(V2,'x_ShippingLane-International'),x_performedBy(V1,V3),x_isa(V3,x_RegionalGovernment)),x_thereExists(V4,x_and(x_assistingAgent(V1,V4),x_isa(V4,x_ModernMilitaryOrganization),x_subOrganizations(V3,V4)))) :- x_cid(a65b12506e93e8,V1,V2,V3,V4).
xc_microtheory(a65b12506e93e8,x_HPKBCrisisMt).
xc_source_file(a65b12506e93e8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93e8,7501).
xc_kb_names(a65b12506e93e8,["?BLOCK","?WATERWAY","?GOVT","?ORG"]).
xc_mapping_rows(a65b12506e93e8,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e93e8,':BACKWARD').
xc_monotonicity(a65b12506e93e8,':MONOTONIC').
xc_creator(a65b12506e93e8,'Rode').
xc_creation_date(a65b12506e93e8,19980602).
x_implies(x_and(x_isa(V1,x_BlockingTraffic),x_objectActedOn(V1,V2),x_isa(V2,'x_ShippingLane-International'),x_performedBy(V1,V3),x_isa(V3,x_RegionalGovernment)),x_thereExists(V4,x_and(x_assistingAgent(V1,V4),x_isa(V4,x_ModernMilitaryOrganization),x_subOrganizations(V3,V4)))) :- x_cid(a65b12506e93e9,V1,V2,V3,V4).
xc_microtheory(a65b12506e93e9,x_HPKBCrisisMt).
xc_source_file(a65b12506e93e9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93e9,7519).
xc_kb_names(a65b12506e93e9,["?BLOCK","?WATERWAY","?GOVT","?ORG"]).
xc_mapping_rows(a65b12506e93e9,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e93e9,':BACKWARD').
xc_monotonicity(a65b12506e93e9,':MONOTONIC').
xc_creator(a65b12506e93e9,'Rode').
xc_creation_date(a65b12506e93e9,19980602).
x_implies(x_and(x_isa(V1,x_BlockingTraffic),x_objectActedOn(V1,V2),x_isa(V2,'x_ShippingLane-International'),x_performedBy(V1,V3),x_isa(V3,x_RegionalGovernment)),x_thereExists(V4,x_and(x_assistingAgent(V1,V4),x_isa(V4,x_ModernMilitaryOrganization),x_subOrganizations(V3,V4)))) :- x_cid(a65b12506e93ea,V1,V2,V3,V4).
xc_microtheory(a65b12506e93ea,x_HPKBCrisisMt).
xc_source_file(a65b12506e93ea,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93ea,7537).
xc_kb_names(a65b12506e93ea,["?BLOCK","?WATERWAY","?GOVT","?ORG"]).
xc_mapping_rows(a65b12506e93ea,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e93ea,':BACKWARD').
xc_monotonicity(a65b12506e93ea,':MONOTONIC').
xc_creator(a65b12506e93ea,'Rode').
xc_creation_date(a65b12506e93ea,19980602).
x_arg3Isa('x_SKF-60531811','x_ShippingLane-International') :- x_cid(a65b12506e93eb).
xc_microtheory(a65b12506e93eb,x_HPKBCrisisMt).
xc_source_file(a65b12506e93eb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93eb,7555).
xc_kb_names(a65b12506e93eb,[]).
xc_mapping_rows(a65b12506e93eb,[]).
xc_direction(a65b12506e93eb,':FORWARD').
xc_monotonicity(a65b12506e93eb,':DEFAULT').
x_arg2Isa('x_SKF-60531811',x_RegionalGovernment) :- x_cid(a65b12506e93ec).
xc_microtheory(a65b12506e93ec,x_HPKBCrisisMt).
xc_source_file(a65b12506e93ec,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93ec,7561).
xc_kb_names(a65b12506e93ec,[]).
xc_mapping_rows(a65b12506e93ec,[]).
xc_direction(a65b12506e93ec,':FORWARD').
xc_monotonicity(a65b12506e93ec,':DEFAULT').
x_arg1Isa('x_SKF-60531811',x_BlockingTraffic) :- x_cid(a65b12506e93ed).
xc_microtheory(a65b12506e93ed,x_HPKBCrisisMt).
xc_source_file(a65b12506e93ed,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93ed,7567).
xc_kb_names(a65b12506e93ed,[]).
xc_mapping_rows(a65b12506e93ed,[]).
xc_direction(a65b12506e93ed,':FORWARD').
xc_monotonicity(a65b12506e93ed,':DEFAULT').
x_resultIsa('x_SKF-60531811',x_ModernMilitaryOrganization) :- x_cid(a65b12506e93ee).
xc_microtheory(a65b12506e93ee,x_HPKBCrisisMt).
xc_source_file(a65b12506e93ee,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93ee,7573).
xc_kb_names(a65b12506e93ee,[]).
xc_mapping_rows(a65b12506e93ee,[]).
xc_direction(a65b12506e93ee,':FORWARD').
xc_monotonicity(a65b12506e93ee,':DEFAULT').
x_arity('x_SKF-60531811',3) :- x_cid(a65b12506e93ef).
xc_microtheory(a65b12506e93ef,x_HPKBCrisisMt).
xc_source_file(a65b12506e93ef,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93ef,7579).
xc_kb_names(a65b12506e93ef,[]).
xc_mapping_rows(a65b12506e93ef,[]).
xc_direction(a65b12506e93ef,':FORWARD').
xc_monotonicity(a65b12506e93ef,':MONOTONIC').
x_isa('x_SKF-60531811',x_SkolemFunction) :- x_cid(a65b12506e93f0).
xc_microtheory(a65b12506e93f0,x_HPKBCrisisMt).
xc_source_file(a65b12506e93f0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93f0,7585).
xc_kb_names(a65b12506e93f0,[]).
xc_mapping_rows(a65b12506e93f0,[]).
xc_direction(a65b12506e93f0,':FORWARD').
xc_monotonicity(a65b12506e93f0,':MONOTONIC').
x_implies(x_and(x_isa(V1,x_ReliefOperation),x_performedBy(V1,V2),x_isa(V2,x_RegionalGovernment)),x_thereExists(V3,x_and(x_deliberateActors(V1,V3),x_isa(V3,x_HumanitarianOrganization),x_or(x_affiliatedWith(V2,V3),x_subOrganizations(V2,V3))))) :- x_cid(a65b12506e93f1,V1,V2,V3).
xc_microtheory(a65b12506e93f1,x_HPKBCrisisMt).
xc_source_file(a65b12506e93f1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93f1,7591).
xc_kb_names(a65b12506e93f1,["?ASSIST","?GOVT","?ORG"]).
xc_mapping_rows(a65b12506e93f1,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e93f1,':BACKWARD').
xc_monotonicity(a65b12506e93f1,':MONOTONIC').
xc_creator(a65b12506e93f1,'Rode').
xc_creation_date(a65b12506e93f1,19980601).
x_implies(x_and(x_isa(V1,x_ReliefOperation),x_performedBy(V1,V2),x_isa(V2,x_RegionalGovernment)),x_thereExists(V3,x_and(x_deliberateActors(V1,V3),x_isa(V3,x_HumanitarianOrganization),x_or(x_affiliatedWith(V2,V3),x_subOrganizations(V2,V3))))) :- x_cid(a65b12506e93f2,V1,V2,V3).
xc_microtheory(a65b12506e93f2,x_HPKBCrisisMt).
xc_source_file(a65b12506e93f2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93f2,7609).
xc_kb_names(a65b12506e93f2,["?ASSIST","?GOVT","?ORG"]).
xc_mapping_rows(a65b12506e93f2,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e93f2,':BACKWARD').
xc_monotonicity(a65b12506e93f2,':MONOTONIC').
xc_creator(a65b12506e93f2,'Rode').
xc_creation_date(a65b12506e93f2,19980601).
x_implies(x_and(x_isa(V1,x_ReliefOperation),x_performedBy(V1,V2),x_isa(V2,x_RegionalGovernment)),x_thereExists(V3,x_and(x_deliberateActors(V1,V3),x_isa(V3,x_HumanitarianOrganization),x_or(x_affiliatedWith(V2,V3),x_subOrganizations(V2,V3))))) :- x_cid(a65b12506e93f3,V1,V2,V3).
xc_microtheory(a65b12506e93f3,x_HPKBCrisisMt).
xc_source_file(a65b12506e93f3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93f3,7627).
xc_kb_names(a65b12506e93f3,["?ASSIST","?GOVT","?ORG"]).
xc_mapping_rows(a65b12506e93f3,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e93f3,':BACKWARD').
xc_monotonicity(a65b12506e93f3,':MONOTONIC').
xc_creator(a65b12506e93f3,'Rode').
xc_creation_date(a65b12506e93f3,19980601).
x_arg2Isa('x_SKF-47550018',x_RegionalGovernment) :- x_cid(a65b12506e93f4).
xc_microtheory(a65b12506e93f4,x_HPKBCrisisMt).
xc_source_file(a65b12506e93f4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93f4,7645).
xc_kb_names(a65b12506e93f4,[]).
xc_mapping_rows(a65b12506e93f4,[]).
xc_direction(a65b12506e93f4,':FORWARD').
xc_monotonicity(a65b12506e93f4,':DEFAULT').
x_arg1Isa('x_SKF-47550018',x_ReliefOperation) :- x_cid(a65b12506e93f5).
xc_microtheory(a65b12506e93f5,x_HPKBCrisisMt).
xc_source_file(a65b12506e93f5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93f5,7651).
xc_kb_names(a65b12506e93f5,[]).
xc_mapping_rows(a65b12506e93f5,[]).
xc_direction(a65b12506e93f5,':FORWARD').
xc_monotonicity(a65b12506e93f5,':DEFAULT').
x_resultIsa('x_SKF-47550018',x_HumanitarianOrganization) :- x_cid(a65b12506e93f6).
xc_microtheory(a65b12506e93f6,x_HPKBCrisisMt).
xc_source_file(a65b12506e93f6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93f6,7657).
xc_kb_names(a65b12506e93f6,[]).
xc_mapping_rows(a65b12506e93f6,[]).
xc_direction(a65b12506e93f6,':FORWARD').
xc_monotonicity(a65b12506e93f6,':DEFAULT').
x_arity('x_SKF-47550018',2) :- x_cid(a65b12506e93f7).
xc_microtheory(a65b12506e93f7,x_HPKBCrisisMt).
xc_source_file(a65b12506e93f7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93f7,7663).
xc_kb_names(a65b12506e93f7,[]).
xc_mapping_rows(a65b12506e93f7,[]).
xc_direction(a65b12506e93f7,':FORWARD').
xc_monotonicity(a65b12506e93f7,':MONOTONIC').
x_isa('x_SKF-47550018',x_SkolemFunction) :- x_cid(a65b12506e93f8).
xc_microtheory(a65b12506e93f8,x_HPKBCrisisMt).
xc_source_file(a65b12506e93f8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93f8,7669).
xc_kb_names(a65b12506e93f8,[]).
xc_mapping_rows(a65b12506e93f8,[]).
xc_direction(a65b12506e93f8,':FORWARD').
xc_monotonicity(a65b12506e93f8,':MONOTONIC').
x_sharedNotes(x_implies(x_and(x_isa(V1,x_HelpingAnAgent),x_isa(V2,x_RegionalGovernment),x_genls(V3,x_MilitaryOperation),x_isa(V1,V3),x_performedBy(V1,V2)),x_thereExists(V4,x_and(x_isa(V4,x_MilitaryOrganization),x_subOrganizations(V2,V4),x_deliberateActors(V1,V4)))),x_NoteAbout47Rules) :- x_cid(a65b12506e93f9,V1,V2,V3,V4).
xc_microtheory(a65b12506e93f9,x_HPKBCrisisMt).
xc_source_file(a65b12506e93f9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93f9,7675).
xc_kb_names(a65b12506e93f9,["?ASSIST","?GOVT","?EVTYPE","?ORG"]).
xc_mapping_rows(a65b12506e93f9,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e93f9,':BACKWARD').
xc_monotonicity(a65b12506e93f9,':DEFAULT').
xc_creator(a65b12506e93f9,'Rode').
xc_creation_date(a65b12506e93f9,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_HelpingAnAgent),x_isa(V2,x_RegionalGovernment),x_genls(V3,x_MilitaryOperation),x_isa(V1,V3),x_performedBy(V1,V2)),x_thereExists(V4,x_and(x_isa(V4,x_MilitaryOrganization),x_subOrganizations(V2,V4),x_deliberateActors(V1,V4)))),x_NoteAbout47Rules) :- x_cid(a65b12506e93fa,V1,V2,V3,V4).
xc_microtheory(a65b12506e93fa,x_HPKBCrisisMt).
xc_source_file(a65b12506e93fa,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93fa,7694).
xc_kb_names(a65b12506e93fa,["?ASSIST","?GOVT","?EVTYPE","?ORG"]).
xc_mapping_rows(a65b12506e93fa,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e93fa,':BACKWARD').
xc_monotonicity(a65b12506e93fa,':DEFAULT').
xc_creator(a65b12506e93fa,'Rode').
xc_creation_date(a65b12506e93fa,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_HelpingAnAgent),x_isa(V2,x_RegionalGovernment),x_genls(V3,x_MilitaryOperation),x_isa(V1,V3),x_performedBy(V1,V2)),x_thereExists(V4,x_and(x_isa(V4,x_MilitaryOrganization),x_subOrganizations(V2,V4),x_deliberateActors(V1,V4)))),x_NoteAbout47Rules) :- x_cid(a65b12506e93fb,V1,V2,V3,V4).
xc_microtheory(a65b12506e93fb,x_HPKBCrisisMt).
xc_source_file(a65b12506e93fb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93fb,7713).
xc_kb_names(a65b12506e93fb,["?ASSIST","?GOVT","?EVTYPE","?ORG"]).
xc_mapping_rows(a65b12506e93fb,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e93fb,':BACKWARD').
xc_monotonicity(a65b12506e93fb,':DEFAULT').
xc_creator(a65b12506e93fb,'Rode').
xc_creation_date(a65b12506e93fb,19980601).
x_implies(x_and(x_isa(V1,x_HelpingAnAgent),x_isa(V1,V2),x_genls(V2,x_MilitaryOperation),x_performedBy(V1,V3),x_isa(V3,x_RegionalGovernment)),x_thereExists(V4,x_and(x_deliberateActors(V1,V4),x_isa(V4,x_MilitaryOrganization),x_subOrganizations(V3,V4)))) :- x_cid(a65b12506e93fc,V1,V2,V3,V4).
xc_microtheory(a65b12506e93fc,x_HPKBCrisisMt).
xc_source_file(a65b12506e93fc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93fc,7732).
xc_kb_names(a65b12506e93fc,["?ASSIST","?EVTYPE","?GOVT","?ORG"]).
xc_mapping_rows(a65b12506e93fc,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e93fc,':BACKWARD').
xc_monotonicity(a65b12506e93fc,':MONOTONIC').
xc_creator(a65b12506e93fc,'Rode').
xc_creation_date(a65b12506e93fc,19980601).
x_implies(x_and(x_isa(V1,x_HelpingAnAgent),x_isa(V1,V2),x_genls(V2,x_MilitaryOperation),x_performedBy(V1,V3),x_isa(V3,x_RegionalGovernment)),x_thereExists(V4,x_and(x_deliberateActors(V1,V4),x_isa(V4,x_MilitaryOrganization),x_subOrganizations(V3,V4)))) :- x_cid(a65b12506e93fd,V1,V2,V3,V4).
xc_microtheory(a65b12506e93fd,x_HPKBCrisisMt).
xc_source_file(a65b12506e93fd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93fd,7750).
xc_kb_names(a65b12506e93fd,["?ASSIST","?EVTYPE","?GOVT","?ORG"]).
xc_mapping_rows(a65b12506e93fd,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e93fd,':BACKWARD').
xc_monotonicity(a65b12506e93fd,':MONOTONIC').
xc_creator(a65b12506e93fd,'Rode').
xc_creation_date(a65b12506e93fd,19980601).
x_implies(x_and(x_isa(V1,x_HelpingAnAgent),x_isa(V1,V2),x_genls(V2,x_MilitaryOperation),x_performedBy(V1,V3),x_isa(V3,x_RegionalGovernment)),x_thereExists(V4,x_and(x_deliberateActors(V1,V4),x_isa(V4,x_MilitaryOrganization),x_subOrganizations(V3,V4)))) :- x_cid(a65b12506e93fe,V1,V2,V3,V4).
xc_microtheory(a65b12506e93fe,x_HPKBCrisisMt).
xc_source_file(a65b12506e93fe,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93fe,7768).
xc_kb_names(a65b12506e93fe,["?ASSIST","?EVTYPE","?GOVT","?ORG"]).
xc_mapping_rows(a65b12506e93fe,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e93fe,':BACKWARD').
xc_monotonicity(a65b12506e93fe,':MONOTONIC').
xc_creator(a65b12506e93fe,'Rode').
xc_creation_date(a65b12506e93fe,19980601).
x_arg3Isa('x_SKF-6397777',x_RegionalGovernment) :- x_cid(a65b12506e93ff).
xc_microtheory(a65b12506e93ff,x_HPKBCrisisMt).
xc_source_file(a65b12506e93ff,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e93ff,7786).
xc_kb_names(a65b12506e93ff,[]).
xc_mapping_rows(a65b12506e93ff,[]).
xc_direction(a65b12506e93ff,':FORWARD').
xc_monotonicity(a65b12506e93ff,':DEFAULT').
x_arg2Isa('x_SKF-6397777',x_Collection) :- x_cid(a65b12506e9400).
xc_microtheory(a65b12506e9400,x_HPKBCrisisMt).
xc_source_file(a65b12506e9400,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9400,7792).
xc_kb_names(a65b12506e9400,[]).
xc_mapping_rows(a65b12506e9400,[]).
xc_direction(a65b12506e9400,':FORWARD').
xc_monotonicity(a65b12506e9400,':DEFAULT').
x_arg1Isa('x_SKF-6397777',x_HelpingAnAgent) :- x_cid(a65b12506e9401).
xc_microtheory(a65b12506e9401,x_HPKBCrisisMt).
xc_source_file(a65b12506e9401,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9401,7798).
xc_kb_names(a65b12506e9401,[]).
xc_mapping_rows(a65b12506e9401,[]).
xc_direction(a65b12506e9401,':FORWARD').
xc_monotonicity(a65b12506e9401,':DEFAULT').
x_resultIsa('x_SKF-6397777',x_MilitaryOrganization) :- x_cid(a65b12506e9402).
xc_microtheory(a65b12506e9402,x_HPKBCrisisMt).
xc_source_file(a65b12506e9402,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9402,7804).
xc_kb_names(a65b12506e9402,[]).
xc_mapping_rows(a65b12506e9402,[]).
xc_direction(a65b12506e9402,':FORWARD').
xc_monotonicity(a65b12506e9402,':DEFAULT').
x_arity('x_SKF-6397777',3) :- x_cid(a65b12506e9403).
xc_microtheory(a65b12506e9403,x_HPKBCrisisMt).
xc_source_file(a65b12506e9403,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9403,7810).
xc_kb_names(a65b12506e9403,[]).
xc_mapping_rows(a65b12506e9403,[]).
xc_direction(a65b12506e9403,':FORWARD').
xc_monotonicity(a65b12506e9403,':MONOTONIC').
x_isa('x_SKF-6397777',x_SkolemFunction) :- x_cid(a65b12506e9404).
xc_microtheory(a65b12506e9404,x_HPKBCrisisMt).
xc_source_file(a65b12506e9404,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9404,7816).
xc_kb_names(a65b12506e9404,[]).
xc_mapping_rows(a65b12506e9404,[]).
xc_direction(a65b12506e9404,':FORWARD').
xc_monotonicity(a65b12506e9404,':MONOTONIC').
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9405,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9405,x_HPKBCrisisMt).
xc_source_file(a65b12506e9405,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9405,7822).
xc_kb_names(a65b12506e9405,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9405,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9405,':BACKWARD').
xc_monotonicity(a65b12506e9405,':DEFAULT').
xc_creator(a65b12506e9405,'Rode').
xc_creation_date(a65b12506e9405,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9406,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9406,x_HPKBCrisisMt).
xc_source_file(a65b12506e9406,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9406,7975).
xc_kb_names(a65b12506e9406,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9406,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9406,':BACKWARD').
xc_monotonicity(a65b12506e9406,':DEFAULT').
xc_creator(a65b12506e9406,'Rode').
xc_creation_date(a65b12506e9406,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9407,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9407,x_HPKBCrisisMt).
xc_source_file(a65b12506e9407,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9407,8128).
xc_kb_names(a65b12506e9407,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9407,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9407,':BACKWARD').
xc_monotonicity(a65b12506e9407,':DEFAULT').
xc_creator(a65b12506e9407,'Rode').
xc_creation_date(a65b12506e9407,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9408,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9408,x_HPKBCrisisMt).
xc_source_file(a65b12506e9408,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9408,8281).
xc_kb_names(a65b12506e9408,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9408,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9408,':BACKWARD').
xc_monotonicity(a65b12506e9408,':DEFAULT').
xc_creator(a65b12506e9408,'Rode').
xc_creation_date(a65b12506e9408,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9409,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9409,x_HPKBCrisisMt).
xc_source_file(a65b12506e9409,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9409,8434).
xc_kb_names(a65b12506e9409,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9409,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9409,':BACKWARD').
xc_monotonicity(a65b12506e9409,':DEFAULT').
xc_creator(a65b12506e9409,'Rode').
xc_creation_date(a65b12506e9409,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e940a,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e940a,x_HPKBCrisisMt).
xc_source_file(a65b12506e940a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e940a,8587).
xc_kb_names(a65b12506e940a,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e940a,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e940a,':BACKWARD').
xc_monotonicity(a65b12506e940a,':DEFAULT').
xc_creator(a65b12506e940a,'Rode').
xc_creation_date(a65b12506e940a,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e940b,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e940b,x_HPKBCrisisMt).
xc_source_file(a65b12506e940b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e940b,8740).
xc_kb_names(a65b12506e940b,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e940b,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e940b,':BACKWARD').
xc_monotonicity(a65b12506e940b,':DEFAULT').
xc_creator(a65b12506e940b,'Rode').
xc_creation_date(a65b12506e940b,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e940c,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e940c,x_HPKBCrisisMt).
xc_source_file(a65b12506e940c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e940c,8893).
xc_kb_names(a65b12506e940c,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e940c,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e940c,':BACKWARD').
xc_monotonicity(a65b12506e940c,':DEFAULT').
xc_creator(a65b12506e940c,'Rode').
xc_creation_date(a65b12506e940c,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e940d,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e940d,x_HPKBCrisisMt).
xc_source_file(a65b12506e940d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e940d,9046).
xc_kb_names(a65b12506e940d,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e940d,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e940d,':BACKWARD').
xc_monotonicity(a65b12506e940d,':DEFAULT').
xc_creator(a65b12506e940d,'Rode').
xc_creation_date(a65b12506e940d,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e940e,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e940e,x_HPKBCrisisMt).
xc_source_file(a65b12506e940e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e940e,9199).
xc_kb_names(a65b12506e940e,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e940e,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e940e,':BACKWARD').
xc_monotonicity(a65b12506e940e,':DEFAULT').
xc_creator(a65b12506e940e,'Rode').
xc_creation_date(a65b12506e940e,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e940f,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e940f,x_HPKBCrisisMt).
xc_source_file(a65b12506e940f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e940f,9352).
xc_kb_names(a65b12506e940f,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e940f,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e940f,':BACKWARD').
xc_monotonicity(a65b12506e940f,':DEFAULT').
xc_creator(a65b12506e940f,'Rode').
xc_creation_date(a65b12506e940f,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9410,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9410,x_HPKBCrisisMt).
xc_source_file(a65b12506e9410,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9410,9505).
xc_kb_names(a65b12506e9410,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9410,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9410,':BACKWARD').
xc_monotonicity(a65b12506e9410,':DEFAULT').
xc_creator(a65b12506e9410,'Rode').
xc_creation_date(a65b12506e9410,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9411,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9411,x_HPKBCrisisMt).
xc_source_file(a65b12506e9411,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9411,9658).
xc_kb_names(a65b12506e9411,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9411,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9411,':BACKWARD').
xc_monotonicity(a65b12506e9411,':DEFAULT').
xc_creator(a65b12506e9411,'Rode').
xc_creation_date(a65b12506e9411,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9412,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9412,x_HPKBCrisisMt).
xc_source_file(a65b12506e9412,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9412,9811).
xc_kb_names(a65b12506e9412,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9412,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9412,':BACKWARD').
xc_monotonicity(a65b12506e9412,':DEFAULT').
xc_creator(a65b12506e9412,'Rode').
xc_creation_date(a65b12506e9412,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9413,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9413,x_HPKBCrisisMt).
xc_source_file(a65b12506e9413,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9413,9964).
xc_kb_names(a65b12506e9413,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9413,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9413,':BACKWARD').
xc_monotonicity(a65b12506e9413,':DEFAULT').
xc_creator(a65b12506e9413,'Rode').
xc_creation_date(a65b12506e9413,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9414,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9414,x_HPKBCrisisMt).
xc_source_file(a65b12506e9414,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9414,10117).
xc_kb_names(a65b12506e9414,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9414,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9414,':BACKWARD').
xc_monotonicity(a65b12506e9414,':DEFAULT').
xc_creator(a65b12506e9414,'Rode').
xc_creation_date(a65b12506e9414,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9415,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9415,x_HPKBCrisisMt).
xc_source_file(a65b12506e9415,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9415,10270).
xc_kb_names(a65b12506e9415,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9415,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9415,':BACKWARD').
xc_monotonicity(a65b12506e9415,':DEFAULT').
xc_creator(a65b12506e9415,'Rode').
xc_creation_date(a65b12506e9415,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9416,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9416,x_HPKBCrisisMt).
xc_source_file(a65b12506e9416,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9416,10423).
xc_kb_names(a65b12506e9416,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9416,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9416,':BACKWARD').
xc_monotonicity(a65b12506e9416,':DEFAULT').
xc_creator(a65b12506e9416,'Rode').
xc_creation_date(a65b12506e9416,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9417,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9417,x_HPKBCrisisMt).
xc_source_file(a65b12506e9417,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9417,10576).
xc_kb_names(a65b12506e9417,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9417,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9417,':BACKWARD').
xc_monotonicity(a65b12506e9417,':DEFAULT').
xc_creator(a65b12506e9417,'Rode').
xc_creation_date(a65b12506e9417,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9418,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9418,x_HPKBCrisisMt).
xc_source_file(a65b12506e9418,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9418,10729).
xc_kb_names(a65b12506e9418,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9418,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9418,':BACKWARD').
xc_monotonicity(a65b12506e9418,':DEFAULT').
xc_creator(a65b12506e9418,'Rode').
xc_creation_date(a65b12506e9418,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9419,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9419,x_HPKBCrisisMt).
xc_source_file(a65b12506e9419,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9419,10882).
xc_kb_names(a65b12506e9419,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9419,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9419,':BACKWARD').
xc_monotonicity(a65b12506e9419,':DEFAULT').
xc_creator(a65b12506e9419,'Rode').
xc_creation_date(a65b12506e9419,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e941a,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e941a,x_HPKBCrisisMt).
xc_source_file(a65b12506e941a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e941a,11035).
xc_kb_names(a65b12506e941a,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e941a,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e941a,':BACKWARD').
xc_monotonicity(a65b12506e941a,':DEFAULT').
xc_creator(a65b12506e941a,'Rode').
xc_creation_date(a65b12506e941a,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e941b,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e941b,x_HPKBCrisisMt).
xc_source_file(a65b12506e941b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e941b,11188).
xc_kb_names(a65b12506e941b,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e941b,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e941b,':BACKWARD').
xc_monotonicity(a65b12506e941b,':DEFAULT').
xc_creator(a65b12506e941b,'Rode').
xc_creation_date(a65b12506e941b,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e941c,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e941c,x_HPKBCrisisMt).
xc_source_file(a65b12506e941c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e941c,11341).
xc_kb_names(a65b12506e941c,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e941c,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e941c,':BACKWARD').
xc_monotonicity(a65b12506e941c,':DEFAULT').
xc_creator(a65b12506e941c,'Rode').
xc_creation_date(a65b12506e941c,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e941d,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e941d,x_HPKBCrisisMt).
xc_source_file(a65b12506e941d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e941d,11494).
xc_kb_names(a65b12506e941d,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e941d,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e941d,':BACKWARD').
xc_monotonicity(a65b12506e941d,':DEFAULT').
xc_creator(a65b12506e941d,'Rode').
xc_creation_date(a65b12506e941d,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e941e,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e941e,x_HPKBCrisisMt).
xc_source_file(a65b12506e941e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e941e,11647).
xc_kb_names(a65b12506e941e,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e941e,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e941e,':BACKWARD').
xc_monotonicity(a65b12506e941e,':DEFAULT').
xc_creator(a65b12506e941e,'Rode').
xc_creation_date(a65b12506e941e,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e941f,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e941f,x_HPKBCrisisMt).
xc_source_file(a65b12506e941f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e941f,11800).
xc_kb_names(a65b12506e941f,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e941f,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e941f,':BACKWARD').
xc_monotonicity(a65b12506e941f,':DEFAULT').
xc_creator(a65b12506e941f,'Rode').
xc_creation_date(a65b12506e941f,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9420,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9420,x_HPKBCrisisMt).
xc_source_file(a65b12506e9420,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9420,11953).
xc_kb_names(a65b12506e9420,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9420,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9420,':BACKWARD').
xc_monotonicity(a65b12506e9420,':DEFAULT').
xc_creator(a65b12506e9420,'Rode').
xc_creation_date(a65b12506e9420,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9421,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9421,x_HPKBCrisisMt).
xc_source_file(a65b12506e9421,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9421,12106).
xc_kb_names(a65b12506e9421,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9421,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9421,':BACKWARD').
xc_monotonicity(a65b12506e9421,':DEFAULT').
xc_creator(a65b12506e9421,'Rode').
xc_creation_date(a65b12506e9421,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9422,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9422,x_HPKBCrisisMt).
xc_source_file(a65b12506e9422,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9422,12259).
xc_kb_names(a65b12506e9422,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9422,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9422,':BACKWARD').
xc_monotonicity(a65b12506e9422,':DEFAULT').
xc_creator(a65b12506e9422,'Rode').
xc_creation_date(a65b12506e9422,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9423,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9423,x_HPKBCrisisMt).
xc_source_file(a65b12506e9423,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9423,12412).
xc_kb_names(a65b12506e9423,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9423,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9423,':BACKWARD').
xc_monotonicity(a65b12506e9423,':DEFAULT').
xc_creator(a65b12506e9423,'Rode').
xc_creation_date(a65b12506e9423,19980601).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_PoliticalEvent),x_isa(V1,x_Murder),x_isa(V2,x_RegionalGovernment),x_isa(V3,x_IndependentCountry),x_directingAgent(V1,V2),x_eventOccursAt(V1,V3),x_different(V2,x_GovernmentFn(V3))),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_performedBy(V1,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V4),x_allies(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_isa(V5,x_TerroristGroup),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_performedBy(V1,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_different(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V5),x_allies(V2,V6)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_performedBy(V1,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_performedBy(V1,V5),x_performedBy(V1,V7),x_subOrganizations(V2,V4)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_different(V2,V6)),x_or(x_performedBy(V1,V5),x_subOrganizations(V2,V4),x_allies(V2,V6)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V3)),x_or(x_performedBy(V1,V7),x_subOrganizations(V2,V4),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_subOrganizations(V6,V7),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_different(V2,V6),x_affiliatedWith(V2,V5)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_presentInRegion(V5,V3)),x_or(x_subOrganizations(V2,V4),x_allies(V2,V6),x_affiliatedWith(V2,V5)))))))),x_NoteAbout47Rules) :- x_cid(a65b12506e9424,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9424,x_HPKBCrisisMt).
xc_source_file(a65b12506e9424,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9424,12565).
xc_kb_names(a65b12506e9424,["?ASSASSINATION","?GOVT","?REGION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9424,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9424,':BACKWARD').
xc_monotonicity(a65b12506e9424,':DEFAULT').
xc_creator(a65b12506e9424,'Rode').
xc_creation_date(a65b12506e9424,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9425,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9425,x_HPKBCrisisMt).
xc_source_file(a65b12506e9425,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9425,12718).
xc_kb_names(a65b12506e9425,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9425,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9425,':BACKWARD').
xc_monotonicity(a65b12506e9425,':MONOTONIC').
xc_creator(a65b12506e9425,'Rode').
xc_creation_date(a65b12506e9425,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9426,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9426,x_HPKBCrisisMt).
xc_source_file(a65b12506e9426,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9426,12870).
xc_kb_names(a65b12506e9426,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9426,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9426,':BACKWARD').
xc_monotonicity(a65b12506e9426,':MONOTONIC').
xc_creator(a65b12506e9426,'Rode').
xc_creation_date(a65b12506e9426,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9427,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9427,x_HPKBCrisisMt).
xc_source_file(a65b12506e9427,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9427,13022).
xc_kb_names(a65b12506e9427,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9427,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9427,':BACKWARD').
xc_monotonicity(a65b12506e9427,':MONOTONIC').
xc_creator(a65b12506e9427,'Rode').
xc_creation_date(a65b12506e9427,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9428,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9428,x_HPKBCrisisMt).
xc_source_file(a65b12506e9428,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9428,13174).
xc_kb_names(a65b12506e9428,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9428,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9428,':BACKWARD').
xc_monotonicity(a65b12506e9428,':MONOTONIC').
xc_creator(a65b12506e9428,'Rode').
xc_creation_date(a65b12506e9428,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9429,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9429,x_HPKBCrisisMt).
xc_source_file(a65b12506e9429,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9429,13326).
xc_kb_names(a65b12506e9429,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9429,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9429,':BACKWARD').
xc_monotonicity(a65b12506e9429,':MONOTONIC').
xc_creator(a65b12506e9429,'Rode').
xc_creation_date(a65b12506e9429,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e942a,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e942a,x_HPKBCrisisMt).
xc_source_file(a65b12506e942a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e942a,13478).
xc_kb_names(a65b12506e942a,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e942a,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e942a,':BACKWARD').
xc_monotonicity(a65b12506e942a,':MONOTONIC').
xc_creator(a65b12506e942a,'Rode').
xc_creation_date(a65b12506e942a,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e942b,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e942b,x_HPKBCrisisMt).
xc_source_file(a65b12506e942b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e942b,13630).
xc_kb_names(a65b12506e942b,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e942b,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e942b,':BACKWARD').
xc_monotonicity(a65b12506e942b,':MONOTONIC').
xc_creator(a65b12506e942b,'Rode').
xc_creation_date(a65b12506e942b,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e942c,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e942c,x_HPKBCrisisMt).
xc_source_file(a65b12506e942c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e942c,13782).
xc_kb_names(a65b12506e942c,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e942c,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e942c,':BACKWARD').
xc_monotonicity(a65b12506e942c,':MONOTONIC').
xc_creator(a65b12506e942c,'Rode').
xc_creation_date(a65b12506e942c,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e942d,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e942d,x_HPKBCrisisMt).
xc_source_file(a65b12506e942d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e942d,13934).
xc_kb_names(a65b12506e942d,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e942d,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e942d,':BACKWARD').
xc_monotonicity(a65b12506e942d,':MONOTONIC').
xc_creator(a65b12506e942d,'Rode').
xc_creation_date(a65b12506e942d,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e942e,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e942e,x_HPKBCrisisMt).
xc_source_file(a65b12506e942e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e942e,14086).
xc_kb_names(a65b12506e942e,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e942e,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e942e,':BACKWARD').
xc_monotonicity(a65b12506e942e,':MONOTONIC').
xc_creator(a65b12506e942e,'Rode').
xc_creation_date(a65b12506e942e,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e942f,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e942f,x_HPKBCrisisMt).
xc_source_file(a65b12506e942f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e942f,14238).
xc_kb_names(a65b12506e942f,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e942f,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e942f,':BACKWARD').
xc_monotonicity(a65b12506e942f,':MONOTONIC').
xc_creator(a65b12506e942f,'Rode').
xc_creation_date(a65b12506e942f,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9430,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9430,x_HPKBCrisisMt).
xc_source_file(a65b12506e9430,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9430,14390).
xc_kb_names(a65b12506e9430,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9430,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9430,':BACKWARD').
xc_monotonicity(a65b12506e9430,':MONOTONIC').
xc_creator(a65b12506e9430,'Rode').
xc_creation_date(a65b12506e9430,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9431,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9431,x_HPKBCrisisMt).
xc_source_file(a65b12506e9431,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9431,14542).
xc_kb_names(a65b12506e9431,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9431,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9431,':BACKWARD').
xc_monotonicity(a65b12506e9431,':MONOTONIC').
xc_creator(a65b12506e9431,'Rode').
xc_creation_date(a65b12506e9431,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9432,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9432,x_HPKBCrisisMt).
xc_source_file(a65b12506e9432,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9432,14694).
xc_kb_names(a65b12506e9432,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9432,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9432,':BACKWARD').
xc_monotonicity(a65b12506e9432,':MONOTONIC').
xc_creator(a65b12506e9432,'Rode').
xc_creation_date(a65b12506e9432,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9433,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9433,x_HPKBCrisisMt).
xc_source_file(a65b12506e9433,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9433,14846).
xc_kb_names(a65b12506e9433,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9433,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9433,':BACKWARD').
xc_monotonicity(a65b12506e9433,':MONOTONIC').
xc_creator(a65b12506e9433,'Rode').
xc_creation_date(a65b12506e9433,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9434,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9434,x_HPKBCrisisMt).
xc_source_file(a65b12506e9434,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9434,14998).
xc_kb_names(a65b12506e9434,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9434,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9434,':BACKWARD').
xc_monotonicity(a65b12506e9434,':MONOTONIC').
xc_creator(a65b12506e9434,'Rode').
xc_creation_date(a65b12506e9434,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9435,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9435,x_HPKBCrisisMt).
xc_source_file(a65b12506e9435,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9435,15150).
xc_kb_names(a65b12506e9435,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9435,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9435,':BACKWARD').
xc_monotonicity(a65b12506e9435,':MONOTONIC').
xc_creator(a65b12506e9435,'Rode').
xc_creation_date(a65b12506e9435,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9436,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9436,x_HPKBCrisisMt).
xc_source_file(a65b12506e9436,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9436,15302).
xc_kb_names(a65b12506e9436,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9436,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9436,':BACKWARD').
xc_monotonicity(a65b12506e9436,':MONOTONIC').
xc_creator(a65b12506e9436,'Rode').
xc_creation_date(a65b12506e9436,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9437,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9437,x_HPKBCrisisMt).
xc_source_file(a65b12506e9437,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9437,15454).
xc_kb_names(a65b12506e9437,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9437,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9437,':BACKWARD').
xc_monotonicity(a65b12506e9437,':MONOTONIC').
xc_creator(a65b12506e9437,'Rode').
xc_creation_date(a65b12506e9437,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9438,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9438,x_HPKBCrisisMt).
xc_source_file(a65b12506e9438,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9438,15606).
xc_kb_names(a65b12506e9438,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9438,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9438,':BACKWARD').
xc_monotonicity(a65b12506e9438,':MONOTONIC').
xc_creator(a65b12506e9438,'Rode').
xc_creation_date(a65b12506e9438,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9439,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9439,x_HPKBCrisisMt).
xc_source_file(a65b12506e9439,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9439,15758).
xc_kb_names(a65b12506e9439,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9439,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9439,':BACKWARD').
xc_monotonicity(a65b12506e9439,':MONOTONIC').
xc_creator(a65b12506e9439,'Rode').
xc_creation_date(a65b12506e9439,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e943a,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e943a,x_HPKBCrisisMt).
xc_source_file(a65b12506e943a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e943a,15910).
xc_kb_names(a65b12506e943a,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e943a,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e943a,':BACKWARD').
xc_monotonicity(a65b12506e943a,':MONOTONIC').
xc_creator(a65b12506e943a,'Rode').
xc_creation_date(a65b12506e943a,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e943b,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e943b,x_HPKBCrisisMt).
xc_source_file(a65b12506e943b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e943b,16062).
xc_kb_names(a65b12506e943b,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e943b,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e943b,':BACKWARD').
xc_monotonicity(a65b12506e943b,':MONOTONIC').
xc_creator(a65b12506e943b,'Rode').
xc_creation_date(a65b12506e943b,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e943c,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e943c,x_HPKBCrisisMt).
xc_source_file(a65b12506e943c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e943c,16214).
xc_kb_names(a65b12506e943c,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e943c,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e943c,':BACKWARD').
xc_monotonicity(a65b12506e943c,':MONOTONIC').
xc_creator(a65b12506e943c,'Rode').
xc_creation_date(a65b12506e943c,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e943d,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e943d,x_HPKBCrisisMt).
xc_source_file(a65b12506e943d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e943d,16366).
xc_kb_names(a65b12506e943d,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e943d,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e943d,':BACKWARD').
xc_monotonicity(a65b12506e943d,':MONOTONIC').
xc_creator(a65b12506e943d,'Rode').
xc_creation_date(a65b12506e943d,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e943e,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e943e,x_HPKBCrisisMt).
xc_source_file(a65b12506e943e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e943e,16518).
xc_kb_names(a65b12506e943e,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e943e,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e943e,':BACKWARD').
xc_monotonicity(a65b12506e943e,':MONOTONIC').
xc_creator(a65b12506e943e,'Rode').
xc_creation_date(a65b12506e943e,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e943f,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e943f,x_HPKBCrisisMt).
xc_source_file(a65b12506e943f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e943f,16670).
xc_kb_names(a65b12506e943f,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e943f,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e943f,':BACKWARD').
xc_monotonicity(a65b12506e943f,':MONOTONIC').
xc_creator(a65b12506e943f,'Rode').
xc_creation_date(a65b12506e943f,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9440,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9440,x_HPKBCrisisMt).
xc_source_file(a65b12506e9440,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9440,16822).
xc_kb_names(a65b12506e9440,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9440,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9440,':BACKWARD').
xc_monotonicity(a65b12506e9440,':MONOTONIC').
xc_creator(a65b12506e9440,'Rode').
xc_creation_date(a65b12506e9440,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9441,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9441,x_HPKBCrisisMt).
xc_source_file(a65b12506e9441,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9441,16974).
xc_kb_names(a65b12506e9441,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9441,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9441,':BACKWARD').
xc_monotonicity(a65b12506e9441,':MONOTONIC').
xc_creator(a65b12506e9441,'Rode').
xc_creation_date(a65b12506e9441,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9442,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9442,x_HPKBCrisisMt).
xc_source_file(a65b12506e9442,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9442,17126).
xc_kb_names(a65b12506e9442,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9442,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9442,':BACKWARD').
xc_monotonicity(a65b12506e9442,':MONOTONIC').
xc_creator(a65b12506e9442,'Rode').
xc_creation_date(a65b12506e9442,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9443,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9443,x_HPKBCrisisMt).
xc_source_file(a65b12506e9443,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9443,17278).
xc_kb_names(a65b12506e9443,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9443,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9443,':BACKWARD').
xc_monotonicity(a65b12506e9443,':MONOTONIC').
xc_creator(a65b12506e9443,'Rode').
xc_creation_date(a65b12506e9443,19980601).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V2,x_GovernmentFn(V1)),x_eventOccursAt(V3,V1),x_isa(V2,x_RegionalGovernment),x_directingAgent(V3,V2),x_isa(V3,x_PoliticalEvent),x_isa(V3,x_Murder)),x_thereExists(V4,x_thereExists(V5,x_thereExists(V6,x_thereExists(V7,x_and(x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_performedBy(V3,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_affiliatedWith(V2,V5),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_allies(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_different(V2,V6),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_isa(V5,x_TerroristGroup),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_presentInRegion(V5,V1),x_performedBy(V3,V4),x_performedBy(V3,V7)),x_or(x_subOrganizations(V6,V7),x_performedBy(V3,V4),x_performedBy(V3,V5)),x_or(x_subOrganizations(V2,V4),x_performedBy(V3,V5),x_performedBy(V3,V7)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_allies(V2,V6)),x_or(x_performedBy(V3,V4),x_affiliatedWith(V2,V5),x_different(V2,V6)),x_or(x_performedBy(V3,V4),x_allies(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V4),x_different(V2,V6),x_presentInRegion(V5,V1)),x_or(x_performedBy(V3,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4)),x_or(x_performedBy(V3,V7),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_affiliatedWith(V2,V5),x_allies(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_different(V2,V6),x_subOrganizations(V2,V4)),x_or(x_affiliatedWith(V2,V5),x_subOrganizations(V2,V4),x_subOrganizations(V6,V7)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_allies(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup)),x_or(x_different(V2,V6),x_subOrganizations(V2,V4),x_presentInRegion(V5,V1)),x_or(x_subOrganizations(V2,V4),x_isa(V5,x_TerroristGroup),x_subOrganizations(V6,V7)),x_or(x_subOrganizations(V2,V4),x_presentInRegion(V5,V1),x_subOrganizations(V6,V7)))))))) :- x_cid(a65b12506e9444,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9444,x_HPKBCrisisMt).
xc_source_file(a65b12506e9444,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9444,17430).
xc_kb_names(a65b12506e9444,["?REGION","?GOVT","?ASSASSINATION","?AGENCY","?TERGROUP","?OTRGOVT","?THIRDPARTY"]).
xc_mapping_rows(a65b12506e9444,['implication-implies','exists-thereexists','exists-thereexists','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e9444,':BACKWARD').
xc_monotonicity(a65b12506e9444,':MONOTONIC').
xc_creator(a65b12506e9444,'Rode').
xc_creation_date(a65b12506e9444,19980601).
x_arg3Isa('x_SKF-24147201',x_IndependentCountry) :- x_cid(a65b12506e9445).
xc_microtheory(a65b12506e9445,x_HPKBCrisisMt).
xc_source_file(a65b12506e9445,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9445,17582).
xc_kb_names(a65b12506e9445,[]).
xc_mapping_rows(a65b12506e9445,[]).
xc_direction(a65b12506e9445,':FORWARD').
xc_monotonicity(a65b12506e9445,':DEFAULT').
x_arg2Isa('x_SKF-24147201',x_RegionalGovernment) :- x_cid(a65b12506e9446).
xc_microtheory(a65b12506e9446,x_HPKBCrisisMt).
xc_source_file(a65b12506e9446,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9446,17588).
xc_kb_names(a65b12506e9446,[]).
xc_mapping_rows(a65b12506e9446,[]).
xc_direction(a65b12506e9446,':FORWARD').
xc_monotonicity(a65b12506e9446,':DEFAULT').
x_arg1Isa('x_SKF-24147201',x_PoliticalEvent) :- x_cid(a65b12506e9447).
xc_microtheory(a65b12506e9447,x_HPKBCrisisMt).
xc_source_file(a65b12506e9447,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9447,17594).
xc_kb_names(a65b12506e9447,[]).
xc_mapping_rows(a65b12506e9447,[]).
xc_direction(a65b12506e9447,':FORWARD').
xc_monotonicity(a65b12506e9447,':DEFAULT').
x_arg1Isa('x_SKF-24147201',x_Murder) :- x_cid(a65b12506e9448).
xc_microtheory(a65b12506e9448,x_HPKBCrisisMt).
xc_source_file(a65b12506e9448,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9448,17600).
xc_kb_names(a65b12506e9448,[]).
xc_mapping_rows(a65b12506e9448,[]).
xc_direction(a65b12506e9448,':FORWARD').
xc_monotonicity(a65b12506e9448,':DEFAULT').
x_resultIsa('x_SKF-24147201',x_Organization) :- x_cid(a65b12506e9449).
xc_microtheory(a65b12506e9449,x_HPKBCrisisMt).
xc_source_file(a65b12506e9449,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9449,17606).
xc_kb_names(a65b12506e9449,[]).
xc_mapping_rows(a65b12506e9449,[]).
xc_direction(a65b12506e9449,':FORWARD').
xc_monotonicity(a65b12506e9449,':DEFAULT').
x_arity('x_SKF-24147201',3) :- x_cid(a65b12506e944a).
xc_microtheory(a65b12506e944a,x_HPKBCrisisMt).
xc_source_file(a65b12506e944a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e944a,17612).
xc_kb_names(a65b12506e944a,[]).
xc_mapping_rows(a65b12506e944a,[]).
xc_direction(a65b12506e944a,':FORWARD').
xc_monotonicity(a65b12506e944a,':MONOTONIC').
x_isa('x_SKF-24147201',x_SkolemFunction) :- x_cid(a65b12506e944b).
xc_microtheory(a65b12506e944b,x_HPKBCrisisMt).
xc_source_file(a65b12506e944b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e944b,17618).
xc_kb_names(a65b12506e944b,[]).
xc_mapping_rows(a65b12506e944b,[]).
xc_direction(a65b12506e944b,':FORWARD').
xc_monotonicity(a65b12506e944b,':MONOTONIC').
x_arg3Isa('x_SKF-33893427',x_IndependentCountry) :- x_cid(a65b12506e944c).
xc_microtheory(a65b12506e944c,x_HPKBCrisisMt).
xc_source_file(a65b12506e944c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e944c,17624).
xc_kb_names(a65b12506e944c,[]).
xc_mapping_rows(a65b12506e944c,[]).
xc_direction(a65b12506e944c,':FORWARD').
xc_monotonicity(a65b12506e944c,':DEFAULT').
x_arg2Isa('x_SKF-33893427',x_RegionalGovernment) :- x_cid(a65b12506e944d).
xc_microtheory(a65b12506e944d,x_HPKBCrisisMt).
xc_source_file(a65b12506e944d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e944d,17630).
xc_kb_names(a65b12506e944d,[]).
xc_mapping_rows(a65b12506e944d,[]).
xc_direction(a65b12506e944d,':FORWARD').
xc_monotonicity(a65b12506e944d,':DEFAULT').
x_arg1Isa('x_SKF-33893427',x_PoliticalEvent) :- x_cid(a65b12506e944e).
xc_microtheory(a65b12506e944e,x_HPKBCrisisMt).
xc_source_file(a65b12506e944e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e944e,17636).
xc_kb_names(a65b12506e944e,[]).
xc_mapping_rows(a65b12506e944e,[]).
xc_direction(a65b12506e944e,':FORWARD').
xc_monotonicity(a65b12506e944e,':DEFAULT').
x_arg1Isa('x_SKF-33893427',x_Murder) :- x_cid(a65b12506e944f).
xc_microtheory(a65b12506e944f,x_HPKBCrisisMt).
xc_source_file(a65b12506e944f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e944f,17642).
xc_kb_names(a65b12506e944f,[]).
xc_mapping_rows(a65b12506e944f,[]).
xc_direction(a65b12506e944f,':FORWARD').
xc_monotonicity(a65b12506e944f,':DEFAULT').
x_resultIsa('x_SKF-33893427',x_TerroristGroup) :- x_cid(a65b12506e9450).
xc_microtheory(a65b12506e9450,x_HPKBCrisisMt).
xc_source_file(a65b12506e9450,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9450,17648).
xc_kb_names(a65b12506e9450,[]).
xc_mapping_rows(a65b12506e9450,[]).
xc_direction(a65b12506e9450,':FORWARD').
xc_monotonicity(a65b12506e9450,':DEFAULT').
x_arity('x_SKF-33893427',3) :- x_cid(a65b12506e9451).
xc_microtheory(a65b12506e9451,x_HPKBCrisisMt).
xc_source_file(a65b12506e9451,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9451,17654).
xc_kb_names(a65b12506e9451,[]).
xc_mapping_rows(a65b12506e9451,[]).
xc_direction(a65b12506e9451,':FORWARD').
xc_monotonicity(a65b12506e9451,':MONOTONIC').
x_isa('x_SKF-33893427',x_SkolemFunction) :- x_cid(a65b12506e9452).
xc_microtheory(a65b12506e9452,x_HPKBCrisisMt).
xc_source_file(a65b12506e9452,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9452,17660).
xc_kb_names(a65b12506e9452,[]).
xc_mapping_rows(a65b12506e9452,[]).
xc_direction(a65b12506e9452,':FORWARD').
xc_monotonicity(a65b12506e9452,':MONOTONIC').
x_arg3Isa('x_SKF-61586386',x_IndependentCountry) :- x_cid(a65b12506e9453).
xc_microtheory(a65b12506e9453,x_HPKBCrisisMt).
xc_source_file(a65b12506e9453,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9453,17666).
xc_kb_names(a65b12506e9453,[]).
xc_mapping_rows(a65b12506e9453,[]).
xc_direction(a65b12506e9453,':FORWARD').
xc_monotonicity(a65b12506e9453,':DEFAULT').
x_arg2Isa('x_SKF-61586386',x_RegionalGovernment) :- x_cid(a65b12506e9454).
xc_microtheory(a65b12506e9454,x_HPKBCrisisMt).
xc_source_file(a65b12506e9454,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9454,17672).
xc_kb_names(a65b12506e9454,[]).
xc_mapping_rows(a65b12506e9454,[]).
xc_direction(a65b12506e9454,':FORWARD').
xc_monotonicity(a65b12506e9454,':DEFAULT').
x_arg1Isa('x_SKF-61586386',x_PoliticalEvent) :- x_cid(a65b12506e9455).
xc_microtheory(a65b12506e9455,x_HPKBCrisisMt).
xc_source_file(a65b12506e9455,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9455,17678).
xc_kb_names(a65b12506e9455,[]).
xc_mapping_rows(a65b12506e9455,[]).
xc_direction(a65b12506e9455,':FORWARD').
xc_monotonicity(a65b12506e9455,':DEFAULT').
x_arg1Isa('x_SKF-61586386',x_Murder) :- x_cid(a65b12506e9456).
xc_microtheory(a65b12506e9456,x_HPKBCrisisMt).
xc_source_file(a65b12506e9456,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9456,17684).
xc_kb_names(a65b12506e9456,[]).
xc_mapping_rows(a65b12506e9456,[]).
xc_direction(a65b12506e9456,':FORWARD').
xc_monotonicity(a65b12506e9456,':DEFAULT').
x_resultIsa('x_SKF-61586386',x_Organization) :- x_cid(a65b12506e9457).
xc_microtheory(a65b12506e9457,x_HPKBCrisisMt).
xc_source_file(a65b12506e9457,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9457,17690).
xc_kb_names(a65b12506e9457,[]).
xc_mapping_rows(a65b12506e9457,[]).
xc_direction(a65b12506e9457,':FORWARD').
xc_monotonicity(a65b12506e9457,':DEFAULT').
x_arity('x_SKF-61586386',3) :- x_cid(a65b12506e9458).
xc_microtheory(a65b12506e9458,x_HPKBCrisisMt).
xc_source_file(a65b12506e9458,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9458,17696).
xc_kb_names(a65b12506e9458,[]).
xc_mapping_rows(a65b12506e9458,[]).
xc_direction(a65b12506e9458,':FORWARD').
xc_monotonicity(a65b12506e9458,':MONOTONIC').
x_isa('x_SKF-61586386',x_SkolemFunction) :- x_cid(a65b12506e9459).
xc_microtheory(a65b12506e9459,x_HPKBCrisisMt).
xc_source_file(a65b12506e9459,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9459,17702).
xc_kb_names(a65b12506e9459,[]).
xc_mapping_rows(a65b12506e9459,[]).
xc_direction(a65b12506e9459,':FORWARD').
xc_monotonicity(a65b12506e9459,':MONOTONIC').
x_arg3Isa('x_SKF-30715681',x_IndependentCountry) :- x_cid(a65b12506e945a).
xc_microtheory(a65b12506e945a,x_HPKBCrisisMt).
xc_source_file(a65b12506e945a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e945a,17708).
xc_kb_names(a65b12506e945a,[]).
xc_mapping_rows(a65b12506e945a,[]).
xc_direction(a65b12506e945a,':FORWARD').
xc_monotonicity(a65b12506e945a,':DEFAULT').
x_arg2Isa('x_SKF-30715681',x_RegionalGovernment) :- x_cid(a65b12506e945b).
xc_microtheory(a65b12506e945b,x_HPKBCrisisMt).
xc_source_file(a65b12506e945b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e945b,17714).
xc_kb_names(a65b12506e945b,[]).
xc_mapping_rows(a65b12506e945b,[]).
xc_direction(a65b12506e945b,':FORWARD').
xc_monotonicity(a65b12506e945b,':DEFAULT').
x_arg1Isa('x_SKF-30715681',x_PoliticalEvent) :- x_cid(a65b12506e945c).
xc_microtheory(a65b12506e945c,x_HPKBCrisisMt).
xc_source_file(a65b12506e945c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e945c,17720).
xc_kb_names(a65b12506e945c,[]).
xc_mapping_rows(a65b12506e945c,[]).
xc_direction(a65b12506e945c,':FORWARD').
xc_monotonicity(a65b12506e945c,':DEFAULT').
x_arg1Isa('x_SKF-30715681',x_Murder) :- x_cid(a65b12506e945d).
xc_microtheory(a65b12506e945d,x_HPKBCrisisMt).
xc_source_file(a65b12506e945d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e945d,17726).
xc_kb_names(a65b12506e945d,[]).
xc_mapping_rows(a65b12506e945d,[]).
xc_direction(a65b12506e945d,':FORWARD').
xc_monotonicity(a65b12506e945d,':DEFAULT').
x_resultIsa('x_SKF-30715681',x_Organization) :- x_cid(a65b12506e945e).
xc_microtheory(a65b12506e945e,x_HPKBCrisisMt).
xc_source_file(a65b12506e945e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e945e,17732).
xc_kb_names(a65b12506e945e,[]).
xc_mapping_rows(a65b12506e945e,[]).
xc_direction(a65b12506e945e,':FORWARD').
xc_monotonicity(a65b12506e945e,':DEFAULT').
x_arity('x_SKF-30715681',3) :- x_cid(a65b12506e945f).
xc_microtheory(a65b12506e945f,x_HPKBCrisisMt).
xc_source_file(a65b12506e945f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e945f,17738).
xc_kb_names(a65b12506e945f,[]).
xc_mapping_rows(a65b12506e945f,[]).
xc_direction(a65b12506e945f,':FORWARD').
xc_monotonicity(a65b12506e945f,':MONOTONIC').
x_isa('x_SKF-30715681',x_SkolemFunction) :- x_cid(a65b12506e9460).
xc_microtheory(a65b12506e9460,x_HPKBCrisisMt).
xc_source_file(a65b12506e9460,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9460,17744).
xc_kb_names(a65b12506e9460,[]).
xc_mapping_rows(a65b12506e9460,[]).
xc_direction(a65b12506e9460,':FORWARD').
xc_monotonicity(a65b12506e9460,':MONOTONIC').
x_implies(x_hasStatusWithAgent(V1,V2,x_FriendlyStatus),x_positiveVestedInterest(V1,V2)) :- x_cid(a65b12506e9461,V1,V2).
xc_microtheory(a65b12506e9461,x_HPKBCrisisMt).
xc_source_file(a65b12506e9461,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9461,17750).
xc_kb_names(a65b12506e9461,["?AGT1","?AGT2"]).
xc_mapping_rows(a65b12506e9461,['implication-implies']).
xc_direction(a65b12506e9461,':BACKWARD').
xc_monotonicity(a65b12506e9461,':DEFAULT').
xc_creator(a65b12506e9461,'OKeefe').
xc_creation_date(a65b12506e9461,19980601).
x_implies(x_hasStatusWithAgent(V1,V2,x_DissidentStatus),x_negativeVestedInterest(V1,V2)) :- x_cid(a65b12506e9462,V1,V2).
xc_microtheory(a65b12506e9462,x_HPKBCrisisMt).
xc_source_file(a65b12506e9462,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9462,17758).
xc_kb_names(a65b12506e9462,["?AGT1","?AGT2"]).
xc_mapping_rows(a65b12506e9462,['implication-implies']).
xc_direction(a65b12506e9462,':BACKWARD').
xc_monotonicity(a65b12506e9462,':DEFAULT').
xc_creator(a65b12506e9462,'OKeefe').
xc_creation_date(a65b12506e9462,19980601).
x_implies(x_possesses(V1,V2),x_goals(V1,x_not(x_thereExists(V3,x_inputsDestroyed(V3,V2))))) :- x_cid(a65b12506e9463,V1,V2,V3).
xc_microtheory(a65b12506e9463,x_HPKBCrisisMt).
xc_source_file(a65b12506e9463,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9463,17766).
xc_kb_names(a65b12506e9463,["?AGT","?THING","?EVT"]).
xc_mapping_rows(a65b12506e9463,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9463,':BACKWARD').
xc_monotonicity(a65b12506e9463,':DEFAULT').
xc_creator(a65b12506e9463,'OKeefe').
xc_creation_date(a65b12506e9463,19980601).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_performedBy(V1,V2),x_deviceUsed(V1,V3)),x_possesses(V2,V3)) :- x_cid(a65b12506e9464,V1,V2,V3).
xc_microtheory(a65b12506e9464,x_HPKBCrisisMt).
xc_source_file(a65b12506e9464,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9464,17778).
xc_kb_names(a65b12506e9464,["?ATTACK","?AGT","?DEVICE"]).
xc_mapping_rows(a65b12506e9464,['implication-implies']).
xc_direction(a65b12506e9464,':BACKWARD').
xc_monotonicity(a65b12506e9464,':DEFAULT').
xc_creator(a65b12506e9464,'OKeefe').
xc_creation_date(a65b12506e9464,19980601).
x_negativeVestedInterest(x_BrigadesOfTheMartyrAbdallahAlHudhaiti,x_Israel) :- x_cid(a65b12506e9465).
xc_microtheory(a65b12506e9465,x_HPKBCrisisMt).
xc_source_file(a65b12506e9465,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9465,17789).
xc_kb_names(a65b12506e9465,[]).
xc_mapping_rows(a65b12506e9465,[]).
xc_direction(a65b12506e9465,':FORWARD').
xc_monotonicity(a65b12506e9465,':DEFAULT').
x_negativeVestedInterest(x_IslamicMovementForChange,x_Israel) :- x_cid(a65b12506e9466).
xc_microtheory(a65b12506e9466,x_HPKBCrisisMt).
xc_source_file(a65b12506e9466,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9466,17795).
xc_kb_names(a65b12506e9466,[]).
xc_mapping_rows(a65b12506e9466,[]).
xc_direction(a65b12506e9466,':FORWARD').
xc_monotonicity(a65b12506e9466,':DEFAULT').
x_negativeVestedInterest(x_JihadGroup,x_Israel) :- x_cid(a65b12506e9467).
xc_microtheory(a65b12506e9467,x_HPKBCrisisMt).
xc_source_file(a65b12506e9467,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9467,17801).
xc_kb_names(a65b12506e9467,[]).
xc_mapping_rows(a65b12506e9467,[]).
xc_direction(a65b12506e9467,':FORWARD').
xc_monotonicity(a65b12506e9467,':DEFAULT').
x_negativeVestedInterest(x_HarakatUlAnsar,x_Israel) :- x_cid(a65b12506e9468).
xc_microtheory(a65b12506e9468,x_HPKBCrisisMt).
xc_source_file(a65b12506e9468,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9468,17807).
xc_kb_names(a65b12506e9468,[]).
xc_mapping_rows(a65b12506e9468,[]).
xc_direction(a65b12506e9468,':FORWARD').
xc_monotonicity(a65b12506e9468,':DEFAULT').
x_negativeVestedInterest(x_IslamicGroup,x_Israel) :- x_cid(a65b12506e9469).
xc_microtheory(a65b12506e9469,x_HPKBCrisisMt).
xc_source_file(a65b12506e9469,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9469,17813).
xc_kb_names(a65b12506e9469,[]).
xc_mapping_rows(a65b12506e9469,[]).
xc_direction(a65b12506e9469,':FORWARD').
xc_monotonicity(a65b12506e9469,':DEFAULT').
x_negativeVestedInterest(x_ArmedIslamicGroup,x_Israel) :- x_cid(a65b12506e946a).
xc_microtheory(a65b12506e946a,x_HPKBCrisisMt).
xc_source_file(a65b12506e946a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e946a,17819).
xc_kb_names(a65b12506e946a,[]).
xc_mapping_rows(a65b12506e946a,[]).
xc_direction(a65b12506e946a,':FORWARD').
xc_monotonicity(a65b12506e946a,':DEFAULT').
x_negativeVestedInterest(x_CommitteeForDefenseOfLegitimateRights,x_Israel) :- x_cid(a65b12506e946b).
xc_microtheory(a65b12506e946b,x_HPKBCrisisMt).
xc_source_file(a65b12506e946b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e946b,17825).
xc_kb_names(a65b12506e946b,[]).
xc_mapping_rows(a65b12506e946b,[]).
xc_direction(a65b12506e946b,':FORWARD').
xc_monotonicity(a65b12506e946b,':DEFAULT').
x_negativeVestedInterest(x_IslamicReformMovement,x_Israel) :- x_cid(a65b12506e946c).
xc_microtheory(a65b12506e946c,x_HPKBCrisisMt).
xc_source_file(a65b12506e946c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e946c,17831).
xc_kb_names(a65b12506e946c,[]).
xc_mapping_rows(a65b12506e946c,[]).
xc_direction(a65b12506e946c,':FORWARD').
xc_monotonicity(a65b12506e946c,':DEFAULT').
x_isa(x_PersianGulf,'x_ShippingLane-International') :- x_cid(a65b12506e946d).
xc_microtheory(a65b12506e946d,x_HPKBCrisisMt).
xc_source_file(a65b12506e946d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e946d,17837).
xc_kb_names(a65b12506e946d,[]).
xc_mapping_rows(a65b12506e946d,[]).
xc_direction(a65b12506e946d,':FORWARD').
xc_monotonicity(a65b12506e946d,':DEFAULT').
xc_creator(a65b12506e946d,'ABelasco').
xc_creation_date(a65b12506e946d,19980530).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_isa(V2,x_GeographicalAgent),x_damages(V1,x_IndustryOfRegionFn(V3,V2))),x_decreasesCausally(V1,x_EconomyFn(V2),x_economicStability)) :- x_cid(a65b12506e946e,V1,V2,V3).
xc_microtheory(a65b12506e946e,x_HPKBCrisisMt).
xc_source_file(a65b12506e946e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e946e,17843).
xc_kb_names(a65b12506e946e,["?ATTACK","?AREA","?IND"]).
xc_mapping_rows(a65b12506e946e,['implication-implies']).
xc_direction(a65b12506e946e,':BACKWARD').
xc_monotonicity(a65b12506e946e,':DEFAULT').
xc_creator(a65b12506e946e,'OKeefe').
xc_creation_date(a65b12506e946e,19980530).
x_implies(x_and(x_isa(V1,x_TerroristAct),x_maleficiary(V1,V2),x_isa(V2,x_GeopoliticalEntity)),x_decreasesCausally(V1,V2,x_politicalStability)) :- x_cid(a65b12506e946f,V1,V2).
xc_microtheory(a65b12506e946f,x_HPKBCrisisMt).
xc_source_file(a65b12506e946f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e946f,17856).
xc_kb_names(a65b12506e946f,["?TERR","?GEOPOL"]).
xc_mapping_rows(a65b12506e946f,['implication-implies']).
xc_direction(a65b12506e946f,':BACKWARD').
xc_monotonicity(a65b12506e946f,':DEFAULT').
xc_creator(a65b12506e946f,'OKeefe').
xc_creation_date(a65b12506e946f,19980530).
x_implies(x_and(x_isa(V1,x_TerroristAct),x_isa(V2,x_GeographicalAgent),x_damages(V1,x_IndustryOfRegionFn(V3,V2))),x_maleficiary(V1,V2)) :- x_cid(a65b12506e9470,V1,V2,V3).
xc_microtheory(a65b12506e9470,x_HPKBCrisisMt).
xc_source_file(a65b12506e9470,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9470,17867).
xc_kb_names(a65b12506e9470,["?ATTACK","?AREA","?INDUSTRY"]).
xc_mapping_rows(a65b12506e9470,['implication-implies']).
xc_direction(a65b12506e9470,':BACKWARD').
xc_monotonicity(a65b12506e9470,':DEFAULT').
xc_creator(a65b12506e9470,'OKeefe').
xc_creation_date(a65b12506e9470,19980530).
x_implies(x_exportsThrough(V1,V2,V3),x_goalCategoryForAgent(V1,x_not(x_thereExists(V4,x_and(x_isa(V4,x_BlockingTraffic),x_objectActedOn(V4,V3)))),x_NationalEconomyGoal)) :- x_cid(a65b12506e9471,V1,V2,V3,V4).
xc_microtheory(a65b12506e9471,x_HPKBCrisisMt).
xc_source_file(a65b12506e9471,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9471,17879).
xc_kb_names(a65b12506e9471,["?COUNTRY","?PROD","?PATH","?BLOCK"]).
xc_mapping_rows(a65b12506e9471,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9471,':BACKWARD').
xc_monotonicity(a65b12506e9471,':DEFAULT').
xc_creator(a65b12506e9471,'ABelasco').
xc_creation_date(a65b12506e9471,19980529).
x_implies(x_and(x_basicPriceForType(V1,V2),x_changesQuantityByAmount(V3,V4,x_Kappa(t(V5,V6),x_exportRateThrough(V5,V1,V7,V6)),V8)),x_changesQuantityByAmount(V3,V4,'x_grossDomesticProduct-Slot',x_TimesFn(V8,V2))) :- x_cid(a65b12506e9472,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12506e9472,x_HPKBCrisisMt).
xc_source_file(a65b12506e9472,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9472,17893).
xc_kb_names(a65b12506e9472,["?PRODUCT-TYPE","?UNIT-PRICE","?EVENT","?COUNTRY","?EXPORTER","?EXPORT-RATE","?LOC","?EX-CHANGE"]).
xc_mapping_rows(a65b12506e9472,['implication-implies']).
xc_direction(a65b12506e9472,':BACKWARD').
xc_monotonicity(a65b12506e9472,':DEFAULT').
xc_creator(a65b12506e9472,'Davis').
xc_creation_date(a65b12506e9472,19980529).
x_implies(x_and(x_isa(V1,x_MonetaryFlowRate),x_changesQuantityByAmount(V2,V3,x_Kappa(t(V4,V5),x_exportRateThrough(V4,V6,V7,V5)),V1)),x_changesQuantityByAmount(V2,V3,'x_grossDomesticProduct-Slot',V1)) :- x_cid(a65b12506e9473,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9473,x_HPKBCrisisMt).
xc_source_file(a65b12506e9473,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9473,17907).
xc_kb_names(a65b12506e9473,["?AMOUNT","?EVENT","?COUNTRY","?EXP","?EXP-RATE","?PRODUCT","?ROUTE"]).
xc_mapping_rows(a65b12506e9473,['implication-implies']).
xc_direction(a65b12506e9473,':BACKWARD').
xc_monotonicity(a65b12506e9473,':DEFAULT').
xc_creator(a65b12506e9473,'Davis').
xc_creation_date(a65b12506e9473,19980529).
x_implies(x_and(x_isa(V1,x_Pipeline),x_pathTerminus(V1,V2),x_isa(V2,x_Country)),x_controls(V2,V1)) :- x_cid(a65b12506e9474,V1,V2).
xc_microtheory(a65b12506e9474,x_HPKBCrisisMt).
xc_source_file(a65b12506e9474,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9474,17920).
xc_kb_names(a65b12506e9474,["?PIPELINE","?COUNTRY"]).
xc_mapping_rows(a65b12506e9474,['implication-implies']).
xc_direction(a65b12506e9474,':BACKWARD').
xc_monotonicity(a65b12506e9474,':DEFAULT').
xc_creator(a65b12506e9474,'Davis').
xc_creation_date(a65b12506e9474,19980528).
x_implies(x_and(x_isa(V1,x_Pipeline),x_pathTerminus(V1,V2),x_isa(V2,x_Country)),x_industryFacilities(x_IndustryOfRegionFn(x_OilIndustry,V2),V1)) :- x_cid(a65b12506e9475,V1,V2).
xc_microtheory(a65b12506e9475,x_HPKBCrisisMt).
xc_source_file(a65b12506e9475,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9475,17931).
xc_kb_names(a65b12506e9475,["?PIPELINE","?COUNTRY"]).
xc_mapping_rows(a65b12506e9475,['implication-implies']).
xc_direction(a65b12506e9475,':BACKWARD').
xc_monotonicity(a65b12506e9475,':DEFAULT').
xc_creator(a65b12506e9475,'Davis').
xc_creation_date(a65b12506e9475,19980528).
x_implies(x_and(x_isa(V1,x_Pipeline),x_objectFoundInLocation(V1,V2),x_isa(V2,x_Country)),x_industryFacilities(x_IndustryOfRegionFn(x_OilIndustry,V2),V1)) :- x_cid(a65b12506e9476,V1,V2).
xc_microtheory(a65b12506e9476,x_HPKBCrisisMt).
xc_source_file(a65b12506e9476,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9476,17943).
xc_kb_names(a65b12506e9476,["?PIPELINE","?COUNTRY"]).
xc_mapping_rows(a65b12506e9476,['implication-implies']).
xc_direction(a65b12506e9476,':BACKWARD').
xc_monotonicity(a65b12506e9476,':DEFAULT').
xc_creator(a65b12506e9476,'Davis').
xc_creation_date(a65b12506e9476,19980528).
x_implies(x_and(x_isa(V1,x_Pipeline),x_objectFoundInLocation(V1,V2),x_isa(V2,x_Country)),x_controls(V2,V1)) :- x_cid(a65b12506e9477,V1,V2).
xc_microtheory(a65b12506e9477,x_HPKBCrisisMt).
xc_source_file(a65b12506e9477,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9477,17955).
xc_kb_names(a65b12506e9477,["?PIPELINE","?COUNTRY"]).
xc_mapping_rows(a65b12506e9477,['implication-implies']).
xc_direction(a65b12506e9477,':BACKWARD').
xc_monotonicity(a65b12506e9477,':DEFAULT').
xc_creator(a65b12506e9477,'Davis').
xc_creation_date(a65b12506e9477,19980528).
x_supplyFromThroughAmountDuring(x_PlanetEarth,x_PetroleumProduct,x_Iran,x_StraitOfHormuz,x_YearFn(1995),x_MillionBarrelsPerDay(2.71709)) :- x_cid(a65b12506e9478).
xc_microtheory(a65b12506e9478,x_HPKBCrisisMt).
xc_source_file(a65b12506e9478,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9478,17966).
xc_kb_names(a65b12506e9478,[]).
xc_mapping_rows(a65b12506e9478,[]).
xc_direction(a65b12506e9478,':BACKWARD').
xc_monotonicity(a65b12506e9478,':DEFAULT').
x_implies(x_changesQuantityByAmount(V1,V2,x_Kappa(t(V3,V4),x_exportRateThrough(V3,V5,V6,V4)),V7),x_changesQuantityByAmount(V1,V2,'x_grossDomesticProduct-Slot',V7)) :- x_cid(a65b12506e9479,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12506e9479,x_HPKBCrisisMt).
xc_source_file(a65b12506e9479,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9479,17974).
xc_kb_names(a65b12506e9479,["?EVENT","?COUNTRY","?EXP","?EXP-RATE","?PRODUCT","?ROUTE","?AMOUNT"]).
xc_mapping_rows(a65b12506e9479,['implication-implies']).
xc_direction(a65b12506e9479,':BACKWARD').
xc_monotonicity(a65b12506e9479,':DEFAULT').
xc_creator(a65b12506e9479,'Davis').
xc_creation_date(a65b12506e9479,19980527).
x_implies(x_and(x_isa(V1,x_ProductType),x_isa(V2,'x_Path-Customary'),x_isa(V3,x_Rate),x_exportThroughAmountDuring(V4,V1,V2,V5,V3),x_changesQuantityByFraction(V6,V4,x_Kappa(t(V7,V8),x_exportRateThrough(V7,V1,V2,V9)),V10)),x_changesQuantityByAmount(V6,V4,x_Kappa(t(V11,V12),x_exportRateThrough(V11,V1,V2,V12)),x_TimesFn(V10,V3))) :- x_cid(a65b12506e947a,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b12506e947a,x_HPKBCrisisMt).
xc_source_file(a65b12506e947a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e947a,17985).
xc_kb_names(a65b12506e947a,["?PRODUCT","?ROUTE","?RATE","?COUNTRY","?TIME","?EVENT","?EXPORTER","?EXPORT-AMT","?EXPORT-RATE","?FRACTION","?EXP","?EXP-RATE"]).
xc_mapping_rows(a65b12506e947a,['implication-implies']).
xc_direction(a65b12506e947a,':BACKWARD').
xc_monotonicity(a65b12506e947a,':DEFAULT').
xc_creator(a65b12506e947a,'Davis').
xc_creation_date(a65b12506e947a,19980527).
x_productionAmountDuring(x_LevantRegion,V1,V2,x_PlusAll(x_LevantCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_productionAmountDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e947b,V1,V2,V3,V4).
xc_microtheory(a65b12506e947b,x_HPKBCrisisMt).
xc_source_file(a65b12506e947b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e947b,18005).
xc_kb_names(a65b12506e947b,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e947b,[]).
xc_direction(a65b12506e947b,':BACKWARD').
xc_monotonicity(a65b12506e947b,':DEFAULT').
xc_creator(a65b12506e947b,'Schwartz').
xc_creation_date(a65b12506e947b,19980527).
x_productionAmountDuring('x_MiddleEast-Region',x_PetroleumProduct,x_YearFn(1996),x_BarrelsPerDay(2.132e+07)) :- x_cid(a65b12506e947c).
xc_microtheory(a65b12506e947c,x_HPKBCrisisMt).
xc_source_file(a65b12506e947c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e947c,18016).
xc_kb_names(a65b12506e947c,[]).
xc_mapping_rows(a65b12506e947c,[]).
xc_direction(a65b12506e947c,':BACKWARD').
xc_monotonicity(a65b12506e947c,':DEFAULT').
x_productionAmountDuring('x_MiddleEast-Region',x_PetroleumProduct,x_YearFn(1995),x_BarrelsPerDay(21122000.0,21122100.0)) :- x_cid(a65b12506e947d).
xc_microtheory(a65b12506e947d,x_HPKBCrisisMt).
xc_source_file(a65b12506e947d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e947d,18024).
xc_kb_names(a65b12506e947d,[]).
xc_mapping_rows(a65b12506e947d,[]).
xc_direction(a65b12506e947d,':BACKWARD').
xc_monotonicity(a65b12506e947d,':DEFAULT').
x_productionAmountDuring('x_MiddleEast-Region',V1,V2,x_PlusAll(x_MiddleEasternCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_productionAmountDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e947e,V1,V2,V3,V4).
xc_microtheory(a65b12506e947e,x_HPKBCrisisMt).
xc_source_file(a65b12506e947e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e947e,18032).
xc_kb_names(a65b12506e947e,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e947e,[]).
xc_direction(a65b12506e947e,':BACKWARD').
xc_monotonicity(a65b12506e947e,':DEFAULT').
xc_creator(a65b12506e947e,'Schwartz').
xc_creation_date(a65b12506e947e,19980527).
x_productionCapacityDuring(x_PersianGulfRegion,x_PetroleumProduct,x_YearFn(1995),x_MillionBarrelsPerDay(20.9)) :- x_cid(a65b12506e947f).
xc_microtheory(a65b12506e947f,x_HPKBCrisisMt).
xc_source_file(a65b12506e947f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e947f,18043).
xc_kb_names(a65b12506e947f,[]).
xc_mapping_rows(a65b12506e947f,[]).
xc_direction(a65b12506e947f,':BACKWARD').
xc_monotonicity(a65b12506e947f,':DEFAULT').
x_productionCapacityDuring(x_PersianGulfRegion,x_PetroleumProduct,x_YearFn(1990),x_MillionBarrelsPerDay(18.6)) :- x_cid(a65b12506e9480).
xc_microtheory(a65b12506e9480,x_HPKBCrisisMt).
xc_source_file(a65b12506e9480,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9480,18051).
xc_kb_names(a65b12506e9480,[]).
xc_mapping_rows(a65b12506e9480,[]).
xc_direction(a65b12506e9480,':BACKWARD').
xc_monotonicity(a65b12506e9480,':DEFAULT').
x_productionCapacityDuring(x_PersianGulfRegion,V1,V2,x_PlusAll(x_PersianGulfCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_productionCapacityDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e9481,V1,V2,V3,V4).
xc_microtheory(a65b12506e9481,x_HPKBCrisisMt).
xc_source_file(a65b12506e9481,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9481,18059).
xc_kb_names(a65b12506e9481,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e9481,[]).
xc_direction(a65b12506e9481,':BACKWARD').
xc_monotonicity(a65b12506e9481,':DEFAULT').
xc_creator(a65b12506e9481,'Schwartz').
xc_creation_date(a65b12506e9481,19980526).
x_productionAmountDuring(x_PersianGulfRegion,x_PetroleumProduct,x_YearFn(1996),x_BarrelsPerDay(1.938e+07)) :- x_cid(a65b12506e9482).
xc_microtheory(a65b12506e9482,x_HPKBCrisisMt).
xc_source_file(a65b12506e9482,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9482,18070).
xc_kb_names(a65b12506e9482,[]).
xc_mapping_rows(a65b12506e9482,[]).
xc_direction(a65b12506e9482,':BACKWARD').
xc_monotonicity(a65b12506e9482,':DEFAULT').
x_productionAmountDuring(x_PersianGulfRegion,x_PetroleumProduct,x_YearFn(1995),x_BarrelsPerDay(19212000.0)) :- x_cid(a65b12506e9483).
xc_microtheory(a65b12506e9483,x_HPKBCrisisMt).
xc_source_file(a65b12506e9483,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9483,18078).
xc_kb_names(a65b12506e9483,[]).
xc_mapping_rows(a65b12506e9483,[]).
xc_direction(a65b12506e9483,':BACKWARD').
xc_monotonicity(a65b12506e9483,':DEFAULT').
x_productionAmountDuring(x_PersianGulfRegion,V1,V2,x_PlusAll(x_PersianGulfCountry,x_FunctionToArg(2,x_Kappa(t(V3,V4),x_productionAmountDuring(V3,V1,V2,V4))))) :- x_cid(a65b12506e9484,V1,V2,V3,V4).
xc_microtheory(a65b12506e9484,x_HPKBCrisisMt).
xc_source_file(a65b12506e9484,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9484,18086).
xc_kb_names(a65b12506e9484,["?PRODUCT-TYPE","?TIME","?C","?A"]).
xc_mapping_rows(a65b12506e9484,[]).
xc_direction(a65b12506e9484,':BACKWARD').
xc_monotonicity(a65b12506e9484,':DEFAULT').
xc_creator(a65b12506e9484,'Schwartz').
xc_creation_date(a65b12506e9484,19980526).
x_implies(x_productionAmountDuring(x_PlanetEarth,V1,V2,V3),x_supplyAmountDuring(x_PlanetEarth,V1,V2,V3)) :- x_cid(a65b12506e9485,V1,V2,V3).
xc_microtheory(a65b12506e9485,x_HPKBCrisisMt).
xc_source_file(a65b12506e9485,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9485,18097).
xc_kb_names(a65b12506e9485,["?PRODUCT-TYPE","?TIME","?AMOUNT"]).
xc_mapping_rows(a65b12506e9485,['implication-implies']).
xc_direction(a65b12506e9485,':BACKWARD').
xc_monotonicity(a65b12506e9485,':DEFAULT').
xc_creator(a65b12506e9485,'Schwartz').
xc_creation_date(a65b12506e9485,19980526).
x_implies(x_exportThroughAmountDuring(V1,V2,V3,V4,V5),x_supplyFromThroughAmountDuring(x_PlanetEarth,V2,V1,V3,V4,V5)) :- x_cid(a65b12506e9486,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9486,x_HPKBCrisisMt).
xc_source_file(a65b12506e9486,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9486,18105).
xc_kb_names(a65b12506e9486,["?REGION","?PRODUCT-TYPE","?PT","?TIME","?AMOUNT"]).
xc_mapping_rows(a65b12506e9486,['implication-implies']).
xc_direction(a65b12506e9486,':BACKWARD').
xc_monotonicity(a65b12506e9486,':DEFAULT').
xc_creator(a65b12506e9486,'Schwartz').
xc_creation_date(a65b12506e9486,19980526).
x_startsDuring(x_YearFn(1998),x_TimeIntervalInclusiveFn(x_YearFn(1980),x_YearFn(1998))) :- x_cid(a65b12506e9487).
xc_microtheory(a65b12506e9487,x_HPKBCrisisMt).
xc_source_file(a65b12506e9487,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9487,18113).
xc_kb_names(a65b12506e9487,[]).
xc_mapping_rows(a65b12506e9487,[]).
xc_direction(a65b12506e9487,':FORWARD').
xc_monotonicity(a65b12506e9487,':DEFAULT').
xc_creator(a65b12506e9487,'Schwartz').
xc_creation_date(a65b12506e9487,19980526).
x_startsDuring(x_MonthFn(x_July,x_YearFn(1997)),x_TimeIntervalInclusiveFn(x_YearFn(1980),x_YearFn(1998))) :- x_cid(a65b12506e9488).
xc_microtheory(a65b12506e9488,x_HPKBCrisisMt).
xc_source_file(a65b12506e9488,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9488,18123).
xc_kb_names(a65b12506e9488,[]).
xc_mapping_rows(a65b12506e9488,[]).
xc_direction(a65b12506e9488,':FORWARD').
xc_monotonicity(a65b12506e9488,':DEFAULT').
xc_creator(a65b12506e9488,'Schwartz').
xc_creation_date(a65b12506e9488,19980522).
x_startsDuring(x_MonthFn(x_July,x_YearFn(1996)),x_TimeIntervalInclusiveFn(x_YearFn(1980),x_YearFn(1998))) :- x_cid(a65b12506e9489).
xc_microtheory(a65b12506e9489,x_HPKBCrisisMt).
xc_source_file(a65b12506e9489,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9489,18134).
xc_kb_names(a65b12506e9489,[]).
xc_mapping_rows(a65b12506e9489,[]).
xc_direction(a65b12506e9489,':FORWARD').
xc_monotonicity(a65b12506e9489,':DEFAULT').
xc_creator(a65b12506e9489,'Schwartz').
xc_creation_date(a65b12506e9489,19980522).
x_startsDuring(x_MonthFn(x_July,x_YearFn(1995)),x_TimeIntervalInclusiveFn(x_YearFn(1980),x_YearFn(1998))) :- x_cid(a65b12506e948a).
xc_microtheory(a65b12506e948a,x_HPKBCrisisMt).
xc_source_file(a65b12506e948a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e948a,18145).
xc_kb_names(a65b12506e948a,[]).
xc_mapping_rows(a65b12506e948a,[]).
xc_direction(a65b12506e948a,':FORWARD').
xc_monotonicity(a65b12506e948a,':DEFAULT').
xc_creator(a65b12506e948a,'Schwartz').
xc_creation_date(a65b12506e948a,19980522).
x_startsDuring(x_YearFn(1997),x_TimeIntervalInclusiveFn(x_YearFn(1980),x_YearFn(1998))) :- x_cid(a65b12506e948b).
xc_microtheory(a65b12506e948b,x_HPKBCrisisMt).
xc_source_file(a65b12506e948b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e948b,18156).
xc_kb_names(a65b12506e948b,[]).
xc_mapping_rows(a65b12506e948b,[]).
xc_direction(a65b12506e948b,':FORWARD').
xc_monotonicity(a65b12506e948b,':DEFAULT').
xc_creator(a65b12506e948b,'Schwartz').
xc_creation_date(a65b12506e948b,19980522).
x_startsDuring(x_YearFn(1994),x_TimeIntervalInclusiveFn(x_YearFn(1980),x_YearFn(1998))) :- x_cid(a65b12506e948c).
xc_microtheory(a65b12506e948c,x_HPKBCrisisMt).
xc_source_file(a65b12506e948c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e948c,18166).
xc_kb_names(a65b12506e948c,[]).
xc_mapping_rows(a65b12506e948c,[]).
xc_direction(a65b12506e948c,':FORWARD').
xc_monotonicity(a65b12506e948c,':DEFAULT').
xc_creator(a65b12506e948c,'Schwartz').
xc_creation_date(a65b12506e948c,19980522).
x_startsDuring(x_YearFn(1993),x_TimeIntervalInclusiveFn(x_YearFn(1980),x_YearFn(1998))) :- x_cid(a65b12506e948d).
xc_microtheory(a65b12506e948d,x_HPKBCrisisMt).
xc_source_file(a65b12506e948d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e948d,18176).
xc_kb_names(a65b12506e948d,[]).
xc_mapping_rows(a65b12506e948d,[]).
xc_direction(a65b12506e948d,':FORWARD').
xc_monotonicity(a65b12506e948d,':DEFAULT').
xc_creator(a65b12506e948d,'Schwartz').
xc_creation_date(a65b12506e948d,19980522).
x_startsDuring(x_YearFn(1992),x_TimeIntervalInclusiveFn(x_YearFn(1980),x_YearFn(1998))) :- x_cid(a65b12506e948e).
xc_microtheory(a65b12506e948e,x_HPKBCrisisMt).
xc_source_file(a65b12506e948e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e948e,18186).
xc_kb_names(a65b12506e948e,[]).
xc_mapping_rows(a65b12506e948e,[]).
xc_direction(a65b12506e948e,':FORWARD').
xc_monotonicity(a65b12506e948e,':DEFAULT').
xc_creator(a65b12506e948e,'Schwartz').
xc_creation_date(a65b12506e948e,19980522).
x_startsDuring(x_YearFn(1991),x_TimeIntervalInclusiveFn(x_YearFn(1980),x_YearFn(1998))) :- x_cid(a65b12506e948f).
xc_microtheory(a65b12506e948f,x_HPKBCrisisMt).
xc_source_file(a65b12506e948f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e948f,18196).
xc_kb_names(a65b12506e948f,[]).
xc_mapping_rows(a65b12506e948f,[]).
xc_direction(a65b12506e948f,':FORWARD').
xc_monotonicity(a65b12506e948f,':DEFAULT').
xc_creator(a65b12506e948f,'Schwartz').
xc_creation_date(a65b12506e948f,19980522).
x_startsDuring(x_YearFn(1990),x_TimeIntervalInclusiveFn(x_YearFn(1980),x_YearFn(1998))) :- x_cid(a65b12506e9490).
xc_microtheory(a65b12506e9490,x_HPKBCrisisMt).
xc_source_file(a65b12506e9490,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9490,18206).
xc_kb_names(a65b12506e9490,[]).
xc_mapping_rows(a65b12506e9490,[]).
xc_direction(a65b12506e9490,':FORWARD').
xc_monotonicity(a65b12506e9490,':DEFAULT').
xc_creator(a65b12506e9490,'Schwartz').
xc_creation_date(a65b12506e9490,19980522).
x_implies(x_and(x_isa(V1,x_PoliticalInstability),x_doneBy(V1,V2)),x_holdsIn(V1,x_politicalStability(V2,x_Low))) :- x_cid(a65b12506e9491,V1,V2).
xc_microtheory(a65b12506e9491,x_HPKBCrisisMt).
xc_source_file(a65b12506e9491,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9491,18216).
xc_kb_names(a65b12506e9491,["?SIT","?REG"]).
xc_mapping_rows(a65b12506e9491,['implication-implies']).
xc_direction(a65b12506e9491,':BACKWARD').
xc_monotonicity(a65b12506e9491,':DEFAULT').
xc_creator(a65b12506e9491,'BillJ').
xc_creation_date(a65b12506e9491,19980522).
x_implies(x_and(x_isa(V1,x_TerroristAttack),x_maleficiary(V1,V2)),x_thereExists(V3,x_and('x_causes-EventEvent'(V1,V3),x_doneBy(V3,V2),x_isa(V3,x_PoliticalInstability)))) :- x_cid(a65b12506e9492,V1,V2,V3).
xc_microtheory(a65b12506e9492,x_HPKBCrisisMt).
xc_source_file(a65b12506e9492,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9492,18227).
xc_kb_names(a65b12506e9492,["?ATTACK","?COUNTRY","?INSTABILITY"]).
xc_mapping_rows(a65b12506e9492,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9492,':BACKWARD').
xc_monotonicity(a65b12506e9492,':DEFAULT').
xc_creator(a65b12506e9492,'BillJ').
xc_creation_date(a65b12506e9492,19980521).
x_implies(x_and(x_isa(V1,x_TerroristAttack),x_maleficiary(V1,V2)),x_thereExists(V3,x_and('x_causes-EventEvent'(V1,V3),x_doneBy(V3,V2),x_isa(V3,x_PoliticalInstability)))) :- x_cid(a65b12506e9493,V1,V2,V3).
xc_microtheory(a65b12506e9493,x_HPKBCrisisMt).
xc_source_file(a65b12506e9493,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9493,18242).
xc_kb_names(a65b12506e9493,["?ATTACK","?COUNTRY","?INSTABILITY"]).
xc_mapping_rows(a65b12506e9493,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9493,':BACKWARD').
xc_monotonicity(a65b12506e9493,':DEFAULT').
xc_creator(a65b12506e9493,'BillJ').
xc_creation_date(a65b12506e9493,19980521).
x_implies(x_and(x_isa(V1,x_TerroristAttack),x_maleficiary(V1,V2)),x_thereExists(V3,x_and('x_causes-EventEvent'(V1,V3),x_doneBy(V3,V2),x_isa(V3,x_PoliticalInstability)))) :- x_cid(a65b12506e9494,V1,V2,V3).
xc_microtheory(a65b12506e9494,x_HPKBCrisisMt).
xc_source_file(a65b12506e9494,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9494,18257).
xc_kb_names(a65b12506e9494,["?ATTACK","?COUNTRY","?INSTABILITY"]).
xc_mapping_rows(a65b12506e9494,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9494,':BACKWARD').
xc_monotonicity(a65b12506e9494,':DEFAULT').
xc_creator(a65b12506e9494,'BillJ').
xc_creation_date(a65b12506e9494,19980521).
x_arg2Isa('x_SKF-38258093',x_Agent) :- x_cid(a65b12506e9495).
xc_microtheory(a65b12506e9495,x_HPKBCrisisMt).
xc_source_file(a65b12506e9495,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9495,18272).
xc_kb_names(a65b12506e9495,[]).
xc_mapping_rows(a65b12506e9495,[]).
xc_direction(a65b12506e9495,':FORWARD').
xc_monotonicity(a65b12506e9495,':DEFAULT').
x_arg1Isa('x_SKF-38258093',x_TerroristAttack) :- x_cid(a65b12506e9496).
xc_microtheory(a65b12506e9496,x_HPKBCrisisMt).
xc_source_file(a65b12506e9496,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9496,18278).
xc_kb_names(a65b12506e9496,[]).
xc_mapping_rows(a65b12506e9496,[]).
xc_direction(a65b12506e9496,':FORWARD').
xc_monotonicity(a65b12506e9496,':DEFAULT').
x_resultIsa('x_SKF-38258093',x_PoliticalInstability) :- x_cid(a65b12506e9497).
xc_microtheory(a65b12506e9497,x_HPKBCrisisMt).
xc_source_file(a65b12506e9497,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9497,18284).
xc_kb_names(a65b12506e9497,[]).
xc_mapping_rows(a65b12506e9497,[]).
xc_direction(a65b12506e9497,':FORWARD').
xc_monotonicity(a65b12506e9497,':DEFAULT').
x_arity('x_SKF-38258093',2) :- x_cid(a65b12506e9498).
xc_microtheory(a65b12506e9498,x_HPKBCrisisMt).
xc_source_file(a65b12506e9498,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9498,18290).
xc_kb_names(a65b12506e9498,[]).
xc_mapping_rows(a65b12506e9498,[]).
xc_direction(a65b12506e9498,':FORWARD').
xc_monotonicity(a65b12506e9498,':MONOTONIC').
x_isa('x_SKF-38258093',x_SkolemFunction) :- x_cid(a65b12506e9499).
xc_microtheory(a65b12506e9499,x_HPKBCrisisMt).
xc_source_file(a65b12506e9499,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9499,18296).
xc_kb_names(a65b12506e9499,[]).
xc_mapping_rows(a65b12506e9499,[]).
xc_direction(a65b12506e9499,':FORWARD').
xc_monotonicity(a65b12506e9499,':MONOTONIC').
x_startsDuring(x_YearFn(1996),x_TimeIntervalInclusiveFn(x_YearFn(1980),x_YearFn(1998))) :- x_cid(a65b12506e949a).
xc_microtheory(a65b12506e949a,x_HPKBCrisisMt).
xc_source_file(a65b12506e949a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e949a,18302).
xc_kb_names(a65b12506e949a,[]).
xc_mapping_rows(a65b12506e949a,[]).
xc_direction(a65b12506e949a,':FORWARD').
xc_monotonicity(a65b12506e949a,':DEFAULT').
xc_creator(a65b12506e949a,'Schwartz').
xc_creation_date(a65b12506e949a,19980521).
x_startsDuring(x_YearFn(1995),x_TimeIntervalInclusiveFn(x_YearFn(1980),x_YearFn(1998))) :- x_cid(a65b12506e949b).
xc_microtheory(a65b12506e949b,x_HPKBCrisisMt).
xc_source_file(a65b12506e949b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e949b,18312).
xc_kb_names(a65b12506e949b,[]).
xc_mapping_rows(a65b12506e949b,[]).
xc_direction(a65b12506e949b,':FORWARD').
xc_monotonicity(a65b12506e949b,':DEFAULT').
xc_creator(a65b12506e949b,'Schwartz').
xc_creation_date(a65b12506e949b,19980521).
x_implies(x_and(x_isa(V1,x_Railway),x_linksOfCustomarySystem(x_RailSystemFn(V2),V1),x_isa(V2,x_Country)),x_objectFoundInLocation(V1,V2)) :- x_cid(a65b12506e949c,V1,V2).
xc_microtheory(a65b12506e949c,x_HPKBCrisisMt).
xc_source_file(a65b12506e949c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e949c,18322).
xc_kb_names(a65b12506e949c,["?RAIL","?COUNTRY"]).
xc_mapping_rows(a65b12506e949c,['implication-implies']).
xc_direction(a65b12506e949c,':BACKWARD').
xc_monotonicity(a65b12506e949c,':DEFAULT').
xc_creator(a65b12506e949c,'Colvin').
xc_creation_date(a65b12506e949c,19980520).
x_implies(x_and(x_isa(V1,x_Railway),x_objectFoundInLocation(V1,V2),x_isa(V2,x_Country)),x_linksOfCustomarySystem(x_RailSystemFn(V2),V1)) :- x_cid(a65b12506e949d,V1,V2).
xc_microtheory(a65b12506e949d,x_HPKBCrisisMt).
xc_source_file(a65b12506e949d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e949d,18334).
xc_kb_names(a65b12506e949d,["?RAIL","?COUNTRY"]).
xc_mapping_rows(a65b12506e949d,['implication-implies']).
xc_direction(a65b12506e949d,':BACKWARD').
xc_monotonicity(a65b12506e949d,':DEFAULT').
xc_creator(a65b12506e949d,'Colvin').
xc_creation_date(a65b12506e949d,19980520).
x_implies(x_and(x_isa(V1,x_PathForWheeledVehicles),x_linksOfCustomarySystem(x_RoadSystemFn(V2),V1),x_isa(V2,x_Country)),x_objectFoundInLocation(V1,V2)) :- x_cid(a65b12506e949e,V1,V2).
xc_microtheory(a65b12506e949e,x_HPKBCrisisMt).
xc_source_file(a65b12506e949e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e949e,18346).
xc_kb_names(a65b12506e949e,["?ROAD","?COUNTRY"]).
xc_mapping_rows(a65b12506e949e,['implication-implies']).
xc_direction(a65b12506e949e,':BACKWARD').
xc_monotonicity(a65b12506e949e,':DEFAULT').
xc_creator(a65b12506e949e,'Colvin').
xc_creation_date(a65b12506e949e,19980520).
x_implies(x_and(x_isa(V1,x_PathForWheeledVehicles),x_objectFoundInLocation(V1,V2),x_isa(V2,x_Country)),x_linksOfCustomarySystem(x_RoadSystemFn(V2),V1)) :- x_cid(a65b12506e949f,V1,V2).
xc_microtheory(a65b12506e949f,x_HPKBCrisisMt).
xc_source_file(a65b12506e949f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e949f,18358).
xc_kb_names(a65b12506e949f,["?ROAD","?COUNTRY"]).
xc_mapping_rows(a65b12506e949f,['implication-implies']).
xc_direction(a65b12506e949f,':BACKWARD').
xc_monotonicity(a65b12506e949f,':DEFAULT').
xc_creator(a65b12506e949f,'Colvin').
xc_creation_date(a65b12506e949f,19980520).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_BlockingTraffic),x_objectActedOn(V1,x_StraitOfHormuz),x_performedBy(V1,V2)),x_holdsIn(V1,x_regionControlled(V2,x_LesserTumbIsland))),x_NoteAbout51Rules) :- x_cid(a65b12506e94a0,V1,V2).
xc_microtheory(a65b12506e94a0,x_HPKBCrisisMt).
xc_source_file(a65b12506e94a0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94a0,18370).
xc_kb_names(a65b12506e94a0,["?BLOCKING","?AGENT"]).
xc_mapping_rows(a65b12506e94a0,['implication-implies']).
xc_direction(a65b12506e94a0,':BACKWARD').
xc_monotonicity(a65b12506e94a0,':DEFAULT').
xc_creator(a65b12506e94a0,'Rode').
xc_creation_date(a65b12506e94a0,19980519).
x_implies(x_and(x_isa(V1,x_BlockingTraffic),x_objectActedOn(V1,x_StraitOfHormuz),x_performedBy(V1,V2)),x_holdsIn(V1,x_regionControlled(V2,x_LesserTumbIsland))) :- x_cid(a65b12506e94a1,V1,V2).
xc_microtheory(a65b12506e94a1,x_HPKBCrisisMt).
xc_source_file(a65b12506e94a1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94a1,18383).
xc_kb_names(a65b12506e94a1,["?BLOCKING","?AGENT"]).
xc_mapping_rows(a65b12506e94a1,['implication-implies']).
xc_direction(a65b12506e94a1,':BACKWARD').
xc_monotonicity(a65b12506e94a1,':DEFAULT').
xc_creator(a65b12506e94a1,'Rode').
xc_creation_date(a65b12506e94a1,19980519).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_BlockingTraffic),x_objectActedOn(V1,x_StraitOfHormuz),x_performedBy(V1,V2)),x_holdsIn(V1,x_regionControlled(V2,x_GreaterTumbIsland))),x_NoteAbout51Rules) :- x_cid(a65b12506e94a2,V1,V2).
xc_microtheory(a65b12506e94a2,x_HPKBCrisisMt).
xc_source_file(a65b12506e94a2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94a2,18395).
xc_kb_names(a65b12506e94a2,["?BLOCKING","?AGENT"]).
xc_mapping_rows(a65b12506e94a2,['implication-implies']).
xc_direction(a65b12506e94a2,':BACKWARD').
xc_monotonicity(a65b12506e94a2,':DEFAULT').
xc_creator(a65b12506e94a2,'Rode').
xc_creation_date(a65b12506e94a2,19980519).
x_implies(x_and(x_isa(V1,x_BlockingTraffic),x_objectActedOn(V1,x_StraitOfHormuz),x_performedBy(V1,V2)),x_holdsIn(V1,x_regionControlled(V2,x_GreaterTumbIsland))) :- x_cid(a65b12506e94a3,V1,V2).
xc_microtheory(a65b12506e94a3,x_HPKBCrisisMt).
xc_source_file(a65b12506e94a3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94a3,18408).
xc_kb_names(a65b12506e94a3,["?BLOCKING","?AGENT"]).
xc_mapping_rows(a65b12506e94a3,['implication-implies']).
xc_direction(a65b12506e94a3,':BACKWARD').
xc_monotonicity(a65b12506e94a3,':DEFAULT').
xc_creator(a65b12506e94a3,'Rode').
xc_creation_date(a65b12506e94a3,19980519).
x_sharedNotes(x_implies(x_and(x_isa(V1,x_BlockingTraffic),x_objectActedOn(V1,x_StraitOfHormuz),x_performedBy(V1,V2)),x_holdsIn(V1,x_regionControlled(V2,x_AbuMusaIsland))),x_NoteAbout51Rules) :- x_cid(a65b12506e94a4,V1,V2).
xc_microtheory(a65b12506e94a4,x_HPKBCrisisMt).
xc_source_file(a65b12506e94a4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94a4,18420).
xc_kb_names(a65b12506e94a4,["?BLOCKING","?AGENT"]).
xc_mapping_rows(a65b12506e94a4,['implication-implies']).
xc_direction(a65b12506e94a4,':BACKWARD').
xc_monotonicity(a65b12506e94a4,':DEFAULT').
xc_creator(a65b12506e94a4,'Rode').
xc_creation_date(a65b12506e94a4,19980519).
x_implies(x_and(x_isa(V1,x_BlockingTraffic),x_objectActedOn(V1,x_StraitOfHormuz),x_performedBy(V1,V2)),x_holdsIn(V1,x_regionControlled(V2,x_AbuMusaIsland))) :- x_cid(a65b12506e94a5,V1,V2).
xc_microtheory(a65b12506e94a5,x_HPKBCrisisMt).
xc_source_file(a65b12506e94a5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94a5,18433).
xc_kb_names(a65b12506e94a5,["?BLOCKING","?AGENT"]).
xc_mapping_rows(a65b12506e94a5,['implication-implies']).
xc_direction(a65b12506e94a5,':BACKWARD').
xc_monotonicity(a65b12506e94a5,':DEFAULT').
xc_creator(a65b12506e94a5,'Rode').
xc_creation_date(a65b12506e94a5,19980519).
x_implies(x_and(x_isa(V1,x_Country),x_populationDuring(V1,x_MonthFn(V2,x_YearFn(V3)),V4)),x_populationDuring(V1,x_YearFn(V3),V4)) :- x_cid(a65b12506e94a6,V1,V2,V3,V4).
xc_microtheory(a65b12506e94a6,x_HPKBCrisisMt).
xc_source_file(a65b12506e94a6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94a6,18445).
xc_kb_names(a65b12506e94a6,["?COUNTRY","?MONTH","?X","?NR"]).
xc_mapping_rows(a65b12506e94a6,['implication-implies']).
xc_direction(a65b12506e94a6,':BACKWARD').
xc_monotonicity(a65b12506e94a6,':DEFAULT').
xc_creator(a65b12506e94a6,'Schwartz').
xc_creation_date(a65b12506e94a6,19980518).
x_populationDuring(x_Somalia,x_YearFn(1996),9639151) :- x_cid(a65b12506e94a7).
xc_microtheory(a65b12506e94a7,x_HPKBCrisisMt).
xc_source_file(a65b12506e94a7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94a7,18458).
xc_kb_names(a65b12506e94a7,[]).
xc_mapping_rows(a65b12506e94a7,[]).
xc_direction(a65b12506e94a7,':FORWARD').
xc_monotonicity(a65b12506e94a7,':DEFAULT').
x_populationDuring(x_Libya,x_YearFn(1996),5445436) :- x_cid(a65b12506e94a8).
xc_microtheory(a65b12506e94a8,x_HPKBCrisisMt).
xc_source_file(a65b12506e94a8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94a8,18465).
xc_kb_names(a65b12506e94a8,[]).
xc_mapping_rows(a65b12506e94a8,[]).
xc_direction(a65b12506e94a8,':FORWARD').
xc_monotonicity(a65b12506e94a8,':DEFAULT').
x_populationDuring(x_Eritrea,x_YearFn(1996),3427883) :- x_cid(a65b12506e94a9).
xc_microtheory(a65b12506e94a9,x_HPKBCrisisMt).
xc_source_file(a65b12506e94a9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94a9,18472).
xc_kb_names(a65b12506e94a9,[]).
xc_mapping_rows(a65b12506e94a9,[]).
xc_direction(a65b12506e94a9,':FORWARD').
xc_monotonicity(a65b12506e94a9,':DEFAULT').
x_populationDuring(x_Djibouti,x_YearFn(1996),427642) :- x_cid(a65b12506e94aa).
xc_microtheory(a65b12506e94aa,x_HPKBCrisisMt).
xc_source_file(a65b12506e94aa,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94aa,18479).
xc_kb_names(a65b12506e94aa,[]).
xc_mapping_rows(a65b12506e94aa,[]).
xc_direction(a65b12506e94aa,':FORWARD').
xc_monotonicity(a65b12506e94aa,':DEFAULT').
x_populationDuring(x_UnitedArabEmirates,x_YearFn(1996),3057337) :- x_cid(a65b12506e94ab).
xc_microtheory(a65b12506e94ab,x_HPKBCrisisMt).
xc_source_file(a65b12506e94ab,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94ab,18486).
xc_kb_names(a65b12506e94ab,[]).
xc_mapping_rows(a65b12506e94ab,[]).
xc_direction(a65b12506e94ab,':FORWARD').
xc_monotonicity(a65b12506e94ab,':DEFAULT').
x_populationDuring(x_Iraq,x_YearFn(1996),21422292) :- x_cid(a65b12506e94ac).
xc_microtheory(a65b12506e94ac,x_HPKBCrisisMt).
xc_source_file(a65b12506e94ac,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94ac,18493).
xc_kb_names(a65b12506e94ac,[]).
xc_mapping_rows(a65b12506e94ac,[]).
xc_direction(a65b12506e94ac,':FORWARD').
xc_monotonicity(a65b12506e94ac,':DEFAULT').
x_populationDuring(x_Kuwait,x_YearFn(1996),1950047) :- x_cid(a65b12506e94ad).
xc_microtheory(a65b12506e94ad,x_HPKBCrisisMt).
xc_source_file(a65b12506e94ad,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94ad,18500).
xc_kb_names(a65b12506e94ad,[]).
xc_mapping_rows(a65b12506e94ad,[]).
xc_direction(a65b12506e94ad,':FORWARD').
xc_monotonicity(a65b12506e94ad,':DEFAULT').
x_populationDuring(x_Bahrain,x_YearFn(1996),590042) :- x_cid(a65b12506e94ae).
xc_microtheory(a65b12506e94ae,x_HPKBCrisisMt).
xc_source_file(a65b12506e94ae,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94ae,18507).
xc_kb_names(a65b12506e94ae,[]).
xc_mapping_rows(a65b12506e94ae,[]).
xc_direction(a65b12506e94ae,':FORWARD').
xc_monotonicity(a65b12506e94ae,':DEFAULT').
x_populationDuring(x_Qatar,x_YearFn(1996),547761) :- x_cid(a65b12506e94af).
xc_microtheory(a65b12506e94af,x_HPKBCrisisMt).
xc_source_file(a65b12506e94af,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94af,18514).
xc_kb_names(a65b12506e94af,[]).
xc_mapping_rows(a65b12506e94af,[]).
xc_direction(a65b12506e94af,':FORWARD').
xc_monotonicity(a65b12506e94af,':DEFAULT').
x_populationDuring(x_Iran,x_YearFn(1996),66094264) :- x_cid(a65b12506e94b0).
xc_microtheory(a65b12506e94b0,x_HPKBCrisisMt).
xc_source_file(a65b12506e94b0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94b0,18521).
xc_kb_names(a65b12506e94b0,[]).
xc_mapping_rows(a65b12506e94b0,[]).
xc_direction(a65b12506e94b0,':FORWARD').
xc_monotonicity(a65b12506e94b0,':DEFAULT').
x_populationDuring(x_SaudiArabia,x_YearFn(1996),19409058) :- x_cid(a65b12506e94b1).
xc_microtheory(a65b12506e94b1,x_HPKBCrisisMt).
xc_source_file(a65b12506e94b1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94b1,18528).
xc_kb_names(a65b12506e94b1,[]).
xc_mapping_rows(a65b12506e94b1,[]).
xc_direction(a65b12506e94b1,':FORWARD').
xc_monotonicity(a65b12506e94b1,':DEFAULT').
x_populationDuring(x_Oman,x_YearFn(1996),2186548) :- x_cid(a65b12506e94b2).
xc_microtheory(a65b12506e94b2,x_HPKBCrisisMt).
xc_source_file(a65b12506e94b2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94b2,18535).
xc_kb_names(a65b12506e94b2,[]).
xc_mapping_rows(a65b12506e94b2,[]).
xc_direction(a65b12506e94b2,':FORWARD').
xc_monotonicity(a65b12506e94b2,':DEFAULT').
x_populationDuring(x_Japan,x_YearFn(1996),125449703) :- x_cid(a65b12506e94b3).
xc_microtheory(a65b12506e94b3,x_HPKBCrisisMt).
xc_source_file(a65b12506e94b3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94b3,18542).
xc_kb_names(a65b12506e94b3,[]).
xc_mapping_rows(a65b12506e94b3,[]).
xc_direction(a65b12506e94b3,':FORWARD').
xc_monotonicity(a65b12506e94b3,':DEFAULT').
x_populationDuring(x_UnitedStatesOfAmerica,x_YearFn(1996),266476278) :- x_cid(a65b12506e94b4).
xc_microtheory(a65b12506e94b4,x_HPKBCrisisMt).
xc_source_file(a65b12506e94b4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94b4,18549).
xc_kb_names(a65b12506e94b4,[]).
xc_mapping_rows(a65b12506e94b4,[]).
xc_direction(a65b12506e94b4,':FORWARD').
xc_monotonicity(a65b12506e94b4,':DEFAULT').
x_populationDuring(x_Afghanistan,x_YearFn(1996),22664136) :- x_cid(a65b12506e94b5).
xc_microtheory(a65b12506e94b5,x_HPKBCrisisMt).
xc_source_file(a65b12506e94b5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94b5,18556).
xc_kb_names(a65b12506e94b5,[]).
xc_mapping_rows(a65b12506e94b5,[]).
xc_direction(a65b12506e94b5,':FORWARD').
xc_monotonicity(a65b12506e94b5,':DEFAULT').
x_populationDuring(x_Armenia,x_YearFn(1996),3463574) :- x_cid(a65b12506e94b6).
xc_microtheory(a65b12506e94b6,x_HPKBCrisisMt).
xc_source_file(a65b12506e94b6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94b6,18563).
xc_kb_names(a65b12506e94b6,[]).
xc_mapping_rows(a65b12506e94b6,[]).
xc_direction(a65b12506e94b6,':FORWARD').
xc_monotonicity(a65b12506e94b6,':DEFAULT').
x_populationDuring(x_Australia,x_YearFn(1996),18260863) :- x_cid(a65b12506e94b7).
xc_microtheory(a65b12506e94b7,x_HPKBCrisisMt).
xc_source_file(a65b12506e94b7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94b7,18570).
xc_kb_names(a65b12506e94b7,[]).
xc_mapping_rows(a65b12506e94b7,[]).
xc_direction(a65b12506e94b7,':FORWARD').
xc_monotonicity(a65b12506e94b7,':DEFAULT').
x_populationDuring(x_Azerbaijan,x_YearFn(1996),7676953) :- x_cid(a65b12506e94b8).
xc_microtheory(a65b12506e94b8,x_HPKBCrisisMt).
xc_source_file(a65b12506e94b8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94b8,18577).
xc_kb_names(a65b12506e94b8,[]).
xc_mapping_rows(a65b12506e94b8,[]).
xc_direction(a65b12506e94b8,':FORWARD').
xc_monotonicity(a65b12506e94b8,':DEFAULT').
x_populationDuring(x_Bangladesh,x_YearFn(1996),123062800) :- x_cid(a65b12506e94b9).
xc_microtheory(a65b12506e94b9,x_HPKBCrisisMt).
xc_source_file(a65b12506e94b9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94b9,18584).
xc_kb_names(a65b12506e94b9,[]).
xc_mapping_rows(a65b12506e94b9,[]).
xc_direction(a65b12506e94b9,':FORWARD').
xc_monotonicity(a65b12506e94b9,':DEFAULT').
x_populationDuring(x_Belgium,x_YearFn(1996),10170241) :- x_cid(a65b12506e94ba).
xc_microtheory(a65b12506e94ba,x_HPKBCrisisMt).
xc_source_file(a65b12506e94ba,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94ba,18591).
xc_kb_names(a65b12506e94ba,[]).
xc_mapping_rows(a65b12506e94ba,[]).
xc_direction(a65b12506e94ba,':FORWARD').
xc_monotonicity(a65b12506e94ba,':DEFAULT').
x_populationDuring(x_Brazil,x_YearFn(1996),162661214) :- x_cid(a65b12506e94bb).
xc_microtheory(a65b12506e94bb,x_HPKBCrisisMt).
xc_source_file(a65b12506e94bb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94bb,18598).
xc_kb_names(a65b12506e94bb,[]).
xc_mapping_rows(a65b12506e94bb,[]).
xc_direction(a65b12506e94bb,':FORWARD').
xc_monotonicity(a65b12506e94bb,':DEFAULT').
x_populationDuring(x_Canada,x_YearFn(1996),28820671) :- x_cid(a65b12506e94bc).
xc_microtheory(a65b12506e94bc,x_HPKBCrisisMt).
xc_source_file(a65b12506e94bc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94bc,18605).
xc_kb_names(a65b12506e94bc,[]).
xc_mapping_rows(a65b12506e94bc,[]).
xc_direction(a65b12506e94bc,':FORWARD').
xc_monotonicity(a65b12506e94bc,':DEFAULT').
x_populationDuring('x_China-PeoplesRepublic',x_YearFn(1996),1210004956) :- x_cid(a65b12506e94bd).
xc_microtheory(a65b12506e94bd,x_HPKBCrisisMt).
xc_source_file(a65b12506e94bd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94bd,18612).
xc_kb_names(a65b12506e94bd,[]).
xc_mapping_rows(a65b12506e94bd,[]).
xc_direction(a65b12506e94bd,':FORWARD').
xc_monotonicity(a65b12506e94bd,':DEFAULT').
x_populationDuring('x_Cyprus-TheCountry',x_YearFn(1996),744609) :- x_cid(a65b12506e94be).
xc_microtheory(a65b12506e94be,x_HPKBCrisisMt).
xc_source_file(a65b12506e94be,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94be,18619).
xc_kb_names(a65b12506e94be,[]).
xc_mapping_rows(a65b12506e94be,[]).
xc_direction(a65b12506e94be,':FORWARD').
xc_monotonicity(a65b12506e94be,':DEFAULT').
x_populationDuring(x_Egypt,x_YearFn(1996),63575107) :- x_cid(a65b12506e94bf).
xc_microtheory(a65b12506e94bf,x_HPKBCrisisMt).
xc_source_file(a65b12506e94bf,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94bf,18626).
xc_kb_names(a65b12506e94bf,[]).
xc_mapping_rows(a65b12506e94bf,[]).
xc_direction(a65b12506e94bf,':FORWARD').
xc_monotonicity(a65b12506e94bf,':DEFAULT').
x_populationDuring(x_France,x_YearFn(1996),58317450) :- x_cid(a65b12506e94c0).
xc_microtheory(a65b12506e94c0,x_HPKBCrisisMt).
xc_source_file(a65b12506e94c0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94c0,18633).
xc_kb_names(a65b12506e94c0,[]).
xc_mapping_rows(a65b12506e94c0,[]).
xc_direction(a65b12506e94c0,':FORWARD').
xc_monotonicity(a65b12506e94c0,':DEFAULT').
x_populationDuring('x_Georgia-TheNation',x_YearFn(1996),5219810) :- x_cid(a65b12506e94c1).
xc_microtheory(a65b12506e94c1,x_HPKBCrisisMt).
xc_source_file(a65b12506e94c1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94c1,18640).
xc_kb_names(a65b12506e94c1,[]).
xc_mapping_rows(a65b12506e94c1,[]).
xc_direction(a65b12506e94c1,':FORWARD').
xc_monotonicity(a65b12506e94c1,':DEFAULT').
x_populationDuring(x_Germany,x_YearFn(1996),83536115) :- x_cid(a65b12506e94c2).
xc_microtheory(a65b12506e94c2,x_HPKBCrisisMt).
xc_source_file(a65b12506e94c2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94c2,18647).
xc_kb_names(a65b12506e94c2,[]).
xc_mapping_rows(a65b12506e94c2,[]).
xc_direction(a65b12506e94c2,':FORWARD').
xc_monotonicity(a65b12506e94c2,':DEFAULT').
x_populationDuring(x_Greece,x_YearFn(1996),10538594) :- x_cid(a65b12506e94c3).
xc_microtheory(a65b12506e94c3,x_HPKBCrisisMt).
xc_source_file(a65b12506e94c3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94c3,18654).
xc_kb_names(a65b12506e94c3,[]).
xc_mapping_rows(a65b12506e94c3,[]).
xc_direction(a65b12506e94c3,':FORWARD').
xc_monotonicity(a65b12506e94c3,':DEFAULT').
x_populationDuring(x_India,x_YearFn(1996),952107694) :- x_cid(a65b12506e94c4).
xc_microtheory(a65b12506e94c4,x_HPKBCrisisMt).
xc_source_file(a65b12506e94c4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94c4,18661).
xc_kb_names(a65b12506e94c4,[]).
xc_mapping_rows(a65b12506e94c4,[]).
xc_direction(a65b12506e94c4,':FORWARD').
xc_monotonicity(a65b12506e94c4,':DEFAULT').
x_populationDuring('x_Indonesia-TheNation',x_YearFn(1996),206611600) :- x_cid(a65b12506e94c5).
xc_microtheory(a65b12506e94c5,x_HPKBCrisisMt).
xc_source_file(a65b12506e94c5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94c5,18668).
xc_kb_names(a65b12506e94c5,[]).
xc_mapping_rows(a65b12506e94c5,[]).
xc_direction(a65b12506e94c5,':FORWARD').
xc_monotonicity(a65b12506e94c5,':DEFAULT').
x_populationDuring(x_Israel,x_YearFn(1996),5421995) :- x_cid(a65b12506e94c6).
xc_microtheory(a65b12506e94c6,x_HPKBCrisisMt).
xc_source_file(a65b12506e94c6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94c6,18675).
xc_kb_names(a65b12506e94c6,[]).
xc_mapping_rows(a65b12506e94c6,[]).
xc_direction(a65b12506e94c6,':FORWARD').
xc_monotonicity(a65b12506e94c6,':DEFAULT').
x_populationDuring(x_Italy,x_YearFn(1996),57460274) :- x_cid(a65b12506e94c7).
xc_microtheory(a65b12506e94c7,x_HPKBCrisisMt).
xc_source_file(a65b12506e94c7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94c7,18682).
xc_kb_names(a65b12506e94c7,[]).
xc_mapping_rows(a65b12506e94c7,[]).
xc_direction(a65b12506e94c7,':FORWARD').
xc_monotonicity(a65b12506e94c7,':DEFAULT').
x_populationDuring('x_Jordan-TheNation',x_YearFn(1996),4212152) :- x_cid(a65b12506e94c8).
xc_microtheory(a65b12506e94c8,x_HPKBCrisisMt).
xc_source_file(a65b12506e94c8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94c8,18689).
xc_kb_names(a65b12506e94c8,[]).
xc_mapping_rows(a65b12506e94c8,[]).
xc_direction(a65b12506e94c8,':FORWARD').
xc_monotonicity(a65b12506e94c8,':DEFAULT').
x_populationDuring(x_Kazakhstan,x_YearFn(1996),16916463) :- x_cid(a65b12506e94c9).
xc_microtheory(a65b12506e94c9,x_HPKBCrisisMt).
xc_source_file(a65b12506e94c9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94c9,18696).
xc_kb_names(a65b12506e94c9,[]).
xc_mapping_rows(a65b12506e94c9,[]).
xc_direction(a65b12506e94c9,':FORWARD').
xc_monotonicity(a65b12506e94c9,':DEFAULT').
x_populationDuring(x_Lebanon,x_YearFn(1996),3776317) :- x_cid(a65b12506e94ca).
xc_microtheory(a65b12506e94ca,x_HPKBCrisisMt).
xc_source_file(a65b12506e94ca,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94ca,18703).
xc_kb_names(a65b12506e94ca,[]).
xc_mapping_rows(a65b12506e94ca,[]).
xc_direction(a65b12506e94ca,':FORWARD').
xc_monotonicity(a65b12506e94ca,':DEFAULT').
x_populationDuring(x_NewZealand,x_YearFn(1996),3547983) :- x_cid(a65b12506e94cb).
xc_microtheory(a65b12506e94cb,x_HPKBCrisisMt).
xc_source_file(a65b12506e94cb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94cb,18710).
xc_kb_names(a65b12506e94cb,[]).
xc_mapping_rows(a65b12506e94cb,[]).
xc_direction(a65b12506e94cb,':FORWARD').
xc_monotonicity(a65b12506e94cb,':DEFAULT').
x_populationDuring(x_Netherlands,x_YearFn(1996),15568034) :- x_cid(a65b12506e94cc).
xc_microtheory(a65b12506e94cc,x_HPKBCrisisMt).
xc_source_file(a65b12506e94cc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94cc,18717).
xc_kb_names(a65b12506e94cc,[]).
xc_mapping_rows(a65b12506e94cc,[]).
xc_direction(a65b12506e94cc,':FORWARD').
xc_monotonicity(a65b12506e94cc,':DEFAULT').
x_populationDuring(x_Pakistan,x_YearFn(1996),129275660) :- x_cid(a65b12506e94cd).
xc_microtheory(a65b12506e94cd,x_HPKBCrisisMt).
xc_source_file(a65b12506e94cd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94cd,18724).
xc_kb_names(a65b12506e94cd,[]).
xc_mapping_rows(a65b12506e94cd,[]).
xc_direction(a65b12506e94cd,':FORWARD').
xc_monotonicity(a65b12506e94cd,':DEFAULT').
x_populationDuring(x_Portugal,x_YearFn(1996),9865114) :- x_cid(a65b12506e94ce).
xc_microtheory(a65b12506e94ce,x_HPKBCrisisMt).
xc_source_file(a65b12506e94ce,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94ce,18731).
xc_kb_names(a65b12506e94ce,[]).
xc_mapping_rows(a65b12506e94ce,[]).
xc_direction(a65b12506e94ce,':FORWARD').
xc_monotonicity(a65b12506e94ce,':DEFAULT').
x_populationDuring(x_Russia,x_YearFn(1996),148178487) :- x_cid(a65b12506e94cf).
xc_microtheory(a65b12506e94cf,x_HPKBCrisisMt).
xc_source_file(a65b12506e94cf,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94cf,18738).
xc_kb_names(a65b12506e94cf,[]).
xc_mapping_rows(a65b12506e94cf,[]).
xc_direction(a65b12506e94cf,':FORWARD').
xc_monotonicity(a65b12506e94cf,':DEFAULT').
x_populationDuring(x_Sudan,x_YearFn(1996),31547543) :- x_cid(a65b12506e94d0).
xc_microtheory(a65b12506e94d0,x_HPKBCrisisMt).
xc_source_file(a65b12506e94d0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94d0,18745).
xc_kb_names(a65b12506e94d0,[]).
xc_mapping_rows(a65b12506e94d0,[]).
xc_direction(a65b12506e94d0,':FORWARD').
xc_monotonicity(a65b12506e94d0,':DEFAULT').
x_populationDuring(x_Switzerland,x_YearFn(1996),7207060) :- x_cid(a65b12506e94d1).
xc_microtheory(a65b12506e94d1,x_HPKBCrisisMt).
xc_source_file(a65b12506e94d1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94d1,18752).
xc_kb_names(a65b12506e94d1,[]).
xc_mapping_rows(a65b12506e94d1,[]).
xc_direction(a65b12506e94d1,':FORWARD').
xc_monotonicity(a65b12506e94d1,':DEFAULT').
x_populationDuring(x_Syria,x_YearFn(1996),15608648) :- x_cid(a65b12506e94d2).
xc_microtheory(a65b12506e94d2,x_HPKBCrisisMt).
xc_source_file(a65b12506e94d2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94d2,18759).
xc_kb_names(a65b12506e94d2,[]).
xc_mapping_rows(a65b12506e94d2,[]).
xc_direction(a65b12506e94d2,':FORWARD').
xc_monotonicity(a65b12506e94d2,':DEFAULT').
x_populationDuring('x_Taiwan-RepublicOfChina',x_YearFn(1996),21465881) :- x_cid(a65b12506e94d3).
xc_microtheory(a65b12506e94d3,x_HPKBCrisisMt).
xc_source_file(a65b12506e94d3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94d3,18766).
xc_kb_names(a65b12506e94d3,[]).
xc_mapping_rows(a65b12506e94d3,[]).
xc_direction(a65b12506e94d3,':FORWARD').
xc_monotonicity(a65b12506e94d3,':DEFAULT').
x_populationDuring(x_UnitedKingdomOfGreatBritainAndNorthernIreland,x_YearFn(1996),58489975) :- x_cid(a65b12506e94d4).
xc_microtheory(a65b12506e94d4,x_HPKBCrisisMt).
xc_source_file(a65b12506e94d4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94d4,18773).
xc_kb_names(a65b12506e94d4,[]).
xc_mapping_rows(a65b12506e94d4,[]).
xc_direction(a65b12506e94d4,':FORWARD').
xc_monotonicity(a65b12506e94d4,':DEFAULT').
x_populationDuring(x_Tunisia,x_YearFn(1996),9019687) :- x_cid(a65b12506e94d5).
xc_microtheory(a65b12506e94d5,x_HPKBCrisisMt).
xc_source_file(a65b12506e94d5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94d5,18780).
xc_kb_names(a65b12506e94d5,[]).
xc_mapping_rows(a65b12506e94d5,[]).
xc_direction(a65b12506e94d5,':FORWARD').
xc_monotonicity(a65b12506e94d5,':DEFAULT').
x_populationDuring(x_Turkey,x_YearFn(1996),62484478) :- x_cid(a65b12506e94d6).
xc_microtheory(a65b12506e94d6,x_HPKBCrisisMt).
xc_source_file(a65b12506e94d6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94d6,18787).
xc_kb_names(a65b12506e94d6,[]).
xc_mapping_rows(a65b12506e94d6,[]).
xc_direction(a65b12506e94d6,':FORWARD').
xc_monotonicity(a65b12506e94d6,':DEFAULT').
x_populationDuring(x_Turkmenistan,x_YearFn(1996),4149283) :- x_cid(a65b12506e94d7).
xc_microtheory(a65b12506e94d7,x_HPKBCrisisMt).
xc_source_file(a65b12506e94d7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94d7,18794).
xc_kb_names(a65b12506e94d7,[]).
xc_mapping_rows(a65b12506e94d7,[]).
xc_direction(a65b12506e94d7,':FORWARD').
xc_monotonicity(a65b12506e94d7,':DEFAULT').
x_populationDuring(x_Yemen,x_YearFn(1996),13483178) :- x_cid(a65b12506e94d8).
xc_microtheory(a65b12506e94d8,x_HPKBCrisisMt).
xc_source_file(a65b12506e94d8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94d8,18801).
xc_kb_names(a65b12506e94d8,[]).
xc_mapping_rows(a65b12506e94d8,[]).
xc_direction(a65b12506e94d8,':FORWARD').
xc_monotonicity(a65b12506e94d8,':DEFAULT').
x_populationDuring(x_Syria,x_YearFn(1995),15451917) :- x_cid(a65b12506e94d9).
xc_microtheory(a65b12506e94d9,x_HPKBCrisisMt).
xc_source_file(a65b12506e94d9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94d9,18808).
xc_kb_names(a65b12506e94d9,[]).
xc_mapping_rows(a65b12506e94d9,[]).
xc_direction(a65b12506e94d9,':FORWARD').
xc_monotonicity(a65b12506e94d9,':DEFAULT').
x_implies(x_and(x_allies(V1,V2),x_goalCategoryForAgent(V1,V3,x_StrategicNationalInterest)),x_goalCategoryForAgent(V2,V3,x_ForeignPolicyGoal)) :- x_cid(a65b12506e94da,V1,V2,V3).
xc_microtheory(a65b12506e94da,x_HPKBCrisisMt).
xc_source_file(a65b12506e94da,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94da,18815).
xc_kb_names(a65b12506e94da,["?COUNTRY1","?COUNTRY2","?GOAL"]).
xc_mapping_rows(a65b12506e94da,['implication-implies']).
xc_direction(a65b12506e94da,':BACKWARD').
xc_monotonicity(a65b12506e94da,':DEFAULT').
xc_creator(a65b12506e94da,'ABelasco').
xc_creation_date(a65b12506e94da,19980514).
x_allies(x_UnitedKingdomOfGreatBritainAndNorthernIreland,x_UnitedStatesOfAmerica) :- x_cid(a65b12506e94db).
xc_microtheory(a65b12506e94db,x_HPKBCrisisMt).
xc_source_file(a65b12506e94db,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94db,18825).
xc_kb_names(a65b12506e94db,[]).
xc_mapping_rows(a65b12506e94db,[]).
xc_direction(a65b12506e94db,':FORWARD').
xc_monotonicity(a65b12506e94db,':DEFAULT').
xc_creator(a65b12506e94db,'ABelasco').
xc_creation_date(a65b12506e94db,19980514).
x_allies(x_UnitedStatesOfAmerica,x_Japan) :- x_cid(a65b12506e94dc).
xc_microtheory(a65b12506e94dc,x_HPKBCrisisMt).
xc_source_file(a65b12506e94dc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94dc,18831).
xc_kb_names(a65b12506e94dc,[]).
xc_mapping_rows(a65b12506e94dc,[]).
xc_direction(a65b12506e94dc,':FORWARD').
xc_monotonicity(a65b12506e94dc,':DEFAULT').
xc_creator(a65b12506e94dc,'ABelasco').
xc_creation_date(a65b12506e94dc,19980514).
x_allies(x_UnitedStatesOfAmerica,x_Canada) :- x_cid(a65b12506e94dd).
xc_microtheory(a65b12506e94dd,x_HPKBCrisisMt).
xc_source_file(a65b12506e94dd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94dd,18837).
xc_kb_names(a65b12506e94dd,[]).
xc_mapping_rows(a65b12506e94dd,[]).
xc_direction(a65b12506e94dd,':FORWARD').
xc_monotonicity(a65b12506e94dd,':DEFAULT').
xc_creator(a65b12506e94dd,'ABelasco').
xc_creation_date(a65b12506e94dd,19980514).
x_importsThrough(x_Japan,x_PetroleumProduct,x_StraitOfHormuz) :- x_cid(a65b12506e94de).
xc_microtheory(a65b12506e94de,x_HPKBCrisisMt).
xc_source_file(a65b12506e94de,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94de,18843).
xc_kb_names(a65b12506e94de,[]).
xc_mapping_rows(a65b12506e94de,[]).
xc_direction(a65b12506e94de,':FORWARD').
xc_monotonicity(a65b12506e94de,':DEFAULT').
xc_creator(a65b12506e94de,'ABelasco').
xc_creation_date(a65b12506e94de,19980514).
x_importsThrough(x_France,x_PetroleumProduct,x_StraitOfHormuz) :- x_cid(a65b12506e94df).
xc_microtheory(a65b12506e94df,x_HPKBCrisisMt).
xc_source_file(a65b12506e94df,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94df,18849).
xc_kb_names(a65b12506e94df,[]).
xc_mapping_rows(a65b12506e94df,[]).
xc_direction(a65b12506e94df,':FORWARD').
xc_monotonicity(a65b12506e94df,':DEFAULT').
xc_creator(a65b12506e94df,'ABelasco').
xc_creation_date(a65b12506e94df,19980514).
x_implies(x_and(x_isa(V1,x_WaterSurfacePath),x_spatiallyIntersects(V1,V2),x_isa(V2,x_InternationalWaters)),x_isa(V1,'x_ShippingLane-International')) :- x_cid(a65b12506e94e0,V1,V2).
xc_microtheory(a65b12506e94e0,x_HPKBCrisisMt).
xc_source_file(a65b12506e94e0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94e0,18855).
xc_kb_names(a65b12506e94e0,["?WETPATH","?INTWATER"]).
xc_mapping_rows(a65b12506e94e0,['implication-implies']).
xc_direction(a65b12506e94e0,':BACKWARD').
xc_monotonicity(a65b12506e94e0,':DEFAULT').
xc_creator(a65b12506e94e0,'Rode').
xc_creation_date(a65b12506e94e0,19980508).
x_implies(x_and(x_isa(V1,'x_BodyOfWater-Large'),x_isa(V1,x_InternationalWaters)),x_relationInstanceExistsMany(x_spatiallyIntersects,V1,'x_ShippingLane-International')) :- x_cid(a65b12506e94e1,V1).
xc_microtheory(a65b12506e94e1,x_HPKBCrisisMt).
xc_source_file(a65b12506e94e1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94e1,18866).
xc_kb_names(a65b12506e94e1,["?BODYOFWATER"]).
xc_mapping_rows(a65b12506e94e1,['implication-implies']).
xc_direction(a65b12506e94e1,':BACKWARD').
xc_monotonicity(a65b12506e94e1,':DEFAULT').
xc_creator(a65b12506e94e1,'Rode').
xc_creation_date(a65b12506e94e1,19980508).
x_importsThrough(x_UnitedStatesOfAmerica,'x_Petroleum-CrudeOil',x_StraitOfHormuz) :- x_cid(a65b12506e94e2).
xc_microtheory(a65b12506e94e2,x_HPKBCrisisMt).
xc_source_file(a65b12506e94e2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94e2,18876).
xc_kb_names(a65b12506e94e2,[]).
xc_mapping_rows(a65b12506e94e2,[]).
xc_direction(a65b12506e94e2,':FORWARD').
xc_monotonicity(a65b12506e94e2,':DEFAULT').
xc_creator(a65b12506e94e2,'ABelasco').
xc_creation_date(a65b12506e94e2,19980508).
x_implies(x_and(x_genls(V1,x_CombustibleFuelSubstance),x_importsThrough(V2,V1,V3)),x_goalCategoryForAgent(V2,x_not(x_thereExists(V4,x_and(x_isa(V4,x_BlockingTraffic),x_objectActedOn(V4,V3)))),x_FuelSupplyGoal)) :- x_cid(a65b12506e94e3,V1,V2,V3,V4).
xc_microtheory(a65b12506e94e3,x_HPKBCrisisMt).
xc_source_file(a65b12506e94e3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94e3,18882).
xc_kb_names(a65b12506e94e3,["?PROD","?COUNTRY","?PATH","?BLOCK"]).
xc_mapping_rows(a65b12506e94e3,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e94e3,':BACKWARD').
xc_monotonicity(a65b12506e94e3,':DEFAULT').
xc_creator(a65b12506e94e3,'ABelasco').
xc_creation_date(a65b12506e94e3,19980508).
x_implies(x_importsThrough(V1,V2,V3),x_goalCategoryForAgent(V1,x_not(x_thereExists(V4,x_and(x_isa(V4,x_BlockingTraffic),x_objectActedOn(V4,V3)))),x_StrategicNationalInterest)) :- x_cid(a65b12506e94e4,V1,V2,V3,V4).
xc_microtheory(a65b12506e94e4,x_HPKBCrisisMt).
xc_source_file(a65b12506e94e4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94e4,18898).
xc_kb_names(a65b12506e94e4,["?COUNTRY","?PROD","?PATH","?BLOCK"]).
xc_mapping_rows(a65b12506e94e4,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e94e4,':BACKWARD').
xc_monotonicity(a65b12506e94e4,':DEFAULT').
xc_creator(a65b12506e94e4,'ABelasco').
xc_creation_date(a65b12506e94e4,19980508).
x_groupMembers(x_DesertShieldCoalition,x_UnitedKingdomOfGreatBritainAndNorthernIreland) :- x_cid(a65b12506e94e5).
xc_microtheory(a65b12506e94e5,x_HPKBCrisisMt).
xc_source_file(a65b12506e94e5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94e5,18912).
xc_kb_names(a65b12506e94e5,[]).
xc_mapping_rows(a65b12506e94e5,[]).
xc_direction(a65b12506e94e5,':FORWARD').
xc_monotonicity(a65b12506e94e5,':DEFAULT').
xc_creator(a65b12506e94e5,'Nichols').
xc_creation_date(a65b12506e94e5,19980507).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_objectActedOn(V1,V2),x_possesses(V3,V2)),x_maleficiary(V1,V3)) :- x_cid(a65b12506e94e6,V1,V2,V3).
xc_microtheory(a65b12506e94e6,x_HPKBCrisisMt).
xc_source_file(a65b12506e94e6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94e6,18918).
xc_kb_names(a65b12506e94e6,["?ATTACK","?OBJ","?AGT"]).
xc_mapping_rows(a65b12506e94e6,['implication-implies']).
xc_direction(a65b12506e94e6,':BACKWARD').
xc_monotonicity(a65b12506e94e6,':DEFAULT').
xc_creator(a65b12506e94e6,'OKeefe').
xc_creation_date(a65b12506e94e6,19980505).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_victim(V1,V2),x_isa(V2,x_Country)),x_knowsAbout(x_InternationalCommunity,V1)) :- x_cid(a65b12506e94e7,V1,V2).
xc_microtheory(a65b12506e94e7,x_HPKBCrisisMt).
xc_source_file(a65b12506e94e7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94e7,18929).
xc_kb_names(a65b12506e94e7,["?ATTACK","?VIC"]).
xc_mapping_rows(a65b12506e94e7,['implication-implies']).
xc_direction(a65b12506e94e7,':BACKWARD').
xc_monotonicity(a65b12506e94e7,':DEFAULT').
xc_creator(a65b12506e94e7,'Davis').
xc_creation_date(a65b12506e94e7,19971114).
x_exceptWhen(x_deliberateActors(V1,V2),x_implies(x_and(x_isa(V1,x_AerialAttack),x_isa(V2,x_Country),x_eventOccursAt(V1,V3),x_inRegion(V3,V2)),x_victim(V1,V2))) :- x_cid(a65b12506e94e8,V1,V2,V3).
xc_microtheory(a65b12506e94e8,x_HPKBCrisisMt).
xc_source_file(a65b12506e94e8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94e8,18940).
xc_kb_names(a65b12506e94e8,["?ATTACK","?COUNTRY","?REG"]).
xc_mapping_rows(a65b12506e94e8,['implication-implies']).
xc_direction(a65b12506e94e8,':FORWARD').
xc_monotonicity(a65b12506e94e8,':DEFAULT').
xc_creator(a65b12506e94e8,'OKeefe').
xc_creation_date(a65b12506e94e8,19980430).
x_relationInstanceExistsMany(x_owns,x_IranianSubmarineFleet,x_KiloClassSubmarine) :- x_cid(a65b12506e94e9).
xc_microtheory(a65b12506e94e9,x_HPKBCrisisMt).
xc_source_file(a65b12506e94e9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94e9,18954).
xc_kb_names(a65b12506e94e9,[]).
xc_mapping_rows(a65b12506e94e9,[]).
xc_direction(a65b12506e94e9,':FORWARD').
xc_monotonicity(a65b12506e94e9,':DEFAULT').
xc_creator(a65b12506e94e9,'Rode').
xc_creation_date(a65b12506e94e9,19980430).
x_relationInstanceExistsMany(x_possesses,x_Iran,x_KiloClassSubmarine) :- x_cid(a65b12506e94ea).
xc_microtheory(a65b12506e94ea,x_HPKBCrisisMt).
xc_source_file(a65b12506e94ea,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94ea,18960).
xc_kb_names(a65b12506e94ea,[]).
xc_mapping_rows(a65b12506e94ea,[]).
xc_direction(a65b12506e94ea,':FORWARD').
xc_monotonicity(a65b12506e94ea,':DEFAULT').
xc_creator(a65b12506e94ea,'Rode').
xc_creation_date(a65b12506e94ea,19980430).
x_relationInstanceExistsMany(x_owns,x_Iran,'x_BallisticMissile-CSS8') :- x_cid(a65b12506e94eb).
xc_microtheory(a65b12506e94eb,x_HPKBCrisisMt).
xc_source_file(a65b12506e94eb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94eb,18966).
xc_kb_names(a65b12506e94eb,[]).
xc_mapping_rows(a65b12506e94eb,[]).
xc_direction(a65b12506e94eb,':FORWARD').
xc_monotonicity(a65b12506e94eb,':DEFAULT').
xc_creator(a65b12506e94eb,'Rode').
xc_creation_date(a65b12506e94eb,19980430).
x_relationInstanceExistsMany(x_owns,x_Iran,'x_BallisticMissile-Mushak120') :- x_cid(a65b12506e94ec).
xc_microtheory(a65b12506e94ec,x_HPKBCrisisMt).
xc_source_file(a65b12506e94ec,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94ec,18972).
xc_kb_names(a65b12506e94ec,[]).
xc_mapping_rows(a65b12506e94ec,[]).
xc_direction(a65b12506e94ec,':FORWARD').
xc_monotonicity(a65b12506e94ec,':DEFAULT').
xc_creator(a65b12506e94ec,'Rode').
xc_creation_date(a65b12506e94ec,19980430).
x_relationInstanceExistsMany(x_owns,x_Iran,'x_BallisticMissile-Mushak160') :- x_cid(a65b12506e94ed).
xc_microtheory(a65b12506e94ed,x_HPKBCrisisMt).
xc_source_file(a65b12506e94ed,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94ed,18978).
xc_kb_names(a65b12506e94ed,[]).
xc_mapping_rows(a65b12506e94ed,[]).
xc_direction(a65b12506e94ed,':FORWARD').
xc_monotonicity(a65b12506e94ed,':DEFAULT').
xc_creator(a65b12506e94ed,'Rode').
xc_creation_date(a65b12506e94ed,19980430).
x_relationInstanceExistsMany(x_owns,x_Iran,'x_BallisticMissile-Mushak200') :- x_cid(a65b12506e94ee).
xc_microtheory(a65b12506e94ee,x_HPKBCrisisMt).
xc_source_file(a65b12506e94ee,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94ee,18984).
xc_kb_names(a65b12506e94ee,[]).
xc_mapping_rows(a65b12506e94ee,[]).
xc_direction(a65b12506e94ee,':FORWARD').
xc_monotonicity(a65b12506e94ee,':DEFAULT').
xc_creator(a65b12506e94ee,'Rode').
xc_creation_date(a65b12506e94ee,19980430).
x_relationInstanceExistsMany(x_owns,x_Iran,'x_BallisticMissile-SCUDC') :- x_cid(a65b12506e94ef).
xc_microtheory(a65b12506e94ef,x_HPKBCrisisMt).
xc_source_file(a65b12506e94ef,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94ef,18990).
xc_kb_names(a65b12506e94ef,[]).
xc_mapping_rows(a65b12506e94ef,[]).
xc_direction(a65b12506e94ef,':FORWARD').
xc_monotonicity(a65b12506e94ef,':DEFAULT').
xc_creator(a65b12506e94ef,'Rode').
xc_creation_date(a65b12506e94ef,19980430).
x_relationInstanceExistsMany(x_owns,x_Iran,'x_BallisticMissile-SCUDB') :- x_cid(a65b12506e94f0).
xc_microtheory(a65b12506e94f0,x_HPKBCrisisMt).
xc_source_file(a65b12506e94f0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94f0,18996).
xc_kb_names(a65b12506e94f0,[]).
xc_mapping_rows(a65b12506e94f0,[]).
xc_direction(a65b12506e94f0,':FORWARD').
xc_monotonicity(a65b12506e94f0,':DEFAULT').
xc_creator(a65b12506e94f0,'Rode').
xc_creation_date(a65b12506e94f0,19980430).
x_hasOwnershipIn(x_IranianSubmarineFleet,x_IranianKiloSubmarine1) :- x_cid(a65b12506e94f1).
xc_microtheory(a65b12506e94f1,x_HPKBCrisisMt).
xc_source_file(a65b12506e94f1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94f1,19002).
xc_kb_names(a65b12506e94f1,[]).
xc_mapping_rows(a65b12506e94f1,[]).
xc_direction(a65b12506e94f1,':FORWARD').
xc_monotonicity(a65b12506e94f1,':DEFAULT').
x_owns(x_IranianSubmarineFleet,x_IranianKiloSubmarine1) :- x_cid(a65b12506e94f2).
xc_microtheory(a65b12506e94f2,x_HPKBCrisisMt).
xc_source_file(a65b12506e94f2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94f2,19008).
xc_kb_names(a65b12506e94f2,[]).
xc_mapping_rows(a65b12506e94f2,[]).
xc_direction(a65b12506e94f2,':FORWARD').
xc_monotonicity(a65b12506e94f2,':DEFAULT').
xc_creator(a65b12506e94f2,'Rode').
xc_creation_date(a65b12506e94f2,19980430).
x_hasOwnershipIn(x_IranianSubmarineFleet,x_IranianKiloSubmarine2) :- x_cid(a65b12506e94f3).
xc_microtheory(a65b12506e94f3,x_HPKBCrisisMt).
xc_source_file(a65b12506e94f3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94f3,19014).
xc_kb_names(a65b12506e94f3,[]).
xc_mapping_rows(a65b12506e94f3,[]).
xc_direction(a65b12506e94f3,':FORWARD').
xc_monotonicity(a65b12506e94f3,':DEFAULT').
x_owns(x_IranianSubmarineFleet,x_IranianKiloSubmarine2) :- x_cid(a65b12506e94f4).
xc_microtheory(a65b12506e94f4,x_HPKBCrisisMt).
xc_source_file(a65b12506e94f4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94f4,19020).
xc_kb_names(a65b12506e94f4,[]).
xc_mapping_rows(a65b12506e94f4,[]).
xc_direction(a65b12506e94f4,':FORWARD').
xc_monotonicity(a65b12506e94f4,':DEFAULT').
xc_creator(a65b12506e94f4,'Rode').
xc_creation_date(a65b12506e94f4,19980430).
x_hasOwnershipIn(x_Iran,'x_HYP-BallisticMissile-Mushak160-17017033') :- x_cid(a65b12506e94f5).
xc_microtheory(a65b12506e94f5,x_HPKBCrisisMt).
xc_source_file(a65b12506e94f5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94f5,19026).
xc_kb_names(a65b12506e94f5,[]).
xc_mapping_rows(a65b12506e94f5,[]).
xc_direction(a65b12506e94f5,':FORWARD').
xc_monotonicity(a65b12506e94f5,':DEFAULT').
x_owns(x_Iran,'x_HYP-BallisticMissile-Mushak160-17017033') :- x_cid(a65b12506e94f6).
xc_microtheory(a65b12506e94f6,x_HPKBCrisisMt).
xc_source_file(a65b12506e94f6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94f6,19032).
xc_kb_names(a65b12506e94f6,[]).
xc_mapping_rows(a65b12506e94f6,[]).
xc_direction(a65b12506e94f6,':FORWARD').
xc_monotonicity(a65b12506e94f6,':DEFAULT').
xc_creator(a65b12506e94f6,'Rode').
xc_creation_date(a65b12506e94f6,19980430).
x_hasOwnershipIn(x_Iran,'x_HYP-BallisticMissile-Mushak200-47497030') :- x_cid(a65b12506e94f7).
xc_microtheory(a65b12506e94f7,x_HPKBCrisisMt).
xc_source_file(a65b12506e94f7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94f7,19038).
xc_kb_names(a65b12506e94f7,[]).
xc_mapping_rows(a65b12506e94f7,[]).
xc_direction(a65b12506e94f7,':FORWARD').
xc_monotonicity(a65b12506e94f7,':DEFAULT').
x_owns(x_Iran,'x_HYP-BallisticMissile-Mushak200-47497030') :- x_cid(a65b12506e94f8).
xc_microtheory(a65b12506e94f8,x_HPKBCrisisMt).
xc_source_file(a65b12506e94f8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94f8,19044).
xc_kb_names(a65b12506e94f8,[]).
xc_mapping_rows(a65b12506e94f8,[]).
xc_direction(a65b12506e94f8,':FORWARD').
xc_monotonicity(a65b12506e94f8,':DEFAULT').
xc_creator(a65b12506e94f8,'Rode').
xc_creation_date(a65b12506e94f8,19980430).
x_hasOwnershipIn(x_Iran,'x_HYP-BallisticMissile-M11-33553741') :- x_cid(a65b12506e94f9).
xc_microtheory(a65b12506e94f9,x_HPKBCrisisMt).
xc_source_file(a65b12506e94f9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94f9,19050).
xc_kb_names(a65b12506e94f9,[]).
xc_mapping_rows(a65b12506e94f9,[]).
xc_direction(a65b12506e94f9,':FORWARD').
xc_monotonicity(a65b12506e94f9,':DEFAULT').
x_owns(x_Iran,'x_HYP-BallisticMissile-M11-33553741') :- x_cid(a65b12506e94fa).
xc_microtheory(a65b12506e94fa,x_HPKBCrisisMt).
xc_source_file(a65b12506e94fa,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94fa,19056).
xc_kb_names(a65b12506e94fa,[]).
xc_mapping_rows(a65b12506e94fa,[]).
xc_direction(a65b12506e94fa,':FORWARD').
xc_monotonicity(a65b12506e94fa,':DEFAULT').
xc_creator(a65b12506e94fa,'Rode').
xc_creation_date(a65b12506e94fa,19980430).
x_hasOwnershipIn(x_Iran,'x_HYP-BallisticMissile-CSS8-30837525') :- x_cid(a65b12506e94fb).
xc_microtheory(a65b12506e94fb,x_HPKBCrisisMt).
xc_source_file(a65b12506e94fb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94fb,19062).
xc_kb_names(a65b12506e94fb,[]).
xc_mapping_rows(a65b12506e94fb,[]).
xc_direction(a65b12506e94fb,':FORWARD').
xc_monotonicity(a65b12506e94fb,':DEFAULT').
x_owns(x_Iran,'x_HYP-BallisticMissile-CSS8-30837525') :- x_cid(a65b12506e94fc).
xc_microtheory(a65b12506e94fc,x_HPKBCrisisMt).
xc_source_file(a65b12506e94fc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94fc,19068).
xc_kb_names(a65b12506e94fc,[]).
xc_mapping_rows(a65b12506e94fc,[]).
xc_direction(a65b12506e94fc,':FORWARD').
xc_monotonicity(a65b12506e94fc,':DEFAULT').
xc_creator(a65b12506e94fc,'Rode').
xc_creation_date(a65b12506e94fc,19980430).
x_hasOwnershipIn(x_Iran,'x_HYP-BallisticMissile-Mushak120-15817564') :- x_cid(a65b12506e94fd).
xc_microtheory(a65b12506e94fd,x_HPKBCrisisMt).
xc_source_file(a65b12506e94fd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94fd,19074).
xc_kb_names(a65b12506e94fd,[]).
xc_mapping_rows(a65b12506e94fd,[]).
xc_direction(a65b12506e94fd,':FORWARD').
xc_monotonicity(a65b12506e94fd,':DEFAULT').
x_owns(x_Iran,'x_HYP-BallisticMissile-Mushak120-15817564') :- x_cid(a65b12506e94fe).
xc_microtheory(a65b12506e94fe,x_HPKBCrisisMt).
xc_source_file(a65b12506e94fe,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94fe,19080).
xc_kb_names(a65b12506e94fe,[]).
xc_mapping_rows(a65b12506e94fe,[]).
xc_direction(a65b12506e94fe,':FORWARD').
xc_monotonicity(a65b12506e94fe,':DEFAULT').
xc_creator(a65b12506e94fe,'Rode').
xc_creation_date(a65b12506e94fe,19980430).
x_hasOwnershipIn(x_Iran,'x_HYP-BallisticMissile-SCUDC-48505638') :- x_cid(a65b12506e94ff).
xc_microtheory(a65b12506e94ff,x_HPKBCrisisMt).
xc_source_file(a65b12506e94ff,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e94ff,19086).
xc_kb_names(a65b12506e94ff,[]).
xc_mapping_rows(a65b12506e94ff,[]).
xc_direction(a65b12506e94ff,':FORWARD').
xc_monotonicity(a65b12506e94ff,':DEFAULT').
x_owns(x_Iran,'x_HYP-BallisticMissile-SCUDC-48505638') :- x_cid(a65b12506e9500).
xc_microtheory(a65b12506e9500,x_HPKBCrisisMt).
xc_source_file(a65b12506e9500,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9500,19092).
xc_kb_names(a65b12506e9500,[]).
xc_mapping_rows(a65b12506e9500,[]).
xc_direction(a65b12506e9500,':FORWARD').
xc_monotonicity(a65b12506e9500,':DEFAULT').
xc_creator(a65b12506e9500,'Rode').
xc_creation_date(a65b12506e9500,19980430).
x_hasOwnershipIn(x_Iran,'x_HYP-BallisticMissile-SCUDB-1915224') :- x_cid(a65b12506e9501).
xc_microtheory(a65b12506e9501,x_HPKBCrisisMt).
xc_source_file(a65b12506e9501,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9501,19098).
xc_kb_names(a65b12506e9501,[]).
xc_mapping_rows(a65b12506e9501,[]).
xc_direction(a65b12506e9501,':FORWARD').
xc_monotonicity(a65b12506e9501,':DEFAULT').
x_owns(x_Iran,'x_HYP-BallisticMissile-SCUDB-1915224') :- x_cid(a65b12506e9502).
xc_microtheory(a65b12506e9502,x_HPKBCrisisMt).
xc_source_file(a65b12506e9502,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9502,19104).
xc_kb_names(a65b12506e9502,[]).
xc_mapping_rows(a65b12506e9502,[]).
xc_direction(a65b12506e9502,':FORWARD').
xc_monotonicity(a65b12506e9502,':DEFAULT').
xc_creator(a65b12506e9502,'Rode').
xc_creation_date(a65b12506e9502,19980430).
x_implies('x_internationalOrg-MemberCountry'(x_GulfCooperationCouncil,V1),x_opponents(x_Iran,V1)) :- x_cid(a65b12506e9503,V1).
xc_microtheory(a65b12506e9503,x_HPKBCrisisMt).
xc_source_file(a65b12506e9503,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9503,19110).
xc_kb_names(a65b12506e9503,["?NATION"]).
xc_mapping_rows(a65b12506e9503,['implication-implies']).
xc_direction(a65b12506e9503,':BACKWARD').
xc_monotonicity(a65b12506e9503,':DEFAULT').
xc_creator(a65b12506e9503,'OKeefe').
xc_creation_date(a65b12506e9503,19971125).
x_implies(x_and(x_isa(V1,x_Famine),x_eventOccursAt(V1,V2),x_isa(V2,x_Country)),x_decreasesCausally(V1,V2,x_politicalStability)) :- x_cid(a65b12506e9504,V1,V2).
xc_microtheory(a65b12506e9504,x_HPKBCrisisMt).
xc_source_file(a65b12506e9504,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9504,19118).
xc_kb_names(a65b12506e9504,["?FAMINE","?COUNTRY"]).
xc_mapping_rows(a65b12506e9504,['implication-implies']).
xc_direction(a65b12506e9504,':BACKWARD').
xc_monotonicity(a65b12506e9504,':DEFAULT').
xc_creator(a65b12506e9504,'OKeefe').
xc_creation_date(a65b12506e9504,19980429).
x_implies(x_and(x_isa(V1,x_Famine),x_eventOccursAt(V1,V2),x_isa(V2,x_Country)),x_decreasesCausally(V1,x_EconomyFn(V2),x_economicStability)) :- x_cid(a65b12506e9505,V1,V2).
xc_microtheory(a65b12506e9505,x_HPKBCrisisMt).
xc_source_file(a65b12506e9505,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9505,19129).
xc_kb_names(a65b12506e9505,["?FAMINE","?COUNTRY"]).
xc_mapping_rows(a65b12506e9505,['implication-implies']).
xc_direction(a65b12506e9505,':BACKWARD').
xc_monotonicity(a65b12506e9505,':DEFAULT').
xc_creator(a65b12506e9505,'OKeefe').
xc_creation_date(a65b12506e9505,19980429).
x_implies(x_and(x_isa(V1,x_Earthquake),x_eventOccursAt(V1,V2),x_isa(V2,x_Country)),x_decreasesCausally(V1,x_EconomyFn(V2),x_economicStability)) :- x_cid(a65b12506e9506,V1,V2).
xc_microtheory(a65b12506e9506,x_HPKBCrisisMt).
xc_source_file(a65b12506e9506,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9506,19141).
xc_kb_names(a65b12506e9506,["?QUAKE","?COUNTRY"]).
xc_mapping_rows(a65b12506e9506,['implication-implies']).
xc_direction(a65b12506e9506,':BACKWARD').
xc_monotonicity(a65b12506e9506,':DEFAULT').
xc_creator(a65b12506e9506,'OKeefe').
xc_creation_date(a65b12506e9506,19980429).
x_sharedNotes(x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-CSS8'),x_NoteAbout81Rules) :- x_cid(a65b12506e9507).
xc_microtheory(a65b12506e9507,x_HPKBCrisisMt).
xc_source_file(a65b12506e9507,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9507,19153).
xc_kb_names(a65b12506e9507,[]).
xc_mapping_rows(a65b12506e9507,[]).
xc_direction(a65b12506e9507,':FORWARD').
xc_monotonicity(a65b12506e9507,':DEFAULT').
xc_creator(a65b12506e9507,'Rode').
xc_creation_date(a65b12506e9507,19980428).
x_sharedNotes(x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-Mushak120'),x_NoteAbout81Rules) :- x_cid(a65b12506e9508).
xc_microtheory(a65b12506e9508,x_HPKBCrisisMt).
xc_source_file(a65b12506e9508,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9508,19160).
xc_kb_names(a65b12506e9508,[]).
xc_mapping_rows(a65b12506e9508,[]).
xc_direction(a65b12506e9508,':FORWARD').
xc_monotonicity(a65b12506e9508,':DEFAULT').
xc_creator(a65b12506e9508,'Rode').
xc_creation_date(a65b12506e9508,19980428).
x_sharedNotes(x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-Mushak160'),x_NoteAbout81Rules) :- x_cid(a65b12506e9509).
xc_microtheory(a65b12506e9509,x_HPKBCrisisMt).
xc_source_file(a65b12506e9509,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9509,19167).
xc_kb_names(a65b12506e9509,[]).
xc_mapping_rows(a65b12506e9509,[]).
xc_direction(a65b12506e9509,':FORWARD').
xc_monotonicity(a65b12506e9509,':DEFAULT').
xc_creator(a65b12506e9509,'Rode').
xc_creation_date(a65b12506e9509,19980428).
x_sharedNotes(x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-Mushak200'),x_NoteAbout81Rules) :- x_cid(a65b12506e950a).
xc_microtheory(a65b12506e950a,x_HPKBCrisisMt).
xc_source_file(a65b12506e950a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e950a,19174).
xc_kb_names(a65b12506e950a,[]).
xc_mapping_rows(a65b12506e950a,[]).
xc_direction(a65b12506e950a,':FORWARD').
xc_monotonicity(a65b12506e950a,':DEFAULT').
xc_creator(a65b12506e950a,'Rode').
xc_creation_date(a65b12506e950a,19980428).
x_sharedNotes(x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-SCUDC'),x_NoteAbout81Rules) :- x_cid(a65b12506e950b).
xc_microtheory(a65b12506e950b,x_HPKBCrisisMt).
xc_source_file(a65b12506e950b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e950b,19181).
xc_kb_names(a65b12506e950b,[]).
xc_mapping_rows(a65b12506e950b,[]).
xc_direction(a65b12506e950b,':FORWARD').
xc_monotonicity(a65b12506e950b,':DEFAULT').
xc_creator(a65b12506e950b,'Rode').
xc_creation_date(a65b12506e950b,19980428).
x_sharedNotes(x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-SCUDB'),x_NoteAbout81Rules) :- x_cid(a65b12506e950c).
xc_microtheory(a65b12506e950c,x_HPKBCrisisMt).
xc_source_file(a65b12506e950c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e950c,19188).
xc_kb_names(a65b12506e950c,[]).
xc_mapping_rows(a65b12506e950c,[]).
xc_direction(a65b12506e950c,':FORWARD').
xc_monotonicity(a65b12506e950c,':DEFAULT').
xc_creator(a65b12506e950c,'Rode').
xc_creation_date(a65b12506e950c,19980428).
x_sharedNotes(x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-CSS8'),x_NoteAbout80Rules) :- x_cid(a65b12506e950d).
xc_microtheory(a65b12506e950d,x_HPKBCrisisMt).
xc_source_file(a65b12506e950d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e950d,19195).
xc_kb_names(a65b12506e950d,[]).
xc_mapping_rows(a65b12506e950d,[]).
xc_direction(a65b12506e950d,':FORWARD').
xc_monotonicity(a65b12506e950d,':DEFAULT').
xc_creator(a65b12506e950d,'Rode').
xc_creation_date(a65b12506e950d,19980428).
x_sharedNotes(x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-Mushak120'),x_NoteAbout80Rules) :- x_cid(a65b12506e950e).
xc_microtheory(a65b12506e950e,x_HPKBCrisisMt).
xc_source_file(a65b12506e950e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e950e,19202).
xc_kb_names(a65b12506e950e,[]).
xc_mapping_rows(a65b12506e950e,[]).
xc_direction(a65b12506e950e,':FORWARD').
xc_monotonicity(a65b12506e950e,':DEFAULT').
xc_creator(a65b12506e950e,'Rode').
xc_creation_date(a65b12506e950e,19980428).
x_sharedNotes(x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-Mushak160'),x_NoteAbout80Rules) :- x_cid(a65b12506e950f).
xc_microtheory(a65b12506e950f,x_HPKBCrisisMt).
xc_source_file(a65b12506e950f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e950f,19209).
xc_kb_names(a65b12506e950f,[]).
xc_mapping_rows(a65b12506e950f,[]).
xc_direction(a65b12506e950f,':FORWARD').
xc_monotonicity(a65b12506e950f,':DEFAULT').
xc_creator(a65b12506e950f,'Rode').
xc_creation_date(a65b12506e950f,19980428).
x_sharedNotes(x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-Mushak200'),x_NoteAbout80Rules) :- x_cid(a65b12506e9510).
xc_microtheory(a65b12506e9510,x_HPKBCrisisMt).
xc_source_file(a65b12506e9510,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9510,19216).
xc_kb_names(a65b12506e9510,[]).
xc_mapping_rows(a65b12506e9510,[]).
xc_direction(a65b12506e9510,':FORWARD').
xc_monotonicity(a65b12506e9510,':DEFAULT').
xc_creator(a65b12506e9510,'Rode').
xc_creation_date(a65b12506e9510,19980428).
x_sharedNotes(x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-SCUDC'),x_NoteAbout80Rules) :- x_cid(a65b12506e9511).
xc_microtheory(a65b12506e9511,x_HPKBCrisisMt).
xc_source_file(a65b12506e9511,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9511,19223).
xc_kb_names(a65b12506e9511,[]).
xc_mapping_rows(a65b12506e9511,[]).
xc_direction(a65b12506e9511,':FORWARD').
xc_monotonicity(a65b12506e9511,':DEFAULT').
xc_creator(a65b12506e9511,'Rode').
xc_creation_date(a65b12506e9511,19980428).
x_sharedNotes(x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-SCUDB'),x_NoteAbout80Rules) :- x_cid(a65b12506e9512).
xc_microtheory(a65b12506e9512,x_HPKBCrisisMt).
xc_source_file(a65b12506e9512,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9512,19230).
xc_kb_names(a65b12506e9512,[]).
xc_mapping_rows(a65b12506e9512,[]).
xc_direction(a65b12506e9512,':FORWARD').
xc_monotonicity(a65b12506e9512,':DEFAULT').
xc_creator(a65b12506e9512,'Rode').
xc_creation_date(a65b12506e9512,19980428).
x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-CSS8') :- x_cid(a65b12506e9513).
xc_microtheory(a65b12506e9513,x_HPKBCrisisMt).
xc_source_file(a65b12506e9513,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9513,19237).
xc_kb_names(a65b12506e9513,[]).
xc_mapping_rows(a65b12506e9513,[]).
xc_direction(a65b12506e9513,':FORWARD').
xc_monotonicity(a65b12506e9513,':MONOTONIC').
xc_creator(a65b12506e9513,'Rode').
xc_creation_date(a65b12506e9513,19980428).
x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-Mushak120') :- x_cid(a65b12506e9514).
xc_microtheory(a65b12506e9514,x_HPKBCrisisMt).
xc_source_file(a65b12506e9514,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9514,19243).
xc_kb_names(a65b12506e9514,[]).
xc_mapping_rows(a65b12506e9514,[]).
xc_direction(a65b12506e9514,':FORWARD').
xc_monotonicity(a65b12506e9514,':MONOTONIC').
xc_creator(a65b12506e9514,'Rode').
xc_creation_date(a65b12506e9514,19980428).
x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-Mushak160') :- x_cid(a65b12506e9515).
xc_microtheory(a65b12506e9515,x_HPKBCrisisMt).
xc_source_file(a65b12506e9515,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9515,19249).
xc_kb_names(a65b12506e9515,[]).
xc_mapping_rows(a65b12506e9515,[]).
xc_direction(a65b12506e9515,':FORWARD').
xc_monotonicity(a65b12506e9515,':MONOTONIC').
xc_creator(a65b12506e9515,'Rode').
xc_creation_date(a65b12506e9515,19980428).
x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-Mushak200') :- x_cid(a65b12506e9516).
xc_microtheory(a65b12506e9516,x_HPKBCrisisMt).
xc_source_file(a65b12506e9516,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9516,19255).
xc_kb_names(a65b12506e9516,[]).
xc_mapping_rows(a65b12506e9516,[]).
xc_direction(a65b12506e9516,':FORWARD').
xc_monotonicity(a65b12506e9516,':MONOTONIC').
xc_creator(a65b12506e9516,'Rode').
xc_creation_date(a65b12506e9516,19980428).
x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-SCUDC') :- x_cid(a65b12506e9517).
xc_microtheory(a65b12506e9517,x_HPKBCrisisMt).
xc_source_file(a65b12506e9517,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9517,19261).
xc_kb_names(a65b12506e9517,[]).
xc_mapping_rows(a65b12506e9517,[]).
xc_direction(a65b12506e9517,':FORWARD').
xc_monotonicity(a65b12506e9517,':MONOTONIC').
xc_creator(a65b12506e9517,'Rode').
xc_creation_date(a65b12506e9517,19980428).
x_relationInstanceExistsMany(x_possesses,x_Iran,'x_BallisticMissile-SCUDB') :- x_cid(a65b12506e9518).
xc_microtheory(a65b12506e9518,x_HPKBCrisisMt).
xc_source_file(a65b12506e9518,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9518,19267).
xc_kb_names(a65b12506e9518,[]).
xc_mapping_rows(a65b12506e9518,[]).
xc_direction(a65b12506e9518,':FORWARD').
xc_monotonicity(a65b12506e9518,':MONOTONIC').
xc_creator(a65b12506e9518,'Rode').
xc_creation_date(a65b12506e9518,19980428).
x_opponents(x_Qatar,x_Iran) :- x_cid(a65b12506e9519).
xc_microtheory(a65b12506e9519,x_HPKBCrisisMt).
xc_source_file(a65b12506e9519,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9519,19273).
xc_kb_names(a65b12506e9519,[]).
xc_mapping_rows(a65b12506e9519,[]).
xc_direction(a65b12506e9519,':FORWARD').
xc_monotonicity(a65b12506e9519,':DEFAULT').
x_opponents(x_Bahrain,x_Iran) :- x_cid(a65b12506e951a).
xc_microtheory(a65b12506e951a,x_HPKBCrisisMt).
xc_source_file(a65b12506e951a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e951a,19279).
xc_kb_names(a65b12506e951a,[]).
xc_mapping_rows(a65b12506e951a,[]).
xc_direction(a65b12506e951a,':FORWARD').
xc_monotonicity(a65b12506e951a,':DEFAULT').
x_opponents(x_Oman,x_Iran) :- x_cid(a65b12506e951b).
xc_microtheory(a65b12506e951b,x_HPKBCrisisMt).
xc_source_file(a65b12506e951b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e951b,19285).
xc_kb_names(a65b12506e951b,[]).
xc_mapping_rows(a65b12506e951b,[]).
xc_direction(a65b12506e951b,':FORWARD').
xc_monotonicity(a65b12506e951b,':DEFAULT').
x_opponents(x_Kuwait,x_Iran) :- x_cid(a65b12506e951c).
xc_microtheory(a65b12506e951c,x_HPKBCrisisMt).
xc_source_file(a65b12506e951c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e951c,19291).
xc_kb_names(a65b12506e951c,[]).
xc_mapping_rows(a65b12506e951c,[]).
xc_direction(a65b12506e951c,':FORWARD').
xc_monotonicity(a65b12506e951c,':DEFAULT').
x_opponents(x_UnitedArabEmirates,x_Iran) :- x_cid(a65b12506e951d).
xc_microtheory(a65b12506e951d,x_HPKBCrisisMt).
xc_source_file(a65b12506e951d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e951d,19297).
xc_kb_names(a65b12506e951d,[]).
xc_mapping_rows(a65b12506e951d,[]).
xc_direction(a65b12506e951d,':FORWARD').
xc_monotonicity(a65b12506e951d,':DEFAULT').
x_exceptWhen(x_deliberateActors(V1,V2),x_implies(x_and(x_isa(V1,x_TerroristAct),x_isa(V2,x_Country),x_objectActedOn(V1,V3),x_inRegion(V3,V2)),x_maleficiary(V1,V2))) :- x_cid(a65b12506e951e,V1,V2,V3).
xc_microtheory(a65b12506e951e,x_HPKBCrisisMt).
xc_source_file(a65b12506e951e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e951e,19303).
xc_kb_names(a65b12506e951e,["?ATTACK","?COUNTRY","?OBJ"]).
xc_mapping_rows(a65b12506e951e,['implication-implies']).
xc_direction(a65b12506e951e,':FORWARD').
xc_monotonicity(a65b12506e951e,':DEFAULT').
xc_creator(a65b12506e951e,'ABelasco').
xc_creation_date(a65b12506e951e,19980424).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_performedBy(V1,V2),x_victim(V1,V3)),x_promotesRisk(V1,V2,x_AttackOnTangible,x_victim)) :- x_cid(a65b12506e951f,V1,V2,V3).
xc_microtheory(a65b12506e951f,x_HPKBCrisisMt).
xc_source_file(a65b12506e951f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e951f,19317).
xc_kb_names(a65b12506e951f,["?ATTACK01","?AG","?VIC"]).
xc_mapping_rows(a65b12506e951f,['implication-implies']).
xc_direction(a65b12506e951f,':BACKWARD').
xc_monotonicity(a65b12506e951f,':DEFAULT').
xc_creator(a65b12506e951f,'OKeefe').
xc_creation_date(a65b12506e951f,19971113).
x_implies(x_and(x_isa(V1,'x_MilitaryOperation-Joint'),x_performedBy(V1,V2),x_isa(V2,x_InternationalOrganizationOfCountries),x_groupMembers(V2,V3)),x_performedBy(V1,V3)) :- x_cid(a65b12506e9520,V1,V2,V3).
xc_microtheory(a65b12506e9520,x_HPKBCrisisMt).
xc_source_file(a65b12506e9520,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9520,19328).
xc_kb_names(a65b12506e9520,["?EFFORT","?GROUP","?MEMS"]).
xc_mapping_rows(a65b12506e9520,['implication-implies']).
xc_direction(a65b12506e9520,':BACKWARD').
xc_monotonicity(a65b12506e9520,':DEFAULT').
xc_creator(a65b12506e9520,'Nichols').
xc_creation_date(a65b12506e9520,19971119).
x_exceptWhen(x_deliberateActors(V1,V2),x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_objectActedOn(V1,V3),x_owns(V2,V3)),x_maleficiary(V1,V2))) :- x_cid(a65b12506e9521,V1,V2,V3).
xc_microtheory(a65b12506e9521,x_HPKBCrisisMt).
xc_source_file(a65b12506e9521,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9521,19340).
xc_kb_names(a65b12506e9521,["?ATTACK","?AGT","?OBJ"]).
xc_mapping_rows(a65b12506e9521,['implication-implies']).
xc_direction(a65b12506e9521,':BACKWARD').
xc_monotonicity(a65b12506e9521,':DEFAULT').
xc_creator(a65b12506e9521,'OKeefe').
xc_creation_date(a65b12506e9521,19980421).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_objectActedOn(V1,V2),x_owns(V3,V2)),x_maleficiary(V1,V3)) :- x_cid(a65b12506e9522,V1,V2,V3).
xc_microtheory(a65b12506e9522,x_HPKBCrisisMt).
xc_source_file(a65b12506e9522,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9522,19353).
xc_kb_names(a65b12506e9522,["?ATTACK","?OBJ","?AGT"]).
xc_mapping_rows(a65b12506e9522,['implication-implies']).
xc_direction(a65b12506e9522,':BACKWARD').
xc_monotonicity(a65b12506e9522,':DEFAULT').
xc_creator(a65b12506e9522,'OKeefe').
xc_creation_date(a65b12506e9522,19980421).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_deliberateActors(V1,V2),x_isa(V2,x_Country),x_eventOccursAt(V1,V3),x_different(V4,V2),x_inRegion(V3,V4),x_isa(V4,x_Country)),x_maleficiary(V1,V4)) :- x_cid(a65b12506e9523,V1,V2,V3,V4).
xc_microtheory(a65b12506e9523,x_HPKBCrisisMt).
xc_source_file(a65b12506e9523,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9523,19364).
xc_kb_names(a65b12506e9523,["?ATTACK","?COUNTRY2","?AREA","?COUNTRY1"]).
xc_mapping_rows(a65b12506e9523,['implication-implies']).
xc_direction(a65b12506e9523,':BACKWARD').
xc_monotonicity(a65b12506e9523,':DEFAULT').
xc_creator(a65b12506e9523,'OKeefe').
xc_creation_date(a65b12506e9523,19980421).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_deliberateActors(V1,V2),x_isa(V2,x_Country),x_objectActedOn(V1,V3),x_different(V4,V2),x_inRegion(V3,V4),x_isa(V4,x_Country)),x_maleficiary(V1,V4)) :- x_cid(a65b12506e9524,V1,V2,V3,V4).
xc_microtheory(a65b12506e9524,x_HPKBCrisisMt).
xc_source_file(a65b12506e9524,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9524,19379).
xc_kb_names(a65b12506e9524,["?ATTACK","?COUNTRY2","?OBJ","?COUNTRY1"]).
xc_mapping_rows(a65b12506e9524,['implication-implies']).
xc_direction(a65b12506e9524,':BACKWARD').
xc_monotonicity(a65b12506e9524,':DEFAULT').
xc_creator(a65b12506e9524,'OKeefe').
xc_creation_date(a65b12506e9524,19980421).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_deliberateActors(V1,V2),x_isa(V2,x_Country),x_eventOccursAt(V1,V3),x_different(V4,V2),x_geographicalSubRegions(V4,V3),x_isa(V4,x_Country)),x_maleficiary(V1,V4)) :- x_cid(a65b12506e9525,V1,V2,V3,V4).
xc_microtheory(a65b12506e9525,x_HPKBCrisisMt).
xc_source_file(a65b12506e9525,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9525,19394).
xc_kb_names(a65b12506e9525,["?ATTACK","?COUNTRY2","?AREA","?COUNTRY1"]).
xc_mapping_rows(a65b12506e9525,['implication-implies']).
xc_direction(a65b12506e9525,':BACKWARD').
xc_monotonicity(a65b12506e9525,':DEFAULT').
xc_creator(a65b12506e9525,'OKeefe').
xc_creation_date(a65b12506e9525,19980421).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_different(V1,V2),x_geographicalSubRegions(V1,V2),x_eventOccursAt(V3,V2)),x_eventOccursAt(V3,V1)) :- x_cid(a65b12506e9526,V1,V2,V3).
xc_microtheory(a65b12506e9526,x_HPKBCrisisMt).
xc_source_file(a65b12506e9526,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9526,19409).
xc_kb_names(a65b12506e9526,["?COUNTRY","?REGION","?EVENT"]).
xc_mapping_rows(a65b12506e9526,['implication-implies']).
xc_direction(a65b12506e9526,':BACKWARD').
xc_monotonicity(a65b12506e9526,':DEFAULT').
xc_creator(a65b12506e9526,'Pittman').
xc_creation_date(a65b12506e9526,19980417).
x_eventOccursAt(x_MurderOfRezaMazlouman,x_France) :- x_cid(a65b12506e9527).
xc_microtheory(a65b12506e9527,x_HPKBCrisisMt).
xc_source_file(a65b12506e9527,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9527,19421).
xc_kb_names(a65b12506e9527,[]).
xc_mapping_rows(a65b12506e9527,[]).
xc_direction(a65b12506e9527,':FORWARD').
xc_monotonicity(a65b12506e9527,':DEFAULT').
x_eventOccursAt(x_KillingAtMykonosRestaurant,x_Germany) :- x_cid(a65b12506e9528).
xc_microtheory(a65b12506e9528,x_HPKBCrisisMt).
xc_source_file(a65b12506e9528,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9528,19427).
xc_kb_names(a65b12506e9528,[]).
xc_mapping_rows(a65b12506e9528,[]).
xc_direction(a65b12506e9528,':FORWARD').
xc_monotonicity(a65b12506e9528,':DEFAULT').
x_eventOccursAt(x_LomaPrietaEarthquake,x_UnitedStatesOfAmerica) :- x_cid(a65b12506e9529).
xc_microtheory(a65b12506e9529,x_HPKBCrisisMt).
xc_source_file(a65b12506e9529,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9529,19433).
xc_kb_names(a65b12506e9529,[]).
xc_mapping_rows(a65b12506e9529,[]).
xc_direction(a65b12506e9529,':FORWARD').
xc_monotonicity(a65b12506e9529,':DEFAULT').
x_eventOccursAt(x_AssassinationOfPresidentLincoln,x_UnitedStatesOfAmerica) :- x_cid(a65b12506e952a).
xc_microtheory(a65b12506e952a,x_HPKBCrisisMt).
xc_source_file(a65b12506e952a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e952a,19439).
xc_kb_names(a65b12506e952a,[]).
xc_mapping_rows(a65b12506e952a,[]).
xc_direction(a65b12506e952a,':FORWARD').
xc_monotonicity(a65b12506e952a,':DEFAULT').
x_eventOccursAt('x_GettysburgAddress-Speech',x_UnitedStatesOfAmerica) :- x_cid(a65b12506e952b).
xc_microtheory(a65b12506e952b,x_HPKBCrisisMt).
xc_source_file(a65b12506e952b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e952b,19445).
xc_kb_names(a65b12506e952b,[]).
xc_mapping_rows(a65b12506e952b,[]).
xc_direction(a65b12506e952b,':FORWARD').
xc_monotonicity(a65b12506e952b,':DEFAULT').
x_titleOfSeries('x_KuwaitTimes-TheNewspaper',"The Kuwait Times") :- x_cid(a65b12506e952c).
xc_microtheory(a65b12506e952c,x_HPKBCrisisMt).
xc_source_file(a65b12506e952c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e952c,19451).
xc_kb_names(a65b12506e952c,[]).
xc_mapping_rows(a65b12506e952c,[]).
xc_direction(a65b12506e952c,':FORWARD').
xc_monotonicity(a65b12506e952c,':DEFAULT').
xc_creator(a65b12506e952c,'ABelasco').
xc_creation_date(a65b12506e952c,19980416).
x_genls('x_KuwaitTimes-TheNewspaper',x_Newspaper) :- x_cid(a65b12506e952d).
xc_microtheory(a65b12506e952d,x_HPKBCrisisMt).
xc_source_file(a65b12506e952d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e952d,19457).
xc_kb_names(a65b12506e952d,[]).
xc_mapping_rows(a65b12506e952d,[]).
xc_direction(a65b12506e952d,':FORWARD').
xc_monotonicity(a65b12506e952d,':MONOTONIC').
xc_creator(a65b12506e952d,'ABelasco').
xc_creation_date(a65b12506e952d,19980416).
x_genls('x_KuwaitTimes-TheNewspaper',x_MediaProduct) :- x_cid(a65b12506e952e).
xc_microtheory(a65b12506e952e,x_HPKBCrisisMt).
xc_source_file(a65b12506e952e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e952e,19463).
xc_kb_names(a65b12506e952e,[]).
xc_mapping_rows(a65b12506e952e,[]).
xc_direction(a65b12506e952e,':FORWARD').
xc_monotonicity(a65b12506e952e,':MONOTONIC').
x_isa('x_KuwaitTimes-TheNewspaper',x_MediaSeriesProductType) :- x_cid(a65b12506e952f).
xc_microtheory(a65b12506e952f,x_HPKBCrisisMt).
xc_source_file(a65b12506e952f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e952f,19469).
xc_kb_names(a65b12506e952f,[]).
xc_mapping_rows(a65b12506e952f,[]).
xc_direction(a65b12506e952f,':FORWARD').
xc_monotonicity(a65b12506e952f,':MONOTONIC').
xc_creator(a65b12506e952f,'ABelasco').
xc_creation_date(a65b12506e952f,19980416).
x_actionViolatesObligation('x_TakingAmericanHostages-1979',x_ModernInternationalRelationsCOC) :- x_cid(a65b12506e9530).
xc_microtheory(a65b12506e9530,x_HPKBCrisisMt).
xc_source_file(a65b12506e9530,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9530,19475).
xc_kb_names(a65b12506e9530,[]).
xc_mapping_rows(a65b12506e9530,[]).
xc_direction(a65b12506e9530,':FORWARD').
xc_monotonicity(a65b12506e9530,':DEFAULT').
x_actionViolatesObligation('x_TakingAmericanHostages-1979','x_InternationalNorm-DontTakeHostages') :- x_cid(a65b12506e9531).
xc_microtheory(a65b12506e9531,x_HPKBCrisisMt).
xc_source_file(a65b12506e9531,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9531,19481).
xc_kb_names(a65b12506e9531,[]).
xc_mapping_rows(a65b12506e9531,[]).
xc_direction(a65b12506e9531,':FORWARD').
xc_monotonicity(a65b12506e9531,':DEFAULT').
x_exceptWhen(x_and(x_actionViolatesObligation(V1,V2),x_obligationParts(V3,V2)),x_implies(x_and(x_obligationParts(V3,V4),x_actionFulfillsObligation(V1,V4)),x_actionFulfillsObligation(V1,V3))) :- x_cid(a65b12506e9532,V1,V2,V3,V4).
xc_microtheory(a65b12506e9532,x_HPKBCrisisMt).
xc_source_file(a65b12506e9532,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9532,19487).
xc_kb_names(a65b12506e9532,["?ACT","?OB2","?WIDECOC","?OB1"]).
xc_mapping_rows(a65b12506e9532,['implication-implies']).
xc_direction(a65b12506e9532,':BACKWARD').
xc_monotonicity(a65b12506e9532,':DEFAULT').
xc_creator(a65b12506e9532,'OKeefe').
xc_creation_date(a65b12506e9532,19980416).
x_implies(x_and(x_actionFulfillsObligation(V1,V2),x_obligationParts(V3,V2)),x_actionFulfillsObligation(V1,V3)) :- x_cid(a65b12506e9533,V1,V2,V3).
xc_microtheory(a65b12506e9533,x_HPKBCrisisMt).
xc_source_file(a65b12506e9533,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9533,19501).
xc_kb_names(a65b12506e9533,["?ACT","?OB1","?WIDECOC"]).
xc_mapping_rows(a65b12506e9533,['implication-implies']).
xc_direction(a65b12506e9533,':BACKWARD').
xc_monotonicity(a65b12506e9533,':DEFAULT').
xc_creator(a65b12506e9533,'OKeefe').
xc_creation_date(a65b12506e9533,19980416).
x_implies(x_and(x_isa(V1,x_TerroristGroup),x_isa(V2,x_EconomicSupport),x_givesSupportToAgent(V3,V1,V2)),x_agentViolatesObligation(V3,'x_InternationalNorm-DontSupportTerrorism')) :- x_cid(a65b12506e9534,V1,V2,V3).
xc_microtheory(a65b12506e9534,x_HPKBCrisisMt).
xc_source_file(a65b12506e9534,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9534,19511).
xc_kb_names(a65b12506e9534,["?TERR-GR","?TYPE","?AGT"]).
xc_mapping_rows(a65b12506e9534,['implication-implies']).
xc_direction(a65b12506e9534,':BACKWARD').
xc_monotonicity(a65b12506e9534,':DEFAULT').
xc_creator(a65b12506e9534,'OKeefe').
xc_creation_date(a65b12506e9534,19980414).
x_implies(x_and(x_isa(V1,x_TerroristGroup),x_isa(V2,x_MilitarySupport),x_givesSupportToAgent(V3,V1,V2)),x_agentViolatesObligation(V3,'x_InternationalNorm-DontSupportTerrorism')) :- x_cid(a65b12506e9535,V1,V2,V3).
xc_microtheory(a65b12506e9535,x_HPKBCrisisMt).
xc_source_file(a65b12506e9535,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9535,19522).
xc_kb_names(a65b12506e9535,["?TERR-GR","?TYPE","?AGT"]).
xc_mapping_rows(a65b12506e9535,['implication-implies']).
xc_direction(a65b12506e9535,':BACKWARD').
xc_monotonicity(a65b12506e9535,':DEFAULT').
xc_creator(a65b12506e9535,'OKeefe').
xc_creation_date(a65b12506e9535,19980414).
x_implies(x_and(x_isa(V1,x_HoldingHostages),x_performedBy(V1,V2),x_isa(V2,x_InternationalOrganization)),x_beliefs(x_InternationalCommunity,x_performedBy(V1,V2))) :- x_cid(a65b12506e9536,V1,V2).
xc_microtheory(a65b12506e9536,x_HPKBCrisisMt).
xc_source_file(a65b12506e9536,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9536,19533).
xc_kb_names(a65b12506e9536,["?HOSTAGE","?COUNTRY-ORG"]).
xc_mapping_rows(a65b12506e9536,['implication-implies']).
xc_direction(a65b12506e9536,':FORWARD').
xc_monotonicity(a65b12506e9536,':DEFAULT').
xc_creator(a65b12506e9536,'OKeefe').
xc_creation_date(a65b12506e9536,19980414).
x_implies(x_and(x_isa(V1,x_HoldingHostages),x_performedBy(V1,V2),x_isa(V2,x_Country)),x_beliefs(x_InternationalCommunity,x_performedBy(V1,V2))) :- x_cid(a65b12506e9537,V1,V2).
xc_microtheory(a65b12506e9537,x_HPKBCrisisMt).
xc_source_file(a65b12506e9537,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9537,19545).
xc_kb_names(a65b12506e9537,["?HOSTAGE","?COUNTRY-ORG"]).
xc_mapping_rows(a65b12506e9537,['implication-implies']).
xc_direction(a65b12506e9537,':FORWARD').
xc_monotonicity(a65b12506e9537,':DEFAULT').
xc_creator(a65b12506e9537,'OKeefe').
xc_creation_date(a65b12506e9537,19980414).
x_typeBehaviorCapable(x_TextileProduct,x_TransportViaFn(x_Ship),x_transportees) :- x_cid(a65b12506e9538).
xc_microtheory(a65b12506e9538,x_HPKBCrisisMt).
xc_source_file(a65b12506e9538,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9538,19557).
xc_kb_names(a65b12506e9538,[]).
xc_mapping_rows(a65b12506e9538,[]).
xc_direction(a65b12506e9538,':FORWARD').
xc_monotonicity(a65b12506e9538,':DEFAULT').
xc_creator(a65b12506e9538,'ABelasco').
xc_creation_date(a65b12506e9538,19980410).
x_typeBehaviorCapable(x_Food,x_TransportViaFn(x_Ship),x_transportees) :- x_cid(a65b12506e9539).
xc_microtheory(a65b12506e9539,x_HPKBCrisisMt).
xc_source_file(a65b12506e9539,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9539,19564).
xc_kb_names(a65b12506e9539,[]).
xc_mapping_rows(a65b12506e9539,[]).
xc_direction(a65b12506e9539,':FORWARD').
xc_monotonicity(a65b12506e9539,':DEFAULT').
xc_creator(a65b12506e9539,'ABelasco').
xc_creation_date(a65b12506e9539,19980410).
x_typeBehaviorCapable(x_MechanicalDevice,x_TransportViaFn(x_Ship),x_transportees) :- x_cid(a65b12506e953a).
xc_microtheory(a65b12506e953a,x_HPKBCrisisMt).
xc_source_file(a65b12506e953a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e953a,19571).
xc_kb_names(a65b12506e953a,[]).
xc_mapping_rows(a65b12506e953a,[]).
xc_direction(a65b12506e953a,':FORWARD').
xc_monotonicity(a65b12506e953a,':DEFAULT').
xc_creator(a65b12506e953a,'ABelasco').
xc_creation_date(a65b12506e953a,19980410).
x_importsThrough(x_Brazil,x_PetroleumProduct,x_StraitOfHormuz) :- x_cid(a65b12506e953b).
xc_microtheory(a65b12506e953b,x_HPKBCrisisMt).
xc_source_file(a65b12506e953b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e953b,19578).
xc_kb_names(a65b12506e953b,[]).
xc_mapping_rows(a65b12506e953b,[]).
xc_direction(a65b12506e953b,':FORWARD').
xc_monotonicity(a65b12506e953b,':DEFAULT').
xc_creator(a65b12506e953b,'ABelasco').
xc_creation_date(a65b12506e953b,19980409).
x_importsThrough(x_Canada,x_PetroleumProduct,x_StraitOfHormuz) :- x_cid(a65b12506e953c).
xc_microtheory(a65b12506e953c,x_HPKBCrisisMt).
xc_source_file(a65b12506e953c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e953c,19584).
xc_kb_names(a65b12506e953c,[]).
xc_mapping_rows(a65b12506e953c,[]).
xc_direction(a65b12506e953c,':FORWARD').
xc_monotonicity(a65b12506e953c,':DEFAULT').
xc_creator(a65b12506e953c,'ABelasco').
xc_creation_date(a65b12506e953c,19980409).
x_importsThrough(x_UnitedStatesOfAmerica,x_PetroleumProduct,x_StraitOfHormuz) :- x_cid(a65b12506e953d).
xc_microtheory(a65b12506e953d,x_HPKBCrisisMt).
xc_source_file(a65b12506e953d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e953d,19590).
xc_kb_names(a65b12506e953d,[]).
xc_mapping_rows(a65b12506e953d,[]).
xc_direction(a65b12506e953d,':FORWARD').
xc_monotonicity(a65b12506e953d,':DEFAULT').
xc_creator(a65b12506e953d,'ABelasco').
xc_creation_date(a65b12506e953d,19980409).
x_implies(x_and(x_isa(V1,x_HoldingHostages),x_objectActedOn(V1,V2),x_performedBy(V1,V3),x_citizens(V4,V2),x_hasAgents(x_GovernmentFn(V5),V3),x_different(V5,V4),x_isa(V5,x_Country)),x_knowsAbout(x_InternationalCommunity,V1)) :- x_cid(a65b12506e953e,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e953e,x_HPKBCrisisMt).
xc_source_file(a65b12506e953e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e953e,19596).
xc_kb_names(a65b12506e953e,["?TH","?PERS","?AGT","?COUNTRY-1","?COUNTRY"]).
xc_mapping_rows(a65b12506e953e,['implication-implies']).
xc_direction(a65b12506e953e,':BACKWARD').
xc_monotonicity(a65b12506e953e,':DEFAULT').
xc_creator(a65b12506e953e,'Nichols').
xc_creation_date(a65b12506e953e,19980408).
x_implies(x_and(x_isa(V1,x_HoldingHostages),x_objectActedOn(V1,V2),x_performedBy(V1,V3),x_citizens(V4,V2),x_hasAgents(x_GovernmentFn(V5),V3),x_different(V5,V4),x_isa(V5,x_Country)),x_actionViolatesObligation(V1,x_ModernInternationalRelationsCOC)) :- x_cid(a65b12506e953f,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e953f,x_HPKBCrisisMt).
xc_source_file(a65b12506e953f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e953f,19612).
xc_kb_names(a65b12506e953f,["?TH","?PERS","?AGT","?COUNTRY-1","?COUNTRY"]).
xc_mapping_rows(a65b12506e953f,['implication-implies']).
xc_direction(a65b12506e953f,':BACKWARD').
xc_monotonicity(a65b12506e953f,':DEFAULT').
xc_creator(a65b12506e953f,'Nichols').
xc_creation_date(a65b12506e953f,19980408).
x_implies(x_and(x_isa(V1,x_GeographicalRegion),x_considersAsEnemy(V2,V1),x_performedBy(V3,V2),x_successfulForAgents(V3,V2),x_isa(V3,x_BlockingTraffic),x_objectActedOn(V3,V4)),x_supplyThroughAmountDuring(V1,V5,V4,V3,x_None)) :- x_cid(a65b12506e9540,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9540,x_HPKBCrisisMt).
xc_source_file(a65b12506e9540,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9540,19628).
xc_kb_names(a65b12506e9540,["?ENEMY","?BLOCKER","?BLOCKING","?LOC","?PRODUCT"]).
xc_mapping_rows(a65b12506e9540,['implication-implies']).
xc_direction(a65b12506e9540,':BACKWARD').
xc_monotonicity(a65b12506e9540,':DEFAULT').
xc_creator(a65b12506e9540,'Davis').
xc_creation_date(a65b12506e9540,19980406).
x_implies(x_and(x_isa(V1,x_GeographicalRegion),x_considersAsEnemy(V2,V1),x_performedBy(V3,V2),x_successfulForAgents(V3,V2),x_isa(V3,x_BlockingTraffic),x_objectActedOn(V3,V4)),x_importThroughAmountDuring(V1,V5,V4,V3,x_None)) :- x_cid(a65b12506e9541,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9541,x_HPKBCrisisMt).
xc_source_file(a65b12506e9541,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9541,19642).
xc_kb_names(a65b12506e9541,["?ENEMY","?BLOCKER","?BLOCKING","?LOC","?PRODUCT"]).
xc_mapping_rows(a65b12506e9541,['implication-implies']).
xc_direction(a65b12506e9541,':BACKWARD').
xc_monotonicity(a65b12506e9541,':DEFAULT').
xc_creator(a65b12506e9541,'Davis').
xc_creation_date(a65b12506e9541,19980406).
x_groupMembers(x_DesertShieldCoalition,x_UnitedArabEmirates) :- x_cid(a65b12506e9542).
xc_microtheory(a65b12506e9542,x_HPKBCrisisMt).
xc_source_file(a65b12506e9542,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9542,19656).
xc_kb_names(a65b12506e9542,[]).
xc_mapping_rows(a65b12506e9542,[]).
xc_direction(a65b12506e9542,':FORWARD').
xc_monotonicity(a65b12506e9542,':DEFAULT').
xc_creator(a65b12506e9542,'MingXu').
xc_creation_date(a65b12506e9542,19980406).
x_considersAsEnemy(x_DesertShieldCoalition,x_Iraq) :- x_cid(a65b12506e9543).
xc_microtheory(a65b12506e9543,x_HPKBCrisisMt).
xc_source_file(a65b12506e9543,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9543,19662).
xc_kb_names(a65b12506e9543,[]).
xc_mapping_rows(a65b12506e9543,[]).
xc_direction(a65b12506e9543,':FORWARD').
xc_monotonicity(a65b12506e9543,':DEFAULT').
xc_creator(a65b12506e9543,'MingXu').
xc_creation_date(a65b12506e9543,19980327).
x_hasStatusWithAgent(x_CommitteeForDefenseOfLegitimateRights,x_SaudiArabia,x_DissidentStatus) :- x_cid(a65b12506e9544).
xc_microtheory(a65b12506e9544,x_HPKBCrisisMt).
xc_source_file(a65b12506e9544,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9544,19668).
xc_kb_names(a65b12506e9544,[]).
xc_mapping_rows(a65b12506e9544,[]).
xc_direction(a65b12506e9544,':FORWARD').
xc_monotonicity(a65b12506e9544,':DEFAULT').
xc_creator(a65b12506e9544,'ABelasco').
xc_creation_date(a65b12506e9544,19980326).
x_primaryFunction('x_HYP-BallisticMissile-Mushak160-17017033',x_TransportViaFn(x_AirTransportationDevice),x_transporter) :- x_cid(a65b12506e9545).
xc_microtheory(a65b12506e9545,x_HPKBCrisisMt).
xc_source_file(a65b12506e9545,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9545,19674).
xc_kb_names(a65b12506e9545,[]).
xc_mapping_rows(a65b12506e9545,[]).
xc_direction(a65b12506e9545,':FORWARD').
xc_monotonicity(a65b12506e9545,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-Mushak200-47497030',x_TransportViaFn(x_AirTransportationDevice),x_transporter) :- x_cid(a65b12506e9546).
xc_microtheory(a65b12506e9546,x_HPKBCrisisMt).
xc_source_file(a65b12506e9546,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9546,19681).
xc_kb_names(a65b12506e9546,[]).
xc_mapping_rows(a65b12506e9546,[]).
xc_direction(a65b12506e9546,':FORWARD').
xc_monotonicity(a65b12506e9546,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-M11-33553741',x_TransportViaFn(x_AirTransportationDevice),x_transporter) :- x_cid(a65b12506e9547).
xc_microtheory(a65b12506e9547,x_HPKBCrisisMt).
xc_source_file(a65b12506e9547,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9547,19688).
xc_kb_names(a65b12506e9547,[]).
xc_mapping_rows(a65b12506e9547,[]).
xc_direction(a65b12506e9547,':FORWARD').
xc_monotonicity(a65b12506e9547,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-CSS8-30837525',x_TransportViaFn(x_AirTransportationDevice),x_transporter) :- x_cid(a65b12506e9548).
xc_microtheory(a65b12506e9548,x_HPKBCrisisMt).
xc_source_file(a65b12506e9548,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9548,19695).
xc_kb_names(a65b12506e9548,[]).
xc_mapping_rows(a65b12506e9548,[]).
xc_direction(a65b12506e9548,':FORWARD').
xc_monotonicity(a65b12506e9548,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-SCUDB-1915224',x_TransportViaFn(x_AirTransportationDevice),x_transporter) :- x_cid(a65b12506e9549).
xc_microtheory(a65b12506e9549,x_HPKBCrisisMt).
xc_source_file(a65b12506e9549,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9549,19702).
xc_kb_names(a65b12506e9549,[]).
xc_mapping_rows(a65b12506e9549,[]).
xc_direction(a65b12506e9549,':FORWARD').
xc_monotonicity(a65b12506e9549,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-SCUDC-48505638',x_TransportViaFn(x_AirTransportationDevice),x_transporter) :- x_cid(a65b12506e954a).
xc_microtheory(a65b12506e954a,x_HPKBCrisisMt).
xc_source_file(a65b12506e954a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e954a,19709).
xc_kb_names(a65b12506e954a,[]).
xc_mapping_rows(a65b12506e954a,[]).
xc_direction(a65b12506e954a,':FORWARD').
xc_monotonicity(a65b12506e954a,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-Mushak120-15817564',x_TransportViaFn(x_AirTransportationDevice),x_transporter) :- x_cid(a65b12506e954b).
xc_microtheory(a65b12506e954b,x_HPKBCrisisMt).
xc_source_file(a65b12506e954b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e954b,19716).
xc_kb_names(a65b12506e954b,[]).
xc_mapping_rows(a65b12506e954b,[]).
xc_direction(a65b12506e954b,':FORWARD').
xc_monotonicity(a65b12506e954b,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-Mushak160-17017033',x_TransportViaFn(x_TransportationDevice),x_transporter) :- x_cid(a65b12506e954c).
xc_microtheory(a65b12506e954c,x_HPKBCrisisMt).
xc_source_file(a65b12506e954c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e954c,19723).
xc_kb_names(a65b12506e954c,[]).
xc_mapping_rows(a65b12506e954c,[]).
xc_direction(a65b12506e954c,':FORWARD').
xc_monotonicity(a65b12506e954c,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-Mushak200-47497030',x_TransportViaFn(x_TransportationDevice),x_transporter) :- x_cid(a65b12506e954d).
xc_microtheory(a65b12506e954d,x_HPKBCrisisMt).
xc_source_file(a65b12506e954d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e954d,19730).
xc_kb_names(a65b12506e954d,[]).
xc_mapping_rows(a65b12506e954d,[]).
xc_direction(a65b12506e954d,':FORWARD').
xc_monotonicity(a65b12506e954d,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-M11-33553741',x_TransportViaFn(x_TransportationDevice),x_transporter) :- x_cid(a65b12506e954e).
xc_microtheory(a65b12506e954e,x_HPKBCrisisMt).
xc_source_file(a65b12506e954e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e954e,19737).
xc_kb_names(a65b12506e954e,[]).
xc_mapping_rows(a65b12506e954e,[]).
xc_direction(a65b12506e954e,':FORWARD').
xc_monotonicity(a65b12506e954e,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-CSS8-30837525',x_TransportViaFn(x_TransportationDevice),x_transporter) :- x_cid(a65b12506e954f).
xc_microtheory(a65b12506e954f,x_HPKBCrisisMt).
xc_source_file(a65b12506e954f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e954f,19744).
xc_kb_names(a65b12506e954f,[]).
xc_mapping_rows(a65b12506e954f,[]).
xc_direction(a65b12506e954f,':FORWARD').
xc_monotonicity(a65b12506e954f,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-SCUDB-1915224',x_TransportViaFn(x_TransportationDevice),x_transporter) :- x_cid(a65b12506e9550).
xc_microtheory(a65b12506e9550,x_HPKBCrisisMt).
xc_source_file(a65b12506e9550,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9550,19751).
xc_kb_names(a65b12506e9550,[]).
xc_mapping_rows(a65b12506e9550,[]).
xc_direction(a65b12506e9550,':FORWARD').
xc_monotonicity(a65b12506e9550,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-SCUDC-48505638',x_TransportViaFn(x_TransportationDevice),x_transporter) :- x_cid(a65b12506e9551).
xc_microtheory(a65b12506e9551,x_HPKBCrisisMt).
xc_source_file(a65b12506e9551,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9551,19758).
xc_kb_names(a65b12506e9551,[]).
xc_mapping_rows(a65b12506e9551,[]).
xc_direction(a65b12506e9551,':FORWARD').
xc_monotonicity(a65b12506e9551,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-Mushak120-15817564',x_TransportViaFn(x_TransportationDevice),x_transporter) :- x_cid(a65b12506e9552).
xc_microtheory(a65b12506e9552,x_HPKBCrisisMt).
xc_source_file(a65b12506e9552,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9552,19765).
xc_kb_names(a65b12506e9552,[]).
xc_mapping_rows(a65b12506e9552,[]).
xc_direction(a65b12506e9552,':FORWARD').
xc_monotonicity(a65b12506e9552,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-Mushak160-17017033',x_TransportViaFn(x_UnmannedAircraft),x_transporter) :- x_cid(a65b12506e9553).
xc_microtheory(a65b12506e9553,x_HPKBCrisisMt).
xc_source_file(a65b12506e9553,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9553,19772).
xc_kb_names(a65b12506e9553,[]).
xc_mapping_rows(a65b12506e9553,[]).
xc_direction(a65b12506e9553,':FORWARD').
xc_monotonicity(a65b12506e9553,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-Mushak200-47497030',x_TransportViaFn(x_UnmannedAircraft),x_transporter) :- x_cid(a65b12506e9554).
xc_microtheory(a65b12506e9554,x_HPKBCrisisMt).
xc_source_file(a65b12506e9554,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9554,19779).
xc_kb_names(a65b12506e9554,[]).
xc_mapping_rows(a65b12506e9554,[]).
xc_direction(a65b12506e9554,':FORWARD').
xc_monotonicity(a65b12506e9554,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-M11-33553741',x_TransportViaFn(x_UnmannedAircraft),x_transporter) :- x_cid(a65b12506e9555).
xc_microtheory(a65b12506e9555,x_HPKBCrisisMt).
xc_source_file(a65b12506e9555,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9555,19786).
xc_kb_names(a65b12506e9555,[]).
xc_mapping_rows(a65b12506e9555,[]).
xc_direction(a65b12506e9555,':FORWARD').
xc_monotonicity(a65b12506e9555,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-CSS8-30837525',x_TransportViaFn(x_UnmannedAircraft),x_transporter) :- x_cid(a65b12506e9556).
xc_microtheory(a65b12506e9556,x_HPKBCrisisMt).
xc_source_file(a65b12506e9556,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9556,19793).
xc_kb_names(a65b12506e9556,[]).
xc_mapping_rows(a65b12506e9556,[]).
xc_direction(a65b12506e9556,':FORWARD').
xc_monotonicity(a65b12506e9556,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-SCUDB-1915224',x_TransportViaFn(x_UnmannedAircraft),x_transporter) :- x_cid(a65b12506e9557).
xc_microtheory(a65b12506e9557,x_HPKBCrisisMt).
xc_source_file(a65b12506e9557,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9557,19800).
xc_kb_names(a65b12506e9557,[]).
xc_mapping_rows(a65b12506e9557,[]).
xc_direction(a65b12506e9557,':FORWARD').
xc_monotonicity(a65b12506e9557,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-SCUDC-48505638',x_TransportViaFn(x_UnmannedAircraft),x_transporter) :- x_cid(a65b12506e9558).
xc_microtheory(a65b12506e9558,x_HPKBCrisisMt).
xc_source_file(a65b12506e9558,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9558,19807).
xc_kb_names(a65b12506e9558,[]).
xc_mapping_rows(a65b12506e9558,[]).
xc_direction(a65b12506e9558,':FORWARD').
xc_monotonicity(a65b12506e9558,':DEFAULT').
x_primaryFunction('x_HYP-BallisticMissile-Mushak120-15817564',x_TransportViaFn(x_UnmannedAircraft),x_transporter) :- x_cid(a65b12506e9559).
xc_microtheory(a65b12506e9559,x_HPKBCrisisMt).
xc_source_file(a65b12506e9559,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9559,19814).
xc_kb_names(a65b12506e9559,[]).
xc_mapping_rows(a65b12506e9559,[]).
xc_direction(a65b12506e9559,':FORWARD').
xc_monotonicity(a65b12506e9559,':DEFAULT').
x_implies(x_and(x_isa(V1,x_ConveyingMaterials),x_transportees(V1,V2),x_isa(V2,'x_Petroleum-CrudeOil')),x_or(x_isa(V1,x_PipeFlow),x_isa(V1,x_TransportViaFn(x_TankerShip)))) :- x_cid(a65b12506e955a,V1,V2).
xc_microtheory(a65b12506e955a,x_HPKBCrisisMt).
xc_source_file(a65b12506e955a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e955a,19821).
xc_kb_names(a65b12506e955a,["?TRANSPORT","?OIL"]).
xc_mapping_rows(a65b12506e955a,['implication-implies']).
xc_direction(a65b12506e955a,':BACKWARD').
xc_monotonicity(a65b12506e955a,':DEFAULT').
xc_creator(a65b12506e955a,'Kean').
xc_creation_date(a65b12506e955a,19980310).
x_hasStatusWithAgent(x_IslamicReformMovement,x_SaudiArabia,x_DissidentStatus) :- x_cid(a65b12506e955b).
xc_microtheory(a65b12506e955b,x_HPKBCrisisMt).
xc_source_file(a65b12506e955b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e955b,19835).
xc_kb_names(a65b12506e955b,[]).
xc_mapping_rows(a65b12506e955b,[]).
xc_direction(a65b12506e955b,':FORWARD').
xc_monotonicity(a65b12506e955b,':DEFAULT').
xc_creator(a65b12506e955b,'ABelasco').
xc_creation_date(a65b12506e955b,19980227).
x_relationAllExistsMany(x_subEvents,x_PhysicalDistributionEvent,x_ConveyingMaterials) :- x_cid(a65b12506e955c).
xc_microtheory(a65b12506e955c,x_HPKBCrisisMt).
xc_source_file(a65b12506e955c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e955c,19841).
xc_kb_names(a65b12506e955c,[]).
xc_mapping_rows(a65b12506e955c,[]).
xc_direction(a65b12506e955c,':FORWARD').
xc_monotonicity(a65b12506e955c,':DEFAULT').
xc_creator(a65b12506e955c,'Kean').
xc_creation_date(a65b12506e955c,19980218).
x_lessLikelyThan(x_implies(x_and(x_isa(V1,x_Punishing),x_maleficiary(V1,V2)),x_thereExists(V3,x_agentViolatesObligation(V2,V3))),x_implies(x_and(x_isa(V1,x_Punishing),x_performedBy(V1,V4),x_maleficiary(V1,V2)),x_beliefs(V4,x_thereExists(V5,x_agentViolatesObligation(V2,V5))))) :- x_cid(a65b12506e955d,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e955d,x_HPKBCrisisMt).
xc_source_file(a65b12506e955d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e955d,19847).
xc_kb_names(a65b12506e955d,["?PUNISH","?PUNISHED","?OBLIGATION","?PUNISHER","?OBLIGATION"]).
xc_mapping_rows(a65b12506e955d,['implication-implies','exists-thereexists','implication-implies','exists-thereexists']).
xc_direction(a65b12506e955d,':BACKWARD').
xc_monotonicity(a65b12506e955d,':DEFAULT').
xc_creator(a65b12506e955d,'BillJ').
xc_creation_date(a65b12506e955d,19980205).
x_lessLikelyThan(x_implies(x_and(x_isa(V1,x_Punishing),x_performedBy(V1,V2),x_maleficiary(V1,V3)),x_beliefs(V2,x_thereExists(V4,x_agentViolatesObligation(V3,V4)))),x_implies(x_and(x_isa(V1,x_Punishing),x_performedBy(V1,V2),x_maleficiary(V1,V3)),x_beliefs(V2,x_thereExists(V5,x_agentViolatesObligation(V3,V5))))) :- x_cid(a65b12506e955e,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e955e,x_HPKBCrisisMt).
xc_source_file(a65b12506e955e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e955e,19869).
xc_kb_names(a65b12506e955e,["?PUNISH","?PUNISHER","?PUNISHED","?OBLIGATION","?OBLIGATION"]).
xc_mapping_rows(a65b12506e955e,['implication-implies','exists-thereexists','implication-implies','exists-thereexists']).
xc_direction(a65b12506e955e,':BACKWARD').
xc_monotonicity(a65b12506e955e,':DEFAULT').
xc_creator(a65b12506e955e,'BillJ').
xc_creation_date(a65b12506e955e,19980205).
x_implies(x_and(x_isa(V1,x_Punishing),x_performedBy(V1,V2),x_maleficiary(V1,V3)),x_beliefs(V2,x_thereExists(V4,x_agentViolatesObligation(V3,V4)))) :- x_cid(a65b12506e955f,V1,V2,V3,V4).
xc_microtheory(a65b12506e955f,x_HPKBCrisisMt).
xc_source_file(a65b12506e955f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e955f,19893).
xc_kb_names(a65b12506e955f,["?PUNISH","?PUNISHER","?PUNISHED","?OBLIGATION"]).
xc_mapping_rows(a65b12506e955f,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e955f,':BACKWARD').
xc_monotonicity(a65b12506e955f,':DEFAULT').
xc_creator(a65b12506e955f,'BillJ').
xc_creation_date(a65b12506e955f,19980205).
x_implies(x_and(x_isa(V1,x_Punishing),x_maleficiary(V1,V2)),x_thereExists(V3,x_agentViolatesObligation(V2,V3))) :- x_cid(a65b12506e9560,V1,V2,V3).
xc_microtheory(a65b12506e9560,x_HPKBCrisisMt).
xc_source_file(a65b12506e9560,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9560,19907).
xc_kb_names(a65b12506e9560,["?PUNISH","?PUNISHED","?OBLIGATION"]).
xc_mapping_rows(a65b12506e9560,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9560,':BACKWARD').
xc_monotonicity(a65b12506e9560,':DEFAULT').
xc_creator(a65b12506e9560,'BillJ').
xc_creation_date(a65b12506e9560,19980205).
x_arg2Isa('x_SKF-20427123',x_Agent) :- x_cid(a65b12506e9561).
xc_microtheory(a65b12506e9561,x_HPKBCrisisMt).
xc_source_file(a65b12506e9561,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9561,19919).
xc_kb_names(a65b12506e9561,[]).
xc_mapping_rows(a65b12506e9561,[]).
xc_direction(a65b12506e9561,':FORWARD').
xc_monotonicity(a65b12506e9561,':DEFAULT').
x_arg1Isa('x_SKF-20427123',x_Punishing) :- x_cid(a65b12506e9562).
xc_microtheory(a65b12506e9562,x_HPKBCrisisMt).
xc_source_file(a65b12506e9562,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9562,19925).
xc_kb_names(a65b12506e9562,[]).
xc_mapping_rows(a65b12506e9562,[]).
xc_direction(a65b12506e9562,':FORWARD').
xc_monotonicity(a65b12506e9562,':DEFAULT').
x_arity('x_SKF-20427123',2) :- x_cid(a65b12506e9563).
xc_microtheory(a65b12506e9563,x_HPKBCrisisMt).
xc_source_file(a65b12506e9563,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9563,19931).
xc_kb_names(a65b12506e9563,[]).
xc_mapping_rows(a65b12506e9563,[]).
xc_direction(a65b12506e9563,':FORWARD').
xc_monotonicity(a65b12506e9563,':MONOTONIC').
x_isa('x_SKF-20427123',x_SkolemFunction) :- x_cid(a65b12506e9564).
xc_microtheory(a65b12506e9564,x_HPKBCrisisMt).
xc_source_file(a65b12506e9564,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9564,19937).
xc_kb_names(a65b12506e9564,[]).
xc_mapping_rows(a65b12506e9564,[]).
xc_direction(a65b12506e9564,':FORWARD').
xc_monotonicity(a65b12506e9564,':MONOTONIC').
x_implies(x_and('x_internationalOrg-MemberCountry'(V1,V2),x_isa(V1,'x_Coalition-International')),x_thereExists(V3,x_and(x_goalCategoryForAgent(V2,V3,x_StrategicNationalInterest),x_goals(V1,V3)))) :- x_cid(a65b12506e9565,V1,V2,V3).
xc_microtheory(a65b12506e9565,x_HPKBCrisisMt).
xc_source_file(a65b12506e9565,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9565,19943).
xc_kb_names(a65b12506e9565,["?ORG","?COUNTRY","?GOAL"]).
xc_mapping_rows(a65b12506e9565,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9565,':BACKWARD').
xc_monotonicity(a65b12506e9565,':DEFAULT').
xc_creator(a65b12506e9565,'Nichols').
xc_creation_date(a65b12506e9565,19980122).
x_implies(x_and('x_internationalOrg-MemberCountry'(V1,V2),x_isa(V1,'x_Coalition-International')),x_thereExists(V3,x_and(x_goalCategoryForAgent(V2,V3,x_StrategicNationalInterest),x_goals(V1,V3)))) :- x_cid(a65b12506e9566,V1,V2,V3).
xc_microtheory(a65b12506e9566,x_HPKBCrisisMt).
xc_source_file(a65b12506e9566,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9566,19957).
xc_kb_names(a65b12506e9566,["?ORG","?COUNTRY","?GOAL"]).
xc_mapping_rows(a65b12506e9566,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9566,':BACKWARD').
xc_monotonicity(a65b12506e9566,':DEFAULT').
xc_creator(a65b12506e9566,'Nichols').
xc_creation_date(a65b12506e9566,19980122).
x_arg2Isa('x_SKF-55141454',x_Country) :- x_cid(a65b12506e9567).
xc_microtheory(a65b12506e9567,x_HPKBCrisisMt).
xc_source_file(a65b12506e9567,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9567,19971).
xc_kb_names(a65b12506e9567,[]).
xc_mapping_rows(a65b12506e9567,[]).
xc_direction(a65b12506e9567,':FORWARD').
xc_monotonicity(a65b12506e9567,':DEFAULT').
x_arg1Isa('x_SKF-55141454','x_Coalition-International') :- x_cid(a65b12506e9568).
xc_microtheory(a65b12506e9568,x_HPKBCrisisMt).
xc_source_file(a65b12506e9568,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9568,19977).
xc_kb_names(a65b12506e9568,[]).
xc_mapping_rows(a65b12506e9568,[]).
xc_direction(a65b12506e9568,':FORWARD').
xc_monotonicity(a65b12506e9568,':DEFAULT').
x_arity('x_SKF-55141454',2) :- x_cid(a65b12506e9569).
xc_microtheory(a65b12506e9569,x_HPKBCrisisMt).
xc_source_file(a65b12506e9569,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9569,19983).
xc_kb_names(a65b12506e9569,[]).
xc_mapping_rows(a65b12506e9569,[]).
xc_direction(a65b12506e9569,':FORWARD').
xc_monotonicity(a65b12506e9569,':MONOTONIC').
x_isa('x_SKF-55141454',x_SkolemFunction) :- x_cid(a65b12506e956a).
xc_microtheory(a65b12506e956a,x_HPKBCrisisMt).
xc_source_file(a65b12506e956a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e956a,19989).
xc_kb_names(a65b12506e956a,[]).
xc_mapping_rows(a65b12506e956a,[]).
xc_direction(a65b12506e956a,':FORWARD').
xc_monotonicity(a65b12506e956a,':MONOTONIC').
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_objectActedOn(V1,V2),x_objectFoundInLocation(V2,V3),x_isa(V3,x_Country)),x_maleficiary(V1,V3)) :- x_cid(a65b12506e956b,V1,V2,V3).
xc_microtheory(a65b12506e956b,x_HPKBCrisisMt).
xc_source_file(a65b12506e956b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e956b,19995).
xc_kb_names(a65b12506e956b,["?ATTACK","?INDUSTRY","?LOCATION"]).
xc_mapping_rows(a65b12506e956b,['implication-implies']).
xc_direction(a65b12506e956b,':BACKWARD').
xc_monotonicity(a65b12506e956b,':DEFAULT').
xc_creator(a65b12506e956b,'Kean').
xc_creation_date(a65b12506e956b,19980112).
x_totalReserves(x_Japan,'x_Petroleum-CrudeOil',x_MillionBarrels(55)) :- x_cid(a65b12506e956c).
xc_microtheory(a65b12506e956c,x_HPKBCrisisMt).
xc_source_file(a65b12506e956c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e956c,20007).
xc_kb_names(a65b12506e956c,[]).
xc_mapping_rows(a65b12506e956c,[]).
xc_direction(a65b12506e956c,':FORWARD').
xc_monotonicity(a65b12506e956c,':DEFAULT').
xc_creator(a65b12506e956c,'MarkWillems').
xc_creation_date(a65b12506e956c,19980109).
x_arg2Isa('x_SKF-19813178',x_Country) :- x_cid(a65b12506e956d).
xc_microtheory(a65b12506e956d,x_HPKBCrisisMt).
xc_source_file(a65b12506e956d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e956d,20014).
xc_kb_names(a65b12506e956d,[]).
xc_mapping_rows(a65b12506e956d,[]).
xc_direction(a65b12506e956d,':FORWARD').
xc_monotonicity(a65b12506e956d,':DEFAULT').
x_arg1Isa('x_SKF-19813178','x_Coalition-International') :- x_cid(a65b12506e956e).
xc_microtheory(a65b12506e956e,x_HPKBCrisisMt).
xc_source_file(a65b12506e956e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e956e,20020).
xc_kb_names(a65b12506e956e,[]).
xc_mapping_rows(a65b12506e956e,[]).
xc_direction(a65b12506e956e,':FORWARD').
xc_monotonicity(a65b12506e956e,':DEFAULT').
x_resultIsa('x_SKF-19813178',x_Goal) :- x_cid(a65b12506e956f).
xc_microtheory(a65b12506e956f,x_HPKBCrisisMt).
xc_source_file(a65b12506e956f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e956f,20026).
xc_kb_names(a65b12506e956f,[]).
xc_mapping_rows(a65b12506e956f,[]).
xc_direction(a65b12506e956f,':FORWARD').
xc_monotonicity(a65b12506e956f,':DEFAULT').
x_arity('x_SKF-19813178',2) :- x_cid(a65b12506e9570).
xc_microtheory(a65b12506e9570,x_HPKBCrisisMt).
xc_source_file(a65b12506e9570,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9570,20032).
xc_kb_names(a65b12506e9570,[]).
xc_mapping_rows(a65b12506e9570,[]).
xc_direction(a65b12506e9570,':FORWARD').
xc_monotonicity(a65b12506e9570,':MONOTONIC').
x_isa('x_SKF-19813178',x_SkolemFunction) :- x_cid(a65b12506e9571).
xc_microtheory(a65b12506e9571,x_HPKBCrisisMt).
xc_source_file(a65b12506e9571,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9571,20038).
xc_kb_names(a65b12506e9571,[]).
xc_mapping_rows(a65b12506e9571,[]).
xc_direction(a65b12506e9571,':FORWARD').
xc_monotonicity(a65b12506e9571,':MONOTONIC').
x_implies(x_and(x_isa(V1,x_PurposefulAction),x_performedBy(V1,V2),x_isa(V2,x_Country),x_interferesWithGoal(V1,V3),x_different(V2,V4),x_goalCategoryForAgent(V4,V3,x_StrategicNationalInterest)),x_promotesRisk(V1,V2,x_ImposingSanctions,x_maleficiary)) :- x_cid(a65b12506e9572,V1,V2,V3,V4).
xc_microtheory(a65b12506e9572,x_HPKBCrisisMt).
xc_source_file(a65b12506e9572,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9572,20044).
xc_kb_names(a65b12506e9572,["?ACT","?BAD","?GOAL","?AGT"]).
xc_mapping_rows(a65b12506e9572,['implication-implies']).
xc_direction(a65b12506e9572,':BACKWARD').
xc_monotonicity(a65b12506e9572,':DEFAULT').
xc_creator(a65b12506e9572,'Nichols').
xc_creation_date(a65b12506e9572,19971216).
x_spatiallyIntersects(x_NorthernRegionFn(x_Iraq),'x_Kirkuk-CeyhanPipeline') :- x_cid(a65b12506e9573).
xc_microtheory(a65b12506e9573,x_HPKBCrisisMt).
xc_source_file(a65b12506e9573,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9573,20058).
xc_kb_names(a65b12506e9573,[]).
xc_mapping_rows(a65b12506e9573,[]).
xc_direction(a65b12506e9573,':FORWARD').
xc_monotonicity(a65b12506e9573,':DEFAULT').
xc_creator(a65b12506e9573,'Rode').
xc_creation_date(a65b12506e9573,19971216).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_doneBy(V1,V2),x_successfulForAgents(V1,V2),x_isa(V2,x_Country),x_maleficiary(V1,V3)),x_decreasesImmediatelyCausally(V1,V3,'x_power-Geopolitical')) :- x_cid(a65b12506e9574,V1,V2,V3).
xc_microtheory(a65b12506e9574,x_HPKBCrisisMt).
xc_source_file(a65b12506e9574,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9574,20065).
xc_kb_names(a65b12506e9574,["?ATTACK","?ATTACKER","?ATTACKEE"]).
xc_mapping_rows(a65b12506e9574,['implication-implies']).
xc_direction(a65b12506e9574,':BACKWARD').
xc_monotonicity(a65b12506e9574,':DEFAULT').
xc_creator(a65b12506e9574,'Nichols').
xc_creation_date(a65b12506e9574,19971216).
x_implies(x_and(x_isa(V1,x_Country),x_isa(V2,x_Country),x_holdsIn(V3,x_opponents(V1,V2)),x_decreasesImmediatelyCausally(V3,V2,'x_power-Geopolitical')),x_increasesImmediatelyCausally(V3,V1,'x_power-Geopolitical')) :- x_cid(a65b12506e9575,V1,V2,V3).
xc_microtheory(a65b12506e9575,x_HPKBCrisisMt).
xc_source_file(a65b12506e9575,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9575,20078).
xc_kb_names(a65b12506e9575,["?COUNTRY-GAINING","?COUNTRY-LOSING","?EVENT"]).
xc_mapping_rows(a65b12506e9575,['implication-implies']).
xc_direction(a65b12506e9575,':BACKWARD').
xc_monotonicity(a65b12506e9575,':DEFAULT').
xc_creator(a65b12506e9575,'Nichols').
xc_creation_date(a65b12506e9575,19971216).
x_arg4Isa('x_SKF-20778779',x_Agent) :- x_cid(a65b12506e9576).
xc_microtheory(a65b12506e9576,x_HPKBCrisisMt).
xc_source_file(a65b12506e9576,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9576,20091).
xc_kb_names(a65b12506e9576,[]).
xc_mapping_rows(a65b12506e9576,[]).
xc_direction(a65b12506e9576,':FORWARD').
xc_monotonicity(a65b12506e9576,':DEFAULT').
x_arg3Isa('x_SKF-20778779',x_Agent) :- x_cid(a65b12506e9577).
xc_microtheory(a65b12506e9577,x_HPKBCrisisMt).
xc_source_file(a65b12506e9577,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9577,20097).
xc_kb_names(a65b12506e9577,[]).
xc_mapping_rows(a65b12506e9577,[]).
xc_direction(a65b12506e9577,':FORWARD').
xc_monotonicity(a65b12506e9577,':DEFAULT').
x_arg2Isa('x_SKF-20778779',x_HelpingAnAgent) :- x_cid(a65b12506e9578).
xc_microtheory(a65b12506e9578,x_HPKBCrisisMt).
xc_source_file(a65b12506e9578,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9578,20103).
xc_kb_names(a65b12506e9578,[]).
xc_mapping_rows(a65b12506e9578,[]).
xc_direction(a65b12506e9578,':FORWARD').
xc_monotonicity(a65b12506e9578,':DEFAULT').
x_arg1Isa('x_SKF-20778779',x_TerroristGroup) :- x_cid(a65b12506e9579).
xc_microtheory(a65b12506e9579,x_HPKBCrisisMt).
xc_source_file(a65b12506e9579,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9579,20109).
xc_kb_names(a65b12506e9579,[]).
xc_mapping_rows(a65b12506e9579,[]).
xc_direction(a65b12506e9579,':FORWARD').
xc_monotonicity(a65b12506e9579,':DEFAULT').
x_resultIsa('x_SKF-20778779',x_ShowingSupportForSomeone) :- x_cid(a65b12506e957a).
xc_microtheory(a65b12506e957a,x_HPKBCrisisMt).
xc_source_file(a65b12506e957a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e957a,20115).
xc_kb_names(a65b12506e957a,[]).
xc_mapping_rows(a65b12506e957a,[]).
xc_direction(a65b12506e957a,':FORWARD').
xc_monotonicity(a65b12506e957a,':DEFAULT').
x_arity('x_SKF-20778779',4) :- x_cid(a65b12506e957b).
xc_microtheory(a65b12506e957b,x_HPKBCrisisMt).
xc_source_file(a65b12506e957b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e957b,20121).
xc_kb_names(a65b12506e957b,[]).
xc_mapping_rows(a65b12506e957b,[]).
xc_direction(a65b12506e957b,':FORWARD').
xc_monotonicity(a65b12506e957b,':MONOTONIC').
x_isa('x_SKF-20778779',x_SkolemFunction) :- x_cid(a65b12506e957c).
xc_microtheory(a65b12506e957c,x_HPKBCrisisMt).
xc_source_file(a65b12506e957c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e957c,20127).
xc_kb_names(a65b12506e957c,[]).
xc_mapping_rows(a65b12506e957c,[]).
xc_direction(a65b12506e957c,':FORWARD').
xc_monotonicity(a65b12506e957c,':MONOTONIC').
x_pathTerminus('x_Kirkuk-CeyhanPipeline',x_CityOfCeyhanTurkey) :- x_cid(a65b12506e957d).
xc_microtheory(a65b12506e957d,x_HPKBCrisisMt).
xc_source_file(a65b12506e957d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e957d,20133).
xc_kb_names(a65b12506e957d,[]).
xc_mapping_rows(a65b12506e957d,[]).
xc_direction(a65b12506e957d,':FORWARD').
xc_monotonicity(a65b12506e957d,':DEFAULT').
xc_creator(a65b12506e957d,'Rode').
xc_creation_date(a65b12506e957d,19971215).
x_pathTerminus('x_Kirkuk-CeyhanPipeline',x_CityOfKirkukIraq) :- x_cid(a65b12506e957e).
xc_microtheory(a65b12506e957e,x_HPKBCrisisMt).
xc_source_file(a65b12506e957e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e957e,20139).
xc_kb_names(a65b12506e957e,[]).
xc_mapping_rows(a65b12506e957e,[]).
xc_direction(a65b12506e957e,':FORWARD').
xc_monotonicity(a65b12506e957e,':DEFAULT').
xc_creator(a65b12506e957e,'Rode').
xc_creation_date(a65b12506e957e,19971215).
x_assertionConclusionActionType(x_implies(x_isa(V1,x_PoliticalOrganization),x_thereExists(V2,x_goalCategoryForAgent(V1,V2,x_PoliticalGoal))),x_VerifyConclusionSometime) :- x_cid(a65b12506e957f,V1,V2).
xc_microtheory(a65b12506e957f,x_HPKBCrisisMt).
xc_source_file(a65b12506e957f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e957f,20145).
xc_kb_names(a65b12506e957f,["?ORG","?GOAL"]).
xc_mapping_rows(a65b12506e957f,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e957f,':BACKWARD').
xc_monotonicity(a65b12506e957f,':DEFAULT').
xc_creator(a65b12506e957f,'OKeefe').
xc_creation_date(a65b12506e957f,19971212).
x_implies(x_isa(V1,x_PoliticalOrganization),x_thereExists(V2,x_goalCategoryForAgent(V1,V2,x_PoliticalGoal))) :- x_cid(a65b12506e9580,V1,V2).
xc_microtheory(a65b12506e9580,x_HPKBCrisisMt).
xc_source_file(a65b12506e9580,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9580,20156).
xc_kb_names(a65b12506e9580,["?ORG","?GOAL"]).
xc_mapping_rows(a65b12506e9580,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9580,':BACKWARD').
xc_monotonicity(a65b12506e9580,':DEFAULT').
xc_creator(a65b12506e9580,'OKeefe').
xc_creation_date(a65b12506e9580,19971212).
x_arg1Isa('x_SKF-62989105',x_PoliticalOrganization) :- x_cid(a65b12506e9581).
xc_microtheory(a65b12506e9581,x_HPKBCrisisMt).
xc_source_file(a65b12506e9581,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9581,20166).
xc_kb_names(a65b12506e9581,[]).
xc_mapping_rows(a65b12506e9581,[]).
xc_direction(a65b12506e9581,':FORWARD').
xc_monotonicity(a65b12506e9581,':DEFAULT').
x_arity('x_SKF-62989105',1) :- x_cid(a65b12506e9582).
xc_microtheory(a65b12506e9582,x_HPKBCrisisMt).
xc_source_file(a65b12506e9582,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9582,20172).
xc_kb_names(a65b12506e9582,[]).
xc_mapping_rows(a65b12506e9582,[]).
xc_direction(a65b12506e9582,':FORWARD').
xc_monotonicity(a65b12506e9582,':MONOTONIC').
x_isa('x_SKF-62989105',x_SkolemFunction) :- x_cid(a65b12506e9583).
xc_microtheory(a65b12506e9583,x_HPKBCrisisMt).
xc_source_file(a65b12506e9583,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9583,20178).
xc_kb_names(a65b12506e9583,[]).
xc_mapping_rows(a65b12506e9583,[]).
xc_direction(a65b12506e9583,':FORWARD').
xc_monotonicity(a65b12506e9583,':MONOTONIC').
x_arg2Isa('x_SKF-42573963',x_Agent) :- x_cid(a65b12506e9584).
xc_microtheory(a65b12506e9584,x_HPKBCrisisMt).
xc_source_file(a65b12506e9584,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9584,20184).
xc_kb_names(a65b12506e9584,[]).
xc_mapping_rows(a65b12506e9584,[]).
xc_direction(a65b12506e9584,':FORWARD').
xc_monotonicity(a65b12506e9584,':DEFAULT').
x_arg1Isa('x_SKF-42573963','x_Coalition-International') :- x_cid(a65b12506e9585).
xc_microtheory(a65b12506e9585,x_HPKBCrisisMt).
xc_source_file(a65b12506e9585,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9585,20190).
xc_kb_names(a65b12506e9585,[]).
xc_mapping_rows(a65b12506e9585,[]).
xc_direction(a65b12506e9585,':FORWARD').
xc_monotonicity(a65b12506e9585,':DEFAULT').
x_resultIsa('x_SKF-42573963',x_Goal) :- x_cid(a65b12506e9586).
xc_microtheory(a65b12506e9586,x_HPKBCrisisMt).
xc_source_file(a65b12506e9586,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9586,20196).
xc_kb_names(a65b12506e9586,[]).
xc_mapping_rows(a65b12506e9586,[]).
xc_direction(a65b12506e9586,':FORWARD').
xc_monotonicity(a65b12506e9586,':DEFAULT').
x_arity('x_SKF-42573963',2) :- x_cid(a65b12506e9587).
xc_microtheory(a65b12506e9587,x_HPKBCrisisMt).
xc_source_file(a65b12506e9587,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9587,20202).
xc_kb_names(a65b12506e9587,[]).
xc_mapping_rows(a65b12506e9587,[]).
xc_direction(a65b12506e9587,':FORWARD').
xc_monotonicity(a65b12506e9587,':MONOTONIC').
x_isa('x_SKF-42573963',x_SkolemFunction) :- x_cid(a65b12506e9588).
xc_microtheory(a65b12506e9588,x_HPKBCrisisMt).
xc_source_file(a65b12506e9588,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9588,20208).
xc_kb_names(a65b12506e9588,[]).
xc_mapping_rows(a65b12506e9588,[]).
xc_direction(a65b12506e9588,':FORWARD').
xc_monotonicity(a65b12506e9588,':MONOTONIC').
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_performedBy(V2,V1),x_isa(V2,x_BlockingAnInternationalWaterway)),x_thereExists(V3,x_and(x_isa(V3,x_Navy),x_hasAgents(V1,V3)))) :- x_cid(a65b12506e9589,V1,V2,V3).
xc_microtheory(a65b12506e9589,x_HPKBCrisisMt).
xc_source_file(a65b12506e9589,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9589,20214).
xc_kb_names(a65b12506e9589,["?COUNTRY","?BL","?NAVY"]).
xc_mapping_rows(a65b12506e9589,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9589,':BACKWARD').
xc_monotonicity(a65b12506e9589,':DEFAULT').
xc_creator(a65b12506e9589,'Rohrbaugh').
xc_creation_date(a65b12506e9589,19971211).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_performedBy(V2,V1),x_isa(V2,x_BlockingAnInternationalWaterway)),x_thereExists(V3,x_and(x_isa(V3,x_Navy),x_hasAgents(V1,V3)))) :- x_cid(a65b12506e958a,V1,V2,V3).
xc_microtheory(a65b12506e958a,x_HPKBCrisisMt).
xc_source_file(a65b12506e958a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e958a,20229).
xc_kb_names(a65b12506e958a,["?COUNTRY","?BL","?NAVY"]).
xc_mapping_rows(a65b12506e958a,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e958a,':BACKWARD').
xc_monotonicity(a65b12506e958a,':DEFAULT').
xc_creator(a65b12506e958a,'Rohrbaugh').
xc_creation_date(a65b12506e958a,19971211).
x_arg2Isa('x_SKF-8811630',x_IndependentCountry) :- x_cid(a65b12506e958b).
xc_microtheory(a65b12506e958b,x_HPKBCrisisMt).
xc_source_file(a65b12506e958b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e958b,20244).
xc_kb_names(a65b12506e958b,[]).
xc_mapping_rows(a65b12506e958b,[]).
xc_direction(a65b12506e958b,':FORWARD').
xc_monotonicity(a65b12506e958b,':DEFAULT').
x_arg1Isa('x_SKF-8811630',x_BlockingAnInternationalWaterway) :- x_cid(a65b12506e958c).
xc_microtheory(a65b12506e958c,x_HPKBCrisisMt).
xc_source_file(a65b12506e958c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e958c,20250).
xc_kb_names(a65b12506e958c,[]).
xc_mapping_rows(a65b12506e958c,[]).
xc_direction(a65b12506e958c,':FORWARD').
xc_monotonicity(a65b12506e958c,':DEFAULT').
x_resultIsa('x_SKF-8811630',x_Navy) :- x_cid(a65b12506e958d).
xc_microtheory(a65b12506e958d,x_HPKBCrisisMt).
xc_source_file(a65b12506e958d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e958d,20256).
xc_kb_names(a65b12506e958d,[]).
xc_mapping_rows(a65b12506e958d,[]).
xc_direction(a65b12506e958d,':FORWARD').
xc_monotonicity(a65b12506e958d,':DEFAULT').
x_arity('x_SKF-8811630',2) :- x_cid(a65b12506e958e).
xc_microtheory(a65b12506e958e,x_HPKBCrisisMt).
xc_source_file(a65b12506e958e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e958e,20262).
xc_kb_names(a65b12506e958e,[]).
xc_mapping_rows(a65b12506e958e,[]).
xc_direction(a65b12506e958e,':FORWARD').
xc_monotonicity(a65b12506e958e,':MONOTONIC').
x_isa('x_SKF-8811630',x_SkolemFunction) :- x_cid(a65b12506e958f).
xc_microtheory(a65b12506e958f,x_HPKBCrisisMt).
xc_source_file(a65b12506e958f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e958f,20268).
xc_kb_names(a65b12506e958f,[]).
xc_mapping_rows(a65b12506e958f,[]).
xc_direction(a65b12506e958f,':FORWARD').
xc_monotonicity(a65b12506e958f,':MONOTONIC').
x_implies(x_and(x_isa(V1,x_BlockingAnInternationalWaterway),x_objectActedOn(V1,V2)),x_spatiallySubsumes(x_HighSeas,V2)) :- x_cid(a65b12506e9590,V1,V2).
xc_microtheory(a65b12506e9590,x_HPKBCrisisMt).
xc_source_file(a65b12506e9590,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9590,20274).
xc_kb_names(a65b12506e9590,["?BL","?OBJ"]).
xc_mapping_rows(a65b12506e9590,['implication-implies']).
xc_direction(a65b12506e9590,':BACKWARD').
xc_monotonicity(a65b12506e9590,':DEFAULT').
xc_creator(a65b12506e9590,'Schwartz').
xc_creation_date(a65b12506e9590,19971210).
x_possesses(x_Iran,'x_HYP-BallisticMissile-SCUDB-1915224') :- x_cid(a65b12506e9591).
xc_microtheory(a65b12506e9591,x_HPKBCrisisMt).
xc_source_file(a65b12506e9591,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9591,20284).
xc_kb_names(a65b12506e9591,[]).
xc_mapping_rows(a65b12506e9591,[]).
xc_direction(a65b12506e9591,':FORWARD').
xc_monotonicity(a65b12506e9591,':DEFAULT').
x_isa('x_HYP-BallisticMissile-SCUDB-1915224','x_BallisticMissile-SCUDB') :- x_cid(a65b12506e9592).
xc_microtheory(a65b12506e9592,x_HPKBCrisisMt).
xc_source_file(a65b12506e9592,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9592,20290).
xc_kb_names(a65b12506e9592,[]).
xc_mapping_rows(a65b12506e9592,[]).
xc_direction(a65b12506e9592,':FORWARD').
xc_monotonicity(a65b12506e9592,':DEFAULT').
x_possesses(x_Iran,'x_HYP-BallisticMissile-SCUDC-48505638') :- x_cid(a65b12506e9593).
xc_microtheory(a65b12506e9593,x_HPKBCrisisMt).
xc_source_file(a65b12506e9593,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9593,20296).
xc_kb_names(a65b12506e9593,[]).
xc_mapping_rows(a65b12506e9593,[]).
xc_direction(a65b12506e9593,':FORWARD').
xc_monotonicity(a65b12506e9593,':DEFAULT').
x_isa('x_HYP-BallisticMissile-SCUDC-48505638','x_BallisticMissile-SCUDC') :- x_cid(a65b12506e9594).
xc_microtheory(a65b12506e9594,x_HPKBCrisisMt).
xc_source_file(a65b12506e9594,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9594,20302).
xc_kb_names(a65b12506e9594,[]).
xc_mapping_rows(a65b12506e9594,[]).
xc_direction(a65b12506e9594,':FORWARD').
xc_monotonicity(a65b12506e9594,':DEFAULT').
x_possesses(x_Iran,'x_HYP-BallisticMissile-Mushak120-15817564') :- x_cid(a65b12506e9595).
xc_microtheory(a65b12506e9595,x_HPKBCrisisMt).
xc_source_file(a65b12506e9595,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9595,20308).
xc_kb_names(a65b12506e9595,[]).
xc_mapping_rows(a65b12506e9595,[]).
xc_direction(a65b12506e9595,':FORWARD').
xc_monotonicity(a65b12506e9595,':DEFAULT').
x_isa('x_HYP-BallisticMissile-Mushak120-15817564','x_BallisticMissile-Mushak120') :- x_cid(a65b12506e9596).
xc_microtheory(a65b12506e9596,x_HPKBCrisisMt).
xc_source_file(a65b12506e9596,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9596,20314).
xc_kb_names(a65b12506e9596,[]).
xc_mapping_rows(a65b12506e9596,[]).
xc_direction(a65b12506e9596,':FORWARD').
xc_monotonicity(a65b12506e9596,':DEFAULT').
x_possesses(x_Iran,'x_HYP-BallisticMissile-CSS8-30837525') :- x_cid(a65b12506e9597).
xc_microtheory(a65b12506e9597,x_HPKBCrisisMt).
xc_source_file(a65b12506e9597,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9597,20320).
xc_kb_names(a65b12506e9597,[]).
xc_mapping_rows(a65b12506e9597,[]).
xc_direction(a65b12506e9597,':FORWARD').
xc_monotonicity(a65b12506e9597,':DEFAULT').
x_isa('x_HYP-BallisticMissile-CSS8-30837525','x_BallisticMissile-CSS8') :- x_cid(a65b12506e9598).
xc_microtheory(a65b12506e9598,x_HPKBCrisisMt).
xc_source_file(a65b12506e9598,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9598,20326).
xc_kb_names(a65b12506e9598,[]).
xc_mapping_rows(a65b12506e9598,[]).
xc_direction(a65b12506e9598,':FORWARD').
xc_monotonicity(a65b12506e9598,':DEFAULT').
x_possesses(x_Iran,'x_HYP-BallisticMissile-M11-33553741') :- x_cid(a65b12506e9599).
xc_microtheory(a65b12506e9599,x_HPKBCrisisMt).
xc_source_file(a65b12506e9599,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9599,20332).
xc_kb_names(a65b12506e9599,[]).
xc_mapping_rows(a65b12506e9599,[]).
xc_direction(a65b12506e9599,':FORWARD').
xc_monotonicity(a65b12506e9599,':DEFAULT').
x_isa('x_HYP-BallisticMissile-M11-33553741','x_BallisticMissile-M11') :- x_cid(a65b12506e959a).
xc_microtheory(a65b12506e959a,x_HPKBCrisisMt).
xc_source_file(a65b12506e959a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e959a,20338).
xc_kb_names(a65b12506e959a,[]).
xc_mapping_rows(a65b12506e959a,[]).
xc_direction(a65b12506e959a,':FORWARD').
xc_monotonicity(a65b12506e959a,':DEFAULT').
x_possesses(x_Iran,'x_HYP-BallisticMissile-Mushak200-47497030') :- x_cid(a65b12506e959b).
xc_microtheory(a65b12506e959b,x_HPKBCrisisMt).
xc_source_file(a65b12506e959b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e959b,20344).
xc_kb_names(a65b12506e959b,[]).
xc_mapping_rows(a65b12506e959b,[]).
xc_direction(a65b12506e959b,':FORWARD').
xc_monotonicity(a65b12506e959b,':DEFAULT').
x_isa('x_HYP-BallisticMissile-Mushak200-47497030','x_BallisticMissile-Mushak200') :- x_cid(a65b12506e959c).
xc_microtheory(a65b12506e959c,x_HPKBCrisisMt).
xc_source_file(a65b12506e959c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e959c,20350).
xc_kb_names(a65b12506e959c,[]).
xc_mapping_rows(a65b12506e959c,[]).
xc_direction(a65b12506e959c,':FORWARD').
xc_monotonicity(a65b12506e959c,':DEFAULT').
x_possesses(x_Iran,'x_HYP-BallisticMissile-Mushak160-17017033') :- x_cid(a65b12506e959d).
xc_microtheory(a65b12506e959d,x_HPKBCrisisMt).
xc_source_file(a65b12506e959d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e959d,20356).
xc_kb_names(a65b12506e959d,[]).
xc_mapping_rows(a65b12506e959d,[]).
xc_direction(a65b12506e959d,':FORWARD').
xc_monotonicity(a65b12506e959d,':DEFAULT').
x_isa('x_HYP-BallisticMissile-Mushak160-17017033','x_BallisticMissile-Mushak160') :- x_cid(a65b12506e959e).
xc_microtheory(a65b12506e959e,x_HPKBCrisisMt).
xc_source_file(a65b12506e959e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e959e,20362).
xc_kb_names(a65b12506e959e,[]).
xc_mapping_rows(a65b12506e959e,[]).
xc_direction(a65b12506e959e,':FORWARD').
xc_monotonicity(a65b12506e959e,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_Oman) :- x_cid(a65b12506e959f).
xc_microtheory(a65b12506e959f,x_HPKBCrisisMt).
xc_source_file(a65b12506e959f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e959f,20368).
xc_kb_names(a65b12506e959f,[]).
xc_mapping_rows(a65b12506e959f,[]).
xc_direction(a65b12506e959f,':FORWARD').
xc_monotonicity(a65b12506e959f,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_Niger) :- x_cid(a65b12506e95a0).
xc_microtheory(a65b12506e95a0,x_HPKBCrisisMt).
xc_source_file(a65b12506e95a0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95a0,20374).
xc_kb_names(a65b12506e95a0,[]).
xc_mapping_rows(a65b12506e95a0,[]).
xc_direction(a65b12506e95a0,':FORWARD').
xc_monotonicity(a65b12506e95a0,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_Italy) :- x_cid(a65b12506e95a1).
xc_microtheory(a65b12506e95a1,x_HPKBCrisisMt).
xc_source_file(a65b12506e95a1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95a1,20380).
xc_kb_names(a65b12506e95a1,[]).
xc_mapping_rows(a65b12506e95a1,[]).
xc_direction(a65b12506e95a1,':FORWARD').
xc_monotonicity(a65b12506e95a1,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_Honduras) :- x_cid(a65b12506e95a2).
xc_microtheory(a65b12506e95a2,x_HPKBCrisisMt).
xc_source_file(a65b12506e95a2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95a2,20386).
xc_kb_names(a65b12506e95a2,[]).
xc_mapping_rows(a65b12506e95a2,[]).
xc_direction(a65b12506e95a2,':FORWARD').
xc_monotonicity(a65b12506e95a2,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_Germany) :- x_cid(a65b12506e95a3).
xc_microtheory(a65b12506e95a3,x_HPKBCrisisMt).
xc_source_file(a65b12506e95a3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95a3,20392).
xc_kb_names(a65b12506e95a3,[]).
xc_mapping_rows(a65b12506e95a3,[]).
xc_direction(a65b12506e95a3,':FORWARD').
xc_monotonicity(a65b12506e95a3,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_France) :- x_cid(a65b12506e95a4).
xc_microtheory(a65b12506e95a4,x_HPKBCrisisMt).
xc_source_file(a65b12506e95a4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95a4,20398).
xc_kb_names(a65b12506e95a4,[]).
xc_mapping_rows(a65b12506e95a4,[]).
xc_direction(a65b12506e95a4,':FORWARD').
xc_monotonicity(a65b12506e95a4,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_Egypt) :- x_cid(a65b12506e95a5).
xc_microtheory(a65b12506e95a5,x_HPKBCrisisMt).
xc_source_file(a65b12506e95a5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95a5,20404).
xc_kb_names(a65b12506e95a5,[]).
xc_mapping_rows(a65b12506e95a5,[]).
xc_direction(a65b12506e95a5,':FORWARD').
xc_monotonicity(a65b12506e95a5,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_Czechoslovakia) :- x_cid(a65b12506e95a6).
xc_microtheory(a65b12506e95a6,x_HPKBCrisisMt).
xc_source_file(a65b12506e95a6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95a6,20410).
xc_kb_names(a65b12506e95a6,[]).
xc_mapping_rows(a65b12506e95a6,[]).
xc_direction(a65b12506e95a6,':FORWARD').
xc_monotonicity(a65b12506e95a6,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_Canada) :- x_cid(a65b12506e95a7).
xc_microtheory(a65b12506e95a7,x_HPKBCrisisMt).
xc_source_file(a65b12506e95a7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95a7,20416).
xc_kb_names(a65b12506e95a7,[]).
xc_mapping_rows(a65b12506e95a7,[]).
xc_direction(a65b12506e95a7,':FORWARD').
xc_monotonicity(a65b12506e95a7,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_Belgium) :- x_cid(a65b12506e95a8).
xc_microtheory(a65b12506e95a8,x_HPKBCrisisMt).
xc_source_file(a65b12506e95a8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95a8,20422).
xc_kb_names(a65b12506e95a8,[]).
xc_mapping_rows(a65b12506e95a8,[]).
xc_direction(a65b12506e95a8,':FORWARD').
xc_monotonicity(a65b12506e95a8,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_Bangladesh) :- x_cid(a65b12506e95a9).
xc_microtheory(a65b12506e95a9,x_HPKBCrisisMt).
xc_source_file(a65b12506e95a9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95a9,20428).
xc_kb_names(a65b12506e95a9,[]).
xc_mapping_rows(a65b12506e95a9,[]).
xc_direction(a65b12506e95a9,':FORWARD').
xc_monotonicity(a65b12506e95a9,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_Australia) :- x_cid(a65b12506e95aa).
xc_microtheory(a65b12506e95aa,x_HPKBCrisisMt).
xc_source_file(a65b12506e95aa,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95aa,20434).
xc_kb_names(a65b12506e95aa,[]).
xc_mapping_rows(a65b12506e95aa,[]).
xc_direction(a65b12506e95aa,':FORWARD').
xc_monotonicity(a65b12506e95aa,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_Afghanistan) :- x_cid(a65b12506e95ab).
xc_microtheory(a65b12506e95ab,x_HPKBCrisisMt).
xc_source_file(a65b12506e95ab,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95ab,20440).
xc_kb_names(a65b12506e95ab,[]).
xc_mapping_rows(a65b12506e95ab,[]).
xc_direction(a65b12506e95ab,':FORWARD').
xc_monotonicity(a65b12506e95ab,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_Kuwait) :- x_cid(a65b12506e95ac).
xc_microtheory(a65b12506e95ac,x_HPKBCrisisMt).
xc_source_file(a65b12506e95ac,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95ac,20446).
xc_kb_names(a65b12506e95ac,[]).
xc_mapping_rows(a65b12506e95ac,[]).
xc_direction(a65b12506e95ac,':FORWARD').
xc_monotonicity(a65b12506e95ac,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_SaudiArabia) :- x_cid(a65b12506e95ad).
xc_microtheory(a65b12506e95ad,x_HPKBCrisisMt).
xc_source_file(a65b12506e95ad,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95ad,20452).
xc_kb_names(a65b12506e95ad,[]).
xc_mapping_rows(a65b12506e95ad,[]).
xc_direction(a65b12506e95ad,':FORWARD').
xc_monotonicity(a65b12506e95ad,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_UnitedStatesOfAmerica) :- x_cid(a65b12506e95ae).
xc_microtheory(a65b12506e95ae,x_HPKBCrisisMt).
xc_source_file(a65b12506e95ae,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95ae,20458).
xc_kb_names(a65b12506e95ae,[]).
xc_mapping_rows(a65b12506e95ae,[]).
xc_direction(a65b12506e95ae,':FORWARD').
xc_monotonicity(a65b12506e95ae,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_Qatar) :- x_cid(a65b12506e95af).
xc_microtheory(a65b12506e95af,x_HPKBCrisisMt).
xc_source_file(a65b12506e95af,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95af,20464).
xc_kb_names(a65b12506e95af,[]).
xc_mapping_rows(a65b12506e95af,[]).
xc_direction(a65b12506e95af,':FORWARD').
xc_monotonicity(a65b12506e95af,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_Romania) :- x_cid(a65b12506e95b0).
xc_microtheory(a65b12506e95b0,x_HPKBCrisisMt).
xc_source_file(a65b12506e95b0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95b0,20470).
xc_kb_names(a65b12506e95b0,[]).
xc_mapping_rows(a65b12506e95b0,[]).
xc_direction(a65b12506e95b0,':FORWARD').
xc_monotonicity(a65b12506e95b0,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_SouthKorea) :- x_cid(a65b12506e95b1).
xc_microtheory(a65b12506e95b1,x_HPKBCrisisMt).
xc_source_file(a65b12506e95b1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95b1,20476).
xc_kb_names(a65b12506e95b1,[]).
xc_mapping_rows(a65b12506e95b1,[]).
xc_direction(a65b12506e95b1,':FORWARD').
xc_monotonicity(a65b12506e95b1,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_Syria) :- x_cid(a65b12506e95b2).
xc_microtheory(a65b12506e95b2,x_HPKBCrisisMt).
xc_source_file(a65b12506e95b2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95b2,20482).
xc_kb_names(a65b12506e95b2,[]).
xc_mapping_rows(a65b12506e95b2,[]).
xc_direction(a65b12506e95b2,':FORWARD').
xc_monotonicity(a65b12506e95b2,':DEFAULT').
x_doneBy(x_OperationDesertStorm,x_UnitedArabEmirates) :- x_cid(a65b12506e95b3).
xc_microtheory(a65b12506e95b3,x_HPKBCrisisMt).
xc_source_file(a65b12506e95b3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95b3,20488).
xc_kb_names(a65b12506e95b3,[]).
xc_mapping_rows(a65b12506e95b3,[]).
xc_direction(a65b12506e95b3,':FORWARD').
xc_monotonicity(a65b12506e95b3,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_Oman) :- x_cid(a65b12506e95b4).
xc_microtheory(a65b12506e95b4,x_HPKBCrisisMt).
xc_source_file(a65b12506e95b4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95b4,20494).
xc_kb_names(a65b12506e95b4,[]).
xc_mapping_rows(a65b12506e95b4,[]).
xc_direction(a65b12506e95b4,':FORWARD').
xc_monotonicity(a65b12506e95b4,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_Niger) :- x_cid(a65b12506e95b5).
xc_microtheory(a65b12506e95b5,x_HPKBCrisisMt).
xc_source_file(a65b12506e95b5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95b5,20500).
xc_kb_names(a65b12506e95b5,[]).
xc_mapping_rows(a65b12506e95b5,[]).
xc_direction(a65b12506e95b5,':FORWARD').
xc_monotonicity(a65b12506e95b5,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_Italy) :- x_cid(a65b12506e95b6).
xc_microtheory(a65b12506e95b6,x_HPKBCrisisMt).
xc_source_file(a65b12506e95b6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95b6,20506).
xc_kb_names(a65b12506e95b6,[]).
xc_mapping_rows(a65b12506e95b6,[]).
xc_direction(a65b12506e95b6,':FORWARD').
xc_monotonicity(a65b12506e95b6,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_Honduras) :- x_cid(a65b12506e95b7).
xc_microtheory(a65b12506e95b7,x_HPKBCrisisMt).
xc_source_file(a65b12506e95b7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95b7,20512).
xc_kb_names(a65b12506e95b7,[]).
xc_mapping_rows(a65b12506e95b7,[]).
xc_direction(a65b12506e95b7,':FORWARD').
xc_monotonicity(a65b12506e95b7,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_Germany) :- x_cid(a65b12506e95b8).
xc_microtheory(a65b12506e95b8,x_HPKBCrisisMt).
xc_source_file(a65b12506e95b8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95b8,20518).
xc_kb_names(a65b12506e95b8,[]).
xc_mapping_rows(a65b12506e95b8,[]).
xc_direction(a65b12506e95b8,':FORWARD').
xc_monotonicity(a65b12506e95b8,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_France) :- x_cid(a65b12506e95b9).
xc_microtheory(a65b12506e95b9,x_HPKBCrisisMt).
xc_source_file(a65b12506e95b9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95b9,20524).
xc_kb_names(a65b12506e95b9,[]).
xc_mapping_rows(a65b12506e95b9,[]).
xc_direction(a65b12506e95b9,':FORWARD').
xc_monotonicity(a65b12506e95b9,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_Egypt) :- x_cid(a65b12506e95ba).
xc_microtheory(a65b12506e95ba,x_HPKBCrisisMt).
xc_source_file(a65b12506e95ba,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95ba,20530).
xc_kb_names(a65b12506e95ba,[]).
xc_mapping_rows(a65b12506e95ba,[]).
xc_direction(a65b12506e95ba,':FORWARD').
xc_monotonicity(a65b12506e95ba,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_Czechoslovakia) :- x_cid(a65b12506e95bb).
xc_microtheory(a65b12506e95bb,x_HPKBCrisisMt).
xc_source_file(a65b12506e95bb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95bb,20536).
xc_kb_names(a65b12506e95bb,[]).
xc_mapping_rows(a65b12506e95bb,[]).
xc_direction(a65b12506e95bb,':FORWARD').
xc_monotonicity(a65b12506e95bb,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_Canada) :- x_cid(a65b12506e95bc).
xc_microtheory(a65b12506e95bc,x_HPKBCrisisMt).
xc_source_file(a65b12506e95bc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95bc,20542).
xc_kb_names(a65b12506e95bc,[]).
xc_mapping_rows(a65b12506e95bc,[]).
xc_direction(a65b12506e95bc,':FORWARD').
xc_monotonicity(a65b12506e95bc,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_Belgium) :- x_cid(a65b12506e95bd).
xc_microtheory(a65b12506e95bd,x_HPKBCrisisMt).
xc_source_file(a65b12506e95bd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95bd,20548).
xc_kb_names(a65b12506e95bd,[]).
xc_mapping_rows(a65b12506e95bd,[]).
xc_direction(a65b12506e95bd,':FORWARD').
xc_monotonicity(a65b12506e95bd,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_Bangladesh) :- x_cid(a65b12506e95be).
xc_microtheory(a65b12506e95be,x_HPKBCrisisMt).
xc_source_file(a65b12506e95be,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95be,20554).
xc_kb_names(a65b12506e95be,[]).
xc_mapping_rows(a65b12506e95be,[]).
xc_direction(a65b12506e95be,':FORWARD').
xc_monotonicity(a65b12506e95be,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_Australia) :- x_cid(a65b12506e95bf).
xc_microtheory(a65b12506e95bf,x_HPKBCrisisMt).
xc_source_file(a65b12506e95bf,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95bf,20560).
xc_kb_names(a65b12506e95bf,[]).
xc_mapping_rows(a65b12506e95bf,[]).
xc_direction(a65b12506e95bf,':FORWARD').
xc_monotonicity(a65b12506e95bf,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_Afghanistan) :- x_cid(a65b12506e95c0).
xc_microtheory(a65b12506e95c0,x_HPKBCrisisMt).
xc_source_file(a65b12506e95c0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95c0,20566).
xc_kb_names(a65b12506e95c0,[]).
xc_mapping_rows(a65b12506e95c0,[]).
xc_direction(a65b12506e95c0,':FORWARD').
xc_monotonicity(a65b12506e95c0,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_Kuwait) :- x_cid(a65b12506e95c1).
xc_microtheory(a65b12506e95c1,x_HPKBCrisisMt).
xc_source_file(a65b12506e95c1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95c1,20572).
xc_kb_names(a65b12506e95c1,[]).
xc_mapping_rows(a65b12506e95c1,[]).
xc_direction(a65b12506e95c1,':FORWARD').
xc_monotonicity(a65b12506e95c1,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_SaudiArabia) :- x_cid(a65b12506e95c2).
xc_microtheory(a65b12506e95c2,x_HPKBCrisisMt).
xc_source_file(a65b12506e95c2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95c2,20578).
xc_kb_names(a65b12506e95c2,[]).
xc_mapping_rows(a65b12506e95c2,[]).
xc_direction(a65b12506e95c2,':FORWARD').
xc_monotonicity(a65b12506e95c2,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_UnitedStatesOfAmerica) :- x_cid(a65b12506e95c3).
xc_microtheory(a65b12506e95c3,x_HPKBCrisisMt).
xc_source_file(a65b12506e95c3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95c3,20584).
xc_kb_names(a65b12506e95c3,[]).
xc_mapping_rows(a65b12506e95c3,[]).
xc_direction(a65b12506e95c3,':FORWARD').
xc_monotonicity(a65b12506e95c3,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_Qatar) :- x_cid(a65b12506e95c4).
xc_microtheory(a65b12506e95c4,x_HPKBCrisisMt).
xc_source_file(a65b12506e95c4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95c4,20590).
xc_kb_names(a65b12506e95c4,[]).
xc_mapping_rows(a65b12506e95c4,[]).
xc_direction(a65b12506e95c4,':FORWARD').
xc_monotonicity(a65b12506e95c4,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_Romania) :- x_cid(a65b12506e95c5).
xc_microtheory(a65b12506e95c5,x_HPKBCrisisMt).
xc_source_file(a65b12506e95c5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95c5,20596).
xc_kb_names(a65b12506e95c5,[]).
xc_mapping_rows(a65b12506e95c5,[]).
xc_direction(a65b12506e95c5,':FORWARD').
xc_monotonicity(a65b12506e95c5,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_SouthKorea) :- x_cid(a65b12506e95c6).
xc_microtheory(a65b12506e95c6,x_HPKBCrisisMt).
xc_source_file(a65b12506e95c6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95c6,20602).
xc_kb_names(a65b12506e95c6,[]).
xc_mapping_rows(a65b12506e95c6,[]).
xc_direction(a65b12506e95c6,':FORWARD').
xc_monotonicity(a65b12506e95c6,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_Syria) :- x_cid(a65b12506e95c7).
xc_microtheory(a65b12506e95c7,x_HPKBCrisisMt).
xc_source_file(a65b12506e95c7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95c7,20608).
xc_kb_names(a65b12506e95c7,[]).
xc_mapping_rows(a65b12506e95c7,[]).
xc_direction(a65b12506e95c7,':FORWARD').
xc_monotonicity(a65b12506e95c7,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_UnitedArabEmirates) :- x_cid(a65b12506e95c8).
xc_microtheory(a65b12506e95c8,x_HPKBCrisisMt).
xc_source_file(a65b12506e95c8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95c8,20614).
xc_kb_names(a65b12506e95c8,[]).
xc_mapping_rows(a65b12506e95c8,[]).
xc_direction(a65b12506e95c8,':FORWARD').
xc_monotonicity(a65b12506e95c8,':DEFAULT').
x_thereExists(V1,x_isa(V1,'x_BallisticMissile-CSS8')) :- x_cid(a65b12506e95c9,V1).
xc_microtheory(a65b12506e95c9,x_HPKBCrisisMt).
xc_source_file(a65b12506e95c9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95c9,20620).
xc_kb_names(a65b12506e95c9,["?MISSILE"]).
xc_mapping_rows(a65b12506e95c9,['exists-thereexists']).
xc_direction(a65b12506e95c9,':FORWARD').
xc_monotonicity(a65b12506e95c9,':DEFAULT').
xc_creator(a65b12506e95c9,'OKeefe').
xc_creation_date(a65b12506e95c9,19971125).
x_thereExists(V1,x_possesses(x_Iran,V1)) :- x_cid(a65b12506e95ca,V1).
xc_microtheory(a65b12506e95ca,x_HPKBCrisisMt).
xc_source_file(a65b12506e95ca,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95ca,20628).
xc_kb_names(a65b12506e95ca,["?MISSILE"]).
xc_mapping_rows(a65b12506e95ca,['exists-thereexists']).
xc_direction(a65b12506e95ca,':FORWARD').
xc_monotonicity(a65b12506e95ca,':DEFAULT').
xc_creator(a65b12506e95ca,'OKeefe').
xc_creation_date(a65b12506e95ca,19971125).
x_resultIsa('x_SKF-45777401','x_BallisticMissile-CSS8') :- x_cid(a65b12506e95cb).
xc_microtheory(a65b12506e95cb,x_HPKBCrisisMt).
xc_source_file(a65b12506e95cb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95cb,20636).
xc_kb_names(a65b12506e95cb,[]).
xc_mapping_rows(a65b12506e95cb,[]).
xc_direction(a65b12506e95cb,':FORWARD').
xc_monotonicity(a65b12506e95cb,':DEFAULT').
x_arity('x_SKF-45777401',0) :- x_cid(a65b12506e95cc).
xc_microtheory(a65b12506e95cc,x_HPKBCrisisMt).
xc_source_file(a65b12506e95cc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95cc,20642).
xc_kb_names(a65b12506e95cc,[]).
xc_mapping_rows(a65b12506e95cc,[]).
xc_direction(a65b12506e95cc,':FORWARD').
xc_monotonicity(a65b12506e95cc,':MONOTONIC').
x_isa('x_SKF-45777401',x_SkolemFunction) :- x_cid(a65b12506e95cd).
xc_microtheory(a65b12506e95cd,x_HPKBCrisisMt).
xc_source_file(a65b12506e95cd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95cd,20648).
xc_kb_names(a65b12506e95cd,[]).
xc_mapping_rows(a65b12506e95cd,[]).
xc_direction(a65b12506e95cd,':FORWARD').
xc_monotonicity(a65b12506e95cd,':MONOTONIC').
x_thereExists(V1,x_isa(V1,'x_BallisticMissile-Mushak120')) :- x_cid(a65b12506e95ce,V1).
xc_microtheory(a65b12506e95ce,x_HPKBCrisisMt).
xc_source_file(a65b12506e95ce,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95ce,20654).
xc_kb_names(a65b12506e95ce,["?MISSILE"]).
xc_mapping_rows(a65b12506e95ce,['exists-thereexists']).
xc_direction(a65b12506e95ce,':FORWARD').
xc_monotonicity(a65b12506e95ce,':DEFAULT').
xc_creator(a65b12506e95ce,'OKeefe').
xc_creation_date(a65b12506e95ce,19971125).
x_thereExists(V1,x_possesses(x_Iran,V1)) :- x_cid(a65b12506e95cf,V1).
xc_microtheory(a65b12506e95cf,x_HPKBCrisisMt).
xc_source_file(a65b12506e95cf,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95cf,20662).
xc_kb_names(a65b12506e95cf,["?MISSILE"]).
xc_mapping_rows(a65b12506e95cf,['exists-thereexists']).
xc_direction(a65b12506e95cf,':FORWARD').
xc_monotonicity(a65b12506e95cf,':DEFAULT').
xc_creator(a65b12506e95cf,'OKeefe').
xc_creation_date(a65b12506e95cf,19971125).
x_resultIsa('x_SKF-906137','x_BallisticMissile-Mushak120') :- x_cid(a65b12506e95d0).
xc_microtheory(a65b12506e95d0,x_HPKBCrisisMt).
xc_source_file(a65b12506e95d0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95d0,20670).
xc_kb_names(a65b12506e95d0,[]).
xc_mapping_rows(a65b12506e95d0,[]).
xc_direction(a65b12506e95d0,':FORWARD').
xc_monotonicity(a65b12506e95d0,':DEFAULT').
x_arity('x_SKF-906137',0) :- x_cid(a65b12506e95d1).
xc_microtheory(a65b12506e95d1,x_HPKBCrisisMt).
xc_source_file(a65b12506e95d1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95d1,20676).
xc_kb_names(a65b12506e95d1,[]).
xc_mapping_rows(a65b12506e95d1,[]).
xc_direction(a65b12506e95d1,':FORWARD').
xc_monotonicity(a65b12506e95d1,':MONOTONIC').
x_isa('x_SKF-906137',x_SkolemFunction) :- x_cid(a65b12506e95d2).
xc_microtheory(a65b12506e95d2,x_HPKBCrisisMt).
xc_source_file(a65b12506e95d2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95d2,20682).
xc_kb_names(a65b12506e95d2,[]).
xc_mapping_rows(a65b12506e95d2,[]).
xc_direction(a65b12506e95d2,':FORWARD').
xc_monotonicity(a65b12506e95d2,':MONOTONIC').
x_thereExists(V1,x_isa(V1,'x_BallisticMissile-Mushak160')) :- x_cid(a65b12506e95d3,V1).
xc_microtheory(a65b12506e95d3,x_HPKBCrisisMt).
xc_source_file(a65b12506e95d3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95d3,20688).
xc_kb_names(a65b12506e95d3,["?MISSILE"]).
xc_mapping_rows(a65b12506e95d3,['exists-thereexists']).
xc_direction(a65b12506e95d3,':FORWARD').
xc_monotonicity(a65b12506e95d3,':DEFAULT').
xc_creator(a65b12506e95d3,'OKeefe').
xc_creation_date(a65b12506e95d3,19971125).
x_thereExists(V1,x_possesses(x_Iran,V1)) :- x_cid(a65b12506e95d4,V1).
xc_microtheory(a65b12506e95d4,x_HPKBCrisisMt).
xc_source_file(a65b12506e95d4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95d4,20696).
xc_kb_names(a65b12506e95d4,["?MISSILE"]).
xc_mapping_rows(a65b12506e95d4,['exists-thereexists']).
xc_direction(a65b12506e95d4,':FORWARD').
xc_monotonicity(a65b12506e95d4,':DEFAULT').
xc_creator(a65b12506e95d4,'OKeefe').
xc_creation_date(a65b12506e95d4,19971125).
x_resultIsa('x_SKF-3247485','x_BallisticMissile-Mushak160') :- x_cid(a65b12506e95d5).
xc_microtheory(a65b12506e95d5,x_HPKBCrisisMt).
xc_source_file(a65b12506e95d5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95d5,20704).
xc_kb_names(a65b12506e95d5,[]).
xc_mapping_rows(a65b12506e95d5,[]).
xc_direction(a65b12506e95d5,':FORWARD').
xc_monotonicity(a65b12506e95d5,':DEFAULT').
x_arity('x_SKF-3247485',0) :- x_cid(a65b12506e95d6).
xc_microtheory(a65b12506e95d6,x_HPKBCrisisMt).
xc_source_file(a65b12506e95d6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95d6,20710).
xc_kb_names(a65b12506e95d6,[]).
xc_mapping_rows(a65b12506e95d6,[]).
xc_direction(a65b12506e95d6,':FORWARD').
xc_monotonicity(a65b12506e95d6,':MONOTONIC').
x_isa('x_SKF-3247485',x_SkolemFunction) :- x_cid(a65b12506e95d7).
xc_microtheory(a65b12506e95d7,x_HPKBCrisisMt).
xc_source_file(a65b12506e95d7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95d7,20716).
xc_kb_names(a65b12506e95d7,[]).
xc_mapping_rows(a65b12506e95d7,[]).
xc_direction(a65b12506e95d7,':FORWARD').
xc_monotonicity(a65b12506e95d7,':MONOTONIC').
x_thereExists(V1,x_isa(V1,'x_BallisticMissile-Mushak200')) :- x_cid(a65b12506e95d8,V1).
xc_microtheory(a65b12506e95d8,x_HPKBCrisisMt).
xc_source_file(a65b12506e95d8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95d8,20722).
xc_kb_names(a65b12506e95d8,["?MISSILE"]).
xc_mapping_rows(a65b12506e95d8,['exists-thereexists']).
xc_direction(a65b12506e95d8,':FORWARD').
xc_monotonicity(a65b12506e95d8,':DEFAULT').
xc_creator(a65b12506e95d8,'OKeefe').
xc_creation_date(a65b12506e95d8,19971125).
x_thereExists(V1,x_possesses(x_Iran,V1)) :- x_cid(a65b12506e95d9,V1).
xc_microtheory(a65b12506e95d9,x_HPKBCrisisMt).
xc_source_file(a65b12506e95d9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95d9,20730).
xc_kb_names(a65b12506e95d9,["?MISSILE"]).
xc_mapping_rows(a65b12506e95d9,['exists-thereexists']).
xc_direction(a65b12506e95d9,':FORWARD').
xc_monotonicity(a65b12506e95d9,':DEFAULT').
xc_creator(a65b12506e95d9,'OKeefe').
xc_creation_date(a65b12506e95d9,19971125).
x_resultIsa('x_SKF-5393361','x_BallisticMissile-Mushak200') :- x_cid(a65b12506e95da).
xc_microtheory(a65b12506e95da,x_HPKBCrisisMt).
xc_source_file(a65b12506e95da,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95da,20738).
xc_kb_names(a65b12506e95da,[]).
xc_mapping_rows(a65b12506e95da,[]).
xc_direction(a65b12506e95da,':FORWARD').
xc_monotonicity(a65b12506e95da,':DEFAULT').
x_arity('x_SKF-5393361',0) :- x_cid(a65b12506e95db).
xc_microtheory(a65b12506e95db,x_HPKBCrisisMt).
xc_source_file(a65b12506e95db,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95db,20744).
xc_kb_names(a65b12506e95db,[]).
xc_mapping_rows(a65b12506e95db,[]).
xc_direction(a65b12506e95db,':FORWARD').
xc_monotonicity(a65b12506e95db,':MONOTONIC').
x_isa('x_SKF-5393361',x_SkolemFunction) :- x_cid(a65b12506e95dc).
xc_microtheory(a65b12506e95dc,x_HPKBCrisisMt).
xc_source_file(a65b12506e95dc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95dc,20750).
xc_kb_names(a65b12506e95dc,[]).
xc_mapping_rows(a65b12506e95dc,[]).
xc_direction(a65b12506e95dc,':FORWARD').
xc_monotonicity(a65b12506e95dc,':MONOTONIC').
x_thereExists(V1,x_isa(V1,'x_BallisticMissile-SCUDC')) :- x_cid(a65b12506e95dd,V1).
xc_microtheory(a65b12506e95dd,x_HPKBCrisisMt).
xc_source_file(a65b12506e95dd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95dd,20756).
xc_kb_names(a65b12506e95dd,["?MISSILE"]).
xc_mapping_rows(a65b12506e95dd,['exists-thereexists']).
xc_direction(a65b12506e95dd,':FORWARD').
xc_monotonicity(a65b12506e95dd,':DEFAULT').
xc_creator(a65b12506e95dd,'OKeefe').
xc_creation_date(a65b12506e95dd,19971125).
x_thereExists(V1,x_possesses(x_Iran,V1)) :- x_cid(a65b12506e95de,V1).
xc_microtheory(a65b12506e95de,x_HPKBCrisisMt).
xc_source_file(a65b12506e95de,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95de,20764).
xc_kb_names(a65b12506e95de,["?MISSILE"]).
xc_mapping_rows(a65b12506e95de,['exists-thereexists']).
xc_direction(a65b12506e95de,':FORWARD').
xc_monotonicity(a65b12506e95de,':DEFAULT').
xc_creator(a65b12506e95de,'OKeefe').
xc_creation_date(a65b12506e95de,19971125).
x_resultIsa('x_SKF-55392675','x_BallisticMissile-SCUDC') :- x_cid(a65b12506e95df).
xc_microtheory(a65b12506e95df,x_HPKBCrisisMt).
xc_source_file(a65b12506e95df,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95df,20772).
xc_kb_names(a65b12506e95df,[]).
xc_mapping_rows(a65b12506e95df,[]).
xc_direction(a65b12506e95df,':FORWARD').
xc_monotonicity(a65b12506e95df,':DEFAULT').
x_arity('x_SKF-55392675',0) :- x_cid(a65b12506e95e0).
xc_microtheory(a65b12506e95e0,x_HPKBCrisisMt).
xc_source_file(a65b12506e95e0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95e0,20778).
xc_kb_names(a65b12506e95e0,[]).
xc_mapping_rows(a65b12506e95e0,[]).
xc_direction(a65b12506e95e0,':FORWARD').
xc_monotonicity(a65b12506e95e0,':MONOTONIC').
x_isa('x_SKF-55392675',x_SkolemFunction) :- x_cid(a65b12506e95e1).
xc_microtheory(a65b12506e95e1,x_HPKBCrisisMt).
xc_source_file(a65b12506e95e1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95e1,20784).
xc_kb_names(a65b12506e95e1,[]).
xc_mapping_rows(a65b12506e95e1,[]).
xc_direction(a65b12506e95e1,':FORWARD').
xc_monotonicity(a65b12506e95e1,':MONOTONIC').
x_thereExists(V1,x_isa(V1,'x_BallisticMissile-M11')) :- x_cid(a65b12506e95e2,V1).
xc_microtheory(a65b12506e95e2,x_HPKBCrisisMt).
xc_source_file(a65b12506e95e2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95e2,20790).
xc_kb_names(a65b12506e95e2,["?MISSILE"]).
xc_mapping_rows(a65b12506e95e2,['exists-thereexists']).
xc_direction(a65b12506e95e2,':FORWARD').
xc_monotonicity(a65b12506e95e2,':DEFAULT').
xc_creator(a65b12506e95e2,'OKeefe').
xc_creation_date(a65b12506e95e2,19971125).
x_thereExists(V1,x_possesses(x_Iran,V1)) :- x_cid(a65b12506e95e3,V1).
xc_microtheory(a65b12506e95e3,x_HPKBCrisisMt).
xc_source_file(a65b12506e95e3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95e3,20798).
xc_kb_names(a65b12506e95e3,["?MISSILE"]).
xc_mapping_rows(a65b12506e95e3,['exists-thereexists']).
xc_direction(a65b12506e95e3,':FORWARD').
xc_monotonicity(a65b12506e95e3,':DEFAULT').
xc_creator(a65b12506e95e3,'OKeefe').
xc_creation_date(a65b12506e95e3,19971125).
x_resultIsa('x_SKF-24405989','x_BallisticMissile-M11') :- x_cid(a65b12506e95e4).
xc_microtheory(a65b12506e95e4,x_HPKBCrisisMt).
xc_source_file(a65b12506e95e4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95e4,20806).
xc_kb_names(a65b12506e95e4,[]).
xc_mapping_rows(a65b12506e95e4,[]).
xc_direction(a65b12506e95e4,':FORWARD').
xc_monotonicity(a65b12506e95e4,':DEFAULT').
x_arity('x_SKF-24405989',0) :- x_cid(a65b12506e95e5).
xc_microtheory(a65b12506e95e5,x_HPKBCrisisMt).
xc_source_file(a65b12506e95e5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95e5,20812).
xc_kb_names(a65b12506e95e5,[]).
xc_mapping_rows(a65b12506e95e5,[]).
xc_direction(a65b12506e95e5,':FORWARD').
xc_monotonicity(a65b12506e95e5,':MONOTONIC').
x_isa('x_SKF-24405989',x_SkolemFunction) :- x_cid(a65b12506e95e6).
xc_microtheory(a65b12506e95e6,x_HPKBCrisisMt).
xc_source_file(a65b12506e95e6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95e6,20818).
xc_kb_names(a65b12506e95e6,[]).
xc_mapping_rows(a65b12506e95e6,[]).
xc_direction(a65b12506e95e6,':FORWARD').
xc_monotonicity(a65b12506e95e6,':MONOTONIC').
x_thereExists(V1,x_isa(V1,'x_BallisticMissile-SCUDB')) :- x_cid(a65b12506e95e7,V1).
xc_microtheory(a65b12506e95e7,x_HPKBCrisisMt).
xc_source_file(a65b12506e95e7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95e7,20824).
xc_kb_names(a65b12506e95e7,["?MISSILE"]).
xc_mapping_rows(a65b12506e95e7,['exists-thereexists']).
xc_direction(a65b12506e95e7,':FORWARD').
xc_monotonicity(a65b12506e95e7,':DEFAULT').
xc_creator(a65b12506e95e7,'OKeefe').
xc_creation_date(a65b12506e95e7,19971125).
x_thereExists(V1,x_possesses(x_Iran,V1)) :- x_cid(a65b12506e95e8,V1).
xc_microtheory(a65b12506e95e8,x_HPKBCrisisMt).
xc_source_file(a65b12506e95e8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95e8,20832).
xc_kb_names(a65b12506e95e8,["?MISSILE"]).
xc_mapping_rows(a65b12506e95e8,['exists-thereexists']).
xc_direction(a65b12506e95e8,':FORWARD').
xc_monotonicity(a65b12506e95e8,':DEFAULT').
xc_creator(a65b12506e95e8,'OKeefe').
xc_creation_date(a65b12506e95e8,19971125).
x_resultIsa('x_SKF-41511095','x_BallisticMissile-SCUDB') :- x_cid(a65b12506e95e9).
xc_microtheory(a65b12506e95e9,x_HPKBCrisisMt).
xc_source_file(a65b12506e95e9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95e9,20840).
xc_kb_names(a65b12506e95e9,[]).
xc_mapping_rows(a65b12506e95e9,[]).
xc_direction(a65b12506e95e9,':FORWARD').
xc_monotonicity(a65b12506e95e9,':DEFAULT').
x_arity('x_SKF-41511095',0) :- x_cid(a65b12506e95ea).
xc_microtheory(a65b12506e95ea,x_HPKBCrisisMt).
xc_source_file(a65b12506e95ea,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95ea,20846).
xc_kb_names(a65b12506e95ea,[]).
xc_mapping_rows(a65b12506e95ea,[]).
xc_direction(a65b12506e95ea,':FORWARD').
xc_monotonicity(a65b12506e95ea,':MONOTONIC').
x_isa('x_SKF-41511095',x_SkolemFunction) :- x_cid(a65b12506e95eb).
xc_microtheory(a65b12506e95eb,x_HPKBCrisisMt).
xc_source_file(a65b12506e95eb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95eb,20852).
xc_kb_names(a65b12506e95eb,[]).
xc_mapping_rows(a65b12506e95eb,[]).
xc_direction(a65b12506e95eb,':FORWARD').
xc_monotonicity(a65b12506e95eb,':MONOTONIC').
x_thereExists(V1,x_possesses(x_Iran,V1)) :- x_cid(a65b12506e95ec,V1).
xc_microtheory(a65b12506e95ec,x_HPKBCrisisMt).
xc_source_file(a65b12506e95ec,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95ec,20858).
xc_kb_names(a65b12506e95ec,["?GROUP"]).
xc_mapping_rows(a65b12506e95ec,['exists-thereexists']).
xc_direction(a65b12506e95ec,':FORWARD').
xc_monotonicity(a65b12506e95ec,':DEFAULT').
xc_creator(a65b12506e95ec,'OKeefe').
xc_creation_date(a65b12506e95ec,19971125).
x_thereExists(V1,x_isa(V1,x_GroupFn('x_BallisticMissile-M11'))) :- x_cid(a65b12506e95ed,V1).
xc_microtheory(a65b12506e95ed,x_HPKBCrisisMt).
xc_source_file(a65b12506e95ed,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95ed,20866).
xc_kb_names(a65b12506e95ed,["?GROUP"]).
xc_mapping_rows(a65b12506e95ed,['exists-thereexists']).
xc_direction(a65b12506e95ed,':FORWARD').
xc_monotonicity(a65b12506e95ed,':DEFAULT').
xc_creator(a65b12506e95ed,'OKeefe').
xc_creation_date(a65b12506e95ed,19971125).
x_resultIsa('x_SKF-17651656',x_GroupFn('x_BallisticMissile-M11')) :- x_cid(a65b12506e95ee).
xc_microtheory(a65b12506e95ee,x_HPKBCrisisMt).
xc_source_file(a65b12506e95ee,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95ee,20875).
xc_kb_names(a65b12506e95ee,[]).
xc_mapping_rows(a65b12506e95ee,[]).
xc_direction(a65b12506e95ee,':FORWARD').
xc_monotonicity(a65b12506e95ee,':DEFAULT').
x_arity('x_SKF-17651656',0) :- x_cid(a65b12506e95ef).
xc_microtheory(a65b12506e95ef,x_HPKBCrisisMt).
xc_source_file(a65b12506e95ef,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95ef,20882).
xc_kb_names(a65b12506e95ef,[]).
xc_mapping_rows(a65b12506e95ef,[]).
xc_direction(a65b12506e95ef,':FORWARD').
xc_monotonicity(a65b12506e95ef,':MONOTONIC').
x_isa('x_SKF-17651656',x_SkolemFunction) :- x_cid(a65b12506e95f0).
xc_microtheory(a65b12506e95f0,x_HPKBCrisisMt).
xc_source_file(a65b12506e95f0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95f0,20888).
xc_kb_names(a65b12506e95f0,[]).
xc_mapping_rows(a65b12506e95f0,[]).
xc_direction(a65b12506e95f0,':FORWARD').
xc_monotonicity(a65b12506e95f0,':MONOTONIC').
x_thereExists(V1,x_possesses(x_Iran,V1)) :- x_cid(a65b12506e95f1,V1).
xc_microtheory(a65b12506e95f1,x_HPKBCrisisMt).
xc_source_file(a65b12506e95f1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95f1,20894).
xc_kb_names(a65b12506e95f1,["?GROUP"]).
xc_mapping_rows(a65b12506e95f1,['exists-thereexists']).
xc_direction(a65b12506e95f1,':FORWARD').
xc_monotonicity(a65b12506e95f1,':DEFAULT').
xc_creator(a65b12506e95f1,'OKeefe').
xc_creation_date(a65b12506e95f1,19971125).
x_thereExists(V1,x_isa(V1,x_GroupFn('x_BallisticMissile-CSS8'))) :- x_cid(a65b12506e95f2,V1).
xc_microtheory(a65b12506e95f2,x_HPKBCrisisMt).
xc_source_file(a65b12506e95f2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95f2,20902).
xc_kb_names(a65b12506e95f2,["?GROUP"]).
xc_mapping_rows(a65b12506e95f2,['exists-thereexists']).
xc_direction(a65b12506e95f2,':FORWARD').
xc_monotonicity(a65b12506e95f2,':DEFAULT').
xc_creator(a65b12506e95f2,'OKeefe').
xc_creation_date(a65b12506e95f2,19971125).
x_resultIsa('x_SKF-51633710',x_GroupFn('x_BallisticMissile-CSS8')) :- x_cid(a65b12506e95f3).
xc_microtheory(a65b12506e95f3,x_HPKBCrisisMt).
xc_source_file(a65b12506e95f3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95f3,20911).
xc_kb_names(a65b12506e95f3,[]).
xc_mapping_rows(a65b12506e95f3,[]).
xc_direction(a65b12506e95f3,':FORWARD').
xc_monotonicity(a65b12506e95f3,':DEFAULT').
x_arity('x_SKF-51633710',0) :- x_cid(a65b12506e95f4).
xc_microtheory(a65b12506e95f4,x_HPKBCrisisMt).
xc_source_file(a65b12506e95f4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95f4,20918).
xc_kb_names(a65b12506e95f4,[]).
xc_mapping_rows(a65b12506e95f4,[]).
xc_direction(a65b12506e95f4,':FORWARD').
xc_monotonicity(a65b12506e95f4,':MONOTONIC').
x_isa('x_SKF-51633710',x_SkolemFunction) :- x_cid(a65b12506e95f5).
xc_microtheory(a65b12506e95f5,x_HPKBCrisisMt).
xc_source_file(a65b12506e95f5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95f5,20924).
xc_kb_names(a65b12506e95f5,[]).
xc_mapping_rows(a65b12506e95f5,[]).
xc_direction(a65b12506e95f5,':FORWARD').
xc_monotonicity(a65b12506e95f5,':MONOTONIC').
x_thereExists(V1,x_possesses(x_Iran,V1)) :- x_cid(a65b12506e95f6,V1).
xc_microtheory(a65b12506e95f6,x_HPKBCrisisMt).
xc_source_file(a65b12506e95f6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95f6,20930).
xc_kb_names(a65b12506e95f6,["?GROUP"]).
xc_mapping_rows(a65b12506e95f6,['exists-thereexists']).
xc_direction(a65b12506e95f6,':FORWARD').
xc_monotonicity(a65b12506e95f6,':DEFAULT').
xc_creator(a65b12506e95f6,'OKeefe').
xc_creation_date(a65b12506e95f6,19971125).
x_thereExists(V1,x_isa(V1,x_GroupFn('x_BallisticMissile-SCUDC'))) :- x_cid(a65b12506e95f7,V1).
xc_microtheory(a65b12506e95f7,x_HPKBCrisisMt).
xc_source_file(a65b12506e95f7,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95f7,20938).
xc_kb_names(a65b12506e95f7,["?GROUP"]).
xc_mapping_rows(a65b12506e95f7,['exists-thereexists']).
xc_direction(a65b12506e95f7,':FORWARD').
xc_monotonicity(a65b12506e95f7,':DEFAULT').
xc_creator(a65b12506e95f7,'OKeefe').
xc_creation_date(a65b12506e95f7,19971125).
x_resultIsa('x_SKF-17345463',x_GroupFn('x_BallisticMissile-SCUDC')) :- x_cid(a65b12506e95f8).
xc_microtheory(a65b12506e95f8,x_HPKBCrisisMt).
xc_source_file(a65b12506e95f8,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95f8,20947).
xc_kb_names(a65b12506e95f8,[]).
xc_mapping_rows(a65b12506e95f8,[]).
xc_direction(a65b12506e95f8,':FORWARD').
xc_monotonicity(a65b12506e95f8,':DEFAULT').
x_arity('x_SKF-17345463',0) :- x_cid(a65b12506e95f9).
xc_microtheory(a65b12506e95f9,x_HPKBCrisisMt).
xc_source_file(a65b12506e95f9,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95f9,20954).
xc_kb_names(a65b12506e95f9,[]).
xc_mapping_rows(a65b12506e95f9,[]).
xc_direction(a65b12506e95f9,':FORWARD').
xc_monotonicity(a65b12506e95f9,':MONOTONIC').
x_isa('x_SKF-17345463',x_SkolemFunction) :- x_cid(a65b12506e95fa).
xc_microtheory(a65b12506e95fa,x_HPKBCrisisMt).
xc_source_file(a65b12506e95fa,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95fa,20960).
xc_kb_names(a65b12506e95fa,[]).
xc_mapping_rows(a65b12506e95fa,[]).
xc_direction(a65b12506e95fa,':FORWARD').
xc_monotonicity(a65b12506e95fa,':MONOTONIC').
x_thereExists(V1,x_possesses(x_Iran,V1)) :- x_cid(a65b12506e95fb,V1).
xc_microtheory(a65b12506e95fb,x_HPKBCrisisMt).
xc_source_file(a65b12506e95fb,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95fb,20966).
xc_kb_names(a65b12506e95fb,["?GROUP"]).
xc_mapping_rows(a65b12506e95fb,['exists-thereexists']).
xc_direction(a65b12506e95fb,':FORWARD').
xc_monotonicity(a65b12506e95fb,':DEFAULT').
xc_creator(a65b12506e95fb,'OKeefe').
xc_creation_date(a65b12506e95fb,19971125).
x_thereExists(V1,x_isa(V1,x_GroupFn('x_BallisticMissile-SCUDB'))) :- x_cid(a65b12506e95fc,V1).
xc_microtheory(a65b12506e95fc,x_HPKBCrisisMt).
xc_source_file(a65b12506e95fc,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95fc,20974).
xc_kb_names(a65b12506e95fc,["?GROUP"]).
xc_mapping_rows(a65b12506e95fc,['exists-thereexists']).
xc_direction(a65b12506e95fc,':FORWARD').
xc_monotonicity(a65b12506e95fc,':DEFAULT').
xc_creator(a65b12506e95fc,'OKeefe').
xc_creation_date(a65b12506e95fc,19971125).
x_resultIsa('x_SKF-9855449',x_GroupFn('x_BallisticMissile-SCUDB')) :- x_cid(a65b12506e95fd).
xc_microtheory(a65b12506e95fd,x_HPKBCrisisMt).
xc_source_file(a65b12506e95fd,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95fd,20983).
xc_kb_names(a65b12506e95fd,[]).
xc_mapping_rows(a65b12506e95fd,[]).
xc_direction(a65b12506e95fd,':FORWARD').
xc_monotonicity(a65b12506e95fd,':DEFAULT').
x_arity('x_SKF-9855449',0) :- x_cid(a65b12506e95fe).
xc_microtheory(a65b12506e95fe,x_HPKBCrisisMt).
xc_source_file(a65b12506e95fe,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95fe,20990).
xc_kb_names(a65b12506e95fe,[]).
xc_mapping_rows(a65b12506e95fe,[]).
xc_direction(a65b12506e95fe,':FORWARD').
xc_monotonicity(a65b12506e95fe,':MONOTONIC').
x_isa('x_SKF-9855449',x_SkolemFunction) :- x_cid(a65b12506e95ff).
xc_microtheory(a65b12506e95ff,x_HPKBCrisisMt).
xc_source_file(a65b12506e95ff,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e95ff,20996).
xc_kb_names(a65b12506e95ff,[]).
xc_mapping_rows(a65b12506e95ff,[]).
xc_direction(a65b12506e95ff,':FORWARD').
xc_monotonicity(a65b12506e95ff,':MONOTONIC').
x_thereExists(V1,x_possesses(x_Iran,V1)) :- x_cid(a65b12506e9600,V1).
xc_microtheory(a65b12506e9600,x_HPKBCrisisMt).
xc_source_file(a65b12506e9600,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9600,21002).
xc_kb_names(a65b12506e9600,["?GROUP"]).
xc_mapping_rows(a65b12506e9600,['exists-thereexists']).
xc_direction(a65b12506e9600,':FORWARD').
xc_monotonicity(a65b12506e9600,':DEFAULT').
xc_creator(a65b12506e9600,'OKeefe').
xc_creation_date(a65b12506e9600,19971125).
x_thereExists(V1,x_isa(V1,x_GroupFn('x_BallisticMissile-Mushak200'))) :- x_cid(a65b12506e9601,V1).
xc_microtheory(a65b12506e9601,x_HPKBCrisisMt).
xc_source_file(a65b12506e9601,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9601,21010).
xc_kb_names(a65b12506e9601,["?GROUP"]).
xc_mapping_rows(a65b12506e9601,['exists-thereexists']).
xc_direction(a65b12506e9601,':FORWARD').
xc_monotonicity(a65b12506e9601,':DEFAULT').
xc_creator(a65b12506e9601,'OKeefe').
xc_creation_date(a65b12506e9601,19971125).
x_resultIsa('x_SKF-53200158',x_GroupFn('x_BallisticMissile-Mushak200')) :- x_cid(a65b12506e9602).
xc_microtheory(a65b12506e9602,x_HPKBCrisisMt).
xc_source_file(a65b12506e9602,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9602,21019).
xc_kb_names(a65b12506e9602,[]).
xc_mapping_rows(a65b12506e9602,[]).
xc_direction(a65b12506e9602,':FORWARD').
xc_monotonicity(a65b12506e9602,':DEFAULT').
x_arity('x_SKF-53200158',0) :- x_cid(a65b12506e9603).
xc_microtheory(a65b12506e9603,x_HPKBCrisisMt).
xc_source_file(a65b12506e9603,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9603,21026).
xc_kb_names(a65b12506e9603,[]).
xc_mapping_rows(a65b12506e9603,[]).
xc_direction(a65b12506e9603,':FORWARD').
xc_monotonicity(a65b12506e9603,':MONOTONIC').
x_isa('x_SKF-53200158',x_SkolemFunction) :- x_cid(a65b12506e9604).
xc_microtheory(a65b12506e9604,x_HPKBCrisisMt).
xc_source_file(a65b12506e9604,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9604,21032).
xc_kb_names(a65b12506e9604,[]).
xc_mapping_rows(a65b12506e9604,[]).
xc_direction(a65b12506e9604,':FORWARD').
xc_monotonicity(a65b12506e9604,':MONOTONIC').
x_thereExists(V1,x_possesses(x_Iran,V1)) :- x_cid(a65b12506e9605,V1).
xc_microtheory(a65b12506e9605,x_HPKBCrisisMt).
xc_source_file(a65b12506e9605,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9605,21038).
xc_kb_names(a65b12506e9605,["?GROUP"]).
xc_mapping_rows(a65b12506e9605,['exists-thereexists']).
xc_direction(a65b12506e9605,':FORWARD').
xc_monotonicity(a65b12506e9605,':DEFAULT').
xc_creator(a65b12506e9605,'OKeefe').
xc_creation_date(a65b12506e9605,19971125).
x_thereExists(V1,x_isa(V1,x_GroupFn('x_BallisticMissile-Mushak160'))) :- x_cid(a65b12506e9606,V1).
xc_microtheory(a65b12506e9606,x_HPKBCrisisMt).
xc_source_file(a65b12506e9606,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9606,21046).
xc_kb_names(a65b12506e9606,["?GROUP"]).
xc_mapping_rows(a65b12506e9606,['exists-thereexists']).
xc_direction(a65b12506e9606,':FORWARD').
xc_monotonicity(a65b12506e9606,':DEFAULT').
xc_creator(a65b12506e9606,'OKeefe').
xc_creation_date(a65b12506e9606,19971125).
x_resultIsa('x_SKF-7364934',x_GroupFn('x_BallisticMissile-Mushak160')) :- x_cid(a65b12506e9607).
xc_microtheory(a65b12506e9607,x_HPKBCrisisMt).
xc_source_file(a65b12506e9607,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9607,21055).
xc_kb_names(a65b12506e9607,[]).
xc_mapping_rows(a65b12506e9607,[]).
xc_direction(a65b12506e9607,':FORWARD').
xc_monotonicity(a65b12506e9607,':DEFAULT').
x_arity('x_SKF-7364934',0) :- x_cid(a65b12506e9608).
xc_microtheory(a65b12506e9608,x_HPKBCrisisMt).
xc_source_file(a65b12506e9608,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9608,21062).
xc_kb_names(a65b12506e9608,[]).
xc_mapping_rows(a65b12506e9608,[]).
xc_direction(a65b12506e9608,':FORWARD').
xc_monotonicity(a65b12506e9608,':MONOTONIC').
x_isa('x_SKF-7364934',x_SkolemFunction) :- x_cid(a65b12506e9609).
xc_microtheory(a65b12506e9609,x_HPKBCrisisMt).
xc_source_file(a65b12506e9609,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9609,21068).
xc_kb_names(a65b12506e9609,[]).
xc_mapping_rows(a65b12506e9609,[]).
xc_direction(a65b12506e9609,':FORWARD').
xc_monotonicity(a65b12506e9609,':MONOTONIC').
x_thereExists(V1,x_possesses(x_Iran,V1)) :- x_cid(a65b12506e960a,V1).
xc_microtheory(a65b12506e960a,x_HPKBCrisisMt).
xc_source_file(a65b12506e960a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e960a,21074).
xc_kb_names(a65b12506e960a,["?GROUP"]).
xc_mapping_rows(a65b12506e960a,['exists-thereexists']).
xc_direction(a65b12506e960a,':FORWARD').
xc_monotonicity(a65b12506e960a,':DEFAULT').
xc_creator(a65b12506e960a,'OKeefe').
xc_creation_date(a65b12506e960a,19971125).
x_thereExists(V1,x_isa(V1,x_GroupFn('x_BallisticMissile-Mushak120'))) :- x_cid(a65b12506e960b,V1).
xc_microtheory(a65b12506e960b,x_HPKBCrisisMt).
xc_source_file(a65b12506e960b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e960b,21082).
xc_kb_names(a65b12506e960b,["?GROUP"]).
xc_mapping_rows(a65b12506e960b,['exists-thereexists']).
xc_direction(a65b12506e960b,':FORWARD').
xc_monotonicity(a65b12506e960b,':DEFAULT').
xc_creator(a65b12506e960b,'OKeefe').
xc_creation_date(a65b12506e960b,19971125).
x_resultIsa('x_SKF-46555292',x_GroupFn('x_BallisticMissile-Mushak120')) :- x_cid(a65b12506e960c).
xc_microtheory(a65b12506e960c,x_HPKBCrisisMt).
xc_source_file(a65b12506e960c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e960c,21091).
xc_kb_names(a65b12506e960c,[]).
xc_mapping_rows(a65b12506e960c,[]).
xc_direction(a65b12506e960c,':FORWARD').
xc_monotonicity(a65b12506e960c,':DEFAULT').
x_arity('x_SKF-46555292',0) :- x_cid(a65b12506e960d).
xc_microtheory(a65b12506e960d,x_HPKBCrisisMt).
xc_source_file(a65b12506e960d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e960d,21098).
xc_kb_names(a65b12506e960d,[]).
xc_mapping_rows(a65b12506e960d,[]).
xc_direction(a65b12506e960d,':FORWARD').
xc_monotonicity(a65b12506e960d,':MONOTONIC').
x_isa('x_SKF-46555292',x_SkolemFunction) :- x_cid(a65b12506e960e).
xc_microtheory(a65b12506e960e,x_HPKBCrisisMt).
xc_source_file(a65b12506e960e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e960e,21104).
xc_kb_names(a65b12506e960e,[]).
xc_mapping_rows(a65b12506e960e,[]).
xc_direction(a65b12506e960e,':FORWARD').
xc_monotonicity(a65b12506e960e,':MONOTONIC').
x_relationAllExists(x_physicalParts,x_AirDefenseSystem,x_AirDefenseWeapon) :- x_cid(a65b12506e960f).
xc_microtheory(a65b12506e960f,x_HPKBCrisisMt).
xc_source_file(a65b12506e960f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e960f,21110).
xc_kb_names(a65b12506e960f,[]).
xc_mapping_rows(a65b12506e960f,[]).
xc_direction(a65b12506e960f,':FORWARD').
xc_monotonicity(a65b12506e960f,':DEFAULT').
xc_creator(a65b12506e960f,'Kat').
xc_creation_date(a65b12506e960f,19971124).
x_arg1Isa('x_SKF-27333222',x_ImposingSanctions) :- x_cid(a65b12506e9610).
xc_microtheory(a65b12506e9610,x_HPKBCrisisMt).
xc_source_file(a65b12506e9610,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9610,21116).
xc_kb_names(a65b12506e9610,[]).
xc_mapping_rows(a65b12506e9610,[]).
xc_direction(a65b12506e9610,':FORWARD').
xc_monotonicity(a65b12506e9610,':DEFAULT').
x_resultIsa('x_SKF-27333222','x_Approval-CommunicationAct') :- x_cid(a65b12506e9611).
xc_microtheory(a65b12506e9611,x_HPKBCrisisMt).
xc_source_file(a65b12506e9611,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9611,21122).
xc_kb_names(a65b12506e9611,[]).
xc_mapping_rows(a65b12506e9611,[]).
xc_direction(a65b12506e9611,':FORWARD').
xc_monotonicity(a65b12506e9611,':DEFAULT').
x_arity('x_SKF-27333222',1) :- x_cid(a65b12506e9612).
xc_microtheory(a65b12506e9612,x_HPKBCrisisMt).
xc_source_file(a65b12506e9612,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9612,21128).
xc_kb_names(a65b12506e9612,[]).
xc_mapping_rows(a65b12506e9612,[]).
xc_direction(a65b12506e9612,':FORWARD').
xc_monotonicity(a65b12506e9612,':MONOTONIC').
x_isa('x_SKF-27333222',x_SkolemFunction) :- x_cid(a65b12506e9613).
xc_microtheory(a65b12506e9613,x_HPKBCrisisMt).
xc_source_file(a65b12506e9613,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9613,21134).
xc_kb_names(a65b12506e9613,[]).
xc_mapping_rows(a65b12506e9613,[]).
xc_direction(a65b12506e9613,':FORWARD').
xc_monotonicity(a65b12506e9613,':MONOTONIC').
x_resultIsa('x_SKF-58559516','x_F-4D-Fighter') :- x_cid(a65b12506e9614).
xc_microtheory(a65b12506e9614,x_HPKBCrisisMt).
xc_source_file(a65b12506e9614,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9614,21140).
xc_kb_names(a65b12506e9614,[]).
xc_mapping_rows(a65b12506e9614,[]).
xc_direction(a65b12506e9614,':FORWARD').
xc_monotonicity(a65b12506e9614,':DEFAULT').
x_arity('x_SKF-58559516',0) :- x_cid(a65b12506e9615).
xc_microtheory(a65b12506e9615,x_HPKBCrisisMt).
xc_source_file(a65b12506e9615,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9615,21146).
xc_kb_names(a65b12506e9615,[]).
xc_mapping_rows(a65b12506e9615,[]).
xc_direction(a65b12506e9615,':FORWARD').
xc_monotonicity(a65b12506e9615,':MONOTONIC').
x_isa('x_SKF-58559516',x_SkolemFunction) :- x_cid(a65b12506e9616).
xc_microtheory(a65b12506e9616,x_HPKBCrisisMt).
xc_source_file(a65b12506e9616,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9616,21152).
xc_kb_names(a65b12506e9616,[]).
xc_mapping_rows(a65b12506e9616,[]).
xc_direction(a65b12506e9616,':FORWARD').
xc_monotonicity(a65b12506e9616,':MONOTONIC').
x_thereExists(V1,x_isa(V1,'x_F-4E-Fighter')) :- x_cid(a65b12506e9617,V1).
xc_microtheory(a65b12506e9617,x_HPKBCrisisMt).
xc_source_file(a65b12506e9617,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9617,21158).
xc_kb_names(a65b12506e9617,["?F4E0150"]).
xc_mapping_rows(a65b12506e9617,['exists-thereexists']).
xc_direction(a65b12506e9617,':BACKWARD').
xc_monotonicity(a65b12506e9617,':DEFAULT').
xc_creator(a65b12506e9617,'MarkWillems').
xc_creation_date(a65b12506e9617,19971124).
x_thereExists(V1,x_possesses(x_Iran,V1)) :- x_cid(a65b12506e9618,V1).
xc_microtheory(a65b12506e9618,x_HPKBCrisisMt).
xc_source_file(a65b12506e9618,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9618,21166).
xc_kb_names(a65b12506e9618,["?F4E0150"]).
xc_mapping_rows(a65b12506e9618,['exists-thereexists']).
xc_direction(a65b12506e9618,':BACKWARD').
xc_monotonicity(a65b12506e9618,':DEFAULT').
xc_creator(a65b12506e9618,'MarkWillems').
xc_creation_date(a65b12506e9618,19971124).
x_resultIsa('x_SKF-23165858','x_F-4E-Fighter') :- x_cid(a65b12506e9619).
xc_microtheory(a65b12506e9619,x_HPKBCrisisMt).
xc_source_file(a65b12506e9619,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9619,21174).
xc_kb_names(a65b12506e9619,[]).
xc_mapping_rows(a65b12506e9619,[]).
xc_direction(a65b12506e9619,':FORWARD').
xc_monotonicity(a65b12506e9619,':DEFAULT').
x_arity('x_SKF-23165858',0) :- x_cid(a65b12506e961a).
xc_microtheory(a65b12506e961a,x_HPKBCrisisMt).
xc_source_file(a65b12506e961a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e961a,21180).
xc_kb_names(a65b12506e961a,[]).
xc_mapping_rows(a65b12506e961a,[]).
xc_direction(a65b12506e961a,':FORWARD').
xc_monotonicity(a65b12506e961a,':MONOTONIC').
x_isa('x_SKF-23165858',x_SkolemFunction) :- x_cid(a65b12506e961b).
xc_microtheory(a65b12506e961b,x_HPKBCrisisMt).
xc_source_file(a65b12506e961b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e961b,21186).
xc_kb_names(a65b12506e961b,[]).
xc_mapping_rows(a65b12506e961b,[]).
xc_direction(a65b12506e961b,':FORWARD').
xc_monotonicity(a65b12506e961b,':MONOTONIC').
x_arg2Isa('x_SKF-6443347',x_Agent) :- x_cid(a65b12506e961c).
xc_microtheory(a65b12506e961c,x_HPKBCrisisMt).
xc_source_file(a65b12506e961c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e961c,21192).
xc_kb_names(a65b12506e961c,[]).
xc_mapping_rows(a65b12506e961c,[]).
xc_direction(a65b12506e961c,':FORWARD').
xc_monotonicity(a65b12506e961c,':DEFAULT').
x_arg1Isa('x_SKF-6443347',x_ImposingSanctions) :- x_cid(a65b12506e961d).
xc_microtheory(a65b12506e961d,x_HPKBCrisisMt).
xc_source_file(a65b12506e961d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e961d,21198).
xc_kb_names(a65b12506e961d,[]).
xc_mapping_rows(a65b12506e961d,[]).
xc_direction(a65b12506e961d,':FORWARD').
xc_monotonicity(a65b12506e961d,':DEFAULT').
x_resultIsa('x_SKF-6443347',x_RequestForSanctions) :- x_cid(a65b12506e961e).
xc_microtheory(a65b12506e961e,x_HPKBCrisisMt).
xc_source_file(a65b12506e961e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e961e,21204).
xc_kb_names(a65b12506e961e,[]).
xc_mapping_rows(a65b12506e961e,[]).
xc_direction(a65b12506e961e,':FORWARD').
xc_monotonicity(a65b12506e961e,':DEFAULT').
x_arity('x_SKF-6443347',2) :- x_cid(a65b12506e961f).
xc_microtheory(a65b12506e961f,x_HPKBCrisisMt).
xc_source_file(a65b12506e961f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e961f,21210).
xc_kb_names(a65b12506e961f,[]).
xc_mapping_rows(a65b12506e961f,[]).
xc_direction(a65b12506e961f,':FORWARD').
xc_monotonicity(a65b12506e961f,':MONOTONIC').
x_isa('x_SKF-6443347',x_SkolemFunction) :- x_cid(a65b12506e9620).
xc_microtheory(a65b12506e9620,x_HPKBCrisisMt).
xc_source_file(a65b12506e9620,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9620,21216).
xc_kb_names(a65b12506e9620,[]).
xc_mapping_rows(a65b12506e9620,[]).
xc_direction(a65b12506e9620,':FORWARD').
xc_monotonicity(a65b12506e9620,':MONOTONIC').
x_arg1Isa('x_SKF-49715287',x_RequestForSanctions) :- x_cid(a65b12506e9621).
xc_microtheory(a65b12506e9621,x_HPKBCrisisMt).
xc_source_file(a65b12506e9621,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9621,21222).
xc_kb_names(a65b12506e9621,[]).
xc_mapping_rows(a65b12506e9621,[]).
xc_direction(a65b12506e9621,':FORWARD').
xc_monotonicity(a65b12506e9621,':DEFAULT').
x_arity('x_SKF-49715287',1) :- x_cid(a65b12506e9622).
xc_microtheory(a65b12506e9622,x_HPKBCrisisMt).
xc_source_file(a65b12506e9622,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9622,21228).
xc_kb_names(a65b12506e9622,[]).
xc_mapping_rows(a65b12506e9622,[]).
xc_direction(a65b12506e9622,':FORWARD').
xc_monotonicity(a65b12506e9622,':MONOTONIC').
x_isa('x_SKF-49715287',x_SkolemFunction) :- x_cid(a65b12506e9623).
xc_microtheory(a65b12506e9623,x_HPKBCrisisMt).
xc_source_file(a65b12506e9623,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9623,21234).
xc_kb_names(a65b12506e9623,[]).
xc_mapping_rows(a65b12506e9623,[]).
xc_direction(a65b12506e9623,':FORWARD').
xc_monotonicity(a65b12506e9623,':MONOTONIC').
x_arg1Isa('x_SKF-38898009',x_RequestForSanctions) :- x_cid(a65b12506e9624).
xc_microtheory(a65b12506e9624,x_HPKBCrisisMt).
xc_source_file(a65b12506e9624,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9624,21240).
xc_kb_names(a65b12506e9624,[]).
xc_mapping_rows(a65b12506e9624,[]).
xc_direction(a65b12506e9624,':FORWARD').
xc_monotonicity(a65b12506e9624,':DEFAULT').
x_arity('x_SKF-38898009',1) :- x_cid(a65b12506e9625).
xc_microtheory(a65b12506e9625,x_HPKBCrisisMt).
xc_source_file(a65b12506e9625,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9625,21246).
xc_kb_names(a65b12506e9625,[]).
xc_mapping_rows(a65b12506e9625,[]).
xc_direction(a65b12506e9625,':FORWARD').
xc_monotonicity(a65b12506e9625,':MONOTONIC').
x_isa('x_SKF-38898009',x_SkolemFunction) :- x_cid(a65b12506e9626).
xc_microtheory(a65b12506e9626,x_HPKBCrisisMt).
xc_source_file(a65b12506e9626,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9626,21252).
xc_kb_names(a65b12506e9626,[]).
xc_mapping_rows(a65b12506e9626,[]).
xc_direction(a65b12506e9626,':FORWARD').
xc_monotonicity(a65b12506e9626,':MONOTONIC').
x_arg1Isa('x_SKF-14334214',x_ImposingSanctions) :- x_cid(a65b12506e9627).
xc_microtheory(a65b12506e9627,x_HPKBCrisisMt).
xc_source_file(a65b12506e9627,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9627,21258).
xc_kb_names(a65b12506e9627,[]).
xc_mapping_rows(a65b12506e9627,[]).
xc_direction(a65b12506e9627,':FORWARD').
xc_monotonicity(a65b12506e9627,':DEFAULT').
x_resultIsa('x_SKF-14334214',x_Country) :- x_cid(a65b12506e9628).
xc_microtheory(a65b12506e9628,x_HPKBCrisisMt).
xc_source_file(a65b12506e9628,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9628,21264).
xc_kb_names(a65b12506e9628,[]).
xc_mapping_rows(a65b12506e9628,[]).
xc_direction(a65b12506e9628,':FORWARD').
xc_monotonicity(a65b12506e9628,':DEFAULT').
x_arity('x_SKF-14334214',1) :- x_cid(a65b12506e9629).
xc_microtheory(a65b12506e9629,x_HPKBCrisisMt).
xc_source_file(a65b12506e9629,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9629,21270).
xc_kb_names(a65b12506e9629,[]).
xc_mapping_rows(a65b12506e9629,[]).
xc_direction(a65b12506e9629,':FORWARD').
xc_monotonicity(a65b12506e9629,':MONOTONIC').
x_isa('x_SKF-14334214',x_SkolemFunction) :- x_cid(a65b12506e962a).
xc_microtheory(a65b12506e962a,x_HPKBCrisisMt).
xc_source_file(a65b12506e962a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e962a,21276).
xc_kb_names(a65b12506e962a,[]).
xc_mapping_rows(a65b12506e962a,[]).
xc_direction(a65b12506e962a,':FORWARD').
xc_monotonicity(a65b12506e962a,':MONOTONIC').
x_implies(x_and(x_isa(V1,x_DiplomaticWarning),x_performedBy(V1,V2),x_isa(V2,x_Person),x_senderOfInfo(V1,V3)),x_employees(V3,V2)) :- x_cid(a65b12506e962b,V1,V2,V3).
xc_microtheory(a65b12506e962b,x_HPKBCrisisMt).
xc_source_file(a65b12506e962b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e962b,21282).
xc_kb_names(a65b12506e962b,["?ACT","?MESSENGER","?AGT"]).
xc_mapping_rows(a65b12506e962b,['implication-implies']).
xc_direction(a65b12506e962b,':BACKWARD').
xc_monotonicity(a65b12506e962b,':DEFAULT').
xc_creator(a65b12506e962b,'Nichols').
xc_creation_date(a65b12506e962b,19971124).
x_implies(x_and(x_isa(V1,x_Person),x_performedBy(V2,V1),x_isa(V2,x_DiplomaticWarning),x_senderOfInfo(V2,V3)),x_isa(V1,x_Diplomat)) :- x_cid(a65b12506e962c,V1,V2,V3).
xc_microtheory(a65b12506e962c,x_HPKBCrisisMt).
xc_source_file(a65b12506e962c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e962c,21294).
xc_kb_names(a65b12506e962c,["?MESSENGER","?ACT","?AGT"]).
xc_mapping_rows(a65b12506e962c,['implication-implies']).
xc_direction(a65b12506e962c,':BACKWARD').
xc_monotonicity(a65b12506e962c,':DEFAULT').
xc_creator(a65b12506e962c,'Nichols').
xc_creation_date(a65b12506e962c,19971124).
x_implies(x_and(x_recipientOfInfo(V1,V2),x_isa(V1,x_DiplomaticWarning)),x_or(x_isa(V2,x_Country),x_isa(V2,x_InternationalOrganization))) :- x_cid(a65b12506e962d,V1,V2).
xc_microtheory(a65b12506e962d,x_HPKBCrisisMt).
xc_source_file(a65b12506e962d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e962d,21306).
xc_kb_names(a65b12506e962d,["?ACT","?AGT"]).
xc_mapping_rows(a65b12506e962d,['implication-implies']).
xc_direction(a65b12506e962d,':BACKWARD').
xc_monotonicity(a65b12506e962d,':DEFAULT').
xc_creator(a65b12506e962d,'Nichols').
xc_creation_date(a65b12506e962d,19971124).
x_implies(x_and(x_senderOfInfo(V1,V2),x_isa(V1,x_DiplomaticWarning)),x_or(x_isa(V2,x_Country),x_isa(V2,x_InternationalOrganization))) :- x_cid(a65b12506e962e,V1,V2).
xc_microtheory(a65b12506e962e,x_HPKBCrisisMt).
xc_source_file(a65b12506e962e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e962e,21318).
xc_kb_names(a65b12506e962e,["?ACT","?AGT"]).
xc_mapping_rows(a65b12506e962e,['implication-implies']).
xc_direction(a65b12506e962e,':BACKWARD').
xc_monotonicity(a65b12506e962e,':DEFAULT').
xc_creator(a65b12506e962e,'Nichols').
xc_creation_date(a65b12506e962e,19971124).
x_hasBeliefSystems(x_CommitteeForDefenseOfLegitimateRights,x_IslamicSocietyIdeology) :- x_cid(a65b12506e962f).
xc_microtheory(a65b12506e962f,x_HPKBCrisisMt).
xc_source_file(a65b12506e962f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e962f,21330).
xc_kb_names(a65b12506e962f,[]).
xc_mapping_rows(a65b12506e962f,[]).
xc_direction(a65b12506e962f,':FORWARD').
xc_monotonicity(a65b12506e962f,':DEFAULT').
xc_creator(a65b12506e962f,'Nichols').
xc_creation_date(a65b12506e962f,19971121).
x_residenceOfOrganization(x_CommitteeForDefenseOfLegitimateRights,x_SaudiArabia) :- x_cid(a65b12506e9630).
xc_microtheory(a65b12506e9630,x_HPKBCrisisMt).
xc_source_file(a65b12506e9630,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9630,21336).
xc_kb_names(a65b12506e9630,[]).
xc_mapping_rows(a65b12506e9630,[]).
xc_direction(a65b12506e9630,':FORWARD').
xc_monotonicity(a65b12506e9630,':DEFAULT').
xc_creator(a65b12506e9630,'Nichols').
xc_creation_date(a65b12506e9630,19971121).
x_startingDate(x_CommitteeForDefenseOfLegitimateRights,x_YearFn(1993)) :- x_cid(a65b12506e9631).
xc_microtheory(a65b12506e9631,x_HPKBCrisisMt).
xc_source_file(a65b12506e9631,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9631,21342).
xc_kb_names(a65b12506e9631,[]).
xc_mapping_rows(a65b12506e9631,[]).
xc_direction(a65b12506e9631,':FORWARD').
xc_monotonicity(a65b12506e9631,':DEFAULT').
xc_creator(a65b12506e9631,'Nichols').
xc_creation_date(a65b12506e9631,19971121).
x_hasBeliefSystems(x_IslamicReformMovement,x_IslamicSocietyIdeology) :- x_cid(a65b12506e9632).
xc_microtheory(a65b12506e9632,x_HPKBCrisisMt).
xc_source_file(a65b12506e9632,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9632,21349).
xc_kb_names(a65b12506e9632,[]).
xc_mapping_rows(a65b12506e9632,[]).
xc_direction(a65b12506e9632,':FORWARD').
xc_monotonicity(a65b12506e9632,':DEFAULT').
xc_creator(a65b12506e9632,'Nichols').
xc_creation_date(a65b12506e9632,19971121).
x_residenceOfOrganization(x_IslamicReformMovement,x_SaudiArabia) :- x_cid(a65b12506e9633).
xc_microtheory(a65b12506e9633,x_HPKBCrisisMt).
xc_source_file(a65b12506e9633,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9633,21355).
xc_kb_names(a65b12506e9633,[]).
xc_mapping_rows(a65b12506e9633,[]).
xc_direction(a65b12506e9633,':FORWARD').
xc_monotonicity(a65b12506e9633,':DEFAULT').
xc_creator(a65b12506e9633,'Nichols').
xc_creation_date(a65b12506e9633,19971121).
x_startingDate(x_IslamicReformMovement,x_MonthFn(x_March,x_YearFn(1994))) :- x_cid(a65b12506e9634).
xc_microtheory(a65b12506e9634,x_HPKBCrisisMt).
xc_source_file(a65b12506e9634,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9634,21361).
xc_kb_names(a65b12506e9634,[]).
xc_mapping_rows(a65b12506e9634,[]).
xc_direction(a65b12506e9634,':FORWARD').
xc_monotonicity(a65b12506e9634,':DEFAULT').
xc_creator(a65b12506e9634,'Nichols').
xc_creation_date(a65b12506e9634,19971121).
x_implies(x_and(x_isa(V1,x_Bombing),x_deviceUsed(V1,V2),x_isa(V2,x_Warplane),x_victim(V1,V3),x_possesses(V3,V4),x_isa(V4,x_AirDefenseSystem)),x_thereExists(V5,x_and(x_isa(V5,x_AntiAircraftFire),x_target(V5,V2),x_temporallySubsumes(V1,V5)))) :- x_cid(a65b12506e9635,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9635,x_HPKBCrisisMt).
xc_source_file(a65b12506e9635,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9635,21369).
xc_kb_names(a65b12506e9635,["?BOMBING","?PLANE","?VICTIM","?AIR-DEFENSE-SYSTEM","?ANTI-AIRCRAFT-FIRE"]).
xc_mapping_rows(a65b12506e9635,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9635,':FORWARD').
xc_monotonicity(a65b12506e9635,':DEFAULT').
xc_creator(a65b12506e9635,'Schwartz').
xc_creation_date(a65b12506e9635,19971121).
x_implies(x_and(x_isa(V1,x_Bombing),x_deviceUsed(V1,V2),x_isa(V2,x_Warplane),x_victim(V1,V3),x_possesses(V3,V4),x_isa(V4,x_AirDefenseSystem)),x_thereExists(V5,x_and(x_isa(V5,x_AntiAircraftFire),x_target(V5,V2),x_temporallySubsumes(V1,V5)))) :- x_cid(a65b12506e9636,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9636,x_HPKBCrisisMt).
xc_source_file(a65b12506e9636,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9636,21388).
xc_kb_names(a65b12506e9636,["?BOMBING","?PLANE","?VICTIM","?AIR-DEFENSE-SYSTEM","?ANTI-AIRCRAFT-FIRE"]).
xc_mapping_rows(a65b12506e9636,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9636,':FORWARD').
xc_monotonicity(a65b12506e9636,':DEFAULT').
xc_creator(a65b12506e9636,'Schwartz').
xc_creation_date(a65b12506e9636,19971121).
x_implies(x_and(x_isa(V1,x_Bombing),x_deviceUsed(V1,V2),x_isa(V2,x_Warplane),x_victim(V1,V3),x_possesses(V3,V4),x_isa(V4,x_AirDefenseSystem)),x_thereExists(V5,x_and(x_isa(V5,x_AntiAircraftFire),x_target(V5,V2),x_temporallySubsumes(V1,V5)))) :- x_cid(a65b12506e9637,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e9637,x_HPKBCrisisMt).
xc_source_file(a65b12506e9637,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9637,21407).
xc_kb_names(a65b12506e9637,["?BOMBING","?PLANE","?VICTIM","?AIR-DEFENSE-SYSTEM","?ANTI-AIRCRAFT-FIRE"]).
xc_mapping_rows(a65b12506e9637,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9637,':FORWARD').
xc_monotonicity(a65b12506e9637,':DEFAULT').
xc_creator(a65b12506e9637,'Schwartz').
xc_creation_date(a65b12506e9637,19971121).
x_implies(x_and('x_conveyor-Stationary'(V1,V2),x_transportees(V1,V3),x_isa(V3,x_PetroleumProduct)),x_isa(V2,'x_Pipe-GenericConduit')) :- x_cid(a65b12506e9638,V1,V2,V3).
xc_microtheory(a65b12506e9638,x_HPKBCrisisMt).
xc_source_file(a65b12506e9638,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9638,21426).
xc_kb_names(a65b12506e9638,["?TRANSPORT","?PIPE","?OIL"]).
xc_mapping_rows(a65b12506e9638,['implication-implies']).
xc_direction(a65b12506e9638,':BACKWARD').
xc_monotonicity(a65b12506e9638,':DEFAULT').
xc_creator(a65b12506e9638,'Kean').
xc_creation_date(a65b12506e9638,19971121).
x_implies(x_and(x_isa(V1,x_PhysicalDistributionFn(x_PetroleumProduct)),x_subEvents(V1,V2),x_transporter(V2,V3),x_transportees(V2,V4),x_isa(V4,x_PetroleumProduct)),x_isa(V3,x_TankerShip)) :- x_cid(a65b12506e9639,V1,V2,V3,V4).
xc_microtheory(a65b12506e9639,x_HPKBCrisisMt).
xc_source_file(a65b12506e9639,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9639,21437).
xc_kb_names(a65b12506e9639,["?DISTRIB","?TRANSPORT","?SHIP","?OIL"]).
xc_mapping_rows(a65b12506e9639,['implication-implies']).
xc_direction(a65b12506e9639,':BACKWARD').
xc_monotonicity(a65b12506e9639,':DEFAULT').
xc_creator(a65b12506e9639,'Kean').
xc_creation_date(a65b12506e9639,19971121).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_isa(V1,x_MilitaryOperation),x_performedBy(V1,V2),x_isa(V2,x_Country),x_victim(V1,V3),x_isa(V3,x_Country)),x_possibleNegativeEffect(V1,V2,x_thereExists(V4,x_and(x_isa(V4,x_AttackOnTangible),x_isa(V4,x_MilitaryOperation),x_startsAfterStartingOf(V4,V1),x_temporallyIntersects(V4,x_STIF(V1)),x_performedBy(V4,V3),x_victim(V4,V2))))) :- x_cid(a65b12506e963a,V1,V2,V3,V4).
xc_microtheory(a65b12506e963a,x_HPKBCrisisMt).
xc_source_file(a65b12506e963a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e963a,21451).
xc_kb_names(a65b12506e963a,["?ATTACK","?ATTACKER","?VICTIM","?RETALIATION"]).
xc_mapping_rows(a65b12506e963a,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e963a,':BACKWARD').
xc_monotonicity(a65b12506e963a,':DEFAULT').
xc_creator(a65b12506e963a,'Schwartz').
xc_creation_date(a65b12506e963a,19971121).
x_implies(x_and(x_isa(V1,x_MilitaryOperation),x_temporallySubsumes(V1,V2),x_isa(V2,x_AntiAircraftFire),x_deviceUsed(V1,V3),x_target(V2,V3),x_isa(V3,x_Warplane),x_performedBy(V1,V4)),x_possibleNegativeEffect(V1,V4,x_thereExists(V5,x_and(x_isa(V5,x_Warplane),x_deviceUsed(V1,V5),x_thereExists(V6,x_and(x_isa(V6,x_DestructionEvent),x_subEvents(V1,V6),x_inputsDestroyed(V6,V5))))))) :- x_cid(a65b12506e963b,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e963b,x_HPKBCrisisMt).
xc_source_file(a65b12506e963b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e963b,21475).
xc_kb_names(a65b12506e963b,["?OPERATION","?ANTI-AIRCRAFT-FIRE","?PLANE","?AGENT","?AIRCRAFT","?DESTRUCTION"]).
xc_mapping_rows(a65b12506e963b,['implication-implies','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e963b,':BACKWARD').
xc_monotonicity(a65b12506e963b,':DEFAULT').
xc_creator(a65b12506e963b,'Schwartz').
xc_creation_date(a65b12506e963b,19971121).
x_implies(x_and(x_isa(V1,x_MilitaryOperation),x_temporallySubsumes(V1,V2),x_isa(V2,x_AntiAircraftFire),x_deviceUsed(V1,V3),x_target(V2,V3),x_isa(V3,x_Warplane),x_performedBy(V1,V4)),x_possibleNegativeEffect(V1,V4,x_thereExists(V5,x_and(x_isa(V5,x_AircraftCrewMember),x_deliberateActors(V1,V5),x_thereExists(V6,x_and(x_isa(V6,x_Dying),x_subEvents(V1,V6),x_bodilyDoer(V6,V5))))))) :- x_cid(a65b12506e963c,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12506e963c,x_HPKBCrisisMt).
xc_source_file(a65b12506e963c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e963c,21501).
xc_kb_names(a65b12506e963c,["?OPERATION","?ANTI-AIRCRAFT-FIRE","?PLANE","?AGENT","?CREW-MEMBER","?DYING"]).
xc_mapping_rows(a65b12506e963c,['implication-implies','exists-thereexists','exists-thereexists']).
xc_direction(a65b12506e963c,':BACKWARD').
xc_monotonicity(a65b12506e963c,':DEFAULT').
xc_creator(a65b12506e963c,'Schwartz').
xc_creation_date(a65b12506e963c,19971121).
x_arg4Isa('x_SKF-9098087',x_AirDefenseSystem) :- x_cid(a65b12506e963d).
xc_microtheory(a65b12506e963d,x_HPKBCrisisMt).
xc_source_file(a65b12506e963d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e963d,21527).
xc_kb_names(a65b12506e963d,[]).
xc_mapping_rows(a65b12506e963d,[]).
xc_direction(a65b12506e963d,':FORWARD').
xc_monotonicity(a65b12506e963d,':DEFAULT').
x_arg3Isa('x_SKF-9098087',x_SocialBeing) :- x_cid(a65b12506e963e).
xc_microtheory(a65b12506e963e,x_HPKBCrisisMt).
xc_source_file(a65b12506e963e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e963e,21533).
xc_kb_names(a65b12506e963e,[]).
xc_mapping_rows(a65b12506e963e,[]).
xc_direction(a65b12506e963e,':FORWARD').
xc_monotonicity(a65b12506e963e,':DEFAULT').
x_arg2Isa('x_SKF-9098087',x_Warplane) :- x_cid(a65b12506e963f).
xc_microtheory(a65b12506e963f,x_HPKBCrisisMt).
xc_source_file(a65b12506e963f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e963f,21539).
xc_kb_names(a65b12506e963f,[]).
xc_mapping_rows(a65b12506e963f,[]).
xc_direction(a65b12506e963f,':FORWARD').
xc_monotonicity(a65b12506e963f,':DEFAULT').
x_arg1Isa('x_SKF-9098087',x_Bombing) :- x_cid(a65b12506e9640).
xc_microtheory(a65b12506e9640,x_HPKBCrisisMt).
xc_source_file(a65b12506e9640,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9640,21545).
xc_kb_names(a65b12506e9640,[]).
xc_mapping_rows(a65b12506e9640,[]).
xc_direction(a65b12506e9640,':FORWARD').
xc_monotonicity(a65b12506e9640,':DEFAULT').
x_resultIsa('x_SKF-9098087',x_AntiAircraftFire) :- x_cid(a65b12506e9641).
xc_microtheory(a65b12506e9641,x_HPKBCrisisMt).
xc_source_file(a65b12506e9641,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9641,21551).
xc_kb_names(a65b12506e9641,[]).
xc_mapping_rows(a65b12506e9641,[]).
xc_direction(a65b12506e9641,':FORWARD').
xc_monotonicity(a65b12506e9641,':DEFAULT').
x_arity('x_SKF-9098087',4) :- x_cid(a65b12506e9642).
xc_microtheory(a65b12506e9642,x_HPKBCrisisMt).
xc_source_file(a65b12506e9642,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9642,21557).
xc_kb_names(a65b12506e9642,[]).
xc_mapping_rows(a65b12506e9642,[]).
xc_direction(a65b12506e9642,':FORWARD').
xc_monotonicity(a65b12506e9642,':MONOTONIC').
x_isa('x_SKF-9098087',x_SkolemFunction) :- x_cid(a65b12506e9643).
xc_microtheory(a65b12506e9643,x_HPKBCrisisMt).
xc_source_file(a65b12506e9643,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9643,21563).
xc_kb_names(a65b12506e9643,[]).
xc_mapping_rows(a65b12506e9643,[]).
xc_direction(a65b12506e9643,':FORWARD').
xc_monotonicity(a65b12506e9643,':MONOTONIC').
x_thereExists(V1,x_and(x_isa(V1,x_AirDefenseSystem),x_possesses(x_SaudiArabia,V1))) :- x_cid(a65b12506e9644,V1).
xc_microtheory(a65b12506e9644,x_HPKBCrisisMt).
xc_source_file(a65b12506e9644,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9644,21569).
xc_kb_names(a65b12506e9644,["?AIR-DEFENSE-SYSTEM"]).
xc_mapping_rows(a65b12506e9644,['exists-thereexists']).
xc_direction(a65b12506e9644,':FORWARD').
xc_monotonicity(a65b12506e9644,':DEFAULT').
xc_creator(a65b12506e9644,'Schwartz').
xc_creation_date(a65b12506e9644,19971121).
x_thereExists(V1,x_and(x_isa(V1,x_AirDefenseSystem),x_possesses(x_SaudiArabia,V1))) :- x_cid(a65b12506e9645,V1).
xc_microtheory(a65b12506e9645,x_HPKBCrisisMt).
xc_source_file(a65b12506e9645,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9645,21579).
xc_kb_names(a65b12506e9645,["?AIR-DEFENSE-SYSTEM"]).
xc_mapping_rows(a65b12506e9645,['exists-thereexists']).
xc_direction(a65b12506e9645,':FORWARD').
xc_monotonicity(a65b12506e9645,':DEFAULT').
xc_creator(a65b12506e9645,'Schwartz').
xc_creation_date(a65b12506e9645,19971121).
x_resultIsa('x_SKF-54477051',x_AirDefenseSystem) :- x_cid(a65b12506e9646).
xc_microtheory(a65b12506e9646,x_HPKBCrisisMt).
xc_source_file(a65b12506e9646,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9646,21589).
xc_kb_names(a65b12506e9646,[]).
xc_mapping_rows(a65b12506e9646,[]).
xc_direction(a65b12506e9646,':FORWARD').
xc_monotonicity(a65b12506e9646,':DEFAULT').
x_arity('x_SKF-54477051',0) :- x_cid(a65b12506e9647).
xc_microtheory(a65b12506e9647,x_HPKBCrisisMt).
xc_source_file(a65b12506e9647,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9647,21595).
xc_kb_names(a65b12506e9647,[]).
xc_mapping_rows(a65b12506e9647,[]).
xc_direction(a65b12506e9647,':FORWARD').
xc_monotonicity(a65b12506e9647,':MONOTONIC').
x_isa('x_SKF-54477051',x_SkolemFunction) :- x_cid(a65b12506e9648).
xc_microtheory(a65b12506e9648,x_HPKBCrisisMt).
xc_source_file(a65b12506e9648,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9648,21601).
xc_kb_names(a65b12506e9648,[]).
xc_mapping_rows(a65b12506e9648,[]).
xc_direction(a65b12506e9648,':FORWARD').
xc_monotonicity(a65b12506e9648,':MONOTONIC').
x_implies(x_and(x_isa(V1,'x_Coalition-International'),'x_internationalOrg-MemberCountry'(V1,V2)),x_positiveVestedInterest(V1,V2)) :- x_cid(a65b12506e9649,V1,V2).
xc_microtheory(a65b12506e9649,x_HPKBCrisisMt).
xc_source_file(a65b12506e9649,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9649,21607).
xc_kb_names(a65b12506e9649,["?ORG","?MEM"]).
xc_mapping_rows(a65b12506e9649,['implication-implies']).
xc_direction(a65b12506e9649,':BACKWARD').
xc_monotonicity(a65b12506e9649,':DEFAULT').
xc_creator(a65b12506e9649,'Nichols').
xc_creation_date(a65b12506e9649,19971120).
x_implies(x_and(x_isa(V1,'x_Coalition-International'),x_groupMembers(V1,V2)),'x_internationalOrg-MemberCountry'(V1,V2)) :- x_cid(a65b12506e964a,V1,V2).
xc_microtheory(a65b12506e964a,x_HPKBCrisisMt).
xc_source_file(a65b12506e964a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e964a,21617).
xc_kb_names(a65b12506e964a,["?ORG","?MEM"]).
xc_mapping_rows(a65b12506e964a,['implication-implies']).
xc_direction(a65b12506e964a,':BACKWARD').
xc_monotonicity(a65b12506e964a,':DEFAULT').
xc_creator(a65b12506e964a,'Nichols').
xc_creation_date(a65b12506e964a,19971120).
x_implies(x_and(x_isa(V1,x_TakingSomeoneHostage),x_objectActedOn(V1,V2),x_performedBy(V1,V3),x_citizens(V4,V2),x_hasAgents(x_GovernmentFn(V5),V3),x_different(V5,V4),x_isa(V5,x_Country)),x_knowsAbout(x_InternationalCommunity,V1)) :- x_cid(a65b12506e964b,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e964b,x_HPKBCrisisMt).
xc_source_file(a65b12506e964b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e964b,21627).
xc_kb_names(a65b12506e964b,["?TH","?PERS","?AGT","?COUNTRY-1","?COUNTRY"]).
xc_mapping_rows(a65b12506e964b,['implication-implies']).
xc_direction(a65b12506e964b,':BACKWARD').
xc_monotonicity(a65b12506e964b,':DEFAULT').
xc_creator(a65b12506e964b,'KathyBurns').
xc_creation_date(a65b12506e964b,19971120).
x_implies(x_and(x_isa(V1,x_TakingSomeoneHostage),x_objectActedOn(V1,V2),x_performedBy(V1,V3),x_citizens(V4,V2),x_hasAgents(x_GovernmentFn(V5),V3),x_different(V5,V4),x_isa(V5,x_Country)),x_actionViolatesObligation(V1,x_ModernInternationalRelationsCOC)) :- x_cid(a65b12506e964c,V1,V2,V3,V4,V5).
xc_microtheory(a65b12506e964c,x_HPKBCrisisMt).
xc_source_file(a65b12506e964c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e964c,21643).
xc_kb_names(a65b12506e964c,["?TH","?PERS","?AGT","?COUNTRY-1","?COUNTRY"]).
xc_mapping_rows(a65b12506e964c,['implication-implies']).
xc_direction(a65b12506e964c,':BACKWARD').
xc_monotonicity(a65b12506e964c,':DEFAULT').
xc_creator(a65b12506e964c,'KathyBurns').
xc_creation_date(a65b12506e964c,19971120).
x_subEvents(x_PersianGulfWar,x_OperationDesertStorm) :- x_cid(a65b12506e964d).
xc_microtheory(a65b12506e964d,x_HPKBCrisisMt).
xc_source_file(a65b12506e964d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e964d,21659).
xc_kb_names(a65b12506e964d,[]).
xc_mapping_rows(a65b12506e964d,[]).
xc_direction(a65b12506e964d,':FORWARD').
xc_monotonicity(a65b12506e964d,':DEFAULT').
xc_creator(a65b12506e964d,'Nichols').
xc_creation_date(a65b12506e964d,19971118).
x_arg5Isa('x_SKF-13909356',x_Agent) :- x_cid(a65b12506e964e).
xc_microtheory(a65b12506e964e,x_HPKBCrisisMt).
xc_source_file(a65b12506e964e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e964e,21665).
xc_kb_names(a65b12506e964e,[]).
xc_mapping_rows(a65b12506e964e,[]).
xc_direction(a65b12506e964e,':FORWARD').
xc_monotonicity(a65b12506e964e,':DEFAULT').
x_arg4Isa('x_SKF-13909356',x_Agent) :- x_cid(a65b12506e964f).
xc_microtheory(a65b12506e964f,x_HPKBCrisisMt).
xc_source_file(a65b12506e964f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e964f,21671).
xc_kb_names(a65b12506e964f,[]).
xc_mapping_rows(a65b12506e964f,[]).
xc_direction(a65b12506e964f,':FORWARD').
xc_monotonicity(a65b12506e964f,':DEFAULT').
x_arg3Isa('x_SKF-13909356',x_Agent) :- x_cid(a65b12506e9650).
xc_microtheory(a65b12506e9650,x_HPKBCrisisMt).
xc_source_file(a65b12506e9650,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9650,21677).
xc_kb_names(a65b12506e9650,[]).
xc_mapping_rows(a65b12506e9650,[]).
xc_direction(a65b12506e9650,':FORWARD').
xc_monotonicity(a65b12506e9650,':DEFAULT').
x_arg2Isa('x_SKF-13909356',x_HelpingAnAgent) :- x_cid(a65b12506e9651).
xc_microtheory(a65b12506e9651,x_HPKBCrisisMt).
xc_source_file(a65b12506e9651,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9651,21683).
xc_kb_names(a65b12506e9651,[]).
xc_mapping_rows(a65b12506e9651,[]).
xc_direction(a65b12506e9651,':FORWARD').
xc_monotonicity(a65b12506e9651,':DEFAULT').
x_arg1Isa('x_SKF-13909356',x_TerroristGroup) :- x_cid(a65b12506e9652).
xc_microtheory(a65b12506e9652,x_HPKBCrisisMt).
xc_source_file(a65b12506e9652,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9652,21689).
xc_kb_names(a65b12506e9652,[]).
xc_mapping_rows(a65b12506e9652,[]).
xc_direction(a65b12506e9652,':FORWARD').
xc_monotonicity(a65b12506e9652,':DEFAULT').
x_resultIsa('x_SKF-13909356',x_ShowingSupportForSomeone) :- x_cid(a65b12506e9653).
xc_microtheory(a65b12506e9653,x_HPKBCrisisMt).
xc_source_file(a65b12506e9653,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9653,21695).
xc_kb_names(a65b12506e9653,[]).
xc_mapping_rows(a65b12506e9653,[]).
xc_direction(a65b12506e9653,':FORWARD').
xc_monotonicity(a65b12506e9653,':DEFAULT').
x_arity('x_SKF-13909356',5) :- x_cid(a65b12506e9654).
xc_microtheory(a65b12506e9654,x_HPKBCrisisMt).
xc_source_file(a65b12506e9654,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9654,21701).
xc_kb_names(a65b12506e9654,[]).
xc_mapping_rows(a65b12506e9654,[]).
xc_direction(a65b12506e9654,':FORWARD').
xc_monotonicity(a65b12506e9654,':MONOTONIC').
x_isa('x_SKF-13909356',x_SkolemFunction) :- x_cid(a65b12506e9655).
xc_microtheory(a65b12506e9655,x_HPKBCrisisMt).
xc_source_file(a65b12506e9655,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9655,21707).
xc_kb_names(a65b12506e9655,[]).
xc_mapping_rows(a65b12506e9655,[]).
xc_direction(a65b12506e9655,':FORWARD').
xc_monotonicity(a65b12506e9655,':MONOTONIC').
x_implies(x_and(x_actionViolatesObligation(V1,x_ModernInternationalRelationsCOC),x_actionViolatesObligation(V1,x_NoFirstStrike),x_knowsAbout(x_InternationalCommunity,V1),x_performedBy(V1,V2)),x_promotesRisk(V1,V2,'x_MilitaryOperation-Joint',x_victim)) :- x_cid(a65b12506e9656,V1,V2).
xc_microtheory(a65b12506e9656,x_HPKBCrisisMt).
xc_source_file(a65b12506e9656,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9656,21713).
xc_kb_names(a65b12506e9656,["?ACT","?AGT"]).
xc_mapping_rows(a65b12506e9656,['implication-implies']).
xc_direction(a65b12506e9656,':BACKWARD').
xc_monotonicity(a65b12506e9656,':DEFAULT').
xc_creator(a65b12506e9656,'OKeefe').
xc_creation_date(a65b12506e9656,19971119).
x_implies(x_and(x_actionViolatesObligation(V1,'x_InternationalNorm-DontSupportTerrorism'),x_actionViolatesObligation(V1,x_ModernInternationalRelationsCOC),x_knowsAbout(x_InternationalCommunity,V1),x_performedBy(V1,V2)),x_promotesRisk(V1,V2,'x_MilitaryOperation-Joint',x_victim)) :- x_cid(a65b12506e9657,V1,V2).
xc_microtheory(a65b12506e9657,x_HPKBCrisisMt).
xc_source_file(a65b12506e9657,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9657,21725).
xc_kb_names(a65b12506e9657,["?ACT","?AGT"]).
xc_mapping_rows(a65b12506e9657,['implication-implies']).
xc_direction(a65b12506e9657,':BACKWARD').
xc_monotonicity(a65b12506e9657,':DEFAULT').
xc_creator(a65b12506e9657,'OKeefe').
xc_creation_date(a65b12506e9657,19971119).
x_directingAgent(x_OperationDesertStorm,x_UnitedStatesOfAmerica) :- x_cid(a65b12506e9658).
xc_microtheory(a65b12506e9658,x_HPKBCrisisMt).
xc_source_file(a65b12506e9658,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9658,21737).
xc_kb_names(a65b12506e9658,[]).
xc_mapping_rows(a65b12506e9658,[]).
xc_direction(a65b12506e9658,':FORWARD').
xc_monotonicity(a65b12506e9658,':DEFAULT').
xc_creator(a65b12506e9658,'Nichols').
xc_creation_date(a65b12506e9658,19971118).
x_doneBy(x_OperationDesertStorm,x_DesertShieldCoalition) :- x_cid(a65b12506e9659).
xc_microtheory(a65b12506e9659,x_HPKBCrisisMt).
xc_source_file(a65b12506e9659,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9659,21743).
xc_kb_names(a65b12506e9659,[]).
xc_mapping_rows(a65b12506e9659,[]).
xc_direction(a65b12506e9659,':FORWARD').
xc_monotonicity(a65b12506e9659,':DEFAULT').
x_performedBy(x_OperationDesertStorm,x_DesertShieldCoalition) :- x_cid(a65b12506e965a).
xc_microtheory(a65b12506e965a,x_HPKBCrisisMt).
xc_source_file(a65b12506e965a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e965a,21749).
xc_kb_names(a65b12506e965a,[]).
xc_mapping_rows(a65b12506e965a,[]).
xc_direction(a65b12506e965a,':FORWARD').
xc_monotonicity(a65b12506e965a,':DEFAULT').
xc_creator(a65b12506e965a,'Nichols').
xc_creation_date(a65b12506e965a,19971118).
x_implies(x_and(x_groupMembers(x_DesertShieldCoalition,V1),x_different(V1,V2),x_groupMembers(x_DesertShieldCoalition,V2)),x_holdsIn(x_PersianGulfWar,x_allies(V1,V2))) :- x_cid(a65b12506e965b,V1,V2).
xc_microtheory(a65b12506e965b,x_HPKBCrisisMt).
xc_source_file(a65b12506e965b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e965b,21755).
xc_kb_names(a65b12506e965b,["?COUNTRYA","?COUNTRYB"]).
xc_mapping_rows(a65b12506e965b,['implication-implies']).
xc_direction(a65b12506e965b,':BACKWARD').
xc_monotonicity(a65b12506e965b,':DEFAULT').
xc_creator(a65b12506e965b,'Nichols').
xc_creation_date(a65b12506e965b,19971118).
x_startingDate(x_DesertShieldCoalition,x_YearFn(1990)) :- x_cid(a65b12506e965c).
xc_microtheory(a65b12506e965c,x_HPKBCrisisMt).
xc_source_file(a65b12506e965c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e965c,21767).
xc_kb_names(a65b12506e965c,[]).
xc_mapping_rows(a65b12506e965c,[]).
xc_direction(a65b12506e965c,':FORWARD').
xc_monotonicity(a65b12506e965c,':DEFAULT').
xc_creator(a65b12506e965c,'Nichols').
xc_creation_date(a65b12506e965c,19971118).
x_groupMembers(x_DesertShieldCoalition,x_Syria) :- x_cid(a65b12506e965d).
xc_microtheory(a65b12506e965d,x_HPKBCrisisMt).
xc_source_file(a65b12506e965d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e965d,21774).
xc_kb_names(a65b12506e965d,[]).
xc_mapping_rows(a65b12506e965d,[]).
xc_direction(a65b12506e965d,':FORWARD').
xc_monotonicity(a65b12506e965d,':DEFAULT').
xc_creator(a65b12506e965d,'Nichols').
xc_creation_date(a65b12506e965d,19971118).
x_groupMembers(x_DesertShieldCoalition,x_SouthKorea) :- x_cid(a65b12506e965e).
xc_microtheory(a65b12506e965e,x_HPKBCrisisMt).
xc_source_file(a65b12506e965e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e965e,21780).
xc_kb_names(a65b12506e965e,[]).
xc_mapping_rows(a65b12506e965e,[]).
xc_direction(a65b12506e965e,':FORWARD').
xc_monotonicity(a65b12506e965e,':DEFAULT').
xc_creator(a65b12506e965e,'Nichols').
xc_creation_date(a65b12506e965e,19971118).
x_groupMembers(x_DesertShieldCoalition,x_Romania) :- x_cid(a65b12506e965f).
xc_microtheory(a65b12506e965f,x_HPKBCrisisMt).
xc_source_file(a65b12506e965f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e965f,21786).
xc_kb_names(a65b12506e965f,[]).
xc_mapping_rows(a65b12506e965f,[]).
xc_direction(a65b12506e965f,':FORWARD').
xc_monotonicity(a65b12506e965f,':DEFAULT').
xc_creator(a65b12506e965f,'Nichols').
xc_creation_date(a65b12506e965f,19971118).
x_groupMembers(x_DesertShieldCoalition,x_Qatar) :- x_cid(a65b12506e9660).
xc_microtheory(a65b12506e9660,x_HPKBCrisisMt).
xc_source_file(a65b12506e9660,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9660,21792).
xc_kb_names(a65b12506e9660,[]).
xc_mapping_rows(a65b12506e9660,[]).
xc_direction(a65b12506e9660,':FORWARD').
xc_monotonicity(a65b12506e9660,':DEFAULT').
xc_creator(a65b12506e9660,'Nichols').
xc_creation_date(a65b12506e9660,19971118).
x_groupMembers(x_DesertShieldCoalition,x_Oman) :- x_cid(a65b12506e9661).
xc_microtheory(a65b12506e9661,x_HPKBCrisisMt).
xc_source_file(a65b12506e9661,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9661,21798).
xc_kb_names(a65b12506e9661,[]).
xc_mapping_rows(a65b12506e9661,[]).
xc_direction(a65b12506e9661,':FORWARD').
xc_monotonicity(a65b12506e9661,':DEFAULT').
xc_creator(a65b12506e9661,'Nichols').
xc_creation_date(a65b12506e9661,19971118).
x_groupMembers(x_DesertShieldCoalition,x_Niger) :- x_cid(a65b12506e9662).
xc_microtheory(a65b12506e9662,x_HPKBCrisisMt).
xc_source_file(a65b12506e9662,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9662,21804).
xc_kb_names(a65b12506e9662,[]).
xc_mapping_rows(a65b12506e9662,[]).
xc_direction(a65b12506e9662,':FORWARD').
xc_monotonicity(a65b12506e9662,':DEFAULT').
xc_creator(a65b12506e9662,'Nichols').
xc_creation_date(a65b12506e9662,19971118).
x_groupMembers(x_DesertShieldCoalition,x_Italy) :- x_cid(a65b12506e9663).
xc_microtheory(a65b12506e9663,x_HPKBCrisisMt).
xc_source_file(a65b12506e9663,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9663,21810).
xc_kb_names(a65b12506e9663,[]).
xc_mapping_rows(a65b12506e9663,[]).
xc_direction(a65b12506e9663,':FORWARD').
xc_monotonicity(a65b12506e9663,':DEFAULT').
xc_creator(a65b12506e9663,'Nichols').
xc_creation_date(a65b12506e9663,19971118).
x_groupMembers(x_DesertShieldCoalition,x_Honduras) :- x_cid(a65b12506e9664).
xc_microtheory(a65b12506e9664,x_HPKBCrisisMt).
xc_source_file(a65b12506e9664,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9664,21816).
xc_kb_names(a65b12506e9664,[]).
xc_mapping_rows(a65b12506e9664,[]).
xc_direction(a65b12506e9664,':FORWARD').
xc_monotonicity(a65b12506e9664,':DEFAULT').
xc_creator(a65b12506e9664,'Nichols').
xc_creation_date(a65b12506e9664,19971118).
x_groupMembers(x_DesertShieldCoalition,x_Germany) :- x_cid(a65b12506e9665).
xc_microtheory(a65b12506e9665,x_HPKBCrisisMt).
xc_source_file(a65b12506e9665,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9665,21822).
xc_kb_names(a65b12506e9665,[]).
xc_mapping_rows(a65b12506e9665,[]).
xc_direction(a65b12506e9665,':FORWARD').
xc_monotonicity(a65b12506e9665,':DEFAULT').
xc_creator(a65b12506e9665,'Nichols').
xc_creation_date(a65b12506e9665,19971118).
x_groupMembers(x_DesertShieldCoalition,x_France) :- x_cid(a65b12506e9666).
xc_microtheory(a65b12506e9666,x_HPKBCrisisMt).
xc_source_file(a65b12506e9666,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9666,21828).
xc_kb_names(a65b12506e9666,[]).
xc_mapping_rows(a65b12506e9666,[]).
xc_direction(a65b12506e9666,':FORWARD').
xc_monotonicity(a65b12506e9666,':DEFAULT').
xc_creator(a65b12506e9666,'Nichols').
xc_creation_date(a65b12506e9666,19971118).
x_groupMembers(x_DesertShieldCoalition,x_Egypt) :- x_cid(a65b12506e9667).
xc_microtheory(a65b12506e9667,x_HPKBCrisisMt).
xc_source_file(a65b12506e9667,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9667,21834).
xc_kb_names(a65b12506e9667,[]).
xc_mapping_rows(a65b12506e9667,[]).
xc_direction(a65b12506e9667,':FORWARD').
xc_monotonicity(a65b12506e9667,':DEFAULT').
xc_creator(a65b12506e9667,'Nichols').
xc_creation_date(a65b12506e9667,19971118).
x_groupMembers(x_DesertShieldCoalition,x_Czechoslovakia) :- x_cid(a65b12506e9668).
xc_microtheory(a65b12506e9668,x_HPKBCrisisMt).
xc_source_file(a65b12506e9668,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9668,21840).
xc_kb_names(a65b12506e9668,[]).
xc_mapping_rows(a65b12506e9668,[]).
xc_direction(a65b12506e9668,':FORWARD').
xc_monotonicity(a65b12506e9668,':DEFAULT').
xc_creator(a65b12506e9668,'Nichols').
xc_creation_date(a65b12506e9668,19971118).
x_groupMembers(x_DesertShieldCoalition,x_Canada) :- x_cid(a65b12506e9669).
xc_microtheory(a65b12506e9669,x_HPKBCrisisMt).
xc_source_file(a65b12506e9669,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9669,21846).
xc_kb_names(a65b12506e9669,[]).
xc_mapping_rows(a65b12506e9669,[]).
xc_direction(a65b12506e9669,':FORWARD').
xc_monotonicity(a65b12506e9669,':DEFAULT').
xc_creator(a65b12506e9669,'Nichols').
xc_creation_date(a65b12506e9669,19971118).
x_groupMembers(x_DesertShieldCoalition,x_Belgium) :- x_cid(a65b12506e966a).
xc_microtheory(a65b12506e966a,x_HPKBCrisisMt).
xc_source_file(a65b12506e966a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e966a,21852).
xc_kb_names(a65b12506e966a,[]).
xc_mapping_rows(a65b12506e966a,[]).
xc_direction(a65b12506e966a,':FORWARD').
xc_monotonicity(a65b12506e966a,':DEFAULT').
xc_creator(a65b12506e966a,'Nichols').
xc_creation_date(a65b12506e966a,19971118).
x_groupMembers(x_DesertShieldCoalition,x_Bangladesh) :- x_cid(a65b12506e966b).
xc_microtheory(a65b12506e966b,x_HPKBCrisisMt).
xc_source_file(a65b12506e966b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e966b,21858).
xc_kb_names(a65b12506e966b,[]).
xc_mapping_rows(a65b12506e966b,[]).
xc_direction(a65b12506e966b,':FORWARD').
xc_monotonicity(a65b12506e966b,':DEFAULT').
xc_creator(a65b12506e966b,'Nichols').
xc_creation_date(a65b12506e966b,19971118).
x_groupMembers(x_DesertShieldCoalition,x_Australia) :- x_cid(a65b12506e966c).
xc_microtheory(a65b12506e966c,x_HPKBCrisisMt).
xc_source_file(a65b12506e966c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e966c,21864).
xc_kb_names(a65b12506e966c,[]).
xc_mapping_rows(a65b12506e966c,[]).
xc_direction(a65b12506e966c,':FORWARD').
xc_monotonicity(a65b12506e966c,':DEFAULT').
xc_creator(a65b12506e966c,'Nichols').
xc_creation_date(a65b12506e966c,19971118).
x_groupMembers(x_DesertShieldCoalition,x_Afghanistan) :- x_cid(a65b12506e966d).
xc_microtheory(a65b12506e966d,x_HPKBCrisisMt).
xc_source_file(a65b12506e966d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e966d,21870).
xc_kb_names(a65b12506e966d,[]).
xc_mapping_rows(a65b12506e966d,[]).
xc_direction(a65b12506e966d,':FORWARD').
xc_monotonicity(a65b12506e966d,':DEFAULT').
xc_creator(a65b12506e966d,'Nichols').
xc_creation_date(a65b12506e966d,19971118).
x_groupMembers(x_DesertShieldCoalition,x_Kuwait) :- x_cid(a65b12506e966e).
xc_microtheory(a65b12506e966e,x_HPKBCrisisMt).
xc_source_file(a65b12506e966e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e966e,21876).
xc_kb_names(a65b12506e966e,[]).
xc_mapping_rows(a65b12506e966e,[]).
xc_direction(a65b12506e966e,':FORWARD').
xc_monotonicity(a65b12506e966e,':DEFAULT').
xc_creator(a65b12506e966e,'Nichols').
xc_creation_date(a65b12506e966e,19971118).
x_groupMembers(x_DesertShieldCoalition,x_SaudiArabia) :- x_cid(a65b12506e966f).
xc_microtheory(a65b12506e966f,x_HPKBCrisisMt).
xc_source_file(a65b12506e966f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e966f,21882).
xc_kb_names(a65b12506e966f,[]).
xc_mapping_rows(a65b12506e966f,[]).
xc_direction(a65b12506e966f,':FORWARD').
xc_monotonicity(a65b12506e966f,':DEFAULT').
xc_creator(a65b12506e966f,'Nichols').
xc_creation_date(a65b12506e966f,19971118).
x_groupMembers(x_DesertShieldCoalition,x_UnitedStatesOfAmerica) :- x_cid(a65b12506e9670).
xc_microtheory(a65b12506e9670,x_HPKBCrisisMt).
xc_source_file(a65b12506e9670,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9670,21888).
xc_kb_names(a65b12506e9670,[]).
xc_mapping_rows(a65b12506e9670,[]).
xc_direction(a65b12506e9670,':FORWARD').
xc_monotonicity(a65b12506e9670,':DEFAULT').
xc_creator(a65b12506e9670,'Nichols').
xc_creation_date(a65b12506e9670,19971118).
x_implies(x_decreasesImmediatelyCausally(V1,V2,'x_power-Military'),x_maleficiary(V1,V2)) :- x_cid(a65b12506e9671,V1,V2).
xc_microtheory(a65b12506e9671,x_HPKBCrisisMt).
xc_source_file(a65b12506e9671,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9671,21894).
xc_kb_names(a65b12506e9671,["?EVENT","?COUNTRY"]).
xc_mapping_rows(a65b12506e9671,['implication-implies']).
xc_direction(a65b12506e9671,':BACKWARD').
xc_monotonicity(a65b12506e9671,':DEFAULT').
xc_creator(a65b12506e9671,'KathyBurns').
xc_creation_date(a65b12506e9671,19971118).
x_implies(x_and('x_internationalOrg-MemberCountry'(x_GulfCooperationCouncil,V1),x_different(V1,V2),'x_internationalOrg-MemberCountry'(x_GulfCooperationCouncil,V2)),x_allies(V1,V2)) :- x_cid(a65b12506e9672,V1,V2).
xc_microtheory(a65b12506e9672,x_HPKBCrisisMt).
xc_source_file(a65b12506e9672,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9672,21902).
xc_kb_names(a65b12506e9672,["?NATION1","?NATION2"]).
xc_mapping_rows(a65b12506e9672,['implication-implies']).
xc_direction(a65b12506e9672,':BACKWARD').
xc_monotonicity(a65b12506e9672,':DEFAULT').
xc_creator(a65b12506e9672,'Davis').
xc_creation_date(a65b12506e9672,19971117).
x_implies(x_isa(V1,x_BlockingAnInternationalWaterway),x_knowsAbout(x_InternationalCommunity,V1)) :- x_cid(a65b12506e9673,V1).
xc_microtheory(a65b12506e9673,x_HPKBCrisisMt).
xc_source_file(a65b12506e9673,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9673,21913).
xc_kb_names(a65b12506e9673,["?ACT"]).
xc_mapping_rows(a65b12506e9673,['implication-implies']).
xc_direction(a65b12506e9673,':BACKWARD').
xc_monotonicity(a65b12506e9673,':DEFAULT').
xc_creator(a65b12506e9673,'KathyBurns').
xc_creation_date(a65b12506e9673,19971117).
x_allies(x_SaudiArabia,x_UnitedStatesOfAmerica) :- x_cid(a65b12506e9674).
xc_microtheory(a65b12506e9674,x_HPKBCrisisMt).
xc_source_file(a65b12506e9674,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9674,21921).
xc_kb_names(a65b12506e9674,[]).
xc_mapping_rows(a65b12506e9674,[]).
xc_direction(a65b12506e9674,':FORWARD').
xc_monotonicity(a65b12506e9674,':DEFAULT').
xc_creator(a65b12506e9674,'Davis').
xc_creation_date(a65b12506e9674,19971115).
x_exceptWhen(x_isa(V1,'x_Execution-Judicial'),x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_performedBy(V1,V2),x_victim(V1,V3)),x_promotesRisk(V1,V2,x_AttackOnTangible,x_victim))) :- x_cid(a65b12506e9675,V1,V2,V3).
xc_microtheory(a65b12506e9675,x_HPKBCrisisMt).
xc_source_file(a65b12506e9675,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9675,21927).
xc_kb_names(a65b12506e9675,["?ATTACK01","?AG","?VIC"]).
xc_mapping_rows(a65b12506e9675,['implication-implies']).
xc_direction(a65b12506e9675,':FORWARD').
xc_monotonicity(a65b12506e9675,':DEFAULT').
xc_creator(a65b12506e9675,'OKeefe').
xc_creation_date(a65b12506e9675,19971114).
x_allies(x_Iran,x_Syria) :- x_cid(a65b12506e9676).
xc_microtheory(a65b12506e9676,x_HPKBCrisisMt).
xc_source_file(a65b12506e9676,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9676,21940).
xc_kb_names(a65b12506e9676,[]).
xc_mapping_rows(a65b12506e9676,[]).
xc_direction(a65b12506e9676,':BACKWARD').
xc_monotonicity(a65b12506e9676,':DEFAULT').
xc_creator(a65b12506e9676,'Davis').
xc_creation_date(a65b12506e9676,19971114).
x_not(x_and(x_allies(x_Iran,V1),'x_internationalOrg-MemberCountry'(x_GulfCooperationCouncil,V1))) :- x_cid(a65b12506e9677,V1).
xc_microtheory(a65b12506e9677,x_HPKBCrisisMt).
xc_source_file(a65b12506e9677,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9677,21946).
xc_kb_names(a65b12506e9677,["?NATION"]).
xc_mapping_rows(a65b12506e9677,[]).
xc_direction(a65b12506e9677,':BACKWARD').
xc_monotonicity(a65b12506e9677,':DEFAULT').
xc_creator(a65b12506e9677,'Davis').
xc_creation_date(a65b12506e9677,19971114).
x_opponents(x_SaudiArabia,x_Iran) :- x_cid(a65b12506e9678).
xc_microtheory(a65b12506e9678,x_HPKBCrisisMt).
xc_source_file(a65b12506e9678,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9678,21955).
xc_kb_names(a65b12506e9678,[]).
xc_mapping_rows(a65b12506e9678,[]).
xc_direction(a65b12506e9678,':FORWARD').
xc_monotonicity(a65b12506e9678,':DEFAULT').
xc_creator(a65b12506e9678,'BillJ').
xc_creation_date(a65b12506e9678,19971112).
x_implies(x_goals(V1,V2),x_prefers(V1,V2,x_not(V2))) :- x_cid(a65b12506e9679,V1,V2).
xc_microtheory(a65b12506e9679,x_HPKBCrisisMt).
xc_source_file(a65b12506e9679,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9679,21961).
xc_kb_names(a65b12506e9679,["?AGT","?GOAL"]).
xc_mapping_rows(a65b12506e9679,['implication-implies']).
xc_direction(a65b12506e9679,':BACKWARD').
xc_monotonicity(a65b12506e9679,':DEFAULT').
xc_creator(a65b12506e9679,'OKeefe').
xc_creation_date(a65b12506e9679,19971111).
x_isa(x_ImportExportEvent,x_ScriptType) :- x_cid(a65b12506e967a).
xc_microtheory(a65b12506e967a,x_HPKBCrisisMt).
xc_source_file(a65b12506e967a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e967a,21970).
xc_kb_names(a65b12506e967a,[]).
xc_mapping_rows(a65b12506e967a,[]).
xc_direction(a65b12506e967a,':FORWARD').
xc_monotonicity(a65b12506e967a,':DEFAULT').
x_genls(x_ImportExportEvent,x_ConveyingMaterials) :- x_cid(a65b12506e967b).
xc_microtheory(a65b12506e967b,x_HPKBCrisisMt).
xc_source_file(a65b12506e967b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e967b,21976).
xc_kb_names(a65b12506e967b,[]).
xc_mapping_rows(a65b12506e967b,[]).
xc_direction(a65b12506e967b,':FORWARD').
xc_monotonicity(a65b12506e967b,':DEFAULT').
xc_creator(a65b12506e967b,'Rode').
xc_creation_date(a65b12506e967b,19971111).
x_implies(x_and(x_performedBy(V1,V2),x_actionViolatesObligation(V1,V3)),x_agentViolatesObligation(V2,V3)) :- x_cid(a65b12506e967c,V1,V2,V3).
xc_microtheory(a65b12506e967c,x_HPKBCrisisMt).
xc_source_file(a65b12506e967c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e967c,21982).
xc_kb_names(a65b12506e967c,["?ACT","?AGT","?OB"]).
xc_mapping_rows(a65b12506e967c,['implication-implies']).
xc_direction(a65b12506e967c,':BACKWARD').
xc_monotonicity(a65b12506e967c,':DEFAULT').
xc_creator(a65b12506e967c,'OKeefe').
xc_creation_date(a65b12506e967c,19971110).
x_implies('x_internationalOrg-MemberCountry'(x_GulfCooperationCouncil,V1),x_positiveVestedInterest(x_GulfCooperationCouncil,V1)) :- x_cid(a65b12506e967d,V1).
xc_microtheory(a65b12506e967d,x_HPKBCrisisMt).
xc_source_file(a65b12506e967d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e967d,21992).
xc_kb_names(a65b12506e967d,["?NATION"]).
xc_mapping_rows(a65b12506e967d,['implication-implies']).
xc_direction(a65b12506e967d,':BACKWARD').
xc_monotonicity(a65b12506e967d,':DEFAULT').
xc_creator(a65b12506e967d,'Nichols').
xc_creation_date(a65b12506e967d,19971107).
x_implies(x_and('x_internationalOrg-MemberCountry'(x_GulfCooperationCouncil,V1),x_goalCategoryForAgent(V1,V2,x_NationalDefenseGoal)),x_goals(x_GulfCooperationCouncil,V2)) :- x_cid(a65b12506e967e,V1,V2).
xc_microtheory(a65b12506e967e,x_HPKBCrisisMt).
xc_source_file(a65b12506e967e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e967e,22000).
xc_kb_names(a65b12506e967e,["?NATION","?GOAL"]).
xc_mapping_rows(a65b12506e967e,['implication-implies']).
xc_direction(a65b12506e967e,':BACKWARD').
xc_monotonicity(a65b12506e967e,':DEFAULT').
xc_creator(a65b12506e967e,'Nichols').
xc_creation_date(a65b12506e967e,19971107).
x_cyclistNotes(x_regulatesResource,"At the moment arg2 is inadequately constrained.") :- x_cid(a65b12506e967f).
xc_microtheory(a65b12506e967f,x_HPKBCrisisMt).
xc_source_file(a65b12506e967f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e967f,22010).
xc_kb_names(a65b12506e967f,[]).
xc_mapping_rows(a65b12506e967f,[]).
xc_direction(a65b12506e967f,':FORWARD').
xc_monotonicity(a65b12506e967f,':DEFAULT').
xc_creator(a65b12506e967f,'Kean').
xc_creation_date(a65b12506e967f,19971107).
x_comment(x_regulatesResource,"(regulatesResource AUTHORITY RESOURCE) means that the #$ResourceManagementAuthority AUTHORITY is responsible for the  resource RESOURCE.") :- x_cid(a65b12506e9680).
xc_microtheory(a65b12506e9680,x_HPKBCrisisMt).
xc_source_file(a65b12506e9680,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9680,22016).
xc_kb_names(a65b12506e9680,[]).
xc_mapping_rows(a65b12506e9680,[]).
xc_direction(a65b12506e9680,':FORWARD').
xc_monotonicity(a65b12506e9680,':DEFAULT').
xc_creator(a65b12506e9680,'Kean').
xc_creation_date(a65b12506e9680,19971107).
x_implies(x_isa(V1,x_OilRefinery),x_primaryFunction(V1,x_RefiningPetroleum,x_eventOccursAt)) :- x_cid(a65b12506e9681,V1).
xc_microtheory(a65b12506e9681,x_HPKBCrisisMt).
xc_source_file(a65b12506e9681,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9681,22022).
xc_kb_names(a65b12506e9681,["?REFINERY"]).
xc_mapping_rows(a65b12506e9681,['implication-implies']).
xc_direction(a65b12506e9681,':BACKWARD').
xc_monotonicity(a65b12506e9681,':DEFAULT').
xc_creator(a65b12506e9681,'Kean').
xc_creation_date(a65b12506e9681,19971107).
x_arg2Isa('x_SKF-6066610','x_Petroleum-CrudeOil') :- x_cid(a65b12506e9682).
xc_microtheory(a65b12506e9682,x_HPKBCrisisMt).
xc_source_file(a65b12506e9682,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9682,22030).
xc_kb_names(a65b12506e9682,[]).
xc_mapping_rows(a65b12506e9682,[]).
xc_direction(a65b12506e9682,':FORWARD').
xc_monotonicity(a65b12506e9682,':DEFAULT').
x_arg1Isa('x_SKF-6066610',x_Refining) :- x_cid(a65b12506e9683).
xc_microtheory(a65b12506e9683,x_HPKBCrisisMt).
xc_source_file(a65b12506e9683,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9683,22036).
xc_kb_names(a65b12506e9683,[]).
xc_mapping_rows(a65b12506e9683,[]).
xc_direction(a65b12506e9683,':FORWARD').
xc_monotonicity(a65b12506e9683,':DEFAULT').
x_resultIsa('x_SKF-6066610',x_ExtractingPetroleum) :- x_cid(a65b12506e9684).
xc_microtheory(a65b12506e9684,x_HPKBCrisisMt).
xc_source_file(a65b12506e9684,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9684,22042).
xc_kb_names(a65b12506e9684,[]).
xc_mapping_rows(a65b12506e9684,[]).
xc_direction(a65b12506e9684,':FORWARD').
xc_monotonicity(a65b12506e9684,':DEFAULT').
x_arity('x_SKF-6066610',2) :- x_cid(a65b12506e9685).
xc_microtheory(a65b12506e9685,x_HPKBCrisisMt).
xc_source_file(a65b12506e9685,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9685,22048).
xc_kb_names(a65b12506e9685,[]).
xc_mapping_rows(a65b12506e9685,[]).
xc_direction(a65b12506e9685,':FORWARD').
xc_monotonicity(a65b12506e9685,':MONOTONIC').
x_isa('x_SKF-6066610',x_SkolemFunction) :- x_cid(a65b12506e9686).
xc_microtheory(a65b12506e9686,x_HPKBCrisisMt).
xc_source_file(a65b12506e9686,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9686,22054).
xc_kb_names(a65b12506e9686,[]).
xc_mapping_rows(a65b12506e9686,[]).
xc_direction(a65b12506e9686,':FORWARD').
xc_monotonicity(a65b12506e9686,':MONOTONIC').
x_implies(x_industryActivityTypes(V1,V2),x_intendedBehaviorCapable(V1,V2,x_performedBy)) :- x_cid(a65b12506e9687,V1,V2).
xc_microtheory(a65b12506e9687,x_HPKBCrisisMt).
xc_source_file(a65b12506e9687,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9687,22060).
xc_kb_names(a65b12506e9687,["?INDUSTRY","?ACT-TYPE"]).
xc_mapping_rows(a65b12506e9687,['implication-implies']).
xc_direction(a65b12506e9687,':BACKWARD').
xc_monotonicity(a65b12506e9687,':DEFAULT').
xc_creator(a65b12506e9687,'Kean').
xc_creation_date(a65b12506e9687,19971106).
x_implies(x_isa(V1,x_OilRefinery),x_primaryFunction(V1,x_RefiningFn('x_Petroleum-CrudeOil'),x_eventOccursAt)) :- x_cid(a65b12506e9688,V1).
xc_microtheory(a65b12506e9688,x_HPKBCrisisMt).
xc_source_file(a65b12506e9688,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9688,22068).
xc_kb_names(a65b12506e9688,["?REFINERY"]).
xc_mapping_rows(a65b12506e9688,['implication-implies']).
xc_direction(a65b12506e9688,':BACKWARD').
xc_monotonicity(a65b12506e9688,':DEFAULT').
xc_creator(a65b12506e9688,'Kean').
xc_creation_date(a65b12506e9688,19971106).
x_implies(x_primaryActivityType(V1,V2),x_intendedBehaviorCapable(V1,V2,x_eventOccursAt)) :- x_cid(a65b12506e9689,V1,V2).
xc_microtheory(a65b12506e9689,x_HPKBCrisisMt).
xc_source_file(a65b12506e9689,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9689,22077).
xc_kb_names(a65b12506e9689,["?PLACE","?ACTIVITY"]).
xc_mapping_rows(a65b12506e9689,['implication-implies']).
xc_direction(a65b12506e9689,':BACKWARD').
xc_monotonicity(a65b12506e9689,':DEFAULT').
xc_creator(a65b12506e9689,'Kean').
xc_creation_date(a65b12506e9689,19971106).
x_implies(x_isa(V1,x_OilWell),x_primaryFunction(V1,x_ExtractingPetroleum,x_deviceUsed)) :- x_cid(a65b12506e968a,V1).
xc_microtheory(a65b12506e968a,x_HPKBCrisisMt).
xc_source_file(a65b12506e968a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e968a,22085).
xc_kb_names(a65b12506e968a,["?WELL"]).
xc_mapping_rows(a65b12506e968a,['implication-implies']).
xc_direction(a65b12506e968a,':BACKWARD').
xc_monotonicity(a65b12506e968a,':DEFAULT').
xc_creator(a65b12506e968a,'Kean').
xc_creation_date(a65b12506e968a,19971106).
x_implies(x_and(x_isa(V1,x_ConveyingMaterials),x_subEvents(V2,V1),x_isa(V2,x_PhysicalDistributionFn('x_Petroleum-CrudeOil'))),x_or(x_isa(V1,x_PipeFlow),x_isa(V1,x_TransportViaFn(x_TankerShip)))) :- x_cid(a65b12506e968b,V1,V2).
xc_microtheory(a65b12506e968b,x_HPKBCrisisMt).
xc_source_file(a65b12506e968b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e968b,22093).
xc_kb_names(a65b12506e968b,["?TRANSPORT","?DISTRIB"]).
xc_mapping_rows(a65b12506e968b,['implication-implies']).
xc_direction(a65b12506e968b,':BACKWARD').
xc_monotonicity(a65b12506e968b,':DEFAULT').
xc_creator(a65b12506e968b,'Kean').
xc_creation_date(a65b12506e968b,19971106).
x_cyclistNotes(x_regionNaturalResourceAmount,"AMOUNT should be a significant amount for industrial purposes. This predicate is not intended to describe trace amounts.") :- x_cid(a65b12506e968c).
xc_microtheory(a65b12506e968c,x_HPKBCrisisMt).
xc_source_file(a65b12506e968c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e968c,22108).
xc_kb_names(a65b12506e968c,[]).
xc_mapping_rows(a65b12506e968c,[]).
xc_direction(a65b12506e968c,':FORWARD').
xc_monotonicity(a65b12506e968c,':DEFAULT').
xc_creator(a65b12506e968c,'Kean').
xc_creation_date(a65b12506e968c,19971106).
x_comment(x_regionNaturalResourceAmount,"(regionNaturalResourceAmount REGION RESOURCE AMOUNT) means that REGION has AMOUNT of RESOURCE occurring naturally and not yet ready for use.  Examples: unmined minerals, unextracted oil.") :- x_cid(a65b12506e968d).
xc_microtheory(a65b12506e968d,x_HPKBCrisisMt).
xc_source_file(a65b12506e968d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e968d,22114).
xc_kb_names(a65b12506e968d,[]).
xc_mapping_rows(a65b12506e968d,[]).
xc_direction(a65b12506e968d,':FORWARD').
xc_monotonicity(a65b12506e968d,':DEFAULT').
xc_creator(a65b12506e968d,'Kean').
xc_creation_date(a65b12506e968d,19971106).
x_implies(x_productionRateOfAgent(V1,V2,V3),x_industryProducesType(V1,V2)) :- x_cid(a65b12506e968e,V1,V2,V3).
xc_microtheory(a65b12506e968e,x_HPKBCrisisMt).
xc_source_file(a65b12506e968e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e968e,22120).
xc_kb_names(a65b12506e968e,["?INDUSTRY","?PTYPE","?RATE"]).
xc_mapping_rows(a65b12506e968e,['implication-implies']).
xc_direction(a65b12506e968e,':BACKWARD').
xc_monotonicity(a65b12506e968e,':DEFAULT').
xc_creator(a65b12506e968e,'Kean').
xc_creation_date(a65b12506e968e,19971106).
x_cyclistNotes(x_industryProducesType,"Didn't assert arg2Isa ProductType because not all specs of Product are\nautomatically inferred to be ProductTypes; e.g., HouseholdAppliance.") :- x_cid(a65b12506e968f).
xc_microtheory(a65b12506e968f,x_HPKBCrisisMt).
xc_source_file(a65b12506e968f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e968f,22128).
xc_kb_names(a65b12506e968f,[]).
xc_mapping_rows(a65b12506e968f,[]).
xc_direction(a65b12506e968f,':FORWARD').
xc_monotonicity(a65b12506e968f,':DEFAULT').
xc_creator(a65b12506e968f,'Kean').
xc_creation_date(a65b12506e968f,19971104).
x_implies(x_and(x_isa(V1,x_PhysicalDistributionFn(V2)),x_subEvents(V1,V3),x_isa(V3,x_ConveyingMaterials)),x_thereExists(V4,x_and(x_isa(V4,V2),x_transportees(V3,V4)))) :- x_cid(a65b12506e9690,V1,V2,V3,V4).
xc_microtheory(a65b12506e9690,x_HPKBCrisisMt).
xc_source_file(a65b12506e9690,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9690,22135).
xc_kb_names(a65b12506e9690,["?PDF","?TYPE","?TRANSPORT","?STUFF"]).
xc_mapping_rows(a65b12506e9690,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9690,':BACKWARD').
xc_monotonicity(a65b12506e9690,':DEFAULT').
xc_creator(a65b12506e9690,'Kean').
xc_creation_date(a65b12506e9690,19971104).
x_implies(x_and(x_isa(V1,x_PhysicalDistributionFn(V2)),x_subEvents(V1,V3),x_isa(V3,x_ConveyingMaterials)),x_thereExists(V4,x_and(x_isa(V4,V2),x_transportees(V3,V4)))) :- x_cid(a65b12506e9691,V1,V2,V3,V4).
xc_microtheory(a65b12506e9691,x_HPKBCrisisMt).
xc_source_file(a65b12506e9691,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9691,22151).
xc_kb_names(a65b12506e9691,["?PDF","?TYPE","?TRANSPORT","?STUFF"]).
xc_mapping_rows(a65b12506e9691,['implication-implies','exists-thereexists']).
xc_direction(a65b12506e9691,':BACKWARD').
xc_monotonicity(a65b12506e9691,':DEFAULT').
xc_creator(a65b12506e9691,'Kean').
xc_creation_date(a65b12506e9691,19971104).
x_arg3Isa('x_SKF-28051850',x_ConveyingMaterials) :- x_cid(a65b12506e9692).
xc_microtheory(a65b12506e9692,x_HPKBCrisisMt).
xc_source_file(a65b12506e9692,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9692,22167).
xc_kb_names(a65b12506e9692,[]).
xc_mapping_rows(a65b12506e9692,[]).
xc_direction(a65b12506e9692,':FORWARD').
xc_monotonicity(a65b12506e9692,':DEFAULT').
x_arg2Isa('x_SKF-28051850',x_ObjectType) :- x_cid(a65b12506e9693).
xc_microtheory(a65b12506e9693,x_HPKBCrisisMt).
xc_source_file(a65b12506e9693,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9693,22173).
xc_kb_names(a65b12506e9693,[]).
xc_mapping_rows(a65b12506e9693,[]).
xc_direction(a65b12506e9693,':FORWARD').
xc_monotonicity(a65b12506e9693,':DEFAULT').
x_arg1Isa('x_SKF-28051850',x_PhysicalDistributionEvent) :- x_cid(a65b12506e9694).
xc_microtheory(a65b12506e9694,x_HPKBCrisisMt).
xc_source_file(a65b12506e9694,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9694,22179).
xc_kb_names(a65b12506e9694,[]).
xc_mapping_rows(a65b12506e9694,[]).
xc_direction(a65b12506e9694,':FORWARD').
xc_monotonicity(a65b12506e9694,':DEFAULT').
x_arity('x_SKF-28051850',3) :- x_cid(a65b12506e9695).
xc_microtheory(a65b12506e9695,x_HPKBCrisisMt).
xc_source_file(a65b12506e9695,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9695,22185).
xc_kb_names(a65b12506e9695,[]).
xc_mapping_rows(a65b12506e9695,[]).
xc_direction(a65b12506e9695,':FORWARD').
xc_monotonicity(a65b12506e9695,':MONOTONIC').
x_isa('x_SKF-28051850',x_SkolemFunction) :- x_cid(a65b12506e9696).
xc_microtheory(a65b12506e9696,x_HPKBCrisisMt).
xc_source_file(a65b12506e9696,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9696,22191).
xc_kb_names(a65b12506e9696,[]).
xc_mapping_rows(a65b12506e9696,[]).
xc_direction(a65b12506e9696,':FORWARD').
xc_monotonicity(a65b12506e9696,':MONOTONIC').
x_arg2Isa('x_SKF-28542904',x_SomethingExisting) :- x_cid(a65b12506e9697).
xc_microtheory(a65b12506e9697,x_HPKBCrisisMt).
xc_source_file(a65b12506e9697,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9697,22197).
xc_kb_names(a65b12506e9697,[]).
xc_mapping_rows(a65b12506e9697,[]).
xc_direction(a65b12506e9697,':FORWARD').
xc_monotonicity(a65b12506e9697,':DEFAULT').
x_arg1Isa('x_SKF-28542904',x_ProcessingRefinedOil) :- x_cid(a65b12506e9698).
xc_microtheory(a65b12506e9698,x_HPKBCrisisMt).
xc_source_file(a65b12506e9698,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9698,22203).
xc_kb_names(a65b12506e9698,[]).
xc_mapping_rows(a65b12506e9698,[]).
xc_direction(a65b12506e9698,':FORWARD').
xc_monotonicity(a65b12506e9698,':DEFAULT').
x_resultIsa('x_SKF-28542904',x_RefiningFn('x_Petroleum-CrudeOil')) :- x_cid(a65b12506e9699).
xc_microtheory(a65b12506e9699,x_HPKBCrisisMt).
xc_source_file(a65b12506e9699,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e9699,22209).
xc_kb_names(a65b12506e9699,[]).
xc_mapping_rows(a65b12506e9699,[]).
xc_direction(a65b12506e9699,':FORWARD').
xc_monotonicity(a65b12506e9699,':DEFAULT').
x_arity('x_SKF-28542904',2) :- x_cid(a65b12506e969a).
xc_microtheory(a65b12506e969a,x_HPKBCrisisMt).
xc_source_file(a65b12506e969a,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e969a,22216).
xc_kb_names(a65b12506e969a,[]).
xc_mapping_rows(a65b12506e969a,[]).
xc_direction(a65b12506e969a,':FORWARD').
xc_monotonicity(a65b12506e969a,':MONOTONIC').
x_isa('x_SKF-28542904',x_SkolemFunction) :- x_cid(a65b12506e969b).
xc_microtheory(a65b12506e969b,x_HPKBCrisisMt).
xc_source_file(a65b12506e969b,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e969b,22222).
xc_kb_names(a65b12506e969b,[]).
xc_mapping_rows(a65b12506e969b,[]).
xc_direction(a65b12506e969b,':FORWARD').
xc_monotonicity(a65b12506e969b,':MONOTONIC').
x_arg5Isa('x_SKF-53057316',x_PartiallyTangible) :- x_cid(a65b12506e969c).
xc_microtheory(a65b12506e969c,x_HPKBCrisisMt).
xc_source_file(a65b12506e969c,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e969c,22228).
xc_kb_names(a65b12506e969c,[]).
xc_mapping_rows(a65b12506e969c,[]).
xc_direction(a65b12506e969c,':FORWARD').
xc_monotonicity(a65b12506e969c,':DEFAULT').
x_arg4Isa('x_SKF-53057316',x_PartiallyTangible) :- x_cid(a65b12506e969d).
xc_microtheory(a65b12506e969d,x_HPKBCrisisMt).
xc_source_file(a65b12506e969d,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e969d,22234).
xc_kb_names(a65b12506e969d,[]).
xc_mapping_rows(a65b12506e969d,[]).
xc_direction(a65b12506e969d,':FORWARD').
xc_monotonicity(a65b12506e969d,':DEFAULT').
x_arg3Isa('x_SKF-53057316',x_ExtractingPetroleum) :- x_cid(a65b12506e969e).
xc_microtheory(a65b12506e969e,x_HPKBCrisisMt).
xc_source_file(a65b12506e969e,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e969e,22240).
xc_kb_names(a65b12506e969e,[]).
xc_mapping_rows(a65b12506e969e,[]).
xc_direction(a65b12506e969e,':FORWARD').
xc_monotonicity(a65b12506e969e,':DEFAULT').
x_arg2Isa('x_SKF-53057316','x_Petroleum-CrudeOil') :- x_cid(a65b12506e969f).
xc_microtheory(a65b12506e969f,x_HPKBCrisisMt).
xc_source_file(a65b12506e969f,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e969f,22246).
xc_kb_names(a65b12506e969f,[]).
xc_mapping_rows(a65b12506e969f,[]).
xc_direction(a65b12506e969f,':FORWARD').
xc_monotonicity(a65b12506e969f,':DEFAULT').
x_arg1Isa('x_SKF-53057316',x_ChemicalProcessing) :- x_cid(a65b12506e96a0).
xc_microtheory(a65b12506e96a0,x_HPKBCrisisMt).
xc_source_file(a65b12506e96a0,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e96a0,22252).
xc_kb_names(a65b12506e96a0,[]).
xc_mapping_rows(a65b12506e96a0,[]).
xc_direction(a65b12506e96a0,':FORWARD').
xc_monotonicity(a65b12506e96a0,':DEFAULT').
x_resultIsa('x_SKF-53057316',x_TransportFn('x_Petroleum-CrudeOil')) :- x_cid(a65b12506e96a1).
xc_microtheory(a65b12506e96a1,x_HPKBCrisisMt).
xc_source_file(a65b12506e96a1,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e96a1,22258).
xc_kb_names(a65b12506e96a1,[]).
xc_mapping_rows(a65b12506e96a1,[]).
xc_direction(a65b12506e96a1,':FORWARD').
xc_monotonicity(a65b12506e96a1,':DEFAULT').
x_arity('x_SKF-53057316',5) :- x_cid(a65b12506e96a2).
xc_microtheory(a65b12506e96a2,x_HPKBCrisisMt).
xc_source_file(a65b12506e96a2,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e96a2,22265).
xc_kb_names(a65b12506e96a2,[]).
xc_mapping_rows(a65b12506e96a2,[]).
xc_direction(a65b12506e96a2,':FORWARD').
xc_monotonicity(a65b12506e96a2,':MONOTONIC').
x_isa('x_SKF-53057316',x_SkolemFunction) :- x_cid(a65b12506e96a3).
xc_microtheory(a65b12506e96a3,x_HPKBCrisisMt).
xc_source_file(a65b12506e96a3,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e96a3,22271).
xc_kb_names(a65b12506e96a3,[]).
xc_mapping_rows(a65b12506e96a3,[]).
xc_direction(a65b12506e96a3,':FORWARD').
xc_monotonicity(a65b12506e96a3,':MONOTONIC').
x_genls(x_Refining,x_ChemicalProcessing) :- x_cid(a65b12506e96a4).
xc_microtheory(a65b12506e96a4,x_HPKBCrisisMt).
xc_source_file(a65b12506e96a4,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e96a4,22277).
xc_kb_names(a65b12506e96a4,[]).
xc_mapping_rows(a65b12506e96a4,[]).
xc_direction(a65b12506e96a4,':FORWARD').
xc_monotonicity(a65b12506e96a4,':MONOTONIC').
xc_creator(a65b12506e96a4,'Kean').
xc_creation_date(a65b12506e96a4,19971104).
x_implies(x_and(x_isa(V1,x_ExtractingPetroleum),x_fromLocation(V1,V2)),x_locationState(V2,x_Underground)) :- x_cid(a65b12506e96a5,V1,V2).
xc_microtheory(a65b12506e96a5,x_HPKBCrisisMt).
xc_source_file(a65b12506e96a5,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e96a5,22283).
xc_kb_names(a65b12506e96a5,["?EP","?FROM"]).
xc_mapping_rows(a65b12506e96a5,['implication-implies']).
xc_direction(a65b12506e96a5,':BACKWARD').
xc_monotonicity(a65b12506e96a5,':DEFAULT').
xc_creator(a65b12506e96a5,'Kean').
xc_creation_date(a65b12506e96a5,19971104).
x_comment(x_ExtractingPetroleum,"Extracting petroleum from the earth; one of the #$industryActivityTypes\nof an #$OilIndustry.") :- x_cid(a65b12506e96a6).
xc_microtheory(a65b12506e96a6,x_HPKBCrisisMt).
xc_source_file(a65b12506e96a6,'c:/snet/petta/repos/openworld_dr/KBs/HPKBCrisis_Context.kif').
xc_source_line(a65b12506e96a6,22293).
xc_kb_names(a65b12506e96a6,[]).
xc_mapping_rows(a65b12506e96a6,[]).
xc_direction(a65b12506e96a6,':FORWARD').
xc_monotonicity(a65b12506e96a6,':DEFAULT').
xc_creator(a65b12506e96a6,'Kean').
xc_creation_date(a65b12506e96a6,19971104).
kb_cache_footer(footer{count:1412,digest:fb433d1015d6df4c2b0bf765bed6f84ee6c1779992fe46da38899d3855c77d30,headerDigest:'4c5acf49c948577599225e3c1a24de6d0607158fe0cbd9596d170f3cfa4eca66'}).
