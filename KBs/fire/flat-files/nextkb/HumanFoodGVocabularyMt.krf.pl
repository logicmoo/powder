:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:40,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:44,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:c2f7c174cfb8e6eea18e6987bbec5ee79a491122575ab8d14b72c032758966d1,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3733,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf',sourceHash:'4b9c5e09c22ef2218097803cda24040ce29d0f6101b343b699298893a6eae8d3',warnings:[]}).
x_isa(x_SubcollectionOfWithRelationToFn(x_Soup,x_keyIngredientTypes,x_Chicken),x_FirstOrderCollection) :- x_cid(a65b12742c899a).
xc_microtheory(a65b12742c899a,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c899a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c899a,3).
xc_kb_names(a65b12742c899a,[]).
xc_mapping_rows(a65b12742c899a,[]).
x_comment(x_PortWine,"The collection of all instances of Port wine. Port does not fit into the red/white/rose scheme.") :- x_cid(a65b12742c899b).
xc_microtheory(a65b12742c899b,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c899b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c899b,4).
xc_kb_names(a65b12742c899b,[]).
xc_mapping_rows(a65b12742c899b,[]).
x_comment(x_EdibleStuffTypeByPreparationStyle,"A collection of collections.  Each instance of #$EdibleStuffTypeByPreparationStyle is a subcollection of #$EdibleStuff whose instances all share a property relating to their preparation.  Specifically, each instance of #$EdibleStuffTypeByPreparationStyle relates to (1) a type of physical preparation which its instances have already undergone, and (2) something about its instances current, resulting condition.  Instances of #$EdibleStuffTypeByPreparationStyle which are applicable to food include #$Baked, #$Fried, #$Toasted, #$Fermented, #$Grilled, #$Frozen, #$Dried, and #$Raw.") :- x_cid(a65b12742c899c).
xc_microtheory(a65b12742c899c,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c899c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c899c,5).
xc_kb_names(a65b12742c899c,[]).
xc_mapping_rows(a65b12742c899c,[]).
x_comment(x_Baked,"A specialization of #$Cooked.  Food that is #$Baked has been prepared in an event of #$BakingFood, using a #$RegularOven.") :- x_cid(a65b12742c899d).
xc_microtheory(a65b12742c899d,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c899d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c899d,6).
xc_kb_names(a65b12742c899d,[]).
xc_mapping_rows(a65b12742c899d,[]).
x_comment(x_Grilled,"The subcollection of food whose instances have been grilled - a specialization of #$Cooked.  Food that is #$Grilled has been prepared in an event of #$GrillingFood, using a #$BBQGrill or an #$ElectricGrill.") :- x_cid(a65b12742c899e).
xc_microtheory(a65b12742c899e,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c899e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c899e,7).
xc_kb_names(a65b12742c899e,[]).
xc_mapping_rows(a65b12742c899e,[]).
x_comment(x_Boiled,"The subcollection of #$Food whose instances been boiled; a specialization of #$Cooked.") :- x_cid(a65b12742c899f).
xc_microtheory(a65b12742c899f,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c899f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c899f,8).
xc_kb_names(a65b12742c899f,[]).
xc_mapping_rows(a65b12742c899f,[]).
x_comment(x_Microwaved,"The collection of #$Food that has been microwaved; a specialization of #$Cooked.  Food that is #$Microwaved has been prepared in an event of #$Microwaving, using a #$MicrowaveOven.") :- x_cid(a65b12742c89a0).
xc_microtheory(a65b12742c89a0,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89a0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89a0,9).
xc_kb_names(a65b12742c89a0,[]).
xc_mapping_rows(a65b12742c89a0,[]).
x_comment(x_Toasted,"The collection of food that has been toasted.  A specialization of #$Cooked.") :- x_cid(a65b12742c89a1).
xc_microtheory(a65b12742c89a1,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89a1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89a1,10).
xc_kb_names(a65b12742c89a1,[]).
xc_mapping_rows(a65b12742c89a1,[]).
x_comment(x_Fried,"The collection of food that has been fried; a specialization of #$Cooked.  Food that is #$Fried has been prepared in an event of #$Frying.") :- x_cid(a65b12742c89a2).
xc_microtheory(a65b12742c89a2,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89a2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89a2,11).
xc_kb_names(a65b12742c89a2,[]).
xc_mapping_rows(a65b12742c89a2,[]).
x_comment(x_Smoked,"The collection of food items that have been smoked.") :- x_cid(a65b12742c89a3).
xc_microtheory(a65b12742c89a3,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89a3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89a3,12).
xc_kb_names(a65b12742c89a3,[]).
xc_mapping_rows(a65b12742c89a3,[]).
x_comment(x_Cooked,"The subcollection of #$EdibleStuff whose instances have been cooked.  Food becomes #$Cooked as the result of an event of #$CookingFood.  Specialized forms of #$Cooked include #$Steamed, #$Baked, #$Microwaved and #$Grilled.") :- x_cid(a65b12742c89a4).
xc_microtheory(a65b12742c89a4,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89a4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89a4,13).
xc_kb_names(a65b12742c89a4,[]).
xc_mapping_rows(a65b12742c89a4,[]).
x_disjointWith(x_Pork,x_HalalCuisine) :- x_cid(a65b12742c89a5).
xc_microtheory(a65b12742c89a5,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89a5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89a5,14).
xc_kb_names(a65b12742c89a5,[]).
xc_mapping_rows(a65b12742c89a5,[]).
x_comment(x_FreshFood,"The subcollection of #$EdibleStuff whose members are relatively fresh.  This collection applies particularly to food items, such as vegetables, but can also apply to some #$FoodComposites, such as uncooked\nnondried pasta. Being #$FreshFood means not having been cooked and \nhaving been harvested or made in the quite recent past.") :- x_cid(a65b12742c89a6).
xc_microtheory(a65b12742c89a6,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89a6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89a6,15).
xc_kb_names(a65b12742c89a6,[]).
xc_mapping_rows(a65b12742c89a6,[]).
x_comment(x_Marshmallow,"An instance of #$DefaultDisjointEdibleStuffType.  Each instance of #$Marshmallow is a light, #$Spongy, very sweet confection made of #$CornSyrup, #$Gelatin, #$Sugar, and #$Starch, and dusted with (#$PowderedFn #$Sugar).") :- x_cid(a65b12742c89a7).
xc_microtheory(a65b12742c89a7,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89a7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89a7,18).
xc_kb_names(a65b12742c89a7,[]).
xc_mapping_rows(a65b12742c89a7,[]).
x_comment(x_Raw,"An instance of #$EdibleStuffTypeByPreparationStyle. Instances of #$Raw are in or nearly in their natural state, and in particular have not been #$Cooked.") :- x_cid(a65b12742c89a8).
xc_microtheory(a65b12742c89a8,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89a8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89a8,19).
xc_kb_names(a65b12742c89a8,[]).
xc_mapping_rows(a65b12742c89a8,[]).
x_genls(x_MeatFn(x_EdibleFish),x_Seafood) :- x_cid(a65b12742c89a9).
xc_microtheory(a65b12742c89a9,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89a9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89a9,20).
xc_kb_names(a65b12742c89a9,[]).
xc_mapping_rows(a65b12742c89a9,[]).
x_genls(x_MeatFn(x_Shellfish),x_Seafood) :- x_cid(a65b12742c89aa).
xc_microtheory(a65b12742c89aa,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89aa,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89aa,21).
xc_kb_names(a65b12742c89aa,[]).
xc_mapping_rows(a65b12742c89aa,[]).
x_genls(x_StuffFn(x_Cupcake),x_SolidTangibleThing) :- x_cid(a65b12742c89ab).
xc_microtheory(a65b12742c89ab,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89ab,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89ab,22).
xc_kb_names(a65b12742c89ab,[]).
xc_mapping_rows(a65b12742c89ab,[]).
x_genls(x_StuffFn(x_Fruitcake),x_SolidTangibleThing) :- x_cid(a65b12742c89ac).
xc_microtheory(a65b12742c89ac,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89ac,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89ac,23).
xc_kb_names(a65b12742c89ac,[]).
xc_mapping_rows(a65b12742c89ac,[]).
x_genls(x_StuffFn(x_Pancake),x_CerealFood) :- x_cid(a65b12742c89ad).
xc_microtheory(a65b12742c89ad,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89ad,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89ad,24).
xc_kb_names(a65b12742c89ad,[]).
xc_mapping_rows(a65b12742c89ad,[]).
x_genls(x_StuffFn(x_Prune),x_FruitOrVegetableFood) :- x_cid(a65b12742c89ae).
xc_microtheory(a65b12742c89ae,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89ae,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89ae,25).
xc_kb_names(a65b12742c89ae,[]).
xc_mapping_rows(a65b12742c89ae,[]).
x_genls(x_StuffFn(x_Pickle),'x_Cucumber-Foodstuff') :- x_cid(a65b12742c89af).
xc_microtheory(a65b12742c89af,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89af,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89af,26).
xc_kb_names(a65b12742c89af,[]).
xc_mapping_rows(a65b12742c89af,[]).
x_genls(x_StuffFn(x_Pickle),x_Food) :- x_cid(a65b12742c89b0).
xc_microtheory(a65b12742c89b0,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89b0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89b0,27).
xc_kb_names(a65b12742c89b0,[]).
xc_mapping_rows(a65b12742c89b0,[]).
x_genls(x_Pickle,x_PickledFood) :- x_cid(a65b12742c89b1).
xc_microtheory(a65b12742c89b1,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89b1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89b1,28).
xc_kb_names(a65b12742c89b1,[]).
xc_mapping_rows(a65b12742c89b1,[]).
x_genls(x_FreshFood,x_Raw) :- x_cid(a65b12742c89b2).
xc_microtheory(a65b12742c89b2,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89b2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89b2,29).
xc_kb_names(a65b12742c89b2,[]).
xc_mapping_rows(a65b12742c89b2,[]).
x_genls(x_Boiled,x_Cooked) :- x_cid(a65b12742c89b3).
xc_microtheory(a65b12742c89b3,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89b3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89b3,30).
xc_kb_names(a65b12742c89b3,[]).
xc_mapping_rows(a65b12742c89b3,[]).
x_genls(x_Grilled,x_Cooked) :- x_cid(a65b12742c89b4).
xc_microtheory(a65b12742c89b4,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89b4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89b4,31).
xc_kb_names(a65b12742c89b4,[]).
xc_mapping_rows(a65b12742c89b4,[]).
x_genls(x_Microwaved,x_Cooked) :- x_cid(a65b12742c89b5).
xc_microtheory(a65b12742c89b5,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89b5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89b5,32).
xc_kb_names(a65b12742c89b5,[]).
xc_mapping_rows(a65b12742c89b5,[]).
x_genls(x_Fried,x_Cooked) :- x_cid(a65b12742c89b6).
xc_microtheory(a65b12742c89b6,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89b6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89b6,33).
xc_kb_names(a65b12742c89b6,[]).
xc_mapping_rows(a65b12742c89b6,[]).
x_genls(x_Roasted,x_Cooked) :- x_cid(a65b12742c89b7).
xc_microtheory(a65b12742c89b7,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89b7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89b7,34).
xc_kb_names(a65b12742c89b7,[]).
xc_mapping_rows(a65b12742c89b7,[]).
x_genls(x_Baked,x_Cooked) :- x_cid(a65b12742c89b8).
xc_microtheory(a65b12742c89b8,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89b8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89b8,35).
xc_kb_names(a65b12742c89b8,[]).
xc_mapping_rows(a65b12742c89b8,[]).
x_genls(x_Steamed,x_Cooked) :- x_cid(a65b12742c89b9).
xc_microtheory(a65b12742c89b9,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89b9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89b9,36).
xc_kb_names(a65b12742c89b9,[]).
xc_mapping_rows(a65b12742c89b9,[]).
x_genls(x_Toasted,x_Cooked) :- x_cid(a65b12742c89ba).
xc_microtheory(a65b12742c89ba,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89ba,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89ba,37).
xc_kb_names(a65b12742c89ba,[]).
xc_mapping_rows(a65b12742c89ba,[]).
x_genls(x_StuffFn(x_Cake),x_SolidFoodArtifact) :- x_cid(a65b12742c89bb).
xc_microtheory(a65b12742c89bb,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89bb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89bb,38).
xc_kb_names(a65b12742c89bb,[]).
xc_mapping_rows(a65b12742c89bb,[]).
x_genls(x_FoodIngredientOnly,x_EdibleByFn(x_HomoSapiens)) :- x_cid(a65b12742c89bc).
xc_microtheory(a65b12742c89bc,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89bc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89bc,39).
xc_kb_names(a65b12742c89bc,[]).
xc_mapping_rows(a65b12742c89bc,[]).
x_genls(x_Cookie,x_Baked) :- x_cid(a65b12742c89bd).
xc_microtheory(a65b12742c89bd,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89bd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89bd,40).
xc_kb_names(a65b12742c89bd,[]).
xc_mapping_rows(a65b12742c89bd,[]).
x_genls(x_Scone,x_Baked) :- x_cid(a65b12742c89be).
xc_microtheory(a65b12742c89be,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89be,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89be,41).
xc_kb_names(a65b12742c89be,[]).
xc_mapping_rows(a65b12742c89be,[]).
x_genls(x_Cake,x_Baked) :- x_cid(a65b12742c89bf).
xc_microtheory(a65b12742c89bf,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89bf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89bf,42).
xc_kb_names(a65b12742c89bf,[]).
xc_mapping_rows(a65b12742c89bf,[]).
x_genls(x_Pie,x_Baked) :- x_cid(a65b12742c89c0).
xc_microtheory(a65b12742c89c0,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89c0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89c0,43).
xc_kb_names(a65b12742c89c0,[]).
xc_mapping_rows(a65b12742c89c0,[]).
x_genls('x_Coffee-Ground',x_OdorFn('x_Coffee-Ground')) :- x_cid(a65b12742c89c1).
xc_microtheory(a65b12742c89c1,x_HumanFoodGVocabularyMt).
xc_source_file(a65b12742c89c1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/HumanFoodGVocabularyMt.krf').
xc_source_line(a65b12742c89c1,44).
xc_kb_names(a65b12742c89c1,[]).
xc_mapping_rows(a65b12742c89c1,[]).
kb_cache_footer(footer{count:40,digest:c2f7c174cfb8e6eea18e6987bbec5ee79a491122575ab8d14b72c032758966d1,headerDigest:'8c7e09f1af871742b7197cfcfbd3e8d6b0eb73363b919df76bf390630c834e78'}).
