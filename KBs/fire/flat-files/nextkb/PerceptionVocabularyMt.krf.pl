:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:15,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:17,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'413417c00b62e06f266fcc4b37318f98ceacf006c6907373afdcb5aeae75d103',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/PerceptionVocabularyMt.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:2703,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/PerceptionVocabularyMt.krf',sourceHash:'8cd22e7741aaae5109b6bfd66b049d96ad9da14bbe7fdf15ba484b798ea07148',warnings:[]}).
x_isa(x_TheColdTouching,x_TouchingEvent) :- x_cid(a65b1276a24c4f).
xc_microtheory(a65b1276a24c4f,x_PerceptionVocabularyMt).
xc_source_file(a65b1276a24c4f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/PerceptionVocabularyMt.krf').
xc_source_line(a65b1276a24c4f,3).
xc_kb_names(a65b1276a24c4f,[]).
xc_mapping_rows(a65b1276a24c4f,[]).
x_isa(x_TheAcidBurning,x_TouchingEvent) :- x_cid(a65b1276a24c50).
xc_microtheory(a65b1276a24c50,x_PerceptionVocabularyMt).
xc_source_file(a65b1276a24c50,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/PerceptionVocabularyMt.krf').
xc_source_line(a65b1276a24c50,4).
xc_kb_names(a65b1276a24c50,[]).
xc_mapping_rows(a65b1276a24c50,[]).
x_comment(x_likesEventsOfType,"(#$likesEventsOfType AGENT TYPE) means that AGENT has positive feelings associated with events of type TYPE, such that if EVT is and event of type TYPE, (#$feelsTowardsEvent AGENT EVT #$Enjoyment Positive).  We also take it that for any role ROLE such that (#$likesRoleInEventType AGENT ROLE ACTIVITYTYPE), (#$likesEventsOfType AGENT ACTIVITYTYPE).") :- x_cid(a65b1276a24c51).
xc_microtheory(a65b1276a24c51,x_PerceptionVocabularyMt).
xc_source_file(a65b1276a24c51,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/PerceptionVocabularyMt.krf').
xc_source_line(a65b1276a24c51,5).
xc_kb_names(a65b1276a24c51,[]).
xc_mapping_rows(a65b1276a24c51,[]).
x_comment(x_AnimalTypeByBodyPosition,"A collection of collections.  Each instance of #$AnimalTypeByBodyPosition is the collection of all animals that have some particular spatial relationship to some object.  These will usually be functionally denoted.  For example, (#$StraddlingFn JimsSawhorse) returns the collection of animals straddling JimsSawhorse.") :- x_cid(a65b1276a24c52).
xc_microtheory(a65b1276a24c52,x_PerceptionVocabularyMt).
xc_source_file(a65b1276a24c52,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/PerceptionVocabularyMt.krf').
xc_source_line(a65b1276a24c52,6).
xc_kb_names(a65b1276a24c52,[]).
xc_mapping_rows(a65b1276a24c52,[]).
x_comment(x_AnimalTypeByHungerLevel,"A faceting collection.  Each instance of #$AnimalTypeByHungerLevel denotes a collection of #$Animals that share a state of hunger (e.g., #$Hungry, #$NotHungry, #$Starving).  These #$AnimalTypeByHungerLevel instances are the first argument to the predicate #$hungerLevelOf (q.v.).") :- x_cid(a65b1276a24c53).
xc_microtheory(a65b1276a24c53,x_PerceptionVocabularyMt).
xc_source_file(a65b1276a24c53,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/PerceptionVocabularyMt.krf').
xc_source_line(a65b1276a24c53,7).
xc_kb_names(a65b1276a24c53,[]).
xc_mapping_rows(a65b1276a24c53,[]).
x_comment(x_NotHungry,"The collection of #$Animals that are not hungry. A state somewhere in between being #$Hungry and being #$ModeratelyFull") :- x_cid(a65b1276a24c54).
xc_microtheory(a65b1276a24c54,x_PerceptionVocabularyMt).
xc_source_file(a65b1276a24c54,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/PerceptionVocabularyMt.krf').
xc_source_line(a65b1276a24c54,8).
xc_kb_names(a65b1276a24c54,[]).
xc_mapping_rows(a65b1276a24c54,[]).
x_comment(x_ModeratelyFull,"The collection of #$Animals #$ModeratelyFull with food.") :- x_cid(a65b1276a24c55).
xc_microtheory(a65b1276a24c55,x_PerceptionVocabularyMt).
xc_source_file(a65b1276a24c55,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/PerceptionVocabularyMt.krf').
xc_source_line(a65b1276a24c55,9).
xc_kb_names(a65b1276a24c55,[]).
xc_mapping_rows(a65b1276a24c55,[]).
x_comment(x_Starving,"A specialization of #$Animal and an instance of #$AnimalTypeByHungerLevel.  Note: this constant denotes a collection of animals, not a collection of dynamic processes.  For the pertinent specialization of #$Event, see #$Starvation.") :- x_cid(a65b1276a24c56).
xc_microtheory(a65b1276a24c56,x_PerceptionVocabularyMt).
xc_source_file(a65b1276a24c56,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/PerceptionVocabularyMt.krf').
xc_source_line(a65b1276a24c56,10).
xc_kb_names(a65b1276a24c56,[]).
xc_mapping_rows(a65b1276a24c56,[]).
x_comment(x_Hungry,"The collection of #$Animals that are hungry.  Cf. #$ExperiencingHunger.") :- x_cid(a65b1276a24c57).
xc_microtheory(a65b1276a24c57,x_PerceptionVocabularyMt).
xc_source_file(a65b1276a24c57,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/PerceptionVocabularyMt.krf').
xc_source_line(a65b1276a24c57,11).
xc_kb_names(a65b1276a24c57,[]).
xc_mapping_rows(a65b1276a24c57,[]).
x_comment(x_Stuffed,"The collection of #$Animals that are stuffed with food") :- x_cid(a65b1276a24c58).
xc_microtheory(a65b1276a24c58,x_PerceptionVocabularyMt).
xc_source_file(a65b1276a24c58,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/PerceptionVocabularyMt.krf').
xc_source_line(a65b1276a24c58,12).
xc_kb_names(a65b1276a24c58,[]).
xc_mapping_rows(a65b1276a24c58,[]).
x_comment(x_NoTaste,"The attribute of having no particular taste. This attribute different from #$BlandTaste since something may have a bland taste with actually being tasteless.") :- x_cid(a65b1276a24c59).
xc_microtheory(a65b1276a24c59,x_PerceptionVocabularyMt).
xc_source_file(a65b1276a24c59,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/PerceptionVocabularyMt.krf').
xc_source_line(a65b1276a24c59,13).
xc_kb_names(a65b1276a24c59,[]).
xc_mapping_rows(a65b1276a24c59,[]).
x_comment(x_straddlingType,"(#$straddlingType OBJECT COLLECTION) holds if COLLECTION is the collection of Animals straddling OBJECT.  See also the corresponding function, #$StraddlingFn.") :- x_cid(a65b1276a24c5a).
xc_microtheory(a65b1276a24c5a,x_PerceptionVocabularyMt).
xc_source_file(a65b1276a24c5a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/PerceptionVocabularyMt.krf').
xc_source_line(a65b1276a24c5a,14).
xc_kb_names(a65b1276a24c5a,[]).
xc_mapping_rows(a65b1276a24c5a,[]).
x_comment(x_StraddlingFn,"(#$StraddlingFn OBJECT) denotes the collection of animals straddling OBJECT.  See also the corresponding predicate, #$straddlingType.") :- x_cid(a65b1276a24c5b).
xc_microtheory(a65b1276a24c5b,x_PerceptionVocabularyMt).
xc_source_file(a65b1276a24c5b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/PerceptionVocabularyMt.krf').
xc_source_line(a65b1276a24c5b,15).
xc_kb_names(a65b1276a24c5b,[]).
xc_mapping_rows(a65b1276a24c5b,[]).
x_comment(x_hungerLevelOf,"The predicate #$hungerLevelOf is used to express how hungry an #$Animal is.  The first argument is an instance of AnimalTypeByHungerLevel (q.v.):  for instance, #$Hungry, #$Starving, #$Stuffed.  The second argument is the #$Animal who feels hunger at this level.") :- x_cid(a65b1276a24c5c).
xc_microtheory(a65b1276a24c5c,x_PerceptionVocabularyMt).
xc_source_file(a65b1276a24c5c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/PerceptionVocabularyMt.krf').
xc_source_line(a65b1276a24c5c,16).
xc_kb_names(a65b1276a24c5c,[]).
xc_mapping_rows(a65b1276a24c5c,[]).
x_genlPreds(x_likesBeingPassiveInSexualPracticeType,x_likesEventsOfType) :- x_cid(a65b1276a24c5d).
xc_microtheory(a65b1276a24c5d,x_PerceptionVocabularyMt).
xc_source_file(a65b1276a24c5d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/PerceptionVocabularyMt.krf').
xc_source_line(a65b1276a24c5d,17).
xc_kb_names(a65b1276a24c5d,[]).
xc_mapping_rows(a65b1276a24c5d,[]).
kb_cache_footer(footer{count:15,digest:'413417c00b62e06f266fcc4b37318f98ceacf006c6907373afdcb5aeae75d103',headerDigest:c38c68ad03b50ecedf6e473fde04d0baffd607e54644d978a4418aabc8a4de6a}).
