:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:17,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:25,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'9e74fbb240d07fd45904d76a5a4508e3d44108a1a0d672c8cc39db24d917e899',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3514,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf',sourceHash:'806944afa59576a5cc7bf626cc9416dd0f7387d964f739ea3b09be6108a7a5fa',warnings:[]}).
x_isa('x_Clothing-Top',x_KEClarifyingCollectionType) :- x_cid(a65b1270c75c96).
xc_microtheory(a65b1270c75c96,x_ClothingGMt).
xc_source_file(a65b1270c75c96,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf').
xc_source_line(a65b1270c75c96,3).
xc_kb_names(a65b1270c75c96,[]).
xc_mapping_rows(a65b1270c75c96,[]).
x_comment(x_SomethingToWearTypeByGenericCategory,"An instance of #$SecondOrderCollection. Each instance of #$SomethingToWearTypeByGenericCategory is a collection of instances of #$SomethingToWear, grouped together according to some feature(s) other than brand.") :- x_cid(a65b1270c75c97).
xc_microtheory(a65b1270c75c97,x_ClothingGMt).
xc_source_file(a65b1270c75c97,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf').
xc_source_line(a65b1270c75c97,4).
xc_kb_names(a65b1270c75c97,[]).
xc_mapping_rows(a65b1270c75c97,[]).
x_comment(x_frequentlyWearsType,"A #$BinaryPredicate that relates an instance of #$Animal to a specialization of #$SomethingToWear.  <code>(#$frequentlyWearsType ANIMAL STW-TYPE)</code> means that <code>ANIMAL</code> frequently wears instances of <code>STW-TYPE</code>.  For example, <code>(#$frequentlyWearsType Bob #$Suspenders)</code> means that Bob frequently wears suspenders.  That is:\n<pre>\n(#$playsRoleWithFrequency Bob (#$WearingFn #$Suspenders) #$wearer (#$HighAmountFn #$Frequency)).") :- x_cid(a65b1270c75c98).
xc_microtheory(a65b1270c75c98,x_ClothingGMt).
xc_source_file(a65b1270c75c98,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf').
xc_source_line(a65b1270c75c98,5).
xc_kb_names(a65b1270c75c98,[]).
xc_mapping_rows(a65b1270c75c98,[]).
x_comment(x_WearingFn,"A #$UnaryFunction that takes a specialization of #$SomethingToWear and returns the collection of all instances of #$WearingSomething in which the #$itemWorn is of that type.  For example, <code>(#$WearingFn #$Shirt)</code> is the collection of all shirt-wearings.") :- x_cid(a65b1270c75c99).
xc_microtheory(a65b1270c75c99,x_ClothingGMt).
xc_source_file(a65b1270c75c99,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf').
xc_source_line(a65b1270c75c99,8).
xc_kb_names(a65b1270c75c99,[]).
xc_mapping_rows(a65b1270c75c99,[]).
x_comment(x_wearingTypeForSomethingToWearType,"A #$BinaryPredicate that relates a specialization of #$SomethingToWear to a specialization of #$WearingSomething.  <code>(#$wearingTypeForSomethingToWearType STW-TYPE WS-TYPE)</code> means that <code>WS-TYPE</code> is the collection of all instances of #$WearingSomething in which an instance of <code>STW-TYPE</code> is the #$itemWorn.  This is the predicate corresponding to #$WearingFn (q.v.).") :- x_cid(a65b1270c75c9a).
xc_microtheory(a65b1270c75c9a,x_ClothingGMt).
xc_source_file(a65b1270c75c9a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf').
xc_source_line(a65b1270c75c9a,9).
xc_kb_names(a65b1270c75c9a,[]).
xc_mapping_rows(a65b1270c75c9a,[]).
x_comment('x_Visor-HeadgearPart',"An #$ArtifactTypeByGenericCategory and specialization of #$SomethingToWearPart.  Each instance of #$Visor-HeadgearPart is a visor (i.e. surface that protects the eyes) that is part of, or is designed to be part of, a piece of #$Headgear, e.g. a #$BaseballCap or #$Visor-Cap.") :- x_cid(a65b1270c75c9b).
xc_microtheory(a65b1270c75c9b,x_ClothingGMt).
xc_source_file(a65b1270c75c9b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf').
xc_source_line(a65b1270c75c9b,10).
xc_kb_names(a65b1270c75c9b,[]).
xc_mapping_rows(a65b1270c75c9b,[]).
x_comment(x_Hat,"An instance of #$SomethingToWearTypeByGenericCategory and specialization of #$Headgear.  Each instance of #$Hat is a #$ClothingAccessory that is designed to be worn on (and cover most of) the top part of the head (#$Head-AnimalBodyPart).  Specializations include #$CowboyHat, #$Fedora, and #$Sombrero.\n<p>\nNote that #$Hat is orthogonal with #$Cap: some #$Hats are also #$Caps (e.g. #$BaseballCaps); some #$Hats are not #$Caps (e.g. #$CowboyHats); and some #$Caps are not #$Hats (e.g. #$SwimmingCaps).") :- x_cid(a65b1270c75c9c).
xc_microtheory(a65b1270c75c9c,x_ClothingGMt).
xc_source_file(a65b1270c75c9c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf').
xc_source_line(a65b1270c75c9c,11).
xc_kb_names(a65b1270c75c9c,[]).
xc_mapping_rows(a65b1270c75c9c,[]).
x_comment(x_Cap,"An instance of #$SomethingToWearTypeByGenericCategory.  Each instance of #$Cap is piece of #$Headgear (not necessarily a #$ClothingAccessory) that is relatively casual, small, and flexible.  Specializations include #$BaseballCap, #$SwimmingCap, and #$StockingCap.\n<p>\nNote that #$Hat is orthogonal with #$Cap: some #$Hats are also #$Caps (e.g. #$BaseballCaps); some #$Hats are not #$Caps (e.g. #$CowboyHats); and some #$Caps are not #$Hats (e.g. #$SwimmingCaps).") :- x_cid(a65b1270c75c9d).
xc_microtheory(a65b1270c75c9d,x_ClothingGMt).
xc_source_file(a65b1270c75c9d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf').
xc_source_line(a65b1270c75c9d,14).
xc_kb_names(a65b1270c75c9d,[]).
xc_mapping_rows(a65b1270c75c9d,[]).
x_comment(x_Earmuffs,"An instance of #$SomethingToWearTypeByGenericCategory and a specialization of #$Headgear and #$ProtectiveAttire.  Each instance of #$Earmuffs is a device similar to #$Headphones that has cup- or disclike contraptions that cover the ears to protect them from cold or loud noise (such as gunshots).") :- x_cid(a65b1270c75c9e).
xc_microtheory(a65b1270c75c9e,x_ClothingGMt).
xc_source_file(a65b1270c75c9e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf').
xc_source_line(a65b1270c75c9e,17).
xc_kb_names(a65b1270c75c9e,[]).
xc_mapping_rows(a65b1270c75c9e,[]).
x_disjointWith(x_SpatiallyContinuousThing,x_CostumeFn(x_SantaClaus)) :- x_cid(a65b1270c75c9f).
xc_microtheory(a65b1270c75c9f,x_ClothingGMt).
xc_source_file(a65b1270c75c9f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf').
xc_source_line(a65b1270c75c9f,18).
xc_kb_names(a65b1270c75c9f,[]).
xc_mapping_rows(a65b1270c75c9f,[]).
x_genls(x_BlueJeans,x_BlueColor) :- x_cid(a65b1270c75ca0).
xc_microtheory(a65b1270c75ca0,x_ClothingGMt).
xc_source_file(a65b1270c75ca0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf').
xc_source_line(a65b1270c75ca0,19).
xc_kb_names(a65b1270c75ca0,[]).
xc_mapping_rows(a65b1270c75ca0,[]).
x_genls(x_SurgicalGlove,'x_Glove-ChemicalAndBiological') :- x_cid(a65b1270c75ca1).
xc_microtheory(a65b1270c75ca1,x_ClothingGMt).
xc_source_file(a65b1270c75ca1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf').
xc_source_line(a65b1270c75ca1,20).
xc_kb_names(a65b1270c75ca1,[]).
xc_mapping_rows(a65b1270c75ca1,[]).
x_genls(x_BallGown,x_VeryFormalClothing) :- x_cid(a65b1270c75ca2).
xc_microtheory(a65b1270c75ca2,x_ClothingGMt).
xc_source_file(a65b1270c75ca2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf').
xc_source_line(a65b1270c75ca2,21).
xc_kb_names(a65b1270c75ca2,[]).
xc_mapping_rows(a65b1270c75ca2,[]).
x_genls(x_WetSuit,x_Casual) :- x_cid(a65b1270c75ca3).
xc_microtheory(a65b1270c75ca3,x_ClothingGMt).
xc_source_file(a65b1270c75ca3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf').
xc_source_line(a65b1270c75ca3,22).
xc_kb_names(a65b1270c75ca3,[]).
xc_mapping_rows(a65b1270c75ca3,[]).
x_genls(x_SomethingToWear,x_Opaque) :- x_cid(a65b1270c75ca4).
xc_microtheory(a65b1270c75ca4,x_ClothingGMt).
xc_source_file(a65b1270c75ca4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf').
xc_source_line(a65b1270c75ca4,23).
xc_kb_names(a65b1270c75ca4,[]).
xc_mapping_rows(a65b1270c75ca4,[]).
x_genls(x_ClothingItem,x_Opaque) :- x_cid(a65b1270c75ca5).
xc_microtheory(a65b1270c75ca5,x_ClothingGMt).
xc_source_file(a65b1270c75ca5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf').
xc_source_line(a65b1270c75ca5,24).
xc_kb_names(a65b1270c75ca5,[]).
xc_mapping_rows(a65b1270c75ca5,[]).
x_genls(x_TraditionalClothing,x_NonModernClothingStyle) :- x_cid(a65b1270c75ca6).
xc_microtheory(a65b1270c75ca6,x_ClothingGMt).
xc_source_file(a65b1270c75ca6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ClothingGMt.krf').
xc_source_line(a65b1270c75ca6,25).
xc_kb_names(a65b1270c75ca6,[]).
xc_mapping_rows(a65b1270c75ca6,[]).
kb_cache_footer(footer{count:17,digest:'9e74fbb240d07fd45904d76a5a4508e3d44108a1a0d672c8cc39db24d917e899',headerDigest:'2fc50194f1ddbb998ee45b5e94b0ffa684e32c3e79e88fde388045dce60f8f7d'}).
