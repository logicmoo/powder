:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:858,dialect:kif,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:2299,mappingHash:'5f1e628c0662dd5129c5deca3c808fbe74ebeea2c17071cda1656d04c12d674d',mtPolicy:filename_v1,normalizedDigest:'818a097d48448213215b594bf4e70cf68632ebae71917350e765dca890df13d5',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:76864,source:'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif',sourceHash:'2ca22179ed6ca5483c13ae3031b6f5e7aec1de3f644376c00b7267cb25457a2a',warnings:[]}).
x_exceptWhen('x_='('x_BiologicalWeapon-GeneticallyEngineeredOrganismBased',V1),x_implies(x_and(x_isa(V1,x_BiologicalWeaponTypeByAgent),x_isa(V2,x_BiologicalWeaponTypeByAgent),x_different(V1,V2),x_relationAllInstance(x_weaponBasisObjectType,V1,V3),x_relationAllInstance(x_weaponBasisObjectType,V2,V4)),x_different(V3,V4))) :- x_cid(a65b1250a2c232,V1,V2,V3,V4).
xc_microtheory(a65b1250a2c232,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c232,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c232,3).
xc_kb_names(a65b1250a2c232,["?WEAPONTYPE1","?WEAPONTYPE2","?TYPE1","?TYPE2"]).
xc_mapping_rows(a65b1250a2c232,[]).
x_salientAssertions('x_BiologicalWeapon-Rickettsial',x_implies(x_and(x_isa(V1,x_BiologicalAttack),x_isa(V2,x_Person),x_isa(V3,'x_BiologicalWeapon-Rickettsial'),x_deviceUsed(V1,V3),x_maleficiary(V1,V2)),x_relationExistsInstance(x_maleficiary,x_Rickettsiosis,V2))) :- x_cid(a65b1250a2c233,V1,V2,V3).
xc_microtheory(a65b1250a2c233,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c233,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c233,14).
xc_kb_names(a65b1250a2c233,["?ATTACK","?VICTIM","?WEAPON"]).
xc_mapping_rows(a65b1250a2c233,[]).
x_salientAssertions('x_weaponEffectiveRange-Max',x_implies(x_and(x_maxQuantValue(V1,V2),x_weaponEffectiveRange(V3,V1)),'x_weaponEffectiveRange-Max'(V3,V2))) :- x_cid(a65b1250a2c234,V1,V2,V3).
xc_microtheory(a65b1250a2c234,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c234,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c234,24).
xc_kb_names(a65b1250a2c234,["?RANGE","?MAXRANGE","?WEAPON"]).
xc_mapping_rows(a65b1250a2c234,[]).
x_salientAssertions('x_weaponEffectiveRange-Min',x_implies(x_and(x_isa(V1,x_ShootingAProjectileWeapon),x_damages(V1,V2),x_fromLocation(V1,V3),x_deviceUsed(V1,V4),'x_instrument-Generic'(V1,V3),'x_weaponEffectiveRange-Min'(V4,V5),x_distanceBetween(V3,V2,V6)),x_greaterThan(V6,V5))) :- x_cid(a65b1250a2c235,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1250a2c235,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c235,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c235,31).
xc_kb_names(a65b1250a2c235,["?SHOOTING","?TARGET","?LAUNCHER","?WEAPON","?MINRANGE","?DIST"]).
xc_mapping_rows(a65b1250a2c235,[]).
x_salientAssertions(x_intendedTargetTypeOfWeaponType,x_implies(x_and(x_completeCollectionExtent(V1),x_genls(V2,x_Weapon),x_partitionedInto(V2,V1)),x_intendedTargetTypeOfWeaponType(V2,x_CollectionUnionFn(x_TheSetOf(V3,x_thereExists(V4,x_and(x_isa(V4,V1),x_intendedTargetTypeOfWeaponType(V4,V3)))))))) :- x_cid(a65b1250a2c236,V1,V2,V3,V4).
xc_microtheory(a65b1250a2c236,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c236,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c236,43).
xc_kb_names(a65b1250a2c236,["?DISJOINT-COLTYPE","?WEAPONCOL","?TARGET-TYPE","?CELL-COL"]).
xc_mapping_rows(a65b1250a2c236,['exists-thereexists']).
x_salientAssertions(x_weaponEffectiveRange,x_implies(x_and(x_isa(V1,x_ShootingAProjectileWeapon),x_damages(V1,V2),x_fromLocation(V1,V3),x_deviceUsed(V1,V4),'x_instrument-Generic'(V1,V3),x_weaponEffectiveRange(V4,V5),x_distanceBetween(V3,V2,V6)),x_quantitySubsumes(V5,V6))) :- x_cid(a65b1250a2c237,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1250a2c237,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c237,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c237,58).
xc_kb_names(a65b1250a2c237,["?SHOOTING","?TARGET","?LAUNCHER","?WEAPON","?RANGE","?DIST"]).
xc_mapping_rows(a65b1250a2c237,[]).
x_salientAssertions(x_BiologicalWeaponTypeByAgent,x_implies(x_and(x_isa(V1,x_BiologicalWeaponTypeByAgent),x_isa(V2,x_BiologicalWeaponTypeByAgent),x_different(V1,V2),x_relationAllInstance(x_weaponBasisObjectType,V1,V3),x_relationAllInstance(x_weaponBasisObjectType,V2,V4)),x_different(V3,V4))) :- x_cid(a65b1250a2c238,V1,V2,V3,V4).
xc_microtheory(a65b1250a2c238,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c238,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c238,70).
xc_kb_names(a65b1250a2c238,["?WEAPONTYPE1","?WEAPONTYPE2","?TYPE1","?TYPE2"]).
xc_mapping_rows(a65b1250a2c238,[]).
x_salientAssertions('x_weaponEffectiveRange-Max',x_implies(x_and(x_isa(V1,x_ShootingAProjectileWeapon),x_damages(V1,V2),x_fromLocation(V1,V3),x_deviceUsed(V1,V4),'x_instrument-Generic'(V1,V3),'x_weaponEffectiveRange-Max'(V4,V5),x_distanceBetween(V3,V2,V6)),x_greaterThan(V5,V6))) :- x_cid(a65b1250a2c239,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1250a2c239,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c239,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c239,80).
xc_kb_names(a65b1250a2c239,["?SHOOTING","?TARGET","?LAUNCHER","?WEAPON","?MAXRANGE","?DIST"]).
xc_mapping_rows(a65b1250a2c239,[]).
x_comment(x_implies(x_and(x_genls(V1,x_MilitaryWeapon),x_isa(V2,V1),x_capableOf(V3,x_CollectionSubsetFn(x_AttackOnTangible,x_TheSetOf(V4,'x_instrument-Generic'(V4,V2))),x_performedBy)),x_relationInstanceExistsMany(x_possesses,V3,V1)),"If some agent is capable of making an attack using a particular kind of military weapon, then that agent possesses many weapons of that type.") :- x_cid(a65b1250a2c23a,V1,V2,V3,V4).
xc_microtheory(a65b1250a2c23a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c23a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c23a,92).
xc_kb_names(a65b1250a2c23a,["?WEAPONTYPE","?WEAPON","?AGENT","?OBJ"]).
xc_mapping_rows(a65b1250a2c23a,[]).
x_salientAssertions(x_intendedTargetTypeOfWeapon,x_implies(x_intendedTargetTypeOfWeapon(V1,V2,V3),x_deviceUsed(V2,V1))) :- x_cid(a65b1250a2c23b,V1,V2,V3).
xc_microtheory(a65b1250a2c23b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c23b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c23b,103).
xc_kb_names(a65b1250a2c23b,["?WEAP","?ATTK","?TYPE"]).
xc_mapping_rows(a65b1250a2c23b,[]).
x_cyclistNotes(x_implies(x_and(x_completeCollectionExtent(V1),x_genls(V2,x_Weapon),x_partitionedInto(V2,V1)),x_intendedTargetTypeOfWeaponType(V2,x_CollectionUnionFn(x_TheSetOf(V3,x_thereExists(V4,x_and(x_isa(V4,V1),x_intendedTargetTypeOfWeaponType(V4,V3))))))),"The working assumption is that the conditions for discharging this rule--a weapons-collection partitioned, and intendedTargetTypeOWeaponTypes specified for all of the partition cells--will be met comparatively rarely, and that when they are, the collection-union will probably be worth reifying locally. Since the rule is backward, such reifications will only happen in a local image.") :- x_cid(a65b1250a2c23c,V1,V2,V3,V4).
xc_microtheory(a65b1250a2c23c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c23c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c23c,108).
xc_kb_names(a65b1250a2c23c,["?DISJOINT-COLTYPE","?WEAPONCOL","?TARGET-TYPE","?CELL-COL"]).
xc_mapping_rows(a65b1250a2c23c,['exists-thereexists']).
x_salientAssertions('x_weaponEffectiveRange-Min',x_implies(x_and(x_minQuantValue(V1,V2),x_weaponEffectiveRange(V3,V1)),'x_weaponEffectiveRange-Min'(V3,V2))) :- x_cid(a65b1250a2c23d,V1,V2,V3).
xc_microtheory(a65b1250a2c23d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c23d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c23d,123).
xc_kb_names(a65b1250a2c23d,["?RANGE","?MINRANGE","?WEAPON"]).
xc_mapping_rows(a65b1250a2c23d,[]).
x_arg1Isa(x_angleOfLauncher,x_ProjectileLauncher) :- x_cid(a65b1250a2c23e).
xc_microtheory(a65b1250a2c23e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c23e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c23e,130).
xc_kb_names(a65b1250a2c23e,[]).
xc_mapping_rows(a65b1250a2c23e,[]).
x_genls(x_BiologicalWeaponFn(x_Staphylococcus),'x_BiologicalWeapon-Bacterial') :- x_cid(a65b1250a2c23f).
xc_microtheory(a65b1250a2c23f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c23f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c23f,132).
xc_kb_names(a65b1250a2c23f,[]).
xc_mapping_rows(a65b1250a2c23f,[]).
x_isa('x_CruiseMissile-GroundLaunched',x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c240).
xc_microtheory(a65b1250a2c240,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c240,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c240,135).
xc_kb_names(a65b1250a2c240,[]).
xc_mapping_rows(a65b1250a2c240,[]).
x_comment(x_GeneticallyEngineeredBacterialPathogen,"The collection of all instances of Bacterium that have been genetically engineered for use in BiologicalAttacks.") :- x_cid(a65b1250a2c241).
xc_microtheory(a65b1250a2c241,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c241,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c241,137).
xc_kb_names(a65b1250a2c241,[]).
xc_mapping_rows(a65b1250a2c241,[]).
x_isa(x_MakingFn(x_NerveAgent),x_TemporalObjectType) :- x_cid(a65b1250a2c242).
xc_microtheory(a65b1250a2c242,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c242,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c242,139).
xc_kb_names(a65b1250a2c242,[]).
xc_mapping_rows(a65b1250a2c242,[]).
x_genls(x_Warplane,x_ConventionalWeapon) :- x_cid(a65b1250a2c243).
xc_microtheory(a65b1250a2c243,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c243,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c243,142).
xc_kb_names(a65b1250a2c243,[]).
xc_mapping_rows(a65b1250a2c243,[]).
x_genls(x_BombSubmunition,x_ExplosiveDevice) :- x_cid(a65b1250a2c244).
xc_microtheory(a65b1250a2c244,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c244,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c244,144).
xc_kb_names(a65b1250a2c244,[]).
xc_mapping_rows(a65b1250a2c244,[]).
x_comment('x_BallisticMissile-Guided',"The collection of BallisticMissiles which can change course in flight using either remote guidance, such as radio control, or internal guidance, such as on-board heat-seeking sensors.") :- x_cid(a65b1250a2c245).
xc_microtheory(a65b1250a2c245,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c245,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c245,146).
xc_kb_names(a65b1250a2c245,[]).
xc_mapping_rows(a65b1250a2c245,[]).
x_isa(x_BallisticMissileLauncher,x_ExistingObjectType) :- x_cid(a65b1250a2c246).
xc_microtheory(a65b1250a2c246,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c246,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c246,148).
xc_kb_names(a65b1250a2c246,[]).
xc_mapping_rows(a65b1250a2c246,[]).
x_isa('x_weaponEffectiveRange-Max',x_BinaryPredicate) :- x_cid(a65b1250a2c247).
xc_microtheory(a65b1250a2c247,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c247,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c247,150).
xc_kb_names(a65b1250a2c247,[]).
xc_mapping_rows(a65b1250a2c247,[]).
x_isa(x_intendedTargetTypeOfWeapon,x_TernaryPredicate) :- x_cid(a65b1250a2c248).
xc_microtheory(a65b1250a2c248,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c248,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c248,152).
xc_kb_names(a65b1250a2c248,[]).
xc_mapping_rows(a65b1250a2c248,[]).
x_argIsa(x_IntendedTargetTypeFn,1,x_Collection) :- x_cid(a65b1250a2c249).
xc_microtheory(a65b1250a2c249,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c249,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c249,154).
xc_kb_names(a65b1250a2c249,[]).
xc_mapping_rows(a65b1250a2c249,[]).
x_genls('x_Tondar-68-Missile','x_SurfaceToSurfaceMissile-Ballistic') :- x_cid(a65b1250a2c24a).
xc_microtheory(a65b1250a2c24a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c24a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c24a,156).
xc_kb_names(a65b1250a2c24a,[]).
xc_mapping_rows(a65b1250a2c24a,[]).
x_genls(x_ChemicalWeaponFn('x_VX-NerveGas'),x_ChemicalWeapon) :- x_cid(a65b1250a2c24b).
xc_microtheory(a65b1250a2c24b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c24b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c24b,158).
xc_kb_names(a65b1250a2c24b,[]).
xc_mapping_rows(a65b1250a2c24b,[]).
x_genls(x_ArtilleryShell,x_ProjectileWeapon) :- x_cid(a65b1250a2c24c).
xc_microtheory(a65b1250a2c24c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c24c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c24c,161).
xc_kb_names(a65b1250a2c24c,[]).
xc_mapping_rows(a65b1250a2c24c,[]).
x_implies(x_and(x_isa(V1,x_MilitaryWMDProgram),x_directingAgent(V1,V2)),x_purposeInEvent(V2,V1,x_thereExists(V3,x_and(x_isa(V3,x_MakingFn(x_WeaponOfMassDestruction)),x_directingAgent(V3,V2))))) :- x_cid(a65b1250a2c24d,V1,V2,V3).
xc_microtheory(a65b1250a2c24d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c24d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c24d,163).
xc_kb_names(a65b1250a2c24d,["?PROGRAM","?AGENT","?MAKING"]).
xc_mapping_rows(a65b1250a2c24d,['exists-thereexists']).
x_relationAllInstance(x_groupMemberType,x_GroupFn('x_BallisticMissile-SCUDB'),'x_BallisticMissile-SCUDB') :- x_cid(a65b1250a2c24e).
xc_microtheory(a65b1250a2c24e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c24e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c24e,175).
xc_kb_names(a65b1250a2c24e,[]).
xc_mapping_rows(a65b1250a2c24e,[]).
x_comment('x_weaponEffectiveRange-Min',"(weaponEffectiveRange-Min WEAPON RANGE) means that RANGE is the minimum range at which the projectile weapon WEAPON is considered to be 'effective', ie, capable of doing significant damage to a target. Some projectile weapons have specifiable minimum ranges, while others do not. It is a particularly useful concept with respect to certain kinds of IndirectFireWeapon which cannot be fired higher than a certain angle, and which therefore cannot fall inside a certain circumference.") :- x_cid(a65b1250a2c24f).
xc_microtheory(a65b1250a2c24f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c24f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c24f,178).
xc_kb_names(a65b1250a2c24f,[]).
xc_mapping_rows(a65b1250a2c24f,[]).
x_genls(x_NerveGas,x_ChemicalAgent) :- x_cid(a65b1250a2c250).
xc_microtheory(a65b1250a2c250,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c250,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c250,180).
xc_kb_names(a65b1250a2c250,[]).
xc_mapping_rows(a65b1250a2c250,[]).
x_relationInstanceAll(x_hasOwnershipIn,x_ArmyFn(x_UnitedStatesOfAmerica),x_USMilitaryChemicalProtectiveMask) :- x_cid(a65b1250a2c251).
xc_microtheory(a65b1250a2c251,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c251,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c251,182).
xc_kb_names(a65b1250a2c251,[]).
xc_mapping_rows(a65b1250a2c251,[]).
x_isa('x_BallisticMissile-ICBM',x_ExistingObjectType) :- x_cid(a65b1250a2c252).
xc_microtheory(a65b1250a2c252,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c252,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c252,185).
xc_kb_names(a65b1250a2c252,[]).
xc_mapping_rows(a65b1250a2c252,[]).
x_comment('x_Warhead-HighExplosiveAntiTank',"The collection of Warheads that are meant to be used against Tank-Vehicles and other ArmoredVehicles.") :- x_cid(a65b1250a2c253).
xc_microtheory(a65b1250a2c253,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c253,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c253,187).
xc_kb_names(a65b1250a2c253,[]).
xc_mapping_rows(a65b1250a2c253,[]).
x_genls(x_AutomaticGrenadeLauncher,'x_Belt-FedFirearm') :- x_cid(a65b1250a2c254).
xc_microtheory(a65b1250a2c254,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c254,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c254,189).
xc_kb_names(a65b1250a2c254,[]).
xc_mapping_rows(a65b1250a2c254,[]).
x_isa(x_IncapacitatingAgent,x_ExistingStuffType) :- x_cid(a65b1250a2c255).
xc_microtheory(a65b1250a2c255,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c255,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c255,191).
xc_kb_names(a65b1250a2c255,[]).
xc_mapping_rows(a65b1250a2c255,[]).
x_genls('x_BallisticMissile-CSS2',x_BallisticMissile) :- x_cid(a65b1250a2c256).
xc_microtheory(a65b1250a2c256,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c256,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c256,193).
xc_kb_names(a65b1250a2c256,[]).
xc_mapping_rows(a65b1250a2c256,[]).
x_keStrongSuggestionPreds(x_BiologicalAttack,x_deviceUsed) :- x_cid(a65b1250a2c257).
xc_microtheory(a65b1250a2c257,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c257,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c257,195).
xc_kb_names(a65b1250a2c257,[]).
xc_mapping_rows(a65b1250a2c257,[]).
x_transportedInTypes(x_BiologicalWeapon,x_BallisticMissile) :- x_cid(a65b1250a2c258).
xc_microtheory(a65b1250a2c258,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c258,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c258,197).
xc_kb_names(a65b1250a2c258,[]).
xc_mapping_rows(a65b1250a2c258,[]).
x_genls('x_Sidewinder-Missile',x_AirToAirMissile) :- x_cid(a65b1250a2c259).
xc_microtheory(a65b1250a2c259,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c259,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c259,199).
xc_kb_names(a65b1250a2c259,[]).
xc_mapping_rows(a65b1250a2c259,[]).
x_genls('x_F-16CFighter','x_F-16-Fighter') :- x_cid(a65b1250a2c25a).
xc_microtheory(a65b1250a2c25a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c25a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c25a,201).
xc_kb_names(a65b1250a2c25a,[]).
xc_mapping_rows(a65b1250a2c25a,[]).
x_isa('x_Howitzer-155mmSelfPropelled',x_ExistingObjectType) :- x_cid(a65b1250a2c25b).
xc_microtheory(a65b1250a2c25b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c25b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c25b,203).
xc_kb_names(a65b1250a2c25b,[]).
xc_mapping_rows(a65b1250a2c25b,[]).
x_genls(x_MidcourseGuidedProjectile,x_CollectionUnionFn(x_TheSet(x_HardwareTool,x_PhysicalDevice))) :- x_cid(a65b1250a2c25c).
xc_microtheory(a65b1250a2c25c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c25c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c25c,205).
xc_kb_names(a65b1250a2c25c,[]).
xc_mapping_rows(a65b1250a2c25c,[]).
x_genls(x_BiologicalWeaponFn(x_RickettsiaRicketsii),x_BiologicalWeapon) :- x_cid(a65b1250a2c25d).
xc_microtheory(a65b1250a2c25d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c25d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c25d,209).
xc_kb_names(a65b1250a2c25d,[]).
xc_mapping_rows(a65b1250a2c25d,[]).
x_argIsa(x_weaponRounds,1,x_Gun) :- x_cid(a65b1250a2c25e).
xc_microtheory(a65b1250a2c25e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c25e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c25e,212).
xc_kb_names(a65b1250a2c25e,[]).
xc_mapping_rows(a65b1250a2c25e,[]).
x_conceptuallyRelated('x_BiologicalWeapon-GeneticallyEngineeredBacteriumBased',x_GeneticEngineering) :- x_cid(a65b1250a2c25f).
xc_microtheory(a65b1250a2c25f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c25f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c25f,214).
xc_kb_names(a65b1250a2c25f,[]).
xc_mapping_rows(a65b1250a2c25f,[]).
x_isa(x_GroupFn('x_BallisticMissile-CSS8'),x_ObjectType) :- x_cid(a65b1250a2c260).
xc_microtheory(a65b1250a2c260,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c260,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c260,216).
xc_kb_names(a65b1250a2c260,[]).
xc_mapping_rows(a65b1250a2c260,[]).
x_isa('x_MineField-Scatterable',x_ExistingStuffType) :- x_cid(a65b1250a2c261).
xc_microtheory(a65b1250a2c261,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c261,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c261,219).
xc_kb_names(a65b1250a2c261,[]).
xc_mapping_rows(a65b1250a2c261,[]).
x_argGenl(x_intendedTargetTypeOfWeaponType,2,x_SomethingExisting) :- x_cid(a65b1250a2c262).
xc_microtheory(a65b1250a2c262,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c262,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c262,221).
xc_kb_names(a65b1250a2c262,[]).
xc_mapping_rows(a65b1250a2c262,[]).
x_relationAllExists(x_physicalParts,x_BiologicalWeaponFn(x_CoxiellaBurnetti),x_CoxiellaBurnetti) :- x_cid(a65b1250a2c263).
xc_microtheory(a65b1250a2c263,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c263,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c263,223).
xc_kb_names(a65b1250a2c263,[]).
xc_mapping_rows(a65b1250a2c263,[]).
x_arity(x_angleOfLauncher,2) :- x_cid(a65b1250a2c264).
xc_microtheory(a65b1250a2c264,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c264,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c264,226).
xc_kb_names(a65b1250a2c264,[]).
xc_mapping_rows(a65b1250a2c264,[]).
x_genls(x_GrenadeLauncher,'x_SmallArm-Weapon') :- x_cid(a65b1250a2c265).
xc_microtheory(a65b1250a2c265,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c265,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c265,228).
xc_kb_names(a65b1250a2c265,[]).
xc_mapping_rows(a65b1250a2c265,[]).
x_genls(x_BiologicalWeaponFn(x_BrucellaBacterium),'x_BiologicalWeapon-Bacterial') :- x_cid(a65b1250a2c266).
xc_microtheory(a65b1250a2c266,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c266,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c266,230).
xc_kb_names(a65b1250a2c266,[]).
xc_mapping_rows(a65b1250a2c266,[]).
x_genls(x_ChemicalWeaponFn(x_Phosgene),x_ChemicalWeapon) :- x_cid(a65b1250a2c267).
xc_microtheory(a65b1250a2c267,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c267,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c267,233).
xc_kb_names(a65b1250a2c267,[]).
xc_mapping_rows(a65b1250a2c267,[]).
x_genls(x_CombatAircraft,x_ConventionalWeapon) :- x_cid(a65b1250a2c268).
xc_microtheory(a65b1250a2c268,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c268,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c268,236).
xc_kb_names(a65b1250a2c268,[]).
xc_mapping_rows(a65b1250a2c268,[]).
x_genls(x_BombSubmunition,x_MilitaryWeapon) :- x_cid(a65b1250a2c269).
xc_microtheory(a65b1250a2c269,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c269,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c269,238).
xc_kb_names(a65b1250a2c269,[]).
xc_mapping_rows(a65b1250a2c269,[]).
x_genls('x_BallisticMissile-Guided',x_BallisticMissile) :- x_cid(a65b1250a2c26a).
xc_microtheory(a65b1250a2c26a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c26a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c26a,240).
xc_kb_names(a65b1250a2c26a,[]).
xc_mapping_rows(a65b1250a2c26a,[]).
x_genls('x_BallisticMissile-SubmarineLaunched',x_BallisticMissile) :- x_cid(a65b1250a2c26b).
xc_microtheory(a65b1250a2c26b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c26b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c26b,242).
xc_kb_names(a65b1250a2c26b,[]).
xc_mapping_rows(a65b1250a2c26b,[]).
x_relationExistsAll(x_physicalParts,x_MilitaryAircraft,x_AircraftWeaponPylon) :- x_cid(a65b1250a2c26c).
xc_microtheory(a65b1250a2c26c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c26c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c26c,244).
xc_kb_names(a65b1250a2c26c,[]).
xc_mapping_rows(a65b1250a2c26c,[]).
x_genls(x_BoforsGun,x_AntiAircraftArtilleryGun) :- x_cid(a65b1250a2c26d).
xc_microtheory(a65b1250a2c26d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c26d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c26d,246).
xc_kb_names(a65b1250a2c26d,[]).
xc_mapping_rows(a65b1250a2c26d,[]).
x_arg1Isa(x_IntendedTargetTypeFn,x_Collection) :- x_cid(a65b1250a2c26e).
xc_microtheory(a65b1250a2c26e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c26e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c26e,248).
xc_kb_names(a65b1250a2c26e,[]).
xc_mapping_rows(a65b1250a2c26e,[]).
x_comment('x_MultipleRocketLauncherSystem-MLRS',"The collection of American-made multiple rocket launchers, similar to the Soviet MultipleRocketLauncher-122mmMRL, but much newer.") :- x_cid(a65b1250a2c26f).
xc_microtheory(a65b1250a2c26f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c26f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c26f,250).
xc_kb_names(a65b1250a2c26f,[]).
xc_mapping_rows(a65b1250a2c26f,[]).
x_relationAllExists(x_physicalParts,'x_BiologicalWeapon-BiologicalToxinBased',x_BiologicalToxin) :- x_cid(a65b1250a2c270).
xc_microtheory(a65b1250a2c270,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c270,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c270,252).
xc_kb_names(a65b1250a2c270,[]).
xc_mapping_rows(a65b1250a2c270,[]).
x_isa(x_ChemicalWeaponFn('x_VX-NerveGas'),x_ExistingObjectType) :- x_cid(a65b1250a2c271).
xc_microtheory(a65b1250a2c271,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c271,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c271,254).
xc_kb_names(a65b1250a2c271,[]).
xc_mapping_rows(a65b1250a2c271,[]).
x_isa(x_ChemicalWeaponFn(x_Sarin),x_ExistingObjectType) :- x_cid(a65b1250a2c272).
xc_microtheory(a65b1250a2c272,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c272,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c272,257).
xc_kb_names(a65b1250a2c272,[]).
xc_mapping_rows(a65b1250a2c272,[]).
x_genls(x_ArtilleryShell,x_PoweredDevice) :- x_cid(a65b1250a2c273).
xc_microtheory(a65b1250a2c273,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c273,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c273,260).
xc_kb_names(a65b1250a2c273,[]).
xc_mapping_rows(a65b1250a2c273,[]).
x_relationAllInstance(x_groupMemberType,x_GroupFn('x_BallisticMissile-SCUDC'),'x_BallisticMissile-SCUDC') :- x_cid(a65b1250a2c274).
xc_microtheory(a65b1250a2c274,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c274,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c274,262).
xc_kb_names(a65b1250a2c274,[]).
xc_mapping_rows(a65b1250a2c274,[]).
x_arg1Isa('x_weaponEffectiveRange-Min',x_ProjectileWeapon) :- x_cid(a65b1250a2c275).
xc_microtheory(a65b1250a2c275,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c275,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c275,265).
xc_kb_names(a65b1250a2c275,[]).
xc_mapping_rows(a65b1250a2c275,[]).
x_comment('x_BallisticMissile-IntermediateRange',"A ballistic missile with a range of 1,500-3,437 miles") :- x_cid(a65b1250a2c276).
xc_microtheory(a65b1250a2c276,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c276,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c276,267).
xc_kb_names(a65b1250a2c276,[]).
xc_mapping_rows(a65b1250a2c276,[]).
x_comment(x_USMilitaryChemicalProtectiveMask,"The class of all ProtectiveFiltrationMasks manufactured by the US Army during the last decade of the 20th century and the first decade of the 21st, and issued to US Army personnel for field use.") :- x_cid(a65b1250a2c277).
xc_microtheory(a65b1250a2c277,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c277,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c277,269).
xc_kb_names(a65b1250a2c277,[]).
xc_mapping_rows(a65b1250a2c277,[]).
x_isa(x_MakingFn('x_CruiseMissile-AS7Kerry'),x_SituationType) :- x_cid(a65b1250a2c278).
xc_microtheory(a65b1250a2c278,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c278,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c278,271).
xc_kb_names(a65b1250a2c278,[]).
xc_mapping_rows(a65b1250a2c278,[]).
x_isa('x_BallisticMissile-ICBM',x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c279).
xc_microtheory(a65b1250a2c279,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c279,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c279,274).
xc_kb_names(a65b1250a2c279,[]).
xc_mapping_rows(a65b1250a2c279,[]).
x_genls('x_Warhead-HighExplosiveAntiTank',x_AntiTankWeapon) :- x_cid(a65b1250a2c27a).
xc_microtheory(a65b1250a2c27a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c27a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c27a,276).
xc_kb_names(a65b1250a2c27a,[]).
xc_mapping_rows(a65b1250a2c27a,[]).
x_genls(x_AutomaticGrenadeLauncher,x_GrenadeLauncher) :- x_cid(a65b1250a2c27b).
xc_microtheory(a65b1250a2c27b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c27b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c27b,278).
xc_kb_names(a65b1250a2c27b,[]).
xc_mapping_rows(a65b1250a2c27b,[]).
x_genls('x_Torpedo-MK-46',x_Torpedo) :- x_cid(a65b1250a2c27c).
xc_microtheory(a65b1250a2c27c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c27c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c27c,280).
xc_kb_names(a65b1250a2c27c,[]).
xc_mapping_rows(a65b1250a2c27c,[]).
x_genls('x_SurfaceToSurfaceMissile-Ballistic',x_SurfaceToSurfaceMissile) :- x_cid(a65b1250a2c27d).
xc_microtheory(a65b1250a2c27d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c27d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c27d,282).
xc_kb_names(a65b1250a2c27d,[]).
xc_mapping_rows(a65b1250a2c27d,[]).
x_genls('x_Platform-Military',x_TransportationDevice) :- x_cid(a65b1250a2c27e).
xc_microtheory(a65b1250a2c27e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c27e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c27e,284).
xc_kb_names(a65b1250a2c27e,[]).
xc_mapping_rows(a65b1250a2c27e,[]).
x_relationAllExists(x_outputsCreated,x_MakingFn('x_BallisticMissile-SCUDB'),'x_BallisticMissile-SCUDB') :- x_cid(a65b1250a2c27f).
xc_microtheory(a65b1250a2c27f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c27f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c27f,286).
xc_kb_names(a65b1250a2c27f,[]).
xc_mapping_rows(a65b1250a2c27f,[]).
x_relationAllExists(x_deviceUsed,x_MissileAttack,x_Missile) :- x_cid(a65b1250a2c280).
xc_microtheory(a65b1250a2c280,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c280,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c280,289).
xc_kb_names(a65b1250a2c280,[]).
xc_mapping_rows(a65b1250a2c280,[]).
x_genls(x_MakingFn(x_BiologicalWeapon),x_MakingFn(x_WeaponOfMassDestruction)) :- x_cid(a65b1250a2c281).
xc_microtheory(a65b1250a2c281,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c281,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c281,291).
xc_kb_names(a65b1250a2c281,[]).
xc_mapping_rows(a65b1250a2c281,[]).
x_genls(x_BiologicalWeaponFn('x_Anthrax-Bacterium'),x_BiologicalWeapon) :- x_cid(a65b1250a2c282).
xc_microtheory(a65b1250a2c282,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c282,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c282,295).
xc_kb_names(a65b1250a2c282,[]).
xc_mapping_rows(a65b1250a2c282,[]).
x_isa(x_BiologicalWeaponFn(x_RickettsiaRicketsii),x_ExistingObjectType) :- x_cid(a65b1250a2c283).
xc_microtheory(a65b1250a2c283,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c283,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c283,298).
xc_kb_names(a65b1250a2c283,[]).
xc_mapping_rows(a65b1250a2c283,[]).
x_genls('x_BiologicalWeapon-GeneticallyEngineeredBacteriumBased','x_BiologicalWeapon-GeneticallyEngineeredOrganismBased') :- x_cid(a65b1250a2c284).
xc_microtheory(a65b1250a2c284,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c284,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c284,301).
xc_kb_names(a65b1250a2c284,[]).
xc_mapping_rows(a65b1250a2c284,[]).
x_comment('x_CruiseMissile-AS7Kerry',"The collection of AS-7 missiles. These are short-range air-to-surface missiles developed in Russia, and deployed in about 30 countries worldwide.") :- x_cid(a65b1250a2c285).
xc_microtheory(a65b1250a2c285,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c285,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c285,303).
xc_kb_names(a65b1250a2c285,[]).
xc_mapping_rows(a65b1250a2c285,[]).
x_implies(x_and(x_isa(V1,x_BallisticMissile),x_weaponRange(V1,V2),x_greaterThanOrEqualTo(V2,x_Mile(3500))),x_isa(V1,'x_BallisticMissile-ICBM')) :- x_cid(a65b1250a2c286,V1,V2).
xc_microtheory(a65b1250a2c286,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c286,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c286,305).
xc_kb_names(a65b1250a2c286,["?MISSILE","?RANGE"]).
xc_mapping_rows(a65b1250a2c286,[]).
x_genls('x_Anthrax-DryForm','x_Anthrax-Bacterium') :- x_cid(a65b1250a2c287).
xc_microtheory(a65b1250a2c287,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c287,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c287,313).
xc_kb_names(a65b1250a2c287,[]).
xc_mapping_rows(a65b1250a2c287,[]).
x_genls(x_AntiAircraftArtilleryGun,x_AntiAircraftWeapon) :- x_cid(a65b1250a2c288).
xc_microtheory(a65b1250a2c288,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c288,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c288,315).
xc_kb_names(a65b1250a2c288,[]).
xc_mapping_rows(a65b1250a2c288,[]).
x_isa(x_GroupFn('x_BallisticMissile-M11'),x_ObjectType) :- x_cid(a65b1250a2c289).
xc_microtheory(a65b1250a2c289,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c289,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c289,317).
xc_kb_names(a65b1250a2c289,[]).
xc_mapping_rows(a65b1250a2c289,[]).
x_genls('x_MineField-AntiTankWithGap','x_MineField-AntiTank') :- x_cid(a65b1250a2c28a).
xc_microtheory(a65b1250a2c28a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c28a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c28a,320).
xc_kb_names(a65b1250a2c28a,[]).
xc_mapping_rows(a65b1250a2c28a,[]).
x_genls(x_AntiArmorMine,x_AntiArmorWeapon) :- x_cid(a65b1250a2c28b).
xc_microtheory(a65b1250a2c28b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c28b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c28b,322).
xc_kb_names(a65b1250a2c28b,[]).
xc_mapping_rows(a65b1250a2c28b,[]).
x_arg2Genl(x_intendedTargetTypeOfWeaponType,x_SomethingExisting) :- x_cid(a65b1250a2c28c).
xc_microtheory(a65b1250a2c28c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c28c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c28c,324).
xc_kb_names(a65b1250a2c28c,[]).
xc_mapping_rows(a65b1250a2c28c,[]).
x_genls(x_BiologicalWeaponFn(x_CoxiellaBurnetti),x_BiologicalWeapon) :- x_cid(a65b1250a2c28d).
xc_microtheory(a65b1250a2c28d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c28d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c28d,326).
xc_kb_names(a65b1250a2c28d,[]).
xc_mapping_rows(a65b1250a2c28d,[]).
x_isa(x_angleOfLauncher,x_BinaryPredicate) :- x_cid(a65b1250a2c28e).
xc_microtheory(a65b1250a2c28e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c28e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c28e,329).
xc_kb_names(a65b1250a2c28e,[]).
xc_mapping_rows(a65b1250a2c28e,[]).
x_genls(x_GrenadeLauncher,x_ProjectileLauncher) :- x_cid(a65b1250a2c28f).
xc_microtheory(a65b1250a2c28f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c28f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c28f,331).
xc_kb_names(a65b1250a2c28f,[]).
xc_mapping_rows(a65b1250a2c28f,[]).
x_genls(x_DepthBomb,x_Bomb) :- x_cid(a65b1250a2c290).
xc_microtheory(a65b1250a2c290,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c290,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c290,333).
xc_kb_names(a65b1250a2c290,[]).
xc_mapping_rows(a65b1250a2c290,[]).
x_isa(x_ChemicalWeaponFn(x_Phosgene),x_ExistingObjectType) :- x_cid(a65b1250a2c291).
xc_microtheory(a65b1250a2c291,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c291,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c291,335).
xc_kb_names(a65b1250a2c291,[]).
xc_mapping_rows(a65b1250a2c291,[]).
x_genls(x_Saxitoxin,x_BiologicalToxin) :- x_cid(a65b1250a2c292).
xc_microtheory(a65b1250a2c292,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c292,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c292,338).
xc_kb_names(a65b1250a2c292,[]).
xc_mapping_rows(a65b1250a2c292,[]).
x_isa(x_BombSubmunition,x_ExistingObjectType) :- x_cid(a65b1250a2c293).
xc_microtheory(a65b1250a2c293,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c293,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c293,340).
xc_kb_names(a65b1250a2c293,[]).
xc_mapping_rows(a65b1250a2c293,[]).
x_comment('x_BiologicalWeapon-Fungal',"The collection of all BiologicalWeapons that make use of fungi.") :- x_cid(a65b1250a2c294).
xc_microtheory(a65b1250a2c294,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c294,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c294,342).
xc_kb_names(a65b1250a2c294,[]).
xc_mapping_rows(a65b1250a2c294,[]).
x_comment('x_MineField-Scatterable',"Collection of instances of MineField such that the relevant instances of Mine-Weapon are emplaced by broadcast scatter.") :- x_cid(a65b1250a2c295).
xc_microtheory(a65b1250a2c295,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c295,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c295,344).
xc_kb_names(a65b1250a2c295,[]).
xc_mapping_rows(a65b1250a2c295,[]).
x_isa('x_BallisticMissile-SubmarineLaunched',x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c296).
xc_microtheory(a65b1250a2c296,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c296,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c296,346).
xc_kb_names(a65b1250a2c296,[]).
xc_mapping_rows(a65b1250a2c296,[]).
x_genls(x_GroupFn(x_SilkwormMissile),x_PartiallyTangible) :- x_cid(a65b1250a2c297).
xc_microtheory(a65b1250a2c297,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c297,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c297,348).
xc_kb_names(a65b1250a2c297,[]).
xc_mapping_rows(a65b1250a2c297,[]).
x_genls(x_AntiAircraftArtilleryGun,x_Gun) :- x_cid(a65b1250a2c298).
xc_microtheory(a65b1250a2c298,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c298,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c298,351).
xc_kb_names(a65b1250a2c298,[]).
xc_mapping_rows(a65b1250a2c298,[]).
x_genls(x_BiologicalWeaponFn(x_ClostridiumPerfringens),'x_BiologicalWeapon-BiologicalToxinBased') :- x_cid(a65b1250a2c299).
xc_microtheory(a65b1250a2c299,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c299,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c299,353).
xc_kb_names(a65b1250a2c299,[]).
xc_mapping_rows(a65b1250a2c299,[]).
x_genls(x_SulfurMustardGas,x_MustardGas) :- x_cid(a65b1250a2c29a).
xc_microtheory(a65b1250a2c29a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c29a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c29a,356).
xc_kb_names(a65b1250a2c29a,[]).
xc_mapping_rows(a65b1250a2c29a,[]).
x_genls(x_ChemicalWeaponFn(x_Sarin),x_ChemicalWeapon) :- x_cid(a65b1250a2c29b).
xc_microtheory(a65b1250a2c29b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c29b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c29b,358).
xc_kb_names(a65b1250a2c29b,[]).
xc_mapping_rows(a65b1250a2c29b,[]).
x_genls(x_ArtilleryShell,'x_Device-OneTimeUse') :- x_cid(a65b1250a2c29c).
xc_microtheory(a65b1250a2c29c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c29c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c29c,361).
xc_kb_names(a65b1250a2c29c,[]).
xc_mapping_rows(a65b1250a2c29c,[]).
x_genls('x_BallisticMissile-Mushak120','x_BallisticMissile-BattlefieldShortRange') :- x_cid(a65b1250a2c29d).
xc_microtheory(a65b1250a2c29d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c29d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c29d,363).
xc_kb_names(a65b1250a2c29d,[]).
xc_mapping_rows(a65b1250a2c29d,[]).
x_isa('x_NavalMine-Deployed',x_ExistingObjectType) :- x_cid(a65b1250a2c29e).
xc_microtheory(a65b1250a2c29e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c29e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c29e,365).
xc_kb_names(a65b1250a2c29e,[]).
xc_mapping_rows(a65b1250a2c29e,[]).
x_comment(x_SelectiveFireFirearm,"The collection of AutomaticFirearms that can operate as either a FullyAutomaticFirearm or a SemiAutomaticFirearm.") :- x_cid(a65b1250a2c29f).
xc_microtheory(a65b1250a2c29f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c29f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c29f,367).
xc_kb_names(a65b1250a2c29f,[]).
xc_mapping_rows(a65b1250a2c29f,[]).
x_relationAllInstance(x_groupMemberType,x_GroupFn('x_BallisticMissile-CSS8'),'x_BallisticMissile-CSS8') :- x_cid(a65b1250a2c2a0).
xc_microtheory(a65b1250a2c2a0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2a0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2a0,369).
xc_kb_names(a65b1250a2c2a0,[]).
xc_mapping_rows(a65b1250a2c2a0,[]).
x_comment(x_MachinePistol,"The collection of Handguns that are also MachineGuns. Such guns are fairly rare, since they are relatively useless: Once the trigger is pulled, the clip is more or less emptied instantly.") :- x_cid(a65b1250a2c2a1).
xc_microtheory(a65b1250a2c2a1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2a1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2a1,372).
xc_kb_names(a65b1250a2c2a1,[]).
xc_mapping_rows(a65b1250a2c2a1,[]).
x_genls(x_USMilitaryChemicalProtectiveMask,x_MilitaryHardware) :- x_cid(a65b1250a2c2a2).
xc_microtheory(a65b1250a2c2a2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2a2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2a2,374).
xc_kb_names(a65b1250a2c2a2,[]).
xc_mapping_rows(a65b1250a2c2a2,[]).
x_genls(x_Diphosgene,x_ChokingAgent) :- x_cid(a65b1250a2c2a3).
xc_microtheory(a65b1250a2c2a3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2a3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2a3,376).
xc_kb_names(a65b1250a2c2a3,[]).
xc_mapping_rows(a65b1250a2c2a3,[]).
x_genls('x_BallisticMissile-IntermediateRange',x_BallisticMissile) :- x_cid(a65b1250a2c2a4).
xc_microtheory(a65b1250a2c2a4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2a4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2a4,378).
xc_kb_names(a65b1250a2c2a4,[]).
xc_mapping_rows(a65b1250a2c2a4,[]).
x_genls('x_Warhead-HighExplosiveAntiTank',x_Warhead) :- x_cid(a65b1250a2c2a5).
xc_microtheory(a65b1250a2c2a5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2a5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2a5,380).
xc_kb_names(a65b1250a2c2a5,[]).
xc_mapping_rows(a65b1250a2c2a5,[]).
x_relationAllExists(x_outputsCreated,x_MakingFn('x_CruiseMissile-AS7Kerry'),'x_CruiseMissile-AS7Kerry') :- x_cid(a65b1250a2c2a6).
xc_microtheory(a65b1250a2c2a6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2a6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2a6,382).
xc_kb_names(a65b1250a2c2a6,[]).
xc_mapping_rows(a65b1250a2c2a6,[]).
x_isa(x_AutomaticGrenadeLauncher,x_ExistingObjectType) :- x_cid(a65b1250a2c2a7).
xc_microtheory(a65b1250a2c2a7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2a7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2a7,385).
xc_kb_names(a65b1250a2c2a7,[]).
xc_mapping_rows(a65b1250a2c2a7,[]).
x_arg2Isa(x_rateOfFire,x_Rate) :- x_cid(a65b1250a2c2a8).
xc_microtheory(a65b1250a2c2a8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2a8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2a8,387).
xc_kb_names(a65b1250a2c2a8,[]).
xc_mapping_rows(a65b1250a2c2a8,[]).
x_isa('x_Torpedo-MK-46',x_ProductType) :- x_cid(a65b1250a2c2a9).
xc_microtheory(a65b1250a2c2a9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2a9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2a9,389).
xc_kb_names(a65b1250a2c2a9,[]).
xc_mapping_rows(a65b1250a2c2a9,[]).
x_genls(x_SurfaceToSurfaceMissile,x_Missile) :- x_cid(a65b1250a2c2aa).
xc_microtheory(a65b1250a2c2aa,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2aa,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2aa,391).
xc_kb_names(a65b1250a2c2aa,[]).
xc_mapping_rows(a65b1250a2c2aa,[]).
x_isa('x_Platform-Military',x_ExistingObjectType) :- x_cid(a65b1250a2c2ab).
xc_microtheory(a65b1250a2c2ab,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2ab,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2ab,393).
xc_kb_names(a65b1250a2c2ab,[]).
xc_mapping_rows(a65b1250a2c2ab,[]).
x_relationAllExists(x_deviceUsed,x_BiologicalAttack,x_BiologicalWeapon) :- x_cid(a65b1250a2c2ac).
xc_microtheory(a65b1250a2c2ac,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2ac,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2ac,395).
xc_kb_names(a65b1250a2c2ac,[]).
xc_mapping_rows(a65b1250a2c2ac,[]).
x_argIsa(x_rateOfFire,1,x_Gun) :- x_cid(a65b1250a2c2ad).
xc_microtheory(a65b1250a2c2ad,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2ad,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2ad,397).
xc_kb_names(a65b1250a2c2ad,[]).
xc_mapping_rows(a65b1250a2c2ad,[]).
x_isa('x_BiologicalWeapon-GeneticallyEngineeredBacteriumBased',x_BiologicalWeaponTypeByAgent) :- x_cid(a65b1250a2c2ae).
xc_microtheory(a65b1250a2c2ae,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2ae,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2ae,399).
xc_kb_names(a65b1250a2c2ae,[]).
xc_mapping_rows(a65b1250a2c2ae,[]).
x_arg3Isa('x_SKF-2834698',x_NonNegativeScalarInterval) :- x_cid(a65b1250a2c2af).
xc_microtheory(a65b1250a2c2af,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2af,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2af,401).
xc_kb_names(a65b1250a2c2af,[]).
xc_mapping_rows(a65b1250a2c2af,[]).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),'x_instrument-Generic'(V1,V2),x_isa(V2,x_ChemicalWeapon)),x_isa(V1,x_ChemicalAttack)) :- x_cid(a65b1250a2c2b0,V1,V2).
xc_microtheory(a65b1250a2c2b0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2b0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2b0,403).
xc_kb_names(a65b1250a2c2b0,["?ATTACK","?WEAPON"]).
xc_mapping_rows(a65b1250a2c2b0,[]).
'x_interArgIsa1-2'(x_objectPaidFor,x_BuyingFn(x_BiologicalAgent),x_BiologicalAgent) :- x_cid(a65b1250a2c2b1).
xc_microtheory(a65b1250a2c2b1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2b1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2b1,410).
xc_kb_names(a65b1250a2c2b1,[]).
xc_mapping_rows(a65b1250a2c2b1,[]).
x_implies(x_and(x_isa(V1,x_BallisticMissile),x_weaponRange(V1,V2),x_quantitySubsumes(x_Mile(1500,3437),V2)),x_isa(V1,'x_BallisticMissile-IntermediateRange')) :- x_cid(a65b1250a2c2b2,V1,V2).
xc_microtheory(a65b1250a2c2b2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2b2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2b2,413).
xc_kb_names(a65b1250a2c2b2,["?MISSILE","?RANGE"]).
xc_mapping_rows(a65b1250a2c2b2,[]).
x_isa('x_Anthrax-DryForm',x_ExistingObjectType) :- x_cid(a65b1250a2c2b3).
xc_microtheory(a65b1250a2c2b3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2b3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2b3,421).
xc_kb_names(a65b1250a2c2b3,[]).
xc_mapping_rows(a65b1250a2c2b3,[]).
x_implies(x_isa(V1,x_BiologicalAgent),x_intendedBehaviorCapable(V1,x_HarmingAnAgent,x_stuffUsed)) :- x_cid(a65b1250a2c2b4,V1).
xc_microtheory(a65b1250a2c2b4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2b4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2b4,423).
xc_kb_names(a65b1250a2c2b4,["?BIO"]).
xc_mapping_rows(a65b1250a2c2b4,[]).
x_isa(x_AntiArmorMine,x_ExistingObjectType) :- x_cid(a65b1250a2c2b5).
xc_microtheory(a65b1250a2c2b5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2b5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2b5,427).
xc_kb_names(a65b1250a2c2b5,[]).
xc_mapping_rows(a65b1250a2c2b5,[]).
x_argIsa(x_intendedTargetTypeOfWeaponType,2,x_Collection) :- x_cid(a65b1250a2c2b6).
xc_microtheory(a65b1250a2c2b6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2b6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2b6,429).
xc_kb_names(a65b1250a2c2b6,[]).
xc_mapping_rows(a65b1250a2c2b6,[]).
x_isa(x_angleOfLauncher,x_FunctionalPredicate) :- x_cid(a65b1250a2c2b7).
xc_microtheory(a65b1250a2c2b7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2b7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2b7,431).
xc_kb_names(a65b1250a2c2b7,[]).
xc_mapping_rows(a65b1250a2c2b7,[]).
x_isa(x_BiologicalWeaponFn(x_CoxiellaBurnetti),x_ExistingObjectType) :- x_cid(a65b1250a2c2b8).
xc_microtheory(a65b1250a2c2b8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2b8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2b8,433).
xc_kb_names(a65b1250a2c2b8,[]).
xc_mapping_rows(a65b1250a2c2b8,[]).
x_genls('x_Torpedo-MK-44',x_ElectricalDevice) :- x_cid(a65b1250a2c2b9).
xc_microtheory(a65b1250a2c2b9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2b9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2b9,436).
xc_kb_names(a65b1250a2c2b9,[]).
xc_mapping_rows(a65b1250a2c2b9,[]).
x_genls(x_HeavyMachineGun,x_FullyAutomaticFirearm) :- x_cid(a65b1250a2c2ba).
xc_microtheory(a65b1250a2c2ba,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2ba,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2ba,438).
xc_kb_names(a65b1250a2c2ba,[]).
xc_mapping_rows(a65b1250a2c2ba,[]).
x_isa(x_Saxitoxin,x_ExistingStuffType) :- x_cid(a65b1250a2c2bb).
xc_microtheory(a65b1250a2c2bb,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2bb,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2bb,440).
xc_kb_names(a65b1250a2c2bb,[]).
xc_mapping_rows(a65b1250a2c2bb,[]).
x_comment(x_AntiArmorWeapon,"The collection of Weapons that are designed to be used against ArmoredVehicles.") :- x_cid(a65b1250a2c2bc).
xc_microtheory(a65b1250a2c2bc,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2bc,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2bc,442).
xc_kb_names(a65b1250a2c2bc,[]).
xc_mapping_rows(a65b1250a2c2bc,[]).
x_isa('x_BallisticMissile-Guided',x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c2bd).
xc_microtheory(a65b1250a2c2bd,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2bd,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2bd,444).
xc_kb_names(a65b1250a2c2bd,[]).
xc_mapping_rows(a65b1250a2c2bd,[]).
x_comment(x_125MMSmoothBoreCannon,"A kind of Cannon common on Chinese Tanks.") :- x_cid(a65b1250a2c2be).
xc_microtheory(a65b1250a2c2be,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2be,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2be,446).
xc_kb_names(a65b1250a2c2be,[]).
xc_mapping_rows(a65b1250a2c2be,[]).
x_isa(x_weaponRange,x_FunctionalPredicate) :- x_cid(a65b1250a2c2bf).
xc_microtheory(a65b1250a2c2bf,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2bf,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2bf,448).
xc_kb_names(a65b1250a2c2bf,[]).
xc_mapping_rows(a65b1250a2c2bf,[]).
x_conceptuallyRelated('x_MineField-AntiTankWithGap','x_Canalize-MilitaryTask') :- x_cid(a65b1250a2c2c0).
xc_microtheory(a65b1250a2c2c0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2c0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2c0,450).
xc_kb_names(a65b1250a2c2c0,[]).
xc_mapping_rows(a65b1250a2c2c0,[]).
x_isa('x_BallisticMissile-SubmarineLaunched',x_ExistingObjectType) :- x_cid(a65b1250a2c2c1).
xc_microtheory(a65b1250a2c2c1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2c1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2c1,452).
xc_kb_names(a65b1250a2c2c1,[]).
xc_mapping_rows(a65b1250a2c2c1,[]).
x_isa(x_IntendedTargetTypeFn,x_CollectionDenotingFunction) :- x_cid(a65b1250a2c2c2).
xc_microtheory(a65b1250a2c2c2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2c2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2c2,454).
xc_kb_names(a65b1250a2c2c2,[]).
xc_mapping_rows(a65b1250a2c2c2,[]).
x_genls(x_BiologicalWeaponFn(x_RicinToxin),'x_BiologicalWeapon-BiologicalToxinBased') :- x_cid(a65b1250a2c2c3).
xc_microtheory(a65b1250a2c2c3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2c3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2c3,456).
xc_kb_names(a65b1250a2c2c3,[]).
xc_mapping_rows(a65b1250a2c2c3,[]).
x_comment('x_BallisticMissile-M11',"A short range ballistic missile produced in China.") :- x_cid(a65b1250a2c2c4).
xc_microtheory(a65b1250a2c2c4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2c4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2c4,459).
xc_kb_names(a65b1250a2c2c4,[]).
xc_mapping_rows(a65b1250a2c2c4,[]).
x_relationAllInstance('x_weaponEffectiveRange-Max','x_BallisticMissile-Minuteman1',x_Mile(6214)) :- x_cid(a65b1250a2c2c5).
xc_microtheory(a65b1250a2c2c5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2c5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2c5,461).
xc_kb_names(a65b1250a2c2c5,[]).
xc_mapping_rows(a65b1250a2c2c5,[]).
x_relationAllInstance(x_groupMemberType,x_GroupFn('x_BallisticMissile-M11'),'x_BallisticMissile-M11') :- x_cid(a65b1250a2c2c6).
xc_microtheory(a65b1250a2c2c6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2c6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2c6,464).
xc_kb_names(a65b1250a2c2c6,[]).
xc_mapping_rows(a65b1250a2c2c6,[]).
x_comment(x_AntiSubmarineRocket,"The collection of Missiles designed to destroy or inflict damage on Submarines.") :- x_cid(a65b1250a2c2c7).
xc_microtheory(a65b1250a2c2c7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2c7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2c7,467).
xc_kb_names(a65b1250a2c2c7,[]).
xc_mapping_rows(a65b1250a2c2c7,[]).
x_genls(x_Phosgene,x_ChokingAgent) :- x_cid(a65b1250a2c2c8).
xc_microtheory(a65b1250a2c2c8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2c8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2c8,469).
xc_kb_names(a65b1250a2c2c8,[]).
xc_mapping_rows(a65b1250a2c2c8,[]).
x_isa('x_BallisticMissile-IntermediateRange',x_ExistingObjectType) :- x_cid(a65b1250a2c2c9).
xc_microtheory(a65b1250a2c2c9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2c9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2c9,471).
xc_kb_names(a65b1250a2c2c9,[]).
xc_mapping_rows(a65b1250a2c2c9,[]).
x_isa('x_Warhead-HighExplosiveAntiTank',x_ExistingObjectType) :- x_cid(a65b1250a2c2ca).
xc_microtheory(a65b1250a2c2ca,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2ca,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2ca,473).
xc_kb_names(a65b1250a2c2ca,[]).
xc_mapping_rows(a65b1250a2c2ca,[]).
x_genls(x_MakingFn('x_CruiseMissile-AS7Kerry'),x_MakingSomething) :- x_cid(a65b1250a2c2cb).
xc_microtheory(a65b1250a2c2cb,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2cb,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2cb,475).
xc_kb_names(a65b1250a2c2cb,[]).
xc_mapping_rows(a65b1250a2c2cb,[]).
x_arg1Isa(x_rateOfFire,x_Gun) :- x_cid(a65b1250a2c2cc).
xc_microtheory(a65b1250a2c2cc,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2cc,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2cc,478).
xc_kb_names(a65b1250a2c2cc,[]).
xc_mapping_rows(a65b1250a2c2cc,[]).
x_isa(x_SurfaceToSurfaceMissile,x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c2cd).
xc_microtheory(a65b1250a2c2cd,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2cd,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2cd,480).
xc_kb_names(a65b1250a2c2cd,[]).
xc_mapping_rows(a65b1250a2c2cd,[]).
x_relationAllExists(x_physicalParts,'x_BallisticMissile-ICBM',x_NuclearWarhead) :- x_cid(a65b1250a2c2ce).
xc_microtheory(a65b1250a2c2ce,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2ce,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2ce,482).
xc_kb_names(a65b1250a2c2ce,[]).
xc_mapping_rows(a65b1250a2c2ce,[]).
x_genls(x_MakingFn(x_NuclearWeapon),x_MakingFn(x_WeaponOfMassDestruction)) :- x_cid(a65b1250a2c2cf).
xc_microtheory(a65b1250a2c2cf,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2cf,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2cf,484).
xc_kb_names(a65b1250a2c2cf,[]).
xc_mapping_rows(a65b1250a2c2cf,[]).
x_relationAllExists(x_deviceUsed,x_NuclearAttack,x_NuclearWeapon) :- x_cid(a65b1250a2c2d0).
xc_microtheory(a65b1250a2c2d0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2d0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2d0,488).
xc_kb_names(a65b1250a2c2d0,[]).
xc_mapping_rows(a65b1250a2c2d0,[]).
x_argIsa(x_angleOfLauncher,1,x_ProjectileLauncher) :- x_cid(a65b1250a2c2d1).
xc_microtheory(a65b1250a2c2d1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2d1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2d1,490).
xc_kb_names(a65b1250a2c2d1,[]).
xc_mapping_rows(a65b1250a2c2d1,[]).
x_arg2Isa('x_SKF-2834698',x_TransportationEvent) :- x_cid(a65b1250a2c2d2).
xc_microtheory(a65b1250a2c2d2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2d2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2d2,492).
xc_kb_names(a65b1250a2c2d2,[]).
xc_mapping_rows(a65b1250a2c2d2,[]).
x_genls(x_BiologicalAgent,x_PrecursorMaterialForChemicalOrBiologicalWeapons) :- x_cid(a65b1250a2c2d3).
xc_microtheory(a65b1250a2c2d3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2d3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2d3,494).
xc_kb_names(a65b1250a2c2d3,[]).
xc_mapping_rows(a65b1250a2c2d3,[]).
x_implies(x_and(x_isa(V1,x_BallisticMissile),x_weaponRange(V1,V2),x_quantitySubsumes(x_Mile(500,1499),V2)),x_isa(V1,'x_BallisticMissile-MediumRange')) :- x_cid(a65b1250a2c2d4,V1,V2).
xc_microtheory(a65b1250a2c2d4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2d4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2d4,496).
xc_kb_names(a65b1250a2c2d4,["?MISSILE","?RANGE"]).
xc_mapping_rows(a65b1250a2c2d4,[]).
x_genls(x_AntiArmorMine,x_LandMine) :- x_cid(a65b1250a2c2d5).
xc_microtheory(a65b1250a2c2d5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2d5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2d5,504).
xc_kb_names(a65b1250a2c2d5,[]).
xc_mapping_rows(a65b1250a2c2d5,[]).
x_isa('x_MineField-AntiTankWithGap',x_ExistingStuffType) :- x_cid(a65b1250a2c2d6).
xc_microtheory(a65b1250a2c2d6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2d6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2d6,506).
xc_kb_names(a65b1250a2c2d6,[]).
xc_mapping_rows(a65b1250a2c2d6,[]).
x_arg2Isa(x_intendedTargetTypeOfWeaponType,x_Collection) :- x_cid(a65b1250a2c2d7).
xc_microtheory(a65b1250a2c2d7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2d7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2d7,508).
xc_kb_names(a65b1250a2c2d7,[]).
xc_mapping_rows(a65b1250a2c2d7,[]).
x_comment(x_SemiAutomaticFirearm,"The collection of AutomaticFirearms that fire a burst of bullets per pull of the trigger.") :- x_cid(a65b1250a2c2d8).
xc_microtheory(a65b1250a2c2d8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2d8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2d8,510).
xc_kb_names(a65b1250a2c2d8,[]).
xc_mapping_rows(a65b1250a2c2d8,[]).
x_genls(x_BiologicalWeaponFn('x_Anthrax-Bacterium'),'x_BiologicalWeapon-Bacterial') :- x_cid(a65b1250a2c2d9).
xc_microtheory(a65b1250a2c2d9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2d9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2d9,512).
xc_kb_names(a65b1250a2c2d9,[]).
xc_mapping_rows(a65b1250a2c2d9,[]).
x_genls('x_Torpedo-MK-46',x_FuelPoweredDevice) :- x_cid(a65b1250a2c2da).
xc_microtheory(a65b1250a2c2da,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2da,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2da,515).
xc_kb_names(a65b1250a2c2da,[]).
xc_mapping_rows(a65b1250a2c2da,[]).
x_genls(x_ClusterBomb,x_Bomb) :- x_cid(a65b1250a2c2db).
xc_microtheory(a65b1250a2c2db,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2db,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2db,517).
xc_kb_names(a65b1250a2c2db,[]).
xc_mapping_rows(a65b1250a2c2db,[]).
x_isa(x_AntiArmorWeapon,x_ExistingObjectType) :- x_cid(a65b1250a2c2dc).
xc_microtheory(a65b1250a2c2dc,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2dc,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2dc,519).
xc_kb_names(a65b1250a2c2dc,[]).
xc_mapping_rows(a65b1250a2c2dc,[]).
x_isa('x_BallisticMissile-BattlefieldShortRange',x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c2dd).
xc_microtheory(a65b1250a2c2dd,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2dd,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2dd,521).
xc_kb_names(a65b1250a2c2dd,[]).
xc_mapping_rows(a65b1250a2c2dd,[]).
x_arity(x_weaponRange,2) :- x_cid(a65b1250a2c2de).
xc_microtheory(a65b1250a2c2de,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2de,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2de,523).
xc_kb_names(a65b1250a2c2de,[]).
xc_mapping_rows(a65b1250a2c2de,[]).
x_conceptuallyRelated('x_MineField-AntiTankWithGap','x_MechanizedUnit-MilitarySpecialty') :- x_cid(a65b1250a2c2df).
xc_microtheory(a65b1250a2c2df,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2df,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2df,525).
xc_kb_names(a65b1250a2c2df,[]).
xc_mapping_rows(a65b1250a2c2df,[]).
x_isa(x_AntiAircraftArtilleryGun,x_ExistingObjectType) :- x_cid(a65b1250a2c2e0).
xc_microtheory(a65b1250a2c2e0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2e0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2e0,527).
xc_kb_names(a65b1250a2c2e0,[]).
xc_mapping_rows(a65b1250a2c2e0,[]).
x_isa(x_IntendedTargetTypeFn,x_ReifiableFunction) :- x_cid(a65b1250a2c2e1).
xc_microtheory(a65b1250a2c2e1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2e1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2e1,529).
xc_kb_names(a65b1250a2c2e1,[]).
xc_mapping_rows(a65b1250a2c2e1,[]).
x_genls(x_BiologicalWeaponFn(x_BotulinumToxin),'x_BiologicalWeapon-BiologicalToxinBased') :- x_cid(a65b1250a2c2e2).
xc_microtheory(a65b1250a2c2e2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2e2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2e2,531).
xc_kb_names(a65b1250a2c2e2,[]).
xc_mapping_rows(a65b1250a2c2e2,[]).
x_isa(x_SulfurMustardGas,x_ProductType) :- x_cid(a65b1250a2c2e3).
xc_microtheory(a65b1250a2c2e3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2e3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2e3,534).
xc_kb_names(a65b1250a2c2e3,[]).
xc_mapping_rows(a65b1250a2c2e3,[]).
x_relationAllExists(x_physicalParts,x_AntiTankWeapon,x_Warhead) :- x_cid(a65b1250a2c2e4).
xc_microtheory(a65b1250a2c2e4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2e4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2e4,536).
xc_kb_names(a65b1250a2c2e4,[]).
xc_mapping_rows(a65b1250a2c2e4,[]).
x_comment(x_NavalMine,"A mine intended to be planted undersea.") :- x_cid(a65b1250a2c2e5).
xc_microtheory(a65b1250a2c2e5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2e5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2e5,538).
xc_kb_names(a65b1250a2c2e5,[]).
xc_mapping_rows(a65b1250a2c2e5,[]).
x_isa(x_SelectiveFireFirearm,x_ExistingObjectType) :- x_cid(a65b1250a2c2e6).
xc_microtheory(a65b1250a2c2e6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2e6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2e6,540).
xc_kb_names(a65b1250a2c2e6,[]).
xc_mapping_rows(a65b1250a2c2e6,[]).
x_genls(x_BlastGrenade,x_Bomb) :- x_cid(a65b1250a2c2e7).
xc_microtheory(a65b1250a2c2e7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2e7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2e7,542).
xc_kb_names(a65b1250a2c2e7,[]).
xc_mapping_rows(a65b1250a2c2e7,[]).
x_genls('x_BallisticMissile-M11','x_BallisticMissile-ShortRange') :- x_cid(a65b1250a2c2e8).
xc_microtheory(a65b1250a2c2e8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2e8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2e8,544).
xc_kb_names(a65b1250a2c2e8,[]).
xc_mapping_rows(a65b1250a2c2e8,[]).
x_isa('x_BallisticMissile-Minuteman1',x_ProductType) :- x_cid(a65b1250a2c2e9).
xc_microtheory(a65b1250a2c2e9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2e9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2e9,546).
xc_kb_names(a65b1250a2c2e9,[]).
xc_mapping_rows(a65b1250a2c2e9,[]).
x_implies(x_and(x_weaponEffectiveRange(V1,V2),x_maxQuantValue(V2,V3)),'x_weaponEffectiveRange-Max'(V1,V3)) :- x_cid(a65b1250a2c2ea,V1,V2,V3).
xc_microtheory(a65b1250a2c2ea,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2ea,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2ea,548).
xc_kb_names(a65b1250a2c2ea,["?WEAPON","?RANGE","?MAXRANGE"]).
xc_mapping_rows(a65b1250a2c2ea,[]).
x_arity(x_rateOfFire,2) :- x_cid(a65b1250a2c2eb).
xc_microtheory(a65b1250a2c2eb,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2eb,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2eb,554).
xc_kb_names(a65b1250a2c2eb,[]).
xc_mapping_rows(a65b1250a2c2eb,[]).
x_relationAllExists(x_physicalParts,x_ChemicalWeapon,x_ChemicalAgent) :- x_cid(a65b1250a2c2ec).
xc_microtheory(a65b1250a2c2ec,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2ec,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2ec,556).
xc_kb_names(a65b1250a2c2ec,[]).
xc_mapping_rows(a65b1250a2c2ec,[]).
x_genls(x_105MMRifledBoreCannon,x_RifledBoreWeapon) :- x_cid(a65b1250a2c2ed).
xc_microtheory(a65b1250a2c2ed,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2ed,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2ed,558).
xc_kb_names(a65b1250a2c2ed,[]).
xc_mapping_rows(a65b1250a2c2ed,[]).
x_holdsIn(x_MonthFn(x_June,x_YearFn(1965)),x_relationInstanceExistsCount(x_possesses,x_UnitedStatesOfAmerica,'x_BallisticMissile-Minuteman1',800)) :- x_cid(a65b1250a2c2ee).
xc_microtheory(a65b1250a2c2ee,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2ee,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2ee,560).
xc_kb_names(a65b1250a2c2ee,[]).
xc_mapping_rows(a65b1250a2c2ee,[]).
x_genls(x_PSChloropicrin,x_ChokingAgent) :- x_cid(a65b1250a2c2ef).
xc_microtheory(a65b1250a2c2ef,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2ef,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2ef,565).
xc_kb_names(a65b1250a2c2ef,[]).
xc_mapping_rows(a65b1250a2c2ef,[]).
x_isa('x_BallisticMissile-IntermediateRange',x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c2f0).
xc_microtheory(a65b1250a2c2f0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2f0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2f0,567).
xc_kb_names(a65b1250a2c2f0,[]).
xc_mapping_rows(a65b1250a2c2f0,[]).
x_genls(x_IncapacitatingAgent,x_ChemicalAgent) :- x_cid(a65b1250a2c2f1).
xc_microtheory(a65b1250a2c2f1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2f1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2f1,569).
xc_kb_names(a65b1250a2c2f1,[]).
xc_mapping_rows(a65b1250a2c2f1,[]).
x_isa('x_Torpedo-MK-46',x_ExistingObjectType) :- x_cid(a65b1250a2c2f2).
xc_microtheory(a65b1250a2c2f2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2f2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2f2,571).
xc_kb_names(a65b1250a2c2f2,[]).
xc_mapping_rows(a65b1250a2c2f2,[]).
x_relationAllExists(x_deviceUsed,x_ChemicalAttack,x_ChemicalWeapon) :- x_cid(a65b1250a2c2f3).
xc_microtheory(a65b1250a2c2f3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2f3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2f3,573).
xc_kb_names(a65b1250a2c2f3,[]).
xc_mapping_rows(a65b1250a2c2f3,[]).
x_argIsa(x_rotationOfLauncher,1,x_ProjectileLauncher) :- x_cid(a65b1250a2c2f4).
xc_microtheory(a65b1250a2c2f4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2f4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2f4,575).
xc_kb_names(a65b1250a2c2f4,[]).
xc_mapping_rows(a65b1250a2c2f4,[]).
x_arg2Isa('x_SKF-2834698',x_LaunchingAMissile) :- x_cid(a65b1250a2c2f5).
xc_microtheory(a65b1250a2c2f5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2f5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2f5,577).
xc_kb_names(a65b1250a2c2f5,[]).
xc_mapping_rows(a65b1250a2c2f5,[]).
x_isa(x_ChemicalWeaponFn(x_MustardGas),x_ExistingObjectType) :- x_cid(a65b1250a2c2f6).
xc_microtheory(a65b1250a2c2f6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2f6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2f6,579).
xc_kb_names(a65b1250a2c2f6,[]).
xc_mapping_rows(a65b1250a2c2f6,[]).
x_comment(x_85MMSmoothBoreCannon,"A kind of Cannon common on Tank-Vehicles.") :- x_cid(a65b1250a2c2f7).
xc_microtheory(a65b1250a2c2f7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2f7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2f7,582).
xc_kb_names(a65b1250a2c2f7,[]).
xc_mapping_rows(a65b1250a2c2f7,[]).
x_typePrimaryFunction(x_Napalm,x_CollectionSubsetFn(x_AttackOnTangible,x_TheSetOf(V1,x_and(x_isa(V2,x_IncendiaryDevice),x_deviceUsed(V1,V2)))),x_stuffUsed) :- x_cid(a65b1250a2c2f8,V1,V2).
xc_microtheory(a65b1250a2c2f8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2f8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2f8,584).
xc_kb_names(a65b1250a2c2f8,["?ATTACK","?DEVICE"]).
xc_mapping_rows(a65b1250a2c2f8,[]).
x_implies(x_and(x_isa(V1,x_BallisticMissile),x_weaponRange(V1,V2),x_quantitySubsumes(x_Mile(94,499),V2)),x_isa(V1,'x_BallisticMissile-ShortRange')) :- x_cid(a65b1250a2c2f9,V1,V2).
xc_microtheory(a65b1250a2c2f9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2f9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2f9,591).
xc_kb_names(a65b1250a2c2f9,["?MISSILE","?RANGE"]).
xc_mapping_rows(a65b1250a2c2f9,[]).
x_genls('x_MineField-AntiTank',x_MineField) :- x_cid(a65b1250a2c2fa).
xc_microtheory(a65b1250a2c2fa,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2fa,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2fa,599).
xc_kb_names(a65b1250a2c2fa,[]).
xc_mapping_rows(a65b1250a2c2fa,[]).
x_argFormat(x_intendedTargetTypeOfWeaponType,1,x_SetTheFormat) :- x_cid(a65b1250a2c2fb).
xc_microtheory(a65b1250a2c2fb,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2fb,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2fb,601).
xc_kb_names(a65b1250a2c2fb,[]).
xc_mapping_rows(a65b1250a2c2fb,[]).
x_isa(x_ClusterBomb,x_ExistingObjectType) :- x_cid(a65b1250a2c2fc).
xc_microtheory(a65b1250a2c2fc,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2fc,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2fc,603).
xc_kb_names(a65b1250a2c2fc,[]).
xc_mapping_rows(a65b1250a2c2fc,[]).
x_genls(x_BiologicalWeaponFn('x_Plague-Bacterium'),'x_BiologicalWeapon-Bacterial') :- x_cid(a65b1250a2c2fd).
xc_microtheory(a65b1250a2c2fd,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2fd,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2fd,605).
xc_kb_names(a65b1250a2c2fd,[]).
xc_mapping_rows(a65b1250a2c2fd,[]).
x_comment('x_Torpedo-MK-46',"A type of Torpedo with ActiveSonar-Device and PassiveSonar-Device to provide guidance. The Torpedo-MK-46 was designed specifically for attacking high performance Submarines and is the preferred Warhead for AntiSubmarineRockets.") :- x_cid(a65b1250a2c2fe).
xc_microtheory(a65b1250a2c2fe,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2fe,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2fe,608).
xc_kb_names(a65b1250a2c2fe,[]).
xc_mapping_rows(a65b1250a2c2fe,[]).
x_genls(x_AerialBomb,x_Bomb) :- x_cid(a65b1250a2c2ff).
xc_microtheory(a65b1250a2c2ff,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c2ff,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c2ff,610).
xc_kb_names(a65b1250a2c2ff,[]).
xc_mapping_rows(a65b1250a2c2ff,[]).
x_genls(x_125MMSmoothBoreCannon,x_SmoothBoreWeapon) :- x_cid(a65b1250a2c300).
xc_microtheory(a65b1250a2c300,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c300,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c300,612).
xc_kb_names(a65b1250a2c300,[]).
xc_mapping_rows(a65b1250a2c300,[]).
x_isa(x_weaponRange,x_BinaryPredicate) :- x_cid(a65b1250a2c301).
xc_microtheory(a65b1250a2c301,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c301,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c301,614).
xc_kb_names(a65b1250a2c301,[]).
xc_mapping_rows(a65b1250a2c301,[]).
x_conceptuallyRelated('x_MineField-AntiTank','x_MechanizedUnit-MilitarySpecialty') :- x_cid(a65b1250a2c302).
xc_microtheory(a65b1250a2c302,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c302,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c302,616).
xc_kb_names(a65b1250a2c302,[]).
xc_mapping_rows(a65b1250a2c302,[]).
x_genls(x_BoforsGun,x_MachineCannon) :- x_cid(a65b1250a2c303).
xc_microtheory(a65b1250a2c303,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c303,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c303,618).
xc_kb_names(a65b1250a2c303,[]).
xc_mapping_rows(a65b1250a2c303,[]).
x_arity(x_IntendedTargetTypeFn,1) :- x_cid(a65b1250a2c304).
xc_microtheory(a65b1250a2c304,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c304,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c304,620).
xc_kb_names(a65b1250a2c304,[]).
xc_mapping_rows(a65b1250a2c304,[]).
x_genls('x_MultipleRocketLauncherSystem-MLRS',x_MultipleRocketLauncher) :- x_cid(a65b1250a2c305).
xc_microtheory(a65b1250a2c305,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c305,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c305,622).
xc_kb_names(a65b1250a2c305,[]).
xc_mapping_rows(a65b1250a2c305,[]).
x_genls(x_BiologicalWeaponFn(x_ClostridiumPerfringens),x_BiologicalWeapon) :- x_cid(a65b1250a2c306).
xc_microtheory(a65b1250a2c306,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c306,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c306,624).
xc_kb_names(a65b1250a2c306,[]).
xc_mapping_rows(a65b1250a2c306,[]).
x_isa(x_SulfurMustardGas,x_ExistingStuffType) :- x_cid(a65b1250a2c307).
xc_microtheory(a65b1250a2c307,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c307,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c307,627).
xc_kb_names(a65b1250a2c307,[]).
xc_mapping_rows(a65b1250a2c307,[]).
x_arg2Isa(x_weaponRounds,x_PositiveInteger) :- x_cid(a65b1250a2c308).
xc_microtheory(a65b1250a2c308,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c308,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c308,629).
xc_kb_names(a65b1250a2c308,[]).
xc_mapping_rows(a65b1250a2c308,[]).
x_isa(x_TearGas,x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c309).
xc_microtheory(a65b1250a2c309,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c309,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c309,631).
xc_kb_names(a65b1250a2c309,[]).
xc_mapping_rows(a65b1250a2c309,[]).
x_isa(x_ChemicalWeaponFn(x_Soman),x_ProductType) :- x_cid(a65b1250a2c30a).
xc_microtheory(a65b1250a2c30a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c30a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c30a,633).
xc_kb_names(a65b1250a2c30a,[]).
xc_mapping_rows(a65b1250a2c30a,[]).
x_genls(x_NavalMine,'x_Mine-Weapon') :- x_cid(a65b1250a2c30b).
xc_microtheory(a65b1250a2c30b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c30b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c30b,636).
xc_kb_names(a65b1250a2c30b,[]).
xc_mapping_rows(a65b1250a2c30b,[]).
x_isa('x_BallisticMissile-M11',x_ExistingObjectType) :- x_cid(a65b1250a2c30c).
xc_microtheory(a65b1250a2c30c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c30c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c30c,638).
xc_kb_names(a65b1250a2c30c,[]).
xc_mapping_rows(a65b1250a2c30c,[]).
x_genls('x_Sidewinder-Missile',x_RocketPropelledVehicle) :- x_cid(a65b1250a2c30d).
xc_microtheory(a65b1250a2c30d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c30d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c30d,640).
xc_kb_names(a65b1250a2c30d,[]).
xc_mapping_rows(a65b1250a2c30d,[]).
x_genls(x_BlastGrenade,x_ConventionalWeapon) :- x_cid(a65b1250a2c30e).
xc_microtheory(a65b1250a2c30e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c30e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c30e,642).
xc_kb_names(a65b1250a2c30e,[]).
xc_mapping_rows(a65b1250a2c30e,[]).
x_isa(x_rateOfFire,x_BinaryPredicate) :- x_cid(a65b1250a2c30f).
xc_microtheory(a65b1250a2c30f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c30f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c30f,644).
xc_kb_names(a65b1250a2c30f,[]).
xc_mapping_rows(a65b1250a2c30f,[]).
x_implies(x_and(x_isa(V1,x_ShootingAProjectileWeapon),x_deviceUsed(V1,V2),x_distanceTranslated(V1,V3),x_isa(V4,x_Agent),x_weaponEffectiveRange(V2,V5),x_greaterThan(V5,V3)),x_successfulForAgents(V1,V4)) :- x_cid(a65b1250a2c310,V1,V2,V3,V4,V5).
xc_microtheory(a65b1250a2c310,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c310,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c310,646).
xc_kb_names(a65b1250a2c310,["?SHOOT","?GUN","?DISTANCE","?AGENT","?RANGE"]).
xc_mapping_rows(a65b1250a2c310,[]).
x_relationAllInstance(x_lengthOfObject,'x_LGM-30B-MinutemanMissile','x_Foot-UnitOfMeasure'(55.75)) :- x_cid(a65b1250a2c311).
xc_microtheory(a65b1250a2c311,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c311,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c311,656).
xc_kb_names(a65b1250a2c311,[]).
xc_mapping_rows(a65b1250a2c311,[]).
x_genls(x_ChlorineGas,x_ChokingAgent) :- x_cid(a65b1250a2c312).
xc_microtheory(a65b1250a2c312,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c312,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c312,659).
xc_kb_names(a65b1250a2c312,[]).
xc_mapping_rows(a65b1250a2c312,[]).
x_genls('x_BallisticMissile-MediumRange',x_BallisticMissile) :- x_cid(a65b1250a2c313).
xc_microtheory(a65b1250a2c313,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c313,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c313,661).
xc_kb_names(a65b1250a2c313,[]).
xc_mapping_rows(a65b1250a2c313,[]).
x_isa(x_MakingFn('x_CruiseMissile-AS7Kerry'),x_TemporalObjectType) :- x_cid(a65b1250a2c314).
xc_microtheory(a65b1250a2c314,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c314,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c314,663).
xc_kb_names(a65b1250a2c314,[]).
xc_mapping_rows(a65b1250a2c314,[]).
x_genls(x_FullyAutomaticFirearm,x_Gun) :- x_cid(a65b1250a2c315).
xc_microtheory(a65b1250a2c315,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c315,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c315,666).
xc_kb_names(a65b1250a2c315,[]).
xc_mapping_rows(a65b1250a2c315,[]).
x_genls(x_ChemicalWeaponFn(x_Soman),x_ChemicalWeapon) :- x_cid(a65b1250a2c316).
xc_microtheory(a65b1250a2c316,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c316,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c316,668).
xc_kb_names(a65b1250a2c316,[]).
xc_mapping_rows(a65b1250a2c316,[]).
x_genls(x_MakingFn(x_ChemicalWeapon),x_MakingFn(x_WeaponOfMassDestruction)) :- x_cid(a65b1250a2c317).
xc_microtheory(a65b1250a2c317,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c317,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c317,671).
xc_kb_names(a65b1250a2c317,[]).
xc_mapping_rows(a65b1250a2c317,[]).
x_argIsa(x_reloadTime,1,x_ProjectileLauncher) :- x_cid(a65b1250a2c318).
xc_microtheory(a65b1250a2c318,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c318,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c318,675).
xc_kb_names(a65b1250a2c318,[]).
xc_mapping_rows(a65b1250a2c318,[]).
x_arg1Isa('x_SKF-2834698',x_AntiSubmarineRocket) :- x_cid(a65b1250a2c319).
xc_microtheory(a65b1250a2c319,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c319,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c319,677).
xc_kb_names(a65b1250a2c319,[]).
xc_mapping_rows(a65b1250a2c319,[]).
x_genls(x_ChemicalWeaponFn(x_MustardGas),x_ChemicalWeapon) :- x_cid(a65b1250a2c31a).
xc_microtheory(a65b1250a2c31a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c31a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c31a,679).
xc_kb_names(a65b1250a2c31a,[]).
xc_mapping_rows(a65b1250a2c31a,[]).
x_implies(x_and(x_isa(V1,x_BallisticMissile),x_weaponRange(V1,V2),x_quantitySubsumes(x_Mile(0,94),V2)),x_isa(V1,'x_BallisticMissile-BattlefieldShortRange')) :- x_cid(a65b1250a2c31b,V1,V2).
xc_microtheory(a65b1250a2c31b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c31b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c31b,682).
xc_kb_names(a65b1250a2c31b,["?MISSILE","?RANGE"]).
xc_mapping_rows(a65b1250a2c31b,[]).
x_isa('x_weaponEffectiveRange-Min',x_FunctionalPredicate) :- x_cid(a65b1250a2c31c).
xc_microtheory(a65b1250a2c31c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c31c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c31c,690).
xc_kb_names(a65b1250a2c31c,[]).
xc_mapping_rows(a65b1250a2c31c,[]).
x_arg1Format(x_intendedTargetTypeOfWeaponType,x_SetTheFormat) :- x_cid(a65b1250a2c31d).
xc_microtheory(a65b1250a2c31d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c31d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c31d,692).
xc_kb_names(a65b1250a2c31d,[]).
xc_mapping_rows(a65b1250a2c31d,[]).
x_relationAllExists(x_physicalParts,x_BiologicalWeapon,x_BiologicalAgent) :- x_cid(a65b1250a2c31e).
xc_microtheory(a65b1250a2c31e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c31e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c31e,694).
xc_kb_names(a65b1250a2c31e,[]).
xc_mapping_rows(a65b1250a2c31e,[]).
x_isa(x_BiologicalWeaponFn(x_BrucellaBacterium),x_ExistingObjectType) :- x_cid(a65b1250a2c31f).
xc_microtheory(a65b1250a2c31f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c31f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c31f,696).
xc_kb_names(a65b1250a2c31f,[]).
xc_mapping_rows(a65b1250a2c31f,[]).
x_comment('x_MineField-AntiTankWithGap',"Collection of instances of MineField characterized as being intended to impede progress of mechanized or tracked units, but with an intentionally inbuilt gap for purposes of canalization. See Canalize-MilitaryTask.") :- x_cid(a65b1250a2c320).
xc_microtheory(a65b1250a2c320,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c320,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c320,699).
xc_kb_names(a65b1250a2c320,[]).
xc_mapping_rows(a65b1250a2c320,[]).
x_isa(x_IntendedTargetTypeFn,x_UnaryFunction) :- x_cid(a65b1250a2c321).
xc_microtheory(a65b1250a2c321,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c321,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c321,701).
xc_kb_names(a65b1250a2c321,[]).
xc_mapping_rows(a65b1250a2c321,[]).
x_isa('x_MultipleRocketLauncherSystem-MLRS',x_ExistingObjectType) :- x_cid(a65b1250a2c322).
xc_microtheory(a65b1250a2c322,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c322,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c322,703).
xc_kb_names(a65b1250a2c322,[]).
xc_mapping_rows(a65b1250a2c322,[]).
x_isa(x_BiologicalWeaponFn(x_ClostridiumPerfringens),x_ExistingObjectType) :- x_cid(a65b1250a2c323).
xc_microtheory(a65b1250a2c323,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c323,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c323,705).
xc_kb_names(a65b1250a2c323,[]).
xc_mapping_rows(a65b1250a2c323,[]).
x_arg1Isa(x_weaponRounds,x_Gun) :- x_cid(a65b1250a2c324).
xc_microtheory(a65b1250a2c324,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c324,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c324,708).
xc_kb_names(a65b1250a2c324,[]).
xc_mapping_rows(a65b1250a2c324,[]).
x_comment(x_76MMRifledBoreCannon,"A kind of Cannon common on Tank-Vehicles.") :- x_cid(a65b1250a2c325).
xc_microtheory(a65b1250a2c325,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c325,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c325,710).
xc_kb_names(a65b1250a2c325,[]).
xc_mapping_rows(a65b1250a2c325,[]).
x_isa(x_ChemicalWeaponFn(x_Sarin),x_ProductType) :- x_cid(a65b1250a2c326).
xc_microtheory(a65b1250a2c326,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c326,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c326,712).
xc_kb_names(a65b1250a2c326,[]).
xc_mapping_rows(a65b1250a2c326,[]).
x_isa(x_NavalMine,x_ExistingObjectType) :- x_cid(a65b1250a2c327).
xc_microtheory(a65b1250a2c327,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c327,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c327,715).
xc_kb_names(a65b1250a2c327,[]).
xc_mapping_rows(a65b1250a2c327,[]).
x_comment('x_BallisticMissile-SCUDC',"A short range ballistic missile produced in North Korea.") :- x_cid(a65b1250a2c328).
xc_microtheory(a65b1250a2c328,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c328,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c328,717).
xc_kb_names(a65b1250a2c328,[]).
xc_mapping_rows(a65b1250a2c328,[]).
x_genls(x_FragmentationGrenade,x_Bomb) :- x_cid(a65b1250a2c329).
xc_microtheory(a65b1250a2c329,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c329,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c329,719).
xc_kb_names(a65b1250a2c329,[]).
xc_mapping_rows(a65b1250a2c329,[]).
x_comment('x_BiologicalWeapon-GeneticallyEngineeredVirusBased',"The collection of all BiologicalWeapons that make use of GeneticallyEngineeredViralPathogens.") :- x_cid(a65b1250a2c32a).
xc_microtheory(a65b1250a2c32a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c32a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c32a,721).
xc_kb_names(a65b1250a2c32a,[]).
xc_mapping_rows(a65b1250a2c32a,[]).
x_genls(x_MachinePistol,'x_MachineGun-Portable') :- x_cid(a65b1250a2c32b).
xc_microtheory(a65b1250a2c32b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c32b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c32b,723).
xc_kb_names(a65b1250a2c32b,[]).
xc_mapping_rows(a65b1250a2c32b,[]).
x_comment('x_weaponEffectiveRange-Max',"(weaponEffectiveRange-Max WEAPON RANGE) means that RANGE is the maximum range at which the projectile weapon WEAPON is considered to be 'effective', ie, capable of doing significant damage to a target. Every projectile weapon has a maximum effective range, at least in the terrestrial frame of reference. Some also have a minimum effective range--see weaponEffectiveRange-Min. Where it is desireable to have both the minimum and maximum effective range referenced in the same GAF, use weaponEffectiveRange. Also, weaponEffectiveRange-Max should be distinguished from weaponRange, which cites the maximum distance a projectile weapon can travel. This is often much greater than the weaponEffectiveRange-Max.") :- x_cid(a65b1250a2c32c).
xc_microtheory(a65b1250a2c32c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c32c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c32c,725).
xc_kb_names(a65b1250a2c32c,[]).
xc_mapping_rows(a65b1250a2c32c,[]).
x_isa(x_MakingFn('x_BallisticMissile-SCUDC'),x_TemporalObjectType) :- x_cid(a65b1250a2c32d).
xc_microtheory(a65b1250a2c32d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c32d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c32d,727).
xc_kb_names(a65b1250a2c32d,[]).
xc_mapping_rows(a65b1250a2c32d,[]).
x_isa(x_rateOfFire,x_FunctionalPredicate) :- x_cid(a65b1250a2c32e).
xc_microtheory(a65b1250a2c32e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c32e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c32e,730).
xc_kb_names(a65b1250a2c32e,[]).
xc_mapping_rows(a65b1250a2c32e,[]).
x_genls(x_BiologicalWeaponFn(x_Batrachotoxin),'x_BiologicalWeapon-BiologicalToxinBased') :- x_cid(a65b1250a2c32f).
xc_microtheory(a65b1250a2c32f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c32f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c32f,732).
xc_kb_names(a65b1250a2c32f,[]).
xc_mapping_rows(a65b1250a2c32f,[]).
x_isa(x_USMilitaryChemicalProtectiveMask,x_ProductType) :- x_cid(a65b1250a2c330).
xc_microtheory(a65b1250a2c330,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c330,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c330,735).
xc_kb_names(a65b1250a2c330,[]).
xc_mapping_rows(a65b1250a2c330,[]).
x_comment('x_LGM-30B-MinutemanMissile',"The collection of all LGM-30B-MinutemanMissiles, the second (and last) type of BallisticMissile-Minuteman1.") :- x_cid(a65b1250a2c331).
xc_microtheory(a65b1250a2c331,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c331,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c331,737).
xc_kb_names(a65b1250a2c331,[]).
xc_mapping_rows(a65b1250a2c331,[]).
x_isa('x_BallisticMissile-MediumRange',x_ExistingObjectType) :- x_cid(a65b1250a2c332).
xc_microtheory(a65b1250a2c332,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c332,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c332,739).
xc_kb_names(a65b1250a2c332,[]).
xc_mapping_rows(a65b1250a2c332,[]).
x_comment(x_ProximityDetonatingWeapon,"The collection of ExplosiveDevices whose instances detonate when something gets within a certain range of the device.") :- x_cid(a65b1250a2c333).
xc_microtheory(a65b1250a2c333,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c333,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c333,741).
xc_kb_names(a65b1250a2c333,[]).
xc_mapping_rows(a65b1250a2c333,[]).
x_isa(x_ChemicalWeaponFn(x_Soman),x_ExistingObjectType) :- x_cid(a65b1250a2c334).
xc_microtheory(a65b1250a2c334,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c334,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c334,743).
xc_kb_names(a65b1250a2c334,[]).
xc_mapping_rows(a65b1250a2c334,[]).
x_argIsa('x_weaponEffectiveRange-Max',1,x_ProjectileWeapon) :- x_cid(a65b1250a2c335).
xc_microtheory(a65b1250a2c335,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c335,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c335,746).
xc_kb_names(a65b1250a2c335,[]).
xc_mapping_rows(a65b1250a2c335,[]).
x_resultIsa('x_SKF-2834698',x_Torpedo) :- x_cid(a65b1250a2c336).
xc_microtheory(a65b1250a2c336,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c336,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c336,748).
xc_kb_names(a65b1250a2c336,[]).
xc_mapping_rows(a65b1250a2c336,[]).
x_genls('x_MachineGun-Portable',x_FullyAutomaticFirearm) :- x_cid(a65b1250a2c337).
xc_microtheory(a65b1250a2c337,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c337,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c337,750).
xc_kb_names(a65b1250a2c337,[]).
xc_mapping_rows(a65b1250a2c337,[]).
x_arity('x_weaponEffectiveRange-Min',2) :- x_cid(a65b1250a2c338).
xc_microtheory(a65b1250a2c338,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c338,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c338,752).
xc_kb_names(a65b1250a2c338,[]).
xc_mapping_rows(a65b1250a2c338,[]).
x_isa('x_MineField-AntiTank',x_ExistingStuffType) :- x_cid(a65b1250a2c339).
xc_microtheory(a65b1250a2c339,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c339,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c339,754).
xc_kb_names(a65b1250a2c339,[]).
xc_mapping_rows(a65b1250a2c339,[]).
x_argGenl(x_intendedTargetTypeOfWeaponType,1,x_Weapon) :- x_cid(a65b1250a2c33a).
xc_microtheory(a65b1250a2c33a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c33a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c33a,756).
xc_kb_names(a65b1250a2c33a,[]).
xc_mapping_rows(a65b1250a2c33a,[]).
x_isa(x_BiologicalWeaponFn('x_Plague-Bacterium'),x_ExistingObjectType) :- x_cid(a65b1250a2c33b).
xc_microtheory(a65b1250a2c33b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c33b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c33b,758).
xc_kb_names(a65b1250a2c33b,[]).
xc_mapping_rows(a65b1250a2c33b,[]).
x_genls(x_GeneticallyEngineeredBacterialPathogen,x_GeneticallyEngineeredPathogen) :- x_cid(a65b1250a2c33c).
xc_microtheory(a65b1250a2c33c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c33c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c33c,761).
xc_kb_names(a65b1250a2c33c,[]).
xc_mapping_rows(a65b1250a2c33c,[]).
x_conceptuallyRelated('x_MineField-AntiTankWithGap','x_Tank-Vehicle') :- x_cid(a65b1250a2c33d).
xc_microtheory(a65b1250a2c33d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c33d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c33d,763).
xc_kb_names(a65b1250a2c33d,[]).
xc_mapping_rows(a65b1250a2c33d,[]).
x_intendedTargetTypeOfWeaponType(x_AntiWeaponTypeFn(V1),V1) :- x_cid(a65b1250a2c33e,V1).
xc_microtheory(a65b1250a2c33e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c33e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c33e,765).
xc_kb_names(a65b1250a2c33e,["?TARGETTYPE"]).
xc_mapping_rows(a65b1250a2c33e,[]).
x_implies(x_and(x_isa(V1,x_DirectFireWeapon),x_deviceUsed(V2,V1),x_isa(V2,x_ShootingAProjectileWeapon),x_target(V2,V3),x_objectMoving(V2,V4),x_successfulForAgents(V2,V5),x_distanceBetween(V1,V3,V6)),x_distanceTranslated(V2,V6)) :- x_cid(a65b1250a2c33f,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1250a2c33f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c33f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c33f,768).
xc_kb_names(a65b1250a2c33f,["?GUN","?SHOOT","?TARGET","?BULLET","?AGENT","?DISTANCE"]).
xc_mapping_rows(a65b1250a2c33f,[]).
x_comment(x_weaponRounds,"The number of Bullets that can be fired consecutively without reloading. For most MachineGuns this is a large number > 100, whereas for most Pistols it is somewhere between 1 and 6.") :- x_cid(a65b1250a2c340).
xc_microtheory(a65b1250a2c340,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c340,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c340,779).
xc_kb_names(a65b1250a2c340,[]).
xc_mapping_rows(a65b1250a2c340,[]).
x_isa(x_TridentBallisticMissile,x_ProductType) :- x_cid(a65b1250a2c341).
xc_microtheory(a65b1250a2c341,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c341,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c341,781).
xc_kb_names(a65b1250a2c341,[]).
xc_mapping_rows(a65b1250a2c341,[]).
x_siblingDisjointExceptions('x_BiologicalWeapon-GeneticallyEngineeredOrganismBased','x_BiologicalWeapon-Fungal') :- x_cid(a65b1250a2c342).
xc_microtheory(a65b1250a2c342,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c342,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c342,783).
xc_kb_names(a65b1250a2c342,[]).
xc_mapping_rows(a65b1250a2c342,[]).
x_isa('x_weaponPayload-Max',x_FunctionalPredicate) :- x_cid(a65b1250a2c343).
xc_microtheory(a65b1250a2c343,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c343,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c343,785).
xc_kb_names(a65b1250a2c343,[]).
xc_mapping_rows(a65b1250a2c343,[]).
x_genls('x_BallisticMissile-SCUDC','x_BallisticMissile-ShortRange') :- x_cid(a65b1250a2c344).
xc_microtheory(a65b1250a2c344,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c344,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c344,787).
xc_kb_names(a65b1250a2c344,[]).
xc_mapping_rows(a65b1250a2c344,[]).
x_genls(x_FragmentationGrenade,x_ConventionalWeapon) :- x_cid(a65b1250a2c345).
xc_microtheory(a65b1250a2c345,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c345,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c345,789).
xc_kb_names(a65b1250a2c345,[]).
xc_mapping_rows(a65b1250a2c345,[]).
x_genls('x_BiologicalWeapon-GeneticallyEngineeredVirusBased','x_BiologicalWeapon-Viral') :- x_cid(a65b1250a2c346).
xc_microtheory(a65b1250a2c346,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c346,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c346,791).
xc_kb_names(a65b1250a2c346,[]).
xc_mapping_rows(a65b1250a2c346,[]).
x_genls(x_AntiSubmarineRocket,x_Missile) :- x_cid(a65b1250a2c347).
xc_microtheory(a65b1250a2c347,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c347,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c347,793).
xc_kb_names(a65b1250a2c347,[]).
xc_mapping_rows(a65b1250a2c347,[]).
x_arg1Isa('x_weaponEffectiveRange-Max',x_ProjectileWeapon) :- x_cid(a65b1250a2c348).
xc_microtheory(a65b1250a2c348,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c348,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c348,795).
xc_kb_names(a65b1250a2c348,[]).
xc_mapping_rows(a65b1250a2c348,[]).
x_genls(x_MakingFn('x_BallisticMissile-SCUDC'),x_MakingSomething) :- x_cid(a65b1250a2c349).
xc_microtheory(a65b1250a2c349,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c349,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c349,797).
xc_kb_names(a65b1250a2c349,[]).
xc_mapping_rows(a65b1250a2c349,[]).
x_genls(x_BiologicalWeaponFn(x_Batrachotoxin),x_BiologicalWeapon) :- x_cid(a65b1250a2c34a).
xc_microtheory(a65b1250a2c34a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c34a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c34a,800).
xc_kb_names(a65b1250a2c34a,[]).
xc_mapping_rows(a65b1250a2c34a,[]).
x_comment(x_GeneticallyEngineeredViralPathogen,"The collection of all instances of Virus that have been genetically engineered for use in BiologicalWeapons.") :- x_cid(a65b1250a2c34b).
xc_microtheory(a65b1250a2c34b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c34b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c34b,803).
xc_kb_names(a65b1250a2c34b,[]).
xc_mapping_rows(a65b1250a2c34b,[]).
x_genls(x_AssaultRifle,x_SelectiveFireFirearm) :- x_cid(a65b1250a2c34c).
xc_microtheory(a65b1250a2c34c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c34c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c34c,805).
xc_kb_names(a65b1250a2c34c,[]).
xc_mapping_rows(a65b1250a2c34c,[]).
x_relationAllInstance(x_lengthOfObject,'x_LGM-30B-MinutemanMissile','x_Foot-UnitOfMeasure'(54)) :- x_cid(a65b1250a2c34d).
xc_microtheory(a65b1250a2c34d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c34d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c34d,807).
xc_kb_names(a65b1250a2c34d,[]).
xc_mapping_rows(a65b1250a2c34d,[]).
x_isa('x_BallisticMissile-MediumRange',x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c34e).
xc_microtheory(a65b1250a2c34e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c34e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c34e,810).
xc_kb_names(a65b1250a2c34e,[]).
xc_mapping_rows(a65b1250a2c34e,[]).
x_isa(x_MakingFn(x_BiologicalWeaponFn('x_Anthrax-Bacterium')),x_Collection) :- x_cid(a65b1250a2c34f).
xc_microtheory(a65b1250a2c34f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c34f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c34f,812).
xc_kb_names(a65b1250a2c34f,[]).
xc_mapping_rows(a65b1250a2c34f,[]).
x_genls(x_ProximityDetonatingWeapon,x_Weapon) :- x_cid(a65b1250a2c350).
xc_microtheory(a65b1250a2c350,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c350,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c350,816).
xc_kb_names(a65b1250a2c350,[]).
xc_mapping_rows(a65b1250a2c350,[]).
x_genls(x_LaserGuidedBomb,'x_Device-RemoteControlled') :- x_cid(a65b1250a2c351).
xc_microtheory(a65b1250a2c351,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c351,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c351,818).
xc_kb_names(a65b1250a2c351,[]).
xc_mapping_rows(a65b1250a2c351,[]).
x_comment('x_weaponPayload-Max',"(weaponPayload-Max ?WEAP ?MASS) means that the weapon ?WEAP can carry ?MASS amount of explosive charge.") :- x_cid(a65b1250a2c352).
xc_microtheory(a65b1250a2c352,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c352,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c352,820).
xc_kb_names(a65b1250a2c352,[]).
xc_mapping_rows(a65b1250a2c352,[]).
x_argIsa('x_weaponEffectiveRange-Min',1,x_ProjectileWeapon) :- x_cid(a65b1250a2c353).
xc_microtheory(a65b1250a2c353,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c353,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c353,822).
xc_kb_names(a65b1250a2c353,[]).
xc_mapping_rows(a65b1250a2c353,[]).
x_arity('x_SKF-2834698',3) :- x_cid(a65b1250a2c354).
xc_microtheory(a65b1250a2c354,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c354,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c354,824).
xc_kb_names(a65b1250a2c354,[]).
xc_mapping_rows(a65b1250a2c354,[]).
x_disjointWith(x_BlastGrenade,x_FragmentationGrenade) :- x_cid(a65b1250a2c355).
xc_microtheory(a65b1250a2c355,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c355,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c355,826).
xc_kb_names(a65b1250a2c355,[]).
xc_mapping_rows(a65b1250a2c355,[]).
x_isa('x_weaponEffectiveRange-Min',x_BinaryPredicate) :- x_cid(a65b1250a2c356).
xc_microtheory(a65b1250a2c356,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c356,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c356,828).
xc_kb_names(a65b1250a2c356,[]).
xc_mapping_rows(a65b1250a2c356,[]).
x_genls('x_MineField-AntiPersonnel',x_MineField) :- x_cid(a65b1250a2c357).
xc_microtheory(a65b1250a2c357,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c357,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c357,830).
xc_kb_names(a65b1250a2c357,[]).
xc_mapping_rows(a65b1250a2c357,[]).
x_arg1Genl(x_intendedTargetTypeOfWeaponType,x_Weapon) :- x_cid(a65b1250a2c358).
xc_microtheory(a65b1250a2c358,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c358,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c358,832).
xc_kb_names(a65b1250a2c358,[]).
xc_mapping_rows(a65b1250a2c358,[]).
'x_sourceOfTerm-Person'('x_MultipleRocketLauncher-122mmMRL',x_Rasch) :- x_cid(a65b1250a2c359).
xc_microtheory(a65b1250a2c359,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c359,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c359,834).
xc_kb_names(a65b1250a2c359,[]).
xc_mapping_rows(a65b1250a2c359,[]).
x_isa(x_AntiArmorGrenade,x_ExistingObjectType) :- x_cid(a65b1250a2c35a).
xc_microtheory(a65b1250a2c35a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c35a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c35a,836).
xc_kb_names(a65b1250a2c35a,[]).
xc_mapping_rows(a65b1250a2c35a,[]).
x_genls('x_BiologicalWeapon-Fungal',x_BiologicalWeapon) :- x_cid(a65b1250a2c35b).
xc_microtheory(a65b1250a2c35b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c35b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c35b,838).
xc_kb_names(a65b1250a2c35b,[]).
xc_mapping_rows(a65b1250a2c35b,[]).
x_conceptuallyRelated('x_MineField-AntiTank','x_Tank-Vehicle') :- x_cid(a65b1250a2c35c).
xc_microtheory(a65b1250a2c35c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c35c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c35c,840).
xc_kb_names(a65b1250a2c35c,[]).
xc_mapping_rows(a65b1250a2c35c,[]).
x_relationAllExists(x_physicalParts,x_WeaponSystem,x_Weapon) :- x_cid(a65b1250a2c35d).
xc_microtheory(a65b1250a2c35d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c35d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c35d,842).
xc_kb_names(a65b1250a2c35d,[]).
xc_mapping_rows(a65b1250a2c35d,[]).
x_comment(x_weaponRange,"The maximum distance that a ProjectileWeapon can travel in a ShootingAProjectileWeapon event. This is something different than the weaponEffectiveRange that is never greater than weaponRange, but often quite a lot smaller. For IndirectFireWeapons the weaponRange is not the length of the trajectory it follows, but rather the maximum direct distance between the Gun and the place of impact of the ProjectileWeapon.") :- x_cid(a65b1250a2c35e).
xc_microtheory(a65b1250a2c35e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c35e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c35e,844).
xc_kb_names(a65b1250a2c35e,[]).
xc_mapping_rows(a65b1250a2c35e,[]).
x_intendedTargetTypeOfWeaponType(x_AntiArmorWeapon,x_ArmoredVehicle) :- x_cid(a65b1250a2c35f).
xc_microtheory(a65b1250a2c35f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c35f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c35f,846).
xc_kb_names(a65b1250a2c35f,[]).
xc_mapping_rows(a65b1250a2c35f,[]).
x_isa(x_BiologicalWeaponFn(x_RicinToxin),x_ExistingObjectType) :- x_cid(a65b1250a2c360).
xc_microtheory(a65b1250a2c360,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c360,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c360,848).
xc_kb_names(a65b1250a2c360,[]).
xc_mapping_rows(a65b1250a2c360,[]).
x_arg2Isa('x_weaponEffectiveRange-Max',x_PositiveScalarInterval) :- x_cid(a65b1250a2c361).
xc_microtheory(a65b1250a2c361,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c361,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c361,851).
xc_kb_names(a65b1250a2c361,[]).
xc_mapping_rows(a65b1250a2c361,[]).
x_implies(x_and(x_weaponRange(V1,V2),x_weaponEffectiveRange(V1,V3)),x_greaterThan(V2,V3)) :- x_cid(a65b1250a2c362,V1,V2,V3).
xc_microtheory(a65b1250a2c362,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c362,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c362,853).
xc_kb_names(a65b1250a2c362,["?WEAPON","?RANGE","?RANGE-EFFECTIVE"]).
xc_mapping_rows(a65b1250a2c362,[]).
x_genls(x_76MMRifledBoreCannon,x_RifledBoreWeapon) :- x_cid(a65b1250a2c363).
xc_microtheory(a65b1250a2c363,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c363,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c363,859).
xc_kb_names(a65b1250a2c363,[]).
xc_mapping_rows(a65b1250a2c363,[]).
x_genls(x_125MMSmoothBoreCannon,x_FieldArtillery) :- x_cid(a65b1250a2c364).
xc_microtheory(a65b1250a2c364,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c364,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c364,861).
xc_kb_names(a65b1250a2c364,[]).
xc_mapping_rows(a65b1250a2c364,[]).
x_isa(x_MortarShell,x_ExistingObjectType) :- x_cid(a65b1250a2c365).
xc_microtheory(a65b1250a2c365,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c365,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c365,863).
xc_kb_names(a65b1250a2c365,[]).
xc_mapping_rows(a65b1250a2c365,[]).
x_genls(x_TridentBallisticMissile,'x_BallisticMissile-SubmarineLaunched') :- x_cid(a65b1250a2c366).
xc_microtheory(a65b1250a2c366,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c366,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c366,865).
xc_kb_names(a65b1250a2c366,[]).
xc_mapping_rows(a65b1250a2c366,[]).
x_siblingDisjointExceptions('x_BiologicalWeapon-GeneticallyEngineeredOrganismBased','x_BiologicalWeapon-Bacterial') :- x_cid(a65b1250a2c367).
xc_microtheory(a65b1250a2c367,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c367,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c367,867).
xc_kb_names(a65b1250a2c367,[]).
xc_mapping_rows(a65b1250a2c367,[]).
x_arity('x_weaponPayload-Max',2) :- x_cid(a65b1250a2c368).
xc_microtheory(a65b1250a2c368,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c368,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c368,869).
xc_kb_names(a65b1250a2c368,[]).
xc_mapping_rows(a65b1250a2c368,[]).
x_comment('x_BallisticMissile-SCUDB',"A short range ballistic missile produced in North Korea.") :- x_cid(a65b1250a2c369).
xc_microtheory(a65b1250a2c369,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c369,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c369,871).
xc_kb_names(a65b1250a2c369,[]).
xc_mapping_rows(a65b1250a2c369,[]).
x_genls(x_RifleGrenade,x_Bomb) :- x_cid(a65b1250a2c36a).
xc_microtheory(a65b1250a2c36a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c36a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c36a,873).
xc_kb_names(a65b1250a2c36a,[]).
xc_mapping_rows(a65b1250a2c36a,[]).
x_genls('x_BiologicalWeapon-GeneticallyEngineeredVirusBased','x_BiologicalWeapon-GeneticallyEngineeredOrganismBased') :- x_cid(a65b1250a2c36b).
xc_microtheory(a65b1250a2c36b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c36b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c36b,875).
xc_kb_names(a65b1250a2c36b,[]).
xc_mapping_rows(a65b1250a2c36b,[]).
x_comment(x_IntendedTargetTypeFn,"(IntendedTargetTypeFn ?WEAPONTYPE) returns the intended primary target type that instances of ?WEAPONTYPE are designed to act against, assuming this can be defined. In cases where it cannot be defined, the function is undefined. This is the functional counterpart of intendedTargetTypeOfWeaponType.") :- x_cid(a65b1250a2c36c).
xc_microtheory(a65b1250a2c36c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c36c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c36c,877).
xc_kb_names(a65b1250a2c36c,[]).
xc_mapping_rows(a65b1250a2c36c,[]).
x_isa(x_BiologicalWeaponFn(x_Batrachotoxin),x_ExistingObjectType) :- x_cid(a65b1250a2c36d).
xc_microtheory(a65b1250a2c36d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c36d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c36d,879).
xc_kb_names(a65b1250a2c36d,[]).
xc_mapping_rows(a65b1250a2c36d,[]).
x_relationAllExists(x_physicalParts,x_NuclearWarhead,x_NuclearBomb) :- x_cid(a65b1250a2c36e).
xc_microtheory(a65b1250a2c36e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c36e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c36e,882).
xc_kb_names(a65b1250a2c36e,[]).
xc_mapping_rows(a65b1250a2c36e,[]).
x_implies(x_and(x_isa(V1,x_GainingUserRights),x_objectOfPossessionTransfer(V1,V2),x_toPossessor(V1,V3),x_isa(V2,V4),x_genls(V4,x_BiologicalAgent)),x_increasesCausally(V1,x_thereExists(V5,x_and(x_isa(V5,x_WeaponOfMassDestruction),x_possesses(V3,V5))),x_likelihood)) :- x_cid(a65b1250a2c36f,V1,V2,V3,V4,V5).
xc_microtheory(a65b1250a2c36f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c36f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c36f,884).
xc_kb_names(a65b1250a2c36f,["?ACQUIRE","?BIO-AGENT","?AGENT","?BIO-AGENT-TYPE","?WMD"]).
xc_mapping_rows(a65b1250a2c36f,['exists-thereexists']).
x_comment(x_reloadTime,"(reloadTime GUN TIME) indicates the time it takes to load GUN after it has been fired. This predicate can also be used for MissileLaunchers that must be loaded before launching another Missile. In case of Guns that contain more Bullets the reloadTime is the time it takes to reload the gun when it is empty. ") :- x_cid(a65b1250a2c370).
xc_microtheory(a65b1250a2c370,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c370,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c370,898).
xc_kb_names(a65b1250a2c370,[]).
xc_mapping_rows(a65b1250a2c370,[]).
x_relationInstanceExistsCount(x_possesses,x_Japan,x_NuclearWeapon,0) :- x_cid(a65b1250a2c371).
xc_microtheory(a65b1250a2c371,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c371,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c371,900).
xc_kb_names(a65b1250a2c371,[]).
xc_mapping_rows(a65b1250a2c371,[]).
x_genls('x_CruiseMissile-AS7Kerry',x_AirToSurfaceMissile) :- x_cid(a65b1250a2c372).
xc_microtheory(a65b1250a2c372,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c372,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c372,902).
xc_kb_names(a65b1250a2c372,[]).
xc_mapping_rows(a65b1250a2c372,[]).
x_implies(x_relationInstanceExists(x_possesses,V1,x_NuclearWeapon),x_resourceCapableOf(V1,x_NuclearAttack,x_doneBy)) :- x_cid(a65b1250a2c373,V1).
xc_microtheory(a65b1250a2c373,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c373,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c373,904).
xc_kb_names(a65b1250a2c373,["?AGENT"]).
xc_mapping_rows(a65b1250a2c373,[]).
x_genls(x_BiologicalWeaponFn(x_Aflatoxin),'x_BiologicalWeapon-BiologicalToxinBased') :- x_cid(a65b1250a2c374).
xc_microtheory(a65b1250a2c374,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c374,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c374,908).
xc_kb_names(a65b1250a2c374,[]).
xc_mapping_rows(a65b1250a2c374,[]).
x_genls(x_ProximityDetonatingWeapon,x_ExplosiveDevice) :- x_cid(a65b1250a2c375).
xc_microtheory(a65b1250a2c375,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c375,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c375,911).
xc_kb_names(a65b1250a2c375,[]).
xc_mapping_rows(a65b1250a2c375,[]).
x_implies(x_and(x_genls(V1,x_MilitaryWeapon),x_isa(V2,V1),x_capableOf(V3,x_CollectionSubsetFn(x_AttackOnTangible,x_TheSetOf(V4,'x_instrument-Generic'(V4,V2))),x_performedBy)),x_relationInstanceExistsMany(x_possesses,V3,V1)) :- x_cid(a65b1250a2c376,V1,V2,V3,V4).
xc_microtheory(a65b1250a2c376,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c376,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c376,913).
xc_kb_names(a65b1250a2c376,["?WEAPONTYPE","?WEAPON","?AGENT","?OBJ"]).
xc_mapping_rows(a65b1250a2c376,[]).
x_isa(x_LaserGuidedBomb,x_ExistingObjectType) :- x_cid(a65b1250a2c377).
xc_microtheory(a65b1250a2c377,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c377,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c377,923).
xc_kb_names(a65b1250a2c377,[]).
xc_mapping_rows(a65b1250a2c377,[]).
x_comment(x_MachineCannon,"The collection of Cannons which can fire continuously.") :- x_cid(a65b1250a2c378).
xc_microtheory(a65b1250a2c378,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c378,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c378,925).
xc_kb_names(a65b1250a2c378,[]).
xc_mapping_rows(a65b1250a2c378,[]).
x_arg2Isa('x_weaponPayload-Max',x_Mass) :- x_cid(a65b1250a2c379).
xc_microtheory(a65b1250a2c379,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c379,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c379,927).
xc_kb_names(a65b1250a2c379,[]).
xc_mapping_rows(a65b1250a2c379,[]).
x_disjointWith(x_DirectFireWeapon,x_IndirectFireWeapon) :- x_cid(a65b1250a2c37a).
xc_microtheory(a65b1250a2c37a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c37a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c37a,929).
xc_kb_names(a65b1250a2c37a,[]).
xc_mapping_rows(a65b1250a2c37a,[]).
x_argIsa('x_weaponPayload-Max',1,x_ProjectileWeapon) :- x_cid(a65b1250a2c37b).
xc_microtheory(a65b1250a2c37b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c37b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c37b,931).
xc_kb_names(a65b1250a2c37b,[]).
xc_mapping_rows(a65b1250a2c37b,[]).
x_implies(x_and(x_isa(V1,x_WeaponOfMassDestructionAttack),x_maleficiary(V1,V2),x_isa(V2,x_Country)),x_holdsIn(x_STIF(V1),x_economicStability(x_EconomyFn(x_PlanetEarth),x_Low))) :- x_cid(a65b1250a2c37c,V1,V2).
xc_microtheory(a65b1250a2c37c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c37c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c37c,933).
xc_kb_names(a65b1250a2c37c,["?ATTACK","?VICTIM"]).
xc_mapping_rows(a65b1250a2c37c,[]).
x_isa('x_SKF-2834698',x_FixedAritySkolemFuncN) :- x_cid(a65b1250a2c37d).
xc_microtheory(a65b1250a2c37d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c37d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c37d,943).
xc_kb_names(a65b1250a2c37d,[]).
xc_mapping_rows(a65b1250a2c37d,[]).
x_implies(x_and(x_isa(V1,x_ShootingAProjectileWeapon),x_damages(V1,V2),x_fromLocation(V1,V3),'x_instrument-Generic'(V1,V3),x_deviceUsed(V1,V4),'x_weaponEffectiveRange-Max'(V4,V5),x_distanceBetween(V2,V3,V6)),x_greaterThan(V5,V6)) :- x_cid(a65b1250a2c37e,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1250a2c37e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c37e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c37e,945).
xc_kb_names(a65b1250a2c37e,["?SHOOTING","?TARGET","?LAUNCHER","?WEAPON","?MAXRANGE","?DIST"]).
xc_mapping_rows(a65b1250a2c37e,[]).
x_isa(x_DepthBomb,x_ExistingObjectType) :- x_cid(a65b1250a2c37f).
xc_microtheory(a65b1250a2c37f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c37f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c37f,956).
xc_kb_names(a65b1250a2c37f,[]).
xc_mapping_rows(a65b1250a2c37f,[]).
x_argIsa(x_intendedTargetTypeOfWeaponType,1,x_Collection) :- x_cid(a65b1250a2c380).
xc_microtheory(a65b1250a2c380,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c380,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c380,958).
xc_kb_names(a65b1250a2c380,[]).
xc_mapping_rows(a65b1250a2c380,[]).
x_comment('x_MultipleRocketLauncher-122mmMRL',"The collection of 122mm multiple rocket launchers. The MRL is a Soviet-made, truck mounted rocket launcher, similar to the American Multiple Launch Rocket system (MLRS), but much older.") :- x_cid(a65b1250a2c381).
xc_microtheory(a65b1250a2c381,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c381,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c381,960).
xc_kb_names(a65b1250a2c381,[]).
xc_mapping_rows(a65b1250a2c381,[]).
x_isa(x_GeneticallyEngineeredBacterialPathogen,x_ExistingObjectType) :- x_cid(a65b1250a2c382).
xc_microtheory(a65b1250a2c382,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c382,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c382,962).
xc_kb_names(a65b1250a2c382,[]).
xc_mapping_rows(a65b1250a2c382,[]).
x_genls(x_FieldArtillery,x_IndirectFireWeapon) :- x_cid(a65b1250a2c383).
xc_microtheory(a65b1250a2c383,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c383,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c383,964).
xc_kb_names(a65b1250a2c383,[]).
xc_mapping_rows(a65b1250a2c383,[]).
x_genls(x_MilitaryAircraft,'x_Platform-Military') :- x_cid(a65b1250a2c384).
xc_microtheory(a65b1250a2c384,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c384,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c384,966).
xc_kb_names(a65b1250a2c384,[]).
xc_mapping_rows(a65b1250a2c384,[]).
x_isa('x_BiologicalWeapon-Fungal',x_BiologicalWeaponTypeByAgent) :- x_cid(a65b1250a2c385).
xc_microtheory(a65b1250a2c385,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c385,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c385,968).
xc_kb_names(a65b1250a2c385,[]).
xc_mapping_rows(a65b1250a2c385,[]).
x_isa(x_125MMSmoothBoreCannon,x_ExistingObjectType) :- x_cid(a65b1250a2c386).
xc_microtheory(a65b1250a2c386,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c386,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c386,970).
xc_kb_names(a65b1250a2c386,[]).
xc_mapping_rows(a65b1250a2c386,[]).
x_comment('x_MineField-AntiTank',"Collection of instances of MineField designed to impede the progress of mechanized or tracked units.") :- x_cid(a65b1250a2c387).
xc_microtheory(a65b1250a2c387,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c387,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c387,972).
xc_kb_names(a65b1250a2c387,[]).
xc_mapping_rows(a65b1250a2c387,[]).
x_comment(x_weaponEffectiveRange,"The effective range of ProjectileWeapon. This range indicates the range within which, if you aim at something you will be likely to hit it. Unlike weaponRange that gives values for the maximum distance, weaponEffectiveRange is a minimum and a maximum. Depending on the type of weapon this may be the minimum and maximum height at which a flying AirTransportationDevice can be effectively hit by a SurfaceToAirMissile. ") :- x_cid(a65b1250a2c388).
xc_microtheory(a65b1250a2c388,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c388,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c388,974).
xc_kb_names(a65b1250a2c388,[]).
xc_mapping_rows(a65b1250a2c388,[]).
x_isa(x_BiologicalWeaponFn(x_BotulinumToxin),x_ExistingObjectType) :- x_cid(a65b1250a2c389).
xc_microtheory(a65b1250a2c389,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c389,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c389,976).
xc_kb_names(a65b1250a2c389,[]).
xc_mapping_rows(a65b1250a2c389,[]).
x_arg1Isa(x_weaponEffectiveRange,x_ProjectileWeapon) :- x_cid(a65b1250a2c38a).
xc_microtheory(a65b1250a2c38a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c38a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c38a,979).
xc_kb_names(a65b1250a2c38a,[]).
xc_mapping_rows(a65b1250a2c38a,[]).
x_isa(x_76MMRifledBoreCannon,x_ExistingObjectType) :- x_cid(a65b1250a2c38b).
xc_microtheory(a65b1250a2c38b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c38b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c38b,981).
xc_kb_names(a65b1250a2c38b,[]).
xc_mapping_rows(a65b1250a2c38b,[]).
x_isa(x_TridentBallisticMissile,x_ExistingObjectType) :- x_cid(a65b1250a2c38c).
xc_microtheory(a65b1250a2c38c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c38c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c38c,983).
xc_kb_names(a65b1250a2c38c,[]).
xc_mapping_rows(a65b1250a2c38c,[]).
x_comment('x_BiologicalWeapon-GeneticallyEngineeredOrganismBased',"The collection of all BiologicalWeapons that make use of genetically engineered BiologicalAgents. In general, any spec of BiologicalWeapon-GeneticallyEngineeredOrganismBased will be a spec of some other instance of BiologicalWeaponTypeByAgent.") :- x_cid(a65b1250a2c38d).
xc_microtheory(a65b1250a2c38d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c38d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c38d,985).
xc_kb_names(a65b1250a2c38d,[]).
xc_mapping_rows(a65b1250a2c38d,[]).
x_isa('x_weaponPayload-Max',x_BinaryPredicate) :- x_cid(a65b1250a2c38e).
xc_microtheory(a65b1250a2c38e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c38e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c38e,987).
xc_kb_names(a65b1250a2c38e,[]).
xc_mapping_rows(a65b1250a2c38e,[]).
x_genls(x_Bazooka,'x_SmallArm-Weapon') :- x_cid(a65b1250a2c38f).
xc_microtheory(a65b1250a2c38f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c38f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c38f,989).
xc_kb_names(a65b1250a2c38f,[]).
xc_mapping_rows(a65b1250a2c38f,[]).
x_genls('x_BallisticMissile-SCUDB','x_BallisticMissile-ShortRange') :- x_cid(a65b1250a2c390).
xc_microtheory(a65b1250a2c390,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c390,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c390,991).
xc_kb_names(a65b1250a2c390,[]).
xc_mapping_rows(a65b1250a2c390,[]).
x_genls(x_RifleGrenade,x_ConventionalWeapon) :- x_cid(a65b1250a2c391).
xc_microtheory(a65b1250a2c391,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c391,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c391,993).
xc_kb_names(a65b1250a2c391,[]).
xc_mapping_rows(a65b1250a2c391,[]).
x_comment('x_BallisticMissile-Minuteman1',"The collection of all Minuteman I missiles. The Minuteman I was an early type of MinutemanBallisticMissile developed by the U.S. during the early 1960's.") :- x_cid(a65b1250a2c392).
xc_microtheory(a65b1250a2c392,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c392,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c392,995).
xc_kb_names(a65b1250a2c392,[]).
xc_mapping_rows(a65b1250a2c392,[]).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_deviceUsed(V1,V2),x_isa(V2,x_ProjectileWeapon)),x_isa(V1,x_ShootingAProjectileWeapon)) :- x_cid(a65b1250a2c393,V1,V2).
xc_microtheory(a65b1250a2c393,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c393,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c393,997).
xc_kb_names(a65b1250a2c393,["?ATTACK","?WEAPON"]).
xc_mapping_rows(a65b1250a2c393,[]).
x_genls('x_LGM-30B-MinutemanMissile','x_BallisticMissile-Minuteman1') :- x_cid(a65b1250a2c394).
xc_microtheory(a65b1250a2c394,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c394,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c394,1004).
xc_kb_names(a65b1250a2c394,[]).
xc_mapping_rows(a65b1250a2c394,[]).
x_isa('x_CruiseMissile-AS7Kerry',x_ExistingObjectType) :- x_cid(a65b1250a2c395).
xc_microtheory(a65b1250a2c395,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c395,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c395,1006).
xc_kb_names(a65b1250a2c395,[]).
xc_mapping_rows(a65b1250a2c395,[]).
x_isa(x_BiologicalWeaponFn(x_Aflatoxin),x_ExistingObjectType) :- x_cid(a65b1250a2c396).
xc_microtheory(a65b1250a2c396,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c396,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c396,1008).
xc_kb_names(a65b1250a2c396,[]).
xc_mapping_rows(a65b1250a2c396,[]).
x_isa(x_ProximityDetonatingWeapon,x_ExistingObjectType) :- x_cid(a65b1250a2c397).
xc_microtheory(a65b1250a2c397,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c397,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c397,1011).
xc_kb_names(a65b1250a2c397,[]).
xc_mapping_rows(a65b1250a2c397,[]).
x_arg1Isa('x_weaponPayload-Max',x_ProjectileWeapon) :- x_cid(a65b1250a2c398).
xc_microtheory(a65b1250a2c398,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c398,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c398,1013).
xc_kb_names(a65b1250a2c398,[]).
xc_mapping_rows(a65b1250a2c398,[]).
x_comment(x_Bazooka,"The collection of shoulder-held MissileLaunchers that fire Missiles which are RocketPropelledVehicles and AntiArmorWeapons.") :- x_cid(a65b1250a2c399).
xc_microtheory(a65b1250a2c399,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c399,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c399,1015).
xc_kb_names(a65b1250a2c399,[]).
xc_mapping_rows(a65b1250a2c399,[]).
x_isa('x_MineField-AntiPersonnel',x_ExistingStuffType) :- x_cid(a65b1250a2c39a).
xc_microtheory(a65b1250a2c39a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c39a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c39a,1017).
xc_kb_names(a65b1250a2c39a,[]).
xc_mapping_rows(a65b1250a2c39a,[]).
x_arg1Isa(x_intendedTargetTypeOfWeaponType,x_Collection) :- x_cid(a65b1250a2c39b).
xc_microtheory(a65b1250a2c39b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c39b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c39b,1019).
xc_kb_names(a65b1250a2c39b,[]).
xc_mapping_rows(a65b1250a2c39b,[]).
x_genls('x_MultipleRocketLauncher-122mmMRL',x_MultipleRocketLauncher) :- x_cid(a65b1250a2c39c).
xc_microtheory(a65b1250a2c39c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c39c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c39c,1021).
xc_kb_names(a65b1250a2c39c,[]).
xc_mapping_rows(a65b1250a2c39c,[]).
x_comment('x_BiologicalWeapon-Bacterial',"The collection of all bacterial-based BiologicalWeapons.") :- x_cid(a65b1250a2c39d).
xc_microtheory(a65b1250a2c39d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c39d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c39d,1023).
xc_kb_names(a65b1250a2c39d,[]).
xc_mapping_rows(a65b1250a2c39d,[]).
x_comment(x_TOWMissile,"A subset of GuidedMissiles. TOW stands for 'tube-launched, optically-tracked, wire-guided.' These missiles can be launched from tripods, vehicles such as Humvees and tanks, and helicopters. TOWMissiles are capable of piercing the armor of any 1990's tank.") :- x_cid(a65b1250a2c39e).
xc_microtheory(a65b1250a2c39e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c39e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c39e,1025).
xc_kb_names(a65b1250a2c39e,[]).
xc_mapping_rows(a65b1250a2c39e,[]).
x_comment('x_MineField-AntiPersonnel',"A collection of instances of MineField that are specifically designed and intended to attrit enemy forces by inflicting casualties on enemy personnel.") :- x_cid(a65b1250a2c39f).
xc_microtheory(a65b1250a2c39f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c39f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c39f,1027).
xc_kb_names(a65b1250a2c39f,[]).
xc_mapping_rows(a65b1250a2c39f,[]).
x_intendedTargetTypeOfWeaponType(x_AntiRadarMissile,'x_RADAR-Device') :- x_cid(a65b1250a2c3a0).
xc_microtheory(a65b1250a2c3a0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3a0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3a0,1029).
xc_kb_names(a65b1250a2c3a0,[]).
xc_mapping_rows(a65b1250a2c3a0,[]).
x_genls('x_MachineGun-Portable','x_Gun-Portable') :- x_cid(a65b1250a2c3a1).
xc_microtheory(a65b1250a2c3a1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3a1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3a1,1031).
xc_kb_names(a65b1250a2c3a1,[]).
xc_mapping_rows(a65b1250a2c3a1,[]).
x_implies(x_and(x_isa(V1,x_ShootingAProjectileWeapon),x_deviceUsed(V1,V2),x_distanceTranslated(V1,V3),x_objectMoving(V1,V4),x_weaponRange(V2,V5)),x_greaterThan(V5,V3)) :- x_cid(a65b1250a2c3a2,V1,V2,V3,V4,V5).
xc_microtheory(a65b1250a2c3a2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3a2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3a2,1033).
xc_kb_names(a65b1250a2c3a2,["?SHOOT","?GUN","?DISTANCE","?BULLET","?RANGE"]).
xc_mapping_rows(a65b1250a2c3a2,[]).
x_comment(x_TridentBallisticMissile,"The collection of all BallisticMissiles designed for use on TridentClassSubmarines.") :- x_cid(a65b1250a2c3a3).
xc_microtheory(a65b1250a2c3a3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3a3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3a3,1042).
xc_kb_names(a65b1250a2c3a3,[]).
xc_mapping_rows(a65b1250a2c3a3,[]).
x_siblingDisjointExceptions('x_BiologicalWeapon-Viral','x_BiologicalWeapon-GeneticallyEngineeredOrganismBased') :- x_cid(a65b1250a2c3a4).
xc_microtheory(a65b1250a2c3a4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3a4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3a4,1044).
xc_kb_names(a65b1250a2c3a4,[]).
xc_mapping_rows(a65b1250a2c3a4,[]).
x_isa(x_weaponRounds,x_FunctionalPredicate) :- x_cid(a65b1250a2c3a5).
xc_microtheory(a65b1250a2c3a5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3a5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3a5,1046).
xc_kb_names(a65b1250a2c3a5,[]).
xc_mapping_rows(a65b1250a2c3a5,[]).
x_implies(x_and(x_isa(V1,x_MilitaryNuclearWeaponsProgram),x_directingAgent(V1,V2)),x_purposeInEvent(V2,V1,x_thereExists(V3,x_and(x_isa(V3,x_MakingFn(x_NuclearWeapon)),x_directingAgent(V3,V2))))) :- x_cid(a65b1250a2c3a6,V1,V2,V3).
xc_microtheory(a65b1250a2c3a6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3a6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3a6,1048).
xc_kb_names(a65b1250a2c3a6,["?PROGRAM","?AGENT","?MAKING"]).
xc_mapping_rows(a65b1250a2c3a6,['exists-thereexists']).
x_comment('x_BallisticMissile-CSS8',"A short range ballistic missile produced in China.") :- x_cid(a65b1250a2c3a7).
xc_microtheory(a65b1250a2c3a7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3a7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3a7,1060).
xc_kb_names(a65b1250a2c3a7,[]).
xc_mapping_rows(a65b1250a2c3a7,[]).
x_genls('x_BallisticMissile-Minuteman1',x_MinutemanBallisticMissile) :- x_cid(a65b1250a2c3a8).
xc_microtheory(a65b1250a2c3a8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3a8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3a8,1062).
xc_kb_names(a65b1250a2c3a8,[]).
xc_mapping_rows(a65b1250a2c3a8,[]).
x_isa('x_LGM-30B-MinutemanMissile',x_ProductType) :- x_cid(a65b1250a2c3a9).
xc_microtheory(a65b1250a2c3a9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3a9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3a9,1064).
xc_kb_names(a65b1250a2c3a9,[]).
xc_mapping_rows(a65b1250a2c3a9,[]).
x_arg2Isa(x_reloadTime,x_TimeInterval) :- x_cid(a65b1250a2c3aa).
xc_microtheory(a65b1250a2c3aa,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3aa,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3aa,1066).
xc_kb_names(a65b1250a2c3aa,[]).
xc_mapping_rows(a65b1250a2c3aa,[]).
x_genls(x_Aflatoxin,x_BiologicalToxin) :- x_cid(a65b1250a2c3ab).
xc_microtheory(a65b1250a2c3ab,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3ab,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3ab,1068).
xc_kb_names(a65b1250a2c3ab,[]).
xc_mapping_rows(a65b1250a2c3ab,[]).
x_comment(x_PressureSensitiveDetonatingWeapon,"The collection of ExplosiveDevices that contain pressure-sensitive sensors to control detonation.") :- x_cid(a65b1250a2c3ac).
xc_microtheory(a65b1250a2c3ac,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3ac,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3ac,1070).
xc_kb_names(a65b1250a2c3ac,[]).
xc_mapping_rows(a65b1250a2c3ac,[]).
x_genls(x_AntiTankWeapon,x_MilitaryWeapon) :- x_cid(a65b1250a2c3ad).
xc_microtheory(a65b1250a2c3ad,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3ad,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3ad,1072).
xc_kb_names(a65b1250a2c3ad,[]).
xc_mapping_rows(a65b1250a2c3ad,[]).
x_isa(x_MachineCannon,x_ExistingObjectType) :- x_cid(a65b1250a2c3ae).
xc_microtheory(a65b1250a2c3ae,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3ae,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3ae,1074).
xc_kb_names(a65b1250a2c3ae,[]).
xc_mapping_rows(a65b1250a2c3ae,[]).
x_relationAllInstance(x_lengthOfObject,'x_BallisticMissile-Minuteman3','x_Foot-UnitOfMeasure'(59.75)) :- x_cid(a65b1250a2c3af).
xc_microtheory(a65b1250a2c3af,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3af,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3af,1076).
xc_kb_names(a65b1250a2c3af,[]).
xc_mapping_rows(a65b1250a2c3af,[]).
x_genls(x_SelectiveFireFirearm,x_Gun) :- x_cid(a65b1250a2c3b0).
xc_microtheory(a65b1250a2c3b0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3b0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3b0,1079).
xc_kb_names(a65b1250a2c3b0,[]).
xc_mapping_rows(a65b1250a2c3b0,[]).
x_relationAllInstance(x_weaponRange,x_AntiSubmarineRocket,x_Mile(5.6)) :- x_cid(a65b1250a2c3b1).
xc_microtheory(a65b1250a2c3b1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3b1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3b1,1081).
xc_kb_names(a65b1250a2c3b1,[]).
xc_mapping_rows(a65b1250a2c3b1,[]).
x_genls('x_BallisticMissile-BattlefieldShortRange',x_BallisticMissile) :- x_cid(a65b1250a2c3b2).
xc_microtheory(a65b1250a2c3b2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3b2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3b2,1084).
xc_kb_names(a65b1250a2c3b2,[]).
xc_mapping_rows(a65b1250a2c3b2,[]).
x_comment(x_TerminalGuidedProjectile,"The collection of PhysicalDevices which have guidance systems in use during the terminal phase of the flight. Subsets include some types of AirToSurfaceMissiles and SurfaceToSurfaceMissiles.") :- x_cid(a65b1250a2c3b3).
xc_microtheory(a65b1250a2c3b3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3b3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3b3,1086).
xc_kb_names(a65b1250a2c3b3,[]).
xc_mapping_rows(a65b1250a2c3b3,[]).
x_isa('x_MultipleRocketLauncher-122mmMRL',x_ExistingObjectType) :- x_cid(a65b1250a2c3b4).
xc_microtheory(a65b1250a2c3b4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3b4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3b4,1088).
xc_kb_names(a65b1250a2c3b4,[]).
xc_mapping_rows(a65b1250a2c3b4,[]).
x_isa(x_Napalm,x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c3b5).
xc_microtheory(a65b1250a2c3b5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3b5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3b5,1090).
xc_kb_names(a65b1250a2c3b5,[]).
xc_mapping_rows(a65b1250a2c3b5,[]).
x_genls(x_TOWMissile,x_RocketPropelledVehicle) :- x_cid(a65b1250a2c3b6).
xc_microtheory(a65b1250a2c3b6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3b6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3b6,1092).
xc_kb_names(a65b1250a2c3b6,[]).
xc_mapping_rows(a65b1250a2c3b6,[]).
x_intendedTargetTypeOfWeaponType(x_AntiTankWeapon,'x_Tank-Vehicle') :- x_cid(a65b1250a2c3b7).
xc_microtheory(a65b1250a2c3b7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3b7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3b7,1094).
xc_kb_names(a65b1250a2c3b7,[]).
xc_mapping_rows(a65b1250a2c3b7,[]).
x_genls(x_RicinToxin,x_BiologicalAgent) :- x_cid(a65b1250a2c3b8).
xc_microtheory(a65b1250a2c3b8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3b8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3b8,1096).
xc_kb_names(a65b1250a2c3b8,[]).
xc_mapping_rows(a65b1250a2c3b8,[]).
x_isa(x_NitrogenMustardGas,x_ExistingStuffType) :- x_cid(a65b1250a2c3b9).
xc_microtheory(a65b1250a2c3b9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3b9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3b9,1098).
xc_kb_names(a65b1250a2c3b9,[]).
xc_mapping_rows(a65b1250a2c3b9,[]).
x_comment('x_MatraMica-AirToAirMissile',"A kind of AirToAirMissile currently (2000) used by France (who designed it) as well as Taiwan-RepublicOfChina.") :- x_cid(a65b1250a2c3ba).
xc_microtheory(a65b1250a2c3ba,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3ba,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3ba,1100).
xc_kb_names(a65b1250a2c3ba,[]).
xc_mapping_rows(a65b1250a2c3ba,[]).
x_isa(x_ArtilleryShell,x_ExistingObjectType) :- x_cid(a65b1250a2c3bb).
xc_microtheory(a65b1250a2c3bb,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3bb,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3bb,1102).
xc_kb_names(a65b1250a2c3bb,[]).
xc_mapping_rows(a65b1250a2c3bb,[]).
x_comment(x_BiologicalWeaponTypeByAgent,"A collection of collections. Instances of BiologicalWeaponTypeByAgent are collections of BiologicalWeapons, arranged according to the BiologicalAgent used in their instances.") :- x_cid(a65b1250a2c3bc).
xc_microtheory(a65b1250a2c3bc,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3bc,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3bc,1104).
xc_kb_names(a65b1250a2c3bc,[]).
xc_mapping_rows(a65b1250a2c3bc,[]).
x_arity(x_weaponRounds,2) :- x_cid(a65b1250a2c3bd).
xc_microtheory(a65b1250a2c3bd,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3bd,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3bd,1106).
xc_kb_names(a65b1250a2c3bd,[]).
xc_mapping_rows(a65b1250a2c3bd,[]).
x_genls('x_BallisticMissile-CSS8','x_BallisticMissile-ShortRange') :- x_cid(a65b1250a2c3be).
xc_microtheory(a65b1250a2c3be,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3be,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3be,1108).
xc_kb_names(a65b1250a2c3be,[]).
xc_mapping_rows(a65b1250a2c3be,[]).
x_isa('x_BallisticMissile-Minuteman1',x_ExistingObjectType) :- x_cid(a65b1250a2c3bf).
xc_microtheory(a65b1250a2c3bf,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3bf,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3bf,1110).
xc_kb_names(a65b1250a2c3bf,[]).
xc_mapping_rows(a65b1250a2c3bf,[]).
x_conceptuallyRelated('x_BiologicalWeapon-GeneticallyEngineeredVirusBased',x_GeneticEngineering) :- x_cid(a65b1250a2c3c0).
xc_microtheory(a65b1250a2c3c0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3c0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3c0,1112).
xc_kb_names(a65b1250a2c3c0,[]).
xc_mapping_rows(a65b1250a2c3c0,[]).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),x_bodilyActedOn(V1,V2),x_maleficiary(V1,V2),'x_instrument-Generic'(V1,V3),x_isa(V3,x_BiologicalAgent)),x_isa(V2,x_BiologicalLivingObject)) :- x_cid(a65b1250a2c3c1,V1,V2,V3).
xc_microtheory(a65b1250a2c3c1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3c1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3c1,1114).
xc_kb_names(a65b1250a2c3c1,["?BIO-ATTACK","?BLO","?BW"]).
xc_mapping_rows(a65b1250a2c3c1,[]).
x_genls(x_GeneticallyEngineeredViralPathogen,x_GeneticallyEngineeredVirus) :- x_cid(a65b1250a2c3c2).
xc_microtheory(a65b1250a2c3c2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3c2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3c2,1123).
xc_kb_names(a65b1250a2c3c2,[]).
xc_mapping_rows(a65b1250a2c3c2,[]).
x_isa('x_LGM-30B-MinutemanMissile',x_ExistingObjectType) :- x_cid(a65b1250a2c3c3).
xc_microtheory(a65b1250a2c3c3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3c3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3c3,1125).
xc_kb_names(a65b1250a2c3c3,[]).
xc_mapping_rows(a65b1250a2c3c3,[]).
x_genls('x_Mine-Weapon',x_ConventionalWeapon) :- x_cid(a65b1250a2c3c4).
xc_microtheory(a65b1250a2c3c4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3c4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3c4,1127).
xc_kb_names(a65b1250a2c3c4,[]).
xc_mapping_rows(a65b1250a2c3c4,[]).
x_arg1Isa(x_reloadTime,x_ProjectileLauncher) :- x_cid(a65b1250a2c3c5).
xc_microtheory(a65b1250a2c3c5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3c5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3c5,1129).
xc_kb_names(a65b1250a2c3c5,[]).
xc_mapping_rows(a65b1250a2c3c5,[]).
x_isa(x_MakingFn('x_CruiseMissile-AS7Kerry'),x_Collection) :- x_cid(a65b1250a2c3c6).
xc_microtheory(a65b1250a2c3c6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3c6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3c6,1131).
xc_kb_names(a65b1250a2c3c6,[]).
xc_mapping_rows(a65b1250a2c3c6,[]).
x_genls(x_AntiArmorWeapon,x_MilitaryWeapon) :- x_cid(a65b1250a2c3c7).
xc_microtheory(a65b1250a2c3c7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3c7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3c7,1134).
xc_kb_names(a65b1250a2c3c7,[]).
xc_mapping_rows(a65b1250a2c3c7,[]).
x_isa('x_BallisticMissile-Minuteman3',x_ProductType) :- x_cid(a65b1250a2c3c8).
xc_microtheory(a65b1250a2c3c8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3c8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3c8,1136).
xc_kb_names(a65b1250a2c3c8,[]).
xc_mapping_rows(a65b1250a2c3c8,[]).
x_genls(x_Staphylococcus,x_EmeticAgent) :- x_cid(a65b1250a2c3c9).
xc_microtheory(a65b1250a2c3c9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3c9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3c9,1138).
xc_kb_names(a65b1250a2c3c9,[]).
xc_mapping_rows(a65b1250a2c3c9,[]).
x_comment('x_Howitzer-122mmSelfPropelled',"The collection of self-propelled 122mm Howitzers.") :- x_cid(a65b1250a2c3ca).
xc_microtheory(a65b1250a2c3ca,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3ca,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3ca,1140).
xc_kb_names(a65b1250a2c3ca,[]).
xc_mapping_rows(a65b1250a2c3ca,[]).
x_genls(x_MachineCannon,x_FieldArtillery) :- x_cid(a65b1250a2c3cb).
xc_microtheory(a65b1250a2c3cb,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3cb,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3cb,1142).
xc_kb_names(a65b1250a2c3cb,[]).
xc_mapping_rows(a65b1250a2c3cb,[]).
x_sourceOfTerm('x_InfantryFightingVehicle-BMP-2','x_ST100-7Mt') :- x_cid(a65b1250a2c3cc).
xc_microtheory(a65b1250a2c3cc,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3cc,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3cc,1144).
xc_kb_names(a65b1250a2c3cc,[]).
xc_mapping_rows(a65b1250a2c3cc,[]).
x_isa(x_IndustryFn(x_ChemicalWeapon),x_IndustryOrEconomicSectorType) :- x_cid(a65b1250a2c3cd).
xc_microtheory(a65b1250a2c3cd,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3cd,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3cd,1146).
xc_kb_names(a65b1250a2c3cd,[]).
xc_mapping_rows(a65b1250a2c3cd,[]).
x_genls(x_GroupFn('x_BallisticMissile-Mushak120'),x_Group) :- x_cid(a65b1250a2c3ce).
xc_microtheory(a65b1250a2c3ce,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3ce,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3ce,1149).
xc_kb_names(a65b1250a2c3ce,[]).
xc_mapping_rows(a65b1250a2c3ce,[]).
x_implies(x_and(x_isa(V1,x_BiologicalWeaponTypeByAgent),x_different(V1,V2),x_isa(V2,x_BiologicalWeaponTypeByAgent),x_relationAllInstance(x_weaponBasisObjectType,V1,V3),x_relationAllInstance(x_weaponBasisObjectType,V2,V4)),x_different(V3,V4)) :- x_cid(a65b1250a2c3cf,V1,V2,V3,V4).
xc_microtheory(a65b1250a2c3cf,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3cf,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3cf,1152).
xc_kb_names(a65b1250a2c3cf,["?WEAPONTYPE1","?WEAPONTYPE2","?TYPE1","?TYPE2"]).
xc_mapping_rows(a65b1250a2c3cf,[]).
x_isa(x_intendedTargetTypeOfWeaponType,x_FunctionalPredicate) :- x_cid(a65b1250a2c3d0).
xc_microtheory(a65b1250a2c3d0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3d0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3d0,1161).
xc_kb_names(a65b1250a2c3d0,[]).
xc_mapping_rows(a65b1250a2c3d0,[]).
x_isa(x_AntiSubmarineRocket,x_ExistingObjectType) :- x_cid(a65b1250a2c3d1).
xc_microtheory(a65b1250a2c3d1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3d1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3d1,1163).
xc_kb_names(a65b1250a2c3d1,[]).
xc_mapping_rows(a65b1250a2c3d1,[]).
x_isa(x_IncendiaryDevice,x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c3d2).
xc_microtheory(a65b1250a2c3d2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3d2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3d2,1165).
xc_kb_names(a65b1250a2c3d2,[]).
xc_mapping_rows(a65b1250a2c3d2,[]).
x_intendedTargetTypeOfWeaponType(x_AntiShipMissile,x_Ship) :- x_cid(a65b1250a2c3d3).
xc_microtheory(a65b1250a2c3d3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3d3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3d3,1167).
xc_kb_names(a65b1250a2c3d3,[]).
xc_mapping_rows(a65b1250a2c3d3,[]).
x_argIsa(x_weaponRange,2,x_Distance) :- x_cid(a65b1250a2c3d4).
xc_microtheory(a65b1250a2c3d4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3d4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3d4,1169).
xc_kb_names(a65b1250a2c3d4,[]).
xc_mapping_rows(a65b1250a2c3d4,[]).
x_isa('x_MachineGun-Portable',x_ExistingObjectType) :- x_cid(a65b1250a2c3d5).
xc_microtheory(a65b1250a2c3d5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3d5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3d5,1171).
xc_kb_names(a65b1250a2c3d5,[]).
xc_mapping_rows(a65b1250a2c3d5,[]).
x_genls(x_BotulinumToxin,x_BiologicalAgent) :- x_cid(a65b1250a2c3d6).
xc_microtheory(a65b1250a2c3d6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3d6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3d6,1173).
xc_kb_names(a65b1250a2c3d6,[]).
xc_mapping_rows(a65b1250a2c3d6,[]).
x_genls(x_NitrogenMustardGas,x_MustardGas) :- x_cid(a65b1250a2c3d7).
xc_microtheory(a65b1250a2c3d7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3d7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3d7,1175).
xc_kb_names(a65b1250a2c3d7,[]).
xc_mapping_rows(a65b1250a2c3d7,[]).
x_genls('x_SurfaceToSurfaceMissile-Ballistic',x_BallisticMissile) :- x_cid(a65b1250a2c3d8).
xc_microtheory(a65b1250a2c3d8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3d8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3d8,1177).
xc_kb_names(a65b1250a2c3d8,[]).
xc_mapping_rows(a65b1250a2c3d8,[]).
x_genls(x_105MMRifledBoreCannon,x_FieldArtillery) :- x_cid(a65b1250a2c3d9).
xc_microtheory(a65b1250a2c3d9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3d9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3d9,1179).
xc_kb_names(a65b1250a2c3d9,[]).
xc_mapping_rows(a65b1250a2c3d9,[]).
x_comment('x_ObstacleSystem-Military',"A structured system of artifacts intended to play the collective role of constrainingObject in a non-trivial subset of the collection of Movement-TranslationEvents such that the objectMoving is an instance of ModernMilitaryUnit-Deployable. Collections of instances of ObstacleSystem-Military designed to impede the movements of certain kinds of military unit can be referenced via MilitarySpecialtyObstacleFn: collections where the type is intended to impede the performance of certain tasks can be referenced via MilitaryTaskObstacleFn.") :- x_cid(a65b1250a2c3da).
xc_microtheory(a65b1250a2c3da,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3da,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3da,1181).
xc_kb_names(a65b1250a2c3da,[]).
xc_mapping_rows(a65b1250a2c3da,[]).
x_isa(x_weaponRounds,x_BinaryPredicate) :- x_cid(a65b1250a2c3db).
xc_microtheory(a65b1250a2c3db,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3db,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3db,1183).
xc_kb_names(a65b1250a2c3db,[]).
xc_mapping_rows(a65b1250a2c3db,[]).
x_isa(x_SemiAutomaticFirearm,x_ExistingObjectType) :- x_cid(a65b1250a2c3dc).
xc_microtheory(a65b1250a2c3dc,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3dc,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3dc,1185).
xc_kb_names(a65b1250a2c3dc,[]).
xc_mapping_rows(a65b1250a2c3dc,[]).
x_isa('x_BallisticMissile-CSS8',x_ExistingObjectType) :- x_cid(a65b1250a2c3dd).
xc_microtheory(a65b1250a2c3dd,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3dd,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3dd,1187).
xc_kb_names(a65b1250a2c3dd,[]).
xc_mapping_rows(a65b1250a2c3dd,[]).
x_conceptuallyRelated('x_BiologicalWeapon-GeneticallyEngineeredOrganismBased',x_GeneticEngineering) :- x_cid(a65b1250a2c3de).
xc_microtheory(a65b1250a2c3de,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3de,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3de,1189).
xc_kb_names(a65b1250a2c3de,[]).
xc_mapping_rows(a65b1250a2c3de,[]).
x_implies(x_and(x_isa(V1,x_Person),x_maleficiary(V2,V1),x_isa(V2,x_BiologicalAttack),x_deviceUsed(V2,V3),x_isa(V3,'x_BiologicalWeapon-Rickettsial')),x_relationExistsInstance(x_maleficiary,x_Rickettsiosis,V1)) :- x_cid(a65b1250a2c3df,V1,V2,V3).
xc_microtheory(a65b1250a2c3df,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3df,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3df,1191).
xc_kb_names(a65b1250a2c3df,["?VICTIM","?ATTACK","?WEAPON"]).
xc_mapping_rows(a65b1250a2c3df,[]).
x_comment(x_Batrachotoxin,"Batrachotoxin is a toxin produced by certain species of Frogs.") :- x_cid(a65b1250a2c3e0).
xc_microtheory(a65b1250a2c3e0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3e0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3e0,1200).
xc_kb_names(a65b1250a2c3e0,[]).
xc_mapping_rows(a65b1250a2c3e0,[]).
x_implies(x_and(x_genls(V1,x_MilitaryWeapon),x_isa(V2,V1),'x_instrument-Generic'(V3,V2),x_isa(V3,x_AttackOnTangible),x_capableOfDoing(V4,V3,x_performedBy)),x_relationInstanceExistsMany(x_possesses,V4,V1)) :- x_cid(a65b1250a2c3e1,V1,V2,V3,V4).
xc_microtheory(a65b1250a2c3e1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3e1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3e1,1202).
xc_kb_names(a65b1250a2c3e1,["?WEAPONTYPE","?WEAPON","?ATTACK","?AGENT"]).
xc_mapping_rows(a65b1250a2c3e1,[]).
x_genls(x_GeneticallyEngineeredViralPathogen,x_GeneticallyEngineeredPathogen) :- x_cid(a65b1250a2c3e2).
xc_microtheory(a65b1250a2c3e2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3e2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3e2,1211).
xc_kb_names(a65b1250a2c3e2,[]).
xc_mapping_rows(a65b1250a2c3e2,[]).
x_isa(x_105MMRifledBoreCannon,x_ExistingObjectType) :- x_cid(a65b1250a2c3e3).
xc_microtheory(a65b1250a2c3e3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3e3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3e3,1213).
xc_kb_names(a65b1250a2c3e3,[]).
xc_mapping_rows(a65b1250a2c3e3,[]).
x_genls(x_Gun,x_ConventionalWeapon) :- x_cid(a65b1250a2c3e4).
xc_microtheory(a65b1250a2c3e4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3e4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3e4,1215).
xc_kb_names(a65b1250a2c3e4,[]).
xc_mapping_rows(a65b1250a2c3e4,[]).
x_arity(x_reloadTime,2) :- x_cid(a65b1250a2c3e5).
xc_microtheory(a65b1250a2c3e5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3e5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3e5,1217).
xc_kb_names(a65b1250a2c3e5,[]).
xc_mapping_rows(a65b1250a2c3e5,[]).
x_argIsa(x_weaponRounds,2,x_PositiveInteger) :- x_cid(a65b1250a2c3e6).
xc_microtheory(a65b1250a2c3e6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3e6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3e6,1219).
xc_kb_names(a65b1250a2c3e6,[]).
xc_mapping_rows(a65b1250a2c3e6,[]).
x_genls('x_Gun-Portable','x_SmallArm-Weapon') :- x_cid(a65b1250a2c3e7).
xc_microtheory(a65b1250a2c3e7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3e7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3e7,1221).
xc_kb_names(a65b1250a2c3e7,[]).
xc_mapping_rows(a65b1250a2c3e7,[]).
x_genls('x_Howitzer-122mmSelfPropelled','x_Artillery-SelfPropelled') :- x_cid(a65b1250a2c3e8).
xc_microtheory(a65b1250a2c3e8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3e8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3e8,1223).
xc_kb_names(a65b1250a2c3e8,[]).
xc_mapping_rows(a65b1250a2c3e8,[]).
x_cyclistNotes('x_InfantryFightingVehicle-BMP-2',"Relation between BradleyFightingVehicle-M2 and InfantryFightingVehicle-BMP-2: BradleyFightingVehicle-M2 is a US infantry fighting vehicle which takes basically the same type of role as the Red BMP-2s though not necessarily with the same capability, as reflected in the combat power values of 1.0 and 0.58 for battalions of M2 and BMP-2, respectively.") :- x_cid(a65b1250a2c3e9).
xc_microtheory(a65b1250a2c3e9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3e9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3e9,1225).
xc_kb_names(a65b1250a2c3e9,[]).
xc_mapping_rows(a65b1250a2c3e9,[]).
x_relationAllExists(x_physicalParts,x_BiologicalWeaponFn(x_RickettsiaQuintana),x_RickettsiaQuintana) :- x_cid(a65b1250a2c3ea).
xc_microtheory(a65b1250a2c3ea,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3ea,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3ea,1227).
xc_kb_names(a65b1250a2c3ea,[]).
xc_mapping_rows(a65b1250a2c3ea,[]).
x_comment(x_AntiSubmarineRocket,"The collection of Missiles designed to transport a Torpedo as payload to the vicinity of an enemy Submarine. Once in the water, the Torpedo executes a search for the enemy Submarine.") :- x_cid(a65b1250a2c3eb).
xc_microtheory(a65b1250a2c3eb,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3eb,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3eb,1230).
xc_kb_names(a65b1250a2c3eb,[]).
xc_mapping_rows(a65b1250a2c3eb,[]).
x_isa(x_BiologicalWeaponFn(x_Staphylococcus),x_ExistingObjectType) :- x_cid(a65b1250a2c3ec).
xc_microtheory(a65b1250a2c3ec,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3ec,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3ec,1232).
xc_kb_names(a65b1250a2c3ec,[]).
xc_mapping_rows(a65b1250a2c3ec,[]).
x_genls(x_GroupFn('x_BallisticMissile-Mushak160'),x_Group) :- x_cid(a65b1250a2c3ed).
xc_microtheory(a65b1250a2c3ed,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3ed,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3ed,1235).
xc_kb_names(a65b1250a2c3ed,[]).
xc_mapping_rows(a65b1250a2c3ed,[]).
x_isa(x_TerminalGuidedProjectile,x_ExistingObjectType) :- x_cid(a65b1250a2c3ee).
xc_microtheory(a65b1250a2c3ee,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3ee,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3ee,1238).
xc_kb_names(a65b1250a2c3ee,[]).
xc_mapping_rows(a65b1250a2c3ee,[]).
x_arity(x_intendedTargetTypeOfWeaponType,2) :- x_cid(a65b1250a2c3ef).
xc_microtheory(a65b1250a2c3ef,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3ef,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3ef,1240).
xc_kb_names(a65b1250a2c3ef,[]).
xc_mapping_rows(a65b1250a2c3ef,[]).
x_relationAllExists(x_physicalParts,x_BiologicalWeaponFn(x_RickettsiaProwsecki),x_RickettsiaProwsecki) :- x_cid(a65b1250a2c3f0).
xc_microtheory(a65b1250a2c3f0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3f0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3f0,1242).
xc_kb_names(a65b1250a2c3f0,[]).
xc_mapping_rows(a65b1250a2c3f0,[]).
x_isa('x_Warhead-HighExplosiveAntiTank',x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c3f1).
xc_microtheory(a65b1250a2c3f1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3f1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3f1,1245).
xc_kb_names(a65b1250a2c3f1,[]).
xc_mapping_rows(a65b1250a2c3f1,[]).
x_isa(x_TOWMissile,x_ExistingObjectType) :- x_cid(a65b1250a2c3f2).
xc_microtheory(a65b1250a2c3f2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3f2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3f2,1247).
xc_kb_names(a65b1250a2c3f2,[]).
xc_mapping_rows(a65b1250a2c3f2,[]).
x_intendedTargetTypeOfWeaponType(x_NavalMine,x_Ship) :- x_cid(a65b1250a2c3f3).
xc_microtheory(a65b1250a2c3f3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3f3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3f3,1249).
xc_kb_names(a65b1250a2c3f3,[]).
xc_mapping_rows(a65b1250a2c3f3,[]).
x_arg2Isa(x_weaponRange,x_Distance) :- x_cid(a65b1250a2c3f4).
xc_microtheory(a65b1250a2c3f4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3f4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3f4,1251).
xc_kb_names(a65b1250a2c3f4,[]).
xc_mapping_rows(a65b1250a2c3f4,[]).
x_comment(x_rotationOfLauncher,"(rotationOfLauncher GUN ANGLE-RANGE) indicates the range of horizontal rotation at which a GUN can be fired. This is not relevant for all guns but for those that are fixed and point in some forward direction, the range of left-right rotation may be limited. For example, (angleOfLauncher ?CANNON (Degree-UnitOfAngularMeasure -45 45) means that ?CANNON can be fired between 45 degrees to the left and 45 degrees to the right with respect to its intrinsic forward direction. ") :- x_cid(a65b1250a2c3f5).
xc_microtheory(a65b1250a2c3f5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3f5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3f5,1253).
xc_kb_names(a65b1250a2c3f5,[]).
xc_mapping_rows(a65b1250a2c3f5,[]).
x_comment('x_BiologicalWeapon-BiologicalToxinBased',"The collection of all BiologicalWeapons that make use of BiologicalToxins.") :- x_cid(a65b1250a2c3f6).
xc_microtheory(a65b1250a2c3f6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3f6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3f6,1255).
xc_kb_names(a65b1250a2c3f6,[]).
xc_mapping_rows(a65b1250a2c3f6,[]).
x_genls(x_GroupFn('x_SmallArm-Weapon'),x_Group) :- x_cid(a65b1250a2c3f7).
xc_microtheory(a65b1250a2c3f7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3f7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3f7,1257).
xc_kb_names(a65b1250a2c3f7,[]).
xc_mapping_rows(a65b1250a2c3f7,[]).
x_implies(x_and(x_isa(V1,'x_ObstacleSystem-Military'),x_genls(V2,'x_Movement-TranslationEvent'),x_relationAllExists(x_objectMoving,V2,'x_ModernMilitaryUnit-Deployable')),x_intendedBehaviorCapable(V1,V2,x_constrainingObject)) :- x_cid(a65b1250a2c3f8,V1,V2).
xc_microtheory(a65b1250a2c3f8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3f8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3f8,1260).
xc_kb_names(a65b1250a2c3f8,["?BARRIER","?MOVETYPE"]).
xc_mapping_rows(a65b1250a2c3f8,[]).
x_comment('x_Warhead-CruiseMissile',"A Warhead designed to be used with a CruiseMissile.") :- x_cid(a65b1250a2c3f9).
xc_microtheory(a65b1250a2c3f9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3f9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3f9,1267).
xc_kb_names(a65b1250a2c3f9,[]).
xc_mapping_rows(a65b1250a2c3f9,[]).
x_isa(x_BiologicalWeaponTypeByAgent,x_SiblingDisjointCollection) :- x_cid(a65b1250a2c3fa).
xc_microtheory(a65b1250a2c3fa,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3fa,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3fa,1269).
xc_kb_names(a65b1250a2c3fa,[]).
xc_mapping_rows(a65b1250a2c3fa,[]).
x_isa(x_weaponEffectiveRange,x_FunctionalPredicate) :- x_cid(a65b1250a2c3fb).
xc_microtheory(a65b1250a2c3fb,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3fb,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3fb,1271).
xc_kb_names(a65b1250a2c3fb,[]).
xc_mapping_rows(a65b1250a2c3fb,[]).
x_implies(x_and(x_isa(V1,x_MilitaryChemicalWeaponsProgram),x_directingAgent(V1,V2)),x_purposeInEvent(V2,V1,x_thereExists(V3,x_and(x_isa(V3,x_MakingFn(x_ChemicalWeapon)),x_directingAgent(V3,V2))))) :- x_cid(a65b1250a2c3fc,V1,V2,V3).
xc_microtheory(a65b1250a2c3fc,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3fc,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3fc,1273).
xc_kb_names(a65b1250a2c3fc,["?PROGRAM","?AGENT","?MAKING"]).
xc_mapping_rows(a65b1250a2c3fc,['exists-thereexists']).
x_comment('x_BallisticMissile-Mushak200',"A short range ballistic missile produced by Iran.") :- x_cid(a65b1250a2c3fd).
xc_microtheory(a65b1250a2c3fd,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3fd,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3fd,1285).
xc_kb_names(a65b1250a2c3fd,[]).
xc_mapping_rows(a65b1250a2c3fd,[]).
x_genls('x_Gun-Portable',x_DirectFireWeapon) :- x_cid(a65b1250a2c3fe).
xc_microtheory(a65b1250a2c3fe,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3fe,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3fe,1287).
xc_kb_names(a65b1250a2c3fe,[]).
xc_mapping_rows(a65b1250a2c3fe,[]).
x_genls(x_Batrachotoxin,x_BiologicalToxin) :- x_cid(a65b1250a2c3ff).
xc_microtheory(a65b1250a2c3ff,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c3ff,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c3ff,1289).
xc_kb_names(a65b1250a2c3ff,[]).
xc_mapping_rows(a65b1250a2c3ff,[]).
x_implies(x_isa(V1,x_ConventionalWeapon),x_destructivePotentialOf(V1,x_LowAmountFn(x_DestructivePotential))) :- x_cid(a65b1250a2c400,V1).
xc_microtheory(a65b1250a2c400,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c400,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c400,1291).
xc_kb_names(a65b1250a2c400,["?WEAPON"]).
xc_mapping_rows(a65b1250a2c400,[]).
x_comment(x_rateOfFire,"(rateOfFire GUN RATE) indicates the number of rounds per minute that can be fired. The unit of RATE to use is TimesPerMinute. This predicate can be used for most ProjectileLaunchers that have a store of projectiles. The obvious examples are the instances of MachineGun that have a large store of bullets that can be fired at a rapid rate. Less obvious examples include the Pistols that can fire six bullets at the rateOfFire, after which one must pause for the reloadTime of that pistol. For certain instances of MissileLauncher the rateOfFire is determined by the reloadTime: the time it takes to reload the launcher after firing a missile, determines the rate at which one can fire missiles.") :- x_cid(a65b1250a2c401).
xc_microtheory(a65b1250a2c401,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c401,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c401,1296).
xc_kb_names(a65b1250a2c401,[]).
xc_mapping_rows(a65b1250a2c401,[]).
x_genls(x_GroupFn('x_BallisticMissile-Mushak120'),x_PartiallyTangible) :- x_cid(a65b1250a2c402).
xc_microtheory(a65b1250a2c402,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c402,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c402,1298).
xc_kb_names(a65b1250a2c402,[]).
xc_mapping_rows(a65b1250a2c402,[]).
x_isa(x_reloadTime,x_BinaryPredicate) :- x_cid(a65b1250a2c403).
xc_microtheory(a65b1250a2c403,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c403,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c403,1301).
xc_kb_names(a65b1250a2c403,[]).
xc_mapping_rows(a65b1250a2c403,[]).
x_argIsa(x_rateOfFire,2,x_Rate) :- x_cid(a65b1250a2c404).
xc_microtheory(a65b1250a2c404,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c404,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c404,1303).
xc_kb_names(a65b1250a2c404,[]).
xc_mapping_rows(a65b1250a2c404,[]).
x_genls(x_AntiShipCruiseMissile,x_AntiShipMissile) :- x_cid(a65b1250a2c405).
xc_microtheory(a65b1250a2c405,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c405,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c405,1305).
xc_kb_names(a65b1250a2c405,[]).
xc_mapping_rows(a65b1250a2c405,[]).
x_isa(x_DetectionFn('x_NavalMine-Deployed'),x_Collection) :- x_cid(a65b1250a2c406).
xc_microtheory(a65b1250a2c406,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c406,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c406,1307).
xc_kb_names(a65b1250a2c406,[]).
xc_mapping_rows(a65b1250a2c406,[]).
x_implies(x_genls(V1,'x_BallisticMissile-IntermediateRange'),x_relationAllInstance(x_destructivePotentialOf,V1,x_HighAmountFn(x_DestructivePotential))) :- x_cid(a65b1250a2c407,V1).
xc_microtheory(a65b1250a2c407,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c407,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c407,1310).
xc_kb_names(a65b1250a2c407,["?MISSILETYPE"]).
xc_mapping_rows(a65b1250a2c407,[]).
x_genls('x_Howitzer-122mmSelfPropelled',x_Howitzer) :- x_cid(a65b1250a2c408).
xc_microtheory(a65b1250a2c408,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c408,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c408,1315).
xc_kb_names(a65b1250a2c408,[]).
xc_mapping_rows(a65b1250a2c408,[]).
x_comment('x_InfantryFightingVehicle-BMP-2',"InfantryFightingVehicle-BMP-2 is the collection BMP-2's. The BMP-2 is an infantry fighting vehicle of Russian origin, first seen publicly in 1982, but in use for some time before that. It has been used in combat by the Russian army in Afghanistan, and apparently by armies of both Iraq and Kuwait during Desert Storm. In addition to Russian manufacture, it is also manufactured under license by India (and known as the `Sarath') and in the former Czechoslovakia. Russia was marketing the BMP-2 for $200,000 in 1993. It is amphibious, floating and being propelled on the water by its tracks. BMP-2's are associated primarily with Red mechanized infantry units (rather than armored units), at least at the battalion level. At higher levels, various types of divisions may have lower-level components of several types, so mechanized infantry (with BMP-2s) and armored (with T-64 tanks, for instance) may very well be found in the same division.") :- x_cid(a65b1250a2c409).
xc_microtheory(a65b1250a2c409,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c409,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c409,1317).
xc_kb_names(a65b1250a2c409,[]).
xc_mapping_rows(a65b1250a2c409,[]).
x_genls(x_BiologicalWeaponFn(x_RickettsiaQuintana),'x_BiologicalWeapon-Rickettsial') :- x_cid(a65b1250a2c40a).
xc_microtheory(a65b1250a2c40a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c40a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c40a,1319).
xc_kb_names(a65b1250a2c40a,[]).
xc_mapping_rows(a65b1250a2c40a,[]).
x_genls(x_GroupFn('x_BallisticMissile-Mushak200'),x_Group) :- x_cid(a65b1250a2c40b).
xc_microtheory(a65b1250a2c40b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c40b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c40b,1322).
xc_kb_names(a65b1250a2c40b,[]).
xc_mapping_rows(a65b1250a2c40b,[]).
x_typeBehaviorCapable(x_ChemicalWeapon,x_BombingMission,x_deviceUsed) :- x_cid(a65b1250a2c40c).
xc_microtheory(a65b1250a2c40c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c40c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c40c,1325).
xc_kb_names(a65b1250a2c40c,[]).
xc_mapping_rows(a65b1250a2c40c,[]).
x_comment(x_IncendiaryDevice,"A collection of devices that project fire at enemy troops.") :- x_cid(a65b1250a2c40d).
xc_microtheory(a65b1250a2c40d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c40d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c40d,1327).
xc_kb_names(a65b1250a2c40d,[]).
xc_mapping_rows(a65b1250a2c40d,[]).
x_comment(x_MidcourseGuidedProjectile,"A collection. Instances have paths which can be altered in flight, either using on-board equipment or a RemoteControlDevice. Subsets include CruiseMissiles and some types of AirToSurfaceMissiles and SurfaceToSurfaceMissiles.") :- x_cid(a65b1250a2c40e).
xc_microtheory(a65b1250a2c40e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c40e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c40e,1329).
xc_kb_names(a65b1250a2c40e,[]).
xc_mapping_rows(a65b1250a2c40e,[]).
x_genls(x_TOWMissile,x_CruiseMissile) :- x_cid(a65b1250a2c40f).
xc_microtheory(a65b1250a2c40f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c40f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c40f,1331).
xc_kb_names(a65b1250a2c40f,[]).
xc_mapping_rows(a65b1250a2c40f,[]).
x_genls(x_Rickettsia,x_LivingBiologicalAgent) :- x_cid(a65b1250a2c410).
xc_microtheory(a65b1250a2c410,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c410,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c410,1333).
xc_kb_names(a65b1250a2c410,[]).
xc_mapping_rows(a65b1250a2c410,[]).
x_isa(x_intendedTargetTypeOfWeaponType,x_BinaryPredicate) :- x_cid(a65b1250a2c411).
xc_microtheory(a65b1250a2c411,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c411,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c411,1335).
xc_kb_names(a65b1250a2c411,[]).
xc_mapping_rows(a65b1250a2c411,[]).
x_genls(x_AntiAircraftGun,x_AntiAircraftWeapon) :- x_cid(a65b1250a2c412).
xc_microtheory(a65b1250a2c412,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c412,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c412,1337).
xc_kb_names(a65b1250a2c412,[]).
xc_mapping_rows(a65b1250a2c412,[]).
x_genls(x_BiologicalWeaponFn(x_RickettsiaProwsecki),x_BiologicalWeapon) :- x_cid(a65b1250a2c413).
xc_microtheory(a65b1250a2c413,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c413,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c413,1339).
xc_kb_names(a65b1250a2c413,[]).
xc_mapping_rows(a65b1250a2c413,[]).
x_genls(x_Submarine,'x_WaterPlatform-Subsurface') :- x_cid(a65b1250a2c414).
xc_microtheory(a65b1250a2c414,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c414,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c414,1342).
xc_kb_names(a65b1250a2c414,[]).
xc_mapping_rows(a65b1250a2c414,[]).
x_isa(x_TOWMissile,x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c415).
xc_microtheory(a65b1250a2c415,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c415,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c415,1344).
xc_kb_names(a65b1250a2c415,[]).
xc_mapping_rows(a65b1250a2c415,[]).
x_implies(x_and(x_genls(V1,x_Weapon),x_intendedTargetTypeOfWeaponType(V1,V2),x_genls(V3,V1)),x_keWeakSuggestion(V3,x_thereExists(V4,x_and(x_genls(V4,V2),x_different(V2,V4),x_intendedTargetTypeOfWeaponType(V3,V4))))) :- x_cid(a65b1250a2c416,V1,V2,V3,V4).
xc_microtheory(a65b1250a2c416,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c416,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c416,1346).
xc_kb_names(a65b1250a2c416,["?WEAPONGENTYPE","?TARGETGENTYPE","?WEAPONTYPE","?TARGETTYPE"]).
xc_mapping_rows(a65b1250a2c416,['exists-thereexists']).
x_argIsa(x_weaponRange,2,x_NonNegativeScalarInterval) :- x_cid(a65b1250a2c417).
xc_microtheory(a65b1250a2c417,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c417,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c417,1359).
xc_kb_names(a65b1250a2c417,[]).
xc_mapping_rows(a65b1250a2c417,[]).
x_isa(x_NitrogenMustardGas,x_ProductType) :- x_cid(a65b1250a2c418).
xc_microtheory(a65b1250a2c418,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c418,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c418,1361).
xc_kb_names(a65b1250a2c418,[]).
xc_mapping_rows(a65b1250a2c418,[]).
x_isa(x_GroupFn('x_SmallArm-Weapon'),x_ObjectType) :- x_cid(a65b1250a2c419).
xc_microtheory(a65b1250a2c419,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c419,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c419,1363).
xc_kb_names(a65b1250a2c419,[]).
xc_mapping_rows(a65b1250a2c419,[]).
x_genls('x_ObstacleSystem-Military',x_TangibleThing) :- x_cid(a65b1250a2c41a).
xc_microtheory(a65b1250a2c41a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c41a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c41a,1366).
xc_kb_names(a65b1250a2c41a,[]).
xc_mapping_rows(a65b1250a2c41a,[]).
x_genls('x_Warhead-CruiseMissile',x_Warhead) :- x_cid(a65b1250a2c41b).
xc_microtheory(a65b1250a2c41b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c41b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c41b,1368).
xc_kb_names(a65b1250a2c41b,[]).
xc_mapping_rows(a65b1250a2c41b,[]).
x_isa(x_BiologicalWeaponTypeByAgent,x_CollectionType) :- x_cid(a65b1250a2c41c).
xc_microtheory(a65b1250a2c41c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c41c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c41c,1370).
xc_kb_names(a65b1250a2c41c,[]).
xc_mapping_rows(a65b1250a2c41c,[]).
x_arity(x_weaponEffectiveRange,2) :- x_cid(a65b1250a2c41d).
xc_microtheory(a65b1250a2c41d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c41d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c41d,1372).
xc_kb_names(a65b1250a2c41d,[]).
xc_mapping_rows(a65b1250a2c41d,[]).
x_genls('x_BallisticMissile-Mushak200','x_BallisticMissile-ShortRange') :- x_cid(a65b1250a2c41e).
xc_microtheory(a65b1250a2c41e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c41e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c41e,1374).
xc_kb_names(a65b1250a2c41e,[]).
xc_mapping_rows(a65b1250a2c41e,[]).
x_comment(x_intendedTargetTypeOfWeapon,"(intendedTargetTypeOfWeapon WEAPON ATTACK TYPE) says that during ATTACK, WEAPON is being directed at instances of TYPE. For example, (intendedTargetTypeOfWeapon Gun001 TodaysAttackInWashingtonDC Politician) says that Gun001 was fired at politicians during today's attack in Washington. To say that a weapon *type* is generally used to target things of a given type, use intendedTargetTypeOfWeaponType.") :- x_cid(a65b1250a2c41f).
xc_microtheory(a65b1250a2c41f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c41f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c41f,1376).
xc_kb_names(a65b1250a2c41f,[]).
xc_mapping_rows(a65b1250a2c41f,[]).
x_genls(x_SurfaceToAirMissile,x_AntiAircraftWeapon) :- x_cid(a65b1250a2c420).
xc_microtheory(a65b1250a2c420,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c420,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c420,1378).
xc_kb_names(a65b1250a2c420,[]).
xc_mapping_rows(a65b1250a2c420,[]).
x_isa(x_Batrachotoxin,x_ExistingStuffType) :- x_cid(a65b1250a2c421).
xc_microtheory(a65b1250a2c421,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c421,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c421,1380).
xc_kb_names(a65b1250a2c421,[]).
xc_mapping_rows(a65b1250a2c421,[]).
x_implies(x_isa(V1,x_WeaponOfMassDestruction),x_destructivePotentialOf(V1,x_HighAmountFn(x_DestructivePotential))) :- x_cid(a65b1250a2c422,V1).
xc_microtheory(a65b1250a2c422,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c422,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c422,1382).
xc_kb_names(a65b1250a2c422,["?WEAPON"]).
xc_mapping_rows(a65b1250a2c422,[]).
x_implies(x_and(x_isa(V1,'x_BallisticMissile-ShortRange'),x_weaponRange(V1,V2)),x_quantitySubsumes(x_Mile(94,499),V2)) :- x_cid(a65b1250a2c423,V1,V2).
xc_microtheory(a65b1250a2c423,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c423,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c423,1387).
xc_kb_names(a65b1250a2c423,["?MISSILE","?RANGE"]).
xc_mapping_rows(a65b1250a2c423,[]).
x_genls(x_GroupFn('x_BallisticMissile-Mushak160'),x_PartiallyTangible) :- x_cid(a65b1250a2c424).
xc_microtheory(a65b1250a2c424,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c424,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c424,1394).
xc_kb_names(a65b1250a2c424,[]).
xc_mapping_rows(a65b1250a2c424,[]).
x_genls(x_GroupFn(x_SilkwormMissile),x_Group) :- x_cid(a65b1250a2c425).
xc_microtheory(a65b1250a2c425,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c425,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c425,1397).
xc_kb_names(a65b1250a2c425,[]).
xc_mapping_rows(a65b1250a2c425,[]).
x_genls('x_SmallArm-Weapon',x_ConventionalWeapon) :- x_cid(a65b1250a2c426).
xc_microtheory(a65b1250a2c426,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c426,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c426,1400).
xc_kb_names(a65b1250a2c426,[]).
xc_mapping_rows(a65b1250a2c426,[]).
x_genls(x_MachineCannon,x_HeavyMachineGun) :- x_cid(a65b1250a2c427).
xc_microtheory(a65b1250a2c427,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c427,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c427,1402).
xc_kb_names(a65b1250a2c427,[]).
xc_mapping_rows(a65b1250a2c427,[]).
x_isa(x_reloadTime,x_FunctionalPredicate) :- x_cid(a65b1250a2c428).
xc_microtheory(a65b1250a2c428,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c428,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c428,1404).
xc_kb_names(a65b1250a2c428,[]).
xc_mapping_rows(a65b1250a2c428,[]).
x_argIsa(x_angleOfLauncher,2,x_AngularDistance) :- x_cid(a65b1250a2c429).
xc_microtheory(a65b1250a2c429,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c429,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c429,1406).
xc_kb_names(a65b1250a2c429,[]).
xc_mapping_rows(a65b1250a2c429,[]).
x_genls(x_AntiShipMissile,x_Missile) :- x_cid(a65b1250a2c42a).
xc_microtheory(a65b1250a2c42a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c42a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c42a,1408).
xc_kb_names(a65b1250a2c42a,[]).
xc_mapping_rows(a65b1250a2c42a,[]).
x_relationAllInstance(x_maxSpeed,x_TOWMissile,x_MilesPerHour(692)) :- x_cid(a65b1250a2c42b).
xc_microtheory(a65b1250a2c42b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c42b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c42b,1410).
xc_kb_names(a65b1250a2c42b,[]).
xc_mapping_rows(a65b1250a2c42b,[]).
x_isa(x_MakingFn(x_BiologicalWeapon),x_Collection) :- x_cid(a65b1250a2c42c).
xc_microtheory(a65b1250a2c42c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c42c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c42c,1413).
xc_kb_names(a65b1250a2c42c,[]).
xc_mapping_rows(a65b1250a2c42c,[]).
x_comment(x_KiloClassSubmarine,"A kind of Submarine, manufactured in Russia. As of April of 1998, Iran is known to have purchased several.") :- x_cid(a65b1250a2c42d).
xc_microtheory(a65b1250a2c42d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c42d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c42d,1416).
xc_kb_names(a65b1250a2c42d,[]).
xc_mapping_rows(a65b1250a2c42d,[]).
x_relationAllInstance(x_lengthOfObject,'x_BallisticMissile-Minuteman2','x_Foot-UnitOfMeasure'(59.75)) :- x_cid(a65b1250a2c42e).
xc_microtheory(a65b1250a2c42e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c42e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c42e,1418).
xc_kb_names(a65b1250a2c42e,[]).
xc_mapping_rows(a65b1250a2c42e,[]).
x_implies(x_genls(V1,x_BiochemicallyHarmfulSubstance),x_relationAllInstance(x_destructivePotentialOf,V1,x_HighAmountFn(x_DestructivePotential))) :- x_cid(a65b1250a2c42f,V1).
xc_microtheory(a65b1250a2c42f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c42f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c42f,1421).
xc_kb_names(a65b1250a2c42f,["?WEAPONTYPE"]).
xc_mapping_rows(a65b1250a2c42f,[]).
x_genls('x_InfantryFightingVehicle-BMP-2',x_ArmoredFightingVehicle) :- x_cid(a65b1250a2c430).
xc_microtheory(a65b1250a2c430,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c430,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c430,1426).
xc_kb_names(a65b1250a2c430,[]).
xc_mapping_rows(a65b1250a2c430,[]).
x_genls(x_BiologicalWeaponFn(x_RickettsiaQuintana),x_BiologicalWeapon) :- x_cid(a65b1250a2c431).
xc_microtheory(a65b1250a2c431,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c431,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c431,1428).
xc_kb_names(a65b1250a2c431,[]).
xc_mapping_rows(a65b1250a2c431,[]).
x_genls(x_GroupFn('x_BallisticMissile-SCUDB'),x_Group) :- x_cid(a65b1250a2c432).
xc_microtheory(a65b1250a2c432,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c432,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c432,1431).
xc_kb_names(a65b1250a2c432,[]).
xc_mapping_rows(a65b1250a2c432,[]).
x_isa(x_IncendiaryDevice,x_ExistingObjectType) :- x_cid(a65b1250a2c433).
xc_microtheory(a65b1250a2c433,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c433,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c433,1434).
xc_kb_names(a65b1250a2c433,[]).
xc_mapping_rows(a65b1250a2c433,[]).
'x_sourceOfTerm-Person'('x_MultipleRocketLauncer-122mmMRL',x_Rasch) :- x_cid(a65b1250a2c434).
xc_microtheory(a65b1250a2c434,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c434,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c434,1436).
xc_kb_names(a65b1250a2c434,[]).
xc_mapping_rows(a65b1250a2c434,[]).
x_genls('x_Anthrax-Bacterium',x_LivingBiologicalAgent) :- x_cid(a65b1250a2c435).
xc_microtheory(a65b1250a2c435,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c435,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c435,1438).
xc_kb_names(a65b1250a2c435,[]).
xc_mapping_rows(a65b1250a2c435,[]).
x_isa(x_BiologicalWeaponFn(x_RickettsiaProwsecki),x_ExistingObjectType) :- x_cid(a65b1250a2c436).
xc_microtheory(a65b1250a2c436,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c436,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c436,1440).
xc_kb_names(a65b1250a2c436,[]).
xc_mapping_rows(a65b1250a2c436,[]).
x_comment(x_AntiShipCruiseMissile,"The collection of CruiseMissiles that are designed to attack instances of ModernNavalShips.") :- x_cid(a65b1250a2c437).
xc_microtheory(a65b1250a2c437,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c437,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c437,1443).
xc_kb_names(a65b1250a2c437,[]).
xc_mapping_rows(a65b1250a2c437,[]).
x_genls(x_AircraftWeaponPylon,x_PhysicalDevice) :- x_cid(a65b1250a2c438).
xc_microtheory(a65b1250a2c438,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c438,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c438,1445).
xc_kb_names(a65b1250a2c438,[]).
xc_mapping_rows(a65b1250a2c438,[]).
x_isa('x_BiologicalWeapon-Viral',x_BiologicalWeaponTypeByAgent) :- x_cid(a65b1250a2c439).
xc_microtheory(a65b1250a2c439,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c439,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c439,1447).
xc_kb_names(a65b1250a2c439,[]).
xc_mapping_rows(a65b1250a2c439,[]).
x_relationAllInstance(x_groupMemberType,x_GroupFn(x_SilkwormMissile),x_SilkwormMissile) :- x_cid(a65b1250a2c43a).
xc_microtheory(a65b1250a2c43a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c43a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c43a,1449).
xc_kb_names(a65b1250a2c43a,[]).
xc_mapping_rows(a65b1250a2c43a,[]).
x_arg2Isa(x_weaponRange,x_NonNegativeScalarInterval) :- x_cid(a65b1250a2c43b).
xc_microtheory(a65b1250a2c43b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c43b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c43b,1452).
xc_kb_names(a65b1250a2c43b,[]).
xc_mapping_rows(a65b1250a2c43b,[]).
x_arg2Isa(x_rotationOfLauncher,x_AngularDistance) :- x_cid(a65b1250a2c43c).
xc_microtheory(a65b1250a2c43c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c43c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c43c,1454).
xc_kb_names(a65b1250a2c43c,[]).
xc_mapping_rows(a65b1250a2c43c,[]).
x_genls('x_MatraMica-AirToAirMissile',x_AirToAirMissile) :- x_cid(a65b1250a2c43d).
xc_microtheory(a65b1250a2c43d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c43d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c43d,1456).
xc_kb_names(a65b1250a2c43d,[]).
xc_mapping_rows(a65b1250a2c43d,[]).
x_genls(x_LandMine,x_PressureSensitiveDetonatingWeapon) :- x_cid(a65b1250a2c43e).
xc_microtheory(a65b1250a2c43e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c43e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c43e,1458).
xc_kb_names(a65b1250a2c43e,[]).
xc_mapping_rows(a65b1250a2c43e,[]).
x_genls(x_85MMSmoothBoreCannon,x_FieldArtillery) :- x_cid(a65b1250a2c43f).
xc_microtheory(a65b1250a2c43f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c43f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c43f,1460).
xc_kb_names(a65b1250a2c43f,[]).
xc_mapping_rows(a65b1250a2c43f,[]).
x_isa('x_Warhead-CruiseMissile',x_ExistingObjectType) :- x_cid(a65b1250a2c440).
xc_microtheory(a65b1250a2c440,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c440,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c440,1462).
xc_kb_names(a65b1250a2c440,[]).
xc_mapping_rows(a65b1250a2c440,[]).
x_genls(x_BiologicalWeaponTypeByAgent,x_ExistingObjectType) :- x_cid(a65b1250a2c441).
xc_microtheory(a65b1250a2c441,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c441,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c441,1464).
xc_kb_names(a65b1250a2c441,[]).
xc_mapping_rows(a65b1250a2c441,[]).
x_isa(x_weaponEffectiveRange,x_BinaryPredicate) :- x_cid(a65b1250a2c442).
xc_microtheory(a65b1250a2c442,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c442,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c442,1466).
xc_kb_names(a65b1250a2c442,[]).
xc_mapping_rows(a65b1250a2c442,[]).
x_isa('x_BallisticMissile-Mushak200',x_ExistingObjectType) :- x_cid(a65b1250a2c443).
xc_microtheory(a65b1250a2c443,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c443,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c443,1468).
xc_kb_names(a65b1250a2c443,[]).
xc_mapping_rows(a65b1250a2c443,[]).
x_argGenl(x_intendedTargetTypeOfWeapon,3,x_PartiallyTangible) :- x_cid(a65b1250a2c444).
xc_microtheory(a65b1250a2c444,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c444,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c444,1470).
xc_kb_names(a65b1250a2c444,[]).
xc_mapping_rows(a65b1250a2c444,[]).
x_isa(x_GeneticallyEngineeredViralPathogen,x_ExistingObjectType) :- x_cid(a65b1250a2c445).
xc_microtheory(a65b1250a2c445,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c445,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c445,1472).
xc_kb_names(a65b1250a2c445,[]).
xc_mapping_rows(a65b1250a2c445,[]).
x_genls(x_GroupFn('x_BallisticMissile-Mushak200'),x_PartiallyTangible) :- x_cid(a65b1250a2c446).
xc_microtheory(a65b1250a2c446,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c446,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c446,1474).
xc_kb_names(a65b1250a2c446,[]).
xc_mapping_rows(a65b1250a2c446,[]).
x_isa(x_GroupFn(x_SilkwormMissile),x_ObjectType) :- x_cid(a65b1250a2c447).
xc_microtheory(a65b1250a2c447,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c447,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c447,1477).
xc_kb_names(a65b1250a2c447,[]).
xc_mapping_rows(a65b1250a2c447,[]).
x_genls(x_Bazooka,x_MilitaryWeapon) :- x_cid(a65b1250a2c448).
xc_microtheory(a65b1250a2c448,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c448,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c448,1480).
xc_kb_names(a65b1250a2c448,[]).
xc_mapping_rows(a65b1250a2c448,[]).
x_disjointWith(x_WeaponOfMassDestruction,x_ConventionalWeapon) :- x_cid(a65b1250a2c449).
xc_microtheory(a65b1250a2c449,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c449,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c449,1482).
xc_kb_names(a65b1250a2c449,[]).
xc_mapping_rows(a65b1250a2c449,[]).
x_genls('x_CruiseMissile-ExocetAM39',x_AntiShipCruiseMissile) :- x_cid(a65b1250a2c44a).
xc_microtheory(a65b1250a2c44a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c44a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c44a,1484).
xc_kb_names(a65b1250a2c44a,[]).
xc_mapping_rows(a65b1250a2c44a,[]).
x_argIsa(x_rotationOfLauncher,2,x_AngularDistance) :- x_cid(a65b1250a2c44b).
xc_microtheory(a65b1250a2c44b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c44b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c44b,1486).
xc_kb_names(a65b1250a2c44b,[]).
xc_mapping_rows(a65b1250a2c44b,[]).
x_relationAllExists(x_physicalParts,'x_BiologicalWeapon-Rickettsial',x_Rickettsia) :- x_cid(a65b1250a2c44c).
xc_microtheory(a65b1250a2c44c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c44c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c44c,1488).
xc_kb_names(a65b1250a2c44c,[]).
xc_mapping_rows(a65b1250a2c44c,[]).
x_comment(x_AntiShipMissile,"A subset of Missile comprising missiles that are designed to attack instances of ModernNavalShip.") :- x_cid(a65b1250a2c44d).
xc_microtheory(a65b1250a2c44d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c44d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c44d,1490).
xc_kb_names(a65b1250a2c44d,[]).
xc_mapping_rows(a65b1250a2c44d,[]).
x_genls(x_MustardGas,x_ChemicalAgent) :- x_cid(a65b1250a2c44e).
xc_microtheory(a65b1250a2c44e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c44e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c44e,1492).
xc_kb_names(a65b1250a2c44e,[]).
xc_mapping_rows(a65b1250a2c44e,[]).
x_isa(x_PressureSensitiveDetonatingWeapon,x_ExistingObjectType) :- x_cid(a65b1250a2c44f).
xc_microtheory(a65b1250a2c44f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c44f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c44f,1494).
xc_kb_names(a65b1250a2c44f,[]).
xc_mapping_rows(a65b1250a2c44f,[]).
x_genls(x_KiloClassSubmarine,x_Submarine) :- x_cid(a65b1250a2c450).
xc_microtheory(a65b1250a2c450,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c450,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c450,1496).
xc_kb_names(a65b1250a2c450,[]).
xc_mapping_rows(a65b1250a2c450,[]).
x_genlPreds(x_primaryFunction,x_intendedBehaviorCapable) :- x_cid(a65b1250a2c451).
xc_microtheory(a65b1250a2c451,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c451,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c451,1498).
xc_kb_names(a65b1250a2c451,[]).
xc_mapping_rows(a65b1250a2c451,[]).
x_isa('x_Howitzer-122mmSelfPropelled',x_ExistingObjectType) :- x_cid(a65b1250a2c452).
xc_microtheory(a65b1250a2c452,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c452,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c452,1500).
xc_kb_names(a65b1250a2c452,[]).
xc_mapping_rows(a65b1250a2c452,[]).
x_isa('x_InfantryFightingVehicle-BMP-2',x_ExistingObjectType) :- x_cid(a65b1250a2c453).
xc_microtheory(a65b1250a2c453,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c453,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c453,1502).
xc_kb_names(a65b1250a2c453,[]).
xc_mapping_rows(a65b1250a2c453,[]).
x_isa(x_BiologicalWeaponFn(x_RickettsiaQuintana),x_ExistingObjectType) :- x_cid(a65b1250a2c454).
xc_microtheory(a65b1250a2c454,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c454,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c454,1504).
xc_kb_names(a65b1250a2c454,[]).
xc_mapping_rows(a65b1250a2c454,[]).
x_relationAllExists(x_physicalParts,x_Torpedo,x_Warhead) :- x_cid(a65b1250a2c455).
xc_microtheory(a65b1250a2c455,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c455,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c455,1507).
xc_kb_names(a65b1250a2c455,[]).
xc_mapping_rows(a65b1250a2c455,[]).
x_genls(x_GroupFn('x_BallisticMissile-SCUDC'),x_Group) :- x_cid(a65b1250a2c456).
xc_microtheory(a65b1250a2c456,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c456,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c456,1509).
xc_kb_names(a65b1250a2c456,[]).
xc_mapping_rows(a65b1250a2c456,[]).
x_isa(x_SurfaceToAirMissile,x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c457).
xc_microtheory(a65b1250a2c457,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c457,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c457,1512).
xc_kb_names(a65b1250a2c457,[]).
xc_mapping_rows(a65b1250a2c457,[]).
x_genls(x_85MMSmoothBoreCannon,x_SmoothBoreWeapon) :- x_cid(a65b1250a2c458).
xc_microtheory(a65b1250a2c458,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c458,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c458,1514).
xc_kb_names(a65b1250a2c458,[]).
xc_mapping_rows(a65b1250a2c458,[]).
x_genls(x_IncendiaryDevice,x_MilitaryWeapon) :- x_cid(a65b1250a2c459).
xc_microtheory(a65b1250a2c459,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c459,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c459,1516).
xc_kb_names(a65b1250a2c459,[]).
xc_mapping_rows(a65b1250a2c459,[]).
x_isa(x_MidcourseGuidedProjectile,x_ExistingObjectType) :- x_cid(a65b1250a2c45a).
xc_microtheory(a65b1250a2c45a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c45a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c45a,1518).
xc_kb_names(a65b1250a2c45a,[]).
xc_mapping_rows(a65b1250a2c45a,[]).
x_comment('x_MultipleRocketLauncer-122mmMRL',"The collection of 122mm multiple rocket launchers. The MRL is a Soviet-made, truck mounted rocket launcher, similar to the American Multiple Launch Rocket system (MLRS), but much older.") :- x_cid(a65b1250a2c45b).
xc_microtheory(a65b1250a2c45b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c45b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c45b,1520).
xc_kb_names(a65b1250a2c45b,[]).
xc_mapping_rows(a65b1250a2c45b,[]).
x_genls(x_Staphylococcus,x_LivingBiologicalAgent) :- x_cid(a65b1250a2c45c).
xc_microtheory(a65b1250a2c45c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c45c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c45c,1522).
xc_kb_names(a65b1250a2c45c,[]).
xc_mapping_rows(a65b1250a2c45c,[]).
x_isa(x_AntiShipCruiseMissile,x_ExistingObjectType) :- x_cid(a65b1250a2c45d).
xc_microtheory(a65b1250a2c45d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c45d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c45d,1524).
xc_kb_names(a65b1250a2c45d,[]).
xc_mapping_rows(a65b1250a2c45d,[]).
x_genls(x_AircraftWeaponPylon,x_MilitaryHardware) :- x_cid(a65b1250a2c45e).
xc_microtheory(a65b1250a2c45e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c45e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c45e,1526).
xc_kb_names(a65b1250a2c45e,[]).
xc_mapping_rows(a65b1250a2c45e,[]).
x_isa(x_AntiTankWeapon,x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c45f).
xc_microtheory(a65b1250a2c45f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c45f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c45f,1528).
xc_kb_names(a65b1250a2c45f,[]).
xc_mapping_rows(a65b1250a2c45f,[]).
x_genls('x_BiologicalWeapon-Viral',x_BiologicalWeapon) :- x_cid(a65b1250a2c460).
xc_microtheory(a65b1250a2c460,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c460,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c460,1530).
xc_kb_names(a65b1250a2c460,[]).
xc_mapping_rows(a65b1250a2c460,[]).
x_implies(x_intendedTargetTypeOfWeapon(V1,V2,V3),x_deviceUsed(V2,V1)) :- x_cid(a65b1250a2c461,V1,V2,V3).
xc_microtheory(a65b1250a2c461,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c461,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c461,1532).
xc_kb_names(a65b1250a2c461,["?WEAP","?ATTK","?TYPE"]).
xc_mapping_rows(a65b1250a2c461,[]).
x_physicalPartTypes(x_ChemicalWeapon,x_ChemicalAgent) :- x_cid(a65b1250a2c462).
xc_microtheory(a65b1250a2c462,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c462,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c462,1536).
xc_kb_names(a65b1250a2c462,[]).
xc_mapping_rows(a65b1250a2c462,[]).
x_arg1Isa(x_rotationOfLauncher,x_ProjectileLauncher) :- x_cid(a65b1250a2c463).
xc_microtheory(a65b1250a2c463,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c463,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c463,1538).
xc_kb_names(a65b1250a2c463,[]).
xc_mapping_rows(a65b1250a2c463,[]).
x_relationAllExists(x_outputsCreated,x_MakingFn(x_BlisterAgent),x_BlisterAgent) :- x_cid(a65b1250a2c464).
xc_microtheory(a65b1250a2c464,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c464,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c464,1540).
xc_kb_names(a65b1250a2c464,[]).
xc_mapping_rows(a65b1250a2c464,[]).
x_isa('x_CruiseMissile-SubmarineLaunched',x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c465).
xc_microtheory(a65b1250a2c465,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c465,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c465,1543).
xc_kb_names(a65b1250a2c465,[]).
xc_mapping_rows(a65b1250a2c465,[]).
x_isa('x_ObstacleSystem-Military',x_ProductType) :- x_cid(a65b1250a2c466).
xc_microtheory(a65b1250a2c466,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c466,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c466,1545).
xc_kb_names(a65b1250a2c466,[]).
xc_mapping_rows(a65b1250a2c466,[]).
x_behaviorCapable(x_UnitedStatesOfAmerica,x_NuclearAttack,x_performedBy) :- x_cid(a65b1250a2c467).
xc_microtheory(a65b1250a2c467,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c467,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c467,1547).
xc_kb_names(a65b1250a2c467,[]).
xc_mapping_rows(a65b1250a2c467,[]).
x_comment('x_BallisticMissile-Mushak160',"A short range ballistic missile produced by Iran.") :- x_cid(a65b1250a2c468).
xc_microtheory(a65b1250a2c468,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c468,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c468,1549).
xc_kb_names(a65b1250a2c468,[]).
xc_mapping_rows(a65b1250a2c468,[]).
x_disjointWith(x_RifledBoreWeapon,x_SmoothBoreWeapon) :- x_cid(a65b1250a2c469).
xc_microtheory(a65b1250a2c469,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c469,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c469,1551).
xc_kb_names(a65b1250a2c469,[]).
xc_mapping_rows(a65b1250a2c469,[]).
x_arg3Genl(x_intendedTargetTypeOfWeapon,x_PartiallyTangible) :- x_cid(a65b1250a2c46a).
xc_microtheory(a65b1250a2c46a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c46a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c46a,1553).
xc_kb_names(a65b1250a2c46a,[]).
xc_mapping_rows(a65b1250a2c46a,[]).
x_isa('x_BiologicalWeapon-GeneticallyEngineeredVirusBased',x_BiologicalWeaponTypeByAgent) :- x_cid(a65b1250a2c46b).
xc_microtheory(a65b1250a2c46b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c46b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c46b,1555).
xc_kb_names(a65b1250a2c46b,[]).
xc_mapping_rows(a65b1250a2c46b,[]).
x_comment(x_AntiAircraftArtillery,"The collection of large anti-aircraft weapons (such as cannons).") :- x_cid(a65b1250a2c46c).
xc_microtheory(a65b1250a2c46c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c46c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c46c,1557).
xc_kb_names(a65b1250a2c46c,[]).
xc_mapping_rows(a65b1250a2c46c,[]).
x_genls(x_GroupFn('x_BallisticMissile-SCUDB'),x_PartiallyTangible) :- x_cid(a65b1250a2c46d).
xc_microtheory(a65b1250a2c46d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c46d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c46d,1559).
xc_kb_names(a65b1250a2c46d,[]).
xc_mapping_rows(a65b1250a2c46d,[]).
x_isa('x_CruiseMissile-ExocetAM39',x_ExistingObjectType) :- x_cid(a65b1250a2c46e).
xc_microtheory(a65b1250a2c46e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c46e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c46e,1562).
xc_kb_names(a65b1250a2c46e,[]).
xc_mapping_rows(a65b1250a2c46e,[]).
x_argIsa(x_reloadTime,2,x_TimeInterval) :- x_cid(a65b1250a2c46f).
xc_microtheory(a65b1250a2c46f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c46f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c46f,1564).
xc_kb_names(a65b1250a2c46f,[]).
xc_mapping_rows(a65b1250a2c46f,[]).
x_genls(x_AgentOrange,x_ChemicalAgent) :- x_cid(a65b1250a2c470).
xc_microtheory(a65b1250a2c470,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c470,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c470,1566).
xc_kb_names(a65b1250a2c470,[]).
xc_mapping_rows(a65b1250a2c470,[]).
x_comment(x_LitFuseDetonatingDevice,"The collection of ExplosiveDevices that detonate when their lit fuse is exhausted.") :- x_cid(a65b1250a2c471).
xc_microtheory(a65b1250a2c471,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c471,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c471,1568).
xc_kb_names(a65b1250a2c471,[]).
xc_mapping_rows(a65b1250a2c471,[]).
x_isa(x_MakingFn(x_NuclearWeapon),x_Collection) :- x_cid(a65b1250a2c472).
xc_microtheory(a65b1250a2c472,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c472,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c472,1570).
xc_kb_names(a65b1250a2c472,[]).
xc_mapping_rows(a65b1250a2c472,[]).
x_isa(x_KiloClassSubmarine,x_ExistingObjectType) :- x_cid(a65b1250a2c473).
xc_microtheory(a65b1250a2c473,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c473,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c473,1573).
xc_kb_names(a65b1250a2c473,[]).
xc_mapping_rows(a65b1250a2c473,[]).
x_relationAllInstance('x_weaponEffectiveRange-Max','x_BallisticMissile-Minuteman2',x_Mile(6990)) :- x_cid(a65b1250a2c474).
xc_microtheory(a65b1250a2c474,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c474,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c474,1575).
xc_kb_names(a65b1250a2c474,[]).
xc_mapping_rows(a65b1250a2c474,[]).
x_genls(x_BallisticMissile,x_IndirectFireWeapon) :- x_cid(a65b1250a2c475).
xc_microtheory(a65b1250a2c475,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c475,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c475,1578).
xc_kb_names(a65b1250a2c475,[]).
xc_mapping_rows(a65b1250a2c475,[]).
x_genls(x_LaserGuidedBomb,x_AerialBomb) :- x_cid(a65b1250a2c476).
xc_microtheory(a65b1250a2c476,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c476,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c476,1580).
xc_kb_names(a65b1250a2c476,[]).
xc_mapping_rows(a65b1250a2c476,[]).
x_isa(x_MakingFn('x_BallisticMissile-SCUDC'),x_Collection) :- x_cid(a65b1250a2c477).
xc_microtheory(a65b1250a2c477,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c477,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c477,1582).
xc_kb_names(a65b1250a2c477,[]).
xc_mapping_rows(a65b1250a2c477,[]).
x_genls(x_GroupFn('x_BallisticMissile-CSS8'),x_Group) :- x_cid(a65b1250a2c478).
xc_microtheory(a65b1250a2c478,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c478,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c478,1585).
xc_kb_names(a65b1250a2c478,[]).
xc_mapping_rows(a65b1250a2c478,[]).
x_isa(x_AntiAircraftGun,x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c479).
xc_microtheory(a65b1250a2c479,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c479,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c479,1588).
xc_kb_names(a65b1250a2c479,[]).
xc_mapping_rows(a65b1250a2c479,[]).
x_comment(x_LaunchGuidedProjectile,"The collection of Projectile-Devices which have paths that cannot be altered after the projectile leaves the ProjectileLauncher.") :- x_cid(a65b1250a2c47a).
xc_microtheory(a65b1250a2c47a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c47a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c47a,1590).
xc_kb_names(a65b1250a2c47a,[]).
xc_mapping_rows(a65b1250a2c47a,[]).
x_genls(x_LaunchGuidedProjectile,x_CollectionUnionFn(x_TheSet(x_HardwareTool,x_PhysicalDevice))) :- x_cid(a65b1250a2c47b).
xc_microtheory(a65b1250a2c47b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c47b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c47b,1592).
xc_kb_names(a65b1250a2c47b,[]).
xc_mapping_rows(a65b1250a2c47b,[]).
x_genls('x_MultipleRocketLauncer-122mmMRL',x_MultipleRocketLauncher) :- x_cid(a65b1250a2c47c).
xc_microtheory(a65b1250a2c47c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c47c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c47c,1596).
xc_kb_names(a65b1250a2c47c,[]).
xc_mapping_rows(a65b1250a2c47c,[]).
x_genls(x_ClostridiumPerfringens,x_LivingBiologicalAgent) :- x_cid(a65b1250a2c47d).
xc_microtheory(a65b1250a2c47d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c47d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c47d,1598).
xc_kb_names(a65b1250a2c47d,[]).
xc_mapping_rows(a65b1250a2c47d,[]).
x_relationAllExists(x_physicalParts,'x_BiologicalWeapon-Viral',x_Virus) :- x_cid(a65b1250a2c47e).
xc_microtheory(a65b1250a2c47e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c47e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c47e,1600).
xc_kb_names(a65b1250a2c47e,[]).
xc_mapping_rows(a65b1250a2c47e,[]).
x_isa(x_AntiArmorMine,x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c47f).
xc_microtheory(a65b1250a2c47f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c47f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c47f,1602).
xc_kb_names(a65b1250a2c47f,[]).
xc_mapping_rows(a65b1250a2c47f,[]).
x_physicalPartTypes(x_BiologicalWeapon,x_BiologicalAgent) :- x_cid(a65b1250a2c480).
xc_microtheory(a65b1250a2c480,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c480,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c480,1604).
xc_kb_names(a65b1250a2c480,[]).
xc_mapping_rows(a65b1250a2c480,[]).
x_argIsa(x_weaponEffectiveRange,2,x_Distance) :- x_cid(a65b1250a2c481).
xc_microtheory(a65b1250a2c481,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c481,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c481,1606).
xc_kb_names(a65b1250a2c481,[]).
xc_mapping_rows(a65b1250a2c481,[]).
x_arity(x_rotationOfLauncher,2) :- x_cid(a65b1250a2c482).
xc_microtheory(a65b1250a2c482,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c482,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c482,1608).
xc_kb_names(a65b1250a2c482,[]).
xc_mapping_rows(a65b1250a2c482,[]).
x_genls(x_MakingFn(x_BlisterAgent),x_MakingSomething) :- x_cid(a65b1250a2c483).
xc_microtheory(a65b1250a2c483,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c483,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c483,1610).
xc_kb_names(a65b1250a2c483,[]).
xc_mapping_rows(a65b1250a2c483,[]).
x_isa('x_MatraMica-AirToAirMissile',x_ProductType) :- x_cid(a65b1250a2c484).
xc_microtheory(a65b1250a2c484,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c484,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c484,1613).
xc_kb_names(a65b1250a2c484,[]).
xc_mapping_rows(a65b1250a2c484,[]).
x_isa('x_CruiseMissile-SeaLaunched',x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c485).
xc_microtheory(a65b1250a2c485,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c485,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c485,1615).
xc_kb_names(a65b1250a2c485,[]).
xc_mapping_rows(a65b1250a2c485,[]).
x_isa('x_ObstacleSystem-Military',x_ExistingObjectType) :- x_cid(a65b1250a2c486).
xc_microtheory(a65b1250a2c486,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c486,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c486,1617).
xc_kb_names(a65b1250a2c486,[]).
xc_mapping_rows(a65b1250a2c486,[]).
x_comment('x_Warhead-BallisticMissile',"A Warhead designed to be used with a BallisticMissile.") :- x_cid(a65b1250a2c487).
xc_microtheory(a65b1250a2c487,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c487,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c487,1619).
xc_kb_names(a65b1250a2c487,[]).
xc_mapping_rows(a65b1250a2c487,[]).
x_isa('x_BiologicalWeapon-Rickettsial',x_BiologicalWeaponTypeByAgent) :- x_cid(a65b1250a2c488).
xc_microtheory(a65b1250a2c488,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c488,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c488,1621).
xc_kb_names(a65b1250a2c488,[]).
xc_mapping_rows(a65b1250a2c488,[]).
x_genls('x_BallisticMissile-Mushak160','x_BallisticMissile-ShortRange') :- x_cid(a65b1250a2c489).
xc_microtheory(a65b1250a2c489,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c489,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c489,1623).
xc_kb_names(a65b1250a2c489,[]).
xc_mapping_rows(a65b1250a2c489,[]).
x_comment(x_RifledBoreWeapon,"The collection of ProjectileLaunchers that have Bores with spiralled scoring. Rifling the Bore increases the accuracy of the ProjectileWeapon.") :- x_cid(a65b1250a2c48a).
xc_microtheory(a65b1250a2c48a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c48a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c48a,1625).
xc_kb_names(a65b1250a2c48a,[]).
xc_mapping_rows(a65b1250a2c48a,[]).
x_relationAllExists(x_subEvents,x_MissileAttack,x_LaunchingAMissile) :- x_cid(a65b1250a2c48b).
xc_microtheory(a65b1250a2c48b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c48b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c48b,1627).
xc_kb_names(a65b1250a2c48b,[]).
xc_mapping_rows(a65b1250a2c48b,[]).
x_argIsa(x_intendedTargetTypeOfWeapon,3,x_TemporalStuffType) :- x_cid(a65b1250a2c48c).
xc_microtheory(a65b1250a2c48c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c48c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c48c,1629).
xc_kb_names(a65b1250a2c48c,[]).
xc_mapping_rows(a65b1250a2c48c,[]).
x_genls(x_AntiAircraftArtillery,x_AntiAircraftWeapon) :- x_cid(a65b1250a2c48d).
xc_microtheory(a65b1250a2c48d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c48d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c48d,1631).
xc_kb_names(a65b1250a2c48d,[]).
xc_mapping_rows(a65b1250a2c48d,[]).
x_comment('x_MissileSystem-Offensive',"The collection of WeaponSystems used to attack cities, armies, vehicles, etc. with Missiles.") :- x_cid(a65b1250a2c48e).
xc_microtheory(a65b1250a2c48e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c48e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c48e,1633).
xc_kb_names(a65b1250a2c48e,[]).
xc_mapping_rows(a65b1250a2c48e,[]).
x_genls(x_GroupFn('x_BallisticMissile-SCUDC'),x_PartiallyTangible) :- x_cid(a65b1250a2c48f).
xc_microtheory(a65b1250a2c48f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c48f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c48f,1635).
xc_kb_names(a65b1250a2c48f,[]).
xc_mapping_rows(a65b1250a2c48f,[]).
x_relationAllInstance(x_lengthOfObject,'x_LGM-30A-MinutemanMissile','x_Foot-UnitOfMeasure'(54)) :- x_cid(a65b1250a2c490).
xc_microtheory(a65b1250a2c490,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c490,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c490,1638).
xc_kb_names(a65b1250a2c490,[]).
xc_mapping_rows(a65b1250a2c490,[]).
x_argIsa('x_weaponPayload-Max',2,x_Mass) :- x_cid(a65b1250a2c491).
xc_microtheory(a65b1250a2c491,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c491,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c491,1641).
xc_kb_names(a65b1250a2c491,[]).
xc_mapping_rows(a65b1250a2c491,[]).
x_genls(x_BiologicalWeaponFn(x_Staphylococcus),x_BiologicalWeapon) :- x_cid(a65b1250a2c492).
xc_microtheory(a65b1250a2c492,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c492,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c492,1643).
xc_kb_names(a65b1250a2c492,[]).
xc_mapping_rows(a65b1250a2c492,[]).
x_genls(x_Missile,x_CruiseMissile) :- x_cid(a65b1250a2c493).
xc_microtheory(a65b1250a2c493,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c493,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c493,1646).
xc_kb_names(a65b1250a2c493,[]).
xc_mapping_rows(a65b1250a2c493,[]).
x_genls(x_LitFuseDetonatingDevice,x_ExplosiveDevice) :- x_cid(a65b1250a2c494).
xc_microtheory(a65b1250a2c494,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c494,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c494,1648).
xc_kb_names(a65b1250a2c494,[]).
xc_mapping_rows(a65b1250a2c494,[]).
x_genls('x_BallisticMissile-Minuteman2',x_MinutemanBallisticMissile) :- x_cid(a65b1250a2c495).
xc_microtheory(a65b1250a2c495,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c495,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c495,1650).
xc_kb_names(a65b1250a2c495,[]).
xc_mapping_rows(a65b1250a2c495,[]).
x_comment(x_DepthBomb,"The collection of Bombs used especially against Submarines. DepthBombs, also called depth charges, are dropped from ModernNavalShips and MilitaryAircraft and which explode under water.") :- x_cid(a65b1250a2c496).
xc_microtheory(a65b1250a2c496,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c496,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c496,1652).
xc_kb_names(a65b1250a2c496,[]).
xc_mapping_rows(a65b1250a2c496,[]).
x_genls(x_GroupFn('x_BallisticMissile-M11'),x_Group) :- x_cid(a65b1250a2c497).
xc_microtheory(a65b1250a2c497,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c497,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c497,1654).
xc_kb_names(a65b1250a2c497,[]).
xc_mapping_rows(a65b1250a2c497,[]).
x_isa(x_85MMSmoothBoreCannon,x_ExistingObjectType) :- x_cid(a65b1250a2c498).
xc_microtheory(a65b1250a2c498,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c498,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c498,1657).
xc_kb_names(a65b1250a2c498,[]).
xc_mapping_rows(a65b1250a2c498,[]).
x_isa('x_MultipleRocketLauncer-122mmMRL',x_ExistingObjectType) :- x_cid(a65b1250a2c499).
xc_microtheory(a65b1250a2c499,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c499,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c499,1659).
xc_kb_names(a65b1250a2c499,[]).
xc_mapping_rows(a65b1250a2c499,[]).
x_genls(x_BiologicalWeaponFn('x_Smallpox-Virus'),'x_BiologicalWeapon-Viral') :- x_cid(a65b1250a2c49a).
xc_microtheory(a65b1250a2c49a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c49a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c49a,1661).
xc_kb_names(a65b1250a2c49a,[]).
xc_mapping_rows(a65b1250a2c49a,[]).
x_implies(x_and(x_isa(V1,x_GeographicalAgent),x_performedBy(V2,V1),x_isa(V2,x_AttackOnTangible),x_deviceUsed(V2,V3),x_isa(V3,V4),x_genls(V4,x_Weapon)),x_relationInstanceExistsMany(x_possesses,V1,V4)) :- x_cid(a65b1250a2c49b,V1,V2,V3,V4).
xc_microtheory(a65b1250a2c49b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c49b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c49b,1664).
xc_kb_names(a65b1250a2c49b,["?AGENT","?ATTACK","?WEAPON","?WEAPONTYPE"]).
xc_mapping_rows(a65b1250a2c49b,[]).
x_isa(x_AntiArmorGrenade,x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c49c).
xc_microtheory(a65b1250a2c49c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c49c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c49c,1674).
xc_kb_names(a65b1250a2c49c,[]).
xc_mapping_rows(a65b1250a2c49c,[]).
x_implies(x_and(x_completeCollectionExtent(V1),x_partitionedInto(V2,V1),x_genls(V2,x_Weapon)),x_intendedTargetTypeOfWeaponType(V2,x_CollectionUnionFn(x_TheSetOf(V3,x_thereExists(V4,x_and(x_isa(V4,V1),x_intendedTargetTypeOfWeaponType(V4,V3))))))) :- x_cid(a65b1250a2c49d,V1,V2,V3,V4).
xc_microtheory(a65b1250a2c49d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c49d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c49d,1676).
xc_kb_names(a65b1250a2c49d,["?DISJOINT-COLTYPE","?WEAPONCOL","?TARGET-TYPE","?CELL-COL"]).
xc_mapping_rows(a65b1250a2c49d,['exists-thereexists']).
x_arg2Isa(x_weaponEffectiveRange,x_Distance) :- x_cid(a65b1250a2c49e).
xc_microtheory(a65b1250a2c49e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c49e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c49e,1690).
xc_kb_names(a65b1250a2c49e,[]).
xc_mapping_rows(a65b1250a2c49e,[]).
x_isa(x_rotationOfLauncher,x_BinaryPredicate) :- x_cid(a65b1250a2c49f).
xc_microtheory(a65b1250a2c49f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c49f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c49f,1692).
xc_kb_names(a65b1250a2c49f,[]).
xc_mapping_rows(a65b1250a2c49f,[]).
x_comment('x_BiologicalWeapon-Rickettsial',"The collection of all BiologicalWeapons that make use of rickettsial organisms.") :- x_cid(a65b1250a2c4a0).
xc_microtheory(a65b1250a2c4a0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4a0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4a0,1694).
xc_kb_names(a65b1250a2c4a0,[]).
xc_mapping_rows(a65b1250a2c4a0,[]).
x_isa('x_MatraMica-AirToAirMissile',x_ExistingObjectType) :- x_cid(a65b1250a2c4a1).
xc_microtheory(a65b1250a2c4a1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4a1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4a1,1696).
xc_kb_names(a65b1250a2c4a1,[]).
xc_mapping_rows(a65b1250a2c4a1,[]).
x_isa('x_CruiseMissile-AirLaunched',x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c4a2).
xc_microtheory(a65b1250a2c4a2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4a2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4a2,1698).
xc_kb_names(a65b1250a2c4a2,[]).
xc_mapping_rows(a65b1250a2c4a2,[]).
x_genls('x_Warhead-BallisticMissile',x_Warhead) :- x_cid(a65b1250a2c4a3).
xc_microtheory(a65b1250a2c4a3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4a3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4a3,1700).
xc_kb_names(a65b1250a2c4a3,[]).
xc_mapping_rows(a65b1250a2c4a3,[]).
x_genls('x_BiologicalWeapon-Rickettsial',x_BiologicalWeapon) :- x_cid(a65b1250a2c4a4).
xc_microtheory(a65b1250a2c4a4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4a4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4a4,1702).
xc_kb_names(a65b1250a2c4a4,[]).
xc_mapping_rows(a65b1250a2c4a4,[]).
x_isa('x_BallisticMissile-Mushak160',x_ExistingObjectType) :- x_cid(a65b1250a2c4a5).
xc_microtheory(a65b1250a2c4a5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4a5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4a5,1704).
xc_kb_names(a65b1250a2c4a5,[]).
xc_mapping_rows(a65b1250a2c4a5,[]).
x_genls(x_AntiTankGuidedWeapon,x_AntiTankWeapon) :- x_cid(a65b1250a2c4a6).
xc_microtheory(a65b1250a2c4a6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4a6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4a6,1706).
xc_kb_names(a65b1250a2c4a6,[]).
xc_mapping_rows(a65b1250a2c4a6,[]).
x_genls(x_RifledBoreWeapon,x_ProjectileLauncher) :- x_cid(a65b1250a2c4a7).
xc_microtheory(a65b1250a2c4a7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4a7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4a7,1708).
xc_kb_names(a65b1250a2c4a7,[]).
xc_mapping_rows(a65b1250a2c4a7,[]).
x_arg3Isa(x_intendedTargetTypeOfWeapon,x_TemporalStuffType) :- x_cid(a65b1250a2c4a8).
xc_microtheory(a65b1250a2c4a8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4a8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4a8,1710).
xc_kb_names(a65b1250a2c4a8,[]).
xc_mapping_rows(a65b1250a2c4a8,[]).
x_isa(x_AntiAircraftArtillery,x_ExistingObjectType) :- x_cid(a65b1250a2c4a9).
xc_microtheory(a65b1250a2c4a9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4a9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4a9,1712).
xc_kb_names(a65b1250a2c4a9,[]).
xc_mapping_rows(a65b1250a2c4a9,[]).
x_genls(x_GroupFn('x_BallisticMissile-CSS8'),x_PartiallyTangible) :- x_cid(a65b1250a2c4aa).
xc_microtheory(a65b1250a2c4aa,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4aa,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4aa,1714).
xc_kb_names(a65b1250a2c4aa,[]).
xc_mapping_rows(a65b1250a2c4aa,[]).
x_comment('x_LGM-30A-MinutemanMissile',"The collection of all LGM-30A-MinutemanMissiles, the first type of MinutemanBallisticMissile.") :- x_cid(a65b1250a2c4ab).
xc_microtheory(a65b1250a2c4ab,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4ab,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4ab,1717).
xc_kb_names(a65b1250a2c4ab,[]).
xc_mapping_rows(a65b1250a2c4ab,[]).
x_genls(x_Bazooka,x_MissileLauncher) :- x_cid(a65b1250a2c4ac).
xc_microtheory(a65b1250a2c4ac,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4ac,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4ac,1719).
xc_kb_names(a65b1250a2c4ac,[]).
xc_mapping_rows(a65b1250a2c4ac,[]).
x_genls(x_NerveAgent,x_ChemicalAgent) :- x_cid(a65b1250a2c4ad).
xc_microtheory(a65b1250a2c4ad,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4ad,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4ad,1721).
xc_kb_names(a65b1250a2c4ad,[]).
xc_mapping_rows(a65b1250a2c4ad,[]).
x_relationAllInstance(x_weaponRange,x_TOWMissile,x_Meter(3000)) :- x_cid(a65b1250a2c4ae).
xc_microtheory(a65b1250a2c4ae,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4ae,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4ae,1723).
xc_kb_names(a65b1250a2c4ae,[]).
xc_mapping_rows(a65b1250a2c4ae,[]).
x_isa(x_LitFuseDetonatingDevice,x_ExistingObjectType) :- x_cid(a65b1250a2c4af).
xc_microtheory(a65b1250a2c4af,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4af,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4af,1726).
xc_kb_names(a65b1250a2c4af,[]).
xc_mapping_rows(a65b1250a2c4af,[]).
x_isa('x_BallisticMissile-Minuteman2',x_ExistingObjectType) :- x_cid(a65b1250a2c4b0).
xc_microtheory(a65b1250a2c4b0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4b0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4b0,1728).
xc_kb_names(a65b1250a2c4b0,[]).
xc_mapping_rows(a65b1250a2c4b0,[]).
x_isa(x_MakingFn('x_BallisticMissile-SCUDB'),x_TemporalObjectType) :- x_cid(a65b1250a2c4b1).
xc_microtheory(a65b1250a2c4b1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4b1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4b1,1730).
xc_kb_names(a65b1250a2c4b1,[]).
xc_mapping_rows(a65b1250a2c4b1,[]).
x_genls('x_CruiseMissile-AirLaunched',x_CruiseMissile) :- x_cid(a65b1250a2c4b2).
xc_microtheory(a65b1250a2c4b2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4b2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4b2,1733).
xc_kb_names(a65b1250a2c4b2,[]).
xc_mapping_rows(a65b1250a2c4b2,[]).
x_genls(x_PressureSensitiveDetonatingWeapon,x_ExplosiveDevice) :- x_cid(a65b1250a2c4b3).
xc_microtheory(a65b1250a2c4b3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4b3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4b3,1735).
xc_kb_names(a65b1250a2c4b3,[]).
xc_mapping_rows(a65b1250a2c4b3,[]).
x_genls('x_Smallpox-Virus',x_LivingBiologicalAgent) :- x_cid(a65b1250a2c4b4).
xc_microtheory(a65b1250a2c4b4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4b4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4b4,1737).
xc_kb_names(a65b1250a2c4b4,[]).
xc_mapping_rows(a65b1250a2c4b4,[]).
x_isa(x_BiologicalWeaponFn('x_Smallpox-Virus'),x_ExistingObjectType) :- x_cid(a65b1250a2c4b5).
xc_microtheory(a65b1250a2c4b5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4b5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4b5,1739).
xc_kb_names(a65b1250a2c4b5,[]).
xc_mapping_rows(a65b1250a2c4b5,[]).
x_isa(x_AntiArmorWeapon,x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c4b6).
xc_microtheory(a65b1250a2c4b6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4b6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4b6,1742).
xc_kb_names(a65b1250a2c4b6,[]).
xc_mapping_rows(a65b1250a2c4b6,[]).
x_argIsa('x_weaponEffectiveRange-Max',2,x_Distance) :- x_cid(a65b1250a2c4b7).
xc_microtheory(a65b1250a2c4b7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4b7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4b7,1744).
xc_kb_names(a65b1250a2c4b7,[]).
xc_mapping_rows(a65b1250a2c4b7,[]).
x_completeExtentKnown(x_intendedTargetTypeOfWeaponType) :- x_cid(a65b1250a2c4b8).
xc_microtheory(a65b1250a2c4b8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4b8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4b8,1746).
xc_kb_names(a65b1250a2c4b8,[]).
xc_mapping_rows(a65b1250a2c4b8,[]).
x_argIsa(x_weaponEffectiveRange,2,x_NonNegativeScalarInterval) :- x_cid(a65b1250a2c4b9).
xc_microtheory(a65b1250a2c4b9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4b9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4b9,1748).
xc_kb_names(a65b1250a2c4b9,[]).
xc_mapping_rows(a65b1250a2c4b9,[]).
x_isa(x_rotationOfLauncher,x_FunctionalPredicate) :- x_cid(a65b1250a2c4ba).
xc_microtheory(a65b1250a2c4ba,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4ba,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4ba,1750).
xc_kb_names(a65b1250a2c4ba,[]).
xc_mapping_rows(a65b1250a2c4ba,[]).
x_isa(x_MakingFn(x_BlisterAgent),x_TemporalObjectType) :- x_cid(a65b1250a2c4bb).
xc_microtheory(a65b1250a2c4bb,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4bb,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4bb,1752).
xc_kb_names(a65b1250a2c4bb,[]).
xc_mapping_rows(a65b1250a2c4bb,[]).
x_genls(x_TOWMissile,x_AntiTankGuidedWeapon) :- x_cid(a65b1250a2c4bc).
xc_microtheory(a65b1250a2c4bc,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4bc,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4bc,1755).
xc_kb_names(a65b1250a2c4bc,[]).
xc_mapping_rows(a65b1250a2c4bc,[]).
x_isa(x_AntiShipCruiseMissile,x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c4bd).
xc_microtheory(a65b1250a2c4bd,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4bd,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4bd,1757).
xc_kb_names(a65b1250a2c4bd,[]).
xc_mapping_rows(a65b1250a2c4bd,[]).
x_genls(x_76MMRifledBoreCannon,x_FieldArtillery) :- x_cid(a65b1250a2c4be).
xc_microtheory(a65b1250a2c4be,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4be,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4be,1759).
xc_kb_names(a65b1250a2c4be,[]).
xc_mapping_rows(a65b1250a2c4be,[]).
x_isa('x_Warhead-BallisticMissile',x_ExistingObjectType) :- x_cid(a65b1250a2c4bf).
xc_microtheory(a65b1250a2c4bf,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4bf,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4bf,1761).
xc_kb_names(a65b1250a2c4bf,[]).
xc_mapping_rows(a65b1250a2c4bf,[]).
x_isa('x_BiologicalWeapon-BiologicalToxinBased',x_BiologicalWeaponTypeByAgent) :- x_cid(a65b1250a2c4c0).
xc_microtheory(a65b1250a2c4c0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4c0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4c0,1763).
xc_kb_names(a65b1250a2c4c0,[]).
xc_mapping_rows(a65b1250a2c4c0,[]).
x_comment('x_BallisticMissile-Mushak120',"A battlefield short range ballistic missile produced by Iran") :- x_cid(a65b1250a2c4c1).
xc_microtheory(a65b1250a2c4c1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4c1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4c1,1765).
xc_kb_names(a65b1250a2c4c1,[]).
xc_mapping_rows(a65b1250a2c4c1,[]).
x_isa(x_AntiTankGuidedWeapon,x_ExistingObjectType) :- x_cid(a65b1250a2c4c2).
xc_microtheory(a65b1250a2c4c2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4c2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4c2,1767).
xc_kb_names(a65b1250a2c4c2,[]).
xc_mapping_rows(a65b1250a2c4c2,[]).
x_isa(x_RifledBoreWeapon,x_ExistingObjectType) :- x_cid(a65b1250a2c4c3).
xc_microtheory(a65b1250a2c4c3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4c3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4c3,1769).
xc_kb_names(a65b1250a2c4c3,[]).
xc_mapping_rows(a65b1250a2c4c3,[]).
x_argIsa(x_intendedTargetTypeOfWeapon,2,x_AttackOnTangible) :- x_cid(a65b1250a2c4c4).
xc_microtheory(a65b1250a2c4c4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4c4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4c4,1771).
xc_kb_names(a65b1250a2c4c4,[]).
xc_mapping_rows(a65b1250a2c4c4,[]).
x_genls(x_AntiArmorGrenade,x_AntiArmorWeapon) :- x_cid(a65b1250a2c4c5).
xc_microtheory(a65b1250a2c4c5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4c5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4c5,1773).
xc_kb_names(a65b1250a2c4c5,[]).
xc_mapping_rows(a65b1250a2c4c5,[]).
x_comment(x_GatlingGun,"the collection of mounted, multi-barrel MachineGuns that fire when the wheel to which the barrels are attached, turn.") :- x_cid(a65b1250a2c4c6).
xc_microtheory(a65b1250a2c4c6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4c6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4c6,1775).
xc_kb_names(a65b1250a2c4c6,[]).
xc_mapping_rows(a65b1250a2c4c6,[]).
x_genls(x_GroupFn('x_BallisticMissile-M11'),x_PartiallyTangible) :- x_cid(a65b1250a2c4c7).
xc_microtheory(a65b1250a2c4c7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4c7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4c7,1777).
xc_kb_names(a65b1250a2c4c7,[]).
xc_mapping_rows(a65b1250a2c4c7,[]).
x_genls(x_DetectionFn('x_NavalMine-Deployed'),x_Event) :- x_cid(a65b1250a2c4c8).
xc_microtheory(a65b1250a2c4c8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4c8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4c8,1780).
xc_kb_names(a65b1250a2c4c8,[]).
xc_mapping_rows(a65b1250a2c4c8,[]).
x_genls('x_LGM-30A-MinutemanMissile','x_BallisticMissile-Minuteman1') :- x_cid(a65b1250a2c4c9).
xc_microtheory(a65b1250a2c4c9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4c9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4c9,1783).
xc_kb_names(a65b1250a2c4c9,[]).
xc_mapping_rows(a65b1250a2c4c9,[]).
x_isa(x_Bazooka,x_ExistingObjectType) :- x_cid(a65b1250a2c4ca).
xc_microtheory(a65b1250a2c4ca,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4ca,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4ca,1785).
xc_kb_names(a65b1250a2c4ca,[]).
xc_mapping_rows(a65b1250a2c4ca,[]).
x_isa('x_CruiseMissile-SubmarineLaunched',x_ExistingObjectType) :- x_cid(a65b1250a2c4cb).
xc_microtheory(a65b1250a2c4cb,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4cb,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4cb,1787).
xc_kb_names(a65b1250a2c4cb,[]).
xc_mapping_rows(a65b1250a2c4cb,[]).
x_isa(x_AntiShipMissile,x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c4cc).
xc_microtheory(a65b1250a2c4cc,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4cc,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4cc,1789).
xc_kb_names(a65b1250a2c4cc,[]).
xc_mapping_rows(a65b1250a2c4cc,[]).
x_genls(x_BlisterAgent,x_ChemicalAgent) :- x_cid(a65b1250a2c4cd).
xc_microtheory(a65b1250a2c4cd,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4cd,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4cd,1791).
xc_kb_names(a65b1250a2c4cd,[]).
xc_mapping_rows(a65b1250a2c4cd,[]).
x_isa(x_Weapon,x_ProductType) :- x_cid(a65b1250a2c4ce).
xc_microtheory(a65b1250a2c4ce,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4ce,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4ce,1793).
xc_kb_names(a65b1250a2c4ce,[]).
xc_mapping_rows(a65b1250a2c4ce,[]).
x_comment(x_TimedDetonatingDevice,"The collection of ExplosiveDevices which use Timers to control detonation.") :- x_cid(a65b1250a2c4cf).
xc_microtheory(a65b1250a2c4cf,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4cf,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4cf,1795).
xc_kb_names(a65b1250a2c4cf,[]).
xc_mapping_rows(a65b1250a2c4cf,[]).
x_isa(x_MakingFn(x_ChemicalWeapon),x_Collection) :- x_cid(a65b1250a2c4d0).
xc_microtheory(a65b1250a2c4d0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4d0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4d0,1797).
xc_kb_names(a65b1250a2c4d0,[]).
xc_mapping_rows(a65b1250a2c4d0,[]).
x_genls(x_GeneticallyEngineeredPathogen,x_LivingBiologicalAgent) :- x_cid(a65b1250a2c4d1).
xc_microtheory(a65b1250a2c4d1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4d1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4d1,1800).
xc_kb_names(a65b1250a2c4d1,[]).
xc_mapping_rows(a65b1250a2c4d1,[]).
x_comment('x_AnthraxSprayer-PortableWeapon',"A collection of weapons. Each instance of AnthraxSprayer-PortableWeapon is a spraying device designed to be carried by a single person and used to contaminate an area with anthrax.") :- x_cid(a65b1250a2c4d2).
xc_microtheory(a65b1250a2c4d2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4d2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4d2,1802).
xc_kb_names(a65b1250a2c4d2,[]).
xc_mapping_rows(a65b1250a2c4d2,[]).
x_implies(x_and(x_isa(V1,x_MilitaryBiologicalWeaponsProgram),x_directingAgent(V1,V2)),x_purposeInEvent(V2,V1,x_thereExists(V3,x_and(x_isa(V3,x_MakingFn(x_BiologicalWeapon)),x_directingAgent(V3,V2))))) :- x_cid(a65b1250a2c4d3,V1,V2,V3).
xc_microtheory(a65b1250a2c4d3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4d3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4d3,1804).
xc_kb_names(a65b1250a2c4d3,["?PROGRAM","?AGENT","?MAKING"]).
xc_mapping_rows(a65b1250a2c4d3,['exists-thereexists']).
x_isa('x_BallisticMissile-Minuteman2',x_ProductType) :- x_cid(a65b1250a2c4d4).
xc_microtheory(a65b1250a2c4d4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4d4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4d4,1816).
xc_kb_names(a65b1250a2c4d4,[]).
xc_mapping_rows(a65b1250a2c4d4,[]).
x_genls(x_MakingFn('x_BallisticMissile-SCUDB'),x_MakingSomething) :- x_cid(a65b1250a2c4d5).
xc_microtheory(a65b1250a2c4d5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4d5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4d5,1818).
xc_kb_names(a65b1250a2c4d5,[]).
xc_mapping_rows(a65b1250a2c4d5,[]).
x_genls(x_CruiseMissile,x_MidcourseGuidedProjectile) :- x_cid(a65b1250a2c4d6).
xc_microtheory(a65b1250a2c4d6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4d6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4d6,1821).
xc_kb_names(a65b1250a2c4d6,[]).
xc_mapping_rows(a65b1250a2c4d6,[]).
x_relationAllInstance(x_weaponRange,'x_Torpedo-MK-44',x_Mile(3.4)) :- x_cid(a65b1250a2c4d7).
xc_microtheory(a65b1250a2c4d7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4d7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4d7,1823).
xc_kb_names(a65b1250a2c4d7,[]).
xc_mapping_rows(a65b1250a2c4d7,[]).
x_comment(x_CloseQuarterCombatWeapon,"A collection of the collections of Weapons which are normally used in hand-to-hand combat.") :- x_cid(a65b1250a2c4d8).
xc_microtheory(a65b1250a2c4d8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4d8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4d8,1826).
xc_kb_names(a65b1250a2c4d8,[]).
xc_mapping_rows(a65b1250a2c4d8,[]).
x_genls('x_AnthraxSprayer-PortableWeapon',x_BiologicalWeaponFn('x_Anthrax-Bacterium')) :- x_cid(a65b1250a2c4d9).
xc_microtheory(a65b1250a2c4d9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4d9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4d9,1828).
xc_kb_names(a65b1250a2c4d9,[]).
xc_mapping_rows(a65b1250a2c4d9,[]).
x_argIsa(x_intendedTargetTypeOfWeapon,1,x_Weapon) :- x_cid(a65b1250a2c4da).
xc_microtheory(a65b1250a2c4da,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4da,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4da,1831).
xc_kb_names(a65b1250a2c4da,[]).
xc_mapping_rows(a65b1250a2c4da,[]).
x_cyclistNotes(x_intendedTargetTypeOfWeaponType,"In cases where the user believes he/she has a strong case to make for a class of weapon being intended target more than one class of target, CollectionUnionFn may be used. However, users are strongly cautioned not to reify arbitrary collection-unions unless they appear to be independently useful in their own right. For example, it may be fairly said that Grenades are designed to target a wide range of types--military personnel, ConstructionArtifacts, ArmoredVehicles, and maybe one or two other things besides. However, the collection-union of MilitaryPerson, ConstructionArtifact, and ArmoredVehicle probably has little intrinsic utility attaching to it, which is an argument against having an intendedTargetTypeOfWeaponType asserted for Grenade. Bear in mind that not every weapon class needs to have an intendedTargetTypeOfWeaponType asserted.") :- x_cid(a65b1250a2c4db).
xc_microtheory(a65b1250a2c4db,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4db,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4db,1833).
xc_kb_names(a65b1250a2c4db,[]).
xc_mapping_rows(a65b1250a2c4db,[]).
x_arg2Isa('x_weaponEffectiveRange-Max',x_Distance) :- x_cid(a65b1250a2c4dc).
xc_microtheory(a65b1250a2c4dc,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4dc,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4dc,1835).
xc_kb_names(a65b1250a2c4dc,[]).
xc_mapping_rows(a65b1250a2c4dc,[]).
x_arg2Isa(x_weaponEffectiveRange,x_NonNegativeScalarInterval) :- x_cid(a65b1250a2c4dd).
xc_microtheory(a65b1250a2c4dd,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4dd,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4dd,1837).
xc_kb_names(a65b1250a2c4dd,[]).
xc_mapping_rows(a65b1250a2c4dd,[]).
x_conceptuallyRelated(x_GeneticallyEngineeredBacterium,x_GeneticEngineering) :- x_cid(a65b1250a2c4de).
xc_microtheory(a65b1250a2c4de,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4de,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4de,1839).
xc_kb_names(a65b1250a2c4de,[]).
xc_mapping_rows(a65b1250a2c4de,[]).
x_isa(x_ChemicalWeaponFn(x_Lewisite),x_ProductType) :- x_cid(a65b1250a2c4df).
xc_microtheory(a65b1250a2c4df,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4df,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4df,1841).
xc_kb_names(a65b1250a2c4df,[]).
xc_mapping_rows(a65b1250a2c4df,[]).
x_isa('x_SurfaceToSurfaceMissile-Ballistic',x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c4e0).
xc_microtheory(a65b1250a2c4e0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4e0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4e0,1844).
xc_kb_names(a65b1250a2c4e0,[]).
xc_mapping_rows(a65b1250a2c4e0,[]).
x_genls('x_BiologicalWeapon-BiologicalToxinBased',x_BiologicalWeapon) :- x_cid(a65b1250a2c4e1).
xc_microtheory(a65b1250a2c4e1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4e1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4e1,1846).
xc_kb_names(a65b1250a2c4e1,[]).
xc_mapping_rows(a65b1250a2c4e1,[]).
x_genls('x_BallisticMissile-ShortRange',x_BallisticMissile) :- x_cid(a65b1250a2c4e2).
xc_microtheory(a65b1250a2c4e2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4e2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4e2,1848).
xc_kb_names(a65b1250a2c4e2,[]).
xc_mapping_rows(a65b1250a2c4e2,[]).
x_comment(x_SmoothBoreWeapon,"The collection of ProjectileLaunchers that have Bores with smooth surfaces.") :- x_cid(a65b1250a2c4e3).
xc_microtheory(a65b1250a2c4e3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4e3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4e3,1850).
xc_kb_names(a65b1250a2c4e3,[]).
xc_mapping_rows(a65b1250a2c4e3,[]).
x_arg2Isa(x_intendedTargetTypeOfWeapon,x_AttackOnTangible) :- x_cid(a65b1250a2c4e4).
xc_microtheory(a65b1250a2c4e4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4e4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4e4,1852).
xc_kb_names(a65b1250a2c4e4,[]).
xc_mapping_rows(a65b1250a2c4e4,[]).
x_intendedTargetTypeOfWeaponType(V1,x_IntendedTargetTypeFn(V1)) :- x_cid(a65b1250a2c4e5,V1).
xc_microtheory(a65b1250a2c4e5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4e5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4e5,1854).
xc_kb_names(a65b1250a2c4e5,["?WEAPONTYPE"]).
xc_mapping_rows(a65b1250a2c4e5,[]).
x_genls(x_GatlingGun,x_HeavyMachineGun) :- x_cid(a65b1250a2c4e6).
xc_microtheory(a65b1250a2c4e6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4e6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4e6,1857).
xc_kb_names(a65b1250a2c4e6,[]).
xc_mapping_rows(a65b1250a2c4e6,[]).
x_genls(x_DistilledMustardGas,x_MustardGas) :- x_cid(a65b1250a2c4e7).
xc_microtheory(a65b1250a2c4e7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4e7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4e7,1859).
xc_kb_names(a65b1250a2c4e7,[]).
xc_mapping_rows(a65b1250a2c4e7,[]).
x_genls(x_SilkwormMissile,x_AntiShipCruiseMissile) :- x_cid(a65b1250a2c4e8).
xc_microtheory(a65b1250a2c4e8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4e8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4e8,1861).
xc_kb_names(a65b1250a2c4e8,[]).
xc_mapping_rows(a65b1250a2c4e8,[]).
x_genls('x_CruiseMissile-SubmarineLaunched',x_CruiseMissile) :- x_cid(a65b1250a2c4e9).
xc_microtheory(a65b1250a2c4e9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4e9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4e9,1863).
xc_kb_names(a65b1250a2c4e9,[]).
xc_mapping_rows(a65b1250a2c4e9,[]).
x_isa(x_AntiShipMissile,x_ExistingObjectType) :- x_cid(a65b1250a2c4ea).
xc_microtheory(a65b1250a2c4ea,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4ea,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4ea,1865).
xc_kb_names(a65b1250a2c4ea,[]).
xc_mapping_rows(a65b1250a2c4ea,[]).
x_genls(x_ChokingAgent,x_ChemicalAgent) :- x_cid(a65b1250a2c4eb).
xc_microtheory(a65b1250a2c4eb,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4eb,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4eb,1867).
xc_kb_names(a65b1250a2c4eb,[]).
xc_mapping_rows(a65b1250a2c4eb,[]).
x_genls(x_TimedDetonatingDevice,x_ExplosiveDevice) :- x_cid(a65b1250a2c4ec).
xc_microtheory(a65b1250a2c4ec,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4ec,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4ec,1869).
xc_kb_names(a65b1250a2c4ec,[]).
xc_mapping_rows(a65b1250a2c4ec,[]).
x_isa(x_GeneticallyEngineeredPathogen,x_ExistingObjectType) :- x_cid(a65b1250a2c4ed).
xc_microtheory(a65b1250a2c4ed,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4ed,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4ed,1871).
xc_kb_names(a65b1250a2c4ed,[]).
xc_mapping_rows(a65b1250a2c4ed,[]).
x_genls('x_AnthraxSprayer-PortableWeapon',x_PortableObject) :- x_cid(a65b1250a2c4ee).
xc_microtheory(a65b1250a2c4ee,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4ee,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4ee,1873).
xc_kb_names(a65b1250a2c4ee,[]).
xc_mapping_rows(a65b1250a2c4ee,[]).
x_relationAllInstance(x_weaponRange,'x_Torpedo-MK-46',x_Mile(6.4)) :- x_cid(a65b1250a2c4ef).
xc_microtheory(a65b1250a2c4ef,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4ef,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4ef,1875).
xc_kb_names(a65b1250a2c4ef,[]).
xc_mapping_rows(a65b1250a2c4ef,[]).
x_genls(x_SurfaceToAirMissileLauncher,x_AntiAircraftWeapon) :- x_cid(a65b1250a2c4f0).
xc_microtheory(a65b1250a2c4f0,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4f0,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4f0,1878).
xc_kb_names(a65b1250a2c4f0,[]).
xc_mapping_rows(a65b1250a2c4f0,[]).
x_isa(x_LaunchGuidedProjectile,x_ExistingObjectType) :- x_cid(a65b1250a2c4f1).
xc_microtheory(a65b1250a2c4f1,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4f1,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4f1,1880).
xc_kb_names(a65b1250a2c4f1,[]).
xc_mapping_rows(a65b1250a2c4f1,[]).
x_genls(x_BrucellaBacterium,x_LivingBiologicalAgent) :- x_cid(a65b1250a2c4f2).
xc_microtheory(a65b1250a2c4f2,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4f2,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4f2,1882).
xc_kb_names(a65b1250a2c4f2,[]).
xc_mapping_rows(a65b1250a2c4f2,[]).
x_genls(x_AntiShipCruiseMissile,x_CruiseMissile) :- x_cid(a65b1250a2c4f3).
xc_microtheory(a65b1250a2c4f3,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4f3,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4f3,1884).
xc_kb_names(a65b1250a2c4f3,[]).
xc_mapping_rows(a65b1250a2c4f3,[]).
x_comment('x_BiologicalWeapon-Viral',"The collection of all BiologicalWeapons that make use of viruses.") :- x_cid(a65b1250a2c4f4).
xc_microtheory(a65b1250a2c4f4,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4f4,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4f4,1886).
xc_kb_names(a65b1250a2c4f4,[]).
xc_mapping_rows(a65b1250a2c4f4,[]).
x_isa(x_BiologicalWeaponFn('x_Anthrax-Bacterium'),x_ExistingObjectType) :- x_cid(a65b1250a2c4f5).
xc_microtheory(a65b1250a2c4f5,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4f5,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4f5,1888).
xc_kb_names(a65b1250a2c4f5,[]).
xc_mapping_rows(a65b1250a2c4f5,[]).
x_comment('x_BallisticMissile-AlHussein',"Efforts to extend the standard Scud B's (BallisticMissile-SCUDB) range began in the early 1980s as project 144, and in August 1987 Saddam announced that it had successfully tested a longer-range Scud, the Al Hussein (BallisticMissile-AlHussein), over a range of more than 500 km.") :- x_cid(a65b1250a2c4f6).
xc_microtheory(a65b1250a2c4f6,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4f6,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4f6,1891).
xc_kb_names(a65b1250a2c4f6,[]).
xc_mapping_rows(a65b1250a2c4f6,[]).
x_arg1Isa(x_intendedTargetTypeOfWeapon,x_Weapon) :- x_cid(a65b1250a2c4f7).
xc_microtheory(a65b1250a2c4f7,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4f7,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4f7,1893).
xc_kb_names(a65b1250a2c4f7,[]).
xc_mapping_rows(a65b1250a2c4f7,[]).
x_cyclistNotes(x_intendedTargetTypeOfWeaponType,"This predicate is NOT transitive via genls in either of its argument positions. This is due to the fact that the predicate is deemed to be functional in the second argument position. The reason of THIS is that it is supposed that, where a primary target type is specified, it will be specified at a certain level, and it will be incorrect to also specify a more general or a more specific thing. Making the second argument transitive or inverse-transitive via genls would defeat this purpose. More subtly, making the first argument transitive or inverse-transitive via genls would too, because once an intended target type had been inherited to a more specific or a more general weapon type, it would become impossible to assert a more specific target type for the more specific weapon type, or a more general target type for the more general weapon type, which one might very well want to do.") :- x_cid(a65b1250a2c4f8).
xc_microtheory(a65b1250a2c4f8,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4f8,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4f8,1895).
xc_kb_names(a65b1250a2c4f8,[]).
xc_mapping_rows(a65b1250a2c4f8,[]).
x_genls(x_ChemicalWeaponFn(x_Lewisite),x_ChemicalWeapon) :- x_cid(a65b1250a2c4f9).
xc_microtheory(a65b1250a2c4f9,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4f9,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4f9,1897).
xc_kb_names(a65b1250a2c4f9,[]).
xc_mapping_rows(a65b1250a2c4f9,[]).
x_genls(x_BiologicalWeaponFn(x_Saxitoxin),'x_BiologicalWeapon-BiologicalToxinBased') :- x_cid(a65b1250a2c4fa).
xc_microtheory(a65b1250a2c4fa,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4fa,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4fa,1900).
xc_kb_names(a65b1250a2c4fa,[]).
xc_mapping_rows(a65b1250a2c4fa,[]).
x_comment(x_AerialSpraytank,"A means of delivery for certain kinds of weapons.") :- x_cid(a65b1250a2c4fb).
xc_microtheory(a65b1250a2c4fb,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4fb,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4fb,1903).
xc_kb_names(a65b1250a2c4fb,[]).
xc_mapping_rows(a65b1250a2c4fb,[]).
x_isa('x_BiologicalWeapon-GeneticallyEngineeredOrganismBased',x_BiologicalWeaponTypeByAgent) :- x_cid(a65b1250a2c4fc).
xc_microtheory(a65b1250a2c4fc,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4fc,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4fc,1905).
xc_kb_names(a65b1250a2c4fc,[]).
xc_mapping_rows(a65b1250a2c4fc,[]).
x_isa('x_BallisticMissile-ShortRange',x_ExistingObjectType) :- x_cid(a65b1250a2c4fd).
xc_microtheory(a65b1250a2c4fd,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4fd,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4fd,1907).
xc_kb_names(a65b1250a2c4fd,[]).
xc_mapping_rows(a65b1250a2c4fd,[]).
x_genls(x_SmoothBoreWeapon,x_ProjectileLauncher) :- x_cid(a65b1250a2c4fe).
xc_microtheory(a65b1250a2c4fe,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4fe,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4fe,1909).
xc_kb_names(a65b1250a2c4fe,[]).
xc_mapping_rows(a65b1250a2c4fe,[]).
x_genls(x_MinutemanBallisticMissile,'x_BallisticMissile-ICBM') :- x_cid(a65b1250a2c4ff).
xc_microtheory(a65b1250a2c4ff,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c4ff,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c4ff,1911).
xc_kb_names(a65b1250a2c4ff,[]).
xc_mapping_rows(a65b1250a2c4ff,[]).
x_comment(x_Howitzer,"A collection. Each instance is a large Weapon too large for one person to carry and used for indirect shooting. A Howitzer has a caliber larger than 15mm and fires projectiles at medium muzzle speed with a trajectory over 45 degrees.") :- x_cid(a65b1250a2c500).
xc_microtheory(a65b1250a2c500,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c500,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c500,1913).
xc_kb_names(a65b1250a2c500,[]).
xc_mapping_rows(a65b1250a2c500,[]).
x_isa(x_DistilledMustardGas,x_ProductType) :- x_cid(a65b1250a2c501).
xc_microtheory(a65b1250a2c501,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c501,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c501,1915).
xc_kb_names(a65b1250a2c501,[]).
xc_mapping_rows(a65b1250a2c501,[]).
x_isa('x_LGM-30A-MinutemanMissile',x_ExistingObjectType) :- x_cid(a65b1250a2c502).
xc_microtheory(a65b1250a2c502,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c502,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c502,1917).
xc_kb_names(a65b1250a2c502,[]).
xc_mapping_rows(a65b1250a2c502,[]).
x_implies(x_and(x_isa(V1,x_ShootingAProjectileWeapon),x_damages(V1,V2),x_fromLocation(V1,V3),'x_instrument-Generic'(V1,V3),x_deviceUsed(V1,V4),x_weaponEffectiveRange(V4,V5),x_distanceBetween(V2,V3,V6)),x_quantitySubsumes(V5,V6)) :- x_cid(a65b1250a2c503,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1250a2c503,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c503,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c503,1919).
xc_kb_names(a65b1250a2c503,["?SHOOTING","?TARGET","?LAUNCHER","?WEAPON","?RANGE","?DIST"]).
xc_mapping_rows(a65b1250a2c503,[]).
x_argIsa('x_weaponEffectiveRange-Max',2,x_PositiveScalarInterval) :- x_cid(a65b1250a2c504).
xc_microtheory(a65b1250a2c504,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c504,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c504,1930).
xc_kb_names(a65b1250a2c504,[]).
xc_mapping_rows(a65b1250a2c504,[]).
x_genls(x_BloodAgent,x_ChemicalAgent) :- x_cid(a65b1250a2c505).
xc_microtheory(a65b1250a2c505,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c505,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c505,1932).
xc_kb_names(a65b1250a2c505,[]).
xc_mapping_rows(a65b1250a2c505,[]).
x_isa(x_TimedDetonatingDevice,x_ExistingObjectType) :- x_cid(a65b1250a2c506).
xc_microtheory(a65b1250a2c506,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c506,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c506,1934).
xc_kb_names(a65b1250a2c506,[]).
xc_mapping_rows(a65b1250a2c506,[]).
x_genls(x_GeneticallyEngineeredPathogen,x_GeneticallyEngineeredOrganism) :- x_cid(a65b1250a2c507).
xc_microtheory(a65b1250a2c507,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c507,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c507,1936).
xc_kb_names(a65b1250a2c507,[]).
xc_mapping_rows(a65b1250a2c507,[]).
x_isa('x_AnthraxSprayer-PortableWeapon',x_ExistingObjectType) :- x_cid(a65b1250a2c508).
xc_microtheory(a65b1250a2c508,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c508,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c508,1938).
xc_kb_names(a65b1250a2c508,[]).
xc_mapping_rows(a65b1250a2c508,[]).
x_genls(x_TearGas,x_IncapacitatingAgent) :- x_cid(a65b1250a2c509).
xc_microtheory(a65b1250a2c509,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c509,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c509,1940).
xc_kb_names(a65b1250a2c509,[]).
xc_mapping_rows(a65b1250a2c509,[]).
x_comment('x_Torpedo-MK-44',"A type of Torpedo with ActiveSonar-Device.") :- x_cid(a65b1250a2c50a).
xc_microtheory(a65b1250a2c50a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c50a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c50a,1942).
xc_kb_names(a65b1250a2c50a,[]).
xc_mapping_rows(a65b1250a2c50a,[]).
x_comment('x_SmallArm-Weapon',"A subset of Weapon. Each element of the collection SmallArm-Weapon can be carried by one person. Subsets include Grenade, Sidearm and CloseCombatWeapon.") :- x_cid(a65b1250a2c50b).
xc_microtheory(a65b1250a2c50b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c50b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c50b,1944).
xc_kb_names(a65b1250a2c50b,[]).
xc_mapping_rows(a65b1250a2c50b,[]).
x_comment(x_SurfaceToAirMissileLauncher,"The collection of all MissileLaunchers that fire SurfaceToAirMissiles.") :- x_cid(a65b1250a2c50c).
xc_microtheory(a65b1250a2c50c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c50c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c50c,1946).
xc_kb_names(a65b1250a2c50c,[]).
xc_mapping_rows(a65b1250a2c50c,[]).
x_genls(x_AntiArmorGrenade,x_Bomb) :- x_cid(a65b1250a2c50d).
xc_microtheory(a65b1250a2c50d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c50d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c50d,1948).
xc_kb_names(a65b1250a2c50d,[]).
xc_mapping_rows(a65b1250a2c50d,[]).
x_genls('x_BallisticMissile-AlHussein','x_BallisticMissile-SCUDB') :- x_cid(a65b1250a2c50e).
xc_microtheory(a65b1250a2c50e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c50e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c50e,1950).
xc_kb_names(a65b1250a2c50e,[]).
xc_mapping_rows(a65b1250a2c50e,[]).
x_isa(x_GroupFn('x_BallisticMissile-Mushak120'),x_ObjectType) :- x_cid(a65b1250a2c50f).
xc_microtheory(a65b1250a2c50f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c50f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c50f,1952).
xc_kb_names(a65b1250a2c50f,[]).
xc_mapping_rows(a65b1250a2c50f,[]).
x_argIsa('x_weaponEffectiveRange-Min',2,x_Distance) :- x_cid(a65b1250a2c510).
xc_microtheory(a65b1250a2c510,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c510,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c510,1955).
xc_kb_names(a65b1250a2c510,[]).
xc_mapping_rows(a65b1250a2c510,[]).
x_cyclistNotes(x_intendedTargetTypeOfWeaponType,"It is very important that the *PRIMARY* target type be the type cited in the second argument. For example, it would be INCORRECT to assert (intendedTargetTypeOfWeaponType AntiArmorWeapon Person) even though anti armor weapons work primarily against armored vehicles and armored vehicles are generally driven by persons. In cases where the designer or design specification of the weapon type does not explicitly mention what the 'primary' class of target is, determining this may be hard, and in some cases, impossible.") :- x_cid(a65b1250a2c511).
xc_microtheory(a65b1250a2c511,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c511,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c511,1957).
xc_kb_names(a65b1250a2c511,[]).
xc_mapping_rows(a65b1250a2c511,[]).
x_isa(x_ChemicalWeaponFn(x_Lewisite),x_ExistingObjectType) :- x_cid(a65b1250a2c512).
xc_microtheory(a65b1250a2c512,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c512,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c512,1959).
xc_kb_names(a65b1250a2c512,[]).
xc_mapping_rows(a65b1250a2c512,[]).
x_genls(x_BiologicalWeaponFn(x_Saxitoxin),x_BiologicalWeapon) :- x_cid(a65b1250a2c513).
xc_microtheory(a65b1250a2c513,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c513,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c513,1962).
xc_kb_names(a65b1250a2c513,[]).
xc_mapping_rows(a65b1250a2c513,[]).
x_genls(x_AerialSpraytank,x_MilitaryHardware) :- x_cid(a65b1250a2c514).
xc_microtheory(a65b1250a2c514,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c514,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c514,1965).
xc_kb_names(a65b1250a2c514,[]).
xc_mapping_rows(a65b1250a2c514,[]).
x_genls('x_BiologicalWeapon-GeneticallyEngineeredOrganismBased',x_BiologicalWeapon) :- x_cid(a65b1250a2c515).
xc_microtheory(a65b1250a2c515,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c515,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c515,1967).
xc_kb_names(a65b1250a2c515,[]).
xc_mapping_rows(a65b1250a2c515,[]).
x_comment('x_BallisticMissile-BattlefieldShortRange',"A ballistic missile with a range of up to 94 miles") :- x_cid(a65b1250a2c516).
xc_microtheory(a65b1250a2c516,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c516,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c516,1969).
xc_kb_names(a65b1250a2c516,[]).
xc_mapping_rows(a65b1250a2c516,[]).
x_isa(x_SmoothBoreWeapon,x_ExistingObjectType) :- x_cid(a65b1250a2c517).
xc_microtheory(a65b1250a2c517,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c517,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c517,1971).
xc_kb_names(a65b1250a2c517,[]).
xc_mapping_rows(a65b1250a2c517,[]).
x_isa(x_MinutemanBallisticMissile,x_ExistingObjectType) :- x_cid(a65b1250a2c518).
xc_microtheory(a65b1250a2c518,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c518,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c518,1973).
xc_kb_names(a65b1250a2c518,[]).
xc_mapping_rows(a65b1250a2c518,[]).
x_resultGenl(x_IntendedTargetTypeFn,x_SomethingExisting) :- x_cid(a65b1250a2c519).
xc_microtheory(a65b1250a2c519,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c519,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c519,1975).
xc_kb_names(a65b1250a2c519,[]).
xc_mapping_rows(a65b1250a2c519,[]).
x_isa(x_Howitzer,x_ExistingObjectType) :- x_cid(a65b1250a2c51a).
xc_microtheory(a65b1250a2c51a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c51a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c51a,1977).
xc_kb_names(a65b1250a2c51a,[]).
xc_mapping_rows(a65b1250a2c51a,[]).
x_isa(x_HeavyMachineGun,x_ExistingObjectType) :- x_cid(a65b1250a2c51b).
xc_microtheory(a65b1250a2c51b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c51b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c51b,1979).
xc_kb_names(a65b1250a2c51b,[]).
xc_mapping_rows(a65b1250a2c51b,[]).
x_isa(x_DistilledMustardGas,x_ExistingStuffType) :- x_cid(a65b1250a2c51c).
xc_microtheory(a65b1250a2c51c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c51c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c51c,1981).
xc_kb_names(a65b1250a2c51c,[]).
xc_mapping_rows(a65b1250a2c51c,[]).
x_isa('x_LGM-30A-MinutemanMissile',x_ProductType) :- x_cid(a65b1250a2c51d).
xc_microtheory(a65b1250a2c51d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c51d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c51d,1983).
xc_kb_names(a65b1250a2c51d,[]).
xc_mapping_rows(a65b1250a2c51d,[]).
x_implies(x_and(x_genls(V1,V2),x_different(V1,V2),x_intendedTargetTypeOfWeaponType(V1,V3),x_intendedTargetTypeOfWeaponType(V2,V4)),x_genls(V3,V4)) :- x_cid(a65b1250a2c51e,V1,V2,V3,V4).
xc_microtheory(a65b1250a2c51e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c51e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c51e,1985).
xc_kb_names(a65b1250a2c51e,["?WEAPONSPECTYPE","?WEAPONTYPE","?TARGETSPECTYPE","?TARGETTYPE"]).
xc_mapping_rows(a65b1250a2c51e,[]).
x_implies(x_and(x_weaponEffectiveRange(V1,V2),x_minQuantValue(V2,V3)),'x_weaponEffectiveRange-Min'(V1,V3)) :- x_cid(a65b1250a2c51f,V1,V2,V3).
xc_microtheory(a65b1250a2c51f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c51f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c51f,1993).
xc_kb_names(a65b1250a2c51f,["?WEAPON","?RANGE","?MINRANGE"]).
xc_mapping_rows(a65b1250a2c51f,[]).
x_genls(x_MortarShell,x_ArtilleryShell) :- x_cid(a65b1250a2c520).
xc_microtheory(a65b1250a2c520,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c520,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c520,1999).
xc_kb_names(a65b1250a2c520,[]).
xc_mapping_rows(a65b1250a2c520,[]).
x_comment(x_PointDetonatingWeapon,"The collection of ExplosiveDevices which detonate upon impact.") :- x_cid(a65b1250a2c521).
xc_microtheory(a65b1250a2c521,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c521,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c521,2001).
xc_kb_names(a65b1250a2c521,[]).
xc_mapping_rows(a65b1250a2c521,[]).
x_comment(x_IncapacitatingAgent,"The collection of ToxicSubstances designed to cause temporary disability in its target.") :- x_cid(a65b1250a2c522).
xc_microtheory(a65b1250a2c522,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c522,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c522,2003).
xc_kb_names(a65b1250a2c522,[]).
xc_mapping_rows(a65b1250a2c522,[]).
x_implies(x_resourceCapableOf(V1,x_WeaponOfMassDestructionAttack,x_performedBy),x_relationInstanceExists(x_possesses,V1,x_WeaponOfMassDestruction)) :- x_cid(a65b1250a2c523,V1).
xc_microtheory(a65b1250a2c523,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c523,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c523,2005).
xc_kb_names(a65b1250a2c523,["?AGENT"]).
xc_mapping_rows(a65b1250a2c523,[]).
x_genls('x_Torpedo-MK-44',x_Torpedo) :- x_cid(a65b1250a2c524).
xc_microtheory(a65b1250a2c524,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c524,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c524,2009).
xc_kb_names(a65b1250a2c524,[]).
xc_mapping_rows(a65b1250a2c524,[]).
x_isa(x_MakingFn('x_BallisticMissile-SCUDB'),x_Collection) :- x_cid(a65b1250a2c525).
xc_microtheory(a65b1250a2c525,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c525,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c525,2011).
xc_kb_names(a65b1250a2c525,[]).
xc_mapping_rows(a65b1250a2c525,[]).
x_comment(x_SurfaceToSurfaceMissile,"The collection of all Missiles propelled from a surface Platform-Military (located on land or on water), with the intention of having it detonate on contact with the target that is either on land or water.") :- x_cid(a65b1250a2c526).
xc_microtheory(a65b1250a2c526,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c526,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c526,2014).
xc_kb_names(a65b1250a2c526,[]).
xc_mapping_rows(a65b1250a2c526,[]).
x_genls(x_LightSurfaceToAirMissileLauncher,x_SurfaceToAirMissileLauncher) :- x_cid(a65b1250a2c527).
xc_microtheory(a65b1250a2c527,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c527,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c527,2016).
xc_kb_names(a65b1250a2c527,[]).
xc_mapping_rows(a65b1250a2c527,[]).
x_genls(x_SemiAutomaticFirearm,x_Gun) :- x_cid(a65b1250a2c528).
xc_microtheory(a65b1250a2c528,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c528,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c528,2018).
xc_kb_names(a65b1250a2c528,[]).
xc_mapping_rows(a65b1250a2c528,[]).
x_genls('x_Plague-Bacterium',x_LivingBiologicalAgent) :- x_cid(a65b1250a2c529).
xc_microtheory(a65b1250a2c529,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c529,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c529,2020).
xc_kb_names(a65b1250a2c529,[]).
xc_mapping_rows(a65b1250a2c529,[]).
x_comment('x_Howitzer-155mmSelfPropelled',"The collection of self-propelled 155mm Howitzers.") :- x_cid(a65b1250a2c52a).
xc_microtheory(a65b1250a2c52a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c52a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c52a,2022).
xc_kb_names(a65b1250a2c52a,[]).
xc_mapping_rows(a65b1250a2c52a,[]).
x_genls(x_AntiArmorGrenade,x_ConventionalWeapon) :- x_cid(a65b1250a2c52b).
xc_microtheory(a65b1250a2c52b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c52b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c52b,2024).
xc_kb_names(a65b1250a2c52b,[]).
xc_mapping_rows(a65b1250a2c52b,[]).
x_comment('x_CruiseMissile-AirLaunched',"The collection of CruiseMissiles which are deployed from MilitaryAircraft.") :- x_cid(a65b1250a2c52c).
xc_microtheory(a65b1250a2c52c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c52c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c52c,2026).
xc_kb_names(a65b1250a2c52c,[]).
xc_mapping_rows(a65b1250a2c52c,[]).
x_genls(x_Howitzer,x_FieldArtillery) :- x_cid(a65b1250a2c52d).
xc_microtheory(a65b1250a2c52d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c52d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c52d,2028).
xc_kb_names(a65b1250a2c52d,[]).
xc_mapping_rows(a65b1250a2c52d,[]).
x_implies(x_and(x_isa(V1,x_LaunchingAMissile),x_objectEmitted(V1,V2),x_isa(V2,x_AntiSubmarineRocket)),x_transportees(V1,'x_SKF-2834698'(V2,V1,1))) :- x_cid(a65b1250a2c52e,V1,V2).
xc_microtheory(a65b1250a2c52e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c52e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c52e,2030).
xc_kb_names(a65b1250a2c52e,["?LAUNCH","?ASROC"]).
xc_mapping_rows(a65b1250a2c52e,[]).
x_isa(x_GroupFn('x_BallisticMissile-Mushak160'),x_ObjectType) :- x_cid(a65b1250a2c52f).
xc_microtheory(a65b1250a2c52f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c52f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c52f,2038).
xc_kb_names(a65b1250a2c52f,[]).
xc_mapping_rows(a65b1250a2c52f,[]).
x_arg2Isa('x_weaponEffectiveRange-Min',x_Distance) :- x_cid(a65b1250a2c530).
xc_microtheory(a65b1250a2c530,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c530,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c530,2041).
xc_kb_names(a65b1250a2c530,[]).
xc_mapping_rows(a65b1250a2c530,[]).
x_comment(x_intendedTargetTypeOfWeaponType,"Many classes of weapon are defined in part by the type of thing that instances are intended to immediately target, e.g. AntiPersonnelMine. intendedTargetTypeOfWeaponType is intended to allow us to explicate the class of thing immediately targeted by a particular type of Weapon, if such a class is known. (intendedTargetTypeOfWeaponType WEAPON-TYPE TARGET-TYPE) means that weapons of type WEAPON-TYPE are designed to be used primarily against typical instances of TARGET-TYPE.") :- x_cid(a65b1250a2c531).
xc_microtheory(a65b1250a2c531,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c531,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c531,2043).
xc_kb_names(a65b1250a2c531,[]).
xc_mapping_rows(a65b1250a2c531,[]).
x_arg2Isa(x_angleOfLauncher,x_AngularDistance) :- x_cid(a65b1250a2c532).
xc_microtheory(a65b1250a2c532,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c532,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c532,2045).
xc_kb_names(a65b1250a2c532,[]).
xc_mapping_rows(a65b1250a2c532,[]).
x_relationAllExists(x_outputsCreated,x_MakingFn(x_NerveAgent),x_NerveAgent) :- x_cid(a65b1250a2c533).
xc_microtheory(a65b1250a2c533,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c533,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c533,2047).
xc_kb_names(a65b1250a2c533,[]).
xc_mapping_rows(a65b1250a2c533,[]).
x_isa(x_BiologicalWeaponFn(x_Saxitoxin),x_ExistingObjectType) :- x_cid(a65b1250a2c534).
xc_microtheory(a65b1250a2c534,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c534,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c534,2050).
xc_kb_names(a65b1250a2c534,[]).
xc_mapping_rows(a65b1250a2c534,[]).
x_isa('x_BallisticMissile-ShortRange',x_MilitaryWeaponTypeByFunction) :- x_cid(a65b1250a2c535).
xc_microtheory(a65b1250a2c535,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c535,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c535,2053).
xc_kb_names(a65b1250a2c535,[]).
xc_mapping_rows(a65b1250a2c535,[]).
x_genls('x_Platform-Military',x_MilitaryHardware) :- x_cid(a65b1250a2c536).
xc_microtheory(a65b1250a2c536,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c536,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c536,2055).
xc_kb_names(a65b1250a2c536,[]).
xc_mapping_rows(a65b1250a2c536,[]).
x_isa(x_AerialSpraytank,x_ExistingObjectType) :- x_cid(a65b1250a2c537).
xc_microtheory(a65b1250a2c537,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c537,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c537,2057).
xc_kb_names(a65b1250a2c537,[]).
xc_mapping_rows(a65b1250a2c537,[]).
x_isa('x_BiologicalWeapon-Bacterial',x_BiologicalWeaponTypeByAgent) :- x_cid(a65b1250a2c538).
xc_microtheory(a65b1250a2c538,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c538,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c538,2059).
xc_kb_names(a65b1250a2c538,[]).
xc_mapping_rows(a65b1250a2c538,[]).
x_implies(x_and(x_genls(V1,x_MilitaryWeapon),x_isa(V2,V1),x_behaviorCapable(V3,x_CollectionSubsetFn(x_AttackOnTangible,x_TheSetOf(V4,'x_instrument-Generic'(V4,V2))),x_performedBy)),x_relationInstanceExistsMany(x_possesses,V3,V1)) :- x_cid(a65b1250a2c539,V1,V2,V3,V4).
xc_microtheory(a65b1250a2c539,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c539,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c539,2061).
xc_kb_names(a65b1250a2c539,["?WEAPONTYPE","?WEAPON","?AGENT","?OBJ"]).
xc_mapping_rows(a65b1250a2c539,[]).
x_isa('x_BallisticMissile-BattlefieldShortRange',x_ExistingObjectType) :- x_cid(a65b1250a2c53a).
xc_microtheory(a65b1250a2c53a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c53a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c53a,2071).
xc_kb_names(a65b1250a2c53a,[]).
xc_mapping_rows(a65b1250a2c53a,[]).
x_comment(x_BoforsGun,"A large, double barrelled MachineCannon used to shoot down airplanes.") :- x_cid(a65b1250a2c53b).
xc_microtheory(a65b1250a2c53b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c53b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c53b,2073).
xc_kb_names(a65b1250a2c53b,[]).
xc_mapping_rows(a65b1250a2c53b,[]).
x_isa(x_MinutemanBallisticMissile,x_ProductType) :- x_cid(a65b1250a2c53c).
xc_microtheory(a65b1250a2c53c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c53c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c53c,2075).
xc_kb_names(a65b1250a2c53c,[]).
xc_mapping_rows(a65b1250a2c53c,[]).
x_resultIsa(x_IntendedTargetTypeFn,x_Collection) :- x_cid(a65b1250a2c53d).
xc_microtheory(a65b1250a2c53d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c53d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c53d,2077).
xc_kb_names(a65b1250a2c53d,[]).
xc_mapping_rows(a65b1250a2c53d,[]).
x_not(x_isa('x_NavalMine-Deployed',x_ProductType)) :- x_cid(a65b1250a2c53e).
xc_microtheory(a65b1250a2c53e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c53e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c53e,2079).
xc_kb_names(a65b1250a2c53e,[]).
xc_mapping_rows(a65b1250a2c53e,[]).
x_relationAllInstance(x_groupMemberType,x_GroupFn('x_BallisticMissile-Mushak120'),'x_BallisticMissile-Mushak120') :- x_cid(a65b1250a2c53f).
xc_microtheory(a65b1250a2c53f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c53f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c53f,2082).
xc_kb_names(a65b1250a2c53f,[]).
xc_mapping_rows(a65b1250a2c53f,[]).
x_isa(x_MustardGas,x_ProductType) :- x_cid(a65b1250a2c540).
xc_microtheory(a65b1250a2c540,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c540,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c540,2085).
xc_kb_names(a65b1250a2c540,[]).
xc_mapping_rows(a65b1250a2c540,[]).
x_genls(x_LSD,x_ChemicalAgent) :- x_cid(a65b1250a2c541).
xc_microtheory(a65b1250a2c541,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c541,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c541,2087).
xc_kb_names(a65b1250a2c541,[]).
xc_mapping_rows(a65b1250a2c541,[]).
x_genls(x_PointDetonatingWeapon,x_Weapon) :- x_cid(a65b1250a2c542).
xc_microtheory(a65b1250a2c542,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c542,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c542,2089).
xc_kb_names(a65b1250a2c542,[]).
xc_mapping_rows(a65b1250a2c542,[]).
x_comment(x_105MMRifledBoreCannon,"A kind of Cannon common on Tank-Vehicles.") :- x_cid(a65b1250a2c543).
xc_microtheory(a65b1250a2c543,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c543,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c543,2091).
xc_kb_names(a65b1250a2c543,[]).
xc_mapping_rows(a65b1250a2c543,[]).
x_isa('x_Torpedo-MK-44',x_ProductType) :- x_cid(a65b1250a2c544).
xc_microtheory(a65b1250a2c544,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c544,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c544,2093).
xc_kb_names(a65b1250a2c544,[]).
xc_mapping_rows(a65b1250a2c544,[]).
x_genls('x_SmallArm-Weapon',x_PortableObject) :- x_cid(a65b1250a2c545).
xc_microtheory(a65b1250a2c545,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c545,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c545,2095).
xc_kb_names(a65b1250a2c545,[]).
xc_mapping_rows(a65b1250a2c545,[]).
x_relationAllExists(x_outputsCreated,x_MakingFn('x_BallisticMissile-SCUDC'),'x_BallisticMissile-SCUDC') :- x_cid(a65b1250a2c546).
xc_microtheory(a65b1250a2c546,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c546,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c546,2097).
xc_kb_names(a65b1250a2c546,[]).
xc_mapping_rows(a65b1250a2c546,[]).
x_genls('x_Howitzer-155mmSelfPropelled','x_Artillery-SelfPropelled') :- x_cid(a65b1250a2c547).
xc_microtheory(a65b1250a2c547,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c547,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c547,2100).
xc_kb_names(a65b1250a2c547,[]).
xc_mapping_rows(a65b1250a2c547,[]).
x_genls(x_FighterInterceptorPlane,x_AntiWeaponTypeFn(x_Warplane)) :- x_cid(a65b1250a2c548).
xc_microtheory(a65b1250a2c548,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c548,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c548,2102).
xc_kb_names(a65b1250a2c548,[]).
xc_mapping_rows(a65b1250a2c548,[]).
x_implies(x_and(x_isa(V1,x_LaunchingAMissile),x_isa(V2,x_AntiSubmarineRocket),x_objectEmitted(V1,V2)),x_transporter(V1,V2)) :- x_cid(a65b1250a2c549,V1,V2).
xc_microtheory(a65b1250a2c549,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c549,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c549,2105).
xc_kb_names(a65b1250a2c549,["?LAUNCH","?ASROC"]).
xc_mapping_rows(a65b1250a2c549,[]).
x_implies(x_and(x_isa(V1,x_AttackOnTangible),'x_instrument-Generic'(V1,V2),x_isa(V2,x_WeaponOfMassDestruction)),x_isa(V1,x_WeaponOfMassDestructionAttack)) :- x_cid(a65b1250a2c54a,V1,V2).
xc_microtheory(a65b1250a2c54a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c54a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c54a,2112).
xc_kb_names(a65b1250a2c54a,["?ATTACK","?WEAPON"]).
xc_mapping_rows(a65b1250a2c54a,[]).
x_isa(x_GroupFn('x_BallisticMissile-Mushak200'),x_ObjectType) :- x_cid(a65b1250a2c54b).
xc_microtheory(a65b1250a2c54b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c54b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c54b,2119).
xc_kb_names(a65b1250a2c54b,[]).
xc_mapping_rows(a65b1250a2c54b,[]).
x_argIsa('x_weaponEffectiveRange-Min',2,x_NonNegativeScalarInterval) :- x_cid(a65b1250a2c54c).
xc_microtheory(a65b1250a2c54c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c54c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c54c,2122).
xc_kb_names(a65b1250a2c54c,[]).
xc_mapping_rows(a65b1250a2c54c,[]).
x_comment(x_angleOfLauncher,"(angleOfLauncher GUN ANGLE-RANGE) indicates possible vertical angles at which a GUN can be fired. For example, (angleOfLauncher ?MORTAR (Degree-UnitOfAngularMeasure 45 90) means that ?MORTAR can be fired at angles between 45 and 90 degrees.") :- x_cid(a65b1250a2c54d).
xc_microtheory(a65b1250a2c54d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c54d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c54d,2124).
xc_kb_names(a65b1250a2c54d,[]).
xc_mapping_rows(a65b1250a2c54d,[]).
x_genls('x_CruiseMissile-GroundLaunched',x_CruiseMissile) :- x_cid(a65b1250a2c54e).
xc_microtheory(a65b1250a2c54e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c54e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c54e,2126).
xc_kb_names(a65b1250a2c54e,[]).
xc_mapping_rows(a65b1250a2c54e,[]).
x_genls(x_MakingFn(x_NerveAgent),x_MakingSomething) :- x_cid(a65b1250a2c54f).
xc_microtheory(a65b1250a2c54f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c54f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c54f,2128).
xc_kb_names(a65b1250a2c54f,[]).
xc_mapping_rows(a65b1250a2c54f,[]).
x_genls(x_GroupFn(x_Warplane),x_PartiallyTangible) :- x_cid(a65b1250a2c550).
xc_microtheory(a65b1250a2c550,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c550,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c550,2131).
xc_kb_names(a65b1250a2c550,[]).
xc_mapping_rows(a65b1250a2c550,[]).
x_comment(x_BallisticMissileLauncher,"The collection of MissileLaunchers designed to fire BallisticMissiles.") :- x_cid(a65b1250a2c551).
xc_microtheory(a65b1250a2c551,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c551,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c551,2134).
xc_kb_names(a65b1250a2c551,[]).
xc_mapping_rows(a65b1250a2c551,[]).
x_genls('x_BiologicalWeapon-Bacterial',x_BiologicalWeapon) :- x_cid(a65b1250a2c552).
xc_microtheory(a65b1250a2c552,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c552,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c552,2136).
xc_kb_names(a65b1250a2c552,[]).
xc_mapping_rows(a65b1250a2c552,[]).
x_isa('x_weaponEffectiveRange-Max',x_FunctionalPredicate) :- x_cid(a65b1250a2c553).
xc_microtheory(a65b1250a2c553,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c553,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c553,2138).
xc_kb_names(a65b1250a2c553,[]).
xc_mapping_rows(a65b1250a2c553,[]).
x_argGenl(x_IntendedTargetTypeFn,1,x_Weapon) :- x_cid(a65b1250a2c554).
xc_microtheory(a65b1250a2c554,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c554,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c554,2140).
xc_kb_names(a65b1250a2c554,[]).
xc_mapping_rows(a65b1250a2c554,[]).
x_isa(x_GatlingGun,x_ExistingObjectType) :- x_cid(a65b1250a2c555).
xc_microtheory(a65b1250a2c555,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c555,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c555,2142).
xc_kb_names(a65b1250a2c555,[]).
xc_mapping_rows(a65b1250a2c555,[]).
x_comment('x_NavalMine-Deployed',"Instances are NavalMines that have been successfully planted undersea.") :- x_cid(a65b1250a2c556).
xc_microtheory(a65b1250a2c556,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c556,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c556,2144).
xc_kb_names(a65b1250a2c556,[]).
xc_mapping_rows(a65b1250a2c556,[]).
x_relationAllInstance(x_groupMemberType,x_GroupFn('x_BallisticMissile-Mushak160'),'x_BallisticMissile-Mushak160') :- x_cid(a65b1250a2c557).
xc_microtheory(a65b1250a2c557,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c557,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c557,2146).
xc_kb_names(a65b1250a2c557,[]).
xc_mapping_rows(a65b1250a2c557,[]).
x_isa('x_CruiseMissile-SeaLaunched',x_ExistingObjectType) :- x_cid(a65b1250a2c558).
xc_microtheory(a65b1250a2c558,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c558,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c558,2149).
xc_kb_names(a65b1250a2c558,[]).
xc_mapping_rows(a65b1250a2c558,[]).
x_implies(x_and(x_isa(V1,x_ShootingAProjectileWeapon),x_damages(V1,V2),x_fromLocation(V1,V3),'x_instrument-Generic'(V1,V3),x_deviceUsed(V1,V4),'x_weaponEffectiveRange-Min'(V4,V5),x_distanceBetween(V2,V3,V6)),x_greaterThan(V6,V5)) :- x_cid(a65b1250a2c559,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1250a2c559,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c559,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c559,2151).
xc_kb_names(a65b1250a2c559,["?SHOOTING","?TARGET","?LAUNCHER","?WEAPON","?MINRANGE","?DIST"]).
xc_mapping_rows(a65b1250a2c559,[]).
x_genls(x_Mescaline,x_ChemicalAgent) :- x_cid(a65b1250a2c55a).
xc_microtheory(a65b1250a2c55a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c55a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c55a,2162).
xc_kb_names(a65b1250a2c55a,[]).
xc_mapping_rows(a65b1250a2c55a,[]).
x_genls(x_PointDetonatingWeapon,x_ExplosiveDevice) :- x_cid(a65b1250a2c55b).
xc_microtheory(a65b1250a2c55b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c55b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c55b,2164).
xc_kb_names(a65b1250a2c55b,[]).
xc_mapping_rows(a65b1250a2c55b,[]).
x_isa(x_SurfaceToAirMissileLauncher,x_ExistingObjectType) :- x_cid(a65b1250a2c55c).
xc_microtheory(a65b1250a2c55c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c55c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c55c,2166).
xc_kb_names(a65b1250a2c55c,[]).
xc_mapping_rows(a65b1250a2c55c,[]).
x_genls('x_Howitzer-155mmSelfPropelled',x_Howitzer) :- x_cid(a65b1250a2c55d).
xc_microtheory(a65b1250a2c55d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c55d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c55d,2168).
xc_kb_names(a65b1250a2c55d,[]).
xc_mapping_rows(a65b1250a2c55d,[]).
x_genls(x_TerminalGuidedProjectile,x_CollectionUnionFn(x_TheSet(x_HardwareTool,x_PhysicalDevice))) :- x_cid(a65b1250a2c55e).
xc_microtheory(a65b1250a2c55e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c55e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c55e,2170).
xc_kb_names(a65b1250a2c55e,[]).
xc_mapping_rows(a65b1250a2c55e,[]).
x_genls(x_BiologicalWeaponFn(x_RickettsiaRicketsii),'x_BiologicalWeapon-Rickettsial') :- x_cid(a65b1250a2c55f).
xc_microtheory(a65b1250a2c55f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c55f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c55f,2174).
xc_kb_names(a65b1250a2c55f,[]).
xc_mapping_rows(a65b1250a2c55f,[]).
x_argIsa(x_weaponRange,1,x_ProjectileWeapon) :- x_cid(a65b1250a2c560).
xc_microtheory(a65b1250a2c560,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c560,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c560,2177).
xc_kb_names(a65b1250a2c560,[]).
xc_mapping_rows(a65b1250a2c560,[]).
x_implies(x_and(x_isa(V1,x_LaunchingAMissile),x_objectEmitted(V1,V2),x_isa(V2,x_AntiSubmarineRocket)),x_isa('x_SKF-2834698'(V2,V1,1),x_Torpedo)) :- x_cid(a65b1250a2c561,V1,V2).
xc_microtheory(a65b1250a2c561,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c561,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c561,2179).
xc_kb_names(a65b1250a2c561,["?LAUNCH","?ASROC"]).
xc_mapping_rows(a65b1250a2c561,[]).
x_isa(x_AircraftWeaponPylon,x_ExistingObjectType) :- x_cid(a65b1250a2c562).
xc_microtheory(a65b1250a2c562,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c562,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c562,2187).
xc_kb_names(a65b1250a2c562,[]).
xc_mapping_rows(a65b1250a2c562,[]).
x_arg1Isa(x_weaponRange,x_ProjectileWeapon) :- x_cid(a65b1250a2c563).
xc_microtheory(a65b1250a2c563,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c563,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c563,2189).
xc_kb_names(a65b1250a2c563,[]).
xc_mapping_rows(a65b1250a2c563,[]).
x_transportedInTypes('x_Warhead-BallisticMissile',x_BallisticMissile) :- x_cid(a65b1250a2c564).
xc_microtheory(a65b1250a2c564,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c564,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c564,2191).
xc_kb_names(a65b1250a2c564,[]).
xc_mapping_rows(a65b1250a2c564,[]).
x_isa(x_GroupFn('x_BallisticMissile-SCUDB'),x_ObjectType) :- x_cid(a65b1250a2c565).
xc_microtheory(a65b1250a2c565,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c565,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c565,2193).
xc_kb_names(a65b1250a2c565,[]).
xc_mapping_rows(a65b1250a2c565,[]).
x_implies(x_and(x_isa(V1,x_GainingUserRights),x_objectOfPossessionTransfer(V1,V2),x_toPossessor(V1,V3),x_isa(V2,V4),x_genls(V4,x_BiologicalAgent)),x_increasesCausally(V1,x_thereExists(V5,x_and(x_possesses(V3,V5),x_isa(V5,x_BiologicalWeaponFn(V4)))),x_likelihood)) :- x_cid(a65b1250a2c566,V1,V2,V3,V4,V5).
xc_microtheory(a65b1250a2c566,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c566,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c566,2196).
xc_kb_names(a65b1250a2c566,["?ACQUIRE","?BIO-AGENT","?AGENT","?BIO-AGENT-TYPE","?WEAPON"]).
xc_mapping_rows(a65b1250a2c566,['exists-thereexists']).
x_genls('x_MineField-Scatterable',x_MineField) :- x_cid(a65b1250a2c567).
xc_microtheory(a65b1250a2c567,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c567,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c567,2211).
xc_kb_names(a65b1250a2c567,[]).
xc_mapping_rows(a65b1250a2c567,[]).
x_arg2Isa('x_weaponEffectiveRange-Min',x_NonNegativeScalarInterval) :- x_cid(a65b1250a2c568).
xc_microtheory(a65b1250a2c568,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c568,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c568,2213).
xc_kb_names(a65b1250a2c568,[]).
xc_mapping_rows(a65b1250a2c568,[]).
x_argFormat(x_intendedTargetTypeOfWeaponType,2,x_SingleEntry) :- x_cid(a65b1250a2c569).
xc_microtheory(a65b1250a2c569,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c569,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c569,2215).
xc_kb_names(a65b1250a2c569,[]).
xc_mapping_rows(a65b1250a2c569,[]).
x_isa('x_CruiseMissile-GroundLaunched',x_ExistingObjectType) :- x_cid(a65b1250a2c56a).
xc_microtheory(a65b1250a2c56a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c56a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c56a,2217).
xc_kb_names(a65b1250a2c56a,[]).
xc_mapping_rows(a65b1250a2c56a,[]).
x_isa(x_ChemicalWeaponFn(x_Phosgene),x_ProductType) :- x_cid(a65b1250a2c56b).
xc_microtheory(a65b1250a2c56b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c56b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c56b,2219).
xc_kb_names(a65b1250a2c56b,[]).
xc_mapping_rows(a65b1250a2c56b,[]).
x_comment(x_BombSubmunition,"A military device, usually intended to strike a target or pierce through armor before the main munition is released.") :- x_cid(a65b1250a2c56c).
xc_microtheory(a65b1250a2c56c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c56c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c56c,2222).
xc_kb_names(a65b1250a2c56c,[]).
xc_mapping_rows(a65b1250a2c56c,[]).
x_genls(x_BallisticMissileLauncher,x_MissileLauncher) :- x_cid(a65b1250a2c56d).
xc_microtheory(a65b1250a2c56d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c56d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c56d,2224).
xc_kb_names(a65b1250a2c56d,[]).
xc_mapping_rows(a65b1250a2c56d,[]).
x_arity('x_weaponEffectiveRange-Max',2) :- x_cid(a65b1250a2c56e).
xc_microtheory(a65b1250a2c56e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c56e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c56e,2226).
xc_kb_names(a65b1250a2c56e,[]).
xc_mapping_rows(a65b1250a2c56e,[]).
x_isa('x_BallisticMissile-Mushak120',x_ExistingObjectType) :- x_cid(a65b1250a2c56f).
xc_microtheory(a65b1250a2c56f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c56f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c56f,2228).
xc_kb_names(a65b1250a2c56f,[]).
xc_mapping_rows(a65b1250a2c56f,[]).
x_arity(x_intendedTargetTypeOfWeapon,3) :- x_cid(a65b1250a2c570).
xc_microtheory(a65b1250a2c570,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c570,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c570,2230).
xc_kb_names(a65b1250a2c570,[]).
xc_mapping_rows(a65b1250a2c570,[]).
x_arg1Genl(x_IntendedTargetTypeFn,x_Weapon) :- x_cid(a65b1250a2c571).
xc_microtheory(a65b1250a2c571,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c571,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c571,2232).
xc_kb_names(a65b1250a2c571,[]).
xc_mapping_rows(a65b1250a2c571,[]).
x_comment(x_AntiArmorMine,"The collection of LandMines that detonate when a heavy vehicle, such as a Tank-Vehicle or ArmoredPersonnelCarrier, rolls over the ground above the LandMine. AntiArmorMines usually have armor-piercing capability.") :- x_cid(a65b1250a2c572).
xc_microtheory(a65b1250a2c572,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c572,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c572,2234).
xc_kb_names(a65b1250a2c572,[]).
xc_mapping_rows(a65b1250a2c572,[]).
x_comment('x_F-16-Fighter',"The collection of a type of aircraft, used widely and in a variety of combat roles. Flown by U.S. AirForce, Air National Guard, Air Force Reserve. Also flown by air forces of a significant number of European, Asian, and South American countries. Produced in U.S., Belgium, Netherlands, and Turkey.") :- x_cid(a65b1250a2c573).
xc_microtheory(a65b1250a2c573,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c573,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c573,2236).
xc_kb_names(a65b1250a2c573,[]).
xc_mapping_rows(a65b1250a2c573,[]).
x_isa(x_ChemicalWeaponFn('x_VX-NerveGas'),x_ProductType) :- x_cid(a65b1250a2c574).
xc_microtheory(a65b1250a2c574,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c574,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c574,2238).
xc_kb_names(a65b1250a2c574,[]).
xc_mapping_rows(a65b1250a2c574,[]).
x_arg2Format(x_intendedTargetTypeOfWeaponType,x_SingleEntry) :- x_cid(a65b1250a2c575).
xc_microtheory(a65b1250a2c575,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c575,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c575,2241).
xc_kb_names(a65b1250a2c575,[]).
xc_mapping_rows(a65b1250a2c575,[]).
x_isa(x_GroupFn('x_BallisticMissile-SCUDC'),x_ObjectType) :- x_cid(a65b1250a2c576).
xc_microtheory(a65b1250a2c576,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c576,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c576,2243).
xc_kb_names(a65b1250a2c576,[]).
xc_mapping_rows(a65b1250a2c576,[]).
x_disjointWith('x_SmallArm-Weapon',x_FieldArtillery) :- x_cid(a65b1250a2c577).
xc_microtheory(a65b1250a2c577,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c577,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c577,2246).
xc_kb_names(a65b1250a2c577,[]).
xc_mapping_rows(a65b1250a2c577,[]).
x_genls('x_Mine-Weapon',x_ProximityDetonatingWeapon) :- x_cid(a65b1250a2c578).
xc_microtheory(a65b1250a2c578,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c578,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c578,2248).
xc_kb_names(a65b1250a2c578,[]).
xc_mapping_rows(a65b1250a2c578,[]).
x_genls('x_BiologicalWeapon-GeneticallyEngineeredBacteriumBased','x_BiologicalWeapon-Bacterial') :- x_cid(a65b1250a2c579).
xc_microtheory(a65b1250a2c579,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c579,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c579,2250).
xc_kb_names(a65b1250a2c579,[]).
xc_mapping_rows(a65b1250a2c579,[]).
x_argIsa(x_weaponEffectiveRange,1,x_ProjectileWeapon) :- x_cid(a65b1250a2c57a).
xc_microtheory(a65b1250a2c57a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c57a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c57a,2252).
xc_kb_names(a65b1250a2c57a,[]).
xc_mapping_rows(a65b1250a2c57a,[]).
x_isa('x_CruiseMissile-AirLaunched',x_ExistingObjectType) :- x_cid(a65b1250a2c57b).
xc_microtheory(a65b1250a2c57b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c57b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c57b,2254).
xc_kb_names(a65b1250a2c57b,[]).
xc_mapping_rows(a65b1250a2c57b,[]).
x_relationAllExists(x_physicalParts,x_BiologicalWeaponFn(x_RickettsiaRicketsii),x_RickettsiaRicketsii) :- x_cid(a65b1250a2c57c).
xc_microtheory(a65b1250a2c57c,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c57c,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c57c,2256).
xc_kb_names(a65b1250a2c57c,[]).
xc_mapping_rows(a65b1250a2c57c,[]).
x_isa('x_Sidewinder-Missile',x_ExistingObjectType) :- x_cid(a65b1250a2c57d).
xc_microtheory(a65b1250a2c57d,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c57d,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c57d,2259).
xc_kb_names(a65b1250a2c57d,[]).
xc_mapping_rows(a65b1250a2c57d,[]).
x_genls(x_SurfaceToAirMissileLauncher,x_MissileLauncher) :- x_cid(a65b1250a2c57e).
xc_microtheory(a65b1250a2c57e,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c57e,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c57e,2261).
xc_kb_names(a65b1250a2c57e,[]).
xc_mapping_rows(a65b1250a2c57e,[]).
x_isa(x_SurfaceToSurfaceMissile,x_ExistingObjectType) :- x_cid(a65b1250a2c57f).
xc_microtheory(a65b1250a2c57f,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c57f,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c57f,2263).
xc_kb_names(a65b1250a2c57f,[]).
xc_mapping_rows(a65b1250a2c57f,[]).
x_genls('x_SmallArm-Weapon','x_Device-SingleUser') :- x_cid(a65b1250a2c580).
xc_microtheory(a65b1250a2c580,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c580,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c580,2265).
xc_kb_names(a65b1250a2c580,[]).
xc_mapping_rows(a65b1250a2c580,[]).
x_isa('x_Torpedo-MK-44',x_ExistingObjectType) :- x_cid(a65b1250a2c581).
xc_microtheory(a65b1250a2c581,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c581,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c581,2267).
xc_kb_names(a65b1250a2c581,[]).
xc_mapping_rows(a65b1250a2c581,[]).
x_genls('x_BallisticMissile-ICBM',x_BallisticMissile) :- x_cid(a65b1250a2c582).
xc_microtheory(a65b1250a2c582,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c582,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c582,2269).
xc_kb_names(a65b1250a2c582,[]).
xc_mapping_rows(a65b1250a2c582,[]).
x_isa(x_PointDetonatingWeapon,x_ExistingObjectType) :- x_cid(a65b1250a2c583).
xc_microtheory(a65b1250a2c583,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c583,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c583,2271).
xc_kb_names(a65b1250a2c583,[]).
xc_mapping_rows(a65b1250a2c583,[]).
x_genls(x_Psilocybin,x_ChemicalAgent) :- x_cid(a65b1250a2c584).
xc_microtheory(a65b1250a2c584,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c584,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c584,2273).
xc_kb_names(a65b1250a2c584,[]).
xc_mapping_rows(a65b1250a2c584,[]).
x_isa(x_Lewisite,x_ProductType) :- x_cid(a65b1250a2c585).
xc_microtheory(a65b1250a2c585,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c585,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c585,2275).
xc_kb_names(a65b1250a2c585,[]).
xc_mapping_rows(a65b1250a2c585,[]).
x_implies(x_and(x_isa(V1,x_IndependentCountry),x_isa(V2,x_AttackOnTangible),x_deviceUsed(V2,V3),x_isa(V3,x_ChemicalWeapon),x_genls(V4,x_BiochemicallyHarmfulSubstance),x_relationInstanceExistsMany(x_possesses,V1,V4)),x_capableOfDoing(V1,V2,x_performedBy)) :- x_cid(a65b1250a2c586,V1,V2,V3,V4).
xc_microtheory(a65b1250a2c586,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c586,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c586,2277).
xc_kb_names(a65b1250a2c586,["?AGENT","?ATTACK","?DEVICE","?CHEMTYPE"]).
xc_mapping_rows(a65b1250a2c586,[]).
x_genls('x_CruiseMissile-SeaLaunched',x_CruiseMissile) :- x_cid(a65b1250a2c587).
xc_microtheory(a65b1250a2c587,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c587,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c587,2287).
xc_kb_names(a65b1250a2c587,[]).
xc_mapping_rows(a65b1250a2c587,[]).
x_isa(x_DetectionFn('x_NavalMine-Deployed'),x_TemporalObjectType) :- x_cid(a65b1250a2c588).
xc_microtheory(a65b1250a2c588,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c588,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c588,2289).
xc_kb_names(a65b1250a2c588,[]).
xc_mapping_rows(a65b1250a2c588,[]).
x_relationAllInstance(x_groupMemberType,x_GroupFn('x_BallisticMissile-Mushak200'),'x_BallisticMissile-Mushak200') :- x_cid(a65b1250a2c589).
xc_microtheory(a65b1250a2c589,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c589,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c589,2292).
xc_kb_names(a65b1250a2c589,[]).
xc_mapping_rows(a65b1250a2c589,[]).
x_genls('x_NavalMine-Deployed',x_NavalMine) :- x_cid(a65b1250a2c58a).
xc_microtheory(a65b1250a2c58a,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c58a,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c58a,2295).
xc_kb_names(a65b1250a2c58a,[]).
xc_mapping_rows(a65b1250a2c58a,[]).
x_end_of_file :- x_cid(a65b1250a2c58b).
xc_microtheory(a65b1250a2c58b,x_ModernMilitaryWeaponsMt).
xc_source_file(a65b1250a2c58b,'c:/snet/petta/repos/openworld_dr/KBs/ModernMilitaryWeapons.kif').
xc_source_line(a65b1250a2c58b,2298).
xc_kb_names(a65b1250a2c58b,[]).
xc_mapping_rows(a65b1250a2c58b,[]).
kb_cache_footer(footer{count:858,digest:'818a097d48448213215b594bf4e70cf68632ebae71917350e765dca890df13d5',headerDigest:f402e1bc52de6066fe993914b77846e81bb93bdb6e358ec1e482b5299a0aff5f}).
