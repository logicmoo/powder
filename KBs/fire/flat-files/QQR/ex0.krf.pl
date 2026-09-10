:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:23,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:69,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'8e5eee331c3980002777931efe4bfe3361c99ce24bf78aa5b4f287b29a2e5ec2',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:2818,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf',sourceHash:'286fa436d188541f2b4677a74660b3ba87e84488c5bb93eb8d106a1201cb38de',warnings:[]}).
x_comment(x_QPExampleEx0Mt,"QPExampleEx0Mt is a microtheory describing the scenario for the classic two heat flows\nscenario used in testing QP theory implementations.") :- x_cid(a65b126b7d5acb).
xc_microtheory(a65b126b7d5acb,x_QPExampleEx0Mt).
xc_source_file(a65b126b7d5acb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5acb,15).
xc_kb_names(a65b126b7d5acb,[]).
xc_mapping_rows(a65b126b7d5acb,[]).
x_includeEntity(x_F) :- x_cid(a65b126b7d5acc).
xc_microtheory(a65b126b7d5acc,x_QPExampleEx0Mt).
xc_source_file(a65b126b7d5acc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5acc,19).
xc_kb_names(a65b126b7d5acc,[]).
xc_mapping_rows(a65b126b7d5acc,[]).
x_includeEntity(x_G) :- x_cid(a65b126b7d5acd).
xc_microtheory(a65b126b7d5acd,x_QPExampleEx0Mt).
xc_source_file(a65b126b7d5acd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5acd,20).
xc_kb_names(a65b126b7d5acd,[]).
xc_mapping_rows(a65b126b7d5acd,[]).
x_includeEntity(x_P1) :- x_cid(a65b126b7d5ace).
xc_microtheory(a65b126b7d5ace,x_QPExampleEx0Mt).
xc_source_file(a65b126b7d5ace,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5ace,21).
xc_kb_names(a65b126b7d5ace,[]).
xc_mapping_rows(a65b126b7d5ace,[]).
x_isa(x_F,x_FiniteThermalPhysob) :- x_cid(a65b126b7d5acf).
xc_microtheory(a65b126b7d5acf,x_QPExampleEx0Mt).
xc_source_file(a65b126b7d5acf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5acf,23).
xc_kb_names(a65b126b7d5acf,[]).
xc_mapping_rows(a65b126b7d5acf,[]).
x_isa(x_G,x_FiniteThermalPhysob) :- x_cid(a65b126b7d5ad0).
xc_microtheory(a65b126b7d5ad0,x_QPExampleEx0Mt).
xc_source_file(a65b126b7d5ad0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5ad0,24).
xc_kb_names(a65b126b7d5ad0,[]).
xc_mapping_rows(a65b126b7d5ad0,[]).
x_isa(x_P1,x_HeatPath) :- x_cid(a65b126b7d5ad1).
xc_microtheory(a65b126b7d5ad1,x_QPExampleEx0Mt).
xc_source_file(a65b126b7d5ad1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5ad1,25).
xc_kb_names(a65b126b7d5ad1,[]).
xc_mapping_rows(a65b126b7d5ad1,[]).
x_heatConnection(x_P1,x_F,x_G) :- x_cid(a65b126b7d5ad2).
xc_microtheory(a65b126b7d5ad2,x_QPExampleEx0Mt).
xc_source_file(a65b126b7d5ad2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5ad2,26).
xc_kb_names(a65b126b7d5ad2,[]).
xc_mapping_rows(a65b126b7d5ad2,[]).
x_heatConnection(x_P1,x_G,x_F) :- x_cid(a65b126b7d5ad3).
xc_microtheory(a65b126b7d5ad3,x_QPExampleEx0Mt).
xc_source_file(a65b126b7d5ad3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5ad3,27).
xc_kb_names(a65b126b7d5ad3,[]).
xc_mapping_rows(a65b126b7d5ad3,[]).
x_mfiName('x_F-H>G',x_ModelFragmentInstanceFn(x_HeatFlowProcess,x_TheSet(x_TheList(x_destinationOfHeat,x_G),x_TheList(x_pathOfHeat,x_P1),x_TheList(x_sourceOfHeat,x_F)))) :- x_cid(a65b126b7d5ad4).
xc_microtheory(a65b126b7d5ad4,x_QPExampleEx0Mt).
xc_source_file(a65b126b7d5ad4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5ad4,28).
xc_kb_names(a65b126b7d5ad4,[]).
xc_mapping_rows(a65b126b7d5ad4,[]).
x_mfiName('x_G-H>F',x_ModelFragmentInstanceFn(x_HeatFlowProcess,x_TheSet(x_TheList(x_destinationOfHeat,x_F),x_TheList(x_pathOfHeat,x_P1),x_TheList(x_sourceOfHeat,x_G)))) :- x_cid(a65b126b7d5ad5).
xc_microtheory(a65b126b7d5ad5,x_QPExampleEx0Mt).
xc_source_file(a65b126b7d5ad5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5ad5,34).
xc_kb_names(a65b126b7d5ad5,[]).
xc_mapping_rows(a65b126b7d5ad5,[]).
x_comment('x_QPExampleEx0-ic1Mt',"QPExampleEx0-ic1Mt is a microtheory describing the initial condition that F is\n   hotter than G and that P1 can conduct heat in Ex0.  For testing the QP theory implementation.") :- x_cid(a65b126b7d5ad6).
xc_microtheory(a65b126b7d5ad6,'x_QPExampleEx0-ic1Mt').
xc_source_file(a65b126b7d5ad6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5ad6,42).
xc_kb_names(a65b126b7d5ad6,[]).
xc_mapping_rows(a65b126b7d5ad6,[]).
x_genlMt('x_QPExampleEx0-ic1Mt',x_QPExampleEx0Mt) :- x_cid(a65b126b7d5ad7).
xc_microtheory(a65b126b7d5ad7,'x_QPExampleEx0-ic1Mt').
xc_source_file(a65b126b7d5ad7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5ad7,45).
xc_kb_names(a65b126b7d5ad7,[]).
xc_mapping_rows(a65b126b7d5ad7,[]).
x_qGreaterThan(x_TemperatureFn(x_F),x_TemperatureFn(x_G)) :- x_cid(a65b126b7d5ad8).
xc_microtheory(a65b126b7d5ad8,'x_QPExampleEx0-ic1Mt').
xc_source_file(a65b126b7d5ad8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5ad8,46).
xc_kb_names(a65b126b7d5ad8,[]).
xc_mapping_rows(a65b126b7d5ad8,[]).
x_heatAligned(x_P1) :- x_cid(a65b126b7d5ad9).
xc_microtheory(a65b126b7d5ad9,'x_QPExampleEx0-ic1Mt').
xc_source_file(a65b126b7d5ad9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5ad9,47).
xc_kb_names(a65b126b7d5ad9,[]).
xc_mapping_rows(a65b126b7d5ad9,[]).
x_comment('x_QPExampleEx0-ic2Mt',"QPExampleEx0-ic2Mt is a microtheory describing the initial condition that F is\n   hotter than G and that P1 cannot conduct heat in Ex0.  For testing the QP theory implementation.") :- x_cid(a65b126b7d5ada).
xc_microtheory(a65b126b7d5ada,'x_QPExampleEx0-ic2Mt').
xc_source_file(a65b126b7d5ada,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5ada,50).
xc_kb_names(a65b126b7d5ada,[]).
xc_mapping_rows(a65b126b7d5ada,[]).
x_genlMt('x_QPExampleEx0-ic2Mt',x_QPExampleEx0Mt) :- x_cid(a65b126b7d5adb).
xc_microtheory(a65b126b7d5adb,'x_QPExampleEx0-ic2Mt').
xc_source_file(a65b126b7d5adb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5adb,53).
xc_kb_names(a65b126b7d5adb,[]).
xc_mapping_rows(a65b126b7d5adb,[]).
x_qGreaterThan(x_TemperatureFn(x_F),x_TemperatureFn(x_G)) :- x_cid(a65b126b7d5adc).
xc_microtheory(a65b126b7d5adc,'x_QPExampleEx0-ic2Mt').
xc_source_file(a65b126b7d5adc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5adc,54).
xc_kb_names(a65b126b7d5adc,[]).
xc_mapping_rows(a65b126b7d5adc,[]).
x_not(x_heatAligned(x_P1)) :- x_cid(a65b126b7d5add).
xc_microtheory(a65b126b7d5add,'x_QPExampleEx0-ic2Mt').
xc_source_file(a65b126b7d5add,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5add,55).
xc_kb_names(a65b126b7d5add,[]).
xc_mapping_rows(a65b126b7d5add,[]).
x_comment('x_QPExampleEx0-ic3Mt',"QPExampleEx0-ic3Mt is a microtheory describing the initial condition that G is\n   hotter than F and that P1 can conduct heat in Ex0.  For testing the QP theory implementation.") :- x_cid(a65b126b7d5ade).
xc_microtheory(a65b126b7d5ade,'x_QPExampleEx0-ic3Mt').
xc_source_file(a65b126b7d5ade,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5ade,58).
xc_kb_names(a65b126b7d5ade,[]).
xc_mapping_rows(a65b126b7d5ade,[]).
x_genlMt('x_QPExampleEx0-ic3Mt',x_QPExampleEx0Mt) :- x_cid(a65b126b7d5adf).
xc_microtheory(a65b126b7d5adf,'x_QPExampleEx0-ic3Mt').
xc_source_file(a65b126b7d5adf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5adf,61).
xc_kb_names(a65b126b7d5adf,[]).
xc_mapping_rows(a65b126b7d5adf,[]).
x_qGreaterThan(x_TemperatureFn(x_G),x_TemperatureFn(x_F)) :- x_cid(a65b126b7d5ae0).
xc_microtheory(a65b126b7d5ae0,'x_QPExampleEx0-ic3Mt').
xc_source_file(a65b126b7d5ae0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5ae0,62).
xc_kb_names(a65b126b7d5ae0,[]).
xc_mapping_rows(a65b126b7d5ae0,[]).
x_heatAligned(x_P1) :- x_cid(a65b126b7d5ae1).
xc_microtheory(a65b126b7d5ae1,'x_QPExampleEx0-ic3Mt').
xc_source_file(a65b126b7d5ae1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ex0.krf').
xc_source_line(a65b126b7d5ae1,63).
xc_kb_names(a65b126b7d5ae1,[]).
xc_mapping_rows(a65b126b7d5ae1,[]).
kb_cache_footer(footer{count:23,digest:'8e5eee331c3980002777931efe4bfe3361c99ce24bf78aa5b4f287b29a2e5ec2',headerDigest:'65f698b010fe9103ed260fa4e8a7242abea74ed5939b8806376a67d043f2f7c1'}).
