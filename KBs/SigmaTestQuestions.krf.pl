:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:41,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:362,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'868a86978f87399eab99d903e7414b95b996e669592e7dfc711405d6949644c8',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:18538,source:'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf',sourceHash:'0c69e602557b595bcade4f62506eefc3db6ec4a1670294edb7ae42529f1898a2',warnings:[]}).
x_isa(x_SigmaTestQuestions,x_Microtheory) :- x_cid(a65b16855fc45d).
xc_microtheory(a65b16855fc45d,x_SigmaTestQuestions).
xc_source_file(a65b16855fc45d,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc45d,3).
xc_kb_names(a65b16855fc45d,[]).
xc_mapping_rows(a65b16855fc45d,[]).
x_isa(x_test_Qs,x_TernaryPredicate) :- x_cid(a65b16855fc45e).
xc_microtheory(a65b16855fc45e,x_SigmaTestQuestions).
xc_source_file(a65b16855fc45e,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc45e,5).
xc_kb_names(a65b16855fc45e,[]).
xc_mapping_rows(a65b16855fc45e,[]).
x_arity(x_test_Qs,3) :- x_cid(a65b16855fc45f).
xc_microtheory(a65b16855fc45f,x_SigmaTestQuestions).
xc_source_file(a65b16855fc45f,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc45f,6).
xc_kb_names(a65b16855fc45f,[]).
xc_mapping_rows(a65b16855fc45f,[]).
x_arg1Isa(x_test_Qs,x_CharacterString) :- x_cid(a65b16855fc460).
xc_microtheory(a65b16855fc460,x_SigmaTestQuestions).
xc_source_file(a65b16855fc460,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc460,7).
xc_kb_names(a65b16855fc460,[]).
xc_mapping_rows(a65b16855fc460,[]).
x_arg2Isa(x_test_Qs,x_CharacterString) :- x_cid(a65b16855fc461).
xc_microtheory(a65b16855fc461,x_SigmaTestQuestions).
xc_source_file(a65b16855fc461,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc461,8).
xc_kb_names(a65b16855fc461,[]).
xc_mapping_rows(a65b16855fc461,[]).
x_arg3Isa(x_test_Qs,x_CycLFormula) :- x_cid(a65b16855fc462).
xc_microtheory(a65b16855fc462,x_SigmaTestQuestions).
xc_source_file(a65b16855fc462,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc462,9).
xc_kb_names(a65b16855fc462,[]).
xc_mapping_rows(a65b16855fc462,[]).
x_comment(x_test_Qs,"(test_Qs ID ENGLISH FORMULA) records a test question: argument 1 is its identifier string, argument 2 is its English question string, and argument 3 is its query formula.") :- x_cid(a65b16855fc463).
xc_microtheory(a65b16855fc463,x_SigmaTestQuestions).
xc_source_file(a65b16855fc463,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc463,10).
xc_kb_names(a65b16855fc463,[]).
xc_mapping_rows(a65b16855fc463,[]).
x_test_Qs("TQA100-b","What bodies of water border on Saudi Arabia?",x_and(x_isa(V1,x_BodyOfWater),x_bordersOn(V1,x_SaudiArabia))) :- x_cid(a65b16855fc464,V1).
xc_microtheory(a65b16855fc464,x_SigmaTestQuestions).
xc_source_file(a65b16855fc464,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc464,17).
xc_kb_names(a65b16855fc464,["?X"]).
xc_mapping_rows(a65b16855fc464,[]).
x_test_Qs("TQA62","What are the goals of the International Atomic Energy Agency (IAEA)?",x_statementOfPurpose(x_InternationalAtomicEnergyAgency,V1)) :- x_cid(a65b16855fc465,V1).
xc_microtheory(a65b16855fc465,x_SigmaTestQuestions).
xc_source_file(a65b16855fc465,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc465,21).
xc_kb_names(a65b16855fc465,["?PURPOSE"]).
xc_mapping_rows(a65b16855fc465,[]).
x_test_Qs("TQA70","Is the United States of America a member of the Organization for Economic Cooperation and Development (OECD)?",x_hasMembers(x_OECD,x_UnitedStatesOfAmerica)) :- x_cid(a65b16855fc466).
xc_microtheory(a65b16855fc466,x_SigmaTestQuestions).
xc_source_file(a65b16855fc466,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc466,25).
xc_kb_names(a65b16855fc466,[]).
xc_mapping_rows(a65b16855fc466,[]).
x_test_Qs("TQA49","What terrorist group opposing the government of Bahrain exists within Bahrain?",x_and(x_residenceOfOrganization(V1,x_Bahrain),x_isa(V1,x_TerroristGroup),x_negativeVestedInterest(V1,x_Bahrain))) :- x_cid(a65b16855fc467,V1).
xc_microtheory(a65b16855fc467,x_SigmaTestQuestions).
xc_source_file(a65b16855fc467,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc467,29).
xc_kb_names(a65b16855fc467,["?AGENT"]).
xc_mapping_rows(a65b16855fc467,[]).
x_test_Qs("TQA65","During the temporal extent of the Iran-Iraq War, did Iran ever attack using ballistic missiles?",x_thereExists(V1,x_thereExists(V2,x_and(x_performedBy(V1,x_Iran),x_isa(V1,x_AttackOnTangible),x_isa(V2,x_BallisticMissile),'x_instrument-Generic'(V1,V2),x_temporallySubsumes('x_Iran-IraqWar',V1))))) :- x_cid(a65b16855fc468,V1,V2).
xc_microtheory(a65b16855fc468,x_SigmaTestQuestions).
xc_source_file(a65b16855fc468,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc468,33).
xc_kb_names(a65b16855fc468,["?ACT","?FORCE"]).
xc_mapping_rows(a65b16855fc468,[]).
x_test_Qs("TQB5","What amount of Saudi Arabia's gross domestic product (GDP) comes from export of oil?",x_and(x_isa(V1,x_Money),x_exportAmountDuring(x_SaudiArabia,x_PetroleumProduct,V2,V1))) :- x_cid(a65b16855fc469,V1,V2).
xc_microtheory(a65b16855fc469,x_SigmaTestQuestions).
xc_source_file(a65b16855fc469,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc469,44).
xc_kb_names(a65b16855fc469,["?AMOUNT","?TIME"]).
xc_mapping_rows(a65b16855fc469,[]).
x_test_Qs("TQB7","What amount of Saudi Arabia's export of oil is transported through the Petroline?",x_exportThroughAmountDuring(x_SaudiArabia,x_PetroleumProduct,x_PetrolinePipeline,V1,V2)) :- x_cid(a65b16855fc46a,V1,V2).
xc_microtheory(a65b16855fc46a,x_SigmaTestQuestions).
xc_source_file(a65b16855fc46a,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc46a,50).
xc_kb_names(a65b16855fc46a,["?TIME","?AMOUNT"]).
xc_mapping_rows(a65b16855fc46a,[]).
x_test_Qs("TQB25","What goods are transported to the Mediterranean Sea via pipeline?",x_thereExists(V1,x_thereExists(V2,x_and(x_pathTerminus(V1,x_RedSea),x_primaryFunction(V1,x_TransportFn(V3),'x_conveyor-Stationary'))))) :- x_cid(a65b16855fc46b,V1,V2,V3).
xc_microtheory(a65b16855fc46b,x_SigmaTestQuestions).
xc_source_file(a65b16855fc46b,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc46b,54).
xc_kb_names(a65b16855fc46b,["?TRAN","?DEST","?PROD"]).
xc_mapping_rows(a65b16855fc46b,[]).
x_test_Qs("TQB37","What dissident group opposing the government of Iran exists within Iran?",x_and(x_residenceOfOrganization(V1,x_Iran),x_isa(V1,x_DissidentGroup),x_hasStatusWithAgent(V1,x_Iran,x_DissidentStatus),x_negativeVestedInterest(V1,x_Iran))) :- x_cid(a65b16855fc46c,V1).
xc_microtheory(a65b16855fc46c,x_SigmaTestQuestions).
xc_source_file(a65b16855fc46c,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc46c,63).
xc_kb_names(a65b16855fc46c,["?AGENT"]).
xc_mapping_rows(a65b16855fc46c,[]).
x_test_Qs("TQB42","After Day 20, what rewards would Iran expect in successful terrorist attacks against Kuwait's agriculture sector?",x_implies(x_and(x_performedBy(V1,x_Iran),x_isa(V1,x_TerroristAttack),x_damages(V1,x_IndustryOfRegionFn(x_AgriculturalEconomicSector,x_Kuwait)),x_startsAfterStartingOf(V1,x_DateInSituationFn(x_CalendarDay,20,x_HPKBScenarioConflict))),x_or(x_and(x_goals(x_Iran,V2),x_increasesCausally(V1,V2,x_likelihood)),x_and(x_goals(x_Iran,x_not(V2)),x_decreasesCausally(V1,V2,x_likelihood))))) :- x_cid(a65b16855fc46d,V1,V2).
xc_microtheory(a65b16855fc46d,x_SigmaTestQuestions).
xc_source_file(a65b16855fc46d,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc46d,71).
xc_kb_names(a65b16855fc46d,["?ACT","?PROP"]).
xc_mapping_rows(a65b16855fc46d,[]).
x_test_Qs("TQB43","During Days 1 through 16 in the Scenario, would Iran's conducting an air strike against Saudi Arabia be considered an escalation of the conflict with Saudi Arabia?",x_implies(x_and(x_isa(V1,x_AerialAttack),x_performedBy(V1,x_Iran),x_maleficiary(V1,x_SaudiArabia),x_temporallySubsumes(x_TimeIntervalInclusiveFn(x_DateInSituationFn(x_CalendarDay,1,x_HPKBScenarioConflict),x_DateInSituationFn(x_CalendarDay,16,x_HPKBScenarioConflict)),V1)),x_increasesImmediatelyCausally(V1,x_HPKBScenarioConflict,x_conflictLevel))) :- x_cid(a65b16855fc46e,V1).
xc_microtheory(a65b16855fc46e,x_SigmaTestQuestions).
xc_source_file(a65b16855fc46e,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc46e,90).
xc_kb_names(a65b16855fc46e,["?ACT"]).
xc_mapping_rows(a65b16855fc46e,[]).
x_test_Qs("TQB49","What terrorist group opposing the government of Egypt exists within Egypt?",x_and(x_residenceOfOrganization(V1,x_Egypt),x_isa(V1,x_TerroristGroup),x_negativeVestedInterest(V1,x_Egypt))) :- x_cid(a65b16855fc46f,V1).
xc_microtheory(a65b16855fc46f,x_SigmaTestQuestions).
xc_source_file(a65b16855fc46f,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc46f,103).
xc_kb_names(a65b16855fc46f,["?AGENT"]).
xc_mapping_rows(a65b16855fc46f,[]).
x_test_Qs("TQB52","What rewards would Iran expect in establishing a coalition of states against the Gulf Cooperation Council (GCC)?",x_implies(x_and(x_performedBy(V1,x_Iran),x_isa(V1,x_FoundingAnOrganization),x_isa(V2,'x_Coalition-International'),x_considersAsEnemy(V2,x_GulfCooperationCouncil),x_outputsCreated(V1,V2)),x_or(x_and(x_goals(x_Iran,V3),x_increasesCausally(V1,V3,x_likelihood)),x_and(x_goals(x_Iran,x_not(V3)),x_decreasesCausally(V1,V3,x_likelihood))))) :- x_cid(a65b16855fc470,V1,V2,V3).
xc_microtheory(a65b16855fc470,x_SigmaTestQuestions).
xc_source_file(a65b16855fc470,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc470,110).
xc_kb_names(a65b16855fc470,["?ACT","?ORG","?PROP"]).
xc_mapping_rows(a65b16855fc470,[]).
x_test_Qs("TQB53","What risks would Iran face in damaging the Petroline?",x_implies(x_and(x_performedBy(V1,x_Iran),x_isa(V1,x_AttackOnTangible),x_damages(V1,x_PetrolinePipeline)),x_or(x_and(x_goals(x_Iran,V2),x_decreasesCausally(V1,V2,x_likelihood)),x_and(x_goals(x_Iran,x_not(V2)),x_increasesCausally(V1,V2,x_likelihood))))) :- x_cid(a65b16855fc471,V1,V2).
xc_microtheory(a65b16855fc471,x_SigmaTestQuestions).
xc_source_file(a65b16855fc471,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc471,128).
xc_kb_names(a65b16855fc471,["?ACT","?PROP"]).
xc_mapping_rows(a65b16855fc471,[]).
x_test_Qs("TQB62","What are the goals of the International Criminal Police Organization (INTERPOL)?",x_statementOfPurpose(x_INTERPOL,V1)) :- x_cid(a65b16855fc472,V1).
xc_microtheory(a65b16855fc472,x_SigmaTestQuestions).
xc_source_file(a65b16855fc472,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc472,144).
xc_kb_names(a65b16855fc472,["?PURPOSE"]).
xc_mapping_rows(a65b16855fc472,[]).
x_test_Qs("TQB66a","What countries militarily opposed Kuwait during the Persian Gulf War?",x_thereExists(V1,x_and(x_isa(V1,x_MilitaryEvent),x_performedBy(V1,V2),x_maleficiary(V1,x_Kuwait),x_isa(V2,x_IndependentCountry),x_different(V2,x_Kuwait),x_temporallySubsumes(x_PersianGulfWar,V1)))) :- x_cid(a65b16855fc473,V1,V2).
xc_microtheory(a65b16855fc473,x_SigmaTestQuestions).
xc_source_file(a65b16855fc473,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc473,148).
xc_kb_names(a65b16855fc473,["?ACTION","?COUNTRY"]).
xc_mapping_rows(a65b16855fc473,[]).
x_test_Qs("TQB67a","What countries militarily opposed Saudi Arabia during the Persian Gulf War?",x_and(x_isa(V1,x_IndependentCountry),x_opponentsInConflict(V1,x_SaudiArabia,x_PersianGulfWar))) :- x_cid(a65b16855fc474,V1).
xc_microtheory(a65b16855fc474,x_SigmaTestQuestions).
xc_source_file(a65b16855fc474,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc474,159).
xc_kb_names(a65b16855fc474,["?COUNTRY"]).
xc_mapping_rows(a65b16855fc474,[]).
x_test_Qs("TQB85","Has Iraq ever attacked using ballistic missiles?",x_thereExists(V1,x_thereExists(V2,x_and(x_performedBy(V3,x_Iraq),x_isa(V1,x_AttackOnTangible),x_isa(V2,x_BallisticMissile),'x_instrument-Generic'(V1,V2))))) :- x_cid(a65b16855fc475,V1,V2,V3).
xc_microtheory(a65b16855fc475,x_SigmaTestQuestions).
xc_source_file(a65b16855fc475,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc475,165).
xc_kb_names(a65b16855fc475,["?ACT","?FORCE","?AC#$T"]).
xc_mapping_rows(a65b16855fc475,[]).
x_test_Qs("TQB107","In the Scenario, what is the number of dead caused by the truck bomb attack on the oil field during Day 25?",x_thereExists(V1,x_and(x_subEvents(x_HPKBScenarioConflict,V1),x_isa(V1,x_AttackOnTangible),x_temporallySubsumes(x_DateInSituationFn(x_CalendarDay,25,x_HPKBScenarioConflict),V1),x_deathToll(V1,x_Person,V2),x_thereExists(V3,x_and(x_isa(V3,x_TruckBomb),'x_instrument-Generic'(V1,V3)))))) :- x_cid(a65b16855fc476,V1,V2,V3).
xc_microtheory(a65b16855fc476,x_SigmaTestQuestions).
xc_source_file(a65b16855fc476,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc476,175).
xc_kb_names(a65b16855fc476,["?ACT","?NUM","?FORCE"]).
xc_mapping_rows(a65b16855fc476,[]).
x_test_Qs("TQB129","Is Oman near the Persian Gulf?",x_near(x_Oman,x_PersianGulf)) :- x_cid(a65b16855fc477).
xc_microtheory(a65b16855fc477,x_SigmaTestQuestions).
xc_source_file(a65b16855fc477,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc477,189).
xc_kb_names(a65b16855fc477,[]).
xc_mapping_rows(a65b16855fc477,[]).
x_test_Qs("TQC1","What major oil refineries are in Libya?",x_and(x_isa(V1,x_OilRefinery),x_inRegion(V1,x_Libya))) :- x_cid(a65b16855fc478,V1).
xc_microtheory(a65b16855fc478,x_SigmaTestQuestions).
xc_source_file(a65b16855fc478,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc478,193).
xc_kb_names(a65b16855fc478,["?X"]).
xc_mapping_rows(a65b16855fc478,[]).
x_test_Qs("TQC103","During Day 23, how does the United States of America respond to the weapons of mass destruction attack by Iran?",x_thereExists(V1,x_and(x_subEvents(x_HPKBScenarioConflict,V1),x_isa(V1,x_AttackOnTangible),x_thereExists(V2,x_and('x_instrument-Generic'(V1,V2),x_isa(V2,x_WeaponOfMassDestruction))),x_inReactionTo(V3,V1),x_deliberateActors(V1,x_Iran),x_deliberateActors(V3,x_UnitedStatesOfAmerica),x_temporallySubsumes(x_DateInSituationFn(x_CalendarDay,23,x_HPKBScenarioConflict),V3)))) :- x_cid(a65b16855fc479,V1,V2,V3).
xc_microtheory(a65b16855fc479,x_SigmaTestQuestions).
xc_source_file(a65b16855fc479,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc479,202).
xc_kb_names(a65b16855fc479,["?ACT","?FORCE","?RESP"]).
xc_mapping_rows(a65b16855fc479,[]).
x_test_Qs("TQC106","In the Scenario, what is the illness caused by the weapons of mass destruction attack during Day 22?",x_thereExists(V1,x_and(x_isa(V1,x_AttackOnTangible),x_temporallySubsumes(x_DateInSituationFn(x_CalendarDay,22,x_HPKBScenarioConflict),V1),x_thereExists(V2,x_and('x_instrument-Generic'(V1,V2),x_isa(V2,x_WeaponOfMassDestruction))),x_thereExists(V3,x_casualtyCountByAilment(V1,V4,V3))))) :- x_cid(a65b16855fc47a,V1,V2,V3,V4).
xc_microtheory(a65b16855fc47a,x_SigmaTestQuestions).
xc_source_file(a65b16855fc47a,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc47a,218).
xc_kb_names(a65b16855fc47a,["?ACT","?WEAPON","?NUMBER","?ILLNESS"]).
xc_mapping_rows(a65b16855fc47a,[]).
x_test_Qs("TQC108","In the Scenario, what does United States of America claim to play the role of weapon in the weapons of mass destruction attack during Day 22?",x_thereExists(V1,x_thereExists(V2,x_thereExists(V3,x_thereExists(V4,x_and(x_subEvents(x_HPKBScenarioConflict,V1),x_isa(V1,x_AttackOnTangible),'x_instrument-Generic'(V1,V3),x_isa(V3,x_WeaponOfMassDestruction),x_isa(V2,x_Communicating),x_or(x_senderOfInfo(V2,x_UnitedStatesOfAmerica),x_and(x_senderOfInfo(V2,V4),x_hasAgents(x_UnitedStatesOfAmerica,V4))),x_infoTransferred(V2,x_thereExists(V5,x_and('x_instrument-Generic'(V1,V5),x_isa(V5,V6)))))))))) :- x_cid(a65b16855fc47b,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b16855fc47b,x_SigmaTestQuestions).
xc_source_file(a65b16855fc47b,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc47b,232).
xc_kb_names(a65b16855fc47b,["?ACT","?COMM","?FORCE","?USAGENT","?FORCE2","?FORCE-TYPE"]).
xc_mapping_rows(a65b16855fc47b,[]).
x_test_Qs("TQC111","In the Scenario, what kinds of objects play the role of weapon in a weapons of mass destruction attack during Day 22?",x_thereExists(V1,x_thereExists(V2,x_and(x_temporallySubsumes(x_DateInSituationFn(x_CalendarDay,22,x_HPKBScenarioConflict),V1),x_assertedFormula(x_isa(V2,V3)),x_not(x_quotedCollection(V3)),'x_instrument-Generic'(V1,V2),x_isa(V2,x_MilitaryHardware),x_subEvents(x_HPKBScenarioConflict,V1),x_isa(V1,x_AttackOnTangible),x_thereExists(V4,x_and('x_instrument-Generic'(V1,V4),x_isa(V4,x_WeaponOfMassDestruction))))))) :- x_cid(a65b16855fc47c,V1,V2,V3,V4).
xc_microtheory(a65b16855fc47c,x_SigmaTestQuestions).
xc_source_file(a65b16855fc47c,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc47c,255).
xc_kb_names(a65b16855fc47c,["?ACT","?ACTOR","?KIND","?FORCE"]).
xc_mapping_rows(a65b16855fc47c,[]).
x_test_Qs("TQC112","Would a chemical weapons attack make sense as a foreign policy tool for Kuwait?",x_viabilityOfAsForeignPolicyTool(x_Kuwait,x_ChemicalAttack,V1)) :- x_cid(a65b16855fc47d,V1).
xc_microtheory(a65b16855fc47d,x_SigmaTestQuestions).
xc_source_file(a65b16855fc47d,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc47d,275).
xc_kb_names(a65b16855fc47d,["?ATTRIB"]).
xc_mapping_rows(a65b16855fc47d,[]).
x_test_Qs("TQC115","How might an attack by Iran on Saudi Arabia using biological weapons affect the world's economic stability?",x_implies(x_and(x_isa(V1,x_BiologicalAttack),x_maleficiary(V1,x_SaudiArabia),x_performedBy(V1,x_Iran)),x_holdsIn(x_STIF(V1),x_economicStability(x_EconomicSystemFn(x_PlanetEarth),V2)))) :- x_cid(a65b16855fc47e,V1,V2).
xc_microtheory(a65b16855fc47e,x_SigmaTestQuestions).
xc_source_file(a65b16855fc47e,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc47e,279).
xc_kb_names(a65b16855fc47e,["?ATTACK","?STABILITYRATE"]).
xc_mapping_rows(a65b16855fc47e,[]).
x_test_Qs("TQC117","Could chemical weapons play the role of weapon in a bombing mission?",x_typeBehaviorCapable(x_ChemicalWeapon,x_BombingMission,x_deviceUsed)) :- x_cid(a65b16855fc47f).
xc_microtheory(a65b16855fc47f,x_SigmaTestQuestions).
xc_source_file(a65b16855fc47f,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc47f,290).
xc_kb_names(a65b16855fc47f,[]).
xc_mapping_rows(a65b16855fc47f,[]).
x_test_Qs("TQD101b","During Day 19, what actors compete regarding the well-being of their citizens?",x_thereExists(V1,x_thereExists(V2,x_and(x_isa(V1,x_Action),x_performedBy(V1,V3),x_goalCategoryForAgent(V3,V2,x_CitizenSafetyGoal),'x_causes-PropProp'(x_goals(V3,V2),x_performedBy(V1,V3)),x_temporallySubsumes(x_DateInSituationFn(x_CalendarDay,19,x_HPKBScenarioConflict),V1))))) :- x_cid(a65b16855fc480,V1,V2,V3).
xc_microtheory(a65b16855fc480,x_SigmaTestQuestions).
xc_source_file(a65b16855fc480,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc480,294).
xc_kb_names(a65b16855fc480,["?PROTECT-ACTION","?SAFETY-GOAL","?AGENT"]).
xc_mapping_rows(a65b16855fc480,[]).
x_test_Qs("TQD102","During Day 16, does Iran have as an interest weapons of mass destruction?",x_thereExists(V1,x_thereExists(V2,x_or(x_and(x_expertRegarding(V2,V1),x_genls(V1,x_WeaponOfMassDestruction),x_holdsIn(x_DateInSituationFn(x_CalendarDay,16,x_HPKBScenarioConflict),x_givesSupportToAgent(x_Iran,V2,x_HighAmountFn(x_EconomicSupport)))),x_holdsIn(x_DateInSituationFn(x_CalendarDay,16,x_HPKBScenarioConflict),x_goals(x_Iran,x_relationInstanceExists(x_possesses,x_Iran,x_WeaponOfMassDestruction))))))) :- x_cid(a65b16855fc481,V1,V2).
xc_microtheory(a65b16855fc481,x_SigmaTestQuestions).
xc_source_file(a65b16855fc481,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc481,308).
xc_kb_names(a65b16855fc481,["?WEAPON-TYPE","?DEVELOPER"]).
xc_mapping_rows(a65b16855fc481,[]).
x_test_Qs("TQE128","What relationship exists between Al Qaida and Osama bin Laden?",x_thereExists(V1,x_or(t(V1,x_AlQaida,x_OsamaBinLaden),t(V2,x_OsamaBinLaden,x_AlQaida),t(V1,x_AlQaida,x_OsamaBinLaden,V3),t(V2,x_OsamaBinLaden,x_AlQaida,V3),t(V1,x_AlQaida,V3,x_OsamaBinLaden),t(V2,x_OsamaBinLaden,V3,x_AlQaida),t(V1,V3,x_AlQaida,x_OsamaBinLaden),t(V2,V3,x_OsamaBinLaden,x_AlQaida)))) :- x_cid(a65b16855fc482,V1,V2,V3).
xc_microtheory(a65b16855fc482,x_SigmaTestQuestions).
xc_source_file(a65b16855fc482,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc482,323).
xc_kb_names(a65b16855fc482,["?AL-QAIDA-RELATED-TO-BIN-LADEN","?BIN-LADEN-RELATED-TO-AL-QAIDA","?DEGREE"]).
xc_mapping_rows(a65b16855fc482,[]).
x_test_Qs("TQE203","During 2 August 1990 in the 1990-1 Persian Gulf War, what military actions occur in Kuwait?",x_and(x_isa(V1,x_MilitaryEvent),x_subEvents(x_PersianGulfWar,V1),x_eventPartiallyOccursAt(V1,x_Kuwait),x_happeningOnDate(V1,x_DayFn(2,x_MonthFn(x_August,x_YearFn(1990)))))) :- x_cid(a65b16855fc483,V1).
xc_microtheory(a65b16855fc483,x_SigmaTestQuestions).
xc_source_file(a65b16855fc483,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc483,336).
xc_kb_names(a65b16855fc483,["?ACT"]).
xc_mapping_rows(a65b16855fc483,[]).
x_test_Qs("TQF128c","What relationship exists between PFLP-GC and Iran?",x_thereExists(V1,x_or(t(V2,'x_PFLP-GeneralCommand',x_Iran),t(V1,x_Iran,'x_PFLP-GeneralCommand'),t(V2,'x_PFLP-GeneralCommand',x_Iran,V3),t(V4,x_Iran,'x_PFLP-GeneralCommand',V3),t(V2,'x_PFLP-GeneralCommand',V5,x_Iran),t(V4,x_Iran,V5,'x_PFLP-GeneralCommand'),t(V2,V5,'x_PFLP-GeneralCommand',x_Iran),t(V4,V5,x_Iran,'x_PFLP-GeneralCommand')))) :- x_cid(a65b16855fc484,V1,V2,V3,V4,V5).
xc_microtheory(a65b16855fc484,x_SigmaTestQuestions).
xc_source_file(a65b16855fc484,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc484,347).
xc_kb_names(a65b16855fc484,["?IRAN-RELATION-TO-PFLP-GC","?PFLP-GC-RELATED-TO-IRAN","?DEGREE","?IRAN-RELATED-TO-PFLP-GC","?OTHER"]).
xc_mapping_rows(a65b16855fc484,[]).
x_test_Qs("TQF253c","What are ways to attack using biological weapons?",x_typeBehaviorCapable(V1,x_BiologicalAttack,V2)) :- x_cid(a65b16855fc485,V1,V2).
xc_microtheory(a65b16855fc485,x_SigmaTestQuestions).
xc_source_file(a65b16855fc485,'c:/snet/petta/repos/openworld_dr/KBs/SigmaTestQuestions.krf').
xc_source_line(a65b16855fc485,360).
xc_kb_names(a65b16855fc485,["?BIOLOGICAL-WEAPON-TYPE","?BIOLOGICAL-ATTACK-METHOD"]).
xc_mapping_rows(a65b16855fc485,[]).
kb_cache_footer(footer{count:41,digest:'868a86978f87399eab99d903e7414b95b996e669592e7dfc711405d6949644c8',headerDigest:'240b82f9c215face702b6cac8a15be1ed1f6d266277beb5a510c9c5b8d534d9d'}).
