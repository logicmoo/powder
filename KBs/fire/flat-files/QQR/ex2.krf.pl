:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:40,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:131,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'85ccfbea953c361d12c8e59561f0e2c9e7315f46e83b41a3ba743cc91715f05c',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:6333,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf',sourceHash:'23facb094930f31b9e181e1cf8382d626413efc5d7aa890fa7f44d459cb2e275',warnings:[]}).
x_comment(x_QPExampleEx2Mt,"QPExampleEx2Mt is a microtheory describing the classic boiling water scenario, used in testing QP theory implementations.") :- x_cid(a65b126b80f644).
xc_microtheory(a65b126b80f644,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f644,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f644,17).
xc_kb_names(a65b126b80f644,[]).
xc_mapping_rows(a65b126b80f644,[]).
x_includeEntity(x_Can) :- x_cid(a65b126b80f645).
xc_microtheory(a65b126b80f645,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f645,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f645,21).
xc_kb_names(a65b126b80f645,[]).
xc_mapping_rows(a65b126b80f645,[]).
x_includeEntity(x_Stove) :- x_cid(a65b126b80f646).
xc_microtheory(a65b126b80f646,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f646,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f646,22).
xc_kb_names(a65b126b80f646,[]).
xc_mapping_rows(a65b126b80f646,[]).
x_includeEntity(x_Burner) :- x_cid(a65b126b80f647).
xc_microtheory(a65b126b80f647,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f647,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f647,23).
xc_kb_names(a65b126b80f647,[]).
xc_mapping_rows(a65b126b80f647,[]).
x_includeEntity('x_Liquid-StateOfMatter') :- x_cid(a65b126b80f648).
xc_microtheory(a65b126b80f648,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f648,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f648,25).
xc_kb_names(a65b126b80f648,[]).
xc_mapping_rows(a65b126b80f648,[]).
x_includeEntity('x_Gaseous-StateOfMatter') :- x_cid(a65b126b80f649).
xc_microtheory(a65b126b80f649,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f649,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f649,26).
xc_kb_names(a65b126b80f649,[]).
xc_mapping_rows(a65b126b80f649,[]).
x_includeEntity(x_Water) :- x_cid(a65b126b80f64a).
xc_microtheory(a65b126b80f64a,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f64a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f64a,27).
xc_kb_names(a65b126b80f64a,[]).
xc_mapping_rows(a65b126b80f64a,[]).
x_isa(x_Can,x_Container) :- x_cid(a65b126b80f64b).
xc_microtheory(a65b126b80f64b,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f64b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f64b,29).
xc_kb_names(a65b126b80f64b,[]).
xc_mapping_rows(a65b126b80f64b,[]).
x_canContainSubstance(x_Can,x_Water,'x_Liquid-StateOfMatter') :- x_cid(a65b126b80f64c).
xc_microtheory(a65b126b80f64c,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f64c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f64c,30).
xc_kb_names(a65b126b80f64c,[]).
xc_mapping_rows(a65b126b80f64c,[]).
x_canContainSubstance(x_Can,x_Water,'x_Gaseous-StateOfMatter') :- x_cid(a65b126b80f64d).
xc_microtheory(a65b126b80f64d,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f64d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f64d,31).
xc_kb_names(a65b126b80f64d,[]).
xc_mapping_rows(a65b126b80f64d,[]).
x_isa(x_Stove,x_TemperatureSource) :- x_cid(a65b126b80f64e).
xc_microtheory(a65b126b80f64e,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f64e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f64e,32).
xc_kb_names(a65b126b80f64e,[]).
xc_mapping_rows(a65b126b80f64e,[]).
x_isa(x_Burner,x_HeatPath) :- x_cid(a65b126b80f64f).
xc_microtheory(a65b126b80f64f,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f64f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f64f,33).
xc_kb_names(a65b126b80f64f,[]).
xc_mapping_rows(a65b126b80f64f,[]).
x_heatConnection(x_Burner,x_Stove,x_Can) :- x_cid(a65b126b80f650).
xc_microtheory(a65b126b80f650,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f650,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f650,34).
xc_kb_names(a65b126b80f650,[]).
xc_mapping_rows(a65b126b80f650,[]).
x_qGreaterThan(x_TemperatureFn(x_Stove),x_TboilFn(x_Water,x_Can)) :- x_cid(a65b126b80f651).
xc_microtheory(a65b126b80f651,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f651,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f651,35).
xc_kb_names(a65b126b80f651,[]).
xc_mapping_rows(a65b126b80f651,[]).
x_mfiName('x_Can-PossibleL',x_ModelFragmentInstanceFn(x_ContainedStuffPossibility,x_TheSet(x_TheList(x_containerOf,x_Can),x_TheList(x_phaseOf,'x_Liquid-StateOfMatter'),x_TheList(x_substanceOf,x_Water)))) :- x_cid(a65b126b80f652).
xc_microtheory(a65b126b80f652,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f652,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f652,37).
xc_kb_names(a65b126b80f652,[]).
xc_mapping_rows(a65b126b80f652,[]).
x_mfiName('x_Can-PossibleG',x_ModelFragmentInstanceFn(x_ContainedStuffPossibility,x_TheSet(x_TheList(x_containerOf,x_Can),x_TheList(x_phaseOf,'x_Gaseous-StateOfMatter'),x_TheList(x_substanceOf,x_Water)))) :- x_cid(a65b126b80f653).
xc_microtheory(a65b126b80f653,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f653,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f653,42).
xc_kb_names(a65b126b80f653,[]).
xc_mapping_rows(a65b126b80f653,[]).
x_mfiName(x_Gcan,x_ModelFragmentInstanceFn(x_ContainedStuff,x_TheSet(x_TheList(x_containerOf,x_Can),x_TheList(x_mfParticipant,'x_Can-PossibleG'),x_TheList(x_phaseOf,'x_Gaseous-StateOfMatter'),x_TheList(x_substanceOf,x_Water)))) :- x_cid(a65b126b80f654).
xc_microtheory(a65b126b80f654,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f654,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f654,47).
xc_kb_names(a65b126b80f654,[]).
xc_mapping_rows(a65b126b80f654,[]).
x_mfiName(x_Wcan,x_ModelFragmentInstanceFn(x_ContainedStuff,x_TheSet(x_TheList(x_containerOf,x_Can),x_TheList(x_mfParticipant,'x_Can-PossibleL'),x_TheList(x_phaseOf,'x_Liquid-StateOfMatter'),x_TheList(x_substanceOf,x_Water)))) :- x_cid(a65b126b80f655).
xc_microtheory(a65b126b80f655,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f655,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f655,53).
xc_kb_names(a65b126b80f655,[]).
xc_mapping_rows(a65b126b80f655,[]).
x_mfiName('x_Stove-H>Wcan',x_ModelFragmentInstanceFn(x_HeatFlowProcess,x_TheSet(x_TheList(x_destinationOfHeat,x_Wcan),x_TheList(x_pathOfHeat,x_Burner),x_TheList(x_sourceOfHeat,x_Stove)))) :- x_cid(a65b126b80f656).
xc_microtheory(a65b126b80f656,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f656,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f656,59).
xc_kb_names(a65b126b80f656,[]).
xc_mapping_rows(a65b126b80f656,[]).
x_mfiName('x_Stove-H>Gcan',x_ModelFragmentInstanceFn(x_HeatFlowProcess,x_TheSet(x_TheList(x_destinationOfHeat,x_Gcan),x_TheList(x_pathOfHeat,x_Burner),x_TheList(x_sourceOfHeat,x_Stove)))) :- x_cid(a65b126b80f657).
xc_microtheory(a65b126b80f657,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f657,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f657,64).
xc_kb_names(a65b126b80f657,[]).
xc_mapping_rows(a65b126b80f657,[]).
x_mfiName('x_Gcan-Props',x_ModelFragmentInstanceFn(x_ContainedGasProperties,x_TheSet(x_TheList(x_containerOf,x_Can),x_TheList(x_gasOf,x_Gcan),x_TheList(x_substanceOf,x_Water)))) :- x_cid(a65b126b80f658).
xc_microtheory(a65b126b80f658,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f658,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f658,69).
xc_kb_names(a65b126b80f658,[]).
xc_mapping_rows(a65b126b80f658,[]).
x_mfiName('x_Wcan-Props',x_ModelFragmentInstanceFn(x_ContainedLiquidProperties,x_TheSet(x_TheList(x_containerOf,x_Can),x_TheList(x_liquidOf,x_Wcan),x_TheList(x_substanceOf,x_Water)))) :- x_cid(a65b126b80f659).
xc_microtheory(a65b126b80f659,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f659,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f659,74).
xc_kb_names(a65b126b80f659,[]).
xc_mapping_rows(a65b126b80f659,[]).
x_mfiName('x_Can-W-G-Equil',x_ModelFragmentInstanceFn(x_RapidThermalEquilibriumWithinContainer,x_TheSet(x_TheList(x_containerOf,x_Can),x_TheList(x_gasOf,x_Gcan),x_TheList(x_liquidOf,x_Wcan),x_TheList(x_substanceOf,x_Water)))) :- x_cid(a65b126b80f65a).
xc_microtheory(a65b126b80f65a,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f65a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f65a,79).
xc_kb_names(a65b126b80f65a,[]).
xc_mapping_rows(a65b126b80f65a,[]).
x_mfiName('x_Boil-Can',x_ModelFragmentInstanceFn(x_BoilingProcess,x_TheSet(x_TheList(x_containerOf,x_Can),x_TheList(x_heatFlowOf,'x_Stove-H>Wcan'),x_TheList(x_liquidOf,x_Wcan),x_TheList(x_substanceOf,x_Water)))) :- x_cid(a65b126b80f65b).
xc_microtheory(a65b126b80f65b,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f65b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f65b,85).
xc_kb_names(a65b126b80f65b,[]).
xc_mapping_rows(a65b126b80f65b,[]).
x_mfiName('x_Gcan-LatentHeatAbsorb',x_ModelFragmentInstanceFn(x_LatentHeatAbsorptionBySteamProcess,x_TheSet(x_TheList(x_boilingOf,'x_Boil-Can'),x_TheList(x_containerOf,x_Can),x_TheList(x_gasOf,x_Gcan),x_TheList(x_heatFlowOf,'x_Stove-H>Gcan'),x_TheList(x_liquidOf,x_Wcan),x_TheList(x_substanceOf,x_Water)))) :- x_cid(a65b126b80f65c).
xc_microtheory(a65b126b80f65c,x_QPExampleEx2Mt).
xc_source_file(a65b126b80f65c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f65c,91).
xc_kb_names(a65b126b80f65c,[]).
xc_mapping_rows(a65b126b80f65c,[]).
x_genlMt('x_QPExampleEx2-ic1Mt',x_QPExampleEx2Mt) :- x_cid(a65b126b80f65d).
xc_microtheory(a65b126b80f65d,'x_QPExampleEx2-ic1Mt').
xc_source_file(a65b126b80f65d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f65d,105).
xc_kb_names(a65b126b80f65d,[]).
xc_mapping_rows(a65b126b80f65d,[]).
x_comment('x_QPExampleEx2-ic1Mt',"QPExampleEx2-ic1Mt is the microtheory describing the classic QP boiling water scenario, with\n just water on the stove.") :- x_cid(a65b126b80f65e).
xc_microtheory(a65b126b80f65e,'x_QPExampleEx2-ic1Mt').
xc_source_file(a65b126b80f65e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f65e,106).
xc_kb_names(a65b126b80f65e,[]).
xc_mapping_rows(a65b126b80f65e,[]).
x_qGreaterThan(x_AmountOfFn(x_Water,'x_Liquid-StateOfMatter',x_Can),x_Zero) :- x_cid(a65b126b80f65f).
xc_microtheory(a65b126b80f65f,'x_QPExampleEx2-ic1Mt').
xc_source_file(a65b126b80f65f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f65f,109).
xc_kb_names(a65b126b80f65f,[]).
xc_mapping_rows(a65b126b80f65f,[]).
x_qEqualTo(x_AmountOfFn(x_Water,'x_Gaseous-StateOfMatter',x_Can),x_Zero) :- x_cid(a65b126b80f660).
xc_microtheory(a65b126b80f660,'x_QPExampleEx2-ic1Mt').
xc_source_file(a65b126b80f660,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f660,110).
xc_kb_names(a65b126b80f660,[]).
xc_mapping_rows(a65b126b80f660,[]).
x_qGreaterThan(x_TemperatureFn(x_Stove),x_TemperatureFn(x_Wcan)) :- x_cid(a65b126b80f661).
xc_microtheory(a65b126b80f661,'x_QPExampleEx2-ic1Mt').
xc_source_file(a65b126b80f661,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f661,111).
xc_kb_names(a65b126b80f661,[]).
xc_mapping_rows(a65b126b80f661,[]).
x_qLessThan(x_TemperatureFn(x_Wcan),x_TBoilFn(x_Water,x_Can)) :- x_cid(a65b126b80f662).
xc_microtheory(a65b126b80f662,'x_QPExampleEx2-ic1Mt').
xc_source_file(a65b126b80f662,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f662,112).
xc_kb_names(a65b126b80f662,[]).
xc_mapping_rows(a65b126b80f662,[]).
x_heatAligned(x_Burner) :- x_cid(a65b126b80f663).
xc_microtheory(a65b126b80f663,'x_QPExampleEx2-ic1Mt').
xc_source_file(a65b126b80f663,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f663,113).
xc_kb_names(a65b126b80f663,[]).
xc_mapping_rows(a65b126b80f663,[]).
x_genlMt('x_QPExampleEx2-ic2Mt',x_QPExampleEx2Mt) :- x_cid(a65b126b80f664).
xc_microtheory(a65b126b80f664,'x_QPExampleEx2-ic2Mt').
xc_source_file(a65b126b80f664,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f664,116).
xc_kb_names(a65b126b80f664,[]).
xc_mapping_rows(a65b126b80f664,[]).
x_comment('x_QPExampleEx2-ic2Mt',"QPExampleEx2-ic2Mt is the microtheory describing the classic QP boiling water scenario, with\n both water and steam existing, and boiling occurring.") :- x_cid(a65b126b80f665).
xc_microtheory(a65b126b80f665,'x_QPExampleEx2-ic2Mt').
xc_source_file(a65b126b80f665,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f665,117).
xc_kb_names(a65b126b80f665,[]).
xc_mapping_rows(a65b126b80f665,[]).
x_qGreaterThan(x_AmountOfFn(x_Water,'x_Liquid-StateOfMatter',x_Can),x_Zero) :- x_cid(a65b126b80f666).
xc_microtheory(a65b126b80f666,'x_QPExampleEx2-ic2Mt').
xc_source_file(a65b126b80f666,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f666,120).
xc_kb_names(a65b126b80f666,[]).
xc_mapping_rows(a65b126b80f666,[]).
x_qGreaterThan(x_AmountOfFn(x_Water,'x_Gaseous-StateOfMatter',x_Can),x_Zero) :- x_cid(a65b126b80f667).
xc_microtheory(a65b126b80f667,'x_QPExampleEx2-ic2Mt').
xc_source_file(a65b126b80f667,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f667,121).
xc_kb_names(a65b126b80f667,[]).
xc_mapping_rows(a65b126b80f667,[]).
x_qEqualTo(x_TemperatureFn(x_Wcan),x_TBoilFn(x_Water,x_Can)) :- x_cid(a65b126b80f668).
xc_microtheory(a65b126b80f668,'x_QPExampleEx2-ic2Mt').
xc_source_file(a65b126b80f668,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f668,122).
xc_kb_names(a65b126b80f668,[]).
xc_mapping_rows(a65b126b80f668,[]).
x_qGreaterThan(x_TemperatureFn(x_Stove),x_TemperatureFn(x_Gcan)) :- x_cid(a65b126b80f669).
xc_microtheory(a65b126b80f669,'x_QPExampleEx2-ic2Mt').
xc_source_file(a65b126b80f669,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f669,123).
xc_kb_names(a65b126b80f669,[]).
xc_mapping_rows(a65b126b80f669,[]).
x_qGreaterThan(x_TemperatureFn(x_Stove),x_TemperatureFn(x_Wcan)) :- x_cid(a65b126b80f66a).
xc_microtheory(a65b126b80f66a,'x_QPExampleEx2-ic2Mt').
xc_source_file(a65b126b80f66a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f66a,124).
xc_kb_names(a65b126b80f66a,[]).
xc_mapping_rows(a65b126b80f66a,[]).
x_heatAligned(x_Burner) :- x_cid(a65b126b80f66b).
xc_microtheory(a65b126b80f66b,'x_QPExampleEx2-ic2Mt').
xc_source_file(a65b126b80f66b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex2.krf').
xc_source_line(a65b126b80f66b,125).
xc_kb_names(a65b126b80f66b,[]).
xc_mapping_rows(a65b126b80f66b,[]).
kb_cache_footer(footer{count:40,digest:'85ccfbea953c361d12c8e59561f0e2c9e7315f46e83b41a3ba743cc91715f05c',headerDigest:'1d5f381d1e170fb12ece7517587fae259180a5d3edfada5bdd6ac5ae16132a64'}).
