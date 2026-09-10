:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:11,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:13,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'9495ab5d136318a8cf2254f6d8612a669ea2ec8ae880408ee260bdbb018b4692',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BuildingMt.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:2748,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BuildingMt.krf',sourceHash:da5eab04dfe4fefd62ff8a4b4e9b1d273e60d0d50ebb9dd2d045fb0880458fb4,warnings:[]}).
x_comment(x_Condominium,"An instance of #$ArtifactTypeByGenericCategory.  Each instance of #$Condominium is a #$ResidentialBuilding whose #$SingleResidenceUnits are individually owned and whose common areas are jointly owned by the residents of the building.") :- x_cid(a65b12708fecf2).
xc_microtheory(a65b12708fecf2,x_BuildingMt).
xc_source_file(a65b12708fecf2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BuildingMt.krf').
xc_source_line(a65b12708fecf2,3).
xc_kb_names(a65b12708fecf2,[]).
xc_mapping_rows(a65b12708fecf2,[]).
x_comment(x_ConstructionSitePropertyFn,"(#$ConstructionSitePropertyFn CONSTRUCTTYPE) returns the collection of instances of #$ConstructionSite that are site for a construct of the type CONSTRUCTTYPE.  This collection represents the property a construction site has if it is a site for type CONSTRUCTTYPE.  This is a 'baptismal' property in the sense that a particular region has the property (#$ConstructionSitePropertyFn CONSTRUCTTYPE) from the moment it is designated a construction site for a construct of type CONSTRUCTTYPE, regardless of whether or not overt construction has started at the site.  It is conceivable that for some designated construction sites, construction never in fact takes place: having the property (being a member of the collection returned by this function) implies, at best, that there exists an agent who intends that construction on a construct of the kind cited will take place.") :- x_cid(a65b12708fecf3).
xc_microtheory(a65b12708fecf3,x_BuildingMt).
xc_source_file(a65b12708fecf3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BuildingMt.krf').
xc_source_line(a65b12708fecf3,4).
xc_kb_names(a65b12708fecf3,[]).
xc_mapping_rows(a65b12708fecf3,[]).
x_comment(x_HospitalCareEvent,"An #$ExistingObjectType and specialization of #$MedicalFacility.  Each instance of #$HospitalBuilding is a #$Building that is used by a #$Hospital to perform #$HospitalCareEvents.") :- x_cid(a65b12708fecf4).
xc_microtheory(a65b12708fecf4,x_BuildingMt).
xc_source_file(a65b12708fecf4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BuildingMt.krf').
xc_source_line(a65b12708fecf4,5).
xc_kb_names(a65b12708fecf4,[]).
xc_mapping_rows(a65b12708fecf4,[]).
x_comment(x_BarRoomSpace,"The lounge or bar space which is run by the #$Bar-DrinkingEstablishment. May or may not be its own building. Cheers would be an instance of #$BarRoomSpace.") :- x_cid(a65b12708fecf5).
xc_microtheory(a65b12708fecf5,x_BuildingMt).
xc_source_file(a65b12708fecf5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BuildingMt.krf').
xc_source_line(a65b12708fecf5,6).
xc_kb_names(a65b12708fecf5,[]).
xc_mapping_rows(a65b12708fecf5,[]).
x_comment(x_FireStation,"A specialization of #$Building and #$FirefightingEquipment.  Each instance of #$FireStation is a building where #$Firefighters work and #$FirefightingEquipment is kept.") :- x_cid(a65b12708fecf6).
xc_microtheory(a65b12708fecf6,x_BuildingMt).
xc_source_file(a65b12708fecf6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BuildingMt.krf').
xc_source_line(a65b12708fecf6,7).
xc_kb_names(a65b12708fecf6,[]).
xc_mapping_rows(a65b12708fecf6,[]).
x_comment(x_AirportTerminalBuilding,"A specialization of #$Terminal-TransferPoint and #$Building.  Each instance of #$AirportTerminalBuilding is a building from and to which passengers board and exit #$Airplanes.") :- x_cid(a65b12708fecf7).
xc_microtheory(a65b12708fecf7,x_BuildingMt).
xc_source_file(a65b12708fecf7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BuildingMt.krf').
xc_source_line(a65b12708fecf7,8).
xc_kb_names(a65b12708fecf7,[]).
xc_mapping_rows(a65b12708fecf7,[]).
x_disjointWith(x_MovieTheaterSpace,'x_TransportationDevice-Vehicle') :- x_cid(a65b12708fecf8).
xc_microtheory(a65b12708fecf8,x_BuildingMt).
xc_source_file(a65b12708fecf8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BuildingMt.krf').
xc_source_line(a65b12708fecf8,9).
xc_kb_names(a65b12708fecf8,[]).
xc_mapping_rows(a65b12708fecf8,[]).
x_disjointWith(x_Elevator,'x_TransportationDevice-Vehicle') :- x_cid(a65b12708fecf9).
xc_microtheory(a65b12708fecf9,x_BuildingMt).
xc_source_file(a65b12708fecf9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BuildingMt.krf').
xc_source_line(a65b12708fecf9,10).
xc_kb_names(a65b12708fecf9,[]).
xc_mapping_rows(a65b12708fecf9,[]).
x_comment('x_PartOfBuilding-AboveGroundFloor',"A specialization of #$PartOfBuilding.  Each instance of #$PartOfBuilding-AboveGroundFloor is part of a building that is located entirely (or at least mostly) above the ground floor of that building.  Specializations include #$RoofOfAConstruction and #$Balcony-BuildingPart.") :- x_cid(a65b12708fecfa).
xc_microtheory(a65b12708fecfa,x_BuildingMt).
xc_source_file(a65b12708fecfa,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BuildingMt.krf').
xc_source_line(a65b12708fecfa,11).
xc_kb_names(a65b12708fecfa,[]).
xc_mapping_rows(a65b12708fecfa,[]).
x_comment(x_ExternalPartOfBuilding,"A specialization of #$PartOfBuilding.  Each instance of #$ExternalPartOfBuilding is a part of a building that is at least partially located on the outside of that building.  Specializations include #$RoofOfAConstruction and #$Porch.") :- x_cid(a65b12708fecfb).
xc_microtheory(a65b12708fecfb,x_BuildingMt).
xc_source_file(a65b12708fecfb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BuildingMt.krf').
xc_source_line(a65b12708fecfb,12).
xc_kb_names(a65b12708fecfb,[]).
xc_mapping_rows(a65b12708fecfb,[]).
x_genls(x_Condominium,x_ResidentialBuilding) :- x_cid(a65b12708fecfc).
xc_microtheory(a65b12708fecfc,x_BuildingMt).
xc_source_file(a65b12708fecfc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BuildingMt.krf').
xc_source_line(a65b12708fecfc,13).
xc_kb_names(a65b12708fecfc,[]).
xc_mapping_rows(a65b12708fecfc,[]).
kb_cache_footer(footer{count:11,digest:'9495ab5d136318a8cf2254f6d8612a669ea2ec8ae880408ee260bdbb018b4692',headerDigest:'43b73e9a12cce2931208842ba42e945f0fa8164d697e3abd78c527aa04c78de2'}).
