:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:729,dialect:kif,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:4816,mappingHash:'5f1e628c0662dd5129c5deca3c808fbe74ebeea2c17071cda1656d04c12d674d',mtPolicy:filename_v1,normalizedDigest:'4bdd5da43c6810ac51ba829c237164827d562f91032223efd562d46794e3accd',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:139351,source:'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif',sourceHash:'64149b6c3de89e7c19f7a091133f616dd30abb01431d58da4a1443fe589e7977',warnings:[]}).
x_salientAssertions(x_BiologicalSpecies,x_implies(x_and(x_isa(V1,x_BiologicalSpecies),x_isa(V2,V1),x_children(V3,V2)),x_isa(V3,V1))) :- x_cid(a65b12504cc4fe,V1,V2,V3).
xc_microtheory(a65b12504cc4fe,x_BiologyMt).
xc_source_file(a65b12504cc4fe,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc4fe,19).
xc_kb_names(a65b12504cc4fe,["?SPEC","?YOUNGER","?OLDER"]).
xc_mapping_rows(a65b12504cc4fe,['implication-implies']).
xc_direction(a65b12504cc4fe,':BACKWARD').
xc_monotonicity(a65b12504cc4fe,':MONOTONIC').
xc_creator(a65b12504cc4fe,'Cyc').
xc_creation_date(a65b12504cc4fe,110529).
x_salientAssertions(x_children,x_implies(x_and(x_isa(V1,x_BiologicalSpecies),x_isa(V2,V1),x_children(V2,V3)),x_isa(V3,V1))) :- x_cid(a65b12504cc4ff,V1,V2,V3).
xc_microtheory(a65b12504cc4ff,x_BiologyMt).
xc_source_file(a65b12504cc4ff,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc4ff,31).
xc_kb_names(a65b12504cc4ff,["?SPEC","?OLDER","?YOUNGER"]).
xc_mapping_rows(a65b12504cc4ff,['implication-implies']).
xc_direction(a65b12504cc4ff,':BACKWARD').
xc_monotonicity(a65b12504cc4ff,':DEFAULT').
xc_creator(a65b12504cc4ff,'Cyc').
x_exceptWhen(x_and(x_isa(V1,x_BiologicalSpecies),x_isa(V2,V1),x_children(V2,V3),x_different(V4,V2),x_different(V5,V1)),x_implies(x_and(x_isa(V5,x_BiologicalSpecies),x_isa(V4,V5),x_children(V4,V3)),x_isa(V3,V5))) :- x_cid(a65b12504cc500,V1,V2,V3,V4,V5).
xc_microtheory(a65b12504cc500,x_BiologyMt).
xc_source_file(a65b12504cc500,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc500,43).
xc_kb_names(a65b12504cc500,["?SPEC2","?OLDER2","?YOUNGER","?OLDER","?SPEC"]).
xc_mapping_rows(a65b12504cc500,['implication-implies']).
xc_direction(a65b12504cc500,':BACKWARD').
xc_monotonicity(a65b12504cc500,':DEFAULT').
xc_creator(a65b12504cc500,'Cyc').
xc_creation_date(a65b12504cc500,105853).
x_salientAssertions(x_SecretionEvent,x_implies(x_and(x_isa(V1,'x_Secretion-Bodily'),x_outputsCreated(V2,V1)),x_isa(V2,x_SecretionEvent))) :- x_cid(a65b12504cc501,V1,V2).
xc_microtheory(a65b12504cc501,x_BiologyMt).
xc_source_file(a65b12504cc501,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc501,61).
xc_kb_names(a65b12504cc501,["?SB","?SECR-EV"]).
xc_mapping_rows(a65b12504cc501,['implication-implies']).
xc_direction(a65b12504cc501,':BACKWARD').
xc_monotonicity(a65b12504cc501,':DEFAULT').
xc_creator(a65b12504cc501,'Cyc').
x_salientAssertions(x_stuffInExposureEvent,x_implies(x_and(x_eventOccursAt(V1,V2),x_stuffInExposureEvent(V1,V3)),x_inRegion(V1,V3))) :- x_cid(a65b12504cc502,V1,V2,V3).
xc_microtheory(a65b12504cc502,x_BiologyMt).
xc_source_file(a65b12504cc502,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc502,72).
xc_kb_names(a65b12504cc502,["?EXP","?LOC","?SUBST"]).
xc_mapping_rows(a65b12504cc502,['implication-implies']).
xc_direction(a65b12504cc502,':BACKWARD').
xc_monotonicity(a65b12504cc502,':DEFAULT').
xc_creator(a65b12504cc502,'Cyc').
xc_creation_date(a65b12504cc502,94229).
x_exampleAssertions(x_arg1Isa,x_arg1Isa(x_killedByExposure,x_BiologicalLivingObject)) :- x_cid(a65b12504cc503).
xc_microtheory(a65b12504cc503,x_BiologyMt).
xc_source_file(a65b12504cc503,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc503,83).
xc_kb_names(a65b12504cc503,[]).
xc_mapping_rows(a65b12504cc503,[]).
xc_direction(a65b12504cc503,':FORWARD').
xc_monotonicity(a65b12504cc503,':DEFAULT').
xc_creator(a65b12504cc503,'Cyc').
xc_creation_date(a65b12504cc503,161316).
x_genls(x_AnaerobicBacterium,x_ProkaryoticCell) :- x_cid(a65b12504cc504).
xc_microtheory(a65b12504cc504,x_BiologyMt).
xc_source_file(a65b12504cc504,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc504,90).
xc_kb_names(a65b12504cc504,[]).
xc_mapping_rows(a65b12504cc504,[]).
xc_direction(a65b12504cc504,':FORWARD').
xc_monotonicity(a65b12504cc504,':DEFAULT').
xc_creator(a65b12504cc504,'Cyc').
x_argFormat(x_inhalingToxicityFor,3,x_IntervalEntry) :- x_cid(a65b12504cc505).
xc_microtheory(a65b12504cc505,x_BiologyMt).
xc_source_file(a65b12504cc505,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc505,96).
xc_kb_names(a65b12504cc505,[]).
xc_mapping_rows(a65b12504cc505,[]).
xc_direction(a65b12504cc505,':FORWARD').
xc_monotonicity(a65b12504cc505,':DEFAULT').
'x_interArgIsa1-2'(x_anatomicalParts,x_Animal,x_AnimalBodyPart) :- x_cid(a65b12504cc506).
xc_microtheory(a65b12504cc506,x_BiologyMt).
xc_source_file(a65b12504cc506,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc506,102).
xc_kb_names(a65b12504cc506,[]).
xc_mapping_rows(a65b12504cc506,[]).
xc_direction(a65b12504cc506,':BACKWARD').
xc_monotonicity(a65b12504cc506,':DEFAULT').
xc_creator(a65b12504cc506,'Cyc').
x_implies(x_and(x_isa(V1,x_BiologicalSpecies),x_children(V2,V3),x_isa(V3,V1)),x_isa(V2,V1)) :- x_cid(a65b12504cc507,V1,V2,V3).
xc_microtheory(a65b12504cc507,x_BiologyMt).
xc_source_file(a65b12504cc507,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc507,108).
xc_kb_names(a65b12504cc507,["?SPEC","?OLDER","?YOUNGER"]).
xc_mapping_rows(a65b12504cc507,['implication-implies']).
xc_direction(a65b12504cc507,':BACKWARD').
xc_monotonicity(a65b12504cc507,':MONOTONIC').
xc_creator(a65b12504cc507,'Cyc').
xc_creation_date(a65b12504cc507,110024).
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Finger,1) :- x_cid(a65b12504cc508).
xc_microtheory(a65b12504cc508,x_BiologyMt).
xc_source_file(a65b12504cc508,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc508,119).
xc_kb_names(a65b12504cc508,[]).
xc_mapping_rows(a65b12504cc508,[]).
xc_direction(a65b12504cc508,':FORWARD').
xc_monotonicity(a65b12504cc508,':DEFAULT').
xc_creator(a65b12504cc508,'Cyc').
x_siblingDisjointExceptions('x_Spore-DormantBacterium',x_GramPositiveBacterium) :- x_cid(a65b12504cc509).
xc_microtheory(a65b12504cc509,x_BiologyMt).
xc_source_file(a65b12504cc509,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc509,125).
xc_kb_names(a65b12504cc509,[]).
xc_mapping_rows(a65b12504cc509,[]).
xc_direction(a65b12504cc509,':FORWARD').
xc_monotonicity(a65b12504cc509,':DEFAULT').
xc_creator(a65b12504cc509,'Cyc').
xc_creation_date(a65b12504cc509,94057).
x_resultIsa(x_BacterialSporeFn,x_LifeStageType) :- x_cid(a65b12504cc50a).
xc_microtheory(a65b12504cc50a,x_BiologyMt).
xc_source_file(a65b12504cc50a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc50a,131).
xc_kb_names(a65b12504cc50a,[]).
xc_mapping_rows(a65b12504cc50a,[]).
xc_direction(a65b12504cc50a,':FORWARD').
xc_monotonicity(a65b12504cc50a,':MONOTONIC').
xc_creator(a65b12504cc50a,'Cyc').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Heart,1) :- x_cid(a65b12504cc50b).
xc_microtheory(a65b12504cc50b,x_BiologyMt).
xc_source_file(a65b12504cc50b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc50b,137).
xc_kb_names(a65b12504cc50b,[]).
xc_mapping_rows(a65b12504cc50b,[]).
xc_direction(a65b12504cc50b,':FORWARD').
xc_monotonicity(a65b12504cc50b,':DEFAULT').
xc_creator(a65b12504cc50b,'Cyc').
x_argIsa(x_immuneWithRespectToPathogen,2,x_OrganismClassificationType) :- x_cid(a65b12504cc50c).
xc_microtheory(a65b12504cc50c,x_BiologyMt).
xc_source_file(a65b12504cc50c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc50c,143).
xc_kb_names(a65b12504cc50c,[]).
xc_mapping_rows(a65b12504cc50c,[]).
xc_direction(a65b12504cc50c,':FORWARD').
xc_monotonicity(a65b12504cc50c,':MONOTONIC').
x_relationAllExists(x_birthChild,x_BirthEvent,x_Animal) :- x_cid(a65b12504cc50d).
xc_microtheory(a65b12504cc50d,x_BiologyMt).
xc_source_file(a65b12504cc50d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc50d,149).
xc_kb_names(a65b12504cc50d,[]).
xc_mapping_rows(a65b12504cc50d,[]).
xc_direction(a65b12504cc50d,':FORWARD').
xc_monotonicity(a65b12504cc50d,':DEFAULT').
xc_creator(a65b12504cc50d,'Cyc').
x_implies(x_and(x_residesInDwelling(V1,V2),x_hasHabitat(V1,V3)),x_objectFoundInLocation(V2,V3)) :- x_cid(a65b12504cc50e,V1,V2,V3).
xc_microtheory(a65b12504cc50e,x_BiologyMt).
xc_source_file(a65b12504cc50e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc50e,155).
xc_kb_names(a65b12504cc50e,["?ANIMAL","?REGION","?SHELTER"]).
xc_mapping_rows(a65b12504cc50e,['implication-implies']).
xc_direction(a65b12504cc50e,':BACKWARD').
xc_monotonicity(a65b12504cc50e,':DEFAULT').
xc_creator(a65b12504cc50e,'Cyc').
x_arg2Isa(x_InstantiationInstanceFn(x_organismTypeCanLethallyInfect,x_TheSet(1,2)),x_BiologicalLivingObject) :- x_cid(a65b12504cc50f).
xc_microtheory(a65b12504cc50f,x_BiologyMt).
xc_source_file(a65b12504cc50f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc50f,165).
xc_kb_names(a65b12504cc50f,[]).
xc_mapping_rows(a65b12504cc50f,[]).
xc_direction(a65b12504cc50f,':FORWARD').
xc_monotonicity(a65b12504cc50f,':DEFAULT').
x_isa(x_ImmuneResponse,x_Collection) :- x_cid(a65b12504cc510).
xc_microtheory(a65b12504cc510,x_BiologyMt).
xc_source_file(a65b12504cc510,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc510,173).
xc_kb_names(a65b12504cc510,[]).
xc_mapping_rows(a65b12504cc510,[]).
xc_direction(a65b12504cc510,':FORWARD').
xc_monotonicity(a65b12504cc510,':DEFAULT').
xc_creator(a65b12504cc510,'Cyc').
xc_creation_date(a65b12504cc510,173408).
x_kePredArgStrongSuggestionPreds(x_parentActors,1,x_offspringActors) :- x_cid(a65b12504cc511).
xc_microtheory(a65b12504cc511,x_BiologyMt).
xc_source_file(a65b12504cc511,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc511,179).
xc_kb_names(a65b12504cc511,[]).
xc_mapping_rows(a65b12504cc511,[]).
xc_direction(a65b12504cc511,':FORWARD').
xc_monotonicity(a65b12504cc511,':DEFAULT').
xc_creator(a65b12504cc511,'Cyc').
xc_creation_date(a65b12504cc511,142230).
x_implies(x_and(x_isa(V1,x_BiologicalSubphylum),x_isa(V2,x_BiologicalPhylum),x_genls(V1,V2)),x_superTaxons(V1,V2)) :- x_cid(a65b12504cc512,V1,V2).
xc_microtheory(a65b12504cc512,x_BiologyMt).
xc_source_file(a65b12504cc512,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc512,185).
xc_kb_names(a65b12504cc512,["?SUBPHYLUM","?PHYLUM"]).
xc_mapping_rows(a65b12504cc512,['implication-implies']).
xc_direction(a65b12504cc512,':BACKWARD').
xc_monotonicity(a65b12504cc512,':DEFAULT').
xc_creator(a65b12504cc512,'Cyc').
xc_creation_date(a65b12504cc512,111953).
x_genls(x_Neutrophil,x_Cell) :- x_cid(a65b12504cc513).
xc_microtheory(a65b12504cc513,x_BiologyMt).
xc_source_file(a65b12504cc513,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc513,196).
xc_kb_names(a65b12504cc513,[]).
xc_mapping_rows(a65b12504cc513,[]).
xc_direction(a65b12504cc513,':FORWARD').
xc_monotonicity(a65b12504cc513,':DEFAULT').
xc_creator(a65b12504cc513,'Cyc').
x_isa(x_BacterialSporeFn('x_Anthrax-Bacterium'),x_LifeStageType) :- x_cid(a65b12504cc514).
xc_microtheory(a65b12504cc514,x_BiologyMt).
xc_source_file(a65b12504cc514,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc514,202).
xc_kb_names(a65b12504cc514,[]).
xc_mapping_rows(a65b12504cc514,[]).
xc_direction(a65b12504cc514,':FORWARD').
xc_monotonicity(a65b12504cc514,':MONOTONIC').
x_comment(x_GramPositiveBacterium,"The collection of all instances of #$Bacterium that are not decolorized after the process known as 'Gram Staining'. In this process the bacterial cells are rinsed with ethyl alcohol after being stained with a crystal violet dye. That the #$GramPositiveBacterium retain the stain indicates that the cells lack an outer membrane. Another feature that distinguishes them from the #$GramNegativeBacterium is that their cell walls have molecules on them known as teichoic acids which regulate the growth of the cell wall. Antibiotics to work against the #$GramPositiveBacterium are engineered to interfere with these molecules.") :- x_cid(a65b12504cc515).
xc_microtheory(a65b12504cc515,x_BiologyMt).
xc_source_file(a65b12504cc515,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc515,209).
xc_kb_names(a65b12504cc515,[]).
xc_mapping_rows(a65b12504cc515,[]).
xc_direction(a65b12504cc515,':FORWARD').
xc_monotonicity(a65b12504cc515,':MONOTONIC').
xc_creator(a65b12504cc515,'Cyc').
xc_creation_date(a65b12504cc515,163206).
x_comment('x_Clostridiales-Order',"A collection of #$Bacterium. A #$BiologicalOrder formed in the\n#$Firmicutes-Division of the #$MoneraKingdom.  An important subtaxon is the\nClostridiaceae-Family.  These #$ProkaryoticCells are #$SporeFormingBacterium.") :- x_cid(a65b12504cc516).
xc_microtheory(a65b12504cc516,x_BiologyMt).
xc_source_file(a65b12504cc516,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc516,215).
xc_kb_names(a65b12504cc516,[]).
xc_mapping_rows(a65b12504cc516,[]).
xc_direction(a65b12504cc516,':FORWARD').
xc_monotonicity(a65b12504cc516,':DEFAULT').
xc_creator(a65b12504cc516,'Cyc').
x_argIsa(x_InstantiationInstanceFn(x_organismTypeCanLethallyInfect,x_TheSet(1)),1,x_MicroscopicScaleObject) :- x_cid(a65b12504cc517).
xc_microtheory(a65b12504cc517,x_BiologyMt).
xc_source_file(a65b12504cc517,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc517,223).
xc_kb_names(a65b12504cc517,[]).
xc_mapping_rows(a65b12504cc517,[]).
xc_direction(a65b12504cc517,':FORWARD').
xc_monotonicity(a65b12504cc517,':DEFAULT').
x_genls(x_Arthropod,x_Animal) :- x_cid(a65b12504cc518).
xc_microtheory(a65b12504cc518,x_BiologyMt).
xc_source_file(a65b12504cc518,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc518,231).
xc_kb_names(a65b12504cc518,[]).
xc_mapping_rows(a65b12504cc518,[]).
xc_direction(a65b12504cc518,':FORWARD').
xc_monotonicity(a65b12504cc518,':MONOTONIC').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_ReproductiveSystem,1) :- x_cid(a65b12504cc519).
xc_microtheory(a65b12504cc519,x_BiologyMt).
xc_source_file(a65b12504cc519,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc519,237).
xc_kb_names(a65b12504cc519,[]).
xc_mapping_rows(a65b12504cc519,[]).
xc_direction(a65b12504cc519,':FORWARD').
xc_monotonicity(a65b12504cc519,':DEFAULT').
xc_creator(a65b12504cc519,'Cyc').
x_resultIsa('x_SKF-33612495',x_AnimalBodyPart) :- x_cid(a65b12504cc51a).
xc_microtheory(a65b12504cc51a,x_BiologyMt).
xc_source_file(a65b12504cc51a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc51a,243).
xc_kb_names(a65b12504cc51a,[]).
xc_mapping_rows(a65b12504cc51a,[]).
xc_direction(a65b12504cc51a,':FORWARD').
xc_monotonicity(a65b12504cc51a,':DEFAULT').
xc_creator(a65b12504cc51a,'Cyc').
x_isa('x_Smallpox-Virus',x_BiologicalSpecies) :- x_cid(a65b12504cc51b).
xc_microtheory(a65b12504cc51b,x_BiologyMt).
xc_source_file(a65b12504cc51b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc51b,249).
xc_kb_names(a65b12504cc51b,[]).
xc_mapping_rows(a65b12504cc51b,[]).
xc_direction(a65b12504cc51b,':FORWARD').
xc_monotonicity(a65b12504cc51b,':MONOTONIC').
xc_creator(a65b12504cc51b,'Cyc').
x_isa('x_Cyanosis-PhysiologicalCondition',x_PhysiologicalConditionType) :- x_cid(a65b12504cc51c).
xc_microtheory(a65b12504cc51c,x_BiologyMt).
xc_source_file(a65b12504cc51c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc51c,255).
xc_kb_names(a65b12504cc51c,[]).
xc_mapping_rows(a65b12504cc51c,[]).
xc_direction(a65b12504cc51c,':FORWARD').
xc_monotonicity(a65b12504cc51c,':MONOTONIC').
xc_creator(a65b12504cc51c,'Cyc').
xc_creation_date(a65b12504cc51c,121333).
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_MuscularSystem,1) :- x_cid(a65b12504cc51d).
xc_microtheory(a65b12504cc51d,x_BiologyMt).
xc_source_file(a65b12504cc51d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc51d,261).
xc_kb_names(a65b12504cc51d,[]).
xc_mapping_rows(a65b12504cc51d,[]).
xc_direction(a65b12504cc51d,':FORWARD').
xc_monotonicity(a65b12504cc51d,':DEFAULT').
xc_creator(a65b12504cc51d,'Cyc').
x_completeCollectionExtent(x_Antibody) :- x_cid(a65b12504cc51e).
xc_microtheory(a65b12504cc51e,x_BiologyMt).
xc_source_file(a65b12504cc51e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc51e,267).
xc_kb_names(a65b12504cc51e,[]).
xc_mapping_rows(a65b12504cc51e,[]).
xc_direction(a65b12504cc51e,':FORWARD').
xc_monotonicity(a65b12504cc51e,':DEFAULT').
xc_creator(a65b12504cc51e,'Cyc').
x_expansion(x_carriesOrganismType,x_relationInstanceExists(x_carriesOrganism,':ARG1',':ARG2')) :- x_cid(a65b12504cc51f).
xc_microtheory(a65b12504cc51f,x_BiologyMt).
xc_source_file(a65b12504cc51f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc51f,273).
xc_kb_names(a65b12504cc51f,[]).
xc_mapping_rows(a65b12504cc51f,[]).
xc_direction(a65b12504cc51f,':FORWARD').
xc_monotonicity(a65b12504cc51f,':DEFAULT').
xc_creator(a65b12504cc51f,'Cyc').
xc_creation_date(a65b12504cc51f,123939).
x_genls(x_BrucellaBacterium,x_ProkaryoticCell) :- x_cid(a65b12504cc520).
xc_microtheory(a65b12504cc520,x_BiologyMt).
xc_source_file(a65b12504cc520,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc520,280).
xc_kb_names(a65b12504cc520,[]).
xc_mapping_rows(a65b12504cc520,[]).
xc_direction(a65b12504cc520,':FORWARD').
xc_monotonicity(a65b12504cc520,':DEFAULT').
xc_creator(a65b12504cc520,'Cyc').
x_arity(x_contaminatedWithMicroorganismType,2) :- x_cid(a65b12504cc521).
xc_microtheory(a65b12504cc521,x_BiologyMt).
xc_source_file(a65b12504cc521,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc521,286).
xc_kb_names(a65b12504cc521,[]).
xc_mapping_rows(a65b12504cc521,[]).
xc_direction(a65b12504cc521,':FORWARD').
xc_monotonicity(a65b12504cc521,':DEFAULT').
x_genls(x_AnaerobicBacterium,x_MoneraKingdom) :- x_cid(a65b12504cc522).
xc_microtheory(a65b12504cc522,x_BiologyMt).
xc_source_file(a65b12504cc522,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc522,292).
xc_kb_names(a65b12504cc522,[]).
xc_mapping_rows(a65b12504cc522,[]).
xc_direction(a65b12504cc522,':FORWARD').
xc_monotonicity(a65b12504cc522,':DEFAULT').
xc_creator(a65b12504cc522,'Cyc').
x_isa(x_Mammal,x_BiologicalClass) :- x_cid(a65b12504cc523).
xc_microtheory(a65b12504cc523,x_BiologyMt).
xc_source_file(a65b12504cc523,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc523,298).
xc_kb_names(a65b12504cc523,[]).
xc_mapping_rows(a65b12504cc523,[]).
xc_direction(a65b12504cc523,':FORWARD').
xc_monotonicity(a65b12504cc523,':DEFAULT').
xc_creator(a65b12504cc523,'Cyc').
x_completeCollectionExtent(x_BacteriumTypeByAerobicity) :- x_cid(a65b12504cc524).
xc_microtheory(a65b12504cc524,x_BiologyMt).
xc_source_file(a65b12504cc524,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc524,304).
xc_kb_names(a65b12504cc524,[]).
xc_mapping_rows(a65b12504cc524,[]).
xc_direction(a65b12504cc524,':FORWARD').
xc_monotonicity(a65b12504cc524,':DEFAULT').
xc_creator(a65b12504cc524,'Cyc').
x_genls(x_BacterialSporeFn('x_Anthrax-Bacterium'),'x_Spore-DormantBacterium') :- x_cid(a65b12504cc525).
xc_microtheory(a65b12504cc525,x_BiologyMt).
xc_source_file(a65b12504cc525,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc525,310).
xc_kb_names(a65b12504cc525,[]).
xc_mapping_rows(a65b12504cc525,[]).
xc_direction(a65b12504cc525,':FORWARD').
xc_monotonicity(a65b12504cc525,':MONOTONIC').
x_isa(x_AttemptingFn(x_TerroristAct),x_Collection) :- x_cid(a65b12504cc526).
xc_microtheory(a65b12504cc526,x_BiologyMt).
xc_source_file(a65b12504cc526,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc526,317).
xc_kb_names(a65b12504cc526,[]).
xc_mapping_rows(a65b12504cc526,[]).
xc_direction(a65b12504cc526,':FORWARD').
xc_monotonicity(a65b12504cc526,':DEFAULT').
x_siblingDisjointExceptions(x_BacillusBacterium,'x_Spore-DormantBacterium') :- x_cid(a65b12504cc527).
xc_microtheory(a65b12504cc527,x_BiologyMt).
xc_source_file(a65b12504cc527,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc527,324).
xc_kb_names(a65b12504cc527,[]).
xc_mapping_rows(a65b12504cc527,[]).
xc_direction(a65b12504cc527,':FORWARD').
xc_monotonicity(a65b12504cc527,':DEFAULT').
xc_creator(a65b12504cc527,'Cyc').
xc_creation_date(a65b12504cc527,93835).
x_isa(x_GramPositiveBacterium,x_BacteriumTypeByGramStain) :- x_cid(a65b12504cc528).
xc_microtheory(a65b12504cc528,x_BiologyMt).
xc_source_file(a65b12504cc528,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc528,330).
xc_kb_names(a65b12504cc528,[]).
xc_mapping_rows(a65b12504cc528,[]).
xc_direction(a65b12504cc528,':FORWARD').
xc_monotonicity(a65b12504cc528,':MONOTONIC').
xc_creator(a65b12504cc528,'Cyc').
xc_creation_date(a65b12504cc528,153900).
x_resultIsa(x_BacterialSporeFn,x_ExistingObjectType) :- x_cid(a65b12504cc529).
xc_microtheory(a65b12504cc529,x_BiologyMt).
xc_source_file(a65b12504cc529,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc529,336).
xc_kb_names(a65b12504cc529,[]).
xc_mapping_rows(a65b12504cc529,[]).
xc_direction(a65b12504cc529,':FORWARD').
xc_monotonicity(a65b12504cc529,':MONOTONIC').
xc_creator(a65b12504cc529,'Cyc').
x_arg2Isa(x_immuneWithRespectToPathogen,x_OrganismClassificationType) :- x_cid(a65b12504cc52a).
xc_microtheory(a65b12504cc52a,x_BiologyMt).
xc_source_file(a65b12504cc52a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc52a,342).
xc_kb_names(a65b12504cc52a,[]).
xc_mapping_rows(a65b12504cc52a,[]).
xc_direction(a65b12504cc52a,':FORWARD').
xc_monotonicity(a65b12504cc52a,':MONOTONIC').
xc_creator(a65b12504cc52a,'Cyc').
xc_creation_date(a65b12504cc52a,104745).
x_isa(x_BacillusBacterium,x_BacteriumTypeByStructure) :- x_cid(a65b12504cc52b).
xc_microtheory(a65b12504cc52b,x_BiologyMt).
xc_source_file(a65b12504cc52b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc52b,348).
xc_kb_names(a65b12504cc52b,[]).
xc_mapping_rows(a65b12504cc52b,[]).
xc_direction(a65b12504cc52b,':FORWARD').
xc_monotonicity(a65b12504cc52b,':MONOTONIC').
xc_creator(a65b12504cc52b,'Cyc').
x_genls(x_BacterialSporeFn('x_Anthrax-Bacterium'),'x_Anthrax-Bacterium') :- x_cid(a65b12504cc52c).
xc_microtheory(a65b12504cc52c,x_BiologyMt).
xc_source_file(a65b12504cc52c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc52c,354).
xc_kb_names(a65b12504cc52c,[]).
xc_mapping_rows(a65b12504cc52c,[]).
xc_direction(a65b12504cc52c,':FORWARD').
xc_monotonicity(a65b12504cc52c,':MONOTONIC').
x_relationAllExistsCount(x_superTaxons,x_BiologicalSubphylum,x_BiologicalPhylum,1) :- x_cid(a65b12504cc52d).
xc_microtheory(a65b12504cc52d,x_BiologyMt).
xc_source_file(a65b12504cc52d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc52d,361).
xc_kb_names(a65b12504cc52d,[]).
xc_mapping_rows(a65b12504cc52d,[]).
xc_direction(a65b12504cc52d,':FORWARD').
xc_monotonicity(a65b12504cc52d,':MONOTONIC').
xc_creator(a65b12504cc52d,'Cyc').
xc_creation_date(a65b12504cc52d,111923).
x_isa(x_NervousSystem,x_UniqueAnatomicalPartType) :- x_cid(a65b12504cc52e).
xc_microtheory(a65b12504cc52e,x_BiologyMt).
xc_source_file(a65b12504cc52e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc52e,367).
xc_kb_names(a65b12504cc52e,[]).
xc_mapping_rows(a65b12504cc52e,[]).
xc_direction(a65b12504cc52e,':FORWARD').
xc_monotonicity(a65b12504cc52e,':DEFAULT').
x_genls(x_BLymphocyte,x_AnimalBLO) :- x_cid(a65b12504cc52f).
xc_microtheory(a65b12504cc52f,x_BiologyMt).
xc_source_file(a65b12504cc52f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc52f,373).
xc_kb_names(a65b12504cc52f,[]).
xc_mapping_rows(a65b12504cc52f,[]).
xc_direction(a65b12504cc52f,':FORWARD').
xc_monotonicity(a65b12504cc52f,':DEFAULT').
xc_creator(a65b12504cc52f,'Cyc').
x_genls(x_CanineAnimal,x_NonPersonAnimal) :- x_cid(a65b12504cc530).
xc_microtheory(a65b12504cc530,x_BiologyMt).
xc_source_file(a65b12504cc530,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc530,379).
xc_kb_names(a65b12504cc530,[]).
xc_mapping_rows(a65b12504cc530,[]).
xc_direction(a65b12504cc530,':FORWARD').
xc_monotonicity(a65b12504cc530,':DEFAULT').
xc_creator(a65b12504cc530,'Cyc').
x_comment(x_GramNegativeBacterium,"The collection of all instances of #$Bacterium that do not retain the stain in the 'Gram Staining' process. The cell walls of the #$GramNegativeBacterium are more complex and do not contain as many peptoglycans as the #$GramPositiveBacterium. Among the #$Bacterium which are #$Pathogens, the #$GramNegativeBacterium are much more plentiful than the #$GramPositiveBacterium.") :- x_cid(a65b12504cc531).
xc_microtheory(a65b12504cc531,x_BiologyMt).
xc_source_file(a65b12504cc531,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc531,385).
xc_kb_names(a65b12504cc531,[]).
xc_mapping_rows(a65b12504cc531,[]).
xc_direction(a65b12504cc531,':FORWARD').
xc_monotonicity(a65b12504cc531,':MONOTONIC').
xc_creator(a65b12504cc531,'Cyc').
xc_creation_date(a65b12504cc531,162733).
x_keWeakSuggestionPreds(x_Inhaling,x_bodilyDoer) :- x_cid(a65b12504cc532).
xc_microtheory(a65b12504cc532,x_BiologyMt).
xc_source_file(a65b12504cc532,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc532,391).
xc_kb_names(a65b12504cc532,[]).
xc_mapping_rows(a65b12504cc532,[]).
xc_direction(a65b12504cc532,':FORWARD').
xc_monotonicity(a65b12504cc532,':DEFAULT').
xc_creator(a65b12504cc532,'Cyc').
xc_creation_date(a65b12504cc532,154554).
x_argIsa(x_InstantiationInstanceFn(x_organismTypeCanLethallyInfect,x_TheSet(1,2)),1,x_MicroscopicScaleObject) :- x_cid(a65b12504cc533).
xc_microtheory(a65b12504cc533,x_BiologyMt).
xc_source_file(a65b12504cc533,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc533,397).
xc_kb_names(a65b12504cc533,[]).
xc_mapping_rows(a65b12504cc533,[]).
xc_direction(a65b12504cc533,':FORWARD').
xc_monotonicity(a65b12504cc533,':DEFAULT').
x_superTaxons(x_Arthropod,x_Animal) :- x_cid(a65b12504cc534).
xc_microtheory(a65b12504cc534,x_BiologyMt).
xc_source_file(a65b12504cc534,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc534,405).
xc_kb_names(a65b12504cc534,[]).
xc_mapping_rows(a65b12504cc534,[]).
xc_direction(a65b12504cc534,':FORWARD').
xc_monotonicity(a65b12504cc534,':MONOTONIC').
xc_creator(a65b12504cc534,'Cyc').
x_arity('x_SKF-33612495',3) :- x_cid(a65b12504cc535).
xc_microtheory(a65b12504cc535,x_BiologyMt).
xc_source_file(a65b12504cc535,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc535,411).
xc_kb_names(a65b12504cc535,[]).
xc_mapping_rows(a65b12504cc535,[]).
xc_direction(a65b12504cc535,':FORWARD').
xc_monotonicity(a65b12504cc535,':MONOTONIC').
xc_creator(a65b12504cc535,'Cyc').
x_isa(x_EndosporeAttribute,x_BacterialPhysiologicalAttribute) :- x_cid(a65b12504cc536).
xc_microtheory(a65b12504cc536,x_BiologyMt).
xc_source_file(a65b12504cc536,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc536,417).
xc_kb_names(a65b12504cc536,[]).
xc_mapping_rows(a65b12504cc536,[]).
xc_direction(a65b12504cc536,':FORWARD').
xc_monotonicity(a65b12504cc536,':MONOTONIC').
xc_creator(a65b12504cc536,'Cyc').
x_comment(x_contactToxicityFor,"(#$contactToxicityFor STUFF ORGTYPE TOXLEVEL) means that under ordinary circumstances, stuff has the #$Toxicity TOXLEVEL for instances of ORGTYPE that come into skin contact with it.") :- x_cid(a65b12504cc537).
xc_microtheory(a65b12504cc537,x_BiologyMt).
xc_source_file(a65b12504cc537,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc537,423).
xc_kb_names(a65b12504cc537,[]).
xc_mapping_rows(a65b12504cc537,[]).
xc_direction(a65b12504cc537,':FORWARD').
xc_monotonicity(a65b12504cc537,':DEFAULT').
xc_creator(a65b12504cc537,'Cyc').
xc_creation_date(a65b12504cc537,184610).
x_genls(x_GroupFn(x_Animal),x_SpatialThing) :- x_cid(a65b12504cc538).
xc_microtheory(a65b12504cc538,x_BiologyMt).
xc_source_file(a65b12504cc538,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc538,429).
xc_kb_names(a65b12504cc538,[]).
xc_mapping_rows(a65b12504cc538,[]).
xc_direction(a65b12504cc538,':FORWARD').
xc_monotonicity(a65b12504cc538,':DEFAULT').
xc_creator(a65b12504cc538,'Cyc').
x_argGenl(x_organismFoundInSubstance,1,'x_Organism-Whole') :- x_cid(a65b12504cc539).
xc_microtheory(a65b12504cc539,x_BiologyMt).
xc_source_file(a65b12504cc539,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc539,436).
xc_kb_names(a65b12504cc539,[]).
xc_mapping_rows(a65b12504cc539,[]).
xc_direction(a65b12504cc539,':FORWARD').
xc_monotonicity(a65b12504cc539,':MONOTONIC').
x_genls(x_BrucellaBacterium,x_MoneraKingdom) :- x_cid(a65b12504cc53a).
xc_microtheory(a65b12504cc53a,x_BiologyMt).
xc_source_file(a65b12504cc53a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc53a,442).
xc_kb_names(a65b12504cc53a,[]).
xc_mapping_rows(a65b12504cc53a,[]).
xc_direction(a65b12504cc53a,':FORWARD').
xc_monotonicity(a65b12504cc53a,':DEFAULT').
xc_creator(a65b12504cc53a,'Cyc').
x_isa(x_contaminatedWithMicroorganismType,x_BinaryPredicate) :- x_cid(a65b12504cc53b).
xc_microtheory(a65b12504cc53b,x_BiologyMt).
xc_source_file(a65b12504cc53b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc53b,448).
xc_kb_names(a65b12504cc53b,[]).
xc_mapping_rows(a65b12504cc53b,[]).
xc_direction(a65b12504cc53b,':FORWARD').
xc_monotonicity(a65b12504cc53b,':MONOTONIC').
xc_creator(a65b12504cc53b,'Cyc').
x_genls(x_Fish,x_AquaticOrganism) :- x_cid(a65b12504cc53c).
xc_microtheory(a65b12504cc53c,x_BiologyMt).
xc_source_file(a65b12504cc53c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc53c,454).
xc_kb_names(a65b12504cc53c,[]).
xc_mapping_rows(a65b12504cc53c,[]).
xc_direction(a65b12504cc53c,':FORWARD').
xc_monotonicity(a65b12504cc53c,':DEFAULT').
xc_creator(a65b12504cc53c,'Cyc').
x_argGenl(x_inhalingToxicityFor,2,x_BiologicalLivingObject) :- x_cid(a65b12504cc53d).
xc_microtheory(a65b12504cc53d,x_BiologyMt).
xc_source_file(a65b12504cc53d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc53d,460).
xc_kb_names(a65b12504cc53d,[]).
xc_mapping_rows(a65b12504cc53d,[]).
xc_direction(a65b12504cc53d,':FORWARD').
xc_monotonicity(a65b12504cc53d,':MONOTONIC').
x_genls(x_AtLeastPartiallyMentalEvent,x_AnimalActivity) :- x_cid(a65b12504cc53e).
xc_microtheory(a65b12504cc53e,x_BiologyMt).
xc_source_file(a65b12504cc53e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc53e,466).
xc_kb_names(a65b12504cc53e,[]).
xc_mapping_rows(a65b12504cc53e,[]).
xc_direction(a65b12504cc53e,':FORWARD').
xc_monotonicity(a65b12504cc53e,':MONOTONIC').
xc_creator(a65b12504cc53e,'Cyc').
xc_creation_date(a65b12504cc53e,192135).
x_isa(x_Reptile,x_BiologicalClass) :- x_cid(a65b12504cc53f).
xc_microtheory(a65b12504cc53f,x_BiologyMt).
xc_source_file(a65b12504cc53f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc53f,472).
xc_kb_names(a65b12504cc53f,[]).
xc_mapping_rows(a65b12504cc53f,[]).
xc_direction(a65b12504cc53f,':FORWARD').
xc_monotonicity(a65b12504cc53f,':DEFAULT').
xc_creator(a65b12504cc53f,'Cyc').
x_resultGenl(x_BacterialSporeFn,'x_Spore-DormantBacterium') :- x_cid(a65b12504cc540).
xc_microtheory(a65b12504cc540,x_BiologyMt).
xc_source_file(a65b12504cc540,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc540,478).
xc_kb_names(a65b12504cc540,[]).
xc_mapping_rows(a65b12504cc540,[]).
xc_direction(a65b12504cc540,':FORWARD').
xc_monotonicity(a65b12504cc540,':MONOTONIC').
xc_creator(a65b12504cc540,'Cyc').
xc_creation_date(a65b12504cc540,184852).
x_implies(x_and(x_eventOccursAt(V1,V2),x_stuffInExposureEvent(V1,V3)),x_inRegion(V1,V3)) :- x_cid(a65b12504cc541,V1,V2,V3).
xc_microtheory(a65b12504cc541,x_BiologyMt).
xc_source_file(a65b12504cc541,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc541,484).
xc_kb_names(a65b12504cc541,["?EXP","?LOC","?SUBST"]).
xc_mapping_rows(a65b12504cc541,['implication-implies']).
xc_direction(a65b12504cc541,':BACKWARD').
xc_monotonicity(a65b12504cc541,':DEFAULT').
xc_creator(a65b12504cc541,'Cyc').
xc_creation_date(a65b12504cc541,94229).
x_arity(x_BacterialSporeFn,1) :- x_cid(a65b12504cc542).
xc_microtheory(a65b12504cc542,x_BiologyMt).
xc_source_file(a65b12504cc542,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc542,494).
xc_kb_names(a65b12504cc542,[]).
xc_mapping_rows(a65b12504cc542,[]).
xc_direction(a65b12504cc542,':FORWARD').
xc_monotonicity(a65b12504cc542,':DEFAULT').
x_genls(x_Fungus,'x_Organism-Whole') :- x_cid(a65b12504cc543).
xc_microtheory(a65b12504cc543,x_BiologyMt).
xc_source_file(a65b12504cc543,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc543,500).
xc_kb_names(a65b12504cc543,[]).
xc_mapping_rows(a65b12504cc543,[]).
xc_direction(a65b12504cc543,':FORWARD').
xc_monotonicity(a65b12504cc543,':DEFAULT').
xc_creator(a65b12504cc543,'Cyc').
x_argIsa(x_immuneWithRespectToPathogen,1,'x_Organism-Whole') :- x_cid(a65b12504cc544).
xc_microtheory(a65b12504cc544,x_BiologyMt).
xc_source_file(a65b12504cc544,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc544,506).
xc_kb_names(a65b12504cc544,[]).
xc_mapping_rows(a65b12504cc544,[]).
xc_direction(a65b12504cc544,':FORWARD').
xc_monotonicity(a65b12504cc544,':MONOTONIC').
x_argFormat(x_organismTypeCanLethallyInfect,2,x_SetTheFormat) :- x_cid(a65b12504cc545).
xc_microtheory(a65b12504cc545,x_BiologyMt).
xc_source_file(a65b12504cc545,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc545,512).
xc_kb_names(a65b12504cc545,[]).
xc_mapping_rows(a65b12504cc545,[]).
xc_direction(a65b12504cc545,':FORWARD').
xc_monotonicity(a65b12504cc545,':DEFAULT').
x_argIsa(x_InstantiationInstanceFn(x_organismTypeCanLethallyInfect,x_TheSet(1,2)),2,x_BiologicalLivingObject) :- x_cid(a65b12504cc546).
xc_microtheory(a65b12504cc546,x_BiologyMt).
xc_source_file(a65b12504cc546,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc546,518).
xc_kb_names(a65b12504cc546,[]).
xc_mapping_rows(a65b12504cc546,[]).
xc_direction(a65b12504cc546,':FORWARD').
xc_monotonicity(a65b12504cc546,':DEFAULT').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_FaceOfAnimal,1) :- x_cid(a65b12504cc547).
xc_microtheory(a65b12504cc547,x_BiologyMt).
xc_source_file(a65b12504cc547,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc547,526).
xc_kb_names(a65b12504cc547,[]).
xc_mapping_rows(a65b12504cc547,[]).
xc_direction(a65b12504cc547,':FORWARD').
xc_monotonicity(a65b12504cc547,':DEFAULT').
xc_creator(a65b12504cc547,'Cyc').
x_genls(x_BLymphocyte,x_Cell) :- x_cid(a65b12504cc548).
xc_microtheory(a65b12504cc548,x_BiologyMt).
xc_source_file(a65b12504cc548,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc548,532).
xc_kb_names(a65b12504cc548,[]).
xc_mapping_rows(a65b12504cc548,[]).
xc_direction(a65b12504cc548,':FORWARD').
xc_monotonicity(a65b12504cc548,':DEFAULT').
xc_creator(a65b12504cc548,'Cyc').
x_genls(x_CanineAnimal,x_Carnivore) :- x_cid(a65b12504cc549).
xc_microtheory(a65b12504cc549,x_BiologyMt).
xc_source_file(a65b12504cc549,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc549,538).
xc_kb_names(a65b12504cc549,[]).
xc_mapping_rows(a65b12504cc549,[]).
xc_direction(a65b12504cc549,':FORWARD').
xc_monotonicity(a65b12504cc549,':DEFAULT').
xc_creator(a65b12504cc549,'Cyc').
x_keWeakSuggestionPreds(x_Inhaling,x_objectActedOn) :- x_cid(a65b12504cc54a).
xc_microtheory(a65b12504cc54a,x_BiologyMt).
xc_source_file(a65b12504cc54a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc54a,544).
xc_kb_names(a65b12504cc54a,[]).
xc_mapping_rows(a65b12504cc54a,[]).
xc_direction(a65b12504cc54a,':FORWARD').
xc_monotonicity(a65b12504cc54a,':DEFAULT').
xc_creator(a65b12504cc54a,'Cyc').
xc_creation_date(a65b12504cc54a,154554).
x_argGenl(x_organismTypeCanLethallyInfect,1,x_MicroscopicScaleObject) :- x_cid(a65b12504cc54b).
xc_microtheory(a65b12504cc54b,x_BiologyMt).
xc_source_file(a65b12504cc54b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc54b,550).
xc_kb_names(a65b12504cc54b,[]).
xc_mapping_rows(a65b12504cc54b,[]).
xc_direction(a65b12504cc54b,':FORWARD').
xc_monotonicity(a65b12504cc54b,':DEFAULT').
x_genls(x_Insect,x_Arthropod) :- x_cid(a65b12504cc54c).
xc_microtheory(a65b12504cc54c,x_BiologyMt).
xc_source_file(a65b12504cc54c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc54c,556).
xc_kb_names(a65b12504cc54c,[]).
xc_mapping_rows(a65b12504cc54c,[]).
xc_direction(a65b12504cc54c,':FORWARD').
xc_monotonicity(a65b12504cc54c,':MONOTONIC').
x_isa('x_SKF-33612495',x_FixedAritySkolemFunction) :- x_cid(a65b12504cc54d).
xc_microtheory(a65b12504cc54d,x_BiologyMt).
xc_source_file(a65b12504cc54d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc54d,562).
xc_kb_names(a65b12504cc54d,[]).
xc_mapping_rows(a65b12504cc54d,[]).
xc_direction(a65b12504cc54d,':FORWARD').
xc_monotonicity(a65b12504cc54d,':MONOTONIC').
xc_creator(a65b12504cc54d,'Cyc').
x_genls('x_Clostridium-Genus',x_GramPositiveBacterium) :- x_cid(a65b12504cc54e).
xc_microtheory(a65b12504cc54e,x_BiologyMt).
xc_source_file(a65b12504cc54e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc54e,568).
xc_kb_names(a65b12504cc54e,[]).
xc_mapping_rows(a65b12504cc54e,[]).
xc_direction(a65b12504cc54e,':FORWARD').
xc_monotonicity(a65b12504cc54e,':MONOTONIC').
xc_creator(a65b12504cc54e,'Cyc').
x_comment(x_carriesOrganism,"(carriesOrganism CARRIER ORGANISM) means that CARRIER currently\ncarries ORGANISM. See also, #$carriesOrganismType.") :- x_cid(a65b12504cc54f).
xc_microtheory(a65b12504cc54f,x_BiologyMt).
xc_source_file(a65b12504cc54f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc54f,574).
xc_kb_names(a65b12504cc54f,[]).
xc_mapping_rows(a65b12504cc54f,[]).
xc_direction(a65b12504cc54f,':FORWARD').
xc_monotonicity(a65b12504cc54f,':DEFAULT').
xc_creator(a65b12504cc54f,'Cyc').
xc_creation_date(a65b12504cc54f,123939).
x_arg3Format(x_contactToxicityFor,x_IntervalEntry) :- x_cid(a65b12504cc550).
xc_microtheory(a65b12504cc550,x_BiologyMt).
xc_source_file(a65b12504cc550,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc550,581).
xc_kb_names(a65b12504cc550,[]).
xc_mapping_rows(a65b12504cc550,[]).
xc_direction(a65b12504cc550,':FORWARD').
xc_monotonicity(a65b12504cc550,':DEFAULT').
xc_creator(a65b12504cc550,'Cyc').
xc_creation_date(a65b12504cc550,184610).
x_genls(x_AnthraxInfection,x_Infection) :- x_cid(a65b12504cc551).
xc_microtheory(a65b12504cc551,x_BiologyMt).
xc_source_file(a65b12504cc551,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc551,587).
xc_kb_names(a65b12504cc551,[]).
xc_mapping_rows(a65b12504cc551,[]).
xc_direction(a65b12504cc551,':FORWARD').
xc_monotonicity(a65b12504cc551,':DEFAULT').
xc_creator(a65b12504cc551,'Cyc').
x_arg1Genl(x_organismFoundInSubstance,'x_Organism-Whole') :- x_cid(a65b12504cc552).
xc_microtheory(a65b12504cc552,x_BiologyMt).
xc_source_file(a65b12504cc552,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc552,593).
xc_kb_names(a65b12504cc552,[]).
xc_mapping_rows(a65b12504cc552,[]).
xc_direction(a65b12504cc552,':FORWARD').
xc_monotonicity(a65b12504cc552,':MONOTONIC').
xc_creator(a65b12504cc552,'Cyc').
xc_creation_date(a65b12504cc552,175951).
x_genls(x_AntibodyIgE,x_Antibody) :- x_cid(a65b12504cc553).
xc_microtheory(a65b12504cc553,x_BiologyMt).
xc_source_file(a65b12504cc553,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc553,599).
xc_kb_names(a65b12504cc553,[]).
xc_mapping_rows(a65b12504cc553,[]).
xc_direction(a65b12504cc553,':FORWARD').
xc_monotonicity(a65b12504cc553,':MONOTONIC').
xc_creator(a65b12504cc553,'Cyc').
x_genls(x_Primate,x_Mammal) :- x_cid(a65b12504cc554).
xc_microtheory(a65b12504cc554,x_BiologyMt).
xc_source_file(a65b12504cc554,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc554,605).
xc_kb_names(a65b12504cc554,[]).
xc_mapping_rows(a65b12504cc554,[]).
xc_direction(a65b12504cc554,':FORWARD').
xc_monotonicity(a65b12504cc554,':DEFAULT').
xc_creator(a65b12504cc554,'Cyc').
x_superTaxons(x_Mammal,x_Vertebrate) :- x_cid(a65b12504cc555).
xc_microtheory(a65b12504cc555,x_BiologyMt).
xc_source_file(a65b12504cc555,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc555,611).
xc_kb_names(a65b12504cc555,[]).
xc_mapping_rows(a65b12504cc555,[]).
xc_direction(a65b12504cc555,':FORWARD').
xc_monotonicity(a65b12504cc555,':DEFAULT').
xc_creator(a65b12504cc555,'Cyc').
x_arg2Genl(x_inhalingToxicityFor,x_BiologicalLivingObject) :- x_cid(a65b12504cc556).
xc_microtheory(a65b12504cc556,x_BiologyMt).
xc_source_file(a65b12504cc556,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc556,617).
xc_kb_names(a65b12504cc556,[]).
xc_mapping_rows(a65b12504cc556,[]).
xc_direction(a65b12504cc556,':FORWARD').
xc_monotonicity(a65b12504cc556,':MONOTONIC').
xc_creator(a65b12504cc556,'Cyc').
xc_creation_date(a65b12504cc556,184610).
x_isa(x_Amphibian,x_BiologicalClass) :- x_cid(a65b12504cc557).
xc_microtheory(a65b12504cc557,x_BiologyMt).
xc_source_file(a65b12504cc557,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc557,623).
xc_kb_names(a65b12504cc557,[]).
xc_mapping_rows(a65b12504cc557,[]).
xc_direction(a65b12504cc557,':FORWARD').
xc_monotonicity(a65b12504cc557,':DEFAULT').
xc_creator(a65b12504cc557,'Cyc').
x_comment(x_BacterialSporeFn,"(#$BacterialSporeFn BACTERIUM-TYPE) returns the collection of\nall bacteria of the type BACTERIUM-TYPE in their spore form.") :- x_cid(a65b12504cc558).
xc_microtheory(a65b12504cc558,x_BiologyMt).
xc_source_file(a65b12504cc558,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc558,629).
xc_kb_names(a65b12504cc558,[]).
xc_mapping_rows(a65b12504cc558,[]).
xc_direction(a65b12504cc558,':FORWARD').
xc_monotonicity(a65b12504cc558,':DEFAULT').
xc_creator(a65b12504cc558,'Cyc').
xc_creation_date(a65b12504cc558,184402).
x_siblingDisjointExceptions(x_BacillusBacterium,x_GramPositiveBacterium) :- x_cid(a65b12504cc559).
xc_microtheory(a65b12504cc559,x_BiologyMt).
xc_source_file(a65b12504cc559,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc559,636).
xc_kb_names(a65b12504cc559,[]).
xc_mapping_rows(a65b12504cc559,[]).
xc_direction(a65b12504cc559,':FORWARD').
xc_monotonicity(a65b12504cc559,':DEFAULT').
xc_creator(a65b12504cc559,'Cyc').
xc_creation_date(a65b12504cc559,93514).
x_comment(x_stuffInExposureEvent,"This predicate relates instances of #$ExposureToSubstance to that which the object exposed (see #$objectExposed) is exposed to in the event.") :- x_cid(a65b12504cc55a).
xc_microtheory(a65b12504cc55a,x_BiologyMt).
xc_source_file(a65b12504cc55a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc55a,642).
xc_kb_names(a65b12504cc55a,[]).
xc_mapping_rows(a65b12504cc55a,[]).
xc_direction(a65b12504cc55a,':FORWARD').
xc_monotonicity(a65b12504cc55a,':DEFAULT').
xc_creator(a65b12504cc55a,'Cyc').
xc_creation_date(a65b12504cc55a,94229).
x_exampleNATs(x_BacterialSporeFn,x_BacterialSporeFn('x_ClostridiumBotulinum-Species')) :- x_cid(a65b12504cc55b).
xc_microtheory(a65b12504cc55b,x_BiologyMt).
xc_source_file(a65b12504cc55b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc55b,648).
xc_kb_names(a65b12504cc55b,[]).
xc_mapping_rows(a65b12504cc55b,[]).
xc_direction(a65b12504cc55b,':FORWARD').
xc_monotonicity(a65b12504cc55b,':MONOTONIC').
xc_creator(a65b12504cc55b,'Cyc').
xc_creation_date(a65b12504cc55b,162355).
x_isa(x_BacterialSporeFn,x_UnaryFunction) :- x_cid(a65b12504cc55c).
xc_microtheory(a65b12504cc55c,x_BiologyMt).
xc_source_file(a65b12504cc55c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc55c,655).
xc_kb_names(a65b12504cc55c,[]).
xc_mapping_rows(a65b12504cc55c,[]).
xc_direction(a65b12504cc55c,':FORWARD').
xc_monotonicity(a65b12504cc55c,':MONOTONIC').
xc_creator(a65b12504cc55c,'Cyc').
x_comment(x_ImmuneResponse,"A collection. #$ImmuneResponse isa the collection of all immune\nresponse. It stands for the usually wide variety of organism's\n#$ImmuneSystem response to encounter with microbial or viral agent. See\n#$HumoralImmuneResponse, #$CellularImmuneResponse, #$ImmuneSystem.") :- x_cid(a65b12504cc55d).
xc_microtheory(a65b12504cc55d,x_BiologyMt).
xc_source_file(a65b12504cc55d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc55d,661).
xc_kb_names(a65b12504cc55d,[]).
xc_mapping_rows(a65b12504cc55d,[]).
xc_direction(a65b12504cc55d,':FORWARD').
xc_monotonicity(a65b12504cc55d,':DEFAULT').
xc_creator(a65b12504cc55d,'Cyc').
x_arg1Isa(x_immuneWithRespectToPathogen,'x_Organism-Whole') :- x_cid(a65b12504cc55e).
xc_microtheory(a65b12504cc55e,x_BiologyMt).
xc_source_file(a65b12504cc55e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc55e,670).
xc_kb_names(a65b12504cc55e,[]).
xc_mapping_rows(a65b12504cc55e,[]).
xc_direction(a65b12504cc55e,':FORWARD').
xc_monotonicity(a65b12504cc55e,':MONOTONIC').
xc_creator(a65b12504cc55e,'Cyc').
xc_creation_date(a65b12504cc55e,104745).
x_relationExistsCountAll(x_anatomicalParts,V1,x_HairMobFn(V1),1) :- x_cid(a65b12504cc55f,V1).
xc_microtheory(a65b12504cc55f,x_BiologyMt).
xc_source_file(a65b12504cc55f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc55f,676).
xc_kb_names(a65b12504cc55f,["?MAMMALTYPE"]).
xc_mapping_rows(a65b12504cc55f,[]).
xc_direction(a65b12504cc55f,':FORWARD').
xc_monotonicity(a65b12504cc55f,':DEFAULT').
xc_creator(a65b12504cc55f,'Cyc').
xc_creation_date(a65b12504cc55f,101635).
x_arg2Format(x_organismTypeCanLethallyInfect,x_SetTheFormat) :- x_cid(a65b12504cc560).
xc_microtheory(a65b12504cc560,x_BiologyMt).
xc_source_file(a65b12504cc560,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc560,683).
xc_kb_names(a65b12504cc560,[]).
xc_mapping_rows(a65b12504cc560,[]).
xc_direction(a65b12504cc560,':FORWARD').
xc_monotonicity(a65b12504cc560,':DEFAULT').
xc_creator(a65b12504cc560,'Cyc').
xc_creation_date(a65b12504cc560,150535).
x_examplePredFormulas(x_stuffInExposureEvent,x_stuffInExposureEvent(x_JoesJuly9Bath,x_WaterInJoesJuly9Bath)) :- x_cid(a65b12504cc561).
xc_microtheory(a65b12504cc561,x_BiologyMt).
xc_source_file(a65b12504cc561,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc561,689).
xc_kb_names(a65b12504cc561,[]).
xc_mapping_rows(a65b12504cc561,[]).
xc_direction(a65b12504cc561,':FORWARD').
xc_monotonicity(a65b12504cc561,':MONOTONIC').
xc_creator(a65b12504cc561,'Cyc').
xc_creation_date(a65b12504cc561,172511).
x_resultGenlArg(x_BacterialSporeFn,1) :- x_cid(a65b12504cc562).
xc_microtheory(a65b12504cc562,x_BiologyMt).
xc_source_file(a65b12504cc562,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc562,696).
xc_kb_names(a65b12504cc562,[]).
xc_mapping_rows(a65b12504cc562,[]).
xc_direction(a65b12504cc562,':FORWARD').
xc_monotonicity(a65b12504cc562,':MONOTONIC').
xc_creator(a65b12504cc562,'Cyc').
xc_creation_date(a65b12504cc562,133017).
x_genls(x_TLymphocyte,x_AnimalBLO) :- x_cid(a65b12504cc563).
xc_microtheory(a65b12504cc563,x_BiologyMt).
xc_source_file(a65b12504cc563,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc563,702).
xc_kb_names(a65b12504cc563,[]).
xc_mapping_rows(a65b12504cc563,[]).
xc_direction(a65b12504cc563,':FORWARD').
xc_monotonicity(a65b12504cc563,':DEFAULT').
xc_creator(a65b12504cc563,'Cyc').
x_genls('x_Plant-Woody',x_TerrestrialOrganism) :- x_cid(a65b12504cc564).
xc_microtheory(a65b12504cc564,x_BiologyMt).
xc_source_file(a65b12504cc564,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc564,708).
xc_kb_names(a65b12504cc564,[]).
xc_mapping_rows(a65b12504cc564,[]).
xc_direction(a65b12504cc564,':FORWARD').
xc_monotonicity(a65b12504cc564,':DEFAULT').
xc_creator(a65b12504cc564,'Cyc').
x_genls(x_CanineAnimal,x_Mammal) :- x_cid(a65b12504cc565).
xc_microtheory(a65b12504cc565,x_BiologyMt).
xc_source_file(a65b12504cc565,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc565,714).
xc_kb_names(a65b12504cc565,[]).
xc_mapping_rows(a65b12504cc565,[]).
xc_direction(a65b12504cc565,':FORWARD').
xc_monotonicity(a65b12504cc565,':DEFAULT').
xc_creator(a65b12504cc565,'Cyc').
x_isa('x_Clostridiales-Order',x_BiologicalOrder) :- x_cid(a65b12504cc566).
xc_microtheory(a65b12504cc566,x_BiologyMt).
xc_source_file(a65b12504cc566,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc566,720).
xc_kb_names(a65b12504cc566,[]).
xc_mapping_rows(a65b12504cc566,[]).
xc_direction(a65b12504cc566,':FORWARD').
xc_monotonicity(a65b12504cc566,':MONOTONIC').
xc_creator(a65b12504cc566,'Cyc').
x_arg1Genl(x_organismTypeCanLethallyInfect,x_MicroscopicScaleObject) :- x_cid(a65b12504cc567).
xc_microtheory(a65b12504cc567,x_BiologyMt).
xc_source_file(a65b12504cc567,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc567,726).
xc_kb_names(a65b12504cc567,[]).
xc_mapping_rows(a65b12504cc567,[]).
xc_direction(a65b12504cc567,':FORWARD').
xc_monotonicity(a65b12504cc567,':DEFAULT').
xc_creator(a65b12504cc567,'Cyc').
x_superTaxons(x_Insect,x_Arthropod) :- x_cid(a65b12504cc568).
xc_microtheory(a65b12504cc568,x_BiologyMt).
xc_source_file(a65b12504cc568,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc568,732).
xc_kb_names(a65b12504cc568,[]).
xc_mapping_rows(a65b12504cc568,[]).
xc_direction(a65b12504cc568,':FORWARD').
xc_monotonicity(a65b12504cc568,':MONOTONIC').
xc_creator(a65b12504cc568,'Cyc').
x_genls('x_Clostridium-Genus',x_AnaerobicBacterium) :- x_cid(a65b12504cc569).
xc_microtheory(a65b12504cc569,x_BiologyMt).
xc_source_file(a65b12504cc569,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc569,738).
xc_kb_names(a65b12504cc569,[]).
xc_mapping_rows(a65b12504cc569,[]).
xc_direction(a65b12504cc569,':FORWARD').
xc_monotonicity(a65b12504cc569,':MONOTONIC').
xc_creator(a65b12504cc569,'Cyc').
x_genlInverse(x_carriesOrganism,x_objectFoundInLocation) :- x_cid(a65b12504cc56a).
xc_microtheory(a65b12504cc56a,x_BiologyMt).
xc_source_file(a65b12504cc56a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc56a,744).
xc_kb_names(a65b12504cc56a,[]).
xc_mapping_rows(a65b12504cc56a,[]).
xc_direction(a65b12504cc56a,':FORWARD').
xc_monotonicity(a65b12504cc56a,':MONOTONIC').
xc_creator(a65b12504cc56a,'Cyc').
xc_creation_date(a65b12504cc56a,123939).
x_argIsa(x_organismFoundInSubstance,1,x_Collection) :- x_cid(a65b12504cc56b).
xc_microtheory(a65b12504cc56b,x_BiologyMt).
xc_source_file(a65b12504cc56b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc56b,750).
xc_kb_names(a65b12504cc56b,[]).
xc_mapping_rows(a65b12504cc56b,[]).
xc_direction(a65b12504cc56b,':FORWARD').
xc_monotonicity(a65b12504cc56b,':MONOTONIC').
x_isa(x_ExposureToSubstance,x_Collection) :- x_cid(a65b12504cc56c).
xc_microtheory(a65b12504cc56c,x_BiologyMt).
xc_source_file(a65b12504cc56c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc56c,756).
xc_kb_names(a65b12504cc56c,[]).
xc_mapping_rows(a65b12504cc56c,[]).
xc_direction(a65b12504cc56c,':FORWARD').
xc_monotonicity(a65b12504cc56c,':MONOTONIC').
xc_creator(a65b12504cc56c,'Cyc').
xc_creation_date(a65b12504cc56c,163147).
x_partitionedInto(x_Person,x_PersonByGenderType) :- x_cid(a65b12504cc56d).
xc_microtheory(a65b12504cc56d,x_BiologyMt).
xc_source_file(a65b12504cc56d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc56d,762).
xc_kb_names(a65b12504cc56d,[]).
xc_mapping_rows(a65b12504cc56d,[]).
xc_direction(a65b12504cc56d,':FORWARD').
xc_monotonicity(a65b12504cc56d,':MONOTONIC').
xc_creator(a65b12504cc56d,'Cyc').
x_isa(x_BacteriumTypeByStructure,x_SiblingDisjointCollection) :- x_cid(a65b12504cc56e).
xc_microtheory(a65b12504cc56e,x_BiologyMt).
xc_source_file(a65b12504cc56e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc56e,768).
xc_kb_names(a65b12504cc56e,[]).
xc_mapping_rows(a65b12504cc56e,[]).
xc_direction(a65b12504cc56e,':FORWARD').
xc_monotonicity(a65b12504cc56e,':DEFAULT').
xc_creator(a65b12504cc56e,'Cyc').
x_argIsa(x_inhalingToxicityFor,2,x_OrganismClassificationType) :- x_cid(a65b12504cc56f).
xc_microtheory(a65b12504cc56f,x_BiologyMt).
xc_source_file(a65b12504cc56f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc56f,774).
xc_kb_names(a65b12504cc56f,[]).
xc_mapping_rows(a65b12504cc56f,[]).
xc_direction(a65b12504cc56f,':FORWARD').
xc_monotonicity(a65b12504cc56f,':MONOTONIC').
x_isa(x_Fish,x_BiologicalClass) :- x_cid(a65b12504cc570).
xc_microtheory(a65b12504cc570,x_BiologyMt).
xc_source_file(a65b12504cc570,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc570,780).
xc_kb_names(a65b12504cc570,[]).
xc_mapping_rows(a65b12504cc570,[]).
xc_direction(a65b12504cc570,':FORWARD').
xc_monotonicity(a65b12504cc570,':DEFAULT').
xc_creator(a65b12504cc570,'Cyc').
x_comment(x_BacteriumTypeByAerobicity,"A collection of collections and a partion on #$Bacterium. This collection partitions #$Bacterium into two disjoint classes, the #$AnaerobicBacterium and the #$AerobicBacterium.") :- x_cid(a65b12504cc571).
xc_microtheory(a65b12504cc571,x_BiologyMt).
xc_source_file(a65b12504cc571,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc571,786).
xc_kb_names(a65b12504cc571,[]).
xc_mapping_rows(a65b12504cc571,[]).
xc_direction(a65b12504cc571,':FORWARD').
xc_monotonicity(a65b12504cc571,':DEFAULT').
xc_creator(a65b12504cc571,'Cyc').
xc_creation_date(a65b12504cc571,135230).
x_isa(x_AttemptingFn(x_EconomicEmbargo),x_Collection) :- x_cid(a65b12504cc572).
xc_microtheory(a65b12504cc572,x_BiologyMt).
xc_source_file(a65b12504cc572,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc572,792).
xc_kb_names(a65b12504cc572,[]).
xc_mapping_rows(a65b12504cc572,[]).
xc_direction(a65b12504cc572,':FORWARD').
xc_monotonicity(a65b12504cc572,':DEFAULT').
x_superTaxons(x_Reptile,x_Vertebrate) :- x_cid(a65b12504cc573).
xc_microtheory(a65b12504cc573,x_BiologyMt).
xc_source_file(a65b12504cc573,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc573,799).
xc_kb_names(a65b12504cc573,[]).
xc_mapping_rows(a65b12504cc573,[]).
xc_direction(a65b12504cc573,':FORWARD').
xc_monotonicity(a65b12504cc573,':DEFAULT').
xc_creator(a65b12504cc573,'Cyc').
x_argIsa(x_stuffInExposureEvent,2,x_PartiallyTangible) :- x_cid(a65b12504cc574).
xc_microtheory(a65b12504cc574,x_BiologyMt).
xc_source_file(a65b12504cc574,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc574,805).
xc_kb_names(a65b12504cc574,[]).
xc_mapping_rows(a65b12504cc574,[]).
xc_direction(a65b12504cc574,':FORWARD').
xc_monotonicity(a65b12504cc574,':MONOTONIC').
x_comment(x_exposureToType,"(exposureToType EXPOSURE TYPE) means that during EXPOSURE, the\nobject exposed is exposed to substance of the TYPE.") :- x_cid(a65b12504cc575).
xc_microtheory(a65b12504cc575,x_BiologyMt).
xc_source_file(a65b12504cc575,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc575,811).
xc_kb_names(a65b12504cc575,[]).
xc_mapping_rows(a65b12504cc575,[]).
xc_direction(a65b12504cc575,':FORWARD').
xc_monotonicity(a65b12504cc575,':DEFAULT').
xc_creator(a65b12504cc575,'Cyc').
xc_creation_date(a65b12504cc575,163147).
x_comment(x_SporeGermination,"The collection of events in which spores, instances of #$Spore-PlantOrgan, \ngerminate.") :- x_cid(a65b12504cc576).
xc_microtheory(a65b12504cc576,x_BiologyMt).
xc_source_file(a65b12504cc576,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc576,818).
xc_kb_names(a65b12504cc576,[]).
xc_mapping_rows(a65b12504cc576,[]).
xc_direction(a65b12504cc576,':FORWARD').
xc_monotonicity(a65b12504cc576,':DEFAULT').
xc_creator(a65b12504cc576,'Cyc').
xc_creation_date(a65b12504cc576,172905).
x_genls(x_BacterialSporeFn('x_ClostridiumBotulinum-Species'),'x_Spore-DormantBacterium') :- x_cid(a65b12504cc577).
xc_microtheory(a65b12504cc577,x_BiologyMt).
xc_source_file(a65b12504cc577,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc577,825).
xc_kb_names(a65b12504cc577,[]).
xc_mapping_rows(a65b12504cc577,[]).
xc_direction(a65b12504cc577,':FORWARD').
xc_monotonicity(a65b12504cc577,':MONOTONIC').
x_isa(x_BacterialSporeFn,x_ReifiableFunction) :- x_cid(a65b12504cc578).
xc_microtheory(a65b12504cc578,x_BiologyMt).
xc_source_file(a65b12504cc578,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc578,832).
xc_kb_names(a65b12504cc578,[]).
xc_mapping_rows(a65b12504cc578,[]).
xc_direction(a65b12504cc578,':FORWARD').
xc_monotonicity(a65b12504cc578,':MONOTONIC').
xc_creator(a65b12504cc578,'Cyc').
'x_interArgFormat1-2'(x_bodilyDoer,x_PhysiologicalCondition,x_SingleEntry) :- x_cid(a65b12504cc579).
xc_microtheory(a65b12504cc579,x_BiologyMt).
xc_source_file(a65b12504cc579,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc579,838).
xc_kb_names(a65b12504cc579,[]).
xc_mapping_rows(a65b12504cc579,[]).
xc_direction(a65b12504cc579,':FORWARD').
xc_monotonicity(a65b12504cc579,':DEFAULT').
xc_creator(a65b12504cc579,'Cyc').
xc_creation_date(a65b12504cc579,153335).
x_comment('x_AnaerobicBacterium-Oxyphobic',"The collection of all instances of #$AnaerobicBacterium to which oxygen is actually lethal; i.e., which not only do not metabolize oxygen, but which are actually killed by it.") :- x_cid(a65b12504cc57a).
xc_microtheory(a65b12504cc57a,x_BiologyMt).
xc_source_file(a65b12504cc57a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc57a,844).
xc_kb_names(a65b12504cc57a,[]).
xc_mapping_rows(a65b12504cc57a,[]).
xc_direction(a65b12504cc57a,':FORWARD').
xc_monotonicity(a65b12504cc57a,':MONOTONIC').
xc_creator(a65b12504cc57a,'Cyc').
xc_creation_date(a65b12504cc57a,161528).
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Lung,1) :- x_cid(a65b12504cc57b).
xc_microtheory(a65b12504cc57b,x_BiologyMt).
xc_source_file(a65b12504cc57b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc57b,850).
xc_kb_names(a65b12504cc57b,[]).
xc_mapping_rows(a65b12504cc57b,[]).
xc_direction(a65b12504cc57b,':FORWARD').
xc_monotonicity(a65b12504cc57b,':DEFAULT').
xc_creator(a65b12504cc57b,'Cyc').
x_genls(x_ImmuneResponse,'x_BodilyFunctionEvent-Involuntary') :- x_cid(a65b12504cc57c).
xc_microtheory(a65b12504cc57c,x_BiologyMt).
xc_source_file(a65b12504cc57c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc57c,856).
xc_kb_names(a65b12504cc57c,[]).
xc_mapping_rows(a65b12504cc57c,[]).
xc_direction(a65b12504cc57c,':FORWARD').
xc_monotonicity(a65b12504cc57c,':MONOTONIC').
xc_creator(a65b12504cc57c,'Cyc').
x_comment(x_HairMobFn,"(#$HairMobFn MAMMALTYPE) returns the collection of instances of #$MobOfHair-Mammal belonging to instances of MAMMALTYPE.  E.g., (#$HairMobFn #$Raccoon) is the collection of #$Raccoon hair, or more properly, the collection of all #$Raccoon hair-mobs.") :- x_cid(a65b12504cc57d).
xc_microtheory(a65b12504cc57d,x_BiologyMt).
xc_source_file(a65b12504cc57d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc57d,862).
xc_kb_names(a65b12504cc57d,[]).
xc_mapping_rows(a65b12504cc57d,[]).
xc_direction(a65b12504cc57d,':FORWARD').
xc_monotonicity(a65b12504cc57d,':DEFAULT').
xc_creator(a65b12504cc57d,'Cyc').
xc_creation_date(a65b12504cc57d,101635).
x_argFormat(x_organismTypeCanLethallyInfect,1,x_SetTheFormat) :- x_cid(a65b12504cc57e).
xc_microtheory(a65b12504cc57e,x_BiologyMt).
xc_source_file(a65b12504cc57e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc57e,868).
xc_kb_names(a65b12504cc57e,[]).
xc_mapping_rows(a65b12504cc57e,[]).
xc_direction(a65b12504cc57e,':FORWARD').
xc_monotonicity(a65b12504cc57e,':DEFAULT').
x_arity(x_InstantiationInstanceFn(x_organismTypeCanLethallyInfect,x_TheSet(1,2)),2) :- x_cid(a65b12504cc57f).
xc_microtheory(a65b12504cc57f,x_BiologyMt).
xc_source_file(a65b12504cc57f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc57f,874).
xc_kb_names(a65b12504cc57f,[]).
xc_mapping_rows(a65b12504cc57f,[]).
xc_direction(a65b12504cc57f,':FORWARD').
xc_monotonicity(a65b12504cc57f,':DEFAULT').
x_isa('x_Head-Vertebrate',x_UniqueAnatomicalPartType) :- x_cid(a65b12504cc580).
xc_microtheory(a65b12504cc580,x_BiologyMt).
xc_source_file(a65b12504cc580,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc580,882).
xc_kb_names(a65b12504cc580,[]).
xc_mapping_rows(a65b12504cc580,[]).
xc_direction(a65b12504cc580,':FORWARD').
xc_monotonicity(a65b12504cc580,':DEFAULT').
x_genls(x_TLymphocyte,x_Cell) :- x_cid(a65b12504cc581).
xc_microtheory(a65b12504cc581,x_BiologyMt).
xc_source_file(a65b12504cc581,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc581,888).
xc_kb_names(a65b12504cc581,[]).
xc_mapping_rows(a65b12504cc581,[]).
xc_direction(a65b12504cc581,':FORWARD').
xc_monotonicity(a65b12504cc581,':DEFAULT').
xc_creator(a65b12504cc581,'Cyc').
x_argIsa(x_inhalingToxicityFor,3,x_ScalarInterval) :- x_cid(a65b12504cc582).
xc_microtheory(a65b12504cc582,x_BiologyMt).
xc_source_file(a65b12504cc582,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc582,894).
xc_kb_names(a65b12504cc582,[]).
xc_mapping_rows(a65b12504cc582,[]).
xc_direction(a65b12504cc582,':FORWARD').
xc_monotonicity(a65b12504cc582,':DEFAULT').
x_implies(x_and(x_isa(V1,x_UniqueAnatomicalPartType),x_infectionLocalizedIn(V2,V3,V1)),x_inRegion(V3,x_BodyPartFn(V2,V1))) :- x_cid(a65b12504cc583,V1,V2,V3).
xc_microtheory(a65b12504cc583,x_BiologyMt).
xc_source_file(a65b12504cc583,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc583,900).
xc_kb_names(a65b12504cc583,["?PART-TYPE","?ORG","?INFECTION"]).
xc_mapping_rows(a65b12504cc583,['implication-implies']).
xc_direction(a65b12504cc583,':BACKWARD').
xc_monotonicity(a65b12504cc583,':DEFAULT').
xc_creator(a65b12504cc583,'Cyc').
xc_creation_date(a65b12504cc583,113419).
x_isa(x_Inhaling,x_SituationType) :- x_cid(a65b12504cc584).
xc_microtheory(a65b12504cc584,x_BiologyMt).
xc_source_file(a65b12504cc584,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc584,911).
xc_kb_names(a65b12504cc584,[]).
xc_mapping_rows(a65b12504cc584,[]).
xc_direction(a65b12504cc584,':FORWARD').
xc_monotonicity(a65b12504cc584,':DEFAULT').
xc_creator(a65b12504cc584,'Cyc').
x_implies(x_and(x_isa(V1,'x_Killing-Biological'),x_inputsDestroyed(V1,V2)),x_temporallyCoterminal(V1,V2)) :- x_cid(a65b12504cc585,V1,V2).
xc_microtheory(a65b12504cc585,x_BiologyMt).
xc_source_file(a65b12504cc585,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc585,917).
xc_kb_names(a65b12504cc585,["?KILL","?ORG"]).
xc_mapping_rows(a65b12504cc585,['implication-implies']).
xc_direction(a65b12504cc585,':BACKWARD').
xc_monotonicity(a65b12504cc585,':DEFAULT').
xc_creator(a65b12504cc585,'Cyc').
x_genls('x_Anthrax-Bacterium',x_BacillusBacterium) :- x_cid(a65b12504cc586).
xc_microtheory(a65b12504cc586,x_BiologyMt).
xc_source_file(a65b12504cc586,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc586,927).
xc_kb_names(a65b12504cc586,[]).
xc_mapping_rows(a65b12504cc586,[]).
xc_direction(a65b12504cc586,':FORWARD').
xc_monotonicity(a65b12504cc586,':DEFAULT').
xc_creator(a65b12504cc586,'Cyc').
x_genls('x_Clostridium-Genus','x_Clostridiaceae-Family') :- x_cid(a65b12504cc587).
xc_microtheory(a65b12504cc587,x_BiologyMt).
xc_source_file(a65b12504cc587,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc587,933).
xc_kb_names(a65b12504cc587,[]).
xc_mapping_rows(a65b12504cc587,[]).
xc_direction(a65b12504cc587,':FORWARD').
xc_monotonicity(a65b12504cc587,':DEFAULT').
x_genls(x_RickettsiaRicketsii,x_Rickettsia) :- x_cid(a65b12504cc588).
xc_microtheory(a65b12504cc588,x_BiologyMt).
xc_source_file(a65b12504cc588,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc588,939).
xc_kb_names(a65b12504cc588,[]).
xc_mapping_rows(a65b12504cc588,[]).
xc_direction(a65b12504cc588,':FORWARD').
xc_monotonicity(a65b12504cc588,':MONOTONIC').
xc_creator(a65b12504cc588,'Cyc').
xc_creation_date(a65b12504cc588,101317).
x_genls(x_Amphibian,x_Vertebrate) :- x_cid(a65b12504cc589).
xc_microtheory(a65b12504cc589,x_BiologyMt).
xc_source_file(a65b12504cc589,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc589,945).
xc_kb_names(a65b12504cc589,[]).
xc_mapping_rows(a65b12504cc589,[]).
xc_direction(a65b12504cc589,':FORWARD').
xc_monotonicity(a65b12504cc589,':DEFAULT').
x_argIsa(x_carriesOrganism,2,'x_Organism-Whole') :- x_cid(a65b12504cc58a).
xc_microtheory(a65b12504cc58a,x_BiologyMt).
xc_source_file(a65b12504cc58a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc58a,951).
xc_kb_names(a65b12504cc58a,[]).
xc_mapping_rows(a65b12504cc58a,[]).
xc_direction(a65b12504cc58a,':FORWARD').
xc_monotonicity(a65b12504cc58a,':MONOTONIC').
x_comment(x_RicinToxin,"A #$Collection. #$RicinToxin is one of the main toxic proteins of the castor bean plant (ricinus communis). Ricin is a potent cytotoxin but a weak hemagglutinin.") :- x_cid(a65b12504cc58b).
xc_microtheory(a65b12504cc58b,x_BiologyMt).
xc_source_file(a65b12504cc58b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc58b,957).
xc_kb_names(a65b12504cc58b,[]).
xc_mapping_rows(a65b12504cc58b,[]).
xc_direction(a65b12504cc58b,':FORWARD').
xc_monotonicity(a65b12504cc58b,':DEFAULT').
xc_creator(a65b12504cc58b,'Cyc').
x_arg1Isa(x_organismFoundInSubstance,x_Collection) :- x_cid(a65b12504cc58c).
xc_microtheory(a65b12504cc58c,x_BiologyMt).
xc_source_file(a65b12504cc58c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc58c,963).
xc_kb_names(a65b12504cc58c,[]).
xc_mapping_rows(a65b12504cc58c,[]).
xc_direction(a65b12504cc58c,':FORWARD').
xc_monotonicity(a65b12504cc58c,':MONOTONIC').
xc_creator(a65b12504cc58c,'Cyc').
xc_creation_date(a65b12504cc58c,175919).
x_isa(x_AntibodyIgE,x_ChemicalCompoundType) :- x_cid(a65b12504cc58d).
xc_microtheory(a65b12504cc58d,x_BiologyMt).
xc_source_file(a65b12504cc58d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc58d,969).
xc_kb_names(a65b12504cc58d,[]).
xc_mapping_rows(a65b12504cc58d,[]).
xc_direction(a65b12504cc58d,':FORWARD').
xc_monotonicity(a65b12504cc58d,':MONOTONIC').
xc_creator(a65b12504cc58d,'Cyc').
x_isa(x_BacteriumTypeByStructure,x_DisjointSetOrCollection) :- x_cid(a65b12504cc58e).
xc_microtheory(a65b12504cc58e,x_BiologyMt).
xc_source_file(a65b12504cc58e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc58e,975).
xc_kb_names(a65b12504cc58e,[]).
xc_mapping_rows(a65b12504cc58e,[]).
xc_direction(a65b12504cc58e,':FORWARD').
xc_monotonicity(a65b12504cc58e,':DEFAULT').
xc_creator(a65b12504cc58e,'Cyc').
x_arg2Isa(x_inhalingToxicityFor,x_OrganismClassificationType) :- x_cid(a65b12504cc58f).
xc_microtheory(a65b12504cc58f,x_BiologyMt).
xc_source_file(a65b12504cc58f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc58f,981).
xc_kb_names(a65b12504cc58f,[]).
xc_mapping_rows(a65b12504cc58f,[]).
xc_direction(a65b12504cc58f,':FORWARD').
xc_monotonicity(a65b12504cc58f,':MONOTONIC').
xc_creator(a65b12504cc58f,'Cyc').
xc_creation_date(a65b12504cc58f,184610).
x_isa(x_Bird,x_BiologicalClass) :- x_cid(a65b12504cc590).
xc_microtheory(a65b12504cc590,x_BiologyMt).
xc_source_file(a65b12504cc590,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc590,987).
xc_kb_names(a65b12504cc590,[]).
xc_mapping_rows(a65b12504cc590,[]).
xc_direction(a65b12504cc590,':FORWARD').
xc_monotonicity(a65b12504cc590,':DEFAULT').
xc_creator(a65b12504cc590,'Cyc').
x_cyclistNotes(x_BacteriumTypeByAerobicity,"This or something like it should be promoted to a more general reasoning domain, together with #$AerobicBacterium and #$AnaerobicBacterium.") :- x_cid(a65b12504cc591).
xc_microtheory(a65b12504cc591,x_BiologyMt).
xc_source_file(a65b12504cc591,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc591,993).
xc_kb_names(a65b12504cc591,[]).
xc_mapping_rows(a65b12504cc591,[]).
xc_direction(a65b12504cc591,':FORWARD').
xc_monotonicity(a65b12504cc591,':DEFAULT').
xc_creator(a65b12504cc591,'Cyc').
xc_creation_date(a65b12504cc591,135230).
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_SkeletalSystem,1) :- x_cid(a65b12504cc592).
xc_microtheory(a65b12504cc592,x_BiologyMt).
xc_source_file(a65b12504cc592,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc592,999).
xc_kb_names(a65b12504cc592,[]).
xc_mapping_rows(a65b12504cc592,[]).
xc_direction(a65b12504cc592,':FORWARD').
xc_monotonicity(a65b12504cc592,':DEFAULT').
xc_creator(a65b12504cc592,'Cyc').
x_implies(x_and(x_isa(V1,x_AdultAnimal),x_isa(V1,x_Insect)),x_anatomicalParts(V1,'x_SKF-51781280'(V1,6))) :- x_cid(a65b12504cc593,V1).
xc_microtheory(a65b12504cc593,x_BiologyMt).
xc_source_file(a65b12504cc593,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc593,1005).
xc_kb_names(a65b12504cc593,["?INSECT"]).
xc_mapping_rows(a65b12504cc593,['implication-implies']).
xc_direction(a65b12504cc593,':BACKWARD').
xc_monotonicity(a65b12504cc593,':DEFAULT').
xc_creator(a65b12504cc593,'Cyc').
x_isa(x_BLymphocyte,x_ExistingObjectType) :- x_cid(a65b12504cc594).
xc_microtheory(a65b12504cc594,x_BiologyMt).
xc_source_file(a65b12504cc594,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc594,1016).
xc_kb_names(a65b12504cc594,[]).
xc_mapping_rows(a65b12504cc594,[]).
xc_direction(a65b12504cc594,':FORWARD').
xc_monotonicity(a65b12504cc594,':MONOTONIC').
xc_creator(a65b12504cc594,'Cyc').
x_arg2Isa(x_stuffInExposureEvent,x_PartiallyTangible) :- x_cid(a65b12504cc595).
xc_microtheory(a65b12504cc595,x_BiologyMt).
xc_source_file(a65b12504cc595,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc595,1022).
xc_kb_names(a65b12504cc595,[]).
xc_mapping_rows(a65b12504cc595,[]).
xc_direction(a65b12504cc595,':FORWARD').
xc_monotonicity(a65b12504cc595,':MONOTONIC').
xc_creator(a65b12504cc595,'Cyc').
xc_creation_date(a65b12504cc595,94229).
x_comment(x_VegetativeCell,"Bacteria which are not in the state of being\nan #$Endospore are #$VegetativeCells. This is the usual life of the cell\nwhen it is metabolizing.") :- x_cid(a65b12504cc596).
xc_microtheory(a65b12504cc596,x_BiologyMt).
xc_source_file(a65b12504cc596,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc596,1028).
xc_kb_names(a65b12504cc596,[]).
xc_mapping_rows(a65b12504cc596,[]).
xc_direction(a65b12504cc596,':FORWARD').
xc_monotonicity(a65b12504cc596,':DEFAULT').
xc_creator(a65b12504cc596,'Cyc').
xc_creation_date(a65b12504cc596,101355).
x_genls(x_Person,x_Primate) :- x_cid(a65b12504cc597).
xc_microtheory(a65b12504cc597,x_BiologyMt).
xc_source_file(a65b12504cc597,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc597,1036).
xc_kb_names(a65b12504cc597,[]).
xc_mapping_rows(a65b12504cc597,[]).
xc_direction(a65b12504cc597,':FORWARD').
xc_monotonicity(a65b12504cc597,':DEFAULT').
xc_creator(a65b12504cc597,'Cyc').
x_genls(x_BacterialSporeFn('x_ClostridiumBotulinum-Species'),x_SporeFormingBacterium) :- x_cid(a65b12504cc598).
xc_microtheory(a65b12504cc598,x_BiologyMt).
xc_source_file(a65b12504cc598,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc598,1042).
xc_kb_names(a65b12504cc598,[]).
xc_mapping_rows(a65b12504cc598,[]).
xc_direction(a65b12504cc598,':FORWARD').
xc_monotonicity(a65b12504cc598,':MONOTONIC').
x_isa(x_BacterialSporeFn,x_CollectionDenotingFunction) :- x_cid(a65b12504cc599).
xc_microtheory(a65b12504cc599,x_BiologyMt).
xc_source_file(a65b12504cc599,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc599,1049).
xc_kb_names(a65b12504cc599,[]).
xc_mapping_rows(a65b12504cc599,[]).
xc_direction(a65b12504cc599,':FORWARD').
xc_monotonicity(a65b12504cc599,':MONOTONIC').
xc_creator(a65b12504cc599,'Cyc').
x_relationAllExistsCount(x_bodilyDoer,x_PhysiologicalCondition,'x_Organism-Whole',1) :- x_cid(a65b12504cc59a).
xc_microtheory(a65b12504cc59a,x_BiologyMt).
xc_source_file(a65b12504cc59a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc59a,1055).
xc_kb_names(a65b12504cc59a,[]).
xc_mapping_rows(a65b12504cc59a,[]).
xc_direction(a65b12504cc59a,':FORWARD').
xc_monotonicity(a65b12504cc59a,':DEFAULT').
xc_creator(a65b12504cc59a,'Cyc').
xc_creation_date(a65b12504cc59a,151637).
x_genls('x_AnaerobicBacterium-Oxyphobic',x_AnaerobicBacterium) :- x_cid(a65b12504cc59b).
xc_microtheory(a65b12504cc59b,x_BiologyMt).
xc_source_file(a65b12504cc59b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc59b,1061).
xc_kb_names(a65b12504cc59b,[]).
xc_mapping_rows(a65b12504cc59b,[]).
xc_direction(a65b12504cc59b,':FORWARD').
xc_monotonicity(a65b12504cc59b,':MONOTONIC').
xc_creator(a65b12504cc59b,'Cyc').
x_arity(x_immuneWithRespectToPathogen,2) :- x_cid(a65b12504cc59c).
xc_microtheory(a65b12504cc59c,x_BiologyMt).
xc_source_file(a65b12504cc59c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc59c,1067).
xc_kb_names(a65b12504cc59c,[]).
xc_mapping_rows(a65b12504cc59c,[]).
xc_direction(a65b12504cc59c,':FORWARD').
xc_monotonicity(a65b12504cc59c,':DEFAULT').
x_arg1Format(x_organismTypeCanLethallyInfect,x_SetTheFormat) :- x_cid(a65b12504cc59d).
xc_microtheory(a65b12504cc59d,x_BiologyMt).
xc_source_file(a65b12504cc59d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc59d,1073).
xc_kb_names(a65b12504cc59d,[]).
xc_mapping_rows(a65b12504cc59d,[]).
xc_direction(a65b12504cc59d,':FORWARD').
xc_monotonicity(a65b12504cc59d,':DEFAULT').
xc_creator(a65b12504cc59d,'Cyc').
xc_creation_date(a65b12504cc59d,150535).
x_genls(x_NaturalKillerCell,x_AnimalBLO) :- x_cid(a65b12504cc59e).
xc_microtheory(a65b12504cc59e,x_BiologyMt).
xc_source_file(a65b12504cc59e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc59e,1079).
xc_kb_names(a65b12504cc59e,[]).
xc_mapping_rows(a65b12504cc59e,[]).
xc_direction(a65b12504cc59e,':FORWARD').
xc_monotonicity(a65b12504cc59e,':DEFAULT').
xc_creator(a65b12504cc59e,'Cyc').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_HumanBody,1) :- x_cid(a65b12504cc59f).
xc_microtheory(a65b12504cc59f,x_BiologyMt).
xc_source_file(a65b12504cc59f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc59f,1085).
xc_kb_names(a65b12504cc59f,[]).
xc_mapping_rows(a65b12504cc59f,[]).
xc_direction(a65b12504cc59f,':FORWARD').
xc_monotonicity(a65b12504cc59f,':DEFAULT').
xc_creator(a65b12504cc59f,'Cyc').
x_arg3Isa(x_inhalingToxicityFor,x_ScalarInterval) :- x_cid(a65b12504cc5a0).
xc_microtheory(a65b12504cc5a0,x_BiologyMt).
xc_source_file(a65b12504cc5a0,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5a0,1091).
xc_kb_names(a65b12504cc5a0,[]).
xc_mapping_rows(a65b12504cc5a0,[]).
xc_direction(a65b12504cc5a0,':FORWARD').
xc_monotonicity(a65b12504cc5a0,':DEFAULT').
xc_creator(a65b12504cc5a0,'Cyc').
x_implies(x_and(x_isa(V1,x_Dying),x_bodilyDoer(V1,V2)),x_temporallyFinishedBy(V2,V1)) :- x_cid(a65b12504cc5a1,V1,V2).
xc_microtheory(a65b12504cc5a1,x_BiologyMt).
xc_source_file(a65b12504cc5a1,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5a1,1097).
xc_kb_names(a65b12504cc5a1,["?DY","?BLO"]).
xc_mapping_rows(a65b12504cc5a1,['implication-implies']).
xc_direction(a65b12504cc5a1,':BACKWARD').
xc_monotonicity(a65b12504cc5a1,':DEFAULT').
xc_creator(a65b12504cc5a1,'Cyc').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Eye,1) :- x_cid(a65b12504cc5a2).
xc_microtheory(a65b12504cc5a2,x_BiologyMt).
xc_source_file(a65b12504cc5a2,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5a2,1107).
xc_kb_names(a65b12504cc5a2,[]).
xc_mapping_rows(a65b12504cc5a2,[]).
xc_direction(a65b12504cc5a2,':FORWARD').
xc_monotonicity(a65b12504cc5a2,':DEFAULT').
xc_creator(a65b12504cc5a2,'Cyc').
x_genls('x_Anthrax-Bacterium',x_GramPositiveBacterium) :- x_cid(a65b12504cc5a3).
xc_microtheory(a65b12504cc5a3,x_BiologyMt).
xc_source_file(a65b12504cc5a3,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5a3,1113).
xc_kb_names(a65b12504cc5a3,[]).
xc_mapping_rows(a65b12504cc5a3,[]).
xc_direction(a65b12504cc5a3,':FORWARD').
xc_monotonicity(a65b12504cc5a3,':DEFAULT').
xc_creator(a65b12504cc5a3,'Cyc').
x_isa(x_Plant,x_BiologicalKingdom) :- x_cid(a65b12504cc5a4).
xc_microtheory(a65b12504cc5a4,x_BiologyMt).
xc_source_file(a65b12504cc5a4,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5a4,1119).
xc_kb_names(a65b12504cc5a4,[]).
xc_mapping_rows(a65b12504cc5a4,[]).
xc_direction(a65b12504cc5a4,':FORWARD').
xc_monotonicity(a65b12504cc5a4,':DEFAULT').
xc_creator(a65b12504cc5a4,'Cyc').
x_comment(x_Amphibian,"The collection of all #$Organism-Wholes which are members of the #$BiologicalClass Amphibia, being a specialization of #$Vertebrate.  \nMembers of this class are smooth skinned #$Vertebrates which hatch from eggs to form aquatic larvae [see #$Larva].  These larvae metamorphose into an air-breathing adult [see AirBreathingVertebrate] (normally) having #$Lungs.  Subsets of this collection include #$Frogs and #$Salamanders.") :- x_cid(a65b12504cc5a5).
xc_microtheory(a65b12504cc5a5,x_BiologyMt).
xc_source_file(a65b12504cc5a5,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5a5,1125).
xc_kb_names(a65b12504cc5a5,[]).
xc_mapping_rows(a65b12504cc5a5,[]).
xc_direction(a65b12504cc5a5,':FORWARD').
xc_monotonicity(a65b12504cc5a5,':DEFAULT').
xc_creator(a65b12504cc5a5,'Cyc').
x_isa(x_BacterialPhysiologicalAttribute,x_BacterialPhysiologicalAttribute) :- x_cid(a65b12504cc5a6).
xc_microtheory(a65b12504cc5a6,x_BiologyMt).
xc_source_file(a65b12504cc5a6,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5a6,1132).
xc_kb_names(a65b12504cc5a6,[]).
xc_mapping_rows(a65b12504cc5a6,[]).
xc_direction(a65b12504cc5a6,':FORWARD').
xc_monotonicity(a65b12504cc5a6,':MONOTONIC').
xc_creator(a65b12504cc5a6,'Cyc').
x_superTaxons('x_Clostridium-Genus','x_Clostridiaceae-Family') :- x_cid(a65b12504cc5a7).
xc_microtheory(a65b12504cc5a7,x_BiologyMt).
xc_source_file(a65b12504cc5a7,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5a7,1138).
xc_kb_names(a65b12504cc5a7,[]).
xc_mapping_rows(a65b12504cc5a7,[]).
xc_direction(a65b12504cc5a7,':FORWARD').
xc_monotonicity(a65b12504cc5a7,':DEFAULT').
xc_creator(a65b12504cc5a7,'Cyc').
x_isa(x_RickettsiaRicketsii,x_OrganismClassificationType) :- x_cid(a65b12504cc5a8).
xc_microtheory(a65b12504cc5a8,x_BiologyMt).
xc_source_file(a65b12504cc5a8,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5a8,1144).
xc_kb_names(a65b12504cc5a8,[]).
xc_mapping_rows(a65b12504cc5a8,[]).
xc_direction(a65b12504cc5a8,':FORWARD').
xc_monotonicity(a65b12504cc5a8,':MONOTONIC').
xc_creator(a65b12504cc5a8,'Cyc').
xc_creation_date(a65b12504cc5a8,101317).
x_genls(x_Bird,x_Vertebrate) :- x_cid(a65b12504cc5a9).
xc_microtheory(a65b12504cc5a9,x_BiologyMt).
xc_source_file(a65b12504cc5a9,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5a9,1150).
xc_kb_names(a65b12504cc5a9,[]).
xc_mapping_rows(a65b12504cc5a9,[]).
xc_direction(a65b12504cc5a9,':FORWARD').
xc_monotonicity(a65b12504cc5a9,':DEFAULT').
x_arg2Isa(x_carriesOrganism,'x_Organism-Whole') :- x_cid(a65b12504cc5aa).
xc_microtheory(a65b12504cc5aa,x_BiologyMt).
xc_source_file(a65b12504cc5aa,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5aa,1156).
xc_kb_names(a65b12504cc5aa,[]).
xc_mapping_rows(a65b12504cc5aa,[]).
xc_direction(a65b12504cc5aa,':FORWARD').
xc_monotonicity(a65b12504cc5aa,':MONOTONIC').
xc_creator(a65b12504cc5aa,'Cyc').
xc_creation_date(a65b12504cc5aa,123939).
x_argGenl(x_contactToxicityFor,2,x_BiologicalLivingObject) :- x_cid(a65b12504cc5ab).
xc_microtheory(a65b12504cc5ab,x_BiologyMt).
xc_source_file(a65b12504cc5ab,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5ab,1162).
xc_kb_names(a65b12504cc5ab,[]).
xc_mapping_rows(a65b12504cc5ab,[]).
xc_direction(a65b12504cc5ab,':FORWARD').
xc_monotonicity(a65b12504cc5ab,':MONOTONIC').
x_implies(x_and(x_unknownFormula(x_isa(V1,x_SymmetricAnatomicalPartType)),x_unknownFormula(x_isa(V1,x_UniqueAnatomicalPartType)),x_infectionLocalizedIn(V2,V3,V1)),x_actorPartsAffected(V3,'x_SKF-58570131'(V3,V2,V1))) :- x_cid(a65b12504cc5ac,V1,V2,V3).
xc_microtheory(a65b12504cc5ac,x_BiologyMt).
xc_source_file(a65b12504cc5ac,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5ac,1168).
xc_kb_names(a65b12504cc5ac,["?PART-TYPE","?ORG","?INFECTION"]).
xc_mapping_rows(a65b12504cc5ac,['implication-implies']).
xc_direction(a65b12504cc5ac,':BACKWARD').
xc_monotonicity(a65b12504cc5ac,':DEFAULT').
xc_creator(a65b12504cc5ac,'Cyc').
xc_creation_date(a65b12504cc5ac,113419).
x_isa('x_BacillusCereus-Species',x_BiologicalSpecies) :- x_cid(a65b12504cc5ad).
xc_microtheory(a65b12504cc5ad,x_BiologyMt).
xc_source_file(a65b12504cc5ad,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5ad,1182).
xc_kb_names(a65b12504cc5ad,[]).
xc_mapping_rows(a65b12504cc5ad,[]).
xc_direction(a65b12504cc5ad,':FORWARD').
xc_monotonicity(a65b12504cc5ad,':MONOTONIC').
xc_creator(a65b12504cc5ad,'Cyc').
x_superTaxons(x_Amphibian,x_Vertebrate) :- x_cid(a65b12504cc5ae).
xc_microtheory(a65b12504cc5ae,x_BiologyMt).
xc_source_file(a65b12504cc5ae,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5ae,1188).
xc_kb_names(a65b12504cc5ae,[]).
xc_mapping_rows(a65b12504cc5ae,[]).
xc_direction(a65b12504cc5ae,':FORWARD').
xc_monotonicity(a65b12504cc5ae,':DEFAULT').
xc_creator(a65b12504cc5ae,'Cyc').
x_genls(x_CoxiellaBurnetti,x_Rickettsia) :- x_cid(a65b12504cc5af).
xc_microtheory(a65b12504cc5af,x_BiologyMt).
xc_source_file(a65b12504cc5af,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5af,1194).
xc_kb_names(a65b12504cc5af,[]).
xc_mapping_rows(a65b12504cc5af,[]).
xc_direction(a65b12504cc5af,':FORWARD').
xc_monotonicity(a65b12504cc5af,':MONOTONIC').
xc_creator(a65b12504cc5af,'Cyc').
xc_creation_date(a65b12504cc5af,101730).
x_genls(x_CoccusBacterium,x_ProkaryoticCell) :- x_cid(a65b12504cc5b0).
xc_microtheory(a65b12504cc5b0,x_BiologyMt).
xc_source_file(a65b12504cc5b0,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5b0,1200).
xc_kb_names(a65b12504cc5b0,[]).
xc_mapping_rows(a65b12504cc5b0,[]).
xc_direction(a65b12504cc5b0,':FORWARD').
xc_monotonicity(a65b12504cc5b0,':DEFAULT').
xc_creator(a65b12504cc5b0,'Cyc').
x_argIsa(x_inhalingToxicityFor,1,x_PartiallyTangible) :- x_cid(a65b12504cc5b1).
xc_microtheory(a65b12504cc5b1,x_BiologyMt).
xc_source_file(a65b12504cc5b1,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5b1,1206).
xc_kb_names(a65b12504cc5b1,[]).
xc_mapping_rows(a65b12504cc5b1,[]).
xc_direction(a65b12504cc5b1,':FORWARD').
xc_monotonicity(a65b12504cc5b1,':MONOTONIC').
x_genls(x_BacteriumTypeByAerobicity,x_OrganismClassificationType) :- x_cid(a65b12504cc5b2).
xc_microtheory(a65b12504cc5b2,x_BiologyMt).
xc_source_file(a65b12504cc5b2,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5b2,1212).
xc_kb_names(a65b12504cc5b2,[]).
xc_mapping_rows(a65b12504cc5b2,[]).
xc_direction(a65b12504cc5b2,':FORWARD').
xc_monotonicity(a65b12504cc5b2,':MONOTONIC').
xc_creator(a65b12504cc5b2,'Cyc').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_CirculatorySystem,1) :- x_cid(a65b12504cc5b3).
xc_microtheory(a65b12504cc5b3,x_BiologyMt).
xc_source_file(a65b12504cc5b3,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5b3,1218).
xc_kb_names(a65b12504cc5b3,[]).
xc_mapping_rows(a65b12504cc5b3,[]).
xc_direction(a65b12504cc5b3,':FORWARD').
xc_monotonicity(a65b12504cc5b3,':DEFAULT').
xc_creator(a65b12504cc5b3,'Cyc').
x_implies(x_and(x_isa(V1,x_AdultAnimal),x_isa(V1,x_Insect)),x_isa('x_SKF-51781280'(V1,6),x_Leg)) :- x_cid(a65b12504cc5b4,V1).
xc_microtheory(a65b12504cc5b4,x_BiologyMt).
xc_source_file(a65b12504cc5b4,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5b4,1224).
xc_kb_names(a65b12504cc5b4,["?INSECT"]).
xc_mapping_rows(a65b12504cc5b4,['implication-implies']).
xc_direction(a65b12504cc5b4,':BACKWARD').
xc_monotonicity(a65b12504cc5b4,':DEFAULT').
xc_creator(a65b12504cc5b4,'Cyc').
x_isa(x_AttemptingFn(x_LoggingInOnAComputer),x_Collection) :- x_cid(a65b12504cc5b5).
xc_microtheory(a65b12504cc5b5,x_BiologyMt).
xc_source_file(a65b12504cc5b5,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5b5,1235).
xc_kb_names(a65b12504cc5b5,[]).
xc_mapping_rows(a65b12504cc5b5,[]).
xc_direction(a65b12504cc5b5,':FORWARD').
xc_monotonicity(a65b12504cc5b5,':DEFAULT').
x_argIsa(x_stuffInExposureEvent,1,x_ExposureToSubstance) :- x_cid(a65b12504cc5b6).
xc_microtheory(a65b12504cc5b6,x_BiologyMt).
xc_source_file(a65b12504cc5b6,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5b6,1242).
xc_kb_names(a65b12504cc5b6,[]).
xc_mapping_rows(a65b12504cc5b6,[]).
xc_direction(a65b12504cc5b6,':FORWARD').
xc_monotonicity(a65b12504cc5b6,':MONOTONIC').
x_isa(x_BacterialSporeFn('x_ClostridiumBotulinum-Species'),x_LifeStageType) :- x_cid(a65b12504cc5b7).
xc_microtheory(a65b12504cc5b7,x_BiologyMt).
xc_source_file(a65b12504cc5b7,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5b7,1248).
xc_kb_names(a65b12504cc5b7,[]).
xc_mapping_rows(a65b12504cc5b7,[]).
xc_direction(a65b12504cc5b7,':FORWARD').
xc_monotonicity(a65b12504cc5b7,':MONOTONIC').
x_isa('x_AnaerobicBacterium-Oxyphobic',x_OrganismClassificationType) :- x_cid(a65b12504cc5b8).
xc_microtheory(a65b12504cc5b8,x_BiologyMt).
xc_source_file(a65b12504cc5b8,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5b8,1255).
xc_kb_names(a65b12504cc5b8,[]).
xc_mapping_rows(a65b12504cc5b8,[]).
xc_direction(a65b12504cc5b8,':FORWARD').
xc_monotonicity(a65b12504cc5b8,':MONOTONIC').
xc_creator(a65b12504cc5b8,'Cyc').
x_isa(x_immuneWithRespectToPathogen,x_BinaryPredicate) :- x_cid(a65b12504cc5b9).
xc_microtheory(a65b12504cc5b9,x_BiologyMt).
xc_source_file(a65b12504cc5b9,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5b9,1261).
xc_kb_names(a65b12504cc5b9,[]).
xc_mapping_rows(a65b12504cc5b9,[]).
xc_direction(a65b12504cc5b9,':FORWARD').
xc_monotonicity(a65b12504cc5b9,':MONOTONIC').
xc_creator(a65b12504cc5b9,'Cyc').
xc_creation_date(a65b12504cc5b9,104745).
x_resultIsa(x_HairMobFn,x_Collection) :- x_cid(a65b12504cc5ba).
xc_microtheory(a65b12504cc5ba,x_BiologyMt).
xc_source_file(a65b12504cc5ba,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5ba,1267).
xc_kb_names(a65b12504cc5ba,[]).
xc_mapping_rows(a65b12504cc5ba,[]).
xc_direction(a65b12504cc5ba,':FORWARD').
xc_monotonicity(a65b12504cc5ba,':MONOTONIC').
xc_creator(a65b12504cc5ba,'Cyc').
xc_creation_date(a65b12504cc5ba,101635).
x_argGenl(x_organismTypeCanLethallyInfect,2,x_BiologicalLivingObject) :- x_cid(a65b12504cc5bb).
xc_microtheory(a65b12504cc5bb,x_BiologyMt).
xc_source_file(a65b12504cc5bb,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5bb,1273).
xc_kb_names(a65b12504cc5bb,[]).
xc_mapping_rows(a65b12504cc5bb,[]).
xc_direction(a65b12504cc5bb,':FORWARD').
xc_monotonicity(a65b12504cc5bb,':MONOTONIC').
x_comment(x_SpirillaBacterium,"A specialization of #$Bacterium whose instances are characterized by having spiral or corkscrew shape.") :- x_cid(a65b12504cc5bc).
xc_microtheory(a65b12504cc5bc,x_BiologyMt).
xc_source_file(a65b12504cc5bc,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5bc,1279).
xc_kb_names(a65b12504cc5bc,[]).
xc_mapping_rows(a65b12504cc5bc,[]).
xc_direction(a65b12504cc5bc,':FORWARD').
xc_monotonicity(a65b12504cc5bc,':MONOTONIC').
xc_creator(a65b12504cc5bc,'Cyc').
xc_creation_date(a65b12504cc5bc,172336).
x_genls(x_NaturalKillerCell,x_Cell) :- x_cid(a65b12504cc5bd).
xc_microtheory(a65b12504cc5bd,x_BiologyMt).
xc_source_file(a65b12504cc5bd,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5bd,1285).
xc_kb_names(a65b12504cc5bd,[]).
xc_mapping_rows(a65b12504cc5bd,[]).
xc_direction(a65b12504cc5bd,':FORWARD').
xc_monotonicity(a65b12504cc5bd,':DEFAULT').
xc_creator(a65b12504cc5bd,'Cyc').
x_argIsa(x_ingestingToxicityFor,3,x_ScalarInterval) :- x_cid(a65b12504cc5be).
xc_microtheory(a65b12504cc5be,x_BiologyMt).
xc_source_file(a65b12504cc5be,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5be,1291).
xc_kb_names(a65b12504cc5be,[]).
xc_mapping_rows(a65b12504cc5be,[]).
xc_direction(a65b12504cc5be,':FORWARD').
xc_monotonicity(a65b12504cc5be,':DEFAULT').
x_partitionedInto('x_Organism-Whole',x_BiologicalClass) :- x_cid(a65b12504cc5bf).
xc_microtheory(a65b12504cc5bf,x_BiologyMt).
xc_source_file(a65b12504cc5bf,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5bf,1297).
xc_kb_names(a65b12504cc5bf,[]).
xc_mapping_rows(a65b12504cc5bf,[]).
xc_direction(a65b12504cc5bf,':FORWARD').
xc_monotonicity(a65b12504cc5bf,':MONOTONIC').
xc_creator(a65b12504cc5bf,'Cyc').
x_argIsa(x_infectionLocalizedIn,3,x_AnimalBodyPartType) :- x_cid(a65b12504cc5c0).
xc_microtheory(a65b12504cc5c0,x_BiologyMt).
xc_source_file(a65b12504cc5c0,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5c0,1303).
xc_kb_names(a65b12504cc5c0,[]).
xc_mapping_rows(a65b12504cc5c0,[]).
xc_direction(a65b12504cc5c0,':FORWARD').
xc_monotonicity(a65b12504cc5c0,':MONOTONIC').
x_isa(x_MobFn(x_Person),x_ExistingStuffType) :- x_cid(a65b12504cc5c1).
xc_microtheory(a65b12504cc5c1,x_BiologyMt).
xc_source_file(a65b12504cc5c1,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5c1,1309).
xc_kb_names(a65b12504cc5c1,[]).
xc_mapping_rows(a65b12504cc5c1,[]).
xc_direction(a65b12504cc5c1,':FORWARD').
xc_monotonicity(a65b12504cc5c1,':DEFAULT').
xc_creator(a65b12504cc5c1,'Cyc').
x_isa(x_BacterialPhysiologicalAttribute,x_AttributeType) :- x_cid(a65b12504cc5c2).
xc_microtheory(a65b12504cc5c2,x_BiologyMt).
xc_source_file(a65b12504cc5c2,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5c2,1316).
xc_kb_names(a65b12504cc5c2,[]).
xc_mapping_rows(a65b12504cc5c2,[]).
xc_direction(a65b12504cc5c2,':FORWARD').
xc_monotonicity(a65b12504cc5c2,':MONOTONIC').
xc_creator(a65b12504cc5c2,'Cyc').
x_isa('x_Clostridium-Genus',x_BiologicalGenus) :- x_cid(a65b12504cc5c3).
xc_microtheory(a65b12504cc5c3,x_BiologyMt).
xc_source_file(a65b12504cc5c3,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5c3,1322).
xc_kb_names(a65b12504cc5c3,[]).
xc_mapping_rows(a65b12504cc5c3,[]).
xc_direction(a65b12504cc5c3,':FORWARD').
xc_monotonicity(a65b12504cc5c3,':MONOTONIC').
xc_creator(a65b12504cc5c3,'Cyc').
x_genls(x_Fish,x_Vertebrate) :- x_cid(a65b12504cc5c4).
xc_microtheory(a65b12504cc5c4,x_BiologyMt).
xc_source_file(a65b12504cc5c4,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5c4,1328).
xc_kb_names(a65b12504cc5c4,[]).
xc_mapping_rows(a65b12504cc5c4,[]).
xc_direction(a65b12504cc5c4,':FORWARD').
xc_monotonicity(a65b12504cc5c4,':DEFAULT').
x_argIsa(x_carriesOrganism,1,x_PartiallyTangible) :- x_cid(a65b12504cc5c5).
xc_microtheory(a65b12504cc5c5,x_BiologyMt).
xc_source_file(a65b12504cc5c5,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5c5,1334).
xc_kb_names(a65b12504cc5c5,[]).
xc_mapping_rows(a65b12504cc5c5,[]).
xc_direction(a65b12504cc5c5,':FORWARD').
xc_monotonicity(a65b12504cc5c5,':MONOTONIC').
x_arg2Genl(x_contactToxicityFor,x_BiologicalLivingObject) :- x_cid(a65b12504cc5c6).
xc_microtheory(a65b12504cc5c6,x_BiologyMt).
xc_source_file(a65b12504cc5c6,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5c6,1340).
xc_kb_names(a65b12504cc5c6,[]).
xc_mapping_rows(a65b12504cc5c6,[]).
xc_direction(a65b12504cc5c6,':FORWARD').
xc_monotonicity(a65b12504cc5c6,':MONOTONIC').
xc_creator(a65b12504cc5c6,'Cyc').
xc_creation_date(a65b12504cc5c6,184610).
x_implies(x_and(x_unknownFormula(x_isa(V1,x_SymmetricAnatomicalPartType)),x_unknownFormula(x_isa(V1,x_UniqueAnatomicalPartType)),x_infectionLocalizedIn(V2,V3,V1)),x_isa('x_SKF-58570131'(V3,V2,V1),x_BodyPartCollectionFn(V2,V1))) :- x_cid(a65b12504cc5c7,V1,V2,V3).
xc_microtheory(a65b12504cc5c7,x_BiologyMt).
xc_source_file(a65b12504cc5c7,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5c7,1346).
xc_kb_names(a65b12504cc5c7,["?PART-TYPE","?ORG","?INFECTION"]).
xc_mapping_rows(a65b12504cc5c7,['implication-implies']).
xc_direction(a65b12504cc5c7,':BACKWARD').
xc_monotonicity(a65b12504cc5c7,':DEFAULT').
xc_creator(a65b12504cc5c7,'Cyc').
xc_creation_date(a65b12504cc5c7,113419).
x_comment('x_Safeguard-Situation',"This is the collection of situations which constitute the safeguarding of\nsomething. Some of these are purposeful actions (#$ProtectingSomething); others are events\nwhich are not purposeful actions (a security program running); still others are\nmore-or-less static situations (a lock's being in a door). While not all instances\nof #$Safeguard-Situation are purposeful actions, all are a result of such. Note that the term `safeguard' may also\nbe used to denote artifacts such as locks and computer programs, even when they are not being used to safeguard. These things\nare instances of #$Safeguard-Artifact. (#$SteveSchulz 4/11/2000)") :- x_cid(a65b12504cc5c8).
xc_microtheory(a65b12504cc5c8,x_BiologyMt).
xc_source_file(a65b12504cc5c8,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5c8,1361).
xc_kb_names(a65b12504cc5c8,[]).
xc_mapping_rows(a65b12504cc5c8,[]).
xc_direction(a65b12504cc5c8,':FORWARD').
xc_monotonicity(a65b12504cc5c8,':DEFAULT').
xc_creator(a65b12504cc5c8,'Cyc').
xc_creation_date(a65b12504cc5c8,153032).
x_isa(x_CoxiellaBurnetti,x_OrganismClassificationType) :- x_cid(a65b12504cc5c9).
xc_microtheory(a65b12504cc5c9,x_BiologyMt).
xc_source_file(a65b12504cc5c9,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5c9,1373).
xc_kb_names(a65b12504cc5c9,[]).
xc_mapping_rows(a65b12504cc5c9,[]).
xc_direction(a65b12504cc5c9,':FORWARD').
xc_monotonicity(a65b12504cc5c9,':MONOTONIC').
xc_creator(a65b12504cc5c9,'Cyc').
xc_creation_date(a65b12504cc5c9,101730).
x_genls(x_CoccusBacterium,x_MoneraKingdom) :- x_cid(a65b12504cc5ca).
xc_microtheory(a65b12504cc5ca,x_BiologyMt).
xc_source_file(a65b12504cc5ca,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5ca,1379).
xc_kb_names(a65b12504cc5ca,[]).
xc_mapping_rows(a65b12504cc5ca,[]).
xc_direction(a65b12504cc5ca,':FORWARD').
xc_monotonicity(a65b12504cc5ca,':DEFAULT').
xc_creator(a65b12504cc5ca,'Cyc').
x_implies(x_isa(V1,x_UniqueAnatomicalPartType),x_relationAllExistsMax(x_anatomicalParts,'x_Organism-Whole',V1,1)) :- x_cid(a65b12504cc5cb,V1).
xc_microtheory(a65b12504cc5cb,x_BiologyMt).
xc_source_file(a65b12504cc5cb,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5cb,1385).
xc_kb_names(a65b12504cc5cb,["?PARTTYPE"]).
xc_mapping_rows(a65b12504cc5cb,['implication-implies']).
xc_direction(a65b12504cc5cb,':FORWARD').
xc_monotonicity(a65b12504cc5cb,':DEFAULT').
xc_creator(a65b12504cc5cb,'Cyc').
x_transitiveViaArgInverse(x_organismTypeCanLethallyInfect,x_genls,2) :- x_cid(a65b12504cc5cc).
xc_microtheory(a65b12504cc5cc,x_BiologyMt).
xc_source_file(a65b12504cc5cc,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5cc,1393).
xc_kb_names(a65b12504cc5cc,[]).
xc_mapping_rows(a65b12504cc5cc,[]).
xc_direction(a65b12504cc5cc,':FORWARD').
xc_monotonicity(a65b12504cc5cc,':MONOTONIC').
xc_creator(a65b12504cc5cc,'Cyc').
x_arg1Isa(x_inhalingToxicityFor,x_PartiallyTangible) :- x_cid(a65b12504cc5cd).
xc_microtheory(a65b12504cc5cd,x_BiologyMt).
xc_source_file(a65b12504cc5cd,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5cd,1399).
xc_kb_names(a65b12504cc5cd,[]).
xc_mapping_rows(a65b12504cc5cd,[]).
xc_direction(a65b12504cc5cd,':FORWARD').
xc_monotonicity(a65b12504cc5cd,':MONOTONIC').
xc_creator(a65b12504cc5cd,'Cyc').
xc_creation_date(a65b12504cc5cd,184610).
x_relationAllExists(x_stuffInExposureEvent,x_ExposureToSubstance,x_PartiallyTangible) :- x_cid(a65b12504cc5ce).
xc_microtheory(a65b12504cc5ce,x_BiologyMt).
xc_source_file(a65b12504cc5ce,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5ce,1405).
xc_kb_names(a65b12504cc5ce,[]).
xc_mapping_rows(a65b12504cc5ce,[]).
xc_direction(a65b12504cc5ce,':FORWARD').
xc_monotonicity(a65b12504cc5ce,':DEFAULT').
x_isa(x_AttemptingFn(x_Learning),x_Collection) :- x_cid(a65b12504cc5cf).
xc_microtheory(a65b12504cc5cf,x_BiologyMt).
xc_source_file(a65b12504cc5cf,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5cf,1411).
xc_kb_names(a65b12504cc5cf,[]).
xc_mapping_rows(a65b12504cc5cf,[]).
xc_direction(a65b12504cc5cf,':FORWARD').
xc_monotonicity(a65b12504cc5cf,':DEFAULT').
x_arg1Isa(x_stuffInExposureEvent,x_ExposureToSubstance) :- x_cid(a65b12504cc5d0).
xc_microtheory(a65b12504cc5d0,x_BiologyMt).
xc_source_file(a65b12504cc5d0,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5d0,1418).
xc_kb_names(a65b12504cc5d0,[]).
xc_mapping_rows(a65b12504cc5d0,[]).
xc_direction(a65b12504cc5d0,':FORWARD').
xc_monotonicity(a65b12504cc5d0,':MONOTONIC').
xc_creator(a65b12504cc5d0,'Cyc').
xc_creation_date(a65b12504cc5d0,94229).
x_argIsa(x_exposureToType,1,x_ExposureToSubstance) :- x_cid(a65b12504cc5d1).
xc_microtheory(a65b12504cc5d1,x_BiologyMt).
xc_source_file(a65b12504cc5d1,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5d1,1424).
xc_kb_names(a65b12504cc5d1,[]).
xc_mapping_rows(a65b12504cc5d1,[]).
xc_direction(a65b12504cc5d1,':FORWARD').
xc_monotonicity(a65b12504cc5d1,':MONOTONIC').
x_isa(x_BacterialSporeFn('x_ClostridiumBotulinum-Species'),x_ExistingObjectType) :- x_cid(a65b12504cc5d2).
xc_microtheory(a65b12504cc5d2,x_BiologyMt).
xc_source_file(a65b12504cc5d2,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5d2,1430).
xc_kb_names(a65b12504cc5d2,[]).
xc_mapping_rows(a65b12504cc5d2,[]).
xc_direction(a65b12504cc5d2,':FORWARD').
xc_monotonicity(a65b12504cc5d2,':MONOTONIC').
x_keStrongSuggestionPreds(x_EndosporingEvent,x_eventOccursAt) :- x_cid(a65b12504cc5d3).
xc_microtheory(a65b12504cc5d3,x_BiologyMt).
xc_source_file(a65b12504cc5d3,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5d3,1437).
xc_kb_names(a65b12504cc5d3,[]).
xc_mapping_rows(a65b12504cc5d3,[]).
xc_direction(a65b12504cc5d3,':FORWARD').
xc_monotonicity(a65b12504cc5d3,':DEFAULT').
xc_creator(a65b12504cc5d3,'Cyc').
x_argGenl(x_HairMobFn,1,x_Mammal) :- x_cid(a65b12504cc5d4).
xc_microtheory(a65b12504cc5d4,x_BiologyMt).
xc_source_file(a65b12504cc5d4,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5d4,1443).
xc_kb_names(a65b12504cc5d4,[]).
xc_mapping_rows(a65b12504cc5d4,[]).
xc_direction(a65b12504cc5d4,':FORWARD').
xc_monotonicity(a65b12504cc5d4,':MONOTONIC').
x_arg2Genl(x_organismTypeCanLethallyInfect,x_BiologicalLivingObject) :- x_cid(a65b12504cc5d5).
xc_microtheory(a65b12504cc5d5,x_BiologyMt).
xc_source_file(a65b12504cc5d5,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5d5,1449).
xc_kb_names(a65b12504cc5d5,[]).
xc_mapping_rows(a65b12504cc5d5,[]).
xc_direction(a65b12504cc5d5,':FORWARD').
xc_monotonicity(a65b12504cc5d5,':MONOTONIC').
xc_creator(a65b12504cc5d5,'Cyc').
xc_creation_date(a65b12504cc5d5,150535).
x_cyclistNotes(x_SpirillaBacterium,"Strictly speaking, this morphological characterization applies only to instances of Eubacteria.  Appropriate adjustments will be made as our taxonomy grows in sophistication.") :- x_cid(a65b12504cc5d6).
xc_microtheory(a65b12504cc5d6,x_BiologyMt).
xc_source_file(a65b12504cc5d6,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5d6,1455).
xc_kb_names(a65b12504cc5d6,[]).
xc_mapping_rows(a65b12504cc5d6,[]).
xc_direction(a65b12504cc5d6,':FORWARD').
xc_monotonicity(a65b12504cc5d6,':MONOTONIC').
xc_creator(a65b12504cc5d6,'Cyc').
xc_creation_date(a65b12504cc5d6,172724).
x_arity(x_carriesOrganismType,2) :- x_cid(a65b12504cc5d7).
xc_microtheory(a65b12504cc5d7,x_BiologyMt).
xc_source_file(a65b12504cc5d7,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5d7,1461).
xc_kb_names(a65b12504cc5d7,[]).
xc_mapping_rows(a65b12504cc5d7,[]).
xc_direction(a65b12504cc5d7,':FORWARD').
xc_monotonicity(a65b12504cc5d7,':DEFAULT').
x_isa(x_ImmuneResponse,x_SituationType) :- x_cid(a65b12504cc5d8).
xc_microtheory(a65b12504cc5d8,x_BiologyMt).
xc_source_file(a65b12504cc5d8,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5d8,1467).
xc_kb_names(a65b12504cc5d8,[]).
xc_mapping_rows(a65b12504cc5d8,[]).
xc_direction(a65b12504cc5d8,':FORWARD').
xc_monotonicity(a65b12504cc5d8,':DEFAULT').
xc_creator(a65b12504cc5d8,'Cyc').
x_arg3Isa(x_ingestingToxicityFor,x_ScalarInterval) :- x_cid(a65b12504cc5d9).
xc_microtheory(a65b12504cc5d9,x_BiologyMt).
xc_source_file(a65b12504cc5d9,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5d9,1473).
xc_kb_names(a65b12504cc5d9,[]).
xc_mapping_rows(a65b12504cc5d9,[]).
xc_direction(a65b12504cc5d9,':FORWARD').
xc_monotonicity(a65b12504cc5d9,':DEFAULT').
xc_creator(a65b12504cc5d9,'Cyc').
x_arg3Isa(x_infectionLocalizedIn,x_AnimalBodyPartType) :- x_cid(a65b12504cc5da).
xc_microtheory(a65b12504cc5da,x_BiologyMt).
xc_source_file(a65b12504cc5da,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5da,1479).
xc_kb_names(a65b12504cc5da,[]).
xc_mapping_rows(a65b12504cc5da,[]).
xc_direction(a65b12504cc5da,':FORWARD').
xc_monotonicity(a65b12504cc5da,':MONOTONIC').
xc_creator(a65b12504cc5da,'Cyc').
xc_creation_date(a65b12504cc5da,113419).
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Stomach,1) :- x_cid(a65b12504cc5db).
xc_microtheory(a65b12504cc5db,x_BiologyMt).
xc_source_file(a65b12504cc5db,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5db,1485).
xc_kb_names(a65b12504cc5db,[]).
xc_mapping_rows(a65b12504cc5db,[]).
xc_direction(a65b12504cc5db,':FORWARD').
xc_monotonicity(a65b12504cc5db,':DEFAULT').
xc_creator(a65b12504cc5db,'Cyc').
x_isa(x_MobFn(x_Antibody),x_ExistingStuffType) :- x_cid(a65b12504cc5dc).
xc_microtheory(a65b12504cc5dc,x_BiologyMt).
xc_source_file(a65b12504cc5dc,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5dc,1491).
xc_kb_names(a65b12504cc5dc,[]).
xc_mapping_rows(a65b12504cc5dc,[]).
xc_direction(a65b12504cc5dc,':FORWARD').
xc_monotonicity(a65b12504cc5dc,':DEFAULT').
x_relationAllExistsMax(x_anatomicalParts,'x_Organism-Whole',x_FaceOfAnimal,1) :- x_cid(a65b12504cc5dd).
xc_microtheory(a65b12504cc5dd,x_BiologyMt).
xc_source_file(a65b12504cc5dd,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5dd,1498).
xc_kb_names(a65b12504cc5dd,[]).
xc_mapping_rows(a65b12504cc5dd,[]).
xc_direction(a65b12504cc5dd,':FORWARD').
xc_monotonicity(a65b12504cc5dd,':DEFAULT').
x_not(x_and(x_isa(V1,x_UniqueAnatomicalPartType),x_isa(V2,V1),x_different(V2,V3),x_isa(V3,V1),x_anatomicalParts(V4,V2),x_anatomicalParts(V4,V3))) :- x_cid(a65b12504cc5de,V1,V2,V3,V4).
xc_microtheory(a65b12504cc5de,x_BiologyMt).
xc_source_file(a65b12504cc5de,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5de,1504).
xc_kb_names(a65b12504cc5de,["?PARTTYPE","?PART1","?PART2","?ORG"]).
xc_mapping_rows(a65b12504cc5de,[]).
xc_direction(a65b12504cc5de,':BACKWARD').
xc_monotonicity(a65b12504cc5de,':DEFAULT').
xc_creator(a65b12504cc5de,'Cyc').
x_arg1Isa(x_carriesOrganism,x_PartiallyTangible) :- x_cid(a65b12504cc5df).
xc_microtheory(a65b12504cc5df,x_BiologyMt).
xc_source_file(a65b12504cc5df,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5df,1517).
xc_kb_names(a65b12504cc5df,[]).
xc_mapping_rows(a65b12504cc5df,[]).
xc_direction(a65b12504cc5df,':FORWARD').
xc_monotonicity(a65b12504cc5df,':MONOTONIC').
xc_creator(a65b12504cc5df,'Cyc').
xc_creation_date(a65b12504cc5df,123939).
x_argIsa(x_contactToxicityFor,2,x_OrganismClassificationType) :- x_cid(a65b12504cc5e0).
xc_microtheory(a65b12504cc5e0,x_BiologyMt).
xc_source_file(a65b12504cc5e0,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5e0,1523).
xc_kb_names(a65b12504cc5e0,[]).
xc_mapping_rows(a65b12504cc5e0,[]).
xc_direction(a65b12504cc5e0,':FORWARD').
xc_monotonicity(a65b12504cc5e0,':MONOTONIC').
x_isa(x_Nose,x_UniqueAnatomicalPartType) :- x_cid(a65b12504cc5e1).
xc_microtheory(a65b12504cc5e1,x_BiologyMt).
xc_source_file(a65b12504cc5e1,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5e1,1529).
xc_kb_names(a65b12504cc5e1,[]).
xc_mapping_rows(a65b12504cc5e1,[]).
xc_direction(a65b12504cc5e1,':FORWARD').
xc_monotonicity(a65b12504cc5e1,':DEFAULT').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole','x_Head-AnimalBodyPart',1) :- x_cid(a65b12504cc5e2).
xc_microtheory(a65b12504cc5e2,x_BiologyMt).
xc_source_file(a65b12504cc5e2,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5e2,1535).
xc_kb_names(a65b12504cc5e2,[]).
xc_mapping_rows(a65b12504cc5e2,[]).
xc_direction(a65b12504cc5e2,':FORWARD').
xc_monotonicity(a65b12504cc5e2,':DEFAULT').
xc_creator(a65b12504cc5e2,'Cyc').
x_arity(x_inhalingToxicityFor,3) :- x_cid(a65b12504cc5e3).
xc_microtheory(a65b12504cc5e3,x_BiologyMt).
xc_source_file(a65b12504cc5e3,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5e3,1541).
xc_kb_names(a65b12504cc5e3,[]).
xc_mapping_rows(a65b12504cc5e3,[]).
xc_direction(a65b12504cc5e3,':FORWARD').
xc_monotonicity(a65b12504cc5e3,':DEFAULT').
x_isa(x_BacteriumTypeByAerobicity,x_CollectionType) :- x_cid(a65b12504cc5e4).
xc_microtheory(a65b12504cc5e4,x_BiologyMt).
xc_source_file(a65b12504cc5e4,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5e4,1547).
xc_kb_names(a65b12504cc5e4,[]).
xc_mapping_rows(a65b12504cc5e4,[]).
xc_direction(a65b12504cc5e4,':FORWARD').
xc_monotonicity(a65b12504cc5e4,':DEFAULT').
xc_creator(a65b12504cc5e4,'Cyc').
x_requiredArg1Pred(x_ExposureToSubstance,x_stuffInExposureEvent) :- x_cid(a65b12504cc5e5).
xc_microtheory(a65b12504cc5e5,x_BiologyMt).
xc_source_file(a65b12504cc5e5,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5e5,1553).
xc_kb_names(a65b12504cc5e5,[]).
xc_mapping_rows(a65b12504cc5e5,[]).
xc_direction(a65b12504cc5e5,':FORWARD').
xc_monotonicity(a65b12504cc5e5,':DEFAULT').
xc_creator(a65b12504cc5e5,'Cyc').
xc_creation_date(a65b12504cc5e5,105848).
x_arg1Isa(x_exposureToType,x_ExposureToSubstance) :- x_cid(a65b12504cc5e6).
xc_microtheory(a65b12504cc5e6,x_BiologyMt).
xc_source_file(a65b12504cc5e6,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5e6,1559).
xc_kb_names(a65b12504cc5e6,[]).
xc_mapping_rows(a65b12504cc5e6,[]).
xc_direction(a65b12504cc5e6,':FORWARD').
xc_monotonicity(a65b12504cc5e6,':MONOTONIC').
xc_creator(a65b12504cc5e6,'Cyc').
xc_creation_date(a65b12504cc5e6,163147).
x_isa(x_VegetativeCell,x_OrganismClassificationType) :- x_cid(a65b12504cc5e7).
xc_microtheory(a65b12504cc5e7,x_BiologyMt).
xc_source_file(a65b12504cc5e7,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5e7,1565).
xc_kb_names(a65b12504cc5e7,[]).
xc_mapping_rows(a65b12504cc5e7,[]).
xc_direction(a65b12504cc5e7,':FORWARD').
xc_monotonicity(a65b12504cc5e7,':MONOTONIC').
xc_creator(a65b12504cc5e7,'Cyc').
xc_creation_date(a65b12504cc5e7,101256).
x_genls(x_BacterialSporeFn('x_ClostridiumBotulinum-Species'),'x_ClostridiumBotulinum-Species') :- x_cid(a65b12504cc5e8).
xc_microtheory(a65b12504cc5e8,x_BiologyMt).
xc_source_file(a65b12504cc5e8,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5e8,1571).
xc_kb_names(a65b12504cc5e8,[]).
xc_mapping_rows(a65b12504cc5e8,[]).
xc_direction(a65b12504cc5e8,':FORWARD').
xc_monotonicity(a65b12504cc5e8,':MONOTONIC').
x_isa(x_Primate,x_BiologicalOrder) :- x_cid(a65b12504cc5e9).
xc_microtheory(a65b12504cc5e9,x_BiologyMt).
xc_source_file(a65b12504cc5e9,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5e9,1578).
xc_kb_names(a65b12504cc5e9,[]).
xc_mapping_rows(a65b12504cc5e9,[]).
xc_direction(a65b12504cc5e9,':FORWARD').
xc_monotonicity(a65b12504cc5e9,':DEFAULT').
xc_creator(a65b12504cc5e9,'Cyc').
x_arg1Genl(x_HairMobFn,x_Mammal) :- x_cid(a65b12504cc5ea).
xc_microtheory(a65b12504cc5ea,x_BiologyMt).
xc_source_file(a65b12504cc5ea,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5ea,1584).
xc_kb_names(a65b12504cc5ea,[]).
xc_mapping_rows(a65b12504cc5ea,[]).
xc_direction(a65b12504cc5ea,':FORWARD').
xc_monotonicity(a65b12504cc5ea,':MONOTONIC').
xc_creator(a65b12504cc5ea,'Cyc').
xc_creation_date(a65b12504cc5ea,101635).
x_arg1Isa(x_InstantiationInstanceFn(x_exposureToType,x_TheSet(2)),x_ExposureToSubstance) :- x_cid(a65b12504cc5eb).
xc_microtheory(a65b12504cc5eb,x_BiologyMt).
xc_source_file(a65b12504cc5eb,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5eb,1590).
xc_kb_names(a65b12504cc5eb,[]).
xc_mapping_rows(a65b12504cc5eb,[]).
xc_direction(a65b12504cc5eb,':FORWARD').
xc_monotonicity(a65b12504cc5eb,':DEFAULT').
x_argIsa(x_organismTypeCanLethallyInfect,2,x_OrganismClassificationType) :- x_cid(a65b12504cc5ec).
xc_microtheory(a65b12504cc5ec,x_BiologyMt).
xc_source_file(a65b12504cc5ec,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5ec,1598).
xc_kb_names(a65b12504cc5ec,[]).
xc_mapping_rows(a65b12504cc5ec,[]).
xc_direction(a65b12504cc5ec,':FORWARD').
xc_monotonicity(a65b12504cc5ec,':MONOTONIC').
x_isa(x_carriesOrganismType,x_BinaryPredicate) :- x_cid(a65b12504cc5ed).
xc_microtheory(a65b12504cc5ed,x_BiologyMt).
xc_source_file(a65b12504cc5ed,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5ed,1604).
xc_kb_names(a65b12504cc5ed,[]).
xc_mapping_rows(a65b12504cc5ed,[]).
xc_direction(a65b12504cc5ed,':FORWARD').
xc_monotonicity(a65b12504cc5ed,':MONOTONIC').
xc_creator(a65b12504cc5ed,'Cyc').
x_comment(x_BrucellaBacterium,"A #$Collection.  Each instance is a portion of the #$Bacterium Brucella, which is responsible for the disease #$Brucellosis.") :- x_cid(a65b12504cc5ee).
xc_microtheory(a65b12504cc5ee,x_BiologyMt).
xc_source_file(a65b12504cc5ee,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5ee,1610).
xc_kb_names(a65b12504cc5ee,[]).
xc_mapping_rows(a65b12504cc5ee,[]).
xc_direction(a65b12504cc5ee,':FORWARD').
xc_monotonicity(a65b12504cc5ee,':DEFAULT').
xc_creator(a65b12504cc5ee,'Cyc').
x_isa(x_HumoralImmuneResponse,x_SituationType) :- x_cid(a65b12504cc5ef).
xc_microtheory(a65b12504cc5ef,x_BiologyMt).
xc_source_file(a65b12504cc5ef,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5ef,1616).
xc_kb_names(a65b12504cc5ef,[]).
xc_mapping_rows(a65b12504cc5ef,[]).
xc_direction(a65b12504cc5ef,':FORWARD').
xc_monotonicity(a65b12504cc5ef,':DEFAULT').
xc_creator(a65b12504cc5ef,'Cyc').
x_genls(x_CanineAnimal,x_TerrestrialOrganism) :- x_cid(a65b12504cc5f0).
xc_microtheory(a65b12504cc5f0,x_BiologyMt).
xc_source_file(a65b12504cc5f0,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5f0,1622).
xc_kb_names(a65b12504cc5f0,[]).
xc_mapping_rows(a65b12504cc5f0,[]).
xc_direction(a65b12504cc5f0,':FORWARD').
xc_monotonicity(a65b12504cc5f0,':MONOTONIC').
xc_creator(a65b12504cc5f0,'Cyc').
x_argIsa(x_contactToxicityFor,3,x_ScalarInterval) :- x_cid(a65b12504cc5f1).
xc_microtheory(a65b12504cc5f1,x_BiologyMt).
xc_source_file(a65b12504cc5f1,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5f1,1628).
xc_kb_names(a65b12504cc5f1,[]).
xc_mapping_rows(a65b12504cc5f1,[]).
xc_direction(a65b12504cc5f1,':FORWARD').
xc_monotonicity(a65b12504cc5f1,':DEFAULT').
x_comment(x_Inhaling,"The collection of all body movement events in which an animal takes air in through an appropriate portal (#$Mouth, #$Nose) and passes it into its #$Lungs.  The elements of #$Breathing all have #$subEvents which are #$Inhalings.") :- x_cid(a65b12504cc5f2).
xc_microtheory(a65b12504cc5f2,x_BiologyMt).
xc_source_file(a65b12504cc5f2,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5f2,1634).
xc_kb_names(a65b12504cc5f2,[]).
xc_mapping_rows(a65b12504cc5f2,[]).
xc_direction(a65b12504cc5f2,':FORWARD').
xc_monotonicity(a65b12504cc5f2,':DEFAULT').
xc_creator(a65b12504cc5f2,'Cyc').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Nose,1) :- x_cid(a65b12504cc5f3).
xc_microtheory(a65b12504cc5f3,x_BiologyMt).
xc_source_file(a65b12504cc5f3,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5f3,1640).
xc_kb_names(a65b12504cc5f3,[]).
xc_mapping_rows(a65b12504cc5f3,[]).
xc_direction(a65b12504cc5f3,':FORWARD').
xc_monotonicity(a65b12504cc5f3,':DEFAULT').
xc_creator(a65b12504cc5f3,'Cyc').
x_comment(x_ReturnToVegetativeState,"A subset of #$BiologicalDevelopmentEvent. In each instance of\n#$ReturnToVegetativeState, an instance of #$Endospore returns to its\n#$VegetativeCell state.") :- x_cid(a65b12504cc5f4).
xc_microtheory(a65b12504cc5f4,x_BiologyMt).
xc_source_file(a65b12504cc5f4,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5f4,1646).
xc_kb_names(a65b12504cc5f4,[]).
xc_mapping_rows(a65b12504cc5f4,[]).
xc_direction(a65b12504cc5f4,':FORWARD').
xc_monotonicity(a65b12504cc5f4,':DEFAULT').
xc_creator(a65b12504cc5f4,'Cyc').
xc_creation_date(a65b12504cc5f4,152123).
x_argIsa(x_infectionLocalizedIn,2,x_Infection) :- x_cid(a65b12504cc5f5).
xc_microtheory(a65b12504cc5f5,x_BiologyMt).
xc_source_file(a65b12504cc5f5,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5f5,1654).
xc_kb_names(a65b12504cc5f5,[]).
xc_mapping_rows(a65b12504cc5f5,[]).
xc_direction(a65b12504cc5f5,':FORWARD').
xc_monotonicity(a65b12504cc5f5,':MONOTONIC').
x_genls(x_MobFn(x_Antibody),x_Mob) :- x_cid(a65b12504cc5f6).
xc_microtheory(a65b12504cc5f6,x_BiologyMt).
xc_source_file(a65b12504cc5f6,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5f6,1660).
xc_kb_names(a65b12504cc5f6,[]).
xc_mapping_rows(a65b12504cc5f6,[]).
xc_direction(a65b12504cc5f6,':FORWARD').
xc_monotonicity(a65b12504cc5f6,':MONOTONIC').
x_partitionedInto('x_Organism-Whole',x_BiologicalOrder) :- x_cid(a65b12504cc5f7).
xc_microtheory(a65b12504cc5f7,x_BiologyMt).
xc_source_file(a65b12504cc5f7,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5f7,1667).
xc_kb_names(a65b12504cc5f7,[]).
xc_mapping_rows(a65b12504cc5f7,[]).
xc_direction(a65b12504cc5f7,':FORWARD').
xc_monotonicity(a65b12504cc5f7,':MONOTONIC').
xc_creator(a65b12504cc5f7,'Cyc').
x_arg2Isa(x_contactToxicityFor,x_OrganismClassificationType) :- x_cid(a65b12504cc5f8).
xc_microtheory(a65b12504cc5f8,x_BiologyMt).
xc_source_file(a65b12504cc5f8,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5f8,1673).
xc_kb_names(a65b12504cc5f8,[]).
xc_mapping_rows(a65b12504cc5f8,[]).
xc_direction(a65b12504cc5f8,':FORWARD').
xc_monotonicity(a65b12504cc5f8,':MONOTONIC').
xc_creator(a65b12504cc5f8,'Cyc').
xc_creation_date(a65b12504cc5f8,184610).
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole','x_Joint-AnimalBodyPart',1) :- x_cid(a65b12504cc5f9).
xc_microtheory(a65b12504cc5f9,x_BiologyMt).
xc_source_file(a65b12504cc5f9,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5f9,1679).
xc_kb_names(a65b12504cc5f9,[]).
xc_mapping_rows(a65b12504cc5f9,[]).
xc_direction(a65b12504cc5f9,':FORWARD').
xc_monotonicity(a65b12504cc5f9,':DEFAULT').
xc_creator(a65b12504cc5f9,'Cyc').
x_genls(x_AntibodyIgA,x_Antibody) :- x_cid(a65b12504cc5fa).
xc_microtheory(a65b12504cc5fa,x_BiologyMt).
xc_source_file(a65b12504cc5fa,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5fa,1685).
xc_kb_names(a65b12504cc5fa,[]).
xc_mapping_rows(a65b12504cc5fa,[]).
xc_direction(a65b12504cc5fa,':FORWARD').
xc_monotonicity(a65b12504cc5fa,':MONOTONIC').
xc_creator(a65b12504cc5fa,'Cyc').
x_genls('x_Safeguard-Situation','x_Situation-Temporal') :- x_cid(a65b12504cc5fb).
xc_microtheory(a65b12504cc5fb,x_BiologyMt).
xc_source_file(a65b12504cc5fb,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5fb,1691).
xc_kb_names(a65b12504cc5fb,[]).
xc_mapping_rows(a65b12504cc5fb,[]).
xc_direction(a65b12504cc5fb,':FORWARD').
xc_monotonicity(a65b12504cc5fb,':MONOTONIC').
xc_creator(a65b12504cc5fb,'Cyc').
xc_creation_date(a65b12504cc5fb,152850).
x_genls(x_BacillusBacterium,x_ProkaryoticCell) :- x_cid(a65b12504cc5fc).
xc_microtheory(a65b12504cc5fc,x_BiologyMt).
xc_source_file(a65b12504cc5fc,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5fc,1697).
xc_kb_names(a65b12504cc5fc,[]).
xc_mapping_rows(a65b12504cc5fc,[]).
xc_direction(a65b12504cc5fc,':FORWARD').
xc_monotonicity(a65b12504cc5fc,':DEFAULT').
xc_creator(a65b12504cc5fc,'Cyc').
x_relationAllExistsMax(x_anatomicalParts,'x_Organism-Whole',x_Nose,1) :- x_cid(a65b12504cc5fd).
xc_microtheory(a65b12504cc5fd,x_BiologyMt).
xc_source_file(a65b12504cc5fd,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5fd,1703).
xc_kb_names(a65b12504cc5fd,[]).
xc_mapping_rows(a65b12504cc5fd,[]).
xc_direction(a65b12504cc5fd,':FORWARD').
xc_monotonicity(a65b12504cc5fd,':DEFAULT').
x_isa(x_Herbivore,x_OrganismClassificationType) :- x_cid(a65b12504cc5fe).
xc_microtheory(a65b12504cc5fe,x_BiologyMt).
xc_source_file(a65b12504cc5fe,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5fe,1709).
xc_kb_names(a65b12504cc5fe,[]).
xc_mapping_rows(a65b12504cc5fe,[]).
xc_direction(a65b12504cc5fe,':FORWARD').
xc_monotonicity(a65b12504cc5fe,':MONOTONIC').
xc_creator(a65b12504cc5fe,'Cyc').
xc_creation_date(a65b12504cc5fe,155444).
x_isa(x_inhalingToxicityFor,x_TernaryPredicate) :- x_cid(a65b12504cc5ff).
xc_microtheory(a65b12504cc5ff,x_BiologyMt).
xc_source_file(a65b12504cc5ff,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc5ff,1715).
xc_kb_names(a65b12504cc5ff,[]).
xc_mapping_rows(a65b12504cc5ff,[]).
xc_direction(a65b12504cc5ff,':FORWARD').
xc_monotonicity(a65b12504cc5ff,':MONOTONIC').
xc_creator(a65b12504cc5ff,'Cyc').
xc_creation_date(a65b12504cc5ff,184610).
x_relationAllExists(x_objectExposed,x_ExposureToSubstance,x_PartiallyTangible) :- x_cid(a65b12504cc600).
xc_microtheory(a65b12504cc600,x_BiologyMt).
xc_source_file(a65b12504cc600,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc600,1721).
xc_kb_names(a65b12504cc600,[]).
xc_mapping_rows(a65b12504cc600,[]).
xc_direction(a65b12504cc600,':FORWARD').
xc_monotonicity(a65b12504cc600,':DEFAULT').
xc_creator(a65b12504cc600,'Cyc').
xc_creation_date(a65b12504cc600,105848).
x_arg2Isa('x_SKF-51781280',x_NonNegativeScalarInterval) :- x_cid(a65b12504cc601).
xc_microtheory(a65b12504cc601,x_BiologyMt).
xc_source_file(a65b12504cc601,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc601,1727).
xc_kb_names(a65b12504cc601,[]).
xc_mapping_rows(a65b12504cc601,[]).
xc_direction(a65b12504cc601,':FORWARD').
xc_monotonicity(a65b12504cc601,':DEFAULT').
xc_creator(a65b12504cc601,'Cyc').
x_isa(x_AttemptingFn('x_Cracking-CompromisingSecurity'),x_Collection) :- x_cid(a65b12504cc602).
xc_microtheory(a65b12504cc602,x_BiologyMt).
xc_source_file(a65b12504cc602,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc602,1733).
xc_kb_names(a65b12504cc602,[]).
xc_mapping_rows(a65b12504cc602,[]).
xc_direction(a65b12504cc602,':FORWARD').
xc_monotonicity(a65b12504cc602,':DEFAULT').
x_comment(x_Neutrophil,"A subclass of #$WhiteBloodCell, quite similar to #$Macrophage in\nsize, structure and function, unlike these, they circualte the\n#$Blood. They need stimulus to exit the blood and enter tissues.") :- x_cid(a65b12504cc603).
xc_microtheory(a65b12504cc603,x_BiologyMt).
xc_source_file(a65b12504cc603,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc603,1740).
xc_kb_names(a65b12504cc603,[]).
xc_mapping_rows(a65b12504cc603,[]).
xc_direction(a65b12504cc603,':FORWARD').
xc_monotonicity(a65b12504cc603,':DEFAULT').
xc_creator(a65b12504cc603,'Cyc').
x_genls(x_GroupFn(x_Animal),x_PartiallyTangible) :- x_cid(a65b12504cc604).
xc_microtheory(a65b12504cc604,x_BiologyMt).
xc_source_file(a65b12504cc604,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc604,1748).
xc_kb_names(a65b12504cc604,[]).
xc_mapping_rows(a65b12504cc604,[]).
xc_direction(a65b12504cc604,':FORWARD').
xc_monotonicity(a65b12504cc604,':DEFAULT').
x_implies(x_and(x_isa(V1,x_BiologicalTaxon),x_isa(V2,V1),x_siblings(V2,V3)),x_isa(V3,V1)) :- x_cid(a65b12504cc605,V1,V2,V3).
xc_microtheory(a65b12504cc605,x_BiologyMt).
xc_source_file(a65b12504cc605,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc605,1755).
xc_kb_names(a65b12504cc605,["?TYPE","?A","?B"]).
xc_mapping_rows(a65b12504cc605,['implication-implies']).
xc_direction(a65b12504cc605,':BACKWARD').
xc_monotonicity(a65b12504cc605,':DEFAULT').
xc_creator(a65b12504cc605,'Cyc').
x_comment(x_AnaerobicBacterium,"The collection of all instances of #$Bacterium which do not metabolize oxygen.") :- x_cid(a65b12504cc606).
xc_microtheory(a65b12504cc606,x_BiologyMt).
xc_source_file(a65b12504cc606,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc606,1766).
xc_kb_names(a65b12504cc606,[]).
xc_mapping_rows(a65b12504cc606,[]).
xc_direction(a65b12504cc606,':FORWARD').
xc_monotonicity(a65b12504cc606,':MONOTONIC').
xc_creator(a65b12504cc606,'Cyc').
xc_creation_date(a65b12504cc606,161630).
x_argIsa(x_HairMobFn,1,x_Collection) :- x_cid(a65b12504cc607).
xc_microtheory(a65b12504cc607,x_BiologyMt).
xc_source_file(a65b12504cc607,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc607,1772).
xc_kb_names(a65b12504cc607,[]).
xc_mapping_rows(a65b12504cc607,[]).
xc_direction(a65b12504cc607,':FORWARD').
xc_monotonicity(a65b12504cc607,':MONOTONIC').
x_arg2Isa(x_InstantiationInstanceFn(x_exposureToType,x_TheSet(2)),x_PartiallyTangible) :- x_cid(a65b12504cc608).
xc_microtheory(a65b12504cc608,x_BiologyMt).
xc_source_file(a65b12504cc608,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc608,1778).
xc_kb_names(a65b12504cc608,[]).
xc_mapping_rows(a65b12504cc608,[]).
xc_direction(a65b12504cc608,':FORWARD').
xc_monotonicity(a65b12504cc608,':DEFAULT').
x_arg2Isa(x_organismTypeCanLethallyInfect,x_OrganismClassificationType) :- x_cid(a65b12504cc609).
xc_microtheory(a65b12504cc609,x_BiologyMt).
xc_source_file(a65b12504cc609,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc609,1786).
xc_kb_names(a65b12504cc609,[]).
xc_mapping_rows(a65b12504cc609,[]).
xc_direction(a65b12504cc609,':FORWARD').
xc_monotonicity(a65b12504cc609,':MONOTONIC').
xc_creator(a65b12504cc609,'Cyc').
xc_creation_date(a65b12504cc609,150535).
x_isa(x_Dog,x_BiologicalSpecies) :- x_cid(a65b12504cc60a).
xc_microtheory(a65b12504cc60a,x_BiologyMt).
xc_source_file(a65b12504cc60a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc60a,1792).
xc_kb_names(a65b12504cc60a,[]).
xc_mapping_rows(a65b12504cc60a,[]).
xc_direction(a65b12504cc60a,':FORWARD').
xc_monotonicity(a65b12504cc60a,':MONOTONIC').
xc_creator(a65b12504cc60a,'Cyc').
x_isa(x_CellularImmuneResponse,x_SituationType) :- x_cid(a65b12504cc60b).
xc_microtheory(a65b12504cc60b,x_BiologyMt).
xc_source_file(a65b12504cc60b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc60b,1798).
xc_kb_names(a65b12504cc60b,[]).
xc_mapping_rows(a65b12504cc60b,[]).
xc_direction(a65b12504cc60b,':FORWARD').
xc_monotonicity(a65b12504cc60b,':DEFAULT').
xc_creator(a65b12504cc60b,'Cyc').
x_examplePredFormulas(x_organismFoundInSubstance,x_organismFoundInSubstance(x_Fish,x_Water)) :- x_cid(a65b12504cc60c).
xc_microtheory(a65b12504cc60c,x_BiologyMt).
xc_source_file(a65b12504cc60c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc60c,1804).
xc_kb_names(a65b12504cc60c,[]).
xc_mapping_rows(a65b12504cc60c,[]).
xc_direction(a65b12504cc60c,':FORWARD').
xc_monotonicity(a65b12504cc60c,':DEFAULT').
xc_creator(a65b12504cc60c,'Cyc').
xc_creation_date(a65b12504cc60c,185631).
x_arg3Isa(x_contactToxicityFor,x_ScalarInterval) :- x_cid(a65b12504cc60d).
xc_microtheory(a65b12504cc60d,x_BiologyMt).
xc_source_file(a65b12504cc60d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc60d,1811).
xc_kb_names(a65b12504cc60d,[]).
xc_mapping_rows(a65b12504cc60d,[]).
xc_direction(a65b12504cc60d,':FORWARD').
xc_monotonicity(a65b12504cc60d,':DEFAULT').
xc_creator(a65b12504cc60d,'Cyc').
x_genls(x_Inhaling,x_BodilyFunctionEvent) :- x_cid(a65b12504cc60e).
xc_microtheory(a65b12504cc60e,x_BiologyMt).
xc_source_file(a65b12504cc60e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc60e,1817).
xc_kb_names(a65b12504cc60e,[]).
xc_mapping_rows(a65b12504cc60e,[]).
xc_direction(a65b12504cc60e,':FORWARD').
xc_monotonicity(a65b12504cc60e,':DEFAULT').
xc_creator(a65b12504cc60e,'Cyc').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Mouth,1) :- x_cid(a65b12504cc60f).
xc_microtheory(a65b12504cc60f,x_BiologyMt).
xc_source_file(a65b12504cc60f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc60f,1823).
xc_kb_names(a65b12504cc60f,[]).
xc_mapping_rows(a65b12504cc60f,[]).
xc_direction(a65b12504cc60f,':FORWARD').
xc_monotonicity(a65b12504cc60f,':DEFAULT').
xc_creator(a65b12504cc60f,'Cyc').
x_genls(x_ReturnToVegetativeState,x_BiologicalDevelopmentEvent) :- x_cid(a65b12504cc610).
xc_microtheory(a65b12504cc610,x_BiologyMt).
xc_source_file(a65b12504cc610,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc610,1829).
xc_kb_names(a65b12504cc610,[]).
xc_mapping_rows(a65b12504cc610,[]).
xc_direction(a65b12504cc610,':FORWARD').
xc_monotonicity(a65b12504cc610,':MONOTONIC').
xc_creator(a65b12504cc610,'Cyc').
xc_creation_date(a65b12504cc610,152123).
x_arg2Isa(x_infectionLocalizedIn,x_Infection) :- x_cid(a65b12504cc611).
xc_microtheory(a65b12504cc611,x_BiologyMt).
xc_source_file(a65b12504cc611,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc611,1835).
xc_kb_names(a65b12504cc611,[]).
xc_mapping_rows(a65b12504cc611,[]).
xc_direction(a65b12504cc611,':FORWARD').
xc_monotonicity(a65b12504cc611,':MONOTONIC').
xc_creator(a65b12504cc611,'Cyc').
xc_creation_date(a65b12504cc611,113419).
x_isa(x_MobFn(x_Antibody),x_StuffType) :- x_cid(a65b12504cc612).
xc_microtheory(a65b12504cc612,x_BiologyMt).
xc_source_file(a65b12504cc612,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc612,1841).
xc_kb_names(a65b12504cc612,[]).
xc_mapping_rows(a65b12504cc612,[]).
xc_direction(a65b12504cc612,':FORWARD').
xc_monotonicity(a65b12504cc612,':MONOTONIC').
x_isa(x_NonSporeFormingBacterium,x_BacteriumTypeBySporulationAbility) :- x_cid(a65b12504cc613).
xc_microtheory(a65b12504cc613,x_BiologyMt).
xc_source_file(a65b12504cc613,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc613,1848).
xc_kb_names(a65b12504cc613,[]).
xc_mapping_rows(a65b12504cc613,[]).
xc_direction(a65b12504cc613,':FORWARD').
xc_monotonicity(a65b12504cc613,':MONOTONIC').
xc_creator(a65b12504cc613,'Cyc').
xc_creation_date(a65b12504cc613,163214).
x_arity(x_carriesOrganism,2) :- x_cid(a65b12504cc614).
xc_microtheory(a65b12504cc614,x_BiologyMt).
xc_source_file(a65b12504cc614,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc614,1854).
xc_kb_names(a65b12504cc614,[]).
xc_mapping_rows(a65b12504cc614,[]).
xc_direction(a65b12504cc614,':FORWARD').
xc_monotonicity(a65b12504cc614,':DEFAULT').
x_argIsa(x_contactToxicityFor,1,x_PartiallyTangible) :- x_cid(a65b12504cc615).
xc_microtheory(a65b12504cc615,x_BiologyMt).
xc_source_file(a65b12504cc615,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc615,1860).
xc_kb_names(a65b12504cc615,[]).
xc_mapping_rows(a65b12504cc615,[]).
xc_direction(a65b12504cc615,':FORWARD').
xc_monotonicity(a65b12504cc615,':MONOTONIC').
x_relationAllExistsMax(x_anatomicalParts,'x_Organism-Whole',x_Heart,1) :- x_cid(a65b12504cc616).
xc_microtheory(a65b12504cc616,x_BiologyMt).
xc_source_file(a65b12504cc616,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc616,1866).
xc_kb_names(a65b12504cc616,[]).
xc_mapping_rows(a65b12504cc616,[]).
xc_direction(a65b12504cc616,':FORWARD').
xc_monotonicity(a65b12504cc616,':DEFAULT').
x_comment(x_contaminatedWithMicroorganismType,"(#$contaminatedWithMicroorganismType STUFF MICROTYPE) means that the #$PartiallyTangible STUFF is\ncontaminated with #$Microorganisms of the type MICROTYPE.") :- x_cid(a65b12504cc617).
xc_microtheory(a65b12504cc617,x_BiologyMt).
xc_source_file(a65b12504cc617,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc617,1872).
xc_kb_names(a65b12504cc617,[]).
xc_mapping_rows(a65b12504cc617,[]).
xc_direction(a65b12504cc617,':FORWARD').
xc_monotonicity(a65b12504cc617,':DEFAULT').
xc_creator(a65b12504cc617,'Cyc').
x_genls(x_BacillusBacterium,x_MoneraKingdom) :- x_cid(a65b12504cc618).
xc_microtheory(a65b12504cc618,x_BiologyMt).
xc_source_file(a65b12504cc618,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc618,1879).
xc_kb_names(a65b12504cc618,[]).
xc_mapping_rows(a65b12504cc618,[]).
xc_direction(a65b12504cc618,':FORWARD').
xc_monotonicity(a65b12504cc618,':DEFAULT').
xc_creator(a65b12504cc618,'Cyc').
x_arg1Isa('x_SKF-51781280',x_AdultAnimal) :- x_cid(a65b12504cc619).
xc_microtheory(a65b12504cc619,x_BiologyMt).
xc_source_file(a65b12504cc619,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc619,1885).
xc_kb_names(a65b12504cc619,[]).
xc_mapping_rows(a65b12504cc619,[]).
xc_direction(a65b12504cc619,':FORWARD').
xc_monotonicity(a65b12504cc619,':DEFAULT').
xc_creator(a65b12504cc619,'Cyc').
x_genls(x_Animal,'x_Organism-Whole') :- x_cid(a65b12504cc61a).
xc_microtheory(a65b12504cc61a,x_BiologyMt).
xc_source_file(a65b12504cc61a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc61a,1891).
xc_kb_names(a65b12504cc61a,[]).
xc_mapping_rows(a65b12504cc61a,[]).
xc_direction(a65b12504cc61a,':FORWARD').
xc_monotonicity(a65b12504cc61a,':DEFAULT').
xc_creator(a65b12504cc61a,'Cyc').
x_comment(x_Antigen,"An antigen is any substance that can stimulate immune\nresponse. For example, bacteria, viruses, proteins can serve as #$Antigens.") :- x_cid(a65b12504cc61b).
xc_microtheory(a65b12504cc61b,x_BiologyMt).
xc_source_file(a65b12504cc61b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc61b,1897).
xc_kb_names(a65b12504cc61b,[]).
xc_mapping_rows(a65b12504cc61b,[]).
xc_direction(a65b12504cc61b,':FORWARD').
xc_monotonicity(a65b12504cc61b,':DEFAULT').
xc_creator(a65b12504cc61b,'Cyc').
x_arg1Isa(x_HairMobFn,x_Collection) :- x_cid(a65b12504cc61c).
xc_microtheory(a65b12504cc61c,x_BiologyMt).
xc_source_file(a65b12504cc61c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc61c,1904).
xc_kb_names(a65b12504cc61c,[]).
xc_mapping_rows(a65b12504cc61c,[]).
xc_direction(a65b12504cc61c,':FORWARD').
xc_monotonicity(a65b12504cc61c,':MONOTONIC').
xc_creator(a65b12504cc61c,'Cyc').
xc_creation_date(a65b12504cc61c,101635).
x_argIsa(x_InstantiationInstanceFn(x_exposureToType,x_TheSet(2)),1,x_ExposureToSubstance) :- x_cid(a65b12504cc61d).
xc_microtheory(a65b12504cc61d,x_BiologyMt).
xc_source_file(a65b12504cc61d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc61d,1910).
xc_kb_names(a65b12504cc61d,[]).
xc_mapping_rows(a65b12504cc61d,[]).
xc_direction(a65b12504cc61d,':FORWARD').
xc_monotonicity(a65b12504cc61d,':DEFAULT').
x_isa(x_Embryo,x_LifeStageType) :- x_cid(a65b12504cc61e).
xc_microtheory(a65b12504cc61e,x_BiologyMt).
xc_source_file(a65b12504cc61e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc61e,1918).
xc_kb_names(a65b12504cc61e,[]).
xc_mapping_rows(a65b12504cc61e,[]).
xc_direction(a65b12504cc61e,':FORWARD').
xc_monotonicity(a65b12504cc61e,':MONOTONIC').
xc_creator(a65b12504cc61e,'Cyc').
x_isa(x_BrucellaBacterium,x_OrganismClassificationType) :- x_cid(a65b12504cc61f).
xc_microtheory(a65b12504cc61f,x_BiologyMt).
xc_source_file(a65b12504cc61f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc61f,1924).
xc_kb_names(a65b12504cc61f,[]).
xc_mapping_rows(a65b12504cc61f,[]).
xc_direction(a65b12504cc61f,':FORWARD').
xc_monotonicity(a65b12504cc61f,':MONOTONIC').
xc_creator(a65b12504cc61f,'Cyc').
x_arg2Isa(x_InstantiationInstanceFn(x_organismTypeCanLethallyInfect,x_TheSet(1)),x_OrganismClassificationType) :- x_cid(a65b12504cc620).
xc_microtheory(a65b12504cc620,x_BiologyMt).
xc_source_file(a65b12504cc620,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc620,1930).
xc_kb_names(a65b12504cc620,[]).
xc_mapping_rows(a65b12504cc620,[]).
xc_direction(a65b12504cc620,':FORWARD').
xc_monotonicity(a65b12504cc620,':DEFAULT').
x_genls(x_SmugglingFn('x_Anthrax-Bacterium'),x_ActsCommonlyConsideredCriminal) :- x_cid(a65b12504cc621).
xc_microtheory(a65b12504cc621,x_BiologyMt).
xc_source_file(a65b12504cc621,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc621,1938).
xc_kb_names(a65b12504cc621,[]).
xc_mapping_rows(a65b12504cc621,[]).
xc_direction(a65b12504cc621,':FORWARD').
xc_monotonicity(a65b12504cc621,':DEFAULT').
x_genls(x_ExposureToSubstance,x_IntrinsicStateChangeEvent) :- x_cid(a65b12504cc622).
xc_microtheory(a65b12504cc622,x_BiologyMt).
xc_source_file(a65b12504cc622,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc622,1945).
xc_kb_names(a65b12504cc622,[]).
xc_mapping_rows(a65b12504cc622,[]).
xc_direction(a65b12504cc622,':FORWARD').
xc_monotonicity(a65b12504cc622,':DEFAULT').
xc_creator(a65b12504cc622,'Cyc').
x_genls(x_Omnivore,'x_Organism-Whole') :- x_cid(a65b12504cc623).
xc_microtheory(a65b12504cc623,x_BiologyMt).
xc_source_file(a65b12504cc623,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc623,1951).
xc_kb_names(a65b12504cc623,[]).
xc_mapping_rows(a65b12504cc623,[]).
xc_direction(a65b12504cc623,':FORWARD').
xc_monotonicity(a65b12504cc623,':DEFAULT').
xc_creator(a65b12504cc623,'Cyc').
x_isa(x_BacteriumTypeByGramStain,x_SiblingDisjointCollection) :- x_cid(a65b12504cc624).
xc_microtheory(a65b12504cc624,x_BiologyMt).
xc_source_file(a65b12504cc624,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc624,1957).
xc_kb_names(a65b12504cc624,[]).
xc_mapping_rows(a65b12504cc624,[]).
xc_direction(a65b12504cc624,':FORWARD').
xc_monotonicity(a65b12504cc624,':DEFAULT').
xc_creator(a65b12504cc624,'Cyc').
x_argIsa(x_infectionLocalizedIn,1,'x_Organism-Whole') :- x_cid(a65b12504cc625).
xc_microtheory(a65b12504cc625,x_BiologyMt).
xc_source_file(a65b12504cc625,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc625,1963).
xc_kb_names(a65b12504cc625,[]).
xc_mapping_rows(a65b12504cc625,[]).
xc_direction(a65b12504cc625,':FORWARD').
xc_monotonicity(a65b12504cc625,':MONOTONIC').
x_comment(x_ScatFn,"(#$ScatFn ORGANISMTYPE) returns the collection of all instances of #$ExcretionSubstance deriving from some instance of ORGANISMTYPE.  E.g., (#$ScatFn #$Opossum) denotes the collection of all instances of possum-scat.") :- x_cid(a65b12504cc626).
xc_microtheory(a65b12504cc626,x_BiologyMt).
xc_source_file(a65b12504cc626,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc626,1969).
xc_kb_names(a65b12504cc626,[]).
xc_mapping_rows(a65b12504cc626,[]).
xc_direction(a65b12504cc626,':FORWARD').
xc_monotonicity(a65b12504cc626,':DEFAULT').
xc_creator(a65b12504cc626,'Cyc').
xc_creation_date(a65b12504cc626,101804).
x_implies(x_and(x_isa(V1,x_FemaleAnimal),x_isa(V1,x_Person)),x_isa(V1,x_FemalePerson)) :- x_cid(a65b12504cc627,V1).
xc_microtheory(a65b12504cc627,x_BiologyMt).
xc_source_file(a65b12504cc627,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc627,1975).
xc_kb_names(a65b12504cc627,["?X"]).
xc_mapping_rows(a65b12504cc627,['implication-implies']).
xc_direction(a65b12504cc627,':BACKWARD').
xc_monotonicity(a65b12504cc627,':DEFAULT').
xc_creator(a65b12504cc627,'Cyc').
x_examplePredFormulas(x_objectExposed,x_objectExposed(x_BeberDrinksWaterWithCholera,x_MmeBertrand)) :- x_cid(a65b12504cc628).
xc_microtheory(a65b12504cc628,x_BiologyMt).
xc_source_file(a65b12504cc628,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc628,1985).
xc_kb_names(a65b12504cc628,[]).
xc_mapping_rows(a65b12504cc628,[]).
xc_direction(a65b12504cc628,':FORWARD').
xc_monotonicity(a65b12504cc628,':MONOTONIC').
xc_creator(a65b12504cc628,'Cyc').
xc_creation_date(a65b12504cc628,142639).
x_negationInverse(x_carriesOrganism,x_carriesOrganism) :- x_cid(a65b12504cc629).
xc_microtheory(a65b12504cc629,x_BiologyMt).
xc_source_file(a65b12504cc629,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc629,1992).
xc_kb_names(a65b12504cc629,[]).
xc_mapping_rows(a65b12504cc629,[]).
xc_direction(a65b12504cc629,':FORWARD').
xc_monotonicity(a65b12504cc629,':MONOTONIC').
x_arg1Isa(x_contactToxicityFor,x_PartiallyTangible) :- x_cid(a65b12504cc62a).
xc_microtheory(a65b12504cc62a,x_BiologyMt).
xc_source_file(a65b12504cc62a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc62a,1998).
xc_kb_names(a65b12504cc62a,[]).
xc_mapping_rows(a65b12504cc62a,[]).
xc_direction(a65b12504cc62a,':FORWARD').
xc_monotonicity(a65b12504cc62a,':MONOTONIC').
xc_creator(a65b12504cc62a,'Cyc').
xc_creation_date(a65b12504cc62a,184610).
x_isa(x_SkeletalSystem,x_UniqueAnatomicalPartType) :- x_cid(a65b12504cc62b).
xc_microtheory(a65b12504cc62b,x_BiologyMt).
xc_source_file(a65b12504cc62b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc62b,2004).
xc_kb_names(a65b12504cc62b,[]).
xc_mapping_rows(a65b12504cc62b,[]).
xc_direction(a65b12504cc62b,':FORWARD').
xc_monotonicity(a65b12504cc62b,':DEFAULT').
x_arg3Isa('x_SKF-58570131',x_AnimalBodyPartType) :- x_cid(a65b12504cc62c).
xc_microtheory(a65b12504cc62c,x_BiologyMt).
xc_source_file(a65b12504cc62c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc62c,2010).
xc_kb_names(a65b12504cc62c,[]).
xc_mapping_rows(a65b12504cc62c,[]).
xc_direction(a65b12504cc62c,':FORWARD').
xc_monotonicity(a65b12504cc62c,':DEFAULT').
xc_creator(a65b12504cc62c,'Cyc').
x_genls(x_Rickettsia,'x_Organism-Whole') :- x_cid(a65b12504cc62d).
xc_microtheory(a65b12504cc62d,x_BiologyMt).
xc_source_file(a65b12504cc62d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc62d,2016).
xc_kb_names(a65b12504cc62d,[]).
xc_mapping_rows(a65b12504cc62d,[]).
xc_direction(a65b12504cc62d,':FORWARD').
xc_monotonicity(a65b12504cc62d,':DEFAULT').
xc_creator(a65b12504cc62d,'Cyc').
x_isa(x_AntibodyIgA,x_ChemicalCompoundType) :- x_cid(a65b12504cc62e).
xc_microtheory(a65b12504cc62e,x_BiologyMt).
xc_source_file(a65b12504cc62e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc62e,2022).
xc_kb_names(a65b12504cc62e,[]).
xc_mapping_rows(a65b12504cc62e,[]).
xc_direction(a65b12504cc62e,':FORWARD').
xc_monotonicity(a65b12504cc62e,':MONOTONIC').
xc_creator(a65b12504cc62e,'Cyc').
x_isa('x_Safeguard-Situation',x_ObjectType) :- x_cid(a65b12504cc62f).
xc_microtheory(a65b12504cc62f,x_BiologyMt).
xc_source_file(a65b12504cc62f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc62f,2028).
xc_kb_names(a65b12504cc62f,[]).
xc_mapping_rows(a65b12504cc62f,[]).
xc_direction(a65b12504cc62f,':FORWARD').
xc_monotonicity(a65b12504cc62f,':MONOTONIC').
xc_creator(a65b12504cc62f,'Cyc').
xc_creation_date(a65b12504cc62f,152831).
x_genls(x_SporeGermination,x_BiologicalDevelopmentEvent) :- x_cid(a65b12504cc630).
xc_microtheory(a65b12504cc630,x_BiologyMt).
xc_source_file(a65b12504cc630,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc630,2034).
xc_kb_names(a65b12504cc630,[]).
xc_mapping_rows(a65b12504cc630,[]).
xc_direction(a65b12504cc630,':FORWARD').
xc_monotonicity(a65b12504cc630,':MONOTONIC').
xc_creator(a65b12504cc630,'Cyc').
xc_creation_date(a65b12504cc630,172841).
x_argGenl(x_exposureToType,2,x_PartiallyTangible) :- x_cid(a65b12504cc631).
xc_microtheory(a65b12504cc631,x_BiologyMt).
xc_source_file(a65b12504cc631,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc631,2040).
xc_kb_names(a65b12504cc631,[]).
xc_mapping_rows(a65b12504cc631,[]).
xc_direction(a65b12504cc631,':FORWARD').
xc_monotonicity(a65b12504cc631,':MONOTONIC').
x_arg1Isa('x_SKF-51781280',x_Insect) :- x_cid(a65b12504cc632).
xc_microtheory(a65b12504cc632,x_BiologyMt).
xc_source_file(a65b12504cc632,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc632,2046).
xc_kb_names(a65b12504cc632,[]).
xc_mapping_rows(a65b12504cc632,[]).
xc_direction(a65b12504cc632,':FORWARD').
xc_monotonicity(a65b12504cc632,':DEFAULT').
xc_creator(a65b12504cc632,'Cyc').
x_comment(x_stuffInhaled,"(#$stuffInhaled INHALING STUFF) means that during\nINHALING, an instance of #$Inhaling, STUFF, an instance of\n#$PartiallyTangible, is what is inhaled.") :- x_cid(a65b12504cc633).
xc_microtheory(a65b12504cc633,x_BiologyMt).
xc_source_file(a65b12504cc633,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc633,2052).
xc_kb_names(a65b12504cc633,[]).
xc_mapping_rows(a65b12504cc633,[]).
xc_direction(a65b12504cc633,':FORWARD').
xc_monotonicity(a65b12504cc633,':DEFAULT').
xc_creator(a65b12504cc633,'Cyc').
xc_creation_date(a65b12504cc633,162325).
x_expansion(x_exposureOfObjectToSubstanceType,x_and(x_objectExposed(':ARG1',':ARG2'),x_exposureToType(':ARG1',':ARG3'))) :- x_cid(a65b12504cc634).
xc_microtheory(a65b12504cc634,x_BiologyMt).
xc_source_file(a65b12504cc634,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc634,2060).
xc_kb_names(a65b12504cc634,[]).
xc_mapping_rows(a65b12504cc634,[]).
xc_direction(a65b12504cc634,':FORWARD').
xc_monotonicity(a65b12504cc634,':DEFAULT').
xc_creator(a65b12504cc634,'Cyc').
xc_creation_date(a65b12504cc634,170110).
x_isa(x_AnaerobicBacterium,x_BacteriumTypeByAerobicity) :- x_cid(a65b12504cc635).
xc_microtheory(a65b12504cc635,x_BiologyMt).
xc_source_file(a65b12504cc635,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc635,2069).
xc_kb_names(a65b12504cc635,[]).
xc_mapping_rows(a65b12504cc635,[]).
xc_direction(a65b12504cc635,':FORWARD').
xc_monotonicity(a65b12504cc635,':MONOTONIC').
xc_creator(a65b12504cc635,'Cyc').
x_isa(x_AttemptingFn(x_CoercingAnAgent),x_Collection) :- x_cid(a65b12504cc636).
xc_microtheory(a65b12504cc636,x_BiologyMt).
xc_source_file(a65b12504cc636,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc636,2075).
xc_kb_names(a65b12504cc636,[]).
xc_mapping_rows(a65b12504cc636,[]).
xc_direction(a65b12504cc636,':FORWARD').
xc_monotonicity(a65b12504cc636,':DEFAULT').
x_genls(x_Antigen,x_TangibleThing) :- x_cid(a65b12504cc637).
xc_microtheory(a65b12504cc637,x_BiologyMt).
xc_source_file(a65b12504cc637,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc637,2082).
xc_kb_names(a65b12504cc637,[]).
xc_mapping_rows(a65b12504cc637,[]).
xc_direction(a65b12504cc637,':FORWARD').
xc_monotonicity(a65b12504cc637,':MONOTONIC').
xc_creator(a65b12504cc637,'Cyc').
x_argIsa(x_InstantiationInstanceFn(x_exposureToType,x_TheSet(2)),2,x_PartiallyTangible) :- x_cid(a65b12504cc638).
xc_microtheory(a65b12504cc638,x_BiologyMt).
xc_source_file(a65b12504cc638,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc638,2088).
xc_kb_names(a65b12504cc638,[]).
xc_mapping_rows(a65b12504cc638,[]).
xc_direction(a65b12504cc638,':FORWARD').
xc_monotonicity(a65b12504cc638,':DEFAULT').
x_isa(x_SpirillaBacterium,x_BacteriumTypeByStructure) :- x_cid(a65b12504cc639).
xc_microtheory(a65b12504cc639,x_BiologyMt).
xc_source_file(a65b12504cc639,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc639,2096).
xc_kb_names(a65b12504cc639,[]).
xc_mapping_rows(a65b12504cc639,[]).
xc_direction(a65b12504cc639,':FORWARD').
xc_monotonicity(a65b12504cc639,':MONOTONIC').
xc_creator(a65b12504cc639,'Cyc').
x_isa(x_BrucellaBacterium,x_BiologicalSpecies) :- x_cid(a65b12504cc63a).
xc_microtheory(a65b12504cc63a,x_BiologyMt).
xc_source_file(a65b12504cc63a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc63a,2102).
xc_kb_names(a65b12504cc63a,[]).
xc_mapping_rows(a65b12504cc63a,[]).
xc_direction(a65b12504cc63a,':FORWARD').
xc_monotonicity(a65b12504cc63a,':MONOTONIC').
xc_creator(a65b12504cc63a,'Cyc').
x_arg2Genl(x_InstantiationInstanceFn(x_organismTypeCanLethallyInfect,x_TheSet(1)),x_BiologicalLivingObject) :- x_cid(a65b12504cc63b).
xc_microtheory(a65b12504cc63b,x_BiologyMt).
xc_source_file(a65b12504cc63b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc63b,2108).
xc_kb_names(a65b12504cc63b,[]).
xc_mapping_rows(a65b12504cc63b,[]).
xc_direction(a65b12504cc63b,':FORWARD').
xc_monotonicity(a65b12504cc63b,':DEFAULT').
x_genls(x_ExposureToSubstance,x_Action) :- x_cid(a65b12504cc63c).
xc_microtheory(a65b12504cc63c,x_BiologyMt).
xc_source_file(a65b12504cc63c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc63c,2116).
xc_kb_names(a65b12504cc63c,[]).
xc_mapping_rows(a65b12504cc63c,[]).
xc_direction(a65b12504cc63c,':FORWARD').
xc_monotonicity(a65b12504cc63c,':DEFAULT').
xc_creator(a65b12504cc63c,'Cyc').
x_isa(x_BacteriumTypeByGramStain,x_DisjointSetOrCollection) :- x_cid(a65b12504cc63d).
xc_microtheory(a65b12504cc63d,x_BiologyMt).
xc_source_file(a65b12504cc63d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc63d,2122).
xc_kb_names(a65b12504cc63d,[]).
xc_mapping_rows(a65b12504cc63d,[]).
xc_direction(a65b12504cc63d,':FORWARD').
xc_monotonicity(a65b12504cc63d,':DEFAULT').
xc_creator(a65b12504cc63d,'Cyc').
x_genls(x_Inhaling,x_BiologicalIntakeEvent) :- x_cid(a65b12504cc63e).
xc_microtheory(a65b12504cc63e,x_BiologyMt).
xc_source_file(a65b12504cc63e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc63e,2128).
xc_kb_names(a65b12504cc63e,[]).
xc_mapping_rows(a65b12504cc63e,[]).
xc_direction(a65b12504cc63e,':FORWARD').
xc_monotonicity(a65b12504cc63e,':MONOTONIC').
xc_creator(a65b12504cc63e,'Cyc').
x_arg1Isa(x_infectionLocalizedIn,'x_Organism-Whole') :- x_cid(a65b12504cc63f).
xc_microtheory(a65b12504cc63f,x_BiologyMt).
xc_source_file(a65b12504cc63f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc63f,2134).
xc_kb_names(a65b12504cc63f,[]).
xc_mapping_rows(a65b12504cc63f,[]).
xc_direction(a65b12504cc63f,':FORWARD').
xc_monotonicity(a65b12504cc63f,':MONOTONIC').
xc_creator(a65b12504cc63f,'Cyc').
xc_creation_date(a65b12504cc63f,113419).
x_isa(x_carriesOrganism,x_AsymmetricBinaryPredicate) :- x_cid(a65b12504cc640).
xc_microtheory(a65b12504cc640,x_BiologyMt).
xc_source_file(a65b12504cc640,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc640,2140).
xc_kb_names(a65b12504cc640,[]).
xc_mapping_rows(a65b12504cc640,[]).
xc_direction(a65b12504cc640,':FORWARD').
xc_monotonicity(a65b12504cc640,':MONOTONIC').
xc_creator(a65b12504cc640,'Cyc').
xc_creation_date(a65b12504cc640,123939).
x_arity(x_contactToxicityFor,3) :- x_cid(a65b12504cc641).
xc_microtheory(a65b12504cc641,x_BiologyMt).
xc_source_file(a65b12504cc641,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc641,2146).
xc_kb_names(a65b12504cc641,[]).
xc_mapping_rows(a65b12504cc641,[]).
xc_direction(a65b12504cc641,':FORWARD').
xc_monotonicity(a65b12504cc641,':DEFAULT').
x_arg2Isa('x_SKF-58570131',x_Animal) :- x_cid(a65b12504cc642).
xc_microtheory(a65b12504cc642,x_BiologyMt).
xc_source_file(a65b12504cc642,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc642,2152).
xc_kb_names(a65b12504cc642,[]).
xc_mapping_rows(a65b12504cc642,[]).
xc_direction(a65b12504cc642,':FORWARD').
xc_monotonicity(a65b12504cc642,':DEFAULT').
xc_creator(a65b12504cc642,'Cyc').
x_comment('x_Clostridium-Genus',"A collection of #$Bacterium.  A #$BiologicalGenus formed in the\n#$MoneraKingdom.  The #$Clostridium-Genus are large #$AnaerobicBacterium,\n#$GramPositiveBacterium, #$BacillusBacterium.  These #$ProkaryoticCells cause\n#$Botulism, #$Tetanus, gas gangrene, and pseudomembranous colitis.") :- x_cid(a65b12504cc643).
xc_microtheory(a65b12504cc643,x_BiologyMt).
xc_source_file(a65b12504cc643,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc643,2158).
xc_kb_names(a65b12504cc643,[]).
xc_mapping_rows(a65b12504cc643,[]).
xc_direction(a65b12504cc643,':FORWARD').
xc_monotonicity(a65b12504cc643,':DEFAULT').
xc_creator(a65b12504cc643,'Cyc').
x_arg2Genl(x_exposureToType,x_PartiallyTangible) :- x_cid(a65b12504cc644).
xc_microtheory(a65b12504cc644,x_BiologyMt).
xc_source_file(a65b12504cc644,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc644,2167).
xc_kb_names(a65b12504cc644,[]).
xc_mapping_rows(a65b12504cc644,[]).
xc_direction(a65b12504cc644,':FORWARD').
xc_monotonicity(a65b12504cc644,':MONOTONIC').
xc_creator(a65b12504cc644,'Cyc').
xc_creation_date(a65b12504cc644,211236).
x_genls(x_SpirillaBacterium,x_ProkaryoticCell) :- x_cid(a65b12504cc645).
xc_microtheory(a65b12504cc645,x_BiologyMt).
xc_source_file(a65b12504cc645,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc645,2173).
xc_kb_names(a65b12504cc645,[]).
xc_mapping_rows(a65b12504cc645,[]).
xc_direction(a65b12504cc645,':FORWARD').
xc_monotonicity(a65b12504cc645,':DEFAULT').
xc_creator(a65b12504cc645,'Cyc').
x_resultIsa('x_SKF-51781280',x_Leg) :- x_cid(a65b12504cc646).
xc_microtheory(a65b12504cc646,x_BiologyMt).
xc_source_file(a65b12504cc646,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc646,2179).
xc_kb_names(a65b12504cc646,[]).
xc_mapping_rows(a65b12504cc646,[]).
xc_direction(a65b12504cc646,':FORWARD').
xc_monotonicity(a65b12504cc646,':DEFAULT').
xc_creator(a65b12504cc646,'Cyc').
x_isa(x_Neutrophil,x_ExistingObjectType) :- x_cid(a65b12504cc647).
xc_microtheory(a65b12504cc647,x_BiologyMt).
xc_source_file(a65b12504cc647,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc647,2185).
xc_kb_names(a65b12504cc647,[]).
xc_mapping_rows(a65b12504cc647,[]).
xc_direction(a65b12504cc647,':FORWARD').
xc_monotonicity(a65b12504cc647,':MONOTONIC').
xc_creator(a65b12504cc647,'Cyc').
x_genlPreds(x_stuffInExposureEvent,x_preActors) :- x_cid(a65b12504cc648).
xc_microtheory(a65b12504cc648,x_BiologyMt).
xc_source_file(a65b12504cc648,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc648,2191).
xc_kb_names(a65b12504cc648,[]).
xc_mapping_rows(a65b12504cc648,[]).
xc_direction(a65b12504cc648,':FORWARD').
xc_monotonicity(a65b12504cc648,':MONOTONIC').
xc_creator(a65b12504cc648,'Cyc').
xc_creation_date(a65b12504cc648,94229).
x_examplePredFormulas(x_stuffInhaled,x_stuffInhaled(x_MmeBertrandGasps79,x_O2InhaledByMmeBertrand79)) :- x_cid(a65b12504cc649).
xc_microtheory(a65b12504cc649,x_BiologyMt).
xc_source_file(a65b12504cc649,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc649,2197).
xc_kb_names(a65b12504cc649,[]).
xc_mapping_rows(a65b12504cc649,[]).
xc_direction(a65b12504cc649,':FORWARD').
xc_monotonicity(a65b12504cc649,':MONOTONIC').
xc_creator(a65b12504cc649,'Cyc').
xc_creation_date(a65b12504cc649,175951).
x_argGenl(x_exposureOfObjectToSubstanceType,3,x_PartiallyTangible) :- x_cid(a65b12504cc64a).
xc_microtheory(a65b12504cc64a,x_BiologyMt).
xc_source_file(a65b12504cc64a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc64a,2204).
xc_kb_names(a65b12504cc64a,[]).
xc_mapping_rows(a65b12504cc64a,[]).
xc_direction(a65b12504cc64a,':FORWARD').
xc_monotonicity(a65b12504cc64a,':DEFAULT').
x_isa(x_HairMobFn,x_CollectionDenotingFunction) :- x_cid(a65b12504cc64b).
xc_microtheory(a65b12504cc64b,x_BiologyMt).
xc_source_file(a65b12504cc64b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc64b,2210).
xc_kb_names(a65b12504cc64b,[]).
xc_mapping_rows(a65b12504cc64b,[]).
xc_direction(a65b12504cc64b,':FORWARD').
xc_monotonicity(a65b12504cc64b,':MONOTONIC').
xc_creator(a65b12504cc64b,'Cyc').
xc_creation_date(a65b12504cc64b,101635).
x_arity(x_InstantiationInstanceFn(x_exposureToType,x_TheSet(2)),2) :- x_cid(a65b12504cc64c).
xc_microtheory(a65b12504cc64c,x_BiologyMt).
xc_source_file(a65b12504cc64c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc64c,2216).
xc_kb_names(a65b12504cc64c,[]).
xc_mapping_rows(a65b12504cc64c,[]).
xc_direction(a65b12504cc64c,':FORWARD').
xc_monotonicity(a65b12504cc64c,':DEFAULT').
x_genls(x_SmugglingFn('x_Anthrax-Bacterium'),'x_Translation-SingleTrajectory') :- x_cid(a65b12504cc64d).
xc_microtheory(a65b12504cc64d,x_BiologyMt).
xc_source_file(a65b12504cc64d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc64d,2224).
xc_kb_names(a65b12504cc64d,[]).
xc_mapping_rows(a65b12504cc64d,[]).
xc_direction(a65b12504cc64d,':FORWARD').
xc_monotonicity(a65b12504cc64d,':DEFAULT').
x_isa(x_exposureToType,x_Thing) :- x_cid(a65b12504cc64e).
xc_microtheory(a65b12504cc64e,x_BiologyMt).
xc_source_file(a65b12504cc64e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc64e,2231).
xc_kb_names(a65b12504cc64e,[]).
xc_mapping_rows(a65b12504cc64e,[]).
xc_direction(a65b12504cc64e,':FORWARD').
xc_monotonicity(a65b12504cc64e,':DEFAULT').
xc_creator(a65b12504cc64e,'Cyc').
x_genls(x_GramPositiveBacterium,x_ProkaryoticCell) :- x_cid(a65b12504cc64f).
xc_microtheory(a65b12504cc64f,x_BiologyMt).
xc_source_file(a65b12504cc64f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc64f,2237).
xc_kb_names(a65b12504cc64f,[]).
xc_mapping_rows(a65b12504cc64f,[]).
xc_direction(a65b12504cc64f,':FORWARD').
xc_monotonicity(a65b12504cc64f,':DEFAULT').
xc_creator(a65b12504cc64f,'Cyc').
x_isa(x_Liver,x_UniqueAnatomicalPartType) :- x_cid(a65b12504cc650).
xc_microtheory(a65b12504cc650,x_BiologyMt).
xc_source_file(a65b12504cc650,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc650,2243).
xc_kb_names(a65b12504cc650,[]).
xc_mapping_rows(a65b12504cc650,[]).
xc_direction(a65b12504cc650,':FORWARD').
xc_monotonicity(a65b12504cc650,':DEFAULT').
x_resultIsa(x_ScatFn,x_Collection) :- x_cid(a65b12504cc651).
xc_microtheory(a65b12504cc651,x_BiologyMt).
xc_source_file(a65b12504cc651,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc651,2249).
xc_kb_names(a65b12504cc651,[]).
xc_mapping_rows(a65b12504cc651,[]).
xc_direction(a65b12504cc651,':FORWARD').
xc_monotonicity(a65b12504cc651,':MONOTONIC').
xc_creator(a65b12504cc651,'Cyc').
xc_creation_date(a65b12504cc651,101804).
x_genls(x_Mammal,x_Vertebrate) :- x_cid(a65b12504cc652).
xc_microtheory(a65b12504cc652,x_BiologyMt).
xc_source_file(a65b12504cc652,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc652,2255).
xc_kb_names(a65b12504cc652,[]).
xc_mapping_rows(a65b12504cc652,[]).
xc_direction(a65b12504cc652,':FORWARD').
xc_monotonicity(a65b12504cc652,':DEFAULT').
x_isa(x_contactToxicityFor,x_TernaryPredicate) :- x_cid(a65b12504cc653).
xc_microtheory(a65b12504cc653,x_BiologyMt).
xc_source_file(a65b12504cc653,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc653,2261).
xc_kb_names(a65b12504cc653,[]).
xc_mapping_rows(a65b12504cc653,[]).
xc_direction(a65b12504cc653,':FORWARD').
xc_monotonicity(a65b12504cc653,':MONOTONIC').
xc_creator(a65b12504cc653,'Cyc').
xc_creation_date(a65b12504cc653,184610).
x_arg1Isa('x_SKF-58570131',x_Infection) :- x_cid(a65b12504cc654).
xc_microtheory(a65b12504cc654,x_BiologyMt).
xc_source_file(a65b12504cc654,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc654,2267).
xc_kb_names(a65b12504cc654,[]).
xc_mapping_rows(a65b12504cc654,[]).
xc_direction(a65b12504cc654,':FORWARD').
xc_monotonicity(a65b12504cc654,':DEFAULT').
xc_creator(a65b12504cc654,'Cyc').
x_argIsa(x_exposureToType,2,x_TemporalStuffType) :- x_cid(a65b12504cc655).
xc_microtheory(a65b12504cc655,x_BiologyMt).
xc_source_file(a65b12504cc655,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc655,2273).
xc_kb_names(a65b12504cc655,[]).
xc_mapping_rows(a65b12504cc655,[]).
xc_direction(a65b12504cc655,':FORWARD').
xc_monotonicity(a65b12504cc655,':MONOTONIC').
x_genls(x_SpirillaBacterium,x_MoneraKingdom) :- x_cid(a65b12504cc656).
xc_microtheory(a65b12504cc656,x_BiologyMt).
xc_source_file(a65b12504cc656,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc656,2279).
xc_kb_names(a65b12504cc656,[]).
xc_mapping_rows(a65b12504cc656,[]).
xc_direction(a65b12504cc656,':FORWARD').
xc_monotonicity(a65b12504cc656,':DEFAULT').
xc_creator(a65b12504cc656,'Cyc').
x_comment(x_ingestingToxicityFor,"(#$ingestingToxicityFor STUFF ORGTYPE TOXLEVEL) means that under ordinary circumstances, stuff has the #$Toxicity TOXLEVEL for instances of ORGTYPE that ingest it.") :- x_cid(a65b12504cc657).
xc_microtheory(a65b12504cc657,x_BiologyMt).
xc_source_file(a65b12504cc657,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc657,2285).
xc_kb_names(a65b12504cc657,[]).
xc_mapping_rows(a65b12504cc657,[]).
xc_direction(a65b12504cc657,':FORWARD').
xc_monotonicity(a65b12504cc657,':DEFAULT').
xc_creator(a65b12504cc657,'Cyc').
xc_creation_date(a65b12504cc657,184610).
x_arity('x_SKF-51781280',2) :- x_cid(a65b12504cc658).
xc_microtheory(a65b12504cc658,x_BiologyMt).
xc_source_file(a65b12504cc658,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc658,2291).
xc_kb_names(a65b12504cc658,[]).
xc_mapping_rows(a65b12504cc658,[]).
xc_direction(a65b12504cc658,':FORWARD').
xc_monotonicity(a65b12504cc658,':MONOTONIC').
xc_creator(a65b12504cc658,'Cyc').
x_genlPreds(x_stuffInExposureEvent,x_nonDeliberateActors) :- x_cid(a65b12504cc659).
xc_microtheory(a65b12504cc659,x_BiologyMt).
xc_source_file(a65b12504cc659,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc659,2297).
xc_kb_names(a65b12504cc659,[]).
xc_mapping_rows(a65b12504cc659,[]).
xc_direction(a65b12504cc659,':FORWARD').
xc_monotonicity(a65b12504cc659,':MONOTONIC').
xc_creator(a65b12504cc659,'Cyc').
xc_creation_date(a65b12504cc659,94229).
x_arg3Genl(x_exposureOfObjectToSubstanceType,x_PartiallyTangible) :- x_cid(a65b12504cc65a).
xc_microtheory(a65b12504cc65a,x_BiologyMt).
xc_source_file(a65b12504cc65a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc65a,2303).
xc_kb_names(a65b12504cc65a,[]).
xc_mapping_rows(a65b12504cc65a,[]).
xc_direction(a65b12504cc65a,':FORWARD').
xc_monotonicity(a65b12504cc65a,':DEFAULT').
xc_creator(a65b12504cc65a,'Cyc').
xc_creation_date(a65b12504cc65a,165840).
x_isa(x_Antigen,x_ExistingStuffType) :- x_cid(a65b12504cc65b).
xc_microtheory(a65b12504cc65b,x_BiologyMt).
xc_source_file(a65b12504cc65b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc65b,2309).
xc_kb_names(a65b12504cc65b,[]).
xc_mapping_rows(a65b12504cc65b,[]).
xc_direction(a65b12504cc65b,':FORWARD').
xc_monotonicity(a65b12504cc65b,':MONOTONIC').
xc_creator(a65b12504cc65b,'Cyc').
x_arity(x_HairMobFn,1) :- x_cid(a65b12504cc65c).
xc_microtheory(a65b12504cc65c,x_BiologyMt).
xc_source_file(a65b12504cc65c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc65c,2315).
xc_kb_names(a65b12504cc65c,[]).
xc_mapping_rows(a65b12504cc65c,[]).
xc_direction(a65b12504cc65c,':FORWARD').
xc_monotonicity(a65b12504cc65c,':DEFAULT').
x_isa(x_InstantiationInstanceFn(x_exposureToType,x_TheSet(2)),x_Predicate) :- x_cid(a65b12504cc65d).
xc_microtheory(a65b12504cc65d,x_BiologyMt).
xc_source_file(a65b12504cc65d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc65d,2321).
xc_kb_names(a65b12504cc65d,[]).
xc_mapping_rows(a65b12504cc65d,[]).
xc_direction(a65b12504cc65d,':FORWARD').
xc_monotonicity(a65b12504cc65d,':MONOTONIC').
x_implies(x_and(x_objectExposed(V1,V2),x_exposureToType(V1,V3)),x_exposureOfObjectToSubstanceType(V1,V2,V3)) :- x_cid(a65b12504cc65e,V1,V2,V3).
xc_microtheory(a65b12504cc65e,x_BiologyMt).
xc_source_file(a65b12504cc65e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc65e,2329).
xc_kb_names(a65b12504cc65e,["?EXPOSURE","?OBJECT","?CONTAMINANT-TYPE"]).
xc_mapping_rows(a65b12504cc65e,['implication-implies']).
xc_direction(a65b12504cc65e,':BACKWARD').
xc_monotonicity(a65b12504cc65e,':DEFAULT').
xc_creator(a65b12504cc65e,'Cyc').
xc_creation_date(a65b12504cc65e,163147).
x_argIsa(x_InstantiationInstanceFn(x_organismTypeCanLethallyInfect,x_TheSet(1)),2,x_OrganismClassificationType) :- x_cid(a65b12504cc65f).
xc_microtheory(a65b12504cc65f,x_BiologyMt).
xc_source_file(a65b12504cc65f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc65f,2339).
xc_kb_names(a65b12504cc65f,[]).
xc_mapping_rows(a65b12504cc65f,[]).
xc_direction(a65b12504cc65f,':FORWARD').
xc_monotonicity(a65b12504cc65f,':DEFAULT').
x_genls(x_VegetativeCell,x_ProkaryoticCell) :- x_cid(a65b12504cc660).
xc_microtheory(a65b12504cc660,x_BiologyMt).
xc_source_file(a65b12504cc660,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc660,2347).
xc_kb_names(a65b12504cc660,[]).
xc_mapping_rows(a65b12504cc660,[]).
xc_direction(a65b12504cc660,':FORWARD').
xc_monotonicity(a65b12504cc660,':DEFAULT').
xc_creator(a65b12504cc660,'Cyc').
x_implies(x_and(x_isa(V1,x_MaleAnimal),x_isa(V1,x_Person)),x_isa(V1,x_MalePerson)) :- x_cid(a65b12504cc661,V1).
xc_microtheory(a65b12504cc661,x_BiologyMt).
xc_source_file(a65b12504cc661,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc661,2353).
xc_kb_names(a65b12504cc661,["?X"]).
xc_mapping_rows(a65b12504cc661,['implication-implies']).
xc_direction(a65b12504cc661,':BACKWARD').
xc_monotonicity(a65b12504cc661,':DEFAULT').
xc_creator(a65b12504cc661,'Cyc').
x_comment(x_infectionLocalizedIn,"(#$infectionLocalizedIn ORG INFECTION PART-TYPE) means that in\nthe context of the assertion, INFECTION is localized in the part or\nparts of ORG that are instances of PART-TYPE.") :- x_cid(a65b12504cc662).
xc_microtheory(a65b12504cc662,x_BiologyMt).
xc_source_file(a65b12504cc662,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc662,2363).
xc_kb_names(a65b12504cc662,[]).
xc_mapping_rows(a65b12504cc662,[]).
xc_direction(a65b12504cc662,':FORWARD').
xc_monotonicity(a65b12504cc662,':DEFAULT').
xc_creator(a65b12504cc662,'Cyc').
xc_creation_date(a65b12504cc662,162621).
x_genls(x_GramPositiveBacterium,x_MoneraKingdom) :- x_cid(a65b12504cc663).
xc_microtheory(a65b12504cc663,x_BiologyMt).
xc_source_file(a65b12504cc663,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc663,2371).
xc_kb_names(a65b12504cc663,[]).
xc_mapping_rows(a65b12504cc663,[]).
xc_direction(a65b12504cc663,':FORWARD').
xc_monotonicity(a65b12504cc663,':DEFAULT').
xc_creator(a65b12504cc663,'Cyc').
x_isa(x_Inhaling,x_TemporalStuffType) :- x_cid(a65b12504cc664).
xc_microtheory(a65b12504cc664,x_BiologyMt).
xc_source_file(a65b12504cc664,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc664,2377).
xc_kb_names(a65b12504cc664,[]).
xc_mapping_rows(a65b12504cc664,[]).
xc_direction(a65b12504cc664,':FORWARD').
xc_monotonicity(a65b12504cc664,':DEFAULT').
xc_creator(a65b12504cc664,'Cyc').
x_genls(x_Primate,x_TerrestrialOrganism) :- x_cid(a65b12504cc665).
xc_microtheory(a65b12504cc665,x_BiologyMt).
xc_source_file(a65b12504cc665,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc665,2383).
xc_kb_names(a65b12504cc665,[]).
xc_mapping_rows(a65b12504cc665,[]).
xc_direction(a65b12504cc665,':FORWARD').
xc_monotonicity(a65b12504cc665,':DEFAULT').
xc_creator(a65b12504cc665,'Cyc').
x_arity(x_infectionLocalizedIn,3) :- x_cid(a65b12504cc666).
xc_microtheory(a65b12504cc666,x_BiologyMt).
xc_source_file(a65b12504cc666,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc666,2389).
xc_kb_names(a65b12504cc666,[]).
xc_mapping_rows(a65b12504cc666,[]).
xc_direction(a65b12504cc666,':FORWARD').
xc_monotonicity(a65b12504cc666,':DEFAULT').
x_argGenl(x_contaminatedWithMicroorganismType,2,'x_Organism-Whole') :- x_cid(a65b12504cc667).
xc_microtheory(a65b12504cc667,x_BiologyMt).
xc_source_file(a65b12504cc667,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc667,2395).
xc_kb_names(a65b12504cc667,[]).
xc_mapping_rows(a65b12504cc667,[]).
xc_direction(a65b12504cc667,':FORWARD').
xc_monotonicity(a65b12504cc667,':DEFAULT').
x_argGenl(x_ScatFn,1,'x_Organism-Whole') :- x_cid(a65b12504cc668).
xc_microtheory(a65b12504cc668,x_BiologyMt).
xc_source_file(a65b12504cc668,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc668,2401).
xc_kb_names(a65b12504cc668,[]).
xc_mapping_rows(a65b12504cc668,[]).
xc_direction(a65b12504cc668,':FORWARD').
xc_monotonicity(a65b12504cc668,':MONOTONIC').
x_isa(x_Animal,x_BiologicalKingdom) :- x_cid(a65b12504cc669).
xc_microtheory(a65b12504cc669,x_BiologyMt).
xc_source_file(a65b12504cc669,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc669,2407).
xc_kb_names(a65b12504cc669,[]).
xc_mapping_rows(a65b12504cc669,[]).
xc_direction(a65b12504cc669,':FORWARD').
xc_monotonicity(a65b12504cc669,':DEFAULT').
xc_creator(a65b12504cc669,'Cyc').
x_genls(x_Reptile,x_Vertebrate) :- x_cid(a65b12504cc66a).
xc_microtheory(a65b12504cc66a,x_BiologyMt).
xc_source_file(a65b12504cc66a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc66a,2413).
xc_kb_names(a65b12504cc66a,[]).
xc_mapping_rows(a65b12504cc66a,[]).
xc_direction(a65b12504cc66a,':FORWARD').
xc_monotonicity(a65b12504cc66a,':DEFAULT').
x_cyclistNotes('x_Clostridiaceae-Family',"This biological family has previously been classified with the Bacillaceae family and may still be in older texts.") :- x_cid(a65b12504cc66b).
xc_microtheory(a65b12504cc66b,x_BiologyMt).
xc_source_file(a65b12504cc66b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc66b,2419).
xc_kb_names(a65b12504cc66b,[]).
xc_mapping_rows(a65b12504cc66b,[]).
xc_direction(a65b12504cc66b,':FORWARD').
xc_monotonicity(a65b12504cc66b,':DEFAULT').
xc_creator(a65b12504cc66b,'Cyc').
x_comment(x_NonSporeFormingBacterium,"A collection, a specialization of #$Bacterium. The collection of bacteria that are not capable of forming spores.") :- x_cid(a65b12504cc66c).
xc_microtheory(a65b12504cc66c,x_BiologyMt).
xc_source_file(a65b12504cc66c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc66c,2425).
xc_kb_names(a65b12504cc66c,[]).
xc_mapping_rows(a65b12504cc66c,[]).
xc_direction(a65b12504cc66c,':FORWARD').
xc_monotonicity(a65b12504cc66c,':DEFAULT').
xc_creator(a65b12504cc66c,'Cyc').
xc_creation_date(a65b12504cc66c,163214).
x_resultIsa('x_SKF-58570131',x_AnimalBodyPart) :- x_cid(a65b12504cc66d).
xc_microtheory(a65b12504cc66d,x_BiologyMt).
xc_source_file(a65b12504cc66d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc66d,2431).
xc_kb_names(a65b12504cc66d,[]).
xc_mapping_rows(a65b12504cc66d,[]).
xc_direction(a65b12504cc66d,':FORWARD').
xc_monotonicity(a65b12504cc66d,':DEFAULT').
xc_creator(a65b12504cc66d,'Cyc').
x_isa(x_SporeGermination,x_DefaultDisjointScriptType) :- x_cid(a65b12504cc66e).
xc_microtheory(a65b12504cc66e,x_BiologyMt).
xc_source_file(a65b12504cc66e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc66e,2437).
xc_kb_names(a65b12504cc66e,[]).
xc_mapping_rows(a65b12504cc66e,[]).
xc_direction(a65b12504cc66e,':FORWARD').
xc_monotonicity(a65b12504cc66e,':MONOTONIC').
xc_creator(a65b12504cc66e,'Cyc').
xc_creation_date(a65b12504cc66e,172430).
x_arg2Isa(x_exposureToType,x_TemporalStuffType) :- x_cid(a65b12504cc66f).
xc_microtheory(a65b12504cc66f,x_BiologyMt).
xc_source_file(a65b12504cc66f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc66f,2443).
xc_kb_names(a65b12504cc66f,[]).
xc_mapping_rows(a65b12504cc66f,[]).
xc_direction(a65b12504cc66f,':FORWARD').
xc_monotonicity(a65b12504cc66f,':MONOTONIC').
xc_creator(a65b12504cc66f,'Cyc').
xc_creation_date(a65b12504cc66f,211113).
x_arg3Format(x_ingestingToxicityFor,x_IntervalEntry) :- x_cid(a65b12504cc670).
xc_microtheory(a65b12504cc670,x_BiologyMt).
xc_source_file(a65b12504cc670,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc670,2449).
xc_kb_names(a65b12504cc670,[]).
xc_mapping_rows(a65b12504cc670,[]).
xc_direction(a65b12504cc670,':FORWARD').
xc_monotonicity(a65b12504cc670,':DEFAULT').
xc_creator(a65b12504cc670,'Cyc').
xc_creation_date(a65b12504cc670,184610).
x_isa('x_SKF-51781280',x_FixedAritySkolemFuncN) :- x_cid(a65b12504cc671).
xc_microtheory(a65b12504cc671,x_BiologyMt).
xc_source_file(a65b12504cc671,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc671,2455).
xc_kb_names(a65b12504cc671,[]).
xc_mapping_rows(a65b12504cc671,[]).
xc_direction(a65b12504cc671,':FORWARD').
xc_monotonicity(a65b12504cc671,':MONOTONIC').
xc_creator(a65b12504cc671,'Cyc').
x_argIsa(x_exposureOfObjectToSubstanceType,3,x_TemporalStuffType) :- x_cid(a65b12504cc672).
xc_microtheory(a65b12504cc672,x_BiologyMt).
xc_source_file(a65b12504cc672,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc672,2461).
xc_kb_names(a65b12504cc672,[]).
xc_mapping_rows(a65b12504cc672,[]).
xc_direction(a65b12504cc672,':FORWARD').
xc_monotonicity(a65b12504cc672,':MONOTONIC').
x_isa(x_AttemptingFn(x_Punishing),x_Collection) :- x_cid(a65b12504cc673).
xc_microtheory(a65b12504cc673,x_BiologyMt).
xc_source_file(a65b12504cc673,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc673,2467).
xc_kb_names(a65b12504cc673,[]).
xc_mapping_rows(a65b12504cc673,[]).
xc_direction(a65b12504cc673,':FORWARD').
xc_monotonicity(a65b12504cc673,':DEFAULT').
x_isa(x_HairMobFn,x_UnaryFunction) :- x_cid(a65b12504cc674).
xc_microtheory(a65b12504cc674,x_BiologyMt).
xc_source_file(a65b12504cc674,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc674,2474).
xc_kb_names(a65b12504cc674,[]).
xc_mapping_rows(a65b12504cc674,[]).
xc_direction(a65b12504cc674,':FORWARD').
xc_monotonicity(a65b12504cc674,':MONOTONIC').
xc_creator(a65b12504cc674,'Cyc').
xc_creation_date(a65b12504cc674,101635).
x_isa(x_InstantiationInstanceFn(x_exposureToType,x_TheSet(2)),x_Individual) :- x_cid(a65b12504cc675).
xc_microtheory(a65b12504cc675,x_BiologyMt).
xc_source_file(a65b12504cc675,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc675,2480).
xc_kb_names(a65b12504cc675,[]).
xc_mapping_rows(a65b12504cc675,[]).
xc_direction(a65b12504cc675,':FORWARD').
xc_monotonicity(a65b12504cc675,':DEFAULT').
x_implies(x_exposureOfObjectToSubstanceType(V1,V2,V3),x_objectExposed(V1,V2)) :- x_cid(a65b12504cc676,V1,V2,V3).
xc_microtheory(a65b12504cc676,x_BiologyMt).
xc_source_file(a65b12504cc676,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc676,2488).
xc_kb_names(a65b12504cc676,["?EXPOSURE","?OBJECT","?CONTAMINANT-TYPE"]).
xc_mapping_rows(a65b12504cc676,['implication-implies']).
xc_direction(a65b12504cc676,':BACKWARD').
xc_monotonicity(a65b12504cc676,':DEFAULT').
xc_creator(a65b12504cc676,'Cyc').
xc_creation_date(a65b12504cc676,163147).
x_argGenl(x_InstantiationInstanceFn(x_organismTypeCanLethallyInfect,x_TheSet(1)),2,x_BiologicalLivingObject) :- x_cid(a65b12504cc677).
xc_microtheory(a65b12504cc677,x_BiologyMt).
xc_source_file(a65b12504cc677,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc677,2496).
xc_kb_names(a65b12504cc677,[]).
xc_mapping_rows(a65b12504cc677,[]).
xc_direction(a65b12504cc677,':FORWARD').
xc_monotonicity(a65b12504cc677,':DEFAULT').
x_relationAllExistsMax(x_anatomicalParts,'x_Organism-Whole',x_Liver,1) :- x_cid(a65b12504cc678).
xc_microtheory(a65b12504cc678,x_BiologyMt).
xc_source_file(a65b12504cc678,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc678,2504).
xc_kb_names(a65b12504cc678,[]).
xc_mapping_rows(a65b12504cc678,[]).
xc_direction(a65b12504cc678,':FORWARD').
xc_monotonicity(a65b12504cc678,':DEFAULT').
x_isa(x_RespiratorySystem,x_UniqueAnatomicalPartType) :- x_cid(a65b12504cc679).
xc_microtheory(a65b12504cc679,x_BiologyMt).
xc_source_file(a65b12504cc679,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc679,2510).
xc_kb_names(a65b12504cc679,[]).
xc_mapping_rows(a65b12504cc679,[]).
xc_direction(a65b12504cc679,':FORWARD').
xc_monotonicity(a65b12504cc679,':DEFAULT').
x_genls(x_SmugglingFn('x_Anthrax-Bacterium'),x_GuidingAMovingObject) :- x_cid(a65b12504cc67a).
xc_microtheory(a65b12504cc67a,x_BiologyMt).
xc_source_file(a65b12504cc67a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc67a,2516).
xc_kb_names(a65b12504cc67a,[]).
xc_mapping_rows(a65b12504cc67a,[]).
xc_direction(a65b12504cc67a,':FORWARD').
xc_monotonicity(a65b12504cc67a,':DEFAULT').
x_genls(x_VegetativeCell,x_MoneraKingdom) :- x_cid(a65b12504cc67b).
xc_microtheory(a65b12504cc67b,x_BiologyMt).
xc_source_file(a65b12504cc67b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc67b,2523).
xc_kb_names(a65b12504cc67b,[]).
xc_mapping_rows(a65b12504cc67b,[]).
xc_direction(a65b12504cc67b,':FORWARD').
xc_monotonicity(a65b12504cc67b,':DEFAULT').
xc_creator(a65b12504cc67b,'Cyc').
x_comment(x_CoccusBacterium,"A specialization of #$Bacterium whose instances are characterized by having spherical shape.") :- x_cid(a65b12504cc67c).
xc_microtheory(a65b12504cc67c,x_BiologyMt).
xc_source_file(a65b12504cc67c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc67c,2529).
xc_kb_names(a65b12504cc67c,[]).
xc_mapping_rows(a65b12504cc67c,[]).
xc_direction(a65b12504cc67c,':FORWARD').
xc_monotonicity(a65b12504cc67c,':MONOTONIC').
xc_creator(a65b12504cc67c,'Cyc').
xc_creation_date(a65b12504cc67c,173323).
x_relationAllExistsMax(x_anatomicalParts,'x_Organism-Whole',x_Torso,1) :- x_cid(a65b12504cc67d).
xc_microtheory(a65b12504cc67d,x_BiologyMt).
xc_source_file(a65b12504cc67d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc67d,2535).
xc_kb_names(a65b12504cc67d,[]).
xc_mapping_rows(a65b12504cc67d,[]).
xc_direction(a65b12504cc67d,':FORWARD').
xc_monotonicity(a65b12504cc67d,':DEFAULT').
x_genls(x_GramNegativeBacterium,x_ProkaryoticCell) :- x_cid(a65b12504cc67e).
xc_microtheory(a65b12504cc67e,x_BiologyMt).
xc_source_file(a65b12504cc67e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc67e,2541).
xc_kb_names(a65b12504cc67e,[]).
xc_mapping_rows(a65b12504cc67e,[]).
xc_direction(a65b12504cc67e,':FORWARD').
xc_monotonicity(a65b12504cc67e,':DEFAULT').
xc_creator(a65b12504cc67e,'Cyc').
x_isa(x_Inhaling,x_DefaultDisjointScriptType) :- x_cid(a65b12504cc67f).
xc_microtheory(a65b12504cc67f,x_BiologyMt).
xc_source_file(a65b12504cc67f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc67f,2547).
xc_kb_names(a65b12504cc67f,[]).
xc_mapping_rows(a65b12504cc67f,[]).
xc_direction(a65b12504cc67f,':FORWARD').
xc_monotonicity(a65b12504cc67f,':MONOTONIC').
xc_creator(a65b12504cc67f,'Cyc').
x_isa(x_infectionLocalizedIn,x_TernaryPredicate) :- x_cid(a65b12504cc680).
xc_microtheory(a65b12504cc680,x_BiologyMt).
xc_source_file(a65b12504cc680,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc680,2553).
xc_kb_names(a65b12504cc680,[]).
xc_mapping_rows(a65b12504cc680,[]).
xc_direction(a65b12504cc680,':FORWARD').
xc_monotonicity(a65b12504cc680,':MONOTONIC').
xc_creator(a65b12504cc680,'Cyc').
xc_creation_date(a65b12504cc680,113419).
x_arg2Genl(x_contaminatedWithMicroorganismType,'x_Organism-Whole') :- x_cid(a65b12504cc681).
xc_microtheory(a65b12504cc681,x_BiologyMt).
xc_source_file(a65b12504cc681,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc681,2559).
xc_kb_names(a65b12504cc681,[]).
xc_mapping_rows(a65b12504cc681,[]).
xc_direction(a65b12504cc681,':FORWARD').
xc_monotonicity(a65b12504cc681,':DEFAULT').
xc_creator(a65b12504cc681,'Cyc').
x_arg1Genl(x_ScatFn,'x_Organism-Whole') :- x_cid(a65b12504cc682).
xc_microtheory(a65b12504cc682,x_BiologyMt).
xc_source_file(a65b12504cc682,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc682,2565).
xc_kb_names(a65b12504cc682,[]).
xc_mapping_rows(a65b12504cc682,[]).
xc_direction(a65b12504cc682,':FORWARD').
xc_monotonicity(a65b12504cc682,':MONOTONIC').
xc_creator(a65b12504cc682,'Cyc').
xc_creation_date(a65b12504cc682,101804).
x_genls(x_Vertebrate,x_ChordataPhylum) :- x_cid(a65b12504cc683).
xc_microtheory(a65b12504cc683,x_BiologyMt).
xc_source_file(a65b12504cc683,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc683,2571).
xc_kb_names(a65b12504cc683,[]).
xc_mapping_rows(a65b12504cc683,[]).
xc_direction(a65b12504cc683,':FORWARD').
xc_monotonicity(a65b12504cc683,':DEFAULT').
x_genls(x_EndosporingEvent,x_IntrinsicStateChangeEvent) :- x_cid(a65b12504cc684).
xc_microtheory(a65b12504cc684,x_BiologyMt).
xc_source_file(a65b12504cc684,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc684,2577).
xc_kb_names(a65b12504cc684,[]).
xc_mapping_rows(a65b12504cc684,[]).
xc_direction(a65b12504cc684,':FORWARD').
xc_monotonicity(a65b12504cc684,':MONOTONIC').
xc_creator(a65b12504cc684,'Cyc').
x_comment(x_SporeFormingBacterium,"A collection, a specialization of #$Bacterium. The collection of bacteria. that are capable to form spores. When a group of these bacteria is placed in an hostile environment, some of them may form a single internal spore, #$Endospore liberated when the\nmother cell undergoes autolysis.") :- x_cid(a65b12504cc685).
xc_microtheory(a65b12504cc685,x_BiologyMt).
xc_source_file(a65b12504cc685,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc685,2583).
xc_kb_names(a65b12504cc685,[]).
xc_mapping_rows(a65b12504cc685,[]).
xc_direction(a65b12504cc685,':FORWARD').
xc_monotonicity(a65b12504cc685,':DEFAULT').
xc_creator(a65b12504cc685,'Cyc').
xc_creation_date(a65b12504cc685,163214).
x_comment('x_Clostridiaceae-Family',"A collection of #$Bacterium. A #$BiologicalFamily formed in the\n#$MoneraKingdom.  This family contains #$Clostridium-Genus.") :- x_cid(a65b12504cc686).
xc_microtheory(a65b12504cc686,x_BiologyMt).
xc_source_file(a65b12504cc686,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc686,2590).
xc_kb_names(a65b12504cc686,[]).
xc_mapping_rows(a65b12504cc686,[]).
xc_direction(a65b12504cc686,':FORWARD').
xc_monotonicity(a65b12504cc686,':DEFAULT').
xc_creator(a65b12504cc686,'Cyc').
x_arity('x_SKF-58570131',3) :- x_cid(a65b12504cc687).
xc_microtheory(a65b12504cc687,x_BiologyMt).
xc_source_file(a65b12504cc687,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc687,2597).
xc_kb_names(a65b12504cc687,[]).
xc_mapping_rows(a65b12504cc687,[]).
xc_direction(a65b12504cc687,':FORWARD').
xc_monotonicity(a65b12504cc687,':MONOTONIC').
xc_creator(a65b12504cc687,'Cyc').
x_genls(x_AntibodyIgG,x_Antibody) :- x_cid(a65b12504cc688).
xc_microtheory(a65b12504cc688,x_BiologyMt).
xc_source_file(a65b12504cc688,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc688,2603).
xc_kb_names(a65b12504cc688,[]).
xc_mapping_rows(a65b12504cc688,[]).
xc_direction(a65b12504cc688,':FORWARD').
xc_monotonicity(a65b12504cc688,':MONOTONIC').
xc_creator(a65b12504cc688,'Cyc').
x_isa(x_SporeGermination,x_TemporalObjectType) :- x_cid(a65b12504cc689).
xc_microtheory(a65b12504cc689,x_BiologyMt).
xc_source_file(a65b12504cc689,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc689,2609).
xc_kb_names(a65b12504cc689,[]).
xc_mapping_rows(a65b12504cc689,[]).
xc_direction(a65b12504cc689,':FORWARD').
xc_monotonicity(a65b12504cc689,':MONOTONIC').
xc_creator(a65b12504cc689,'Cyc').
xc_creation_date(a65b12504cc689,172408).
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_DigestiveSystem,1) :- x_cid(a65b12504cc68a).
xc_microtheory(a65b12504cc68a,x_BiologyMt).
xc_source_file(a65b12504cc68a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc68a,2615).
xc_kb_names(a65b12504cc68a,[]).
xc_mapping_rows(a65b12504cc68a,[]).
xc_direction(a65b12504cc68a,':FORWARD').
xc_monotonicity(a65b12504cc68a,':DEFAULT').
xc_creator(a65b12504cc68a,'Cyc').
x_arity(x_stuffInExposureEvent,2) :- x_cid(a65b12504cc68b).
xc_microtheory(a65b12504cc68b,x_BiologyMt).
xc_source_file(a65b12504cc68b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc68b,2621).
xc_kb_names(a65b12504cc68b,[]).
xc_mapping_rows(a65b12504cc68b,[]).
xc_direction(a65b12504cc68b,':FORWARD').
xc_monotonicity(a65b12504cc68b,':DEFAULT').
x_arg3Isa(x_exposureOfObjectToSubstanceType,x_TemporalStuffType) :- x_cid(a65b12504cc68c).
xc_microtheory(a65b12504cc68c,x_BiologyMt).
xc_source_file(a65b12504cc68c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc68c,2627).
xc_kb_names(a65b12504cc68c,[]).
xc_mapping_rows(a65b12504cc68c,[]).
xc_direction(a65b12504cc68c,':FORWARD').
xc_monotonicity(a65b12504cc68c,':MONOTONIC').
xc_creator(a65b12504cc68c,'Cyc').
xc_creation_date(a65b12504cc68c,165745).
x_isa(x_HairMobFn,x_ReifiableFunction) :- x_cid(a65b12504cc68d).
xc_microtheory(a65b12504cc68d,x_BiologyMt).
xc_source_file(a65b12504cc68d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc68d,2633).
xc_kb_names(a65b12504cc68d,[]).
xc_mapping_rows(a65b12504cc68d,[]).
xc_direction(a65b12504cc68d,':FORWARD').
xc_monotonicity(a65b12504cc68d,':MONOTONIC').
xc_creator(a65b12504cc68d,'Cyc').
xc_creation_date(a65b12504cc68d,101635).
x_isa(x_InstantiationInstanceFn(x_exposureToType,x_TheSet(2)),x_FixedArityRelation) :- x_cid(a65b12504cc68e).
xc_microtheory(a65b12504cc68e,x_BiologyMt).
xc_source_file(a65b12504cc68e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc68e,2639).
xc_kb_names(a65b12504cc68e,[]).
xc_mapping_rows(a65b12504cc68e,[]).
xc_direction(a65b12504cc68e,':FORWARD').
xc_monotonicity(a65b12504cc68e,':DEFAULT').
x_implies(x_exposureOfObjectToSubstanceType(V1,V2,V3),x_exposureToType(V1,V3)) :- x_cid(a65b12504cc68f,V1,V2,V3).
xc_microtheory(a65b12504cc68f,x_BiologyMt).
xc_source_file(a65b12504cc68f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc68f,2647).
xc_kb_names(a65b12504cc68f,["?EXPOSURE","?OBJECT","?CONTAMINANT-TYPE"]).
xc_mapping_rows(a65b12504cc68f,['implication-implies']).
xc_direction(a65b12504cc68f,':BACKWARD').
xc_monotonicity(a65b12504cc68f,':DEFAULT').
xc_creator(a65b12504cc68f,'Cyc').
xc_creation_date(a65b12504cc68f,163147).
x_arity(x_organismTypeCanLethallyInfect,2) :- x_cid(a65b12504cc690).
xc_microtheory(a65b12504cc690,x_BiologyMt).
xc_source_file(a65b12504cc690,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc690,2655).
xc_kb_names(a65b12504cc690,[]).
xc_mapping_rows(a65b12504cc690,[]).
xc_direction(a65b12504cc690,':FORWARD').
xc_monotonicity(a65b12504cc690,':DEFAULT').
x_argGenl(x_killedByExposure,2,x_PartiallyTangible) :- x_cid(a65b12504cc691).
xc_microtheory(a65b12504cc691,x_BiologyMt).
xc_source_file(a65b12504cc691,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc691,2661).
xc_kb_names(a65b12504cc691,[]).
xc_mapping_rows(a65b12504cc691,[]).
xc_direction(a65b12504cc691,':FORWARD').
xc_monotonicity(a65b12504cc691,':MONOTONIC').
x_isa(x_BacteriumTypeBySporulationAbility,x_SiblingDisjointCollection) :- x_cid(a65b12504cc692).
xc_microtheory(a65b12504cc692,x_BiologyMt).
xc_source_file(a65b12504cc692,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc692,2667).
xc_kb_names(a65b12504cc692,[]).
xc_mapping_rows(a65b12504cc692,[]).
xc_direction(a65b12504cc692,':FORWARD').
xc_monotonicity(a65b12504cc692,':DEFAULT').
xc_creator(a65b12504cc692,'Cyc').
x_comment(x_CellularImmuneResponse,"A collection, spec of #$ImmuneResponse. Those #$ImmuneResponse\nthat are cell-mediated, see #$Lymphocyte, #$Antigen ") :- x_cid(a65b12504cc693).
xc_microtheory(a65b12504cc693,x_BiologyMt).
xc_source_file(a65b12504cc693,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc693,2673).
xc_kb_names(a65b12504cc693,[]).
xc_mapping_rows(a65b12504cc693,[]).
xc_direction(a65b12504cc693,':FORWARD').
xc_monotonicity(a65b12504cc693,':DEFAULT').
xc_creator(a65b12504cc693,'Cyc').
x_cyclistNotes(x_CoccusBacterium,"Strictly speaking, this morphological characterization applies only to instances of Eubacteria.  Appropriate adjustments will be made as our taxonomy grows in sophistication.") :- x_cid(a65b12504cc694).
xc_microtheory(a65b12504cc694,x_BiologyMt).
xc_source_file(a65b12504cc694,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc694,2680).
xc_kb_names(a65b12504cc694,[]).
xc_mapping_rows(a65b12504cc694,[]).
xc_direction(a65b12504cc694,':FORWARD').
xc_monotonicity(a65b12504cc694,':MONOTONIC').
xc_creator(a65b12504cc694,'Cyc').
xc_creation_date(a65b12504cc694,173347).
x_genls(x_GramNegativeBacterium,x_MoneraKingdom) :- x_cid(a65b12504cc695).
xc_microtheory(a65b12504cc695,x_BiologyMt).
xc_source_file(a65b12504cc695,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc695,2686).
xc_kb_names(a65b12504cc695,[]).
xc_mapping_rows(a65b12504cc695,[]).
xc_direction(a65b12504cc695,':FORWARD').
xc_monotonicity(a65b12504cc695,':DEFAULT').
xc_creator(a65b12504cc695,'Cyc').
x_genls(x_Herbivore,x_Animal) :- x_cid(a65b12504cc696).
xc_microtheory(a65b12504cc696,x_BiologyMt).
xc_source_file(a65b12504cc696,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc696,2692).
xc_kb_names(a65b12504cc696,[]).
xc_mapping_rows(a65b12504cc696,[]).
xc_direction(a65b12504cc696,':FORWARD').
xc_monotonicity(a65b12504cc696,':MONOTONIC').
xc_creator(a65b12504cc696,'Cyc').
x_isa(x_Heart,x_UniqueAnatomicalPartType) :- x_cid(a65b12504cc697).
xc_microtheory(a65b12504cc697,x_BiologyMt).
xc_source_file(a65b12504cc697,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc697,2698).
xc_kb_names(a65b12504cc697,[]).
xc_mapping_rows(a65b12504cc697,[]).
xc_direction(a65b12504cc697,':FORWARD').
xc_monotonicity(a65b12504cc697,':DEFAULT').
x_argGenl(x_contaminatedWithMicroorganismType,2,x_MicroscopicScaleObject) :- x_cid(a65b12504cc698).
xc_microtheory(a65b12504cc698,x_BiologyMt).
xc_source_file(a65b12504cc698,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc698,2704).
xc_kb_names(a65b12504cc698,[]).
xc_mapping_rows(a65b12504cc698,[]).
xc_direction(a65b12504cc698,':FORWARD').
xc_monotonicity(a65b12504cc698,':DEFAULT').
x_argIsa(x_ScatFn,1,x_Collection) :- x_cid(a65b12504cc699).
xc_microtheory(a65b12504cc699,x_BiologyMt).
xc_source_file(a65b12504cc699,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc699,2710).
xc_kb_names(a65b12504cc699,[]).
xc_mapping_rows(a65b12504cc699,[]).
xc_direction(a65b12504cc699,':FORWARD').
xc_monotonicity(a65b12504cc699,':MONOTONIC').
x_genls(x_ChordataPhylum,x_Animal) :- x_cid(a65b12504cc69a).
xc_microtheory(a65b12504cc69a,x_BiologyMt).
xc_source_file(a65b12504cc69a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc69a,2716).
xc_kb_names(a65b12504cc69a,[]).
xc_mapping_rows(a65b12504cc69a,[]).
xc_direction(a65b12504cc69a,':FORWARD').
xc_monotonicity(a65b12504cc69a,':DEFAULT').
x_genls('x_Clostridiaceae-Family',x_BacillusBacterium) :- x_cid(a65b12504cc69b).
xc_microtheory(a65b12504cc69b,x_BiologyMt).
xc_source_file(a65b12504cc69b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc69b,2722).
xc_kb_names(a65b12504cc69b,[]).
xc_mapping_rows(a65b12504cc69b,[]).
xc_direction(a65b12504cc69b,':FORWARD').
xc_monotonicity(a65b12504cc69b,':MONOTONIC').
xc_creator(a65b12504cc69b,'Cyc').
x_superTaxons(x_Protozoan,x_ProtistaKingdom) :- x_cid(a65b12504cc69c).
xc_microtheory(a65b12504cc69c,x_BiologyMt).
xc_source_file(a65b12504cc69c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc69c,2728).
xc_kb_names(a65b12504cc69c,[]).
xc_mapping_rows(a65b12504cc69c,[]).
xc_direction(a65b12504cc69c,':FORWARD').
xc_monotonicity(a65b12504cc69c,':DEFAULT').
xc_creator(a65b12504cc69c,'Cyc').
x_isa(x_FaceOfAnimal,x_UniqueAnatomicalPartType) :- x_cid(a65b12504cc69d).
xc_microtheory(a65b12504cc69d,x_BiologyMt).
xc_source_file(a65b12504cc69d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc69d,2734).
xc_kb_names(a65b12504cc69d,[]).
xc_mapping_rows(a65b12504cc69d,[]).
xc_direction(a65b12504cc69d,':FORWARD').
xc_monotonicity(a65b12504cc69d,':DEFAULT').
x_isa('x_SKF-58570131',x_FixedAritySkolemFunction) :- x_cid(a65b12504cc69e).
xc_microtheory(a65b12504cc69e,x_BiologyMt).
xc_source_file(a65b12504cc69e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc69e,2740).
xc_kb_names(a65b12504cc69e,[]).
xc_mapping_rows(a65b12504cc69e,[]).
xc_direction(a65b12504cc69e,':FORWARD').
xc_monotonicity(a65b12504cc69e,':MONOTONIC').
xc_creator(a65b12504cc69e,'Cyc').
x_comment(x_BacterialSporeGermination,"A collection of events. During each #$BacterialSporeGermination, a bacterial spore [see #$Spore-DormantBacterium] germinates to a single #$VegetativeCell. These complex events may occur once spores have found suitable environment for germination.") :- x_cid(a65b12504cc69f).
xc_microtheory(a65b12504cc69f,x_BiologyMt).
xc_source_file(a65b12504cc69f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc69f,2746).
xc_kb_names(a65b12504cc69f,[]).
xc_mapping_rows(a65b12504cc69f,[]).
xc_direction(a65b12504cc69f,':FORWARD').
xc_monotonicity(a65b12504cc69f,':DEFAULT').
xc_creator(a65b12504cc69f,'Cyc').
x_isa(x_CanineAnimal,x_BiologicalTaxon) :- x_cid(a65b12504cc6a0).
xc_microtheory(a65b12504cc6a0,x_BiologyMt).
xc_source_file(a65b12504cc6a0,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6a0,2752).
xc_kb_names(a65b12504cc6a0,[]).
xc_mapping_rows(a65b12504cc6a0,[]).
xc_direction(a65b12504cc6a0,':FORWARD').
xc_monotonicity(a65b12504cc6a0,':MONOTONIC').
xc_creator(a65b12504cc6a0,'Cyc').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole','x_Chest-BodyPart',1) :- x_cid(a65b12504cc6a1).
xc_microtheory(a65b12504cc6a1,x_BiologyMt).
xc_source_file(a65b12504cc6a1,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6a1,2758).
xc_kb_names(a65b12504cc6a1,[]).
xc_mapping_rows(a65b12504cc6a1,[]).
xc_direction(a65b12504cc6a1,':FORWARD').
xc_monotonicity(a65b12504cc6a1,':DEFAULT').
xc_creator(a65b12504cc6a1,'Cyc').
x_comment(x_Macrophage,"A subclass of #$WhiteBloodCell that ingest microbes, #$Antigens\nand other substances. Not found in #$Blood, they resides where body organs\ninterface with bloodstream or the outside world.") :- x_cid(a65b12504cc6a2).
xc_microtheory(a65b12504cc6a2,x_BiologyMt).
xc_source_file(a65b12504cc6a2,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6a2,2764).
xc_kb_names(a65b12504cc6a2,[]).
xc_mapping_rows(a65b12504cc6a2,[]).
xc_direction(a65b12504cc6a2,':FORWARD').
xc_monotonicity(a65b12504cc6a2,':DEFAULT').
xc_creator(a65b12504cc6a2,'Cyc').
x_isa(x_stuffInExposureEvent,x_ActorSlot) :- x_cid(a65b12504cc6a3).
xc_microtheory(a65b12504cc6a3,x_BiologyMt).
xc_source_file(a65b12504cc6a3,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6a3,2772).
xc_kb_names(a65b12504cc6a3,[]).
xc_mapping_rows(a65b12504cc6a3,[]).
xc_direction(a65b12504cc6a3,':FORWARD').
xc_monotonicity(a65b12504cc6a3,':MONOTONIC').
xc_creator(a65b12504cc6a3,'Cyc').
xc_creation_date(a65b12504cc6a3,94229).
x_comment(x_objectExposed,"(objectExposed EXPOSURE OBJECT) means that during EXPOSURE, the\nobject that is exposed is OBJECT.") :- x_cid(a65b12504cc6a4).
xc_microtheory(a65b12504cc6a4,x_BiologyMt).
xc_source_file(a65b12504cc6a4,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6a4,2778).
xc_kb_names(a65b12504cc6a4,[]).
xc_mapping_rows(a65b12504cc6a4,[]).
xc_direction(a65b12504cc6a4,':FORWARD').
xc_monotonicity(a65b12504cc6a4,':DEFAULT').
xc_creator(a65b12504cc6a4,'Cyc').
xc_creation_date(a65b12504cc6a4,163147).
x_completeCollectionExtent(x_BacteriumTypeByGramStain) :- x_cid(a65b12504cc6a5).
xc_microtheory(a65b12504cc6a5,x_BiologyMt).
xc_source_file(a65b12504cc6a5,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6a5,2785).
xc_kb_names(a65b12504cc6a5,[]).
xc_mapping_rows(a65b12504cc6a5,[]).
xc_direction(a65b12504cc6a5,':FORWARD').
xc_monotonicity(a65b12504cc6a5,':DEFAULT').
xc_creator(a65b12504cc6a5,'Cyc').
xc_creation_date(a65b12504cc6a5,153253).
x_isa(x_CanineAnimal,x_BiologicalFamily) :- x_cid(a65b12504cc6a6).
xc_microtheory(a65b12504cc6a6,x_BiologyMt).
xc_source_file(a65b12504cc6a6,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6a6,2791).
xc_kb_names(a65b12504cc6a6,[]).
xc_mapping_rows(a65b12504cc6a6,[]).
xc_direction(a65b12504cc6a6,':FORWARD').
xc_monotonicity(a65b12504cc6a6,':DEFAULT').
xc_creator(a65b12504cc6a6,'Cyc').
x_relationAllExistsMax(x_anatomicalParts,'x_Organism-Whole','x_Shell-AnimalBodyPart',1) :- x_cid(a65b12504cc6a7).
xc_microtheory(a65b12504cc6a7,x_BiologyMt).
xc_source_file(a65b12504cc6a7,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6a7,2797).
xc_kb_names(a65b12504cc6a7,[]).
xc_mapping_rows(a65b12504cc6a7,[]).
xc_direction(a65b12504cc6a7,':FORWARD').
xc_monotonicity(a65b12504cc6a7,':DEFAULT').
x_isa(x_AttemptingFn(x_MakingFn(x_WeaponOfMassDestruction)),x_Collection) :- x_cid(a65b12504cc6a8).
xc_microtheory(a65b12504cc6a8,x_BiologyMt).
xc_source_file(a65b12504cc6a8,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6a8,2803).
xc_kb_names(a65b12504cc6a8,[]).
xc_mapping_rows(a65b12504cc6a8,[]).
xc_direction(a65b12504cc6a8,':FORWARD').
xc_monotonicity(a65b12504cc6a8,':DEFAULT').
x_relationAllExistsMax(x_anatomicalParts,'x_Organism-Whole','x_Head-AnimalBodyPart',1) :- x_cid(a65b12504cc6a9).
xc_microtheory(a65b12504cc6a9,x_BiologyMt).
xc_source_file(a65b12504cc6a9,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6a9,2811).
xc_kb_names(a65b12504cc6a9,[]).
xc_mapping_rows(a65b12504cc6a9,[]).
xc_direction(a65b12504cc6a9,':FORWARD').
xc_monotonicity(a65b12504cc6a9,':DEFAULT').
x_comment(x_exposureOfObjectToSubstanceType,"(exposureOfObjectToSubstanceType EXPOSURE OBJECT\nCONTAMINANT-TYPE) means that during EXPOSURE, OBJECT is exposed to\nsubstance of the type CONTAMINANT-TYPE.") :- x_cid(a65b12504cc6aa).
xc_microtheory(a65b12504cc6aa,x_BiologyMt).
xc_source_file(a65b12504cc6aa,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6aa,2817).
xc_kb_names(a65b12504cc6aa,[]).
xc_mapping_rows(a65b12504cc6aa,[]).
xc_direction(a65b12504cc6aa,':FORWARD').
xc_monotonicity(a65b12504cc6aa,':DEFAULT').
xc_creator(a65b12504cc6aa,'Cyc').
xc_creation_date(a65b12504cc6aa,163147).
x_implies(x_and(x_isa(V1,x_BirthEvent),x_doneBy(V1,V2)),x_isa(V2,x_FemaleAnimal)) :- x_cid(a65b12504cc6ab,V1,V2).
xc_microtheory(a65b12504cc6ab,x_BiologyMt).
xc_source_file(a65b12504cc6ab,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6ab,2825).
xc_kb_names(a65b12504cc6ab,["?X","?Y"]).
xc_mapping_rows(a65b12504cc6ab,['implication-implies']).
xc_direction(a65b12504cc6ab,':BACKWARD').
xc_monotonicity(a65b12504cc6ab,':DEFAULT').
xc_creator(a65b12504cc6ab,'Cyc').
x_isa(x_organismTypeCanLethallyInfect,x_BinaryPredicate) :- x_cid(a65b12504cc6ac).
xc_microtheory(a65b12504cc6ac,x_BiologyMt).
xc_source_file(a65b12504cc6ac,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6ac,2835).
xc_kb_names(a65b12504cc6ac,[]).
xc_mapping_rows(a65b12504cc6ac,[]).
xc_direction(a65b12504cc6ac,':FORWARD').
xc_monotonicity(a65b12504cc6ac,':MONOTONIC').
xc_creator(a65b12504cc6ac,'Cyc').
xc_creation_date(a65b12504cc6ac,150535).
x_genls(x_GroupFn(x_Person),x_PartiallyTangible) :- x_cid(a65b12504cc6ad).
xc_microtheory(a65b12504cc6ad,x_BiologyMt).
xc_source_file(a65b12504cc6ad,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6ad,2841).
xc_kb_names(a65b12504cc6ad,[]).
xc_mapping_rows(a65b12504cc6ad,[]).
xc_direction(a65b12504cc6ad,':FORWARD').
xc_monotonicity(a65b12504cc6ad,':DEFAULT').
x_arity(x_InstantiationInstanceFn(x_organismTypeCanLethallyInfect,x_TheSet(1)),2) :- x_cid(a65b12504cc6ae).
xc_microtheory(a65b12504cc6ae,x_BiologyMt).
xc_source_file(a65b12504cc6ae,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6ae,2848).
xc_kb_names(a65b12504cc6ae,[]).
xc_mapping_rows(a65b12504cc6ae,[]).
xc_direction(a65b12504cc6ae,':FORWARD').
xc_monotonicity(a65b12504cc6ae,':DEFAULT').
x_arg2Genl(x_killedByExposure,x_PartiallyTangible) :- x_cid(a65b12504cc6af).
xc_microtheory(a65b12504cc6af,x_BiologyMt).
xc_source_file(a65b12504cc6af,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6af,2856).
xc_kb_names(a65b12504cc6af,[]).
xc_mapping_rows(a65b12504cc6af,[]).
xc_direction(a65b12504cc6af,':FORWARD').
xc_monotonicity(a65b12504cc6af,':MONOTONIC').
xc_creator(a65b12504cc6af,'Cyc').
x_genls(x_SmugglingFn('x_Anthrax-Bacterium'),x_DirectedTranslation) :- x_cid(a65b12504cc6b0).
xc_microtheory(a65b12504cc6b0,x_BiologyMt).
xc_source_file(a65b12504cc6b0,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6b0,2862).
xc_kb_names(a65b12504cc6b0,[]).
xc_mapping_rows(a65b12504cc6b0,[]).
xc_direction(a65b12504cc6b0,':FORWARD').
xc_monotonicity(a65b12504cc6b0,':DEFAULT').
x_relationAllExistsMax(x_anatomicalParts,'x_Organism-Whole',x_RespiratorySystem,1) :- x_cid(a65b12504cc6b1).
xc_microtheory(a65b12504cc6b1,x_BiologyMt).
xc_source_file(a65b12504cc6b1,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6b1,2869).
xc_kb_names(a65b12504cc6b1,[]).
xc_mapping_rows(a65b12504cc6b1,[]).
xc_direction(a65b12504cc6b1,':FORWARD').
xc_monotonicity(a65b12504cc6b1,':DEFAULT').
x_isa(x_BacteriumTypeBySporulationAbility,x_DisjointSetOrCollection) :- x_cid(a65b12504cc6b2).
xc_microtheory(a65b12504cc6b2,x_BiologyMt).
xc_source_file(a65b12504cc6b2,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6b2,2875).
xc_kb_names(a65b12504cc6b2,[]).
xc_mapping_rows(a65b12504cc6b2,[]).
xc_direction(a65b12504cc6b2,':FORWARD').
xc_monotonicity(a65b12504cc6b2,':DEFAULT').
xc_creator(a65b12504cc6b2,'Cyc').
x_genls(x_CellularImmuneResponse,x_ImmuneResponse) :- x_cid(a65b12504cc6b3).
xc_microtheory(a65b12504cc6b3,x_BiologyMt).
xc_source_file(a65b12504cc6b3,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6b3,2881).
xc_kb_names(a65b12504cc6b3,[]).
xc_mapping_rows(a65b12504cc6b3,[]).
xc_direction(a65b12504cc6b3,':FORWARD').
xc_monotonicity(a65b12504cc6b3,':MONOTONIC').
xc_creator(a65b12504cc6b3,'Cyc').
x_genls(x_BacterialSporeGermination,x_BiologicalDevelopmentEvent) :- x_cid(a65b12504cc6b4).
xc_microtheory(a65b12504cc6b4,x_BiologyMt).
xc_source_file(a65b12504cc6b4,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6b4,2887).
xc_kb_names(a65b12504cc6b4,[]).
xc_mapping_rows(a65b12504cc6b4,[]).
xc_direction(a65b12504cc6b4,':FORWARD').
xc_monotonicity(a65b12504cc6b4,':MONOTONIC').
xc_creator(a65b12504cc6b4,'Cyc').
x_genls('x_BacillusCereus-Species',x_BacillusBacterium) :- x_cid(a65b12504cc6b5).
xc_microtheory(a65b12504cc6b5,x_BiologyMt).
xc_source_file(a65b12504cc6b5,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6b5,2893).
xc_kb_names(a65b12504cc6b5,[]).
xc_mapping_rows(a65b12504cc6b5,[]).
xc_direction(a65b12504cc6b5,':FORWARD').
xc_monotonicity(a65b12504cc6b5,':DEFAULT').
xc_creator(a65b12504cc6b5,'Cyc').
x_arg2Genl(x_contaminatedWithMicroorganismType,x_MicroscopicScaleObject) :- x_cid(a65b12504cc6b6).
xc_microtheory(a65b12504cc6b6,x_BiologyMt).
xc_source_file(a65b12504cc6b6,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6b6,2899).
xc_kb_names(a65b12504cc6b6,[]).
xc_mapping_rows(a65b12504cc6b6,[]).
xc_direction(a65b12504cc6b6,':FORWARD').
xc_monotonicity(a65b12504cc6b6,':DEFAULT').
xc_creator(a65b12504cc6b6,'Cyc').
x_arg1Isa(x_ScatFn,x_Collection) :- x_cid(a65b12504cc6b7).
xc_microtheory(a65b12504cc6b7,x_BiologyMt).
xc_source_file(a65b12504cc6b7,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6b7,2905).
xc_kb_names(a65b12504cc6b7,[]).
xc_mapping_rows(a65b12504cc6b7,[]).
xc_direction(a65b12504cc6b7,':FORWARD').
xc_monotonicity(a65b12504cc6b7,':MONOTONIC').
xc_creator(a65b12504cc6b7,'Cyc').
xc_creation_date(a65b12504cc6b7,101804).
x_cyclistNotes(x_organismFoundInSubstance,"We may want to generalize this predicate to become a\ntype-type version of #$objectFoundInLocation.") :- x_cid(a65b12504cc6b8).
xc_microtheory(a65b12504cc6b8,x_BiologyMt).
xc_source_file(a65b12504cc6b8,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6b8,2911).
xc_kb_names(a65b12504cc6b8,[]).
xc_mapping_rows(a65b12504cc6b8,[]).
xc_direction(a65b12504cc6b8,':FORWARD').
xc_monotonicity(a65b12504cc6b8,':DEFAULT').
xc_creator(a65b12504cc6b8,'Cyc').
xc_creation_date(a65b12504cc6b8,223521).
x_isa(x_EndosporingEvent,x_TemporalStuffType) :- x_cid(a65b12504cc6b9).
xc_microtheory(a65b12504cc6b9,x_BiologyMt).
xc_source_file(a65b12504cc6b9,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6b9,2918).
xc_kb_names(a65b12504cc6b9,[]).
xc_mapping_rows(a65b12504cc6b9,[]).
xc_direction(a65b12504cc6b9,':FORWARD').
xc_monotonicity(a65b12504cc6b9,':MONOTONIC').
xc_creator(a65b12504cc6b9,'Cyc').
x_isa(x_SporeFormingBacterium,x_BacteriumTypeBySporulationAbility) :- x_cid(a65b12504cc6ba).
xc_microtheory(a65b12504cc6ba,x_BiologyMt).
xc_source_file(a65b12504cc6ba,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6ba,2924).
xc_kb_names(a65b12504cc6ba,[]).
xc_mapping_rows(a65b12504cc6ba,[]).
xc_direction(a65b12504cc6ba,':FORWARD').
xc_monotonicity(a65b12504cc6ba,':MONOTONIC').
xc_creator(a65b12504cc6ba,'Cyc').
xc_creation_date(a65b12504cc6ba,163214).
x_genls('x_Clostridiaceae-Family','x_Clostridiales-Order') :- x_cid(a65b12504cc6bb).
xc_microtheory(a65b12504cc6bb,x_BiologyMt).
xc_source_file(a65b12504cc6bb,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6bb,2930).
xc_kb_names(a65b12504cc6bb,[]).
xc_mapping_rows(a65b12504cc6bb,[]).
xc_direction(a65b12504cc6bb,':FORWARD').
xc_monotonicity(a65b12504cc6bb,':DEFAULT').
x_genlPreds(x_contaminatedWithMicroorganismType,x_carriesOrganismType) :- x_cid(a65b12504cc6bc).
xc_microtheory(a65b12504cc6bc,x_BiologyMt).
xc_source_file(a65b12504cc6bc,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6bc,2936).
xc_kb_names(a65b12504cc6bc,[]).
xc_mapping_rows(a65b12504cc6bc,[]).
xc_direction(a65b12504cc6bc,':FORWARD').
xc_monotonicity(a65b12504cc6bc,':MONOTONIC').
xc_creator(a65b12504cc6bc,'Cyc').
xc_creation_date(a65b12504cc6bc,123939).
x_superTaxons(x_Vertebrate,x_ChordataPhylum) :- x_cid(a65b12504cc6bd).
xc_microtheory(a65b12504cc6bd,x_BiologyMt).
xc_source_file(a65b12504cc6bd,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6bd,2942).
xc_kb_names(a65b12504cc6bd,[]).
xc_mapping_rows(a65b12504cc6bd,[]).
xc_direction(a65b12504cc6bd,':FORWARD').
xc_monotonicity(a65b12504cc6bd,':DEFAULT').
xc_creator(a65b12504cc6bd,'Cyc').
x_isa(x_AntibodyIgG,x_ChemicalCompoundType) :- x_cid(a65b12504cc6be).
xc_microtheory(a65b12504cc6be,x_BiologyMt).
xc_source_file(a65b12504cc6be,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6be,2948).
xc_kb_names(a65b12504cc6be,[]).
xc_mapping_rows(a65b12504cc6be,[]).
xc_direction(a65b12504cc6be,':FORWARD').
xc_monotonicity(a65b12504cc6be,':MONOTONIC').
xc_creator(a65b12504cc6be,'Cyc').
x_genls('x_Clostridium-Genus',x_SporeFormingBacterium) :- x_cid(a65b12504cc6bf).
xc_microtheory(a65b12504cc6bf,x_BiologyMt).
xc_source_file(a65b12504cc6bf,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6bf,2954).
xc_kb_names(a65b12504cc6bf,[]).
xc_mapping_rows(a65b12504cc6bf,[]).
xc_direction(a65b12504cc6bf,':FORWARD').
xc_monotonicity(a65b12504cc6bf,':MONOTONIC').
xc_creator(a65b12504cc6bf,'Cyc').
xc_creation_date(a65b12504cc6bf,143126).
x_sharedNotes(x_OrganismClassificationType,x_NoteOnOrganismClassification) :- x_cid(a65b12504cc6c0).
xc_microtheory(a65b12504cc6c0,x_BiologyMt).
xc_source_file(a65b12504cc6c0,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6c0,2960).
xc_kb_names(a65b12504cc6c0,[]).
xc_mapping_rows(a65b12504cc6c0,[]).
xc_direction(a65b12504cc6c0,':FORWARD').
xc_monotonicity(a65b12504cc6c0,':DEFAULT').
xc_creator(a65b12504cc6c0,'Cyc').
x_argGenl(x_ingestingToxicityFor,2,x_BiologicalLivingObject) :- x_cid(a65b12504cc6c1).
xc_microtheory(a65b12504cc6c1,x_BiologyMt).
xc_source_file(a65b12504cc6c1,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6c1,2966).
xc_kb_names(a65b12504cc6c1,[]).
xc_mapping_rows(a65b12504cc6c1,[]).
xc_direction(a65b12504cc6c1,':FORWARD').
xc_monotonicity(a65b12504cc6c1,':MONOTONIC').
x_implies(x_and(x_isa(V1,'x_Killing-Biological'),x_objectActedOn(V1,V2)),x_inputsDestroyed(V1,V2)) :- x_cid(a65b12504cc6c2,V1,V2).
xc_microtheory(a65b12504cc6c2,x_BiologyMt).
xc_source_file(a65b12504cc6c2,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6c2,2972).
xc_kb_names(a65b12504cc6c2,["?KILL","?ORG"]).
xc_mapping_rows(a65b12504cc6c2,['implication-implies']).
xc_direction(a65b12504cc6c2,':BACKWARD').
xc_monotonicity(a65b12504cc6c2,':DEFAULT').
xc_creator(a65b12504cc6c2,'Cyc').
x_isa(x_Insect,x_BiologicalClass) :- x_cid(a65b12504cc6c3).
xc_microtheory(a65b12504cc6c3,x_BiologyMt).
xc_source_file(a65b12504cc6c3,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6c3,2982).
xc_kb_names(a65b12504cc6c3,[]).
xc_mapping_rows(a65b12504cc6c3,[]).
xc_direction(a65b12504cc6c3,':FORWARD').
xc_monotonicity(a65b12504cc6c3,':DEFAULT').
xc_creator(a65b12504cc6c3,'Cyc').
x_argIsa(x_objectExposed,2,x_PartiallyTangible) :- x_cid(a65b12504cc6c4).
xc_microtheory(a65b12504cc6c4,x_BiologyMt).
xc_source_file(a65b12504cc6c4,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6c4,2988).
xc_kb_names(a65b12504cc6c4,[]).
xc_mapping_rows(a65b12504cc6c4,[]).
xc_direction(a65b12504cc6c4,':FORWARD').
xc_monotonicity(a65b12504cc6c4,':MONOTONIC').
x_genlPreds(x_stuffInhaled,x_objectActedOn) :- x_cid(a65b12504cc6c5).
xc_microtheory(a65b12504cc6c5,x_BiologyMt).
xc_source_file(a65b12504cc6c5,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6c5,2994).
xc_kb_names(a65b12504cc6c5,[]).
xc_mapping_rows(a65b12504cc6c5,[]).
xc_direction(a65b12504cc6c5,':FORWARD').
xc_monotonicity(a65b12504cc6c5,':MONOTONIC').
xc_creator(a65b12504cc6c5,'Cyc').
xc_creation_date(a65b12504cc6c5,160824).
x_isa(x_BacteriumTypeByGramStain,x_CollectionType) :- x_cid(a65b12504cc6c6).
xc_microtheory(a65b12504cc6c6,x_BiologyMt).
xc_source_file(a65b12504cc6c6,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6c6,3000).
xc_kb_names(a65b12504cc6c6,[]).
xc_mapping_rows(a65b12504cc6c6,[]).
xc_direction(a65b12504cc6c6,':FORWARD').
xc_monotonicity(a65b12504cc6c6,':DEFAULT').
x_isa(x_CirculatorySystem,x_UniqueAnatomicalPartType) :- x_cid(a65b12504cc6c7).
xc_microtheory(a65b12504cc6c7,x_BiologyMt).
xc_source_file(a65b12504cc6c7,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6c7,3006).
xc_kb_names(a65b12504cc6c7,[]).
xc_mapping_rows(a65b12504cc6c7,[]).
xc_direction(a65b12504cc6c7,':FORWARD').
xc_monotonicity(a65b12504cc6c7,':DEFAULT').
x_isa(x_Dog,x_BiologicalTaxon) :- x_cid(a65b12504cc6c8).
xc_microtheory(a65b12504cc6c8,x_BiologyMt).
xc_source_file(a65b12504cc6c8,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6c8,3012).
xc_kb_names(a65b12504cc6c8,[]).
xc_mapping_rows(a65b12504cc6c8,[]).
xc_direction(a65b12504cc6c8,':FORWARD').
xc_monotonicity(a65b12504cc6c8,':MONOTONIC').
xc_creator(a65b12504cc6c8,'Cyc').
x_argIsa(x_killedByExposure,2,x_TangibleStuffCompositionType) :- x_cid(a65b12504cc6c9).
xc_microtheory(a65b12504cc6c9,x_BiologyMt).
xc_source_file(a65b12504cc6c9,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6c9,3018).
xc_kb_names(a65b12504cc6c9,[]).
xc_mapping_rows(a65b12504cc6c9,[]).
xc_direction(a65b12504cc6c9,':FORWARD').
xc_monotonicity(a65b12504cc6c9,':MONOTONIC').
x_genls(x_SporeFormingBacterium,x_ProkaryoticCell) :- x_cid(a65b12504cc6ca).
xc_microtheory(a65b12504cc6ca,x_BiologyMt).
xc_source_file(a65b12504cc6ca,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6ca,3024).
xc_kb_names(a65b12504cc6ca,[]).
xc_mapping_rows(a65b12504cc6ca,[]).
xc_direction(a65b12504cc6ca,':FORWARD').
xc_monotonicity(a65b12504cc6ca,':DEFAULT').
xc_creator(a65b12504cc6ca,'Cyc').
x_genls('x_BacillusCereus-Species',x_SporeFormingBacterium) :- x_cid(a65b12504cc6cb).
xc_microtheory(a65b12504cc6cb,x_BiologyMt).
xc_source_file(a65b12504cc6cb,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6cb,3030).
xc_kb_names(a65b12504cc6cb,[]).
xc_mapping_rows(a65b12504cc6cb,[]).
xc_direction(a65b12504cc6cb,':FORWARD').
xc_monotonicity(a65b12504cc6cb,':DEFAULT').
xc_creator(a65b12504cc6cb,'Cyc').
x_isa(x_EndosporingEvent,x_SituationType) :- x_cid(a65b12504cc6cc).
xc_microtheory(a65b12504cc6cc,x_BiologyMt).
xc_source_file(a65b12504cc6cc,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6cc,3036).
xc_kb_names(a65b12504cc6cc,[]).
xc_mapping_rows(a65b12504cc6cc,[]).
xc_direction(a65b12504cc6cc,':FORWARD').
xc_monotonicity(a65b12504cc6cc,':DEFAULT').
xc_creator(a65b12504cc6cc,'Cyc').
x_comment(x_organismFoundInSubstance,"(#$organismFoundInSubstance ORGTYPE STUFFTYPE) means that instances of ORGTYPE can often be found in instances of STUFFTYPE, such that instances of STUFFTYPE constitute good or probable places to look for instances of ORGTYPE.") :- x_cid(a65b12504cc6cd).
xc_microtheory(a65b12504cc6cd,x_BiologyMt).
xc_source_file(a65b12504cc6cd,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6cd,3042).
xc_kb_names(a65b12504cc6cd,[]).
xc_mapping_rows(a65b12504cc6cd,[]).
xc_direction(a65b12504cc6cd,':FORWARD').
xc_monotonicity(a65b12504cc6cd,':DEFAULT').
xc_creator(a65b12504cc6cd,'Cyc').
xc_creation_date(a65b12504cc6cd,223521).
x_superTaxons('x_Clostridiaceae-Family','x_Clostridiales-Order') :- x_cid(a65b12504cc6ce).
xc_microtheory(a65b12504cc6ce,x_BiologyMt).
xc_source_file(a65b12504cc6ce,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6ce,3048).
xc_kb_names(a65b12504cc6ce,[]).
xc_mapping_rows(a65b12504cc6ce,[]).
xc_direction(a65b12504cc6ce,':FORWARD').
xc_monotonicity(a65b12504cc6ce,':DEFAULT').
xc_creator(a65b12504cc6ce,'Cyc').
x_cyclistNotes(x_carriesOrganismType,"Note that this relation does not imply the\nexistence of a #$TransportationEvent, although this may be implied in\ncases where the first argument is in motion.") :- x_cid(a65b12504cc6cf).
xc_microtheory(a65b12504cc6cf,x_BiologyMt).
xc_source_file(a65b12504cc6cf,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6cf,3054).
xc_kb_names(a65b12504cc6cf,[]).
xc_mapping_rows(a65b12504cc6cf,[]).
xc_direction(a65b12504cc6cf,':FORWARD').
xc_monotonicity(a65b12504cc6cf,':DEFAULT').
xc_creator(a65b12504cc6cf,'Cyc').
xc_creation_date(a65b12504cc6cf,123939).
x_implies(x_and(x_isa(V1,x_UniqueAnatomicalPartType),x_infectionLocalizedIn(V2,V3,V1)),x_actorPartsAffected(V3,x_BodyPartFn(V2,V1))) :- x_cid(a65b12504cc6d0,V1,V2,V3).
xc_microtheory(a65b12504cc6d0,x_BiologyMt).
xc_source_file(a65b12504cc6d0,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6d0,3062).
xc_kb_names(a65b12504cc6d0,["?PART-TYPE","?ORG","?INFECTION"]).
xc_mapping_rows(a65b12504cc6d0,['implication-implies']).
xc_direction(a65b12504cc6d0,':BACKWARD').
xc_monotonicity(a65b12504cc6d0,':DEFAULT').
xc_creator(a65b12504cc6d0,'Cyc').
xc_creation_date(a65b12504cc6d0,113419).
x_comment('x_ClostridiumBotulinum-Species',"A collection of #$Bacterium. A #$BiologicalSpecies formed under\nthe #$Clostridium-Genus in the #$MoneraKingdom.  These #$ProkaryoticCells\ncause #$Botulism.  They are found in soil, water\nsediment, and occasionally in animal feces.  C. botulinum is divided into\nseven strains, A - G, based on antigenic specificity of their individual\ntoxins.  All strains produce a neurotoxin of extraordinary toxicity: the\nestimated lethal dose for humans is less than 1 microgram.  Spores are\nhighly resistant to heat.") :- x_cid(a65b12504cc6d1).
xc_microtheory(a65b12504cc6d1,x_BiologyMt).
xc_source_file(a65b12504cc6d1,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6d1,3073).
xc_kb_names(a65b12504cc6d1,[]).
xc_mapping_rows(a65b12504cc6d1,[]).
xc_direction(a65b12504cc6d1,':FORWARD').
xc_monotonicity(a65b12504cc6d1,':DEFAULT').
xc_creator(a65b12504cc6d1,'Cyc').
x_genls(x_RickettsiaProwsecki,x_Rickettsia) :- x_cid(a65b12504cc6d2).
xc_microtheory(a65b12504cc6d2,x_BiologyMt).
xc_source_file(a65b12504cc6d2,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6d2,3086).
xc_kb_names(a65b12504cc6d2,[]).
xc_mapping_rows(a65b12504cc6d2,[]).
xc_direction(a65b12504cc6d2,':FORWARD').
xc_monotonicity(a65b12504cc6d2,':MONOTONIC').
xc_creator(a65b12504cc6d2,'Cyc').
xc_creation_date(a65b12504cc6d2,101633).
x_sharedNotes(x_BiologicalTaxon,x_NoteOnOrganismClassification) :- x_cid(a65b12504cc6d3).
xc_microtheory(a65b12504cc6d3,x_BiologyMt).
xc_source_file(a65b12504cc6d3,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6d3,3092).
xc_kb_names(a65b12504cc6d3,[]).
xc_mapping_rows(a65b12504cc6d3,[]).
xc_direction(a65b12504cc6d3,':FORWARD').
xc_monotonicity(a65b12504cc6d3,':DEFAULT').
xc_creator(a65b12504cc6d3,'Cyc').
x_arg2Genl(x_ingestingToxicityFor,x_BiologicalLivingObject) :- x_cid(a65b12504cc6d4).
xc_microtheory(a65b12504cc6d4,x_BiologyMt).
xc_source_file(a65b12504cc6d4,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6d4,3098).
xc_kb_names(a65b12504cc6d4,[]).
xc_mapping_rows(a65b12504cc6d4,[]).
xc_direction(a65b12504cc6d4,':FORWARD').
xc_monotonicity(a65b12504cc6d4,':MONOTONIC').
xc_creator(a65b12504cc6d4,'Cyc').
xc_creation_date(a65b12504cc6d4,184610).
x_arg2Isa(x_objectExposed,x_PartiallyTangible) :- x_cid(a65b12504cc6d5).
xc_microtheory(a65b12504cc6d5,x_BiologyMt).
xc_source_file(a65b12504cc6d5,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6d5,3104).
xc_kb_names(a65b12504cc6d5,[]).
xc_mapping_rows(a65b12504cc6d5,[]).
xc_direction(a65b12504cc6d5,':FORWARD').
xc_monotonicity(a65b12504cc6d5,':MONOTONIC').
xc_creator(a65b12504cc6d5,'Cyc').
xc_creation_date(a65b12504cc6d5,163147).
x_argIsa(x_stuffInhaled,2,x_PartiallyTangible) :- x_cid(a65b12504cc6d6).
xc_microtheory(a65b12504cc6d6,x_BiologyMt).
xc_source_file(a65b12504cc6d6,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6d6,3110).
xc_kb_names(a65b12504cc6d6,[]).
xc_mapping_rows(a65b12504cc6d6,[]).
xc_direction(a65b12504cc6d6,':FORWARD').
xc_monotonicity(a65b12504cc6d6,':MONOTONIC').
x_genls(x_BacteriumTypeByGramStain,x_OrganismClassificationType) :- x_cid(a65b12504cc6d7).
xc_microtheory(a65b12504cc6d7,x_BiologyMt).
xc_source_file(a65b12504cc6d7,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6d7,3116).
xc_kb_names(a65b12504cc6d7,[]).
xc_mapping_rows(a65b12504cc6d7,[]).
xc_direction(a65b12504cc6d7,':FORWARD').
xc_monotonicity(a65b12504cc6d7,':MONOTONIC').
xc_creator(a65b12504cc6d7,'Cyc').
xc_creation_date(a65b12504cc6d7,153228).
x_relationAllExistsMax(x_anatomicalParts,'x_Organism-Whole',x_CirculatorySystem,1) :- x_cid(a65b12504cc6d8).
xc_microtheory(a65b12504cc6d8,x_BiologyMt).
xc_source_file(a65b12504cc6d8,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6d8,3122).
xc_kb_names(a65b12504cc6d8,[]).
xc_mapping_rows(a65b12504cc6d8,[]).
xc_direction(a65b12504cc6d8,':FORWARD').
xc_monotonicity(a65b12504cc6d8,':DEFAULT').
x_comment(x_AerobicBacterium,"The collection of all instances of #$Bacterium that metabolize oxygen.") :- x_cid(a65b12504cc6d9).
xc_microtheory(a65b12504cc6d9,x_BiologyMt).
xc_source_file(a65b12504cc6d9,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6d9,3128).
xc_kb_names(a65b12504cc6d9,[]).
xc_mapping_rows(a65b12504cc6d9,[]).
xc_direction(a65b12504cc6d9,':FORWARD').
xc_monotonicity(a65b12504cc6d9,':MONOTONIC').
xc_creator(a65b12504cc6d9,'Cyc').
xc_creation_date(a65b12504cc6d9,162012).
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Ear,1) :- x_cid(a65b12504cc6da).
xc_microtheory(a65b12504cc6da,x_BiologyMt).
xc_source_file(a65b12504cc6da,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6da,3134).
xc_kb_names(a65b12504cc6da,[]).
xc_mapping_rows(a65b12504cc6da,[]).
xc_direction(a65b12504cc6da,':FORWARD').
xc_monotonicity(a65b12504cc6da,':DEFAULT').
xc_creator(a65b12504cc6da,'Cyc').
x_isa(x_AttemptingFn(x_MakingFn(x_NuclearWeapon)),x_Collection) :- x_cid(a65b12504cc6db).
xc_microtheory(a65b12504cc6db,x_BiologyMt).
xc_source_file(a65b12504cc6db,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6db,3140).
xc_kb_names(a65b12504cc6db,[]).
xc_mapping_rows(a65b12504cc6db,[]).
xc_direction(a65b12504cc6db,':FORWARD').
xc_monotonicity(a65b12504cc6db,':DEFAULT').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole','x_Appendage-AnimalBodyPart',1) :- x_cid(a65b12504cc6dc).
xc_microtheory(a65b12504cc6dc,x_BiologyMt).
xc_source_file(a65b12504cc6dc,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6dc,3148).
xc_kb_names(a65b12504cc6dc,[]).
xc_mapping_rows(a65b12504cc6dc,[]).
xc_direction(a65b12504cc6dc,':FORWARD').
xc_monotonicity(a65b12504cc6dc,':DEFAULT').
xc_creator(a65b12504cc6dc,'Cyc').
x_relationAllExistsMax(x_anatomicalParts,'x_Organism-Whole',x_SkeletalSystem,1) :- x_cid(a65b12504cc6dd).
xc_microtheory(a65b12504cc6dd,x_BiologyMt).
xc_source_file(a65b12504cc6dd,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6dd,3154).
xc_kb_names(a65b12504cc6dd,[]).
xc_mapping_rows(a65b12504cc6dd,[]).
xc_direction(a65b12504cc6dd,':FORWARD').
xc_monotonicity(a65b12504cc6dd,':DEFAULT').
x_arg2Isa(x_killedByExposure,x_TangibleStuffCompositionType) :- x_cid(a65b12504cc6de).
xc_microtheory(a65b12504cc6de,x_BiologyMt).
xc_source_file(a65b12504cc6de,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6de,3160).
xc_kb_names(a65b12504cc6de,[]).
xc_mapping_rows(a65b12504cc6de,[]).
xc_direction(a65b12504cc6de,':FORWARD').
xc_monotonicity(a65b12504cc6de,':MONOTONIC').
xc_creator(a65b12504cc6de,'Cyc').
x_genls(x_SporeFormingBacterium,x_MoneraKingdom) :- x_cid(a65b12504cc6df).
xc_microtheory(a65b12504cc6df,x_BiologyMt).
xc_source_file(a65b12504cc6df,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6df,3166).
xc_kb_names(a65b12504cc6df,[]).
xc_mapping_rows(a65b12504cc6df,[]).
xc_direction(a65b12504cc6df,':FORWARD').
xc_monotonicity(a65b12504cc6df,':DEFAULT').
xc_creator(a65b12504cc6df,'Cyc').
x_genls(x_SmugglingFn('x_Anthrax-Bacterium'),'x_Translation-Complete') :- x_cid(a65b12504cc6e0).
xc_microtheory(a65b12504cc6e0,x_BiologyMt).
xc_source_file(a65b12504cc6e0,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6e0,3172).
xc_kb_names(a65b12504cc6e0,[]).
xc_mapping_rows(a65b12504cc6e0,[]).
xc_direction(a65b12504cc6e0,':FORWARD').
xc_monotonicity(a65b12504cc6e0,':DEFAULT').
x_partitionedInto('x_Organism-Whole',x_BiologicalGenus) :- x_cid(a65b12504cc6e1).
xc_microtheory(a65b12504cc6e1,x_BiologyMt).
xc_source_file(a65b12504cc6e1,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6e1,3179).
xc_kb_names(a65b12504cc6e1,[]).
xc_mapping_rows(a65b12504cc6e1,[]).
xc_direction(a65b12504cc6e1,':FORWARD').
xc_monotonicity(a65b12504cc6e1,':MONOTONIC').
xc_creator(a65b12504cc6e1,'Cyc').
x_isa(x_Arthropod,x_BiologicalPhylum) :- x_cid(a65b12504cc6e2).
xc_microtheory(a65b12504cc6e2,x_BiologyMt).
xc_source_file(a65b12504cc6e2,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6e2,3185).
xc_kb_names(a65b12504cc6e2,[]).
xc_mapping_rows(a65b12504cc6e2,[]).
xc_direction(a65b12504cc6e2,':FORWARD').
xc_monotonicity(a65b12504cc6e2,':DEFAULT').
xc_creator(a65b12504cc6e2,'Cyc').
x_isa(x_Rickettsia,x_OrganismClassificationType) :- x_cid(a65b12504cc6e3).
xc_microtheory(a65b12504cc6e3,x_BiologyMt).
xc_source_file(a65b12504cc6e3,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6e3,3191).
xc_kb_names(a65b12504cc6e3,[]).
xc_mapping_rows(a65b12504cc6e3,[]).
xc_direction(a65b12504cc6e3,':FORWARD').
xc_monotonicity(a65b12504cc6e3,':MONOTONIC').
xc_creator(a65b12504cc6e3,'Cyc').
xc_creation_date(a65b12504cc6e3,95219).
x_genls('x_BacillusCereus-Species',x_GramPositiveBacterium) :- x_cid(a65b12504cc6e4).
xc_microtheory(a65b12504cc6e4,x_BiologyMt).
xc_source_file(a65b12504cc6e4,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6e4,3197).
xc_kb_names(a65b12504cc6e4,[]).
xc_mapping_rows(a65b12504cc6e4,[]).
xc_direction(a65b12504cc6e4,':FORWARD').
xc_monotonicity(a65b12504cc6e4,':DEFAULT').
xc_creator(a65b12504cc6e4,'Cyc').
x_genls('x_Spore-DormantBacterium',x_ProkaryoticCell) :- x_cid(a65b12504cc6e5).
xc_microtheory(a65b12504cc6e5,x_BiologyMt).
xc_source_file(a65b12504cc6e5,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6e5,3203).
xc_kb_names(a65b12504cc6e5,[]).
xc_mapping_rows(a65b12504cc6e5,[]).
xc_direction(a65b12504cc6e5,':FORWARD').
xc_monotonicity(a65b12504cc6e5,':DEFAULT').
xc_creator(a65b12504cc6e5,'Cyc').
x_isa(x_ScatFn,x_CollectionDenotingFunction) :- x_cid(a65b12504cc6e6).
xc_microtheory(a65b12504cc6e6,x_BiologyMt).
xc_source_file(a65b12504cc6e6,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6e6,3209).
xc_kb_names(a65b12504cc6e6,[]).
xc_mapping_rows(a65b12504cc6e6,[]).
xc_direction(a65b12504cc6e6,':FORWARD').
xc_monotonicity(a65b12504cc6e6,':MONOTONIC').
xc_creator(a65b12504cc6e6,'Cyc').
xc_creation_date(a65b12504cc6e6,101804).
x_argIsa(x_organismFoundInSubstance,2,x_ExistingStuffType) :- x_cid(a65b12504cc6e7).
xc_microtheory(a65b12504cc6e7,x_BiologyMt).
xc_source_file(a65b12504cc6e7,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6e7,3215).
xc_kb_names(a65b12504cc6e7,[]).
xc_mapping_rows(a65b12504cc6e7,[]).
xc_direction(a65b12504cc6e7,':FORWARD').
xc_monotonicity(a65b12504cc6e7,':MONOTONIC').
x_afterAdding(x_memberOfSpecies,'x_PROPAGATE-TO-ISA') :- x_cid(a65b12504cc6e8).
xc_microtheory(a65b12504cc6e8,x_BiologyMt).
xc_source_file(a65b12504cc6e8,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6e8,3221).
xc_kb_names(a65b12504cc6e8,[]).
xc_mapping_rows(a65b12504cc6e8,[]).
xc_direction(a65b12504cc6e8,':FORWARD').
xc_monotonicity(a65b12504cc6e8,':DEFAULT').
x_isa('x_Clostridiaceae-Family',x_BiologicalFamily) :- x_cid(a65b12504cc6e9).
xc_microtheory(a65b12504cc6e9,x_BiologyMt).
xc_source_file(a65b12504cc6e9,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6e9,3227).
xc_kb_names(a65b12504cc6e9,[]).
xc_mapping_rows(a65b12504cc6e9,[]).
xc_direction(a65b12504cc6e9,':FORWARD').
xc_monotonicity(a65b12504cc6e9,':MONOTONIC').
xc_creator(a65b12504cc6e9,'Cyc').
x_genls(x_RickettsiaQuintana,x_Rickettsia) :- x_cid(a65b12504cc6ea).
xc_microtheory(a65b12504cc6ea,x_BiologyMt).
xc_source_file(a65b12504cc6ea,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6ea,3233).
xc_kb_names(a65b12504cc6ea,[]).
xc_mapping_rows(a65b12504cc6ea,[]).
xc_direction(a65b12504cc6ea,':FORWARD').
xc_monotonicity(a65b12504cc6ea,':MONOTONIC').
xc_creator(a65b12504cc6ea,'Cyc').
xc_creation_date(a65b12504cc6ea,100807).
x_arg1Isa(x_InstantiationInstanceFn(x_organismTypeCanLethallyInfect,x_TheSet(1)),'x_Organism-Whole') :- x_cid(a65b12504cc6eb).
xc_microtheory(a65b12504cc6eb,x_BiologyMt).
xc_source_file(a65b12504cc6eb,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6eb,3239).
xc_kb_names(a65b12504cc6eb,[]).
xc_mapping_rows(a65b12504cc6eb,[]).
xc_direction(a65b12504cc6eb,':FORWARD').
xc_monotonicity(a65b12504cc6eb,':DEFAULT').
xc_creator(a65b12504cc6eb,'Cyc').
x_comment(x_carriesOrganismType,"(#$carriesOrganismType OBJ ORGTYPE) means that OBJ carries within\nor upon itself organisms of the type ORGTYPE.  OBJ can be an inanimate\nthing, like a hypoderimic needle or a solution contaminated with bacteria,\nor an organism.") :- x_cid(a65b12504cc6ec).
xc_microtheory(a65b12504cc6ec,x_BiologyMt).
xc_source_file(a65b12504cc6ec,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6ec,3247).
xc_kb_names(a65b12504cc6ec,[]).
xc_mapping_rows(a65b12504cc6ec,[]).
xc_direction(a65b12504cc6ec,':FORWARD').
xc_monotonicity(a65b12504cc6ec,':DEFAULT').
xc_creator(a65b12504cc6ec,'Cyc').
xc_creation_date(a65b12504cc6ec,123939).
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_NervousSystem,1) :- x_cid(a65b12504cc6ed).
xc_microtheory(a65b12504cc6ed,x_BiologyMt).
xc_source_file(a65b12504cc6ed,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6ed,3256).
xc_kb_names(a65b12504cc6ed,[]).
xc_mapping_rows(a65b12504cc6ed,[]).
xc_direction(a65b12504cc6ed,':FORWARD').
xc_monotonicity(a65b12504cc6ed,':DEFAULT').
xc_creator(a65b12504cc6ed,'Cyc').
x_isa(x_Torso,x_UniqueAnatomicalPartType) :- x_cid(a65b12504cc6ee).
xc_microtheory(a65b12504cc6ee,x_BiologyMt).
xc_source_file(a65b12504cc6ee,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6ee,3262).
xc_kb_names(a65b12504cc6ee,[]).
xc_mapping_rows(a65b12504cc6ee,[]).
xc_direction(a65b12504cc6ee,':FORWARD').
xc_monotonicity(a65b12504cc6ee,':DEFAULT').
x_implies(x_and(x_unknownFormula(x_isa(V1,x_SymmetricAnatomicalPartType)),x_unknownFormula(x_isa(V1,x_UniqueAnatomicalPartType)),x_infectionLocalizedIn(V2,V3,V1)),x_inRegion(V3,'x_SKF-33612495'(V3,V2,V1))) :- x_cid(a65b12504cc6ef,V1,V2,V3).
xc_microtheory(a65b12504cc6ef,x_BiologyMt).
xc_source_file(a65b12504cc6ef,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6ef,3268).
xc_kb_names(a65b12504cc6ef,["?PART-TYPE","?ORG","?INFECTION"]).
xc_mapping_rows(a65b12504cc6ef,['implication-implies']).
xc_direction(a65b12504cc6ef,':BACKWARD').
xc_monotonicity(a65b12504cc6ef,':DEFAULT').
xc_creator(a65b12504cc6ef,'Cyc').
xc_creation_date(a65b12504cc6ef,113419).
x_comment(x_EndosporingEvent,"An #$EndosporingEvent is the #$Event in which a #$VegetativeCell becomes an #$Endospore. Not all bacteria are capable of undegoing this change. An #$EndosporingEvent occurs when bacteria that are capable of this change are in a hostile environment.") :- x_cid(a65b12504cc6f0).
xc_microtheory(a65b12504cc6f0,x_BiologyMt).
xc_source_file(a65b12504cc6f0,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6f0,3282).
xc_kb_names(a65b12504cc6f0,[]).
xc_mapping_rows(a65b12504cc6f0,[]).
xc_direction(a65b12504cc6f0,':FORWARD').
xc_monotonicity(a65b12504cc6f0,':DEFAULT').
xc_creator(a65b12504cc6f0,'Cyc').
x_genls('x_ClostridiumBotulinum-Species','x_Clostridium-Genus') :- x_cid(a65b12504cc6f1).
xc_microtheory(a65b12504cc6f1,x_BiologyMt).
xc_source_file(a65b12504cc6f1,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6f1,3288).
xc_kb_names(a65b12504cc6f1,[]).
xc_mapping_rows(a65b12504cc6f1,[]).
xc_direction(a65b12504cc6f1,':FORWARD').
xc_monotonicity(a65b12504cc6f1,':DEFAULT').
x_isa(x_RickettsiaProwsecki,x_OrganismClassificationType) :- x_cid(a65b12504cc6f2).
xc_microtheory(a65b12504cc6f2,x_BiologyMt).
xc_source_file(a65b12504cc6f2,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6f2,3294).
xc_kb_names(a65b12504cc6f2,[]).
xc_mapping_rows(a65b12504cc6f2,[]).
xc_direction(a65b12504cc6f2,':FORWARD').
xc_monotonicity(a65b12504cc6f2,':MONOTONIC').
xc_creator(a65b12504cc6f2,'Cyc').
xc_creation_date(a65b12504cc6f2,101633).
x_argIsa(x_ingestingToxicityFor,2,x_OrganismClassificationType) :- x_cid(a65b12504cc6f3).
xc_microtheory(a65b12504cc6f3,x_BiologyMt).
xc_source_file(a65b12504cc6f3,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6f3,3300).
xc_kb_names(a65b12504cc6f3,[]).
xc_mapping_rows(a65b12504cc6f3,[]).
xc_direction(a65b12504cc6f3,':FORWARD').
xc_monotonicity(a65b12504cc6f3,':MONOTONIC').
x_isa(x_Macrophage,x_ExistingObjectType) :- x_cid(a65b12504cc6f4).
xc_microtheory(a65b12504cc6f4,x_BiologyMt).
xc_source_file(a65b12504cc6f4,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6f4,3306).
xc_kb_names(a65b12504cc6f4,[]).
xc_mapping_rows(a65b12504cc6f4,[]).
xc_direction(a65b12504cc6f4,':FORWARD').
xc_monotonicity(a65b12504cc6f4,':MONOTONIC').
xc_creator(a65b12504cc6f4,'Cyc').
x_argIsa(x_objectExposed,1,x_ExposureToSubstance) :- x_cid(a65b12504cc6f5).
xc_microtheory(a65b12504cc6f5,x_BiologyMt).
xc_source_file(a65b12504cc6f5,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6f5,3312).
xc_kb_names(a65b12504cc6f5,[]).
xc_mapping_rows(a65b12504cc6f5,[]).
xc_direction(a65b12504cc6f5,':FORWARD').
xc_monotonicity(a65b12504cc6f5,':MONOTONIC').
x_arg2Isa(x_stuffInhaled,x_PartiallyTangible) :- x_cid(a65b12504cc6f6).
xc_microtheory(a65b12504cc6f6,x_BiologyMt).
xc_source_file(a65b12504cc6f6,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6f6,3318).
xc_kb_names(a65b12504cc6f6,[]).
xc_mapping_rows(a65b12504cc6f6,[]).
xc_direction(a65b12504cc6f6,':FORWARD').
xc_monotonicity(a65b12504cc6f6,':MONOTONIC').
xc_creator(a65b12504cc6f6,'Cyc').
xc_creation_date(a65b12504cc6f6,160824).
x_isa(x_NaturalKillerCell,x_ExistingObjectType) :- x_cid(a65b12504cc6f7).
xc_microtheory(a65b12504cc6f7,x_BiologyMt).
xc_source_file(a65b12504cc6f7,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6f7,3324).
xc_kb_names(a65b12504cc6f7,[]).
xc_mapping_rows(a65b12504cc6f7,[]).
xc_direction(a65b12504cc6f7,':FORWARD').
xc_monotonicity(a65b12504cc6f7,':MONOTONIC').
xc_creator(a65b12504cc6f7,'Cyc').
x_argIsa(x_exposureOfObjectToSubstanceType,2,x_PartiallyTangible) :- x_cid(a65b12504cc6f8).
xc_microtheory(a65b12504cc6f8,x_BiologyMt).
xc_source_file(a65b12504cc6f8,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6f8,3330).
xc_kb_names(a65b12504cc6f8,[]).
xc_mapping_rows(a65b12504cc6f8,[]).
xc_direction(a65b12504cc6f8,':FORWARD').
xc_monotonicity(a65b12504cc6f8,':MONOTONIC').
x_argIsa(x_organismTypeCanLethallyInfect,1,x_Collection) :- x_cid(a65b12504cc6f9).
xc_microtheory(a65b12504cc6f9,x_BiologyMt).
xc_source_file(a65b12504cc6f9,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6f9,3336).
xc_kb_names(a65b12504cc6f9,[]).
xc_mapping_rows(a65b12504cc6f9,[]).
xc_direction(a65b12504cc6f9,':FORWARD').
xc_monotonicity(a65b12504cc6f9,':MONOTONIC').
x_partitionedInto('x_Organism-Whole',x_BiologicalFamily) :- x_cid(a65b12504cc6fa).
xc_microtheory(a65b12504cc6fa,x_BiologyMt).
xc_source_file(a65b12504cc6fa,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6fa,3342).
xc_kb_names(a65b12504cc6fa,[]).
xc_mapping_rows(a65b12504cc6fa,[]).
xc_direction(a65b12504cc6fa,':FORWARD').
xc_monotonicity(a65b12504cc6fa,':MONOTONIC').
xc_creator(a65b12504cc6fa,'Cyc').
x_argIsa(x_killedByExposure,1,x_BiologicalLivingObject) :- x_cid(a65b12504cc6fb).
xc_microtheory(a65b12504cc6fb,x_BiologyMt).
xc_source_file(a65b12504cc6fb,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6fb,3348).
xc_kb_names(a65b12504cc6fb,[]).
xc_mapping_rows(a65b12504cc6fb,[]).
xc_direction(a65b12504cc6fb,':FORWARD').
xc_monotonicity(a65b12504cc6fb,':MONOTONIC').
x_genls(x_NonSporeFormingBacterium,x_ProkaryoticCell) :- x_cid(a65b12504cc6fc).
xc_microtheory(a65b12504cc6fc,x_BiologyMt).
xc_source_file(a65b12504cc6fc,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6fc,3354).
xc_kb_names(a65b12504cc6fc,[]).
xc_mapping_rows(a65b12504cc6fc,[]).
xc_direction(a65b12504cc6fc,':FORWARD').
xc_monotonicity(a65b12504cc6fc,':DEFAULT').
xc_creator(a65b12504cc6fc,'Cyc').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Organ,1) :- x_cid(a65b12504cc6fd).
xc_microtheory(a65b12504cc6fd,x_BiologyMt).
xc_source_file(a65b12504cc6fd,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6fd,3360).
xc_kb_names(a65b12504cc6fd,[]).
xc_mapping_rows(a65b12504cc6fd,[]).
xc_direction(a65b12504cc6fd,':FORWARD').
xc_monotonicity(a65b12504cc6fd,':DEFAULT').
xc_creator(a65b12504cc6fd,'Cyc').
x_isa(x_BacterialSporeGermination,x_TemporalObjectType) :- x_cid(a65b12504cc6fe).
xc_microtheory(a65b12504cc6fe,x_BiologyMt).
xc_source_file(a65b12504cc6fe,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6fe,3366).
xc_kb_names(a65b12504cc6fe,[]).
xc_mapping_rows(a65b12504cc6fe,[]).
xc_direction(a65b12504cc6fe,':FORWARD').
xc_monotonicity(a65b12504cc6fe,':MONOTONIC').
xc_creator(a65b12504cc6fe,'Cyc').
x_implies(x_and(x_isa(V1,x_BiologicalSubspecies),x_isa(V2,V1),x_children(V2,V3),x_different(V2,V4),x_isa(V4,V1),x_children(V4,V3)),x_isa(V3,V1)) :- x_cid(a65b12504cc6ff,V1,V2,V3,V4).
xc_microtheory(a65b12504cc6ff,x_BiologyMt).
xc_source_file(a65b12504cc6ff,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc6ff,3372).
xc_kb_names(a65b12504cc6ff,["?SUBSPEC","?PARENT1","?YOUNGER","?PARENT2"]).
xc_mapping_rows(a65b12504cc6ff,['implication-implies']).
xc_direction(a65b12504cc6ff,':BACKWARD').
xc_monotonicity(a65b12504cc6ff,':DEFAULT').
xc_creator(a65b12504cc6ff,'Cyc').
x_isa(x_CoccusBacterium,x_BacteriumTypeByStructure) :- x_cid(a65b12504cc700).
xc_microtheory(a65b12504cc700,x_BiologyMt).
xc_source_file(a65b12504cc700,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc700,3386).
xc_kb_names(a65b12504cc700,[]).
xc_mapping_rows(a65b12504cc700,[]).
xc_direction(a65b12504cc700,':FORWARD').
xc_monotonicity(a65b12504cc700,':MONOTONIC').
xc_creator(a65b12504cc700,'Cyc').
x_isa(x_ReturnToVegetativeState,x_SituationType) :- x_cid(a65b12504cc701).
xc_microtheory(a65b12504cc701,x_BiologyMt).
xc_source_file(a65b12504cc701,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc701,3392).
xc_kb_names(a65b12504cc701,[]).
xc_mapping_rows(a65b12504cc701,[]).
xc_direction(a65b12504cc701,':FORWARD').
xc_monotonicity(a65b12504cc701,':DEFAULT').
xc_creator(a65b12504cc701,'Cyc').
x_relationAllExistsMax(x_anatomicalParts,'x_Organism-Whole',x_NervousSystem,1) :- x_cid(a65b12504cc702).
xc_microtheory(a65b12504cc702,x_BiologyMt).
xc_source_file(a65b12504cc702,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc702,3398).
xc_kb_names(a65b12504cc702,[]).
xc_mapping_rows(a65b12504cc702,[]).
xc_direction(a65b12504cc702,':FORWARD').
xc_monotonicity(a65b12504cc702,':DEFAULT').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Leg,1) :- x_cid(a65b12504cc703).
xc_microtheory(a65b12504cc703,x_BiologyMt).
xc_source_file(a65b12504cc703,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc703,3404).
xc_kb_names(a65b12504cc703,[]).
xc_mapping_rows(a65b12504cc703,[]).
xc_direction(a65b12504cc703,':FORWARD').
xc_monotonicity(a65b12504cc703,':DEFAULT').
xc_creator(a65b12504cc703,'Cyc').
x_genls('x_Spore-DormantBacterium',x_MoneraKingdom) :- x_cid(a65b12504cc704).
xc_microtheory(a65b12504cc704,x_BiologyMt).
xc_source_file(a65b12504cc704,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc704,3410).
xc_kb_names(a65b12504cc704,[]).
xc_mapping_rows(a65b12504cc704,[]).
xc_direction(a65b12504cc704,':FORWARD').
xc_monotonicity(a65b12504cc704,':DEFAULT').
xc_creator(a65b12504cc704,'Cyc').
x_arity(x_ScatFn,1) :- x_cid(a65b12504cc705).
xc_microtheory(a65b12504cc705,x_BiologyMt).
xc_source_file(a65b12504cc705,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc705,3416).
xc_kb_names(a65b12504cc705,[]).
xc_mapping_rows(a65b12504cc705,[]).
xc_direction(a65b12504cc705,':FORWARD').
xc_monotonicity(a65b12504cc705,':DEFAULT').
x_arg2Isa(x_organismFoundInSubstance,x_ExistingStuffType) :- x_cid(a65b12504cc706).
xc_microtheory(a65b12504cc706,x_BiologyMt).
xc_source_file(a65b12504cc706,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc706,3422).
xc_kb_names(a65b12504cc706,[]).
xc_mapping_rows(a65b12504cc706,[]).
xc_direction(a65b12504cc706,':FORWARD').
xc_monotonicity(a65b12504cc706,':MONOTONIC').
xc_creator(a65b12504cc706,'Cyc').
xc_creation_date(a65b12504cc706,223521).
x_arg1Isa(x_InstantiationInstanceFn(x_organismTypeCanLethallyInfect,x_TheSet(1,2)),'x_Organism-Whole') :- x_cid(a65b12504cc707).
xc_microtheory(a65b12504cc707,x_BiologyMt).
xc_source_file(a65b12504cc707,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc707,3428).
xc_kb_names(a65b12504cc707,[]).
xc_mapping_rows(a65b12504cc707,[]).
xc_direction(a65b12504cc707,':FORWARD').
xc_monotonicity(a65b12504cc707,':DEFAULT').
xc_creator(a65b12504cc707,'Cyc').
x_argGenl(x_carriesOrganismType,2,'x_Organism-Whole') :- x_cid(a65b12504cc708).
xc_microtheory(a65b12504cc708,x_BiologyMt).
xc_source_file(a65b12504cc708,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc708,3436).
xc_kb_names(a65b12504cc708,[]).
xc_mapping_rows(a65b12504cc708,[]).
xc_direction(a65b12504cc708,':FORWARD').
xc_monotonicity(a65b12504cc708,':MONOTONIC').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Fruit,1) :- x_cid(a65b12504cc709).
xc_microtheory(a65b12504cc709,x_BiologyMt).
xc_source_file(a65b12504cc709,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc709,3442).
xc_kb_names(a65b12504cc709,[]).
xc_mapping_rows(a65b12504cc709,[]).
xc_direction(a65b12504cc709,':FORWARD').
xc_monotonicity(a65b12504cc709,':DEFAULT').
xc_creator(a65b12504cc709,'Cyc').
x_isa('x_Chest-BodyPart',x_UniqueAnatomicalPartType) :- x_cid(a65b12504cc70a).
xc_microtheory(a65b12504cc70a,x_BiologyMt).
xc_source_file(a65b12504cc70a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc70a,3448).
xc_kb_names(a65b12504cc70a,[]).
xc_mapping_rows(a65b12504cc70a,[]).
xc_direction(a65b12504cc70a,':FORWARD').
xc_monotonicity(a65b12504cc70a,':DEFAULT').
x_implies(x_and(x_unknownFormula(x_isa(V1,x_SymmetricAnatomicalPartType)),x_unknownFormula(x_isa(V1,x_UniqueAnatomicalPartType)),x_infectionLocalizedIn(V2,V3,V1)),x_isa('x_SKF-33612495'(V3,V2,V1),x_BodyPartCollectionFn(V2,V1))) :- x_cid(a65b12504cc70b,V1,V2,V3).
xc_microtheory(a65b12504cc70b,x_BiologyMt).
xc_source_file(a65b12504cc70b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc70b,3454).
xc_kb_names(a65b12504cc70b,["?PART-TYPE","?ORG","?INFECTION"]).
xc_mapping_rows(a65b12504cc70b,['implication-implies']).
xc_direction(a65b12504cc70b,':BACKWARD').
xc_monotonicity(a65b12504cc70b,':DEFAULT').
xc_creator(a65b12504cc70b,'Cyc').
xc_creation_date(a65b12504cc70b,113419).
x_superTaxons('x_ClostridiumBotulinum-Species','x_Clostridium-Genus') :- x_cid(a65b12504cc70c).
xc_microtheory(a65b12504cc70c,x_BiologyMt).
xc_source_file(a65b12504cc70c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc70c,3469).
xc_kb_names(a65b12504cc70c,[]).
xc_mapping_rows(a65b12504cc70c,[]).
xc_direction(a65b12504cc70c,':FORWARD').
xc_monotonicity(a65b12504cc70c,':DEFAULT').
xc_creator(a65b12504cc70c,'Cyc').
x_arg2Isa(x_ingestingToxicityFor,x_OrganismClassificationType) :- x_cid(a65b12504cc70d).
xc_microtheory(a65b12504cc70d,x_BiologyMt).
xc_source_file(a65b12504cc70d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc70d,3475).
xc_kb_names(a65b12504cc70d,[]).
xc_mapping_rows(a65b12504cc70d,[]).
xc_direction(a65b12504cc70d,':FORWARD').
xc_monotonicity(a65b12504cc70d,':MONOTONIC').
xc_creator(a65b12504cc70d,'Cyc').
xc_creation_date(a65b12504cc70d,184610).
x_comment('x_BacillusCereus-Species',"A collection of #$Bacterium in a #$BiologicalSpecies in the #$MoneraKingdom.  These #$ProkaryoticCells are responsible for two types of food poisoning in humans.") :- x_cid(a65b12504cc70e).
xc_microtheory(a65b12504cc70e,x_BiologyMt).
xc_source_file(a65b12504cc70e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc70e,3481).
xc_kb_names(a65b12504cc70e,[]).
xc_mapping_rows(a65b12504cc70e,[]).
xc_direction(a65b12504cc70e,':FORWARD').
xc_monotonicity(a65b12504cc70e,':DEFAULT').
xc_creator(a65b12504cc70e,'Cyc').
x_arg1Isa(x_objectExposed,x_ExposureToSubstance) :- x_cid(a65b12504cc70f).
xc_microtheory(a65b12504cc70f,x_BiologyMt).
xc_source_file(a65b12504cc70f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc70f,3487).
xc_kb_names(a65b12504cc70f,[]).
xc_mapping_rows(a65b12504cc70f,[]).
xc_direction(a65b12504cc70f,':FORWARD').
xc_monotonicity(a65b12504cc70f,':MONOTONIC').
xc_creator(a65b12504cc70f,'Cyc').
xc_creation_date(a65b12504cc70f,163147).
x_argIsa(x_stuffInhaled,1,x_Inhaling) :- x_cid(a65b12504cc710).
xc_microtheory(a65b12504cc710,x_BiologyMt).
xc_source_file(a65b12504cc710,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc710,3493).
xc_kb_names(a65b12504cc710,[]).
xc_mapping_rows(a65b12504cc710,[]).
xc_direction(a65b12504cc710,':FORWARD').
xc_monotonicity(a65b12504cc710,':MONOTONIC').
x_isa(x_AerobicBacterium,x_BacteriumTypeByAerobicity) :- x_cid(a65b12504cc711).
xc_microtheory(a65b12504cc711,x_BiologyMt).
xc_source_file(a65b12504cc711,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc711,3499).
xc_kb_names(a65b12504cc711,[]).
xc_mapping_rows(a65b12504cc711,[]).
xc_direction(a65b12504cc711,':FORWARD').
xc_monotonicity(a65b12504cc711,':MONOTONIC').
xc_creator(a65b12504cc711,'Cyc').
x_isa(x_AttemptingFn(x_MakingFn(x_BiologicalWeapon)),x_Collection) :- x_cid(a65b12504cc712).
xc_microtheory(a65b12504cc712,x_BiologyMt).
xc_source_file(a65b12504cc712,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc712,3505).
xc_kb_names(a65b12504cc712,[]).
xc_mapping_rows(a65b12504cc712,[]).
xc_direction(a65b12504cc712,':FORWARD').
xc_monotonicity(a65b12504cc712,':DEFAULT').
x_implies(x_memberOfSpecies(V1,V2),x_isa(V1,V2)) :- x_cid(a65b12504cc713,V1,V2).
xc_microtheory(a65b12504cc713,x_BiologyMt).
xc_source_file(a65b12504cc713,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc713,3513).
xc_kb_names(a65b12504cc713,["?MEM","?SPEC"]).
xc_mapping_rows(a65b12504cc713,['implication-implies']).
xc_direction(a65b12504cc713,':BACKWARD').
xc_monotonicity(a65b12504cc713,':DEFAULT').
xc_creator(a65b12504cc713,'Cyc').
x_isa(x_MobFn(x_BacterialSporeFn('x_Anthrax-Bacterium')),x_ExistingStuffType) :- x_cid(a65b12504cc714).
xc_microtheory(a65b12504cc714,x_BiologyMt).
xc_source_file(a65b12504cc714,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc714,3521).
xc_kb_names(a65b12504cc714,[]).
xc_mapping_rows(a65b12504cc714,[]).
xc_direction(a65b12504cc714,':FORWARD').
xc_monotonicity(a65b12504cc714,':DEFAULT').
x_arg2Isa(x_exposureOfObjectToSubstanceType,x_PartiallyTangible) :- x_cid(a65b12504cc715).
xc_microtheory(a65b12504cc715,x_BiologyMt).
xc_source_file(a65b12504cc715,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc715,3529).
xc_kb_names(a65b12504cc715,[]).
xc_mapping_rows(a65b12504cc715,[]).
xc_direction(a65b12504cc715,':FORWARD').
xc_monotonicity(a65b12504cc715,':MONOTONIC').
xc_creator(a65b12504cc715,'Cyc').
xc_creation_date(a65b12504cc715,163147).
x_arg1Isa(x_organismTypeCanLethallyInfect,x_Collection) :- x_cid(a65b12504cc716).
xc_microtheory(a65b12504cc716,x_BiologyMt).
xc_source_file(a65b12504cc716,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc716,3535).
xc_kb_names(a65b12504cc716,[]).
xc_mapping_rows(a65b12504cc716,[]).
xc_direction(a65b12504cc716,':FORWARD').
xc_monotonicity(a65b12504cc716,':MONOTONIC').
xc_creator(a65b12504cc716,'Cyc').
x_comment(x_immuneWithRespectToPathogen,"(#$immuneWithRespectToPathogen ORG PATHOGEN) means that ORG, an instance of #$Organism-Whole, is\n#$Immune to #$Infections caused by pathogen organisms of the type PATHOGEN. More precisely, ORG is said to be resistant, or\ninsusceptible, to toxic molecules, microorganisms and/or foreign cells.") :- x_cid(a65b12504cc717).
xc_microtheory(a65b12504cc717,x_BiologyMt).
xc_source_file(a65b12504cc717,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc717,3541).
xc_kb_names(a65b12504cc717,[]).
xc_mapping_rows(a65b12504cc717,[]).
xc_direction(a65b12504cc717,':FORWARD').
xc_monotonicity(a65b12504cc717,':DEFAULT').
xc_creator(a65b12504cc717,'Cyc').
xc_creation_date(a65b12504cc717,104745).
x_isa(x_GramNegativeBacterium,x_BacteriumTypeByGramStain) :- x_cid(a65b12504cc718).
xc_microtheory(a65b12504cc718,x_BiologyMt).
xc_source_file(a65b12504cc718,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc718,3549).
xc_kb_names(a65b12504cc718,[]).
xc_mapping_rows(a65b12504cc718,[]).
xc_direction(a65b12504cc718,':FORWARD').
xc_monotonicity(a65b12504cc718,':MONOTONIC').
xc_creator(a65b12504cc718,'Cyc').
xc_creation_date(a65b12504cc718,154207).
x_completeCollectionExtent(x_BacteriumTypeByStructure) :- x_cid(a65b12504cc719).
xc_microtheory(a65b12504cc719,x_BiologyMt).
xc_source_file(a65b12504cc719,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc719,3555).
xc_kb_names(a65b12504cc719,[]).
xc_mapping_rows(a65b12504cc719,[]).
xc_direction(a65b12504cc719,':FORWARD').
xc_monotonicity(a65b12504cc719,':DEFAULT').
xc_creator(a65b12504cc719,'Cyc').
x_arg1Isa(x_killedByExposure,x_BiologicalLivingObject) :- x_cid(a65b12504cc71a).
xc_microtheory(a65b12504cc71a,x_BiologyMt).
xc_source_file(a65b12504cc71a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc71a,3561).
xc_kb_names(a65b12504cc71a,[]).
xc_mapping_rows(a65b12504cc71a,[]).
xc_direction(a65b12504cc71a,':FORWARD').
xc_monotonicity(a65b12504cc71a,':MONOTONIC').
xc_creator(a65b12504cc71a,'Cyc').
x_genls(x_SmugglingFn('x_Anthrax-Bacterium'),x_HandlingAnObject) :- x_cid(a65b12504cc71b).
xc_microtheory(a65b12504cc71b,x_BiologyMt).
xc_source_file(a65b12504cc71b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc71b,3567).
xc_kb_names(a65b12504cc71b,[]).
xc_mapping_rows(a65b12504cc71b,[]).
xc_direction(a65b12504cc71b,':FORWARD').
xc_monotonicity(a65b12504cc71b,':DEFAULT').
x_genls(x_NonSporeFormingBacterium,x_MoneraKingdom) :- x_cid(a65b12504cc71c).
xc_microtheory(a65b12504cc71c,x_BiologyMt).
xc_source_file(a65b12504cc71c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc71c,3574).
xc_kb_names(a65b12504cc71c,[]).
xc_mapping_rows(a65b12504cc71c,[]).
xc_direction(a65b12504cc71c,':FORWARD').
xc_monotonicity(a65b12504cc71c,':DEFAULT').
xc_creator(a65b12504cc71c,'Cyc').
x_isa(x_BacterialSporeGermination,x_DefaultDisjointScriptType) :- x_cid(a65b12504cc71d).
xc_microtheory(a65b12504cc71d,x_BiologyMt).
xc_source_file(a65b12504cc71d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc71d,3580).
xc_kb_names(a65b12504cc71d,[]).
xc_mapping_rows(a65b12504cc71d,[]).
xc_direction(a65b12504cc71d,':FORWARD').
xc_monotonicity(a65b12504cc71d,':MONOTONIC').
xc_creator(a65b12504cc71d,'Cyc').
x_genls('x_Clostridiales-Order',x_GramPositiveBacterium) :- x_cid(a65b12504cc71e).
xc_microtheory(a65b12504cc71e,x_BiologyMt).
xc_source_file(a65b12504cc71e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc71e,3586).
xc_kb_names(a65b12504cc71e,[]).
xc_mapping_rows(a65b12504cc71e,[]).
xc_direction(a65b12504cc71e,':FORWARD').
xc_monotonicity(a65b12504cc71e,':DEFAULT').
xc_creator(a65b12504cc71e,'Cyc').
x_isa(x_Vertebrate,x_BiologicalSubphylum) :- x_cid(a65b12504cc71f).
xc_microtheory(a65b12504cc71f,x_BiologyMt).
xc_source_file(a65b12504cc71f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc71f,3592).
xc_kb_names(a65b12504cc71f,[]).
xc_mapping_rows(a65b12504cc71f,[]).
xc_direction(a65b12504cc71f,':FORWARD').
xc_monotonicity(a65b12504cc71f,':MONOTONIC').
xc_creator(a65b12504cc71f,'Cyc').
xc_creation_date(a65b12504cc71f,112229).
x_genls(x_Antibody,x_Nutrient) :- x_cid(a65b12504cc720).
xc_microtheory(a65b12504cc720,x_BiologyMt).
xc_source_file(a65b12504cc720,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc720,3598).
xc_kb_names(a65b12504cc720,[]).
xc_mapping_rows(a65b12504cc720,[]).
xc_direction(a65b12504cc720,':FORWARD').
xc_monotonicity(a65b12504cc720,':DEFAULT').
xc_creator(a65b12504cc720,'Cyc').
x_isa(x_ScatFn,x_UnaryFunction) :- x_cid(a65b12504cc721).
xc_microtheory(a65b12504cc721,x_BiologyMt).
xc_source_file(a65b12504cc721,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc721,3604).
xc_kb_names(a65b12504cc721,[]).
xc_mapping_rows(a65b12504cc721,[]).
xc_direction(a65b12504cc721,':FORWARD').
xc_monotonicity(a65b12504cc721,':MONOTONIC').
xc_creator(a65b12504cc721,'Cyc').
xc_creation_date(a65b12504cc721,101804).
x_argIsa(x_InstantiationInstanceFn(x_organismTypeCanLethallyInfect,x_TheSet(1)),1,'x_Organism-Whole') :- x_cid(a65b12504cc722).
xc_microtheory(a65b12504cc722,x_BiologyMt).
xc_source_file(a65b12504cc722,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc722,3610).
xc_kb_names(a65b12504cc722,[]).
xc_mapping_rows(a65b12504cc722,[]).
xc_direction(a65b12504cc722,':FORWARD').
xc_monotonicity(a65b12504cc722,':DEFAULT').
x_arg2Genl(x_carriesOrganismType,'x_Organism-Whole') :- x_cid(a65b12504cc723).
xc_microtheory(a65b12504cc723,x_BiologyMt).
xc_source_file(a65b12504cc723,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc723,3618).
xc_kb_names(a65b12504cc723,[]).
xc_mapping_rows(a65b12504cc723,[]).
xc_direction(a65b12504cc723,':FORWARD').
xc_monotonicity(a65b12504cc723,':MONOTONIC').
xc_creator(a65b12504cc723,'Cyc').
xc_creation_date(a65b12504cc723,123939).
x_isa('x_Head-AnimalBodyPart',x_UniqueAnatomicalPartType) :- x_cid(a65b12504cc724).
xc_microtheory(a65b12504cc724,x_BiologyMt).
xc_source_file(a65b12504cc724,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc724,3624).
xc_kb_names(a65b12504cc724,[]).
xc_mapping_rows(a65b12504cc724,[]).
xc_direction(a65b12504cc724,':FORWARD').
xc_monotonicity(a65b12504cc724,':DEFAULT').
x_implies(x_and(x_isa(V1,x_BiologicalSpecies),x_isa(V2,V1),x_children(V2,V3)),x_isa(V3,V1)) :- x_cid(a65b12504cc725,V1,V2,V3).
xc_microtheory(a65b12504cc725,x_BiologyMt).
xc_source_file(a65b12504cc725,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc725,3630).
xc_kb_names(a65b12504cc725,["?SPEC","?OLDER","?YOUNGER"]).
xc_mapping_rows(a65b12504cc725,['implication-implies']).
xc_direction(a65b12504cc725,':BACKWARD').
xc_monotonicity(a65b12504cc725,':DEFAULT').
xc_creator(a65b12504cc725,'Cyc').
x_genls(x_AntibodyIgM,x_Antibody) :- x_cid(a65b12504cc726).
xc_microtheory(a65b12504cc726,x_BiologyMt).
xc_source_file(a65b12504cc726,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc726,3641).
xc_kb_names(a65b12504cc726,[]).
xc_mapping_rows(a65b12504cc726,[]).
xc_direction(a65b12504cc726,':FORWARD').
xc_monotonicity(a65b12504cc726,':MONOTONIC').
xc_creator(a65b12504cc726,'Cyc').
x_isa('x_Spore-DormantBacterium',x_LifeStageType) :- x_cid(a65b12504cc727).
xc_microtheory(a65b12504cc727,x_BiologyMt).
xc_source_file(a65b12504cc727,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc727,3647).
xc_kb_names(a65b12504cc727,[]).
xc_mapping_rows(a65b12504cc727,[]).
xc_direction(a65b12504cc727,':FORWARD').
xc_monotonicity(a65b12504cc727,':MONOTONIC').
xc_creator(a65b12504cc727,'Cyc').
xc_creation_date(a65b12504cc727,165050).
x_isa('x_ClostridiumBotulinum-Species',x_BiologicalSpecies) :- x_cid(a65b12504cc728).
xc_microtheory(a65b12504cc728,x_BiologyMt).
xc_source_file(a65b12504cc728,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc728,3653).
xc_kb_names(a65b12504cc728,[]).
xc_mapping_rows(a65b12504cc728,[]).
xc_direction(a65b12504cc728,':FORWARD').
xc_monotonicity(a65b12504cc728,':MONOTONIC').
xc_creator(a65b12504cc728,'Cyc').
x_implies(x_and(x_isa(V1,x_SecretionEvent),x_outputsCreated(V1,V2)),x_isa(V2,'x_Secretion-Bodily')) :- x_cid(a65b12504cc729,V1,V2).
xc_microtheory(a65b12504cc729,x_BiologyMt).
xc_source_file(a65b12504cc729,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc729,3659).
xc_kb_names(a65b12504cc729,["?SECR-EV","?SB"]).
xc_mapping_rows(a65b12504cc729,['implication-implies']).
xc_direction(a65b12504cc729,':BACKWARD').
xc_monotonicity(a65b12504cc729,':DEFAULT').
xc_creator(a65b12504cc729,'Cyc').
x_argIsa(x_ingestingToxicityFor,1,x_PartiallyTangible) :- x_cid(a65b12504cc72a).
xc_microtheory(a65b12504cc72a,x_BiologyMt).
xc_source_file(a65b12504cc72a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc72a,3669).
xc_kb_names(a65b12504cc72a,[]).
xc_mapping_rows(a65b12504cc72a,[]).
xc_direction(a65b12504cc72a,':FORWARD').
xc_monotonicity(a65b12504cc72a,':MONOTONIC').
x_genls(x_BacterialPhysiologicalAttribute,x_PhysiologicalAttribute) :- x_cid(a65b12504cc72b).
xc_microtheory(a65b12504cc72b,x_BiologyMt).
xc_source_file(a65b12504cc72b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc72b,3675).
xc_kb_names(a65b12504cc72b,[]).
xc_mapping_rows(a65b12504cc72b,[]).
xc_direction(a65b12504cc72b,':FORWARD').
xc_monotonicity(a65b12504cc72b,':MONOTONIC').
xc_creator(a65b12504cc72b,'Cyc').
x_isa(x_HumanBody,x_UniqueAnatomicalPartType) :- x_cid(a65b12504cc72c).
xc_microtheory(a65b12504cc72c,x_BiologyMt).
xc_source_file(a65b12504cc72c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc72c,3681).
xc_kb_names(a65b12504cc72c,[]).
xc_mapping_rows(a65b12504cc72c,[]).
xc_direction(a65b12504cc72c,':FORWARD').
xc_monotonicity(a65b12504cc72c,':DEFAULT').
'x_interArgIsa2-1'(x_anatomicalParts,x_AnimalBodyPart,x_Animal) :- x_cid(a65b12504cc72d).
xc_microtheory(a65b12504cc72d,x_BiologyMt).
xc_source_file(a65b12504cc72d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc72d,3687).
xc_kb_names(a65b12504cc72d,[]).
xc_mapping_rows(a65b12504cc72d,[]).
xc_direction(a65b12504cc72d,':BACKWARD').
xc_monotonicity(a65b12504cc72d,':DEFAULT').
xc_creator(a65b12504cc72d,'Cyc').
x_implies(x_and(x_isa(V1,x_BirthEvent),x_bodilyDoer(V1,V2)),x_isa(V2,x_FemaleAnimal)) :- x_cid(a65b12504cc72e,V1,V2).
xc_microtheory(a65b12504cc72e,x_BiologyMt).
xc_source_file(a65b12504cc72e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc72e,3693).
xc_kb_names(a65b12504cc72e,["?X","?Y"]).
xc_mapping_rows(a65b12504cc72e,['implication-implies']).
xc_direction(a65b12504cc72e,':BACKWARD').
xc_monotonicity(a65b12504cc72e,':DEFAULT').
xc_creator(a65b12504cc72e,'Cyc').
x_arg1Isa(x_stuffInhaled,x_Inhaling) :- x_cid(a65b12504cc72f).
xc_microtheory(a65b12504cc72f,x_BiologyMt).
xc_source_file(a65b12504cc72f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc72f,3703).
xc_kb_names(a65b12504cc72f,[]).
xc_mapping_rows(a65b12504cc72f,[]).
xc_direction(a65b12504cc72f,':FORWARD').
xc_monotonicity(a65b12504cc72f,':MONOTONIC').
xc_creator(a65b12504cc72f,'Cyc').
xc_creation_date(a65b12504cc72f,160824).
x_genls(x_Dog,x_CanineAnimal) :- x_cid(a65b12504cc730).
xc_microtheory(a65b12504cc730,x_BiologyMt).
xc_source_file(a65b12504cc730,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc730,3709).
xc_kb_names(a65b12504cc730,[]).
xc_mapping_rows(a65b12504cc730,[]).
xc_direction(a65b12504cc730,':FORWARD').
xc_monotonicity(a65b12504cc730,':DEFAULT').
x_isa(x_BacteriumTypeByAerobicity,x_SiblingDisjointCollection) :- x_cid(a65b12504cc731).
xc_microtheory(a65b12504cc731,x_BiologyMt).
xc_source_file(a65b12504cc731,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc731,3715).
xc_kb_names(a65b12504cc731,[]).
xc_mapping_rows(a65b12504cc731,[]).
xc_direction(a65b12504cc731,':FORWARD').
xc_monotonicity(a65b12504cc731,':DEFAULT').
xc_creator(a65b12504cc731,'Cyc').
x_not(x_and(x_isa(V1,x_BiologicalTaxonType),x_isa(V2,V1),x_genls(V2,V3),x_different(V2,V3),x_isa(V3,V1))) :- x_cid(a65b12504cc732,V1,V2,V3).
xc_microtheory(a65b12504cc732,x_BiologyMt).
xc_source_file(a65b12504cc732,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc732,3721).
xc_kb_names(a65b12504cc732,["?TAXONTYPE","?ORGANISMTYPE","?TAXON"]).
xc_mapping_rows(a65b12504cc732,[]).
xc_direction(a65b12504cc732,':BACKWARD').
xc_monotonicity(a65b12504cc732,':MONOTONIC').
xc_creator(a65b12504cc732,'Cyc').
x_genls(x_MobFn(x_BacterialSporeFn('x_Anthrax-Bacterium')),x_Mob) :- x_cid(a65b12504cc733).
xc_microtheory(a65b12504cc733,x_BiologyMt).
xc_source_file(a65b12504cc733,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc733,3733).
xc_kb_names(a65b12504cc733,[]).
xc_mapping_rows(a65b12504cc733,[]).
xc_direction(a65b12504cc733,':FORWARD').
xc_monotonicity(a65b12504cc733,':MONOTONIC').
x_argIsa(x_exposureOfObjectToSubstanceType,1,x_ExposureToSubstance) :- x_cid(a65b12504cc734).
xc_microtheory(a65b12504cc734,x_BiologyMt).
xc_source_file(a65b12504cc734,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc734,3741).
xc_kb_names(a65b12504cc734,[]).
xc_mapping_rows(a65b12504cc734,[]).
xc_direction(a65b12504cc734,':FORWARD').
xc_monotonicity(a65b12504cc734,':MONOTONIC').
x_comment(x_BacteriumTypeByStructure,"A partition on the collection #$Bacterium, reflecting the classical morphological division of the Eubacteria into #$CoccusBacterium, #$BacillusBacterium, and #$SpirillaBacterium.") :- x_cid(a65b12504cc735).
xc_microtheory(a65b12504cc735,x_BiologyMt).
xc_source_file(a65b12504cc735,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc735,3747).
xc_kb_names(a65b12504cc735,[]).
xc_mapping_rows(a65b12504cc735,[]).
xc_direction(a65b12504cc735,':FORWARD').
xc_monotonicity(a65b12504cc735,':MONOTONIC').
xc_creator(a65b12504cc735,'Cyc').
xc_creation_date(a65b12504cc735,170756).
x_superTaxons(x_ChordataPhylum,x_Animal) :- x_cid(a65b12504cc736).
xc_microtheory(a65b12504cc736,x_BiologyMt).
xc_source_file(a65b12504cc736,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc736,3753).
xc_kb_names(a65b12504cc736,[]).
xc_mapping_rows(a65b12504cc736,[]).
xc_direction(a65b12504cc736,':FORWARD').
xc_monotonicity(a65b12504cc736,':DEFAULT').
xc_creator(a65b12504cc736,'Cyc').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Arm,1) :- x_cid(a65b12504cc737).
xc_microtheory(a65b12504cc737,x_BiologyMt).
xc_source_file(a65b12504cc737,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc737,3759).
xc_kb_names(a65b12504cc737,[]).
xc_mapping_rows(a65b12504cc737,[]).
xc_direction(a65b12504cc737,':FORWARD').
xc_monotonicity(a65b12504cc737,':DEFAULT').
xc_creator(a65b12504cc737,'Cyc').
x_disjointWith(x_ProkaryoticCell,x_EukaryoticCell) :- x_cid(a65b12504cc738).
xc_microtheory(a65b12504cc738,x_BiologyMt).
xc_source_file(a65b12504cc738,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc738,3765).
xc_kb_names(a65b12504cc738,[]).
xc_mapping_rows(a65b12504cc738,[]).
xc_direction(a65b12504cc738,':FORWARD').
xc_monotonicity(a65b12504cc738,':MONOTONIC').
xc_creator(a65b12504cc738,'Cyc').
x_resultGenl(x_HairMobFn,x_AnimalBodyPart) :- x_cid(a65b12504cc739).
xc_microtheory(a65b12504cc739,x_BiologyMt).
xc_source_file(a65b12504cc739,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc739,3771).
xc_kb_names(a65b12504cc739,[]).
xc_mapping_rows(a65b12504cc739,[]).
xc_direction(a65b12504cc739,':FORWARD').
xc_monotonicity(a65b12504cc739,':DEFAULT').
xc_creator(a65b12504cc739,'Cyc').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Nerve,1) :- x_cid(a65b12504cc73a).
xc_microtheory(a65b12504cc73a,x_BiologyMt).
xc_source_file(a65b12504cc73a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc73a,3777).
xc_kb_names(a65b12504cc73a,[]).
xc_mapping_rows(a65b12504cc73a,[]).
xc_direction(a65b12504cc73a,':FORWARD').
xc_monotonicity(a65b12504cc73a,':DEFAULT').
xc_creator(a65b12504cc73a,'Cyc').
x_isa(x_Person,x_BiologicalSpecies) :- x_cid(a65b12504cc73b).
xc_microtheory(a65b12504cc73b,x_BiologyMt).
xc_source_file(a65b12504cc73b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc73b,3783).
xc_kb_names(a65b12504cc73b,[]).
xc_mapping_rows(a65b12504cc73b,[]).
xc_direction(a65b12504cc73b,':FORWARD').
xc_monotonicity(a65b12504cc73b,':DEFAULT').
xc_creator(a65b12504cc73b,'Cyc').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole','x_Head-Vertebrate',1) :- x_cid(a65b12504cc73c).
xc_microtheory(a65b12504cc73c,x_BiologyMt).
xc_source_file(a65b12504cc73c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc73c,3789).
xc_kb_names(a65b12504cc73c,[]).
xc_mapping_rows(a65b12504cc73c,[]).
xc_direction(a65b12504cc73c,':FORWARD').
xc_monotonicity(a65b12504cc73c,':DEFAULT').
xc_creator(a65b12504cc73c,'Cyc').
x_isa(x_Staphylococcus,x_BiologicalGenus) :- x_cid(a65b12504cc73d).
xc_microtheory(a65b12504cc73d,x_BiologyMt).
xc_source_file(a65b12504cc73d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc73d,3795).
xc_kb_names(a65b12504cc73d,[]).
xc_mapping_rows(a65b12504cc73d,[]).
xc_direction(a65b12504cc73d,':FORWARD').
xc_monotonicity(a65b12504cc73d,':MONOTONIC').
xc_creator(a65b12504cc73d,'Cyc').
x_implies(x_and(x_isa(V1,x_BiologicalReproductionEvent),x_offspringActors(V1,V2)),x_keStrongSuggestion(V2,x_thereExists(V3,x_and(x_isa(V3,x_OrganismClassificationType),x_isa(V2,V3))))) :- x_cid(a65b12504cc73e,V1,V2,V3).
xc_microtheory(a65b12504cc73e,x_BiologyMt).
xc_source_file(a65b12504cc73e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc73e,3801).
xc_kb_names(a65b12504cc73e,["?EV","?OFF","?TYPE"]).
xc_mapping_rows(a65b12504cc73e,['implication-implies','exists-thereexists']).
xc_direction(a65b12504cc73e,':BACKWARD').
xc_monotonicity(a65b12504cc73e,':DEFAULT').
xc_creator(a65b12504cc73e,'Cyc').
xc_creation_date(a65b12504cc73e,142230).
x_isa(x_BiologicalSubphylum,x_CollectionType) :- x_cid(a65b12504cc73f).
xc_microtheory(a65b12504cc73f,x_BiologyMt).
xc_source_file(a65b12504cc73f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc73f,3816).
xc_kb_names(a65b12504cc73f,[]).
xc_mapping_rows(a65b12504cc73f,[]).
xc_direction(a65b12504cc73f,':FORWARD').
xc_monotonicity(a65b12504cc73f,':DEFAULT').
x_genls(x_Antibody,x_MolecularStuff) :- x_cid(a65b12504cc740).
xc_microtheory(a65b12504cc740,x_BiologyMt).
xc_source_file(a65b12504cc740,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc740,3822).
xc_kb_names(a65b12504cc740,[]).
xc_mapping_rows(a65b12504cc740,[]).
xc_direction(a65b12504cc740,':FORWARD').
xc_monotonicity(a65b12504cc740,':DEFAULT').
xc_creator(a65b12504cc740,'Cyc').
x_superTaxons(x_Dog,x_CanineAnimal) :- x_cid(a65b12504cc741).
xc_microtheory(a65b12504cc741,x_BiologyMt).
xc_source_file(a65b12504cc741,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc741,3828).
xc_kb_names(a65b12504cc741,[]).
xc_mapping_rows(a65b12504cc741,[]).
xc_direction(a65b12504cc741,':FORWARD').
xc_monotonicity(a65b12504cc741,':DEFAULT').
xc_creator(a65b12504cc741,'Cyc').
x_isa(x_ScatFn,x_ReifiableFunction) :- x_cid(a65b12504cc742).
xc_microtheory(a65b12504cc742,x_BiologyMt).
xc_source_file(a65b12504cc742,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc742,3834).
xc_kb_names(a65b12504cc742,[]).
xc_mapping_rows(a65b12504cc742,[]).
xc_direction(a65b12504cc742,':FORWARD').
xc_monotonicity(a65b12504cc742,':MONOTONIC').
xc_creator(a65b12504cc742,'Cyc').
xc_creation_date(a65b12504cc742,101804).
x_isa(x_Antibody,x_ChemicalCompoundType) :- x_cid(a65b12504cc743).
xc_microtheory(a65b12504cc743,x_BiologyMt).
xc_source_file(a65b12504cc743,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc743,3840).
xc_kb_names(a65b12504cc743,[]).
xc_mapping_rows(a65b12504cc743,[]).
xc_direction(a65b12504cc743,':FORWARD').
xc_monotonicity(a65b12504cc743,':MONOTONIC').
xc_creator(a65b12504cc743,'Cyc').
x_comment(x_BacteriumTypeBySporulationAbility,"A partition on the collection #$Bacterium, reflecting class\nability or inability to form endospores.") :- x_cid(a65b12504cc744).
xc_microtheory(a65b12504cc744,x_BiologyMt).
xc_source_file(a65b12504cc744,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc744,3846).
xc_kb_names(a65b12504cc744,[]).
xc_mapping_rows(a65b12504cc744,[]).
xc_direction(a65b12504cc744,':FORWARD').
xc_monotonicity(a65b12504cc744,':DEFAULT').
xc_creator(a65b12504cc744,'Cyc').
xc_creation_date(a65b12504cc744,163214).
x_argIsa(x_InstantiationInstanceFn(x_organismTypeCanLethallyInfect,x_TheSet(1,2)),1,'x_Organism-Whole') :- x_cid(a65b12504cc745).
xc_microtheory(a65b12504cc745,x_BiologyMt).
xc_source_file(a65b12504cc745,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc745,3853).
xc_kb_names(a65b12504cc745,[]).
xc_mapping_rows(a65b12504cc745,[]).
xc_direction(a65b12504cc745,':FORWARD').
xc_monotonicity(a65b12504cc745,':DEFAULT').
x_comment(x_organismTypeCanLethallyInfect,"(#$organismTypeCanLethallyInfect ?ORGTYPE ?HOSTTYPE) means that under ordinary circumstances, instances of ?ORGTYPE are able to play the role of #$infectingOrganism in instances of #$Infection which culminate in the death of an instance of ?HOSTTYPE.") :- x_cid(a65b12504cc746).
xc_microtheory(a65b12504cc746,x_BiologyMt).
xc_source_file(a65b12504cc746,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc746,3861).
xc_kb_names(a65b12504cc746,[]).
xc_mapping_rows(a65b12504cc746,[]).
xc_direction(a65b12504cc746,':FORWARD').
xc_monotonicity(a65b12504cc746,':MONOTONIC').
xc_creator(a65b12504cc746,'Cyc').
x_argIsa(x_carriesOrganismType,2,x_OrganismClassificationType) :- x_cid(a65b12504cc747).
xc_microtheory(a65b12504cc747,x_BiologyMt).
xc_source_file(a65b12504cc747,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc747,3867).
xc_kb_names(a65b12504cc747,[]).
xc_mapping_rows(a65b12504cc747,[]).
xc_direction(a65b12504cc747,':FORWARD').
xc_monotonicity(a65b12504cc747,':MONOTONIC').
x_comment('x_Spore-DormantBacterium',"The collection of bacterial spores. An\ninstance of #$Spore-DormantBacterium is the product of sporulation - when\nin a hostile environment, some bacteria, see #$SporeFormingBacterium,\nbecome dormant in order to survive. #$Spore-DormantBacteriums are well\nresistant to heat, chemicals and radiation. In certain conditions, they may\nlast for years. Spores can germinate into a single new vegetative cell, see\n#$BacterialSporeGermination, when environment is favorable. Do not confuse\nbacterial spores with spores of certain plants or fungi, for these later\nsee #$Spore-PlantOrgan. ") :- x_cid(a65b12504cc748).
xc_microtheory(a65b12504cc748,x_BiologyMt).
xc_source_file(a65b12504cc748,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc748,3873).
xc_kb_names(a65b12504cc748,[]).
xc_mapping_rows(a65b12504cc748,[]).
xc_direction(a65b12504cc748,':FORWARD').
xc_monotonicity(a65b12504cc748,':DEFAULT').
xc_creator(a65b12504cc748,'Cyc').
xc_creation_date(a65b12504cc748,155658).
x_genls(x_Staphylococcus,x_ProkaryoticCell) :- x_cid(a65b12504cc749).
xc_microtheory(a65b12504cc749,x_BiologyMt).
xc_source_file(a65b12504cc749,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc749,3887).
xc_kb_names(a65b12504cc749,[]).
xc_mapping_rows(a65b12504cc749,[]).
xc_direction(a65b12504cc749,':FORWARD').
xc_monotonicity(a65b12504cc749,':DEFAULT').
xc_creator(a65b12504cc749,'Cyc').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_AnatomicalVessel,1) :- x_cid(a65b12504cc74a).
xc_microtheory(a65b12504cc74a,x_BiologyMt).
xc_source_file(a65b12504cc74a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc74a,3893).
xc_kb_names(a65b12504cc74a,[]).
xc_mapping_rows(a65b12504cc74a,[]).
xc_direction(a65b12504cc74a,':FORWARD').
xc_monotonicity(a65b12504cc74a,':DEFAULT').
xc_creator(a65b12504cc74a,'Cyc').
x_negationAttribute(x_VegetativeCellAttribute,x_EndosporeAttribute) :- x_cid(a65b12504cc74b).
xc_microtheory(a65b12504cc74b,x_BiologyMt).
xc_source_file(a65b12504cc74b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc74b,3899).
xc_kb_names(a65b12504cc74b,[]).
xc_mapping_rows(a65b12504cc74b,[]).
xc_direction(a65b12504cc74b,':FORWARD').
xc_monotonicity(a65b12504cc74b,':DEFAULT').
xc_creator(a65b12504cc74b,'Cyc').
x_resultGenl(x_BacterialSporeFn,x_SporeFormingBacterium) :- x_cid(a65b12504cc74c).
xc_microtheory(a65b12504cc74c,x_BiologyMt).
xc_source_file(a65b12504cc74c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc74c,3905).
xc_kb_names(a65b12504cc74c,[]).
xc_mapping_rows(a65b12504cc74c,[]).
xc_direction(a65b12504cc74c,':FORWARD').
xc_monotonicity(a65b12504cc74c,':MONOTONIC').
x_implies(x_and(x_isa(V1,x_BacterialSporeGermination),x_objectOfStateChange(V1,V2)),x_isa(V2,'x_Spore-DormantBacterium')) :- x_cid(a65b12504cc74d,V1,V2).
xc_microtheory(a65b12504cc74d,x_BiologyMt).
xc_source_file(a65b12504cc74d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc74d,3911).
xc_kb_names(a65b12504cc74d,["?EVENT","?SPORE"]).
xc_mapping_rows(a65b12504cc74d,['implication-implies']).
xc_direction(a65b12504cc74d,':BACKWARD').
xc_monotonicity(a65b12504cc74d,':DEFAULT').
xc_creator(a65b12504cc74d,'Cyc').
xc_creation_date(a65b12504cc74d,152123).
x_comment('x_Plague-Bacterium',"A #$Collection.  Each instance is a sample of Yersinia pestis, a #$Bacterium that causes the Plague.") :- x_cid(a65b12504cc74e).
xc_microtheory(a65b12504cc74e,x_BiologyMt).
xc_source_file(a65b12504cc74e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc74e,3921).
xc_kb_names(a65b12504cc74e,[]).
xc_mapping_rows(a65b12504cc74e,[]).
xc_direction(a65b12504cc74e,':FORWARD').
xc_monotonicity(a65b12504cc74e,':DEFAULT').
xc_creator(a65b12504cc74e,'Cyc').
x_arg1Isa(x_ingestingToxicityFor,x_PartiallyTangible) :- x_cid(a65b12504cc74f).
xc_microtheory(a65b12504cc74f,x_BiologyMt).
xc_source_file(a65b12504cc74f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc74f,3927).
xc_kb_names(a65b12504cc74f,[]).
xc_mapping_rows(a65b12504cc74f,[]).
xc_direction(a65b12504cc74f,':FORWARD').
xc_monotonicity(a65b12504cc74f,':MONOTONIC').
xc_creator(a65b12504cc74f,'Cyc').
xc_creation_date(a65b12504cc74f,184610).
x_comment(x_BacterialPhysiologicalAttribute,"The collection of\n#$AttributeValues that are #$PhysiologicalAttributes specific to\n#$Bacterium. Examples of this are #$GramNegative and #$GramPositive.\nNegative examples would be #$AerobicPhysiology and #$AnaerobicPhysiology which may\napply to #$EukaryoticCells as well as #$ProkaryoticCells.") :- x_cid(a65b12504cc750).
xc_microtheory(a65b12504cc750,x_BiologyMt).
xc_source_file(a65b12504cc750,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc750,3933).
xc_kb_names(a65b12504cc750,[]).
xc_mapping_rows(a65b12504cc750,[]).
xc_direction(a65b12504cc750,':FORWARD').
xc_monotonicity(a65b12504cc750,':DEFAULT').
xc_creator(a65b12504cc750,'Cyc').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole','x_Shell-AnimalBodyPart',1) :- x_cid(a65b12504cc751).
xc_microtheory(a65b12504cc751,x_BiologyMt).
xc_source_file(a65b12504cc751,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc751,3943).
xc_kb_names(a65b12504cc751,[]).
xc_mapping_rows(a65b12504cc751,[]).
xc_direction(a65b12504cc751,':FORWARD').
xc_monotonicity(a65b12504cc751,':DEFAULT').
xc_creator(a65b12504cc751,'Cyc').
x_relationAllExistsMax(x_anatomicalParts,'x_Organism-Whole',x_HumanBody,1) :- x_cid(a65b12504cc752).
xc_microtheory(a65b12504cc752,x_BiologyMt).
xc_source_file(a65b12504cc752,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc752,3949).
xc_kb_names(a65b12504cc752,[]).
xc_mapping_rows(a65b12504cc752,[]).
xc_direction(a65b12504cc752,':FORWARD').
xc_monotonicity(a65b12504cc752,':DEFAULT').
x_superTaxons(x_Bird,x_Vertebrate) :- x_cid(a65b12504cc753).
xc_microtheory(a65b12504cc753,x_BiologyMt).
xc_source_file(a65b12504cc753,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc753,3955).
xc_kb_names(a65b12504cc753,[]).
xc_mapping_rows(a65b12504cc753,[]).
xc_direction(a65b12504cc753,':FORWARD').
xc_monotonicity(a65b12504cc753,':DEFAULT').
xc_creator(a65b12504cc753,'Cyc').
x_argIsa(x_contaminatedWithMicroorganismType,2,x_OrganismClassificationType) :- x_cid(a65b12504cc754).
xc_microtheory(a65b12504cc754,x_BiologyMt).
xc_source_file(a65b12504cc754,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc754,3961).
xc_kb_names(a65b12504cc754,[]).
xc_mapping_rows(a65b12504cc754,[]).
xc_direction(a65b12504cc754,':FORWARD').
xc_monotonicity(a65b12504cc754,':MONOTONIC').
x_arity(x_objectExposed,2) :- x_cid(a65b12504cc755).
xc_microtheory(a65b12504cc755,x_BiologyMt).
xc_source_file(a65b12504cc755,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc755,3967).
xc_kb_names(a65b12504cc755,[]).
xc_mapping_rows(a65b12504cc755,[]).
xc_direction(a65b12504cc755,':FORWARD').
xc_monotonicity(a65b12504cc755,':DEFAULT').
x_isa(x_BacteriumTypeByAerobicity,x_DisjointSetOrCollection) :- x_cid(a65b12504cc756).
xc_microtheory(a65b12504cc756,x_BiologyMt).
xc_source_file(a65b12504cc756,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc756,3973).
xc_kb_names(a65b12504cc756,[]).
xc_mapping_rows(a65b12504cc756,[]).
xc_direction(a65b12504cc756,':FORWARD').
xc_monotonicity(a65b12504cc756,':DEFAULT').
xc_creator(a65b12504cc756,'Cyc').
x_isa(x_AttemptingFn(x_MakingFn(x_ChemicalWeapon)),x_Collection) :- x_cid(a65b12504cc757).
xc_microtheory(a65b12504cc757,x_BiologyMt).
xc_source_file(a65b12504cc757,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc757,3979).
xc_kb_names(a65b12504cc757,[]).
xc_mapping_rows(a65b12504cc757,[]).
xc_direction(a65b12504cc757,':FORWARD').
xc_monotonicity(a65b12504cc757,':DEFAULT').
x_isa(x_MobFn(x_BacterialSporeFn('x_Anthrax-Bacterium')),x_StuffType) :- x_cid(a65b12504cc758).
xc_microtheory(a65b12504cc758,x_BiologyMt).
xc_source_file(a65b12504cc758,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc758,3987).
xc_kb_names(a65b12504cc758,[]).
xc_mapping_rows(a65b12504cc758,[]).
xc_direction(a65b12504cc758,':FORWARD').
xc_monotonicity(a65b12504cc758,':MONOTONIC').
x_arg1Isa(x_exposureOfObjectToSubstanceType,x_ExposureToSubstance) :- x_cid(a65b12504cc759).
xc_microtheory(a65b12504cc759,x_BiologyMt).
xc_source_file(a65b12504cc759,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc759,3995).
xc_kb_names(a65b12504cc759,[]).
xc_mapping_rows(a65b12504cc759,[]).
xc_direction(a65b12504cc759,':FORWARD').
xc_monotonicity(a65b12504cc759,':MONOTONIC').
xc_creator(a65b12504cc759,'Cyc').
xc_creation_date(a65b12504cc759,163147).
x_genls(x_Bird,x_TerrestrialOrganism) :- x_cid(a65b12504cc75a).
xc_microtheory(a65b12504cc75a,x_BiologyMt).
xc_source_file(a65b12504cc75a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc75a,4001).
xc_kb_names(a65b12504cc75a,[]).
xc_mapping_rows(a65b12504cc75a,[]).
xc_direction(a65b12504cc75a,':FORWARD').
xc_monotonicity(a65b12504cc75a,':DEFAULT').
xc_creator(a65b12504cc75a,'Cyc').
x_cyclistNotes(x_BacteriumTypeByStructure,"Strictly speaking, this morphological division is considered to apply to Eubacteria only, and not to Archaebacteria.  As these additional taxonomic distinctions are introduced into the Cyc knowledge base, appropriate adjustments in representation will be made.  Also, it should be noted that the traditional phylogenetic division of the Eubacteria into baccillus, coccus, and spirilla has been replaced to some extent by a phylogeny based on biochemical properties.") :- x_cid(a65b12504cc75b).
xc_microtheory(a65b12504cc75b,x_BiologyMt).
xc_source_file(a65b12504cc75b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc75b,4007).
xc_kb_names(a65b12504cc75b,[]).
xc_mapping_rows(a65b12504cc75b,[]).
xc_direction(a65b12504cc75b,':FORWARD').
xc_monotonicity(a65b12504cc75b,':MONOTONIC').
xc_creator(a65b12504cc75b,'Cyc').
xc_creation_date(a65b12504cc75b,173959).
x_arity(x_killedByExposure,2) :- x_cid(a65b12504cc75c).
xc_microtheory(a65b12504cc75c,x_BiologyMt).
xc_source_file(a65b12504cc75c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc75c,4013).
xc_kb_names(a65b12504cc75c,[]).
xc_mapping_rows(a65b12504cc75c,[]).
xc_direction(a65b12504cc75c,':FORWARD').
xc_monotonicity(a65b12504cc75c,':DEFAULT').
xc_creator(a65b12504cc75c,'Cyc').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Brain,1) :- x_cid(a65b12504cc75d).
xc_microtheory(a65b12504cc75d,x_BiologyMt).
xc_source_file(a65b12504cc75d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc75d,4019).
xc_kb_names(a65b12504cc75d,[]).
xc_mapping_rows(a65b12504cc75d,[]).
xc_direction(a65b12504cc75d,':FORWARD').
xc_monotonicity(a65b12504cc75d,':DEFAULT').
xc_creator(a65b12504cc75d,'Cyc').
x_resultGenl(x_HairMobFn,x_CollectionUnionFn(x_TheSet(x_SolidTangibleThing(x_SemiSolidTangibleThing)))) :- x_cid(a65b12504cc75e).
xc_microtheory(a65b12504cc75e,x_BiologyMt).
xc_source_file(a65b12504cc75e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc75e,4025).
xc_kb_names(a65b12504cc75e,[]).
xc_mapping_rows(a65b12504cc75e,[]).
xc_direction(a65b12504cc75e,':FORWARD').
xc_monotonicity(a65b12504cc75e,':DEFAULT').
xc_creator(a65b12504cc75e,'Cyc').
x_genls(x_SmugglingFn('x_Anthrax-Bacterium'),'x_Conveying-Generic') :- x_cid(a65b12504cc75f).
xc_microtheory(a65b12504cc75f,x_BiologyMt).
xc_source_file(a65b12504cc75f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc75f,4034).
xc_kb_names(a65b12504cc75f,[]).
xc_mapping_rows(a65b12504cc75f,[]).
xc_direction(a65b12504cc75f,':FORWARD').
xc_monotonicity(a65b12504cc75f,':DEFAULT').
x_genls(x_SpermCell,x_AnimalBLO) :- x_cid(a65b12504cc760).
xc_microtheory(a65b12504cc760,x_BiologyMt).
xc_source_file(a65b12504cc760,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc760,4041).
xc_kb_names(a65b12504cc760,[]).
xc_mapping_rows(a65b12504cc760,[]).
xc_direction(a65b12504cc760,':FORWARD').
xc_monotonicity(a65b12504cc760,':MONOTONIC').
xc_creator(a65b12504cc760,'Cyc').
x_comment(x_HumoralImmuneResponse,"A collection, spec of #$ImmuneResponse. Those #$ImmuneResponse\nthat are antibody-mediated, see #$Antibody. It is an important defense\nagainst organisms that produce toxins or have polysaccharide capsules taht\ninterfere with the phagocytosis.") :- x_cid(a65b12504cc761).
xc_microtheory(a65b12504cc761,x_BiologyMt).
xc_source_file(a65b12504cc761,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc761,4047).
xc_kb_names(a65b12504cc761,[]).
xc_mapping_rows(a65b12504cc761,[]).
xc_direction(a65b12504cc761,':FORWARD').
xc_monotonicity(a65b12504cc761,':DEFAULT').
xc_creator(a65b12504cc761,'Cyc').
x_organismTypeCanLethallyInfect('x_Anthrax-Bacterium',x_Mammal) :- x_cid(a65b12504cc762).
xc_microtheory(a65b12504cc762,x_BiologyMt).
xc_source_file(a65b12504cc762,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc762,4056).
xc_kb_names(a65b12504cc762,[]).
xc_mapping_rows(a65b12504cc762,[]).
xc_direction(a65b12504cc762,':FORWARD').
xc_monotonicity(a65b12504cc762,':DEFAULT').
xc_creator(a65b12504cc762,'Cyc').
xc_creation_date(a65b12504cc762,150535).
x_comment(x_BacillusBacterium,"A specialization of #$Bacterium whose instances are characterized by having cylindrical or rod-like shape.") :- x_cid(a65b12504cc763).
xc_microtheory(a65b12504cc763,x_BiologyMt).
xc_source_file(a65b12504cc763,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc763,4062).
xc_kb_names(a65b12504cc763,[]).
xc_mapping_rows(a65b12504cc763,[]).
xc_direction(a65b12504cc763,':FORWARD').
xc_monotonicity(a65b12504cc763,':MONOTONIC').
xc_creator(a65b12504cc763,'Cyc').
xc_creation_date(a65b12504cc763,173235).
x_implies(x_and(x_isa(V1,x_BiologicalReproductionEvent),x_parentActors(V1,V2)),x_keStrongSuggestion(V2,x_thereExists(V3,x_and(x_isa(V3,x_OrganismClassificationType),x_isa(V2,V3))))) :- x_cid(a65b12504cc764,V1,V2,V3).
xc_microtheory(a65b12504cc764,x_BiologyMt).
xc_source_file(a65b12504cc764,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc764,4068).
xc_kb_names(a65b12504cc764,["?EV","?PAR","?TYPE"]).
xc_mapping_rows(a65b12504cc764,['implication-implies','exists-thereexists']).
xc_direction(a65b12504cc764,':BACKWARD').
xc_monotonicity(a65b12504cc764,':DEFAULT').
xc_creator(a65b12504cc764,'Cyc').
xc_creation_date(a65b12504cc764,142230).
x_genls(x_BiologicalSubphylum,x_BiologicalTaxon) :- x_cid(a65b12504cc765).
xc_microtheory(a65b12504cc765,x_BiologyMt).
xc_source_file(a65b12504cc765,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc765,4083).
xc_kb_names(a65b12504cc765,[]).
xc_mapping_rows(a65b12504cc765,[]).
xc_direction(a65b12504cc765,':FORWARD').
xc_monotonicity(a65b12504cc765,':MONOTONIC').
xc_creator(a65b12504cc765,'Cyc').
xc_creation_date(a65b12504cc765,112053).
x_genls(x_Antibody,x_OrganicStuff) :- x_cid(a65b12504cc766).
xc_microtheory(a65b12504cc766,x_BiologyMt).
xc_source_file(a65b12504cc766,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc766,4089).
xc_kb_names(a65b12504cc766,[]).
xc_mapping_rows(a65b12504cc766,[]).
xc_direction(a65b12504cc766,':FORWARD').
xc_monotonicity(a65b12504cc766,':DEFAULT').
xc_creator(a65b12504cc766,'Cyc').
x_isa(x_Antibody,x_ObjectType) :- x_cid(a65b12504cc767).
xc_microtheory(a65b12504cc767,x_BiologyMt).
xc_source_file(a65b12504cc767,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc767,4095).
xc_kb_names(a65b12504cc767,[]).
xc_mapping_rows(a65b12504cc767,[]).
xc_direction(a65b12504cc767,':FORWARD').
xc_monotonicity(a65b12504cc767,':MONOTONIC').
xc_creator(a65b12504cc767,'Cyc').
x_isa(x_BacteriumTypeBySporulationAbility,x_CollectionType) :- x_cid(a65b12504cc768).
xc_microtheory(a65b12504cc768,x_BiologyMt).
xc_source_file(a65b12504cc768,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc768,4101).
xc_kb_names(a65b12504cc768,[]).
xc_mapping_rows(a65b12504cc768,[]).
xc_direction(a65b12504cc768,':FORWARD').
xc_monotonicity(a65b12504cc768,':DEFAULT').
x_isa(x_RickettsiaQuintana,x_OrganismClassificationType) :- x_cid(a65b12504cc769).
xc_microtheory(a65b12504cc769,x_BiologyMt).
xc_source_file(a65b12504cc769,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc769,4107).
xc_kb_names(a65b12504cc769,[]).
xc_mapping_rows(a65b12504cc769,[]).
xc_direction(a65b12504cc769,':FORWARD').
xc_monotonicity(a65b12504cc769,':MONOTONIC').
xc_creator(a65b12504cc769,'Cyc').
xc_creation_date(a65b12504cc769,100717).
x_argGenl(x_organismTypeCanLethallyInfect,1,'x_Organism-Whole') :- x_cid(a65b12504cc76a).
xc_microtheory(a65b12504cc76a,x_BiologyMt).
xc_source_file(a65b12504cc76a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc76a,4113).
xc_kb_names(a65b12504cc76a,[]).
xc_mapping_rows(a65b12504cc76a,[]).
xc_direction(a65b12504cc76a,':FORWARD').
xc_monotonicity(a65b12504cc76a,':DEFAULT').
x_arg2Isa(x_carriesOrganismType,x_OrganismClassificationType) :- x_cid(a65b12504cc76b).
xc_microtheory(a65b12504cc76b,x_BiologyMt).
xc_source_file(a65b12504cc76b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc76b,4119).
xc_kb_names(a65b12504cc76b,[]).
xc_mapping_rows(a65b12504cc76b,[]).
xc_direction(a65b12504cc76b,':FORWARD').
xc_monotonicity(a65b12504cc76b,':MONOTONIC').
xc_creator(a65b12504cc76b,'Cyc').
xc_creation_date(a65b12504cc76b,123939).
x_genls(x_Staphylococcus,x_MoneraKingdom) :- x_cid(a65b12504cc76c).
xc_microtheory(a65b12504cc76c,x_BiologyMt).
xc_source_file(a65b12504cc76c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc76c,4125).
xc_kb_names(a65b12504cc76c,[]).
xc_mapping_rows(a65b12504cc76c,[]).
xc_direction(a65b12504cc76c,':FORWARD').
xc_monotonicity(a65b12504cc76c,':DEFAULT').
xc_creator(a65b12504cc76c,'Cyc').
x_isa(x_AntibodyIgM,x_ChemicalCompoundType) :- x_cid(a65b12504cc76d).
xc_microtheory(a65b12504cc76d,x_BiologyMt).
xc_source_file(a65b12504cc76d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc76d,4131).
xc_kb_names(a65b12504cc76d,[]).
xc_mapping_rows(a65b12504cc76d,[]).
xc_direction(a65b12504cc76d,':FORWARD').
xc_monotonicity(a65b12504cc76d,':MONOTONIC').
xc_creator(a65b12504cc76d,'Cyc').
x_isa(x_Protozoan,x_BiologicalSubkingdom) :- x_cid(a65b12504cc76e).
xc_microtheory(a65b12504cc76e,x_BiologyMt).
xc_source_file(a65b12504cc76e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc76e,4137).
xc_kb_names(a65b12504cc76e,[]).
xc_mapping_rows(a65b12504cc76e,[]).
xc_direction(a65b12504cc76e,':FORWARD').
xc_monotonicity(a65b12504cc76e,':DEFAULT').
xc_creator(a65b12504cc76e,'Cyc').
x_comment(x_VegetativeCellAttribute,"The #$AttributeValue describing the\nnormal growing form of bacteria that exhibit all of life's\ncharacteristics, such as metabolism and reproduction. The only time the\n#$Bacterium would not have the #$VegetativeCellAttribute is when the cell\nhas acquired the #$EndosporeAttribute or has been killed.") :- x_cid(a65b12504cc76f).
xc_microtheory(a65b12504cc76f,x_BiologyMt).
xc_source_file(a65b12504cc76f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc76f,4143).
xc_kb_names(a65b12504cc76f,[]).
xc_mapping_rows(a65b12504cc76f,[]).
xc_direction(a65b12504cc76f,':FORWARD').
xc_monotonicity(a65b12504cc76f,':DEFAULT').
xc_creator(a65b12504cc76f,'Cyc').
x_argGenl(x_BacterialSporeFn,1,x_SporeFormingBacterium) :- x_cid(a65b12504cc770).
xc_microtheory(a65b12504cc770,x_BiologyMt).
xc_source_file(a65b12504cc770,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc770,4153).
xc_kb_names(a65b12504cc770,[]).
xc_mapping_rows(a65b12504cc770,[]).
xc_direction(a65b12504cc770,':FORWARD').
xc_monotonicity(a65b12504cc770,':MONOTONIC').
x_expansion(x_exposureToType,x_thereExists(V1,x_and(x_isa(V1,':ARG2'),x_stuffInExposureEvent(':ARG1',V1)))) :- x_cid(a65b12504cc771,V1).
xc_microtheory(a65b12504cc771,x_BiologyMt).
xc_source_file(a65b12504cc771,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc771,4159).
xc_kb_names(a65b12504cc771,["?SUB"]).
xc_mapping_rows(a65b12504cc771,['exists-thereexists']).
xc_direction(a65b12504cc771,':FORWARD').
xc_monotonicity(a65b12504cc771,':DEFAULT').
xc_creator(a65b12504cc771,'Cyc').
xc_creation_date(a65b12504cc771,171440).
x_arity(x_ingestingToxicityFor,3) :- x_cid(a65b12504cc772).
xc_microtheory(a65b12504cc772,x_BiologyMt).
xc_source_file(a65b12504cc772,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc772,4170).
xc_kb_names(a65b12504cc772,[]).
xc_mapping_rows(a65b12504cc772,[]).
xc_direction(a65b12504cc772,':FORWARD').
xc_monotonicity(a65b12504cc772,':DEFAULT').
x_arg2Isa(x_contaminatedWithMicroorganismType,x_OrganismClassificationType) :- x_cid(a65b12504cc773).
xc_microtheory(a65b12504cc773,x_BiologyMt).
xc_source_file(a65b12504cc773,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc773,4176).
xc_kb_names(a65b12504cc773,[]).
xc_mapping_rows(a65b12504cc773,[]).
xc_direction(a65b12504cc773,':FORWARD').
xc_monotonicity(a65b12504cc773,':MONOTONIC').
xc_creator(a65b12504cc773,'Cyc').
x_genls(x_AntibodyIgD,x_Antibody) :- x_cid(a65b12504cc774).
xc_microtheory(a65b12504cc774,x_BiologyMt).
xc_source_file(a65b12504cc774,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc774,4182).
xc_kb_names(a65b12504cc774,[]).
xc_mapping_rows(a65b12504cc774,[]).
xc_direction(a65b12504cc774,':FORWARD').
xc_monotonicity(a65b12504cc774,':MONOTONIC').
xc_creator(a65b12504cc774,'Cyc').
x_isa(x_objectExposed,x_ActorSlot) :- x_cid(a65b12504cc775).
xc_microtheory(a65b12504cc775,x_BiologyMt).
xc_source_file(a65b12504cc775,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc775,4188).
xc_kb_names(a65b12504cc775,[]).
xc_mapping_rows(a65b12504cc775,[]).
xc_direction(a65b12504cc775,':FORWARD').
xc_monotonicity(a65b12504cc775,':MONOTONIC').
xc_creator(a65b12504cc775,'Cyc').
xc_creation_date(a65b12504cc775,163147).
x_relationAllInstance(x_fromState,x_EndosporingEvent,x_VegetativeCellAttribute) :- x_cid(a65b12504cc776).
xc_microtheory(a65b12504cc776,x_BiologyMt).
xc_source_file(a65b12504cc776,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc776,4194).
xc_kb_names(a65b12504cc776,[]).
xc_mapping_rows(a65b12504cc776,[]).
xc_direction(a65b12504cc776,':FORWARD').
xc_monotonicity(a65b12504cc776,':DEFAULT').
xc_creator(a65b12504cc776,'Cyc').
x_genls('x_Anthrax-Bacterium',x_SporeFormingBacterium) :- x_cid(a65b12504cc777).
xc_microtheory(a65b12504cc777,x_BiologyMt).
xc_source_file(a65b12504cc777,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc777,4200).
xc_kb_names(a65b12504cc777,[]).
xc_mapping_rows(a65b12504cc777,[]).
xc_direction(a65b12504cc777,':FORWARD').
xc_monotonicity(a65b12504cc777,':DEFAULT').
xc_creator(a65b12504cc777,'Cyc').
xc_creation_date(a65b12504cc777,184533).
x_arity(x_stuffInhaled,2) :- x_cid(a65b12504cc778).
xc_microtheory(a65b12504cc778,x_BiologyMt).
xc_source_file(a65b12504cc778,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc778,4206).
xc_kb_names(a65b12504cc778,[]).
xc_mapping_rows(a65b12504cc778,[]).
xc_direction(a65b12504cc778,':FORWARD').
xc_monotonicity(a65b12504cc778,':DEFAULT').
x_genls(x_AerobicBacterium,x_ProkaryoticCell) :- x_cid(a65b12504cc779).
xc_microtheory(a65b12504cc779,x_BiologyMt).
xc_source_file(a65b12504cc779,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc779,4212).
xc_kb_names(a65b12504cc779,[]).
xc_mapping_rows(a65b12504cc779,[]).
xc_direction(a65b12504cc779,':FORWARD').
xc_monotonicity(a65b12504cc779,':DEFAULT').
xc_creator(a65b12504cc779,'Cyc').
x_genls('x_Vine-Plant',x_TerrestrialOrganism) :- x_cid(a65b12504cc77a).
xc_microtheory(a65b12504cc77a,x_BiologyMt).
xc_source_file(a65b12504cc77a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc77a,4218).
xc_kb_names(a65b12504cc77a,[]).
xc_mapping_rows(a65b12504cc77a,[]).
xc_direction(a65b12504cc77a,':FORWARD').
xc_monotonicity(a65b12504cc77a,':MONOTONIC').
xc_creator(a65b12504cc77a,'Cyc').
x_genls(x_BacteriumTypeByStructure,x_OrganismClassificationType) :- x_cid(a65b12504cc77b).
xc_microtheory(a65b12504cc77b,x_BiologyMt).
xc_source_file(a65b12504cc77b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc77b,4224).
xc_kb_names(a65b12504cc77b,[]).
xc_mapping_rows(a65b12504cc77b,[]).
xc_direction(a65b12504cc77b,':FORWARD').
xc_monotonicity(a65b12504cc77b,':MONOTONIC').
xc_creator(a65b12504cc77b,'Cyc').
x_implies(x_and(x_outputsCreated(V1,V2),x_isa(V2,'x_Secretion-Bodily')),x_isa(V1,x_SecretionEvent)) :- x_cid(a65b12504cc77c,V1,V2).
xc_microtheory(a65b12504cc77c,x_BiologyMt).
xc_source_file(a65b12504cc77c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc77c,4230).
xc_kb_names(a65b12504cc77c,["?SECR-EV","?SB"]).
xc_mapping_rows(a65b12504cc77c,['implication-implies']).
xc_direction(a65b12504cc77c,':BACKWARD').
xc_monotonicity(a65b12504cc77c,':DEFAULT').
xc_creator(a65b12504cc77c,'Cyc').
x_isa(x_killedByExposure,x_BinaryPredicate) :- x_cid(a65b12504cc77d).
xc_microtheory(a65b12504cc77d,x_BiologyMt).
xc_source_file(a65b12504cc77d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc77d,4240).
xc_kb_names(a65b12504cc77d,[]).
xc_mapping_rows(a65b12504cc77d,[]).
xc_direction(a65b12504cc77d,':FORWARD').
xc_monotonicity(a65b12504cc77d,':MONOTONIC').
xc_creator(a65b12504cc77d,'Cyc').
x_resultGenl(x_HairMobFn,x_SheetOfSomeStuff) :- x_cid(a65b12504cc77e).
xc_microtheory(a65b12504cc77e,x_BiologyMt).
xc_source_file(a65b12504cc77e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc77e,4246).
xc_kb_names(a65b12504cc77e,[]).
xc_mapping_rows(a65b12504cc77e,[]).
xc_direction(a65b12504cc77e,':FORWARD').
xc_monotonicity(a65b12504cc77e,':DEFAULT').
xc_creator(a65b12504cc77e,'Cyc').
x_genls(x_HumoralImmuneResponse,x_ImmuneResponse) :- x_cid(a65b12504cc77f).
xc_microtheory(a65b12504cc77f,x_BiologyMt).
xc_source_file(a65b12504cc77f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc77f,4252).
xc_kb_names(a65b12504cc77f,[]).
xc_mapping_rows(a65b12504cc77f,[]).
xc_direction(a65b12504cc77f,':FORWARD').
xc_monotonicity(a65b12504cc77f,':MONOTONIC').
xc_creator(a65b12504cc77f,'Cyc').
x_organismTypeCanLethallyInfect('x_Plague-Bacterium',x_Mammal) :- x_cid(a65b12504cc780).
xc_microtheory(a65b12504cc780,x_BiologyMt).
xc_source_file(a65b12504cc780,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc780,4258).
xc_kb_names(a65b12504cc780,[]).
xc_mapping_rows(a65b12504cc780,[]).
xc_direction(a65b12504cc780,':FORWARD').
xc_monotonicity(a65b12504cc780,':DEFAULT').
xc_creator(a65b12504cc780,'Cyc').
xc_creation_date(a65b12504cc780,150535).
x_cyclistNotes(x_BacillusBacterium,"Strictly speaking, this morphological characterization applies only to instances of Eubacteria.  Appropriate adjustments will be made as our taxonomy grows in sophistication.") :- x_cid(a65b12504cc781).
xc_microtheory(a65b12504cc781,x_BiologyMt).
xc_source_file(a65b12504cc781,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc781,4264).
xc_kb_names(a65b12504cc781,[]).
xc_mapping_rows(a65b12504cc781,[]).
xc_direction(a65b12504cc781,':FORWARD').
xc_monotonicity(a65b12504cc781,':MONOTONIC').
xc_creator(a65b12504cc781,'Cyc').
xc_creation_date(a65b12504cc781,173257).
x_isa(x_ReturnToVegetativeState,x_Collection) :- x_cid(a65b12504cc782).
xc_microtheory(a65b12504cc782,x_BiologyMt).
xc_source_file(a65b12504cc782,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc782,4270).
xc_kb_names(a65b12504cc782,[]).
xc_mapping_rows(a65b12504cc782,[]).
xc_direction(a65b12504cc782,':FORWARD').
xc_monotonicity(a65b12504cc782,':DEFAULT').
xc_creator(a65b12504cc782,'Cyc').
xc_creation_date(a65b12504cc782,173410).
x_isa('x_Anthrax-Bacterium',x_BiologicalSpecies) :- x_cid(a65b12504cc783).
xc_microtheory(a65b12504cc783,x_BiologyMt).
xc_source_file(a65b12504cc783,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc783,4276).
xc_kb_names(a65b12504cc783,[]).
xc_mapping_rows(a65b12504cc783,[]).
xc_direction(a65b12504cc783,':FORWARD').
xc_monotonicity(a65b12504cc783,':MONOTONIC').
xc_creator(a65b12504cc783,'Cyc').
x_keStrongSuggestionPreds(x_BiologicalReproductionEvent,x_parentActors) :- x_cid(a65b12504cc784).
xc_microtheory(a65b12504cc784,x_BiologyMt).
xc_source_file(a65b12504cc784,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc784,4282).
xc_kb_names(a65b12504cc784,[]).
xc_mapping_rows(a65b12504cc784,[]).
xc_direction(a65b12504cc784,':FORWARD').
xc_monotonicity(a65b12504cc784,':DEFAULT').
xc_creator(a65b12504cc784,'Cyc').
xc_creation_date(a65b12504cc784,142230).
x_isa('x_Shell-AnimalBodyPart',x_UniqueAnatomicalPartType) :- x_cid(a65b12504cc785).
xc_microtheory(a65b12504cc785,x_BiologyMt).
xc_source_file(a65b12504cc785,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc785,4288).
xc_kb_names(a65b12504cc785,[]).
xc_mapping_rows(a65b12504cc785,[]).
xc_direction(a65b12504cc785,':FORWARD').
xc_monotonicity(a65b12504cc785,':DEFAULT').
x_genls(x_Macrophage,x_AnimalBLO) :- x_cid(a65b12504cc786).
xc_microtheory(a65b12504cc786,x_BiologyMt).
xc_source_file(a65b12504cc786,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc786,4294).
xc_kb_names(a65b12504cc786,[]).
xc_mapping_rows(a65b12504cc786,[]).
xc_direction(a65b12504cc786,':FORWARD').
xc_monotonicity(a65b12504cc786,':DEFAULT').
xc_creator(a65b12504cc786,'Cyc').
x_relationAllExistsMax(x_anatomicalParts,'x_Organism-Whole','x_Head-Vertebrate',1) :- x_cid(a65b12504cc787).
xc_microtheory(a65b12504cc787,x_BiologyMt).
xc_source_file(a65b12504cc787,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc787,4300).
xc_kb_names(a65b12504cc787,[]).
xc_mapping_rows(a65b12504cc787,[]).
xc_direction(a65b12504cc787,':FORWARD').
xc_monotonicity(a65b12504cc787,':DEFAULT').
x_arity(x_organismFoundInSubstance,2) :- x_cid(a65b12504cc788).
xc_microtheory(a65b12504cc788,x_BiologyMt).
xc_source_file(a65b12504cc788,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc788,4306).
xc_kb_names(a65b12504cc788,[]).
xc_mapping_rows(a65b12504cc788,[]).
xc_direction(a65b12504cc788,':FORWARD').
xc_monotonicity(a65b12504cc788,':DEFAULT').
x_genls(x_Person,x_Omnivore) :- x_cid(a65b12504cc789).
xc_microtheory(a65b12504cc789,x_BiologyMt).
xc_source_file(a65b12504cc789,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc789,4312).
xc_kb_names(a65b12504cc789,[]).
xc_mapping_rows(a65b12504cc789,[]).
xc_direction(a65b12504cc789,':FORWARD').
xc_monotonicity(a65b12504cc789,':MONOTONIC').
xc_creator(a65b12504cc789,'Cyc').
x_genls(x_BacteriumTypeBySporulationAbility,x_OrganismClassificationType) :- x_cid(a65b12504cc78a).
xc_microtheory(a65b12504cc78a,x_BiologyMt).
xc_source_file(a65b12504cc78a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc78a,4318).
xc_kb_names(a65b12504cc78a,[]).
xc_mapping_rows(a65b12504cc78a,[]).
xc_direction(a65b12504cc78a,':FORWARD').
xc_monotonicity(a65b12504cc78a,':MONOTONIC').
xc_creator(a65b12504cc78a,'Cyc').
xc_creation_date(a65b12504cc78a,163214).
x_arg1Genl(x_organismTypeCanLethallyInfect,'x_Organism-Whole') :- x_cid(a65b12504cc78b).
xc_microtheory(a65b12504cc78b,x_BiologyMt).
xc_source_file(a65b12504cc78b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc78b,4324).
xc_kb_names(a65b12504cc78b,[]).
xc_mapping_rows(a65b12504cc78b,[]).
xc_direction(a65b12504cc78b,':FORWARD').
xc_monotonicity(a65b12504cc78b,':DEFAULT').
xc_creator(a65b12504cc78b,'Cyc').
x_argIsa(x_carriesOrganismType,1,x_PartiallyTangible) :- x_cid(a65b12504cc78c).
xc_microtheory(a65b12504cc78c,x_BiologyMt).
xc_source_file(a65b12504cc78c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc78c,4330).
xc_kb_names(a65b12504cc78c,[]).
xc_mapping_rows(a65b12504cc78c,[]).
xc_direction(a65b12504cc78c,':FORWARD').
xc_monotonicity(a65b12504cc78c,':MONOTONIC').
x_comment('x_Smallpox-Virus',"A #$Collection. Each instance is a sample of the #$Virus that causes the Smallpox disease.") :- x_cid(a65b12504cc78d).
xc_microtheory(a65b12504cc78d,x_BiologyMt).
xc_source_file(a65b12504cc78d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc78d,4336).
xc_kb_names(a65b12504cc78d,[]).
xc_mapping_rows(a65b12504cc78d,[]).
xc_direction(a65b12504cc78d,':FORWARD').
xc_monotonicity(a65b12504cc78d,':DEFAULT').
xc_creator(a65b12504cc78d,'Cyc').
x_arg3Isa('x_SKF-33612495',x_AnimalBodyPartType) :- x_cid(a65b12504cc78e).
xc_microtheory(a65b12504cc78e,x_BiologyMt).
xc_source_file(a65b12504cc78e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc78e,4342).
xc_kb_names(a65b12504cc78e,[]).
xc_mapping_rows(a65b12504cc78e,[]).
xc_direction(a65b12504cc78e,':FORWARD').
xc_monotonicity(a65b12504cc78e,':DEFAULT').
xc_creator(a65b12504cc78e,'Cyc').
x_comment('x_Cyanosis-PhysiologicalCondition',"A collection of the #$PhysiologicalConditions defined as bluish\ndiscolorations, applied especially to such discoloration of #$Skin and\nmucuous membranes due to excessive concentration of reduced hemoglobin in\nthe #$Blood.") :- x_cid(a65b12504cc78f).
xc_microtheory(a65b12504cc78f,x_BiologyMt).
xc_source_file(a65b12504cc78f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc78f,4348).
xc_kb_names(a65b12504cc78f,[]).
xc_mapping_rows(a65b12504cc78f,[]).
xc_direction(a65b12504cc78f,':FORWARD').
xc_monotonicity(a65b12504cc78f,':DEFAULT').
xc_creator(a65b12504cc78f,'Cyc').
xc_creation_date(a65b12504cc78f,121333).
x_arg1Genl(x_BacterialSporeFn,x_SporeFormingBacterium) :- x_cid(a65b12504cc790).
xc_microtheory(a65b12504cc790,x_BiologyMt).
xc_source_file(a65b12504cc790,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc790,4357).
xc_kb_names(a65b12504cc790,[]).
xc_mapping_rows(a65b12504cc790,[]).
xc_direction(a65b12504cc790,':FORWARD').
xc_monotonicity(a65b12504cc790,':MONOTONIC').
xc_creator(a65b12504cc790,'Cyc').
xc_creation_date(a65b12504cc790,165002).
x_implies(x_and(x_isa(V1,x_UniqueAnatomicalPartType),x_isa(V2,V1),x_anatomicalParts(V3,V2),x_anatomicalParts(V3,V4),x_isa(V4,V5),x_relationExistsAll(x_physicalParts,V1,V5)),x_physicalParts(V2,V4)) :- x_cid(a65b12504cc791,V1,V2,V3,V4,V5).
xc_microtheory(a65b12504cc791,x_BiologyMt).
xc_source_file(a65b12504cc791,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc791,4363).
xc_kb_names(a65b12504cc791,["?BIGTYPE","?BIG","?ORG","?SMALL","?SMALLTYPE"]).
xc_mapping_rows(a65b12504cc791,['implication-implies']).
xc_direction(a65b12504cc791,':BACKWARD').
xc_monotonicity(a65b12504cc791,':DEFAULT').
xc_creator(a65b12504cc791,'Cyc').
x_implies(x_and(x_isa(V1,x_BiologicalSpecies),x_isa(V2,V1)),x_memberOfSpecies(V2,V1)) :- x_cid(a65b12504cc792,V1,V2).
xc_microtheory(a65b12504cc792,x_BiologyMt).
xc_source_file(a65b12504cc792,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc792,4377).
xc_kb_names(a65b12504cc792,["?SPEC","?MEM"]).
xc_mapping_rows(a65b12504cc792,['implication-implies']).
xc_direction(a65b12504cc792,':BACKWARD').
xc_monotonicity(a65b12504cc792,':DEFAULT').
xc_creator(a65b12504cc792,'Cyc').
x_examplePredFormulas(x_carriesOrganism,x_carriesOrganism(x_MmeBertrand,x_MmeBertrandLouse1)) :- x_cid(a65b12504cc793).
xc_microtheory(a65b12504cc793,x_BiologyMt).
xc_source_file(a65b12504cc793,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc793,4387).
xc_kb_names(a65b12504cc793,[]).
xc_mapping_rows(a65b12504cc793,[]).
xc_direction(a65b12504cc793,':FORWARD').
xc_monotonicity(a65b12504cc793,':MONOTONIC').
xc_creator(a65b12504cc793,'Cyc').
xc_creation_date(a65b12504cc793,142639).
x_implies(x_and(x_isa(V1,x_PhysiologicalCondition),x_bodilyDoer(V1,V2),x_actorPartsAffected(V1,V3)),x_anatomicalParts(V2,V3)) :- x_cid(a65b12504cc794,V1,V2,V3).
xc_microtheory(a65b12504cc794,x_BiologyMt).
xc_source_file(a65b12504cc794,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc794,4394).
xc_kb_names(a65b12504cc794,["?AIL","?DOER","?PART"]).
xc_mapping_rows(a65b12504cc794,['implication-implies']).
xc_direction(a65b12504cc794,':BACKWARD').
xc_monotonicity(a65b12504cc794,':DEFAULT').
xc_creator(a65b12504cc794,'Cyc').
xc_creation_date(a65b12504cc794,174527).
x_isa(x_ingestingToxicityFor,x_TernaryPredicate) :- x_cid(a65b12504cc795).
xc_microtheory(a65b12504cc795,x_BiologyMt).
xc_source_file(a65b12504cc795,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc795,4405).
xc_kb_names(a65b12504cc795,[]).
xc_mapping_rows(a65b12504cc795,[]).
xc_direction(a65b12504cc795,':FORWARD').
xc_monotonicity(a65b12504cc795,':MONOTONIC').
xc_creator(a65b12504cc795,'Cyc').
xc_creation_date(a65b12504cc795,184610).
x_isa('x_Plague-Bacterium',x_OrganismClassificationType) :- x_cid(a65b12504cc796).
xc_microtheory(a65b12504cc796,x_BiologyMt).
xc_source_file(a65b12504cc796,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc796,4411).
xc_kb_names(a65b12504cc796,[]).
xc_mapping_rows(a65b12504cc796,[]).
xc_direction(a65b12504cc796,':FORWARD').
xc_monotonicity(a65b12504cc796,':MONOTONIC').
xc_creator(a65b12504cc796,'Cyc').
x_genls('x_Plague-Bacterium',x_ProkaryoticCell) :- x_cid(a65b12504cc797).
xc_microtheory(a65b12504cc797,x_BiologyMt).
xc_source_file(a65b12504cc797,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc797,4417).
xc_kb_names(a65b12504cc797,[]).
xc_mapping_rows(a65b12504cc797,[]).
xc_direction(a65b12504cc797,':FORWARD').
xc_monotonicity(a65b12504cc797,':DEFAULT').
xc_creator(a65b12504cc797,'Cyc').
x_argIsa(x_contaminatedWithMicroorganismType,1,x_PartiallyTangible) :- x_cid(a65b12504cc798).
xc_microtheory(a65b12504cc798,x_BiologyMt).
xc_source_file(a65b12504cc798,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc798,4423).
xc_kb_names(a65b12504cc798,[]).
xc_mapping_rows(a65b12504cc798,[]).
xc_direction(a65b12504cc798,':FORWARD').
xc_monotonicity(a65b12504cc798,':MONOTONIC').
x_relationAllInstance(x_toState,x_EndosporingEvent,x_EndosporeAttribute) :- x_cid(a65b12504cc799).
xc_microtheory(a65b12504cc799,x_BiologyMt).
xc_source_file(a65b12504cc799,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc799,4429).
xc_kb_names(a65b12504cc799,[]).
xc_mapping_rows(a65b12504cc799,[]).
xc_direction(a65b12504cc799,':FORWARD').
xc_monotonicity(a65b12504cc799,':DEFAULT').
xc_creator(a65b12504cc799,'Cyc').
x_isa(x_stuffInhaled,x_ActorSlot) :- x_cid(a65b12504cc79a).
xc_microtheory(a65b12504cc79a,x_BiologyMt).
xc_source_file(a65b12504cc79a,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc79a,4435).
xc_kb_names(a65b12504cc79a,[]).
xc_mapping_rows(a65b12504cc79a,[]).
xc_direction(a65b12504cc79a,':FORWARD').
xc_monotonicity(a65b12504cc79a,':MONOTONIC').
xc_creator(a65b12504cc79a,'Cyc').
xc_creation_date(a65b12504cc79a,160824).
x_genls(x_AerobicBacterium,x_MoneraKingdom) :- x_cid(a65b12504cc79b).
xc_microtheory(a65b12504cc79b,x_BiologyMt).
xc_source_file(a65b12504cc79b,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc79b,4441).
xc_kb_names(a65b12504cc79b,[]).
xc_mapping_rows(a65b12504cc79b,[]).
xc_direction(a65b12504cc79b,':FORWARD').
xc_monotonicity(a65b12504cc79b,':DEFAULT').
xc_creator(a65b12504cc79b,'Cyc').
x_argFormat(x_contactToxicityFor,3,x_IntervalEntry) :- x_cid(a65b12504cc79c).
xc_microtheory(a65b12504cc79c,x_BiologyMt).
xc_source_file(a65b12504cc79c,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc79c,4447).
xc_kb_names(a65b12504cc79c,[]).
xc_mapping_rows(a65b12504cc79c,[]).
xc_direction(a65b12504cc79c,':FORWARD').
xc_monotonicity(a65b12504cc79c,':DEFAULT').
x_relationAllExistsMax(x_anatomicalParts,'x_Organism-Whole','x_Chest-BodyPart',1) :- x_cid(a65b12504cc79d).
xc_microtheory(a65b12504cc79d,x_BiologyMt).
xc_source_file(a65b12504cc79d,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc79d,4453).
xc_kb_names(a65b12504cc79d,[]).
xc_mapping_rows(a65b12504cc79d,[]).
xc_direction(a65b12504cc79d,':FORWARD').
xc_monotonicity(a65b12504cc79d,':DEFAULT').
x_comment(x_inhalingToxicityFor,"(#$inhalingToxicityFor STUFF ORGTYPE TOXLEVEL) means that under ordinary circumstances, stuff has the #$Toxicity TOXLEVEL for instances of ORGTYPE that inhale it.") :- x_cid(a65b12504cc79e).
xc_microtheory(a65b12504cc79e,x_BiologyMt).
xc_source_file(a65b12504cc79e,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc79e,4459).
xc_kb_names(a65b12504cc79e,[]).
xc_mapping_rows(a65b12504cc79e,[]).
xc_direction(a65b12504cc79e,':FORWARD').
xc_monotonicity(a65b12504cc79e,':DEFAULT').
xc_creator(a65b12504cc79e,'Cyc').
xc_creation_date(a65b12504cc79e,184610).
x_genlPreds(x_memberOfSpecies,x_isa) :- x_cid(a65b12504cc79f).
xc_microtheory(a65b12504cc79f,x_BiologyMt).
xc_source_file(a65b12504cc79f,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc79f,4465).
xc_kb_names(a65b12504cc79f,[]).
xc_mapping_rows(a65b12504cc79f,[]).
xc_direction(a65b12504cc79f,':FORWARD').
xc_monotonicity(a65b12504cc79f,':DEFAULT').
x_isa(x_AttemptingFn(x_ResolveByMediation),x_Collection) :- x_cid(a65b12504cc7a0).
xc_microtheory(a65b12504cc7a0,x_BiologyMt).
xc_source_file(a65b12504cc7a0,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7a0,4471).
xc_kb_names(a65b12504cc7a0,[]).
xc_mapping_rows(a65b12504cc7a0,[]).
xc_direction(a65b12504cc7a0,':FORWARD').
xc_monotonicity(a65b12504cc7a0,':DEFAULT').
x_arity(x_exposureOfObjectToSubstanceType,3) :- x_cid(a65b12504cc7a1).
xc_microtheory(a65b12504cc7a1,x_BiologyMt).
xc_source_file(a65b12504cc7a1,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7a1,4478).
xc_kb_names(a65b12504cc7a1,[]).
xc_mapping_rows(a65b12504cc7a1,[]).
xc_direction(a65b12504cc7a1,':FORWARD').
xc_monotonicity(a65b12504cc7a1,':DEFAULT').
x_argIsa(x_BacterialSporeFn,1,x_ExistingObjectType) :- x_cid(a65b12504cc7a2).
xc_microtheory(a65b12504cc7a2,x_BiologyMt).
xc_source_file(a65b12504cc7a2,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7a2,4484).
xc_kb_names(a65b12504cc7a2,[]).
xc_mapping_rows(a65b12504cc7a2,[]).
xc_direction(a65b12504cc7a2,':FORWARD').
xc_monotonicity(a65b12504cc7a2,':MONOTONIC').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Skin,1) :- x_cid(a65b12504cc7a3).
xc_microtheory(a65b12504cc7a3,x_BiologyMt).
xc_source_file(a65b12504cc7a3,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7a3,4490).
xc_kb_names(a65b12504cc7a3,[]).
xc_mapping_rows(a65b12504cc7a3,[]).
xc_direction(a65b12504cc7a3,':FORWARD').
xc_monotonicity(a65b12504cc7a3,':DEFAULT').
xc_creator(a65b12504cc7a3,'Cyc').
x_resultGenl(x_HairMobFn,x_Mob) :- x_cid(a65b12504cc7a4).
xc_microtheory(a65b12504cc7a4,x_BiologyMt).
xc_source_file(a65b12504cc7a4,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7a4,4496).
xc_kb_names(a65b12504cc7a4,[]).
xc_mapping_rows(a65b12504cc7a4,[]).
xc_direction(a65b12504cc7a4,':FORWARD').
xc_monotonicity(a65b12504cc7a4,':DEFAULT').
xc_creator(a65b12504cc7a4,'Cyc').
x_argGenl(x_immuneWithRespectToPathogen,2,'x_Organism-Whole') :- x_cid(a65b12504cc7a5).
xc_microtheory(a65b12504cc7a5,x_BiologyMt).
xc_source_file(a65b12504cc7a5,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7a5,4502).
xc_kb_names(a65b12504cc7a5,[]).
xc_mapping_rows(a65b12504cc7a5,[]).
xc_direction(a65b12504cc7a5,':FORWARD').
xc_monotonicity(a65b12504cc7a5,':MONOTONIC').
x_implies(x_and(x_isa(V1,x_HumanAdult),x_hasGender(V1,x_Feminine)),x_isa(V1,x_AdultFemalePerson)) :- x_cid(a65b12504cc7a6,V1).
xc_microtheory(a65b12504cc7a6,x_BiologyMt).
xc_source_file(a65b12504cc7a6,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7a6,4508).
xc_kb_names(a65b12504cc7a6,["?PERSON"]).
xc_mapping_rows(a65b12504cc7a6,['implication-implies']).
xc_direction(a65b12504cc7a6,':FORWARD').
xc_monotonicity(a65b12504cc7a6,':DEFAULT').
xc_creator(a65b12504cc7a6,'Cyc').
x_isa(x_CellularImmuneResponse,x_Collection) :- x_cid(a65b12504cc7a7).
xc_microtheory(a65b12504cc7a7,x_BiologyMt).
xc_source_file(a65b12504cc7a7,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7a7,4518).
xc_kb_names(a65b12504cc7a7,[]).
xc_mapping_rows(a65b12504cc7a7,[]).
xc_direction(a65b12504cc7a7,':FORWARD').
xc_monotonicity(a65b12504cc7a7,':DEFAULT').
xc_creator(a65b12504cc7a7,'Cyc').
xc_creation_date(a65b12504cc7a7,173409).
x_keStrongSuggestionPreds(x_BiologicalReproductionEvent,x_offspringActors) :- x_cid(a65b12504cc7a8).
xc_microtheory(a65b12504cc7a8,x_BiologyMt).
xc_source_file(a65b12504cc7a8,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7a8,4524).
xc_kb_names(a65b12504cc7a8,[]).
xc_mapping_rows(a65b12504cc7a8,[]).
xc_direction(a65b12504cc7a8,':FORWARD').
xc_monotonicity(a65b12504cc7a8,':DEFAULT').
xc_creator(a65b12504cc7a8,'Cyc').
xc_creation_date(a65b12504cc7a8,142230).
x_isa(x_BiologicalSubphylum,x_BiologicalTaxonType) :- x_cid(a65b12504cc7a9).
xc_microtheory(a65b12504cc7a9,x_BiologyMt).
xc_source_file(a65b12504cc7a9,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7a9,4530).
xc_kb_names(a65b12504cc7a9,[]).
xc_mapping_rows(a65b12504cc7a9,[]).
xc_direction(a65b12504cc7a9,':FORWARD').
xc_monotonicity(a65b12504cc7a9,':MONOTONIC').
xc_creator(a65b12504cc7a9,'Cyc').
xc_creation_date(a65b12504cc7a9,112031).
x_genls(x_Macrophage,x_Cell) :- x_cid(a65b12504cc7aa).
xc_microtheory(a65b12504cc7aa,x_BiologyMt).
xc_source_file(a65b12504cc7aa,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7aa,4536).
xc_kb_names(a65b12504cc7aa,[]).
xc_mapping_rows(a65b12504cc7aa,[]).
xc_direction(a65b12504cc7aa,':FORWARD').
xc_monotonicity(a65b12504cc7aa,':DEFAULT').
xc_creator(a65b12504cc7aa,'Cyc').
x_superTaxons(x_Fish,x_Vertebrate) :- x_cid(a65b12504cc7ab).
xc_microtheory(a65b12504cc7ab,x_BiologyMt).
xc_source_file(a65b12504cc7ab,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7ab,4542).
xc_kb_names(a65b12504cc7ab,[]).
xc_mapping_rows(a65b12504cc7ab,[]).
xc_direction(a65b12504cc7ab,':FORWARD').
xc_monotonicity(a65b12504cc7ab,':DEFAULT').
xc_creator(a65b12504cc7ab,'Cyc').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole','x_Foot-AnimalBodyPart',1) :- x_cid(a65b12504cc7ac).
xc_microtheory(a65b12504cc7ac,x_BiologyMt).
xc_source_file(a65b12504cc7ac,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7ac,4548).
xc_kb_names(a65b12504cc7ac,[]).
xc_mapping_rows(a65b12504cc7ac,[]).
xc_direction(a65b12504cc7ac,':FORWARD').
xc_monotonicity(a65b12504cc7ac,':DEFAULT').
xc_creator(a65b12504cc7ac,'Cyc').
x_isa(x_organismFoundInSubstance,x_BinaryPredicate) :- x_cid(a65b12504cc7ad).
xc_microtheory(a65b12504cc7ad,x_BiologyMt).
xc_source_file(a65b12504cc7ad,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7ad,4554).
xc_kb_names(a65b12504cc7ad,[]).
xc_mapping_rows(a65b12504cc7ad,[]).
xc_direction(a65b12504cc7ad,':FORWARD').
xc_monotonicity(a65b12504cc7ad,':MONOTONIC').
xc_creator(a65b12504cc7ad,'Cyc').
xc_creation_date(a65b12504cc7ad,223521).
x_arg1Isa(x_InstantiationInstanceFn(x_organismTypeCanLethallyInfect,x_TheSet(1)),x_MicroscopicScaleObject) :- x_cid(a65b12504cc7ae).
xc_microtheory(a65b12504cc7ae,x_BiologyMt).
xc_source_file(a65b12504cc7ae,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7ae,4560).
xc_kb_names(a65b12504cc7ae,[]).
xc_mapping_rows(a65b12504cc7ae,[]).
xc_direction(a65b12504cc7ae,':FORWARD').
xc_monotonicity(a65b12504cc7ae,':DEFAULT').
xc_creator(a65b12504cc7ae,'Cyc').
x_arg1Isa(x_carriesOrganismType,x_PartiallyTangible) :- x_cid(a65b12504cc7af).
xc_microtheory(a65b12504cc7af,x_BiologyMt).
xc_source_file(a65b12504cc7af,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7af,4568).
xc_kb_names(a65b12504cc7af,[]).
xc_mapping_rows(a65b12504cc7af,[]).
xc_direction(a65b12504cc7af,':FORWARD').
xc_monotonicity(a65b12504cc7af,':MONOTONIC').
xc_creator(a65b12504cc7af,'Cyc').
xc_creation_date(a65b12504cc7af,123939).
x_genls('x_Smallpox-Virus',x_Virus) :- x_cid(a65b12504cc7b0).
xc_microtheory(a65b12504cc7b0,x_BiologyMt).
xc_source_file(a65b12504cc7b0,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7b0,4574).
xc_kb_names(a65b12504cc7b0,[]).
xc_mapping_rows(a65b12504cc7b0,[]).
xc_direction(a65b12504cc7b0,':FORWARD').
xc_monotonicity(a65b12504cc7b0,':MONOTONIC').
xc_creator(a65b12504cc7b0,'Cyc').
x_arg2Isa('x_SKF-33612495',x_Animal) :- x_cid(a65b12504cc7b1).
xc_microtheory(a65b12504cc7b1,x_BiologyMt).
xc_source_file(a65b12504cc7b1,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7b1,4580).
xc_kb_names(a65b12504cc7b1,[]).
xc_mapping_rows(a65b12504cc7b1,[]).
xc_direction(a65b12504cc7b1,':FORWARD').
xc_monotonicity(a65b12504cc7b1,':DEFAULT').
xc_creator(a65b12504cc7b1,'Cyc').
x_genls(x_ProtectingSomething,'x_Safeguard-Situation') :- x_cid(a65b12504cc7b2).
xc_microtheory(a65b12504cc7b2,x_BiologyMt).
xc_source_file(a65b12504cc7b2,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7b2,4586).
xc_kb_names(a65b12504cc7b2,[]).
xc_mapping_rows(a65b12504cc7b2,[]).
xc_direction(a65b12504cc7b2,':FORWARD').
xc_monotonicity(a65b12504cc7b2,':MONOTONIC').
xc_creator(a65b12504cc7b2,'Cyc').
xc_creation_date(a65b12504cc7b2,111420).
x_genls('x_Cyanosis-PhysiologicalCondition',x_PhysiologicalCondition) :- x_cid(a65b12504cc7b3).
xc_microtheory(a65b12504cc7b3,x_BiologyMt).
xc_source_file(a65b12504cc7b3,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7b3,4592).
xc_kb_names(a65b12504cc7b3,[]).
xc_mapping_rows(a65b12504cc7b3,[]).
xc_direction(a65b12504cc7b3,':FORWARD').
xc_monotonicity(a65b12504cc7b3,':MONOTONIC').
xc_creator(a65b12504cc7b3,'Cyc').
xc_creation_date(a65b12504cc7b3,121333).
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Hand,1) :- x_cid(a65b12504cc7b4).
xc_microtheory(a65b12504cc7b4,x_BiologyMt).
xc_source_file(a65b12504cc7b4,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7b4,4598).
xc_kb_names(a65b12504cc7b4,[]).
xc_mapping_rows(a65b12504cc7b4,[]).
xc_direction(a65b12504cc7b4,':FORWARD').
xc_monotonicity(a65b12504cc7b4,':DEFAULT').
xc_creator(a65b12504cc7b4,'Cyc').
x_isa(x_VegetativeCellAttribute,x_BacterialPhysiologicalAttribute) :- x_cid(a65b12504cc7b5).
xc_microtheory(a65b12504cc7b5,x_BiologyMt).
xc_source_file(a65b12504cc7b5,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7b5,4604).
xc_kb_names(a65b12504cc7b5,[]).
xc_mapping_rows(a65b12504cc7b5,[]).
xc_direction(a65b12504cc7b5,':FORWARD').
xc_monotonicity(a65b12504cc7b5,':MONOTONIC').
xc_creator(a65b12504cc7b5,'Cyc').
x_isa('x_Plague-Bacterium',x_BiologicalSpecies) :- x_cid(a65b12504cc7b6).
xc_microtheory(a65b12504cc7b6,x_BiologyMt).
xc_source_file(a65b12504cc7b6,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7b6,4610).
xc_kb_names(a65b12504cc7b6,[]).
xc_mapping_rows(a65b12504cc7b6,[]).
xc_direction(a65b12504cc7b6,':FORWARD').
xc_monotonicity(a65b12504cc7b6,':MONOTONIC').
xc_creator(a65b12504cc7b6,'Cyc').
x_genls('x_Plague-Bacterium',x_MoneraKingdom) :- x_cid(a65b12504cc7b7).
xc_microtheory(a65b12504cc7b7,x_BiologyMt).
xc_source_file(a65b12504cc7b7,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7b7,4616).
xc_kb_names(a65b12504cc7b7,[]).
xc_mapping_rows(a65b12504cc7b7,[]).
xc_direction(a65b12504cc7b7,':FORWARD').
xc_monotonicity(a65b12504cc7b7,':DEFAULT').
xc_creator(a65b12504cc7b7,'Cyc').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Liver,1) :- x_cid(a65b12504cc7b8).
xc_microtheory(a65b12504cc7b8,x_BiologyMt).
xc_source_file(a65b12504cc7b8,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7b8,4622).
xc_kb_names(a65b12504cc7b8,[]).
xc_mapping_rows(a65b12504cc7b8,[]).
xc_direction(a65b12504cc7b8,':FORWARD').
xc_monotonicity(a65b12504cc7b8,':DEFAULT').
xc_creator(a65b12504cc7b8,'Cyc').
x_arg1Isa(x_contaminatedWithMicroorganismType,x_PartiallyTangible) :- x_cid(a65b12504cc7b9).
xc_microtheory(a65b12504cc7b9,x_BiologyMt).
xc_source_file(a65b12504cc7b9,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7b9,4628).
xc_kb_names(a65b12504cc7b9,[]).
xc_mapping_rows(a65b12504cc7b9,[]).
xc_direction(a65b12504cc7b9,':FORWARD').
xc_monotonicity(a65b12504cc7b9,':MONOTONIC').
xc_creator(a65b12504cc7b9,'Cyc').
x_isa(x_AntibodyIgD,x_ChemicalCompoundType) :- x_cid(a65b12504cc7ba).
xc_microtheory(a65b12504cc7ba,x_BiologyMt).
xc_source_file(a65b12504cc7ba,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7ba,4634).
xc_kb_names(a65b12504cc7ba,[]).
xc_mapping_rows(a65b12504cc7ba,[]).
xc_direction(a65b12504cc7ba,':FORWARD').
xc_monotonicity(a65b12504cc7ba,':MONOTONIC').
xc_creator(a65b12504cc7ba,'Cyc').
x_argFormat(x_ingestingToxicityFor,3,x_IntervalEntry) :- x_cid(a65b12504cc7bb).
xc_microtheory(a65b12504cc7bb,x_BiologyMt).
xc_source_file(a65b12504cc7bb,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7bb,4640).
xc_kb_names(a65b12504cc7bb,[]).
xc_mapping_rows(a65b12504cc7bb,[]).
xc_direction(a65b12504cc7bb,':FORWARD').
xc_monotonicity(a65b12504cc7bb,':DEFAULT').
x_comment(x_Saxitoxin,"A #$Collection. #$Saxitoxin is \na poisonous substance, C10H17N7O4.2HCI, \nfound in certain species of #$Mollusks.") :- x_cid(a65b12504cc7bc).
xc_microtheory(a65b12504cc7bc,x_BiologyMt).
xc_source_file(a65b12504cc7bc,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7bc,4646).
xc_kb_names(a65b12504cc7bc,[]).
xc_mapping_rows(a65b12504cc7bc,[]).
xc_direction(a65b12504cc7bc,':FORWARD').
xc_monotonicity(a65b12504cc7bc,':DEFAULT').
xc_creator(a65b12504cc7bc,'Cyc').
xc_creation_date(a65b12504cc7bc,184643).
x_arg3Format(x_inhalingToxicityFor,x_IntervalEntry) :- x_cid(a65b12504cc7bd).
xc_microtheory(a65b12504cc7bd,x_BiologyMt).
xc_source_file(a65b12504cc7bd,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7bd,4654).
xc_kb_names(a65b12504cc7bd,[]).
xc_mapping_rows(a65b12504cc7bd,[]).
xc_direction(a65b12504cc7bd,':FORWARD').
xc_monotonicity(a65b12504cc7bd,':DEFAULT').
xc_creator(a65b12504cc7bd,'Cyc').
xc_creation_date(a65b12504cc7bd,184610).
x_typedGenlPreds(x_memberOfSpecies,x_isa) :- x_cid(a65b12504cc7be).
xc_microtheory(a65b12504cc7be,x_BiologyMt).
xc_source_file(a65b12504cc7be,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7be,4660).
xc_kb_names(a65b12504cc7be,[]).
xc_mapping_rows(a65b12504cc7be,[]).
xc_direction(a65b12504cc7be,':FORWARD').
xc_monotonicity(a65b12504cc7be,':DEFAULT').
xc_creator(a65b12504cc7be,'Cyc').
x_isa(x_TLymphocyte,x_ExistingObjectType) :- x_cid(a65b12504cc7bf).
xc_microtheory(a65b12504cc7bf,x_BiologyMt).
xc_source_file(a65b12504cc7bf,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7bf,4666).
xc_kb_names(a65b12504cc7bf,[]).
xc_mapping_rows(a65b12504cc7bf,[]).
xc_direction(a65b12504cc7bf,':FORWARD').
xc_monotonicity(a65b12504cc7bf,':MONOTONIC').
xc_creator(a65b12504cc7bf,'Cyc').
x_siblingDisjointExceptions('x_Spore-DormantBacterium','x_Anthrax-Bacterium') :- x_cid(a65b12504cc7c0).
xc_microtheory(a65b12504cc7c0,x_BiologyMt).
xc_source_file(a65b12504cc7c0,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7c0,4672).
xc_kb_names(a65b12504cc7c0,[]).
xc_mapping_rows(a65b12504cc7c0,[]).
xc_direction(a65b12504cc7c0,':FORWARD').
xc_monotonicity(a65b12504cc7c0,':DEFAULT').
xc_creator(a65b12504cc7c0,'Cyc').
xc_creation_date(a65b12504cc7c0,94202).
x_relationAllExists('x_preconditionFor-Events',x_InfectionTransmissionEvent,x_Infection) :- x_cid(a65b12504cc7c1).
xc_microtheory(a65b12504cc7c1,x_BiologyMt).
xc_source_file(a65b12504cc7c1,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7c1,4678).
xc_kb_names(a65b12504cc7c1,[]).
xc_mapping_rows(a65b12504cc7c1,[]).
xc_direction(a65b12504cc7c1,':FORWARD').
xc_monotonicity(a65b12504cc7c1,':DEFAULT').
xc_creator(a65b12504cc7c1,'Cyc').
xc_creation_date(a65b12504cc7c1,152123).
x_comment(x_EndosporeAttribute,"The #$AttributeValue describing the state\nof a bacterium being an #$Endospore.  This occurs when it is experiencing\na hostile environment that would otherwise kill it. The bacterium forms an\n#$Endospore, which is a nongrowing heat-resistant structure within the\ncell. When the environment is no longer threatening, the #$Bacterium can\nrevert back to its normal #$VegetativeCell state.") :- x_cid(a65b12504cc7c2).
xc_microtheory(a65b12504cc7c2,x_BiologyMt).
xc_source_file(a65b12504cc7c2,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7c2,4684).
xc_kb_names(a65b12504cc7c2,[]).
xc_mapping_rows(a65b12504cc7c2,[]).
xc_direction(a65b12504cc7c2,':FORWARD').
xc_monotonicity(a65b12504cc7c2,':DEFAULT').
xc_creator(a65b12504cc7c2,'Cyc').
x_genls(x_Protozoan,x_ProtistaKingdom) :- x_cid(a65b12504cc7c3).
xc_microtheory(a65b12504cc7c3,x_BiologyMt).
xc_source_file(a65b12504cc7c3,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7c3,4695).
xc_kb_names(a65b12504cc7c3,[]).
xc_mapping_rows(a65b12504cc7c3,[]).
xc_direction(a65b12504cc7c3,':FORWARD').
xc_monotonicity(a65b12504cc7c3,':DEFAULT').
x_cyclistNotes('x_Safeguard-Situation',"This should probably be moved to an agents microtheory since it includes events initiated by machines under program control.") :- x_cid(a65b12504cc7c4).
xc_microtheory(a65b12504cc7c4,x_BiologyMt).
xc_source_file(a65b12504cc7c4,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7c4,4701).
xc_kb_names(a65b12504cc7c4,[]).
xc_mapping_rows(a65b12504cc7c4,[]).
xc_direction(a65b12504cc7c4,':FORWARD').
xc_monotonicity(a65b12504cc7c4,':MONOTONIC').
xc_creator(a65b12504cc7c4,'Cyc').
xc_creation_date(a65b12504cc7c4,111259).
x_arg1Isa('x_SKF-33612495',x_Infection) :- x_cid(a65b12504cc7c5).
xc_microtheory(a65b12504cc7c5,x_BiologyMt).
xc_source_file(a65b12504cc7c5,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7c5,4707).
xc_kb_names(a65b12504cc7c5,[]).
xc_mapping_rows(a65b12504cc7c5,[]).
xc_direction(a65b12504cc7c5,':FORWARD').
xc_monotonicity(a65b12504cc7c5,':DEFAULT').
xc_creator(a65b12504cc7c5,'Cyc').
x_isa('x_Smallpox-Virus',x_OrganismClassificationType) :- x_cid(a65b12504cc7c6).
xc_microtheory(a65b12504cc7c6,x_BiologyMt).
xc_source_file(a65b12504cc7c6,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7c6,4713).
xc_kb_names(a65b12504cc7c6,[]).
xc_mapping_rows(a65b12504cc7c6,[]).
xc_direction(a65b12504cc7c6,':FORWARD').
xc_monotonicity(a65b12504cc7c6,':MONOTONIC').
xc_creator(a65b12504cc7c6,'Cyc').
x_arg1Isa(x_InstantiationInstanceFn(x_organismTypeCanLethallyInfect,x_TheSet(1,2)),x_MicroscopicScaleObject) :- x_cid(a65b12504cc7c7).
xc_microtheory(a65b12504cc7c7,x_BiologyMt).
xc_source_file(a65b12504cc7c7,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7c7,4719).
xc_kb_names(a65b12504cc7c7,[]).
xc_mapping_rows(a65b12504cc7c7,[]).
xc_direction(a65b12504cc7c7,':FORWARD').
xc_monotonicity(a65b12504cc7c7,':DEFAULT').
xc_creator(a65b12504cc7c7,'Cyc').
x_comment(x_BacteriumTypeByGramStain,"A collection of collections and a partition on #$Bacterium. This collection partitions #$Bacterium into two disjoint classes, #$GramPositiveBacterium and #$GramNegativeBacterium. The 'Gram Stain' is a test to see what type of cell wall the bacteria has. The #$Bacterium are stained with a violet dye and iodine, then rinsed in alcohol, and stained again with a red dye. The #$GramPositiveBacterium retain the violet dye while the #$GramNegativeBacterium will lose it but keep the red.") :- x_cid(a65b12504cc7c8).
xc_microtheory(a65b12504cc7c8,x_BiologyMt).
xc_source_file(a65b12504cc7c8,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7c8,4727).
xc_kb_names(a65b12504cc7c8,[]).
xc_mapping_rows(a65b12504cc7c8,[]).
xc_direction(a65b12504cc7c8,':FORWARD').
xc_monotonicity(a65b12504cc7c8,':DEFAULT').
xc_creator(a65b12504cc7c8,'Cyc').
xc_creation_date(a65b12504cc7c8,164241).
x_isa(x_BacterialSporeFn('x_Anthrax-Bacterium'),x_ExistingObjectType) :- x_cid(a65b12504cc7c9).
xc_microtheory(a65b12504cc7c9,x_BiologyMt).
xc_source_file(a65b12504cc7c9,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7c9,4733).
xc_kb_names(a65b12504cc7c9,[]).
xc_mapping_rows(a65b12504cc7c9,[]).
xc_direction(a65b12504cc7c9,':FORWARD').
xc_monotonicity(a65b12504cc7c9,':MONOTONIC').
x_genls(x_Neutrophil,x_AnimalBLO) :- x_cid(a65b12504cc7ca).
xc_microtheory(a65b12504cc7ca,x_BiologyMt).
xc_source_file(a65b12504cc7ca,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7ca,4740).
xc_kb_names(a65b12504cc7ca,[]).
xc_mapping_rows(a65b12504cc7ca,[]).
xc_direction(a65b12504cc7ca,':FORWARD').
xc_monotonicity(a65b12504cc7ca,':DEFAULT').
xc_creator(a65b12504cc7ca,'Cyc').
x_comment(x_BiologicalSubphylum,"A collection of #$BiologicalTaxons that is more restrictive than #$BiologicalPhylum.  All instances of a particular #$BiologicalSubspecies have significant traits or collections of traits in common which are not shared by all other members of the same #$BiologicalPhylum.") :- x_cid(a65b12504cc7cb).
xc_microtheory(a65b12504cc7cb,x_BiologyMt).
xc_source_file(a65b12504cc7cb,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7cb,4746).
xc_kb_names(a65b12504cc7cb,[]).
xc_mapping_rows(a65b12504cc7cb,[]).
xc_direction(a65b12504cc7cb,':FORWARD').
xc_monotonicity(a65b12504cc7cb,':MONOTONIC').
xc_creator(a65b12504cc7cb,'Cyc').
xc_creation_date(a65b12504cc7cb,112012).
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_RespiratorySystem,1) :- x_cid(a65b12504cc7cc).
xc_microtheory(a65b12504cc7cc,x_BiologyMt).
xc_source_file(a65b12504cc7cc,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7cc,4752).
xc_kb_names(a65b12504cc7cc,[]).
xc_mapping_rows(a65b12504cc7cc,[]).
xc_direction(a65b12504cc7cc,':FORWARD').
xc_monotonicity(a65b12504cc7cc,':DEFAULT').
xc_creator(a65b12504cc7cc,'Cyc').
x_kePredArgStrongSuggestionPreds(x_offspringActors,1,x_parentActors) :- x_cid(a65b12504cc7cd).
xc_microtheory(a65b12504cc7cd,x_BiologyMt).
xc_source_file(a65b12504cc7cd,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7cd,4758).
xc_kb_names(a65b12504cc7cd,[]).
xc_mapping_rows(a65b12504cc7cd,[]).
xc_direction(a65b12504cc7cd,':FORWARD').
xc_monotonicity(a65b12504cc7cd,':DEFAULT').
xc_creator(a65b12504cc7cd,'Cyc').
xc_creation_date(a65b12504cc7cd,142230).
x_isa(x_HumoralImmuneResponse,x_Collection) :- x_cid(a65b12504cc7ce).
xc_microtheory(a65b12504cc7ce,x_BiologyMt).
xc_source_file(a65b12504cc7ce,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7ce,4764).
xc_kb_names(a65b12504cc7ce,[]).
xc_mapping_rows(a65b12504cc7ce,[]).
xc_direction(a65b12504cc7ce,':FORWARD').
xc_monotonicity(a65b12504cc7ce,':DEFAULT').
xc_creator(a65b12504cc7ce,'Cyc').
xc_creation_date(a65b12504cc7ce,173409).
x_transitiveViaArgInverse(x_organismTypeCanLethallyInfect,x_genls,1) :- x_cid(a65b12504cc7cf).
xc_microtheory(a65b12504cc7cf,x_BiologyMt).
xc_source_file(a65b12504cc7cf,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7cf,4770).
xc_kb_names(a65b12504cc7cf,[]).
xc_mapping_rows(a65b12504cc7cf,[]).
xc_direction(a65b12504cc7cf,':FORWARD').
xc_monotonicity(a65b12504cc7cf,':MONOTONIC').
xc_creator(a65b12504cc7cf,'Cyc').
xc_creation_date(a65b12504cc7cf,150535).
x_arg2Genl(x_immuneWithRespectToPathogen,'x_Organism-Whole') :- x_cid(a65b12504cc7d0).
xc_microtheory(a65b12504cc7d0,x_BiologyMt).
xc_source_file(a65b12504cc7d0,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7d0,4776).
xc_kb_names(a65b12504cc7d0,[]).
xc_mapping_rows(a65b12504cc7d0,[]).
xc_direction(a65b12504cc7d0,':FORWARD').
xc_monotonicity(a65b12504cc7d0,':MONOTONIC').
xc_creator(a65b12504cc7d0,'Cyc').
xc_creation_date(a65b12504cc7d0,104745).
x_resultGenl(x_ScatFn,x_NaturalTangibleStuff) :- x_cid(a65b12504cc7d1).
xc_microtheory(a65b12504cc7d1,x_BiologyMt).
xc_source_file(a65b12504cc7d1,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7d1,4782).
xc_kb_names(a65b12504cc7d1,[]).
xc_mapping_rows(a65b12504cc7d1,[]).
xc_direction(a65b12504cc7d1,':FORWARD').
xc_monotonicity(a65b12504cc7d1,':DEFAULT').
xc_creator(a65b12504cc7d1,'Cyc').
x_relationExistsCountAll(x_anatomicalParts,'x_Organism-Whole',x_Torso,1) :- x_cid(a65b12504cc7d2).
xc_microtheory(a65b12504cc7d2,x_BiologyMt).
xc_source_file(a65b12504cc7d2,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7d2,4788).
xc_kb_names(a65b12504cc7d2,[]).
xc_mapping_rows(a65b12504cc7d2,[]).
xc_direction(a65b12504cc7d2,':FORWARD').
xc_monotonicity(a65b12504cc7d2,':DEFAULT').
xc_creator(a65b12504cc7d2,'Cyc').
x_arg1Isa(x_BacterialSporeFn,x_ExistingObjectType) :- x_cid(a65b12504cc7d3).
xc_microtheory(a65b12504cc7d3,x_BiologyMt).
xc_source_file(a65b12504cc7d3,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7d3,4794).
xc_kb_names(a65b12504cc7d3,[]).
xc_mapping_rows(a65b12504cc7d3,[]).
xc_direction(a65b12504cc7d3,':FORWARD').
xc_monotonicity(a65b12504cc7d3,':MONOTONIC').
xc_creator(a65b12504cc7d3,'Cyc').
x_isa(x_BacteriumTypeByStructure,x_CollectionType) :- x_cid(a65b12504cc7d4).
xc_microtheory(a65b12504cc7d4,x_BiologyMt).
xc_source_file(a65b12504cc7d4,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7d4,4800).
xc_kb_names(a65b12504cc7d4,[]).
xc_mapping_rows(a65b12504cc7d4,[]).
xc_direction(a65b12504cc7d4,':FORWARD').
xc_monotonicity(a65b12504cc7d4,':DEFAULT').
xc_creator(a65b12504cc7d4,'Cyc').
x_isa(x_Fungus,x_BiologicalKingdom) :- x_cid(a65b12504cc7d5).
xc_microtheory(a65b12504cc7d5,x_BiologyMt).
xc_source_file(a65b12504cc7d5,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7d5,4806).
xc_kb_names(a65b12504cc7d5,[]).
xc_mapping_rows(a65b12504cc7d5,[]).
xc_direction(a65b12504cc7d5,':FORWARD').
xc_monotonicity(a65b12504cc7d5,':DEFAULT').
xc_creator(a65b12504cc7d5,'Cyc').
x_isa(x_exposureOfObjectToSubstanceType,x_TernaryPredicate) :- x_cid(a65b12504cc7d6).
xc_microtheory(a65b12504cc7d6,x_BiologyMt).
xc_source_file(a65b12504cc7d6,'c:/snet/petta/repos/openworld_dr/KBs/Biology-IKB.kif').
xc_source_line(a65b12504cc7d6,4812).
xc_kb_names(a65b12504cc7d6,[]).
xc_mapping_rows(a65b12504cc7d6,[]).
xc_direction(a65b12504cc7d6,':FORWARD').
xc_monotonicity(a65b12504cc7d6,':MONOTONIC').
xc_creator(a65b12504cc7d6,'Cyc').
xc_creation_date(a65b12504cc7d6,163147).
kb_cache_footer(footer{count:729,digest:'4bdd5da43c6810ac51ba829c237164827d562f91032223efd562d46794e3accd',headerDigest:fef360c37912b0f10a739645afaea57a6073414d03a51fc9f5a0419f8dedc0f0}).
