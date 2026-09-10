:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:16,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:22,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:a9de751664340e22b35ca8957fd125b3f0f88d6b62d4de9876d1e7382ac060d9,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:2774,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf',sourceHash:dbfd285ed80e7d969b54183e8361132d559e77c72666e7ceb3b561c28a260d4a,warnings:[]}).
x_isa('x_2MTek-Company',x_Business) :- x_cid(a65b127091c1a4).
xc_microtheory(a65b127091c1a4,x_BusinessGMt).
xc_source_file(a65b127091c1a4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf').
xc_source_line(a65b127091c1a4,3).
xc_kb_names(a65b127091c1a4,[]).
xc_mapping_rows(a65b127091c1a4,[]).
x_isa(x_AmericaWestDrillingSupply,x_Business) :- x_cid(a65b127091c1a5).
xc_microtheory(a65b127091c1a5,x_BusinessGMt).
xc_source_file(a65b127091c1a5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf').
xc_source_line(a65b127091c1a5,4).
xc_kb_names(a65b127091c1a5,[]).
xc_mapping_rows(a65b127091c1a5,[]).
x_requiredArg1Pred(x_CappedRateMortgage,x_interestRateCeiling) :- x_cid(a65b127091c1a6).
xc_microtheory(a65b127091c1a6,x_BusinessGMt).
xc_source_file(a65b127091c1a6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf').
xc_source_line(a65b127091c1a6,5).
xc_kb_names(a65b127091c1a6,[]).
xc_mapping_rows(a65b127091c1a6,[]).
x_comment(x_Stock,"A specialization of #$AuthorizedAgreement and #$TradeableSecurity. Each instance of this collection is a share of ownership in some instance of #$LegalCorporation; its owner is an agent who is recorded as a shareholder in the official records of that corporation. A company may have several classes of #$Stock, such as Common, Preferred, Class A, Class B, etc.") :- x_cid(a65b127091c1a7).
xc_microtheory(a65b127091c1a7,x_BusinessGMt).
xc_source_file(a65b127091c1a7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf').
xc_source_line(a65b127091c1a7,6).
xc_kb_names(a65b127091c1a7,[]).
xc_mapping_rows(a65b127091c1a7,[]).
x_comment(x_AssetConversionLoan,"The collection of #$LoanAgreements that are short term loans whose primary repayment source is the anticipated conversion of an asset to cash.  Such loans are typically #$CommercialLoanAgreements, rather than #$ConsumerLoanAgreements.") :- x_cid(a65b127091c1a8).
xc_microtheory(a65b127091c1a8,x_BusinessGMt).
xc_source_file(a65b127091c1a8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf').
xc_source_line(a65b127091c1a8,7).
xc_kb_names(a65b127091c1a8,[]).
xc_mapping_rows(a65b127091c1a8,[]).
x_comment(x_agentTypeSellsProductType,"A #$BinaryPredicate that relates a specialization of #$LegalAgent to a specialization of #$TemporalThing.  <code>(#$agentTypeSellsProductType AGT-TYPE PROD-TYPE)</code> means that instances of <code>AGT-TYPE</code> typically sell instances of <code>PROD-TYPE</code>.  For instance, (#$agentTypeSellsProductType #$BicycleShop #$Bicycle); (#$agentTypeSellsProductType #$RealEstateAgent #$RealEstate). \n \n<code>(#$agentTypeSellsProductType AGT-TYPE PROD-TYPE)</code> does not hold when instances of <code>AGT-TYPE</code> merely sell products which have instances of <code>PROD-TYPE</code> as parts, components, or ingredients.  For example, it would be inappropriate to assert (#$agentTypeSellsProductType #$Pizzeria #$Pepperoni), for even though pizzerias typically sell lots of pepperoni pizza, they rarely if ever sell pepperoni by itself.\n\nSee also #$sells and #$sellsProductType.") :- x_cid(a65b127091c1a9).
xc_microtheory(a65b127091c1a9,x_BusinessGMt).
xc_source_file(a65b127091c1a9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf').
xc_source_line(a65b127091c1a9,8).
xc_kb_names(a65b127091c1a9,[]).
xc_mapping_rows(a65b127091c1a9,[]).
x_comment(x_PetStore,"An #$ExistingObjectType.  Each instance of #$PetStore is a #$RetailStore that sells #$DomesticPets and pet supplies (e.g. #$PetFood).") :- x_cid(a65b127091c1aa).
xc_microtheory(a65b127091c1aa,x_BusinessGMt).
xc_source_file(a65b127091c1aa,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf').
xc_source_line(a65b127091c1aa,13).
xc_kb_names(a65b127091c1aa,[]).
xc_mapping_rows(a65b127091c1aa,[]).
x_comment(x_BurgerOrientedFastFoodRestaurant,"A specialization of #$FastFoodRestaurant-Organization.  Each instance of #$BurgerOrientedFastFoodRestaurant is a fast food restaurant that specializes in selling #$HamburgerSandwiches.") :- x_cid(a65b127091c1ab).
xc_microtheory(a65b127091c1ab,x_BusinessGMt).
xc_source_file(a65b127091c1ab,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf').
xc_source_line(a65b127091c1ab,14).
xc_kb_names(a65b127091c1ab,[]).
xc_mapping_rows(a65b127091c1ab,[]).
x_comment(x_ChickenOrientedFastFoodRestaurant,"A specialization of #$FastFoodRestaurant-Organization.  Each instance of #$ChickenOrientedFastFoodRestaurant is a fast food restaurant that specializes in selling cooked chicken, usually fried.") :- x_cid(a65b127091c1ac).
xc_microtheory(a65b127091c1ac,x_BusinessGMt).
xc_source_file(a65b127091c1ac,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf').
xc_source_line(a65b127091c1ac,15).
xc_kb_names(a65b127091c1ac,[]).
xc_mapping_rows(a65b127091c1ac,[]).
x_genlPreds(x_nonpermanentResidentAlien,x_residentAlien) :- x_cid(a65b127091c1ad).
xc_microtheory(a65b127091c1ad,x_BusinessGMt).
xc_source_file(a65b127091c1ad,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf').
xc_source_line(a65b127091c1ad,16).
xc_kb_names(a65b127091c1ad,[]).
xc_mapping_rows(a65b127091c1ad,[]).
x_genls(x_BusinessTypeByActivityType,x_KEClarifyingCollectionType) :- x_cid(a65b127091c1ae).
xc_microtheory(a65b127091c1ae,x_BusinessGMt).
xc_source_file(a65b127091c1ae,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf').
xc_source_line(a65b127091c1ae,17).
xc_kb_names(a65b127091c1ae,[]).
xc_mapping_rows(a65b127091c1ae,[]).
x_genls(x_ManufacturerTypeByFocalProductType,x_KEClarifyingCollectionType) :- x_cid(a65b127091c1af).
xc_microtheory(a65b127091c1af,x_BusinessGMt).
xc_source_file(a65b127091c1af,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf').
xc_source_line(a65b127091c1af,18).
xc_kb_names(a65b127091c1af,[]).
xc_mapping_rows(a65b127091c1af,[]).
x_genls(x_OliveGardenRestaurant,x_RestaurantSpecializingInCuisineFn(x_ItalianCuisine)) :- x_cid(a65b127091c1b0).
xc_microtheory(a65b127091c1b0,x_BusinessGMt).
xc_source_file(a65b127091c1b0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf').
xc_source_line(a65b127091c1b0,19).
xc_kb_names(a65b127091c1b0,[]).
xc_mapping_rows(a65b127091c1b0,[]).
x_genls(x_RestaurantTypeByCuisine,x_KEClarifyingCollectionType) :- x_cid(a65b127091c1b1).
xc_microtheory(a65b127091c1b1,x_BusinessGMt).
xc_source_file(a65b127091c1b1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf').
xc_source_line(a65b127091c1b1,20).
xc_kb_names(a65b127091c1b1,[]).
xc_mapping_rows(a65b127091c1b1,[]).
x_genlPreds(x_insMarketedAs,x_conceptuallyRelated) :- x_cid(a65b127091c1b2).
xc_microtheory(a65b127091c1b2,x_BusinessGMt).
xc_source_file(a65b127091c1b2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf').
xc_source_line(a65b127091c1b2,21).
xc_kb_names(a65b127091c1b2,[]).
xc_mapping_rows(a65b127091c1b2,[]).
x_genls(x_SportsFranchise,x_Business) :- x_cid(a65b127091c1b3).
xc_microtheory(a65b127091c1b3,x_BusinessGMt).
xc_source_file(a65b127091c1b3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BusinessGMt.krf').
xc_source_line(a65b127091c1b3,22).
xc_kb_names(a65b127091c1b3,[]).
xc_mapping_rows(a65b127091c1b3,[]).
kb_cache_footer(footer{count:16,digest:a9de751664340e22b35ca8957fd125b3f0f88d6b62d4de9876d1e7382ac060d9,headerDigest:'2c6c43395f225c7653396c2790e4796ee231170bdee45d847778f647c5a68c9f'}).
