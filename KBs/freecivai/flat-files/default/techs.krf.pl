:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:249,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:713,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:f99585c8a20046f5d897649ebaa37f28523ce071ae658b00e037671c310246bc,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:22986,source:'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf',sourceHash:'1b48477b82b0083e3f0f50379deb76956ee5386acdc1ef68854126983475ed7c',warnings:[]}).
x_isa('x_FC-Tech-None','x_FreeCiv-Tech') :- x_cid(a65b1281a30b70).
xc_microtheory(a65b1281a30b70,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b70,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b70,6).
xc_kb_names(a65b1281a30b70,[]).
xc_mapping_rows(a65b1281a30b70,[]).
x_comment('x_FC-Tech-None',"Believe it or not, we need to explicitly represent FC-Tech-None in order to make\nsome preconditions more declarative to allow reasoning about enablement conditions.  Without this, we\nend up burying the connection between effects and preconditions either inside an outsourced predicate or\ninside a horn clause, either way making it difficult to reason about.") :- x_cid(a65b1281a30b71).
xc_microtheory(a65b1281a30b71,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b71,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b71,7).
xc_kb_names(a65b1281a30b71,[]).
xc_mapping_rows(a65b1281a30b71,[]).
x_isa('x_FC-Tech-AdvancedFlight','x_FreeCiv-Tech') :- x_cid(a65b1281a30b72).
xc_microtheory(a65b1281a30b72,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b72,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b72,15).
xc_kb_names(a65b1281a30b72,[]).
xc_mapping_rows(a65b1281a30b72,[]).
x_researchRequiresTech('x_FC-Tech-AdvancedFlight','x_FC-Tech-Radio') :- x_cid(a65b1281a30b73).
xc_microtheory(a65b1281a30b73,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b73,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b73,16).
xc_kb_names(a65b1281a30b73,[]).
xc_mapping_rows(a65b1281a30b73,[]).
x_researchRequiresTech('x_FC-Tech-AdvancedFlight','x_FC-Tech-MachineTools') :- x_cid(a65b1281a30b74).
xc_microtheory(a65b1281a30b74,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b74,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b74,17).
xc_kb_names(a65b1281a30b74,[]).
xc_mapping_rows(a65b1281a30b74,[]).
x_isa('x_FC-Tech-Alphabet','x_FreeCiv-Tech') :- x_cid(a65b1281a30b75).
xc_microtheory(a65b1281a30b75,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b75,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b75,23).
xc_kb_names(a65b1281a30b75,[]).
xc_mapping_rows(a65b1281a30b75,[]).
x_researchRequiresTech('x_FC-Tech-Alphabet','x_FC-Tech-None') :- x_cid(a65b1281a30b76).
xc_microtheory(a65b1281a30b76,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b76,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b76,24).
xc_kb_names(a65b1281a30b76,[]).
xc_mapping_rows(a65b1281a30b76,[]).
x_isa('x_FC-Tech-AmphibiousWarfare','x_FreeCiv-Tech') :- x_cid(a65b1281a30b77).
xc_microtheory(a65b1281a30b77,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b77,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b77,30).
xc_kb_names(a65b1281a30b77,[]).
xc_mapping_rows(a65b1281a30b77,[]).
x_researchRequiresTech('x_FC-Tech-AmphibiousWarfare','x_FC-Tech-Navigation') :- x_cid(a65b1281a30b78).
xc_microtheory(a65b1281a30b78,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b78,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b78,31).
xc_kb_names(a65b1281a30b78,[]).
xc_mapping_rows(a65b1281a30b78,[]).
x_researchRequiresTech('x_FC-Tech-AmphibiousWarfare','x_FC-Tech-Tactics') :- x_cid(a65b1281a30b79).
xc_microtheory(a65b1281a30b79,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b79,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b79,32).
xc_kb_names(a65b1281a30b79,[]).
xc_mapping_rows(a65b1281a30b79,[]).
x_isa('x_FC-Tech-Astronomy','x_FreeCiv-Tech') :- x_cid(a65b1281a30b7a).
xc_microtheory(a65b1281a30b7a,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b7a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b7a,38).
xc_kb_names(a65b1281a30b7a,[]).
xc_mapping_rows(a65b1281a30b7a,[]).
x_researchRequiresTech('x_FC-Tech-Astronomy','x_FC-Tech-Mysticism') :- x_cid(a65b1281a30b7b).
xc_microtheory(a65b1281a30b7b,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b7b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b7b,39).
xc_kb_names(a65b1281a30b7b,[]).
xc_mapping_rows(a65b1281a30b7b,[]).
x_researchRequiresTech('x_FC-Tech-Astronomy','x_FC-Tech-Mathematics') :- x_cid(a65b1281a30b7c).
xc_microtheory(a65b1281a30b7c,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b7c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b7c,40).
xc_kb_names(a65b1281a30b7c,[]).
xc_mapping_rows(a65b1281a30b7c,[]).
x_isa('x_FC-Tech-AtomicTheory','x_FreeCiv-Tech') :- x_cid(a65b1281a30b7d).
xc_microtheory(a65b1281a30b7d,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b7d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b7d,46).
xc_kb_names(a65b1281a30b7d,[]).
xc_mapping_rows(a65b1281a30b7d,[]).
x_researchRequiresTech('x_FC-Tech-AtomicTheory','x_FC-Tech-TheoryOfGravity') :- x_cid(a65b1281a30b7e).
xc_microtheory(a65b1281a30b7e,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b7e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b7e,47).
xc_kb_names(a65b1281a30b7e,[]).
xc_mapping_rows(a65b1281a30b7e,[]).
x_researchRequiresTech('x_FC-Tech-AtomicTheory','x_FC-Tech-Physics') :- x_cid(a65b1281a30b7f).
xc_microtheory(a65b1281a30b7f,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b7f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b7f,48).
xc_kb_names(a65b1281a30b7f,[]).
xc_mapping_rows(a65b1281a30b7f,[]).
x_isa('x_FC-Tech-Automobile','x_FreeCiv-Tech') :- x_cid(a65b1281a30b80).
xc_microtheory(a65b1281a30b80,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b80,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b80,54).
xc_kb_names(a65b1281a30b80,[]).
xc_mapping_rows(a65b1281a30b80,[]).
x_researchRequiresTech('x_FC-Tech-Automobile','x_FC-Tech-Combustion') :- x_cid(a65b1281a30b81).
xc_microtheory(a65b1281a30b81,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b81,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b81,55).
xc_kb_names(a65b1281a30b81,[]).
xc_mapping_rows(a65b1281a30b81,[]).
x_researchRequiresTech('x_FC-Tech-Automobile','x_FC-Tech-Steel') :- x_cid(a65b1281a30b82).
xc_microtheory(a65b1281a30b82,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b82,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b82,56).
xc_kb_names(a65b1281a30b82,[]).
xc_mapping_rows(a65b1281a30b82,[]).
x_isa('x_FC-Tech-Banking','x_FreeCiv-Tech') :- x_cid(a65b1281a30b83).
xc_microtheory(a65b1281a30b83,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b83,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b83,63).
xc_kb_names(a65b1281a30b83,[]).
xc_mapping_rows(a65b1281a30b83,[]).
x_researchRequiresTech('x_FC-Tech-Banking','x_FC-Tech-Trade') :- x_cid(a65b1281a30b84).
xc_microtheory(a65b1281a30b84,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b84,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b84,64).
xc_kb_names(a65b1281a30b84,[]).
xc_mapping_rows(a65b1281a30b84,[]).
x_researchRequiresTech('x_FC-Tech-Banking','x_FC-Tech-TheRepublic') :- x_cid(a65b1281a30b85).
xc_microtheory(a65b1281a30b85,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b85,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b85,65).
xc_kb_names(a65b1281a30b85,[]).
xc_mapping_rows(a65b1281a30b85,[]).
x_isa('x_FC-Tech-BridgeBuilding','x_FreeCiv-Tech') :- x_cid(a65b1281a30b86).
xc_microtheory(a65b1281a30b86,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b86,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b86,71).
xc_kb_names(a65b1281a30b86,[]).
xc_mapping_rows(a65b1281a30b86,[]).
x_researchRequiresTech('x_FC-Tech-BridgeBuilding','x_FC-Tech-IronWorking') :- x_cid(a65b1281a30b87).
xc_microtheory(a65b1281a30b87,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b87,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b87,72).
xc_kb_names(a65b1281a30b87,[]).
xc_mapping_rows(a65b1281a30b87,[]).
x_researchRequiresTech('x_FC-Tech-BridgeBuilding','x_FC-Tech-Construction') :- x_cid(a65b1281a30b88).
xc_microtheory(a65b1281a30b88,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b88,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b88,73).
xc_kb_names(a65b1281a30b88,[]).
xc_mapping_rows(a65b1281a30b88,[]).
x_isa('x_FC-Tech-BronzeWorking','x_FreeCiv-Tech') :- x_cid(a65b1281a30b89).
xc_microtheory(a65b1281a30b89,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b89,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b89,80).
xc_kb_names(a65b1281a30b89,[]).
xc_mapping_rows(a65b1281a30b89,[]).
x_researchRequiresTech('x_FC-Tech-BronzeWorking','x_FC-Tech-None') :- x_cid(a65b1281a30b8a).
xc_microtheory(a65b1281a30b8a,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b8a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b8a,81).
xc_kb_names(a65b1281a30b8a,[]).
xc_mapping_rows(a65b1281a30b8a,[]).
x_isa('x_FC-Tech-CeremonialBurial','x_FreeCiv-Tech') :- x_cid(a65b1281a30b8b).
xc_microtheory(a65b1281a30b8b,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b8b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b8b,86).
xc_kb_names(a65b1281a30b8b,[]).
xc_mapping_rows(a65b1281a30b8b,[]).
x_researchRequiresTech('x_FC-Tech-CeremonialBurial','x_FC-Tech-None') :- x_cid(a65b1281a30b8c).
xc_microtheory(a65b1281a30b8c,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b8c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b8c,87).
xc_kb_names(a65b1281a30b8c,[]).
xc_mapping_rows(a65b1281a30b8c,[]).
x_isa('x_FC-Tech-Chemistry','x_FreeCiv-Tech') :- x_cid(a65b1281a30b8d).
xc_microtheory(a65b1281a30b8d,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b8d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b8d,92).
xc_kb_names(a65b1281a30b8d,[]).
xc_mapping_rows(a65b1281a30b8d,[]).
x_researchRequiresTech('x_FC-Tech-Chemistry','x_FC-Tech-University') :- x_cid(a65b1281a30b8e).
xc_microtheory(a65b1281a30b8e,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b8e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b8e,93).
xc_kb_names(a65b1281a30b8e,[]).
xc_mapping_rows(a65b1281a30b8e,[]).
x_researchRequiresTech('x_FC-Tech-Chemistry','x_FC-Tech-Medicine') :- x_cid(a65b1281a30b8f).
xc_microtheory(a65b1281a30b8f,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b8f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b8f,94).
xc_kb_names(a65b1281a30b8f,[]).
xc_mapping_rows(a65b1281a30b8f,[]).
x_isa('x_FC-Tech-Chivalry','x_FreeCiv-Tech') :- x_cid(a65b1281a30b90).
xc_microtheory(a65b1281a30b90,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b90,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b90,100).
xc_kb_names(a65b1281a30b90,[]).
xc_mapping_rows(a65b1281a30b90,[]).
x_researchRequiresTech('x_FC-Tech-Chivalry','x_FC-Tech-Feudalism') :- x_cid(a65b1281a30b91).
xc_microtheory(a65b1281a30b91,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b91,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b91,101).
xc_kb_names(a65b1281a30b91,[]).
xc_mapping_rows(a65b1281a30b91,[]).
x_researchRequiresTech('x_FC-Tech-Chivalry','x_FC-Tech-HorsebackRiding') :- x_cid(a65b1281a30b92).
xc_microtheory(a65b1281a30b92,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b92,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b92,102).
xc_kb_names(a65b1281a30b92,[]).
xc_mapping_rows(a65b1281a30b92,[]).
x_isa('x_FC-Tech-CodeOfLaws','x_FreeCiv-Tech') :- x_cid(a65b1281a30b93).
xc_microtheory(a65b1281a30b93,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b93,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b93,108).
xc_kb_names(a65b1281a30b93,[]).
xc_mapping_rows(a65b1281a30b93,[]).
x_researchRequiresTech('x_FC-Tech-CodeOfLaws','x_FC-Tech-Alphabet') :- x_cid(a65b1281a30b94).
xc_microtheory(a65b1281a30b94,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b94,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b94,109).
xc_kb_names(a65b1281a30b94,[]).
xc_mapping_rows(a65b1281a30b94,[]).
x_isa('x_FC-Tech-CombinedArms','x_FreeCiv-Tech') :- x_cid(a65b1281a30b95).
xc_microtheory(a65b1281a30b95,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b95,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b95,115).
xc_kb_names(a65b1281a30b95,[]).
xc_mapping_rows(a65b1281a30b95,[]).
x_researchRequiresTech('x_FC-Tech-CombinedArms','x_FC-Tech-MobileWarfare') :- x_cid(a65b1281a30b96).
xc_microtheory(a65b1281a30b96,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b96,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b96,116).
xc_kb_names(a65b1281a30b96,[]).
xc_mapping_rows(a65b1281a30b96,[]).
x_researchRequiresTech('x_FC-Tech-CombinedArms','x_FC-Tech-AdvancedFlight') :- x_cid(a65b1281a30b97).
xc_microtheory(a65b1281a30b97,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b97,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b97,117).
xc_kb_names(a65b1281a30b97,[]).
xc_mapping_rows(a65b1281a30b97,[]).
x_isa('x_FC-Tech-Combustion','x_FreeCiv-Tech') :- x_cid(a65b1281a30b98).
xc_microtheory(a65b1281a30b98,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b98,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b98,123).
xc_kb_names(a65b1281a30b98,[]).
xc_mapping_rows(a65b1281a30b98,[]).
x_researchRequiresTech('x_FC-Tech-Combustion','x_FC-Tech-Refining') :- x_cid(a65b1281a30b99).
xc_microtheory(a65b1281a30b99,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b99,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b99,124).
xc_kb_names(a65b1281a30b99,[]).
xc_mapping_rows(a65b1281a30b99,[]).
x_researchRequiresTech('x_FC-Tech-Combustion','x_FC-Tech-Explosives') :- x_cid(a65b1281a30b9a).
xc_microtheory(a65b1281a30b9a,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b9a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b9a,125).
xc_kb_names(a65b1281a30b9a,[]).
xc_mapping_rows(a65b1281a30b9a,[]).
x_isa('x_FC-Tech-Communism','x_FreeCiv-Tech') :- x_cid(a65b1281a30b9b).
xc_microtheory(a65b1281a30b9b,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b9b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b9b,131).
xc_kb_names(a65b1281a30b9b,[]).
xc_mapping_rows(a65b1281a30b9b,[]).
x_researchRequiresTech('x_FC-Tech-Communism','x_FC-Tech-Philosophy') :- x_cid(a65b1281a30b9c).
xc_microtheory(a65b1281a30b9c,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b9c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b9c,132).
xc_kb_names(a65b1281a30b9c,[]).
xc_mapping_rows(a65b1281a30b9c,[]).
x_researchRequiresTech('x_FC-Tech-Communism','x_FC-Tech-Industrialization') :- x_cid(a65b1281a30b9d).
xc_microtheory(a65b1281a30b9d,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b9d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b9d,133).
xc_kb_names(a65b1281a30b9d,[]).
xc_mapping_rows(a65b1281a30b9d,[]).
x_isa('x_FC-Tech-Computers','x_FreeCiv-Tech') :- x_cid(a65b1281a30b9e).
xc_microtheory(a65b1281a30b9e,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b9e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b9e,139).
xc_kb_names(a65b1281a30b9e,[]).
xc_mapping_rows(a65b1281a30b9e,[]).
x_researchRequiresTech('x_FC-Tech-Computers','x_FC-Tech-MassProduction') :- x_cid(a65b1281a30b9f).
xc_microtheory(a65b1281a30b9f,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30b9f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30b9f,140).
xc_kb_names(a65b1281a30b9f,[]).
xc_mapping_rows(a65b1281a30b9f,[]).
x_researchRequiresTech('x_FC-Tech-Computers','x_FC-Tech-Miniaturization') :- x_cid(a65b1281a30ba0).
xc_microtheory(a65b1281a30ba0,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30ba0,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30ba0,141).
xc_kb_names(a65b1281a30ba0,[]).
xc_mapping_rows(a65b1281a30ba0,[]).
x_isa('x_FC-Tech-Conscription','x_FreeCiv-Tech') :- x_cid(a65b1281a30ba1).
xc_microtheory(a65b1281a30ba1,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30ba1,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30ba1,147).
xc_kb_names(a65b1281a30ba1,[]).
xc_mapping_rows(a65b1281a30ba1,[]).
x_researchRequiresTech('x_FC-Tech-Conscription','x_FC-Tech-Democracy') :- x_cid(a65b1281a30ba2).
xc_microtheory(a65b1281a30ba2,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30ba2,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30ba2,148).
xc_kb_names(a65b1281a30ba2,[]).
xc_mapping_rows(a65b1281a30ba2,[]).
x_researchRequiresTech('x_FC-Tech-Conscription','x_FC-Tech-Metallurgy') :- x_cid(a65b1281a30ba3).
xc_microtheory(a65b1281a30ba3,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30ba3,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30ba3,149).
xc_kb_names(a65b1281a30ba3,[]).
xc_mapping_rows(a65b1281a30ba3,[]).
x_isa('x_FC-Tech-Construction','x_FreeCiv-Tech') :- x_cid(a65b1281a30ba4).
xc_microtheory(a65b1281a30ba4,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30ba4,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30ba4,155).
xc_kb_names(a65b1281a30ba4,[]).
xc_mapping_rows(a65b1281a30ba4,[]).
x_researchRequiresTech('x_FC-Tech-Construction','x_FC-Tech-Masonry') :- x_cid(a65b1281a30ba5).
xc_microtheory(a65b1281a30ba5,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30ba5,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30ba5,156).
xc_kb_names(a65b1281a30ba5,[]).
xc_mapping_rows(a65b1281a30ba5,[]).
x_researchRequiresTech('x_FC-Tech-Construction','x_FC-Tech-Currency') :- x_cid(a65b1281a30ba6).
xc_microtheory(a65b1281a30ba6,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30ba6,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30ba6,157).
xc_kb_names(a65b1281a30ba6,[]).
xc_mapping_rows(a65b1281a30ba6,[]).
x_isa('x_FC-Tech-Currency','x_FreeCiv-Tech') :- x_cid(a65b1281a30ba7).
xc_microtheory(a65b1281a30ba7,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30ba7,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30ba7,164).
xc_kb_names(a65b1281a30ba7,[]).
xc_mapping_rows(a65b1281a30ba7,[]).
x_researchRequiresTech('x_FC-Tech-Currency','x_FC-Tech-BronzeWorking') :- x_cid(a65b1281a30ba8).
xc_microtheory(a65b1281a30ba8,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30ba8,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30ba8,165).
xc_kb_names(a65b1281a30ba8,[]).
xc_mapping_rows(a65b1281a30ba8,[]).
x_isa('x_FC-Tech-Democracy','x_FreeCiv-Tech') :- x_cid(a65b1281a30ba9).
xc_microtheory(a65b1281a30ba9,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30ba9,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30ba9,171).
xc_kb_names(a65b1281a30ba9,[]).
xc_mapping_rows(a65b1281a30ba9,[]).
x_researchRequiresTech('x_FC-Tech-Democracy','x_FC-Tech-Banking') :- x_cid(a65b1281a30baa).
xc_microtheory(a65b1281a30baa,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30baa,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30baa,172).
xc_kb_names(a65b1281a30baa,[]).
xc_mapping_rows(a65b1281a30baa,[]).
x_researchRequiresTech('x_FC-Tech-Democracy','x_FC-Tech-Invention') :- x_cid(a65b1281a30bab).
xc_microtheory(a65b1281a30bab,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bab,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bab,173).
xc_kb_names(a65b1281a30bab,[]).
xc_mapping_rows(a65b1281a30bab,[]).
x_isa('x_FC-Tech-Economics','x_FreeCiv-Tech') :- x_cid(a65b1281a30bac).
xc_microtheory(a65b1281a30bac,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bac,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bac,179).
xc_kb_names(a65b1281a30bac,[]).
xc_mapping_rows(a65b1281a30bac,[]).
x_researchRequiresTech('x_FC-Tech-Economics','x_FC-Tech-Banking') :- x_cid(a65b1281a30bad).
xc_microtheory(a65b1281a30bad,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bad,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bad,180).
xc_kb_names(a65b1281a30bad,[]).
xc_mapping_rows(a65b1281a30bad,[]).
x_researchRequiresTech('x_FC-Tech-Economics','x_FC-Tech-University') :- x_cid(a65b1281a30bae).
xc_microtheory(a65b1281a30bae,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bae,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bae,181).
xc_kb_names(a65b1281a30bae,[]).
xc_mapping_rows(a65b1281a30bae,[]).
x_isa('x_FC-Tech-Electricity','x_FreeCiv-Tech') :- x_cid(a65b1281a30baf).
xc_microtheory(a65b1281a30baf,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30baf,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30baf,187).
xc_kb_names(a65b1281a30baf,[]).
xc_mapping_rows(a65b1281a30baf,[]).
x_researchRequiresTech('x_FC-Tech-Electricity','x_FC-Tech-Metallurgy') :- x_cid(a65b1281a30bb0).
xc_microtheory(a65b1281a30bb0,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bb0,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bb0,188).
xc_kb_names(a65b1281a30bb0,[]).
xc_mapping_rows(a65b1281a30bb0,[]).
x_researchRequiresTech('x_FC-Tech-Electricity','x_FC-Tech-Magnetism') :- x_cid(a65b1281a30bb1).
xc_microtheory(a65b1281a30bb1,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bb1,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bb1,189).
xc_kb_names(a65b1281a30bb1,[]).
xc_mapping_rows(a65b1281a30bb1,[]).
x_isa('x_FC-Tech-Electronics','x_FreeCiv-Tech') :- x_cid(a65b1281a30bb2).
xc_microtheory(a65b1281a30bb2,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bb2,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bb2,195).
xc_kb_names(a65b1281a30bb2,[]).
xc_mapping_rows(a65b1281a30bb2,[]).
x_researchRequiresTech('x_FC-Tech-Electronics','x_FC-Tech-TheCorporation') :- x_cid(a65b1281a30bb3).
xc_microtheory(a65b1281a30bb3,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bb3,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bb3,196).
xc_kb_names(a65b1281a30bb3,[]).
xc_mapping_rows(a65b1281a30bb3,[]).
x_researchRequiresTech('x_FC-Tech-Electronics','x_FC-Tech-Electricity') :- x_cid(a65b1281a30bb4).
xc_microtheory(a65b1281a30bb4,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bb4,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bb4,197).
xc_kb_names(a65b1281a30bb4,[]).
xc_mapping_rows(a65b1281a30bb4,[]).
x_isa('x_FC-Tech-Engineering','x_FreeCiv-Tech') :- x_cid(a65b1281a30bb5).
xc_microtheory(a65b1281a30bb5,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bb5,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bb5,203).
xc_kb_names(a65b1281a30bb5,[]).
xc_mapping_rows(a65b1281a30bb5,[]).
x_researchRequiresTech('x_FC-Tech-Engineering','x_FC-Tech-TheWheel') :- x_cid(a65b1281a30bb6).
xc_microtheory(a65b1281a30bb6,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bb6,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bb6,204).
xc_kb_names(a65b1281a30bb6,[]).
xc_mapping_rows(a65b1281a30bb6,[]).
x_researchRequiresTech('x_FC-Tech-Engineering','x_FC-Tech-Construction') :- x_cid(a65b1281a30bb7).
xc_microtheory(a65b1281a30bb7,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bb7,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bb7,205).
xc_kb_names(a65b1281a30bb7,[]).
xc_mapping_rows(a65b1281a30bb7,[]).
x_isa('x_FC-Tech-Environmentalism','x_FreeCiv-Tech') :- x_cid(a65b1281a30bb8).
xc_microtheory(a65b1281a30bb8,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bb8,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bb8,211).
xc_kb_names(a65b1281a30bb8,[]).
xc_mapping_rows(a65b1281a30bb8,[]).
x_researchRequiresTech('x_FC-Tech-Environmentalism','x_FC-Tech-Recycling') :- x_cid(a65b1281a30bb9).
xc_microtheory(a65b1281a30bb9,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bb9,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bb9,212).
xc_kb_names(a65b1281a30bb9,[]).
xc_mapping_rows(a65b1281a30bb9,[]).
x_researchRequiresTech('x_FC-Tech-Environmentalism','x_FC-Tech-SpaceFlight') :- x_cid(a65b1281a30bba).
xc_microtheory(a65b1281a30bba,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bba,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bba,213).
xc_kb_names(a65b1281a30bba,[]).
xc_mapping_rows(a65b1281a30bba,[]).
x_isa('x_FC-Tech-Espionage','x_FreeCiv-Tech') :- x_cid(a65b1281a30bbb).
xc_microtheory(a65b1281a30bbb,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bbb,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bbb,219).
xc_kb_names(a65b1281a30bbb,[]).
xc_mapping_rows(a65b1281a30bbb,[]).
x_researchRequiresTech('x_FC-Tech-Espionage','x_FC-Tech-Communism') :- x_cid(a65b1281a30bbc).
xc_microtheory(a65b1281a30bbc,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bbc,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bbc,220).
xc_kb_names(a65b1281a30bbc,[]).
xc_mapping_rows(a65b1281a30bbc,[]).
x_researchRequiresTech('x_FC-Tech-Espionage','x_FC-Tech-Democracy') :- x_cid(a65b1281a30bbd).
xc_microtheory(a65b1281a30bbd,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bbd,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bbd,221).
xc_kb_names(a65b1281a30bbd,[]).
xc_mapping_rows(a65b1281a30bbd,[]).
x_isa('x_FC-Tech-Explosives','x_FreeCiv-Tech') :- x_cid(a65b1281a30bbe).
xc_microtheory(a65b1281a30bbe,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bbe,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bbe,227).
xc_kb_names(a65b1281a30bbe,[]).
xc_mapping_rows(a65b1281a30bbe,[]).
x_researchRequiresTech('x_FC-Tech-Explosives','x_FC-Tech-Gunpowder') :- x_cid(a65b1281a30bbf).
xc_microtheory(a65b1281a30bbf,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bbf,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bbf,228).
xc_kb_names(a65b1281a30bbf,[]).
xc_mapping_rows(a65b1281a30bbf,[]).
x_researchRequiresTech('x_FC-Tech-Explosives','x_FC-Tech-Chemistry') :- x_cid(a65b1281a30bc0).
xc_microtheory(a65b1281a30bc0,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bc0,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bc0,229).
xc_kb_names(a65b1281a30bc0,[]).
xc_mapping_rows(a65b1281a30bc0,[]).
x_isa('x_FC-Tech-Feudalism','x_FreeCiv-Tech') :- x_cid(a65b1281a30bc1).
xc_microtheory(a65b1281a30bc1,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bc1,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bc1,235).
xc_kb_names(a65b1281a30bc1,[]).
xc_mapping_rows(a65b1281a30bc1,[]).
x_researchRequiresTech('x_FC-Tech-Feudalism','x_FC-Tech-WarriorCode') :- x_cid(a65b1281a30bc2).
xc_microtheory(a65b1281a30bc2,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bc2,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bc2,236).
xc_kb_names(a65b1281a30bc2,[]).
xc_mapping_rows(a65b1281a30bc2,[]).
x_researchRequiresTech('x_FC-Tech-Feudalism','x_FC-Tech-Monarchy') :- x_cid(a65b1281a30bc3).
xc_microtheory(a65b1281a30bc3,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bc3,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bc3,237).
xc_kb_names(a65b1281a30bc3,[]).
xc_mapping_rows(a65b1281a30bc3,[]).
x_isa('x_FC-Tech-Flight','x_FreeCiv-Tech') :- x_cid(a65b1281a30bc4).
xc_microtheory(a65b1281a30bc4,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bc4,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bc4,243).
xc_kb_names(a65b1281a30bc4,[]).
xc_mapping_rows(a65b1281a30bc4,[]).
x_researchRequiresTech('x_FC-Tech-Flight','x_FC-Tech-Combustion') :- x_cid(a65b1281a30bc5).
xc_microtheory(a65b1281a30bc5,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bc5,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bc5,244).
xc_kb_names(a65b1281a30bc5,[]).
xc_mapping_rows(a65b1281a30bc5,[]).
x_researchRequiresTech('x_FC-Tech-Flight','x_FC-Tech-TheoryOfGravity') :- x_cid(a65b1281a30bc6).
xc_microtheory(a65b1281a30bc6,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bc6,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bc6,245).
xc_kb_names(a65b1281a30bc6,[]).
xc_mapping_rows(a65b1281a30bc6,[]).
x_isa('x_FC-Tech-FusionPower','x_FreeCiv-Tech') :- x_cid(a65b1281a30bc7).
xc_microtheory(a65b1281a30bc7,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bc7,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bc7,261).
xc_kb_names(a65b1281a30bc7,[]).
xc_mapping_rows(a65b1281a30bc7,[]).
x_researchRequiresTech('x_FC-Tech-FusionPower','x_FC-Tech-NuclearPower') :- x_cid(a65b1281a30bc8).
xc_microtheory(a65b1281a30bc8,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bc8,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bc8,262).
xc_kb_names(a65b1281a30bc8,[]).
xc_mapping_rows(a65b1281a30bc8,[]).
x_researchRequiresTech('x_FC-Tech-FusionPower','x_FC-Tech-Superconductors') :- x_cid(a65b1281a30bc9).
xc_microtheory(a65b1281a30bc9,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bc9,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bc9,263).
xc_kb_names(a65b1281a30bc9,[]).
xc_mapping_rows(a65b1281a30bc9,[]).
x_isa('x_FC-Tech-GeneticEngineering','x_FreeCiv-Tech') :- x_cid(a65b1281a30bca).
xc_microtheory(a65b1281a30bca,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bca,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bca,269).
xc_kb_names(a65b1281a30bca,[]).
xc_mapping_rows(a65b1281a30bca,[]).
x_researchRequiresTech('x_FC-Tech-GeneticEngineering','x_FC-Tech-Medicine') :- x_cid(a65b1281a30bcb).
xc_microtheory(a65b1281a30bcb,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bcb,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bcb,270).
xc_kb_names(a65b1281a30bcb,[]).
xc_mapping_rows(a65b1281a30bcb,[]).
x_researchRequiresTech('x_FC-Tech-GeneticEngineering','x_FC-Tech-TheCorporation') :- x_cid(a65b1281a30bcc).
xc_microtheory(a65b1281a30bcc,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bcc,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bcc,271).
xc_kb_names(a65b1281a30bcc,[]).
xc_mapping_rows(a65b1281a30bcc,[]).
x_isa('x_FC-Tech-GuerillaWarfare','x_FreeCiv-Tech') :- x_cid(a65b1281a30bcd).
xc_microtheory(a65b1281a30bcd,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bcd,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bcd,277).
xc_kb_names(a65b1281a30bcd,[]).
xc_mapping_rows(a65b1281a30bcd,[]).
x_researchRequiresTech('x_FC-Tech-GuerillaWarfare','x_FC-Tech-Communism') :- x_cid(a65b1281a30bce).
xc_microtheory(a65b1281a30bce,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bce,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bce,278).
xc_kb_names(a65b1281a30bce,[]).
xc_mapping_rows(a65b1281a30bce,[]).
x_researchRequiresTech('x_FC-Tech-GuerillaWarfare','x_FC-Tech-Tactics') :- x_cid(a65b1281a30bcf).
xc_microtheory(a65b1281a30bcf,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bcf,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bcf,279).
xc_kb_names(a65b1281a30bcf,[]).
xc_mapping_rows(a65b1281a30bcf,[]).
x_isa('x_FC-Tech-Gunpowder','x_FreeCiv-Tech') :- x_cid(a65b1281a30bd0).
xc_microtheory(a65b1281a30bd0,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bd0,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bd0,285).
xc_kb_names(a65b1281a30bd0,[]).
xc_mapping_rows(a65b1281a30bd0,[]).
x_researchRequiresTech('x_FC-Tech-Gunpowder','x_FC-Tech-Invention') :- x_cid(a65b1281a30bd1).
xc_microtheory(a65b1281a30bd1,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bd1,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bd1,286).
xc_kb_names(a65b1281a30bd1,[]).
xc_mapping_rows(a65b1281a30bd1,[]).
x_researchRequiresTech('x_FC-Tech-Gunpowder','x_FC-Tech-IronWorking') :- x_cid(a65b1281a30bd2).
xc_microtheory(a65b1281a30bd2,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bd2,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bd2,287).
xc_kb_names(a65b1281a30bd2,[]).
xc_mapping_rows(a65b1281a30bd2,[]).
x_isa('x_FC-Tech-HorsebackRiding','x_FreeCiv-Tech') :- x_cid(a65b1281a30bd3).
xc_microtheory(a65b1281a30bd3,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bd3,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bd3,293).
xc_kb_names(a65b1281a30bd3,[]).
xc_mapping_rows(a65b1281a30bd3,[]).
x_researchRequiresTech('x_FC-Tech-HorsebackRiding','x_FC-Tech-None') :- x_cid(a65b1281a30bd4).
xc_microtheory(a65b1281a30bd4,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bd4,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bd4,294).
xc_kb_names(a65b1281a30bd4,[]).
xc_mapping_rows(a65b1281a30bd4,[]).
x_isa('x_FC-Tech-Industrialization','x_FreeCiv-Tech') :- x_cid(a65b1281a30bd5).
xc_microtheory(a65b1281a30bd5,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bd5,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bd5,300).
xc_kb_names(a65b1281a30bd5,[]).
xc_mapping_rows(a65b1281a30bd5,[]).
x_researchRequiresTech('x_FC-Tech-Industrialization','x_FC-Tech-Railroad') :- x_cid(a65b1281a30bd6).
xc_microtheory(a65b1281a30bd6,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bd6,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bd6,301).
xc_kb_names(a65b1281a30bd6,[]).
xc_mapping_rows(a65b1281a30bd6,[]).
x_researchRequiresTech('x_FC-Tech-Industrialization','x_FC-Tech-Banking') :- x_cid(a65b1281a30bd7).
xc_microtheory(a65b1281a30bd7,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bd7,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bd7,302).
xc_kb_names(a65b1281a30bd7,[]).
xc_mapping_rows(a65b1281a30bd7,[]).
x_isa('x_FC-Tech-Invention','x_FreeCiv-Tech') :- x_cid(a65b1281a30bd8).
xc_microtheory(a65b1281a30bd8,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bd8,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bd8,309).
xc_kb_names(a65b1281a30bd8,[]).
xc_mapping_rows(a65b1281a30bd8,[]).
x_researchRequiresTech('x_FC-Tech-Invention','x_FC-Tech-Engineering') :- x_cid(a65b1281a30bd9).
xc_microtheory(a65b1281a30bd9,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bd9,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bd9,310).
xc_kb_names(a65b1281a30bd9,[]).
xc_mapping_rows(a65b1281a30bd9,[]).
x_researchRequiresTech('x_FC-Tech-Invention','x_FC-Tech-Literacy') :- x_cid(a65b1281a30bda).
xc_microtheory(a65b1281a30bda,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bda,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bda,311).
xc_kb_names(a65b1281a30bda,[]).
xc_mapping_rows(a65b1281a30bda,[]).
x_isa('x_FC-Tech-IronWorking','x_FreeCiv-Tech') :- x_cid(a65b1281a30bdb).
xc_microtheory(a65b1281a30bdb,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bdb,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bdb,318).
xc_kb_names(a65b1281a30bdb,[]).
xc_mapping_rows(a65b1281a30bdb,[]).
x_researchRequiresTech('x_FC-Tech-IronWorking','x_FC-Tech-BronzeWorking') :- x_cid(a65b1281a30bdc).
xc_microtheory(a65b1281a30bdc,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bdc,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bdc,319).
xc_kb_names(a65b1281a30bdc,[]).
xc_mapping_rows(a65b1281a30bdc,[]).
x_researchRequiresTech('x_FC-Tech-IronWorking','x_FC-Tech-WarriorCode') :- x_cid(a65b1281a30bdd).
xc_microtheory(a65b1281a30bdd,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bdd,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bdd,320).
xc_kb_names(a65b1281a30bdd,[]).
xc_mapping_rows(a65b1281a30bdd,[]).
x_isa('x_FC-Tech-LaborUnion','x_FreeCiv-Tech') :- x_cid(a65b1281a30bde).
xc_microtheory(a65b1281a30bde,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bde,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bde,326).
xc_kb_names(a65b1281a30bde,[]).
xc_mapping_rows(a65b1281a30bde,[]).
x_researchRequiresTech('x_FC-Tech-LaborUnion','x_FC-Tech-MassProduction') :- x_cid(a65b1281a30bdf).
xc_microtheory(a65b1281a30bdf,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bdf,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bdf,327).
xc_kb_names(a65b1281a30bdf,[]).
xc_mapping_rows(a65b1281a30bdf,[]).
x_researchRequiresTech('x_FC-Tech-LaborUnion','x_FC-Tech-GuerillaWarfare') :- x_cid(a65b1281a30be0).
xc_microtheory(a65b1281a30be0,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30be0,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30be0,328).
xc_kb_names(a65b1281a30be0,[]).
xc_mapping_rows(a65b1281a30be0,[]).
x_isa('x_FC-Tech-Laser','x_FreeCiv-Tech') :- x_cid(a65b1281a30be1).
xc_microtheory(a65b1281a30be1,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30be1,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30be1,334).
xc_kb_names(a65b1281a30be1,[]).
xc_mapping_rows(a65b1281a30be1,[]).
x_researchRequiresTech('x_FC-Tech-Laser','x_FC-Tech-MassProduction') :- x_cid(a65b1281a30be2).
xc_microtheory(a65b1281a30be2,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30be2,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30be2,335).
xc_kb_names(a65b1281a30be2,[]).
xc_mapping_rows(a65b1281a30be2,[]).
x_researchRequiresTech('x_FC-Tech-Laser','x_FC-Tech-NuclearPower') :- x_cid(a65b1281a30be3).
xc_microtheory(a65b1281a30be3,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30be3,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30be3,336).
xc_kb_names(a65b1281a30be3,[]).
xc_mapping_rows(a65b1281a30be3,[]).
x_isa('x_FC-Tech-Leadership','x_FreeCiv-Tech') :- x_cid(a65b1281a30be4).
xc_microtheory(a65b1281a30be4,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30be4,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30be4,342).
xc_kb_names(a65b1281a30be4,[]).
xc_mapping_rows(a65b1281a30be4,[]).
x_researchRequiresTech('x_FC-Tech-Leadership','x_FC-Tech-Chivalry') :- x_cid(a65b1281a30be5).
xc_microtheory(a65b1281a30be5,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30be5,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30be5,343).
xc_kb_names(a65b1281a30be5,[]).
xc_mapping_rows(a65b1281a30be5,[]).
x_researchRequiresTech('x_FC-Tech-Leadership','x_FC-Tech-Gunpowder') :- x_cid(a65b1281a30be6).
xc_microtheory(a65b1281a30be6,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30be6,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30be6,344).
xc_kb_names(a65b1281a30be6,[]).
xc_mapping_rows(a65b1281a30be6,[]).
x_isa('x_FC-Tech-Literacy','x_FreeCiv-Tech') :- x_cid(a65b1281a30be7).
xc_microtheory(a65b1281a30be7,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30be7,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30be7,350).
xc_kb_names(a65b1281a30be7,[]).
xc_mapping_rows(a65b1281a30be7,[]).
x_researchRequiresTech('x_FC-Tech-Literacy','x_FC-Tech-Writing') :- x_cid(a65b1281a30be8).
xc_microtheory(a65b1281a30be8,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30be8,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30be8,351).
xc_kb_names(a65b1281a30be8,[]).
xc_mapping_rows(a65b1281a30be8,[]).
x_researchRequiresTech('x_FC-Tech-Literacy','x_FC-Tech-CodeOfLaws') :- x_cid(a65b1281a30be9).
xc_microtheory(a65b1281a30be9,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30be9,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30be9,352).
xc_kb_names(a65b1281a30be9,[]).
xc_mapping_rows(a65b1281a30be9,[]).
x_isa('x_FC-Tech-MachineTools','x_FreeCiv-Tech') :- x_cid(a65b1281a30bea).
xc_microtheory(a65b1281a30bea,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bea,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bea,358).
xc_kb_names(a65b1281a30bea,[]).
xc_mapping_rows(a65b1281a30bea,[]).
x_researchRequiresTech('x_FC-Tech-MachineTools','x_FC-Tech-Steel') :- x_cid(a65b1281a30beb).
xc_microtheory(a65b1281a30beb,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30beb,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30beb,359).
xc_kb_names(a65b1281a30beb,[]).
xc_mapping_rows(a65b1281a30beb,[]).
x_researchRequiresTech('x_FC-Tech-MachineTools','x_FC-Tech-Tactics') :- x_cid(a65b1281a30bec).
xc_microtheory(a65b1281a30bec,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bec,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bec,360).
xc_kb_names(a65b1281a30bec,[]).
xc_mapping_rows(a65b1281a30bec,[]).
x_isa('x_FC-Tech-Magnetism','x_FreeCiv-Tech') :- x_cid(a65b1281a30bed).
xc_microtheory(a65b1281a30bed,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bed,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bed,366).
xc_kb_names(a65b1281a30bed,[]).
xc_mapping_rows(a65b1281a30bed,[]).
x_researchRequiresTech('x_FC-Tech-Magnetism','x_FC-Tech-IronWorking') :- x_cid(a65b1281a30bee).
xc_microtheory(a65b1281a30bee,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bee,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bee,367).
xc_kb_names(a65b1281a30bee,[]).
xc_mapping_rows(a65b1281a30bee,[]).
x_researchRequiresTech('x_FC-Tech-Magnetism','x_FC-Tech-Physics') :- x_cid(a65b1281a30bef).
xc_microtheory(a65b1281a30bef,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bef,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bef,368).
xc_kb_names(a65b1281a30bef,[]).
xc_mapping_rows(a65b1281a30bef,[]).
x_isa('x_FC-Tech-MapMaking','x_FreeCiv-Tech') :- x_cid(a65b1281a30bf0).
xc_microtheory(a65b1281a30bf0,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bf0,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bf0,374).
xc_kb_names(a65b1281a30bf0,[]).
xc_mapping_rows(a65b1281a30bf0,[]).
x_researchRequiresTech('x_FC-Tech-MapMaking','x_FC-Tech-Alphabet') :- x_cid(a65b1281a30bf1).
xc_microtheory(a65b1281a30bf1,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bf1,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bf1,375).
xc_kb_names(a65b1281a30bf1,[]).
xc_mapping_rows(a65b1281a30bf1,[]).
x_isa('x_FC-Tech-Masonry','x_FreeCiv-Tech') :- x_cid(a65b1281a30bf2).
xc_microtheory(a65b1281a30bf2,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bf2,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bf2,381).
xc_kb_names(a65b1281a30bf2,[]).
xc_mapping_rows(a65b1281a30bf2,[]).
x_researchRequiresTech('x_FC-Tech-Masonry','x_FC-Tech-None') :- x_cid(a65b1281a30bf3).
xc_microtheory(a65b1281a30bf3,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bf3,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bf3,382).
xc_kb_names(a65b1281a30bf3,[]).
xc_mapping_rows(a65b1281a30bf3,[]).
x_isa('x_FC-Tech-MassProduction','x_FreeCiv-Tech') :- x_cid(a65b1281a30bf4).
xc_microtheory(a65b1281a30bf4,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bf4,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bf4,387).
xc_kb_names(a65b1281a30bf4,[]).
xc_mapping_rows(a65b1281a30bf4,[]).
x_researchRequiresTech('x_FC-Tech-MassProduction','x_FC-Tech-Automobile') :- x_cid(a65b1281a30bf5).
xc_microtheory(a65b1281a30bf5,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bf5,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bf5,388).
xc_kb_names(a65b1281a30bf5,[]).
xc_mapping_rows(a65b1281a30bf5,[]).
x_researchRequiresTech('x_FC-Tech-MassProduction','x_FC-Tech-TheCorporation') :- x_cid(a65b1281a30bf6).
xc_microtheory(a65b1281a30bf6,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bf6,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bf6,389).
xc_kb_names(a65b1281a30bf6,[]).
xc_mapping_rows(a65b1281a30bf6,[]).
x_isa('x_FC-Tech-Mathematics','x_FreeCiv-Tech') :- x_cid(a65b1281a30bf7).
xc_microtheory(a65b1281a30bf7,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bf7,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bf7,396).
xc_kb_names(a65b1281a30bf7,[]).
xc_mapping_rows(a65b1281a30bf7,[]).
x_researchRequiresTech('x_FC-Tech-Mathematics','x_FC-Tech-Alphabet') :- x_cid(a65b1281a30bf8).
xc_microtheory(a65b1281a30bf8,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bf8,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bf8,397).
xc_kb_names(a65b1281a30bf8,[]).
xc_mapping_rows(a65b1281a30bf8,[]).
x_researchRequiresTech('x_FC-Tech-Mathematics','x_FC-Tech-Masonry') :- x_cid(a65b1281a30bf9).
xc_microtheory(a65b1281a30bf9,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bf9,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bf9,398).
xc_kb_names(a65b1281a30bf9,[]).
xc_mapping_rows(a65b1281a30bf9,[]).
x_isa('x_FC-Tech-Medicine','x_FreeCiv-Tech') :- x_cid(a65b1281a30bfa).
xc_microtheory(a65b1281a30bfa,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bfa,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bfa,404).
xc_kb_names(a65b1281a30bfa,[]).
xc_mapping_rows(a65b1281a30bfa,[]).
x_researchRequiresTech('x_FC-Tech-Medicine','x_FC-Tech-Philosophy') :- x_cid(a65b1281a30bfb).
xc_microtheory(a65b1281a30bfb,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bfb,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bfb,405).
xc_kb_names(a65b1281a30bfb,[]).
xc_mapping_rows(a65b1281a30bfb,[]).
x_researchRequiresTech('x_FC-Tech-Medicine','x_FC-Tech-Trade') :- x_cid(a65b1281a30bfc).
xc_microtheory(a65b1281a30bfc,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bfc,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bfc,406).
xc_kb_names(a65b1281a30bfc,[]).
xc_mapping_rows(a65b1281a30bfc,[]).
x_isa('x_FC-Tech-Metallurgy','x_FreeCiv-Tech') :- x_cid(a65b1281a30bfd).
xc_microtheory(a65b1281a30bfd,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bfd,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bfd,412).
xc_kb_names(a65b1281a30bfd,[]).
xc_mapping_rows(a65b1281a30bfd,[]).
x_researchRequiresTech('x_FC-Tech-Metallurgy','x_FC-Tech-Gunpowder') :- x_cid(a65b1281a30bfe).
xc_microtheory(a65b1281a30bfe,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bfe,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bfe,413).
xc_kb_names(a65b1281a30bfe,[]).
xc_mapping_rows(a65b1281a30bfe,[]).
x_researchRequiresTech('x_FC-Tech-Metallurgy','x_FC-Tech-University') :- x_cid(a65b1281a30bff).
xc_microtheory(a65b1281a30bff,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30bff,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30bff,414).
xc_kb_names(a65b1281a30bff,[]).
xc_mapping_rows(a65b1281a30bff,[]).
x_isa('x_FC-Tech-Miniaturization','x_FreeCiv-Tech') :- x_cid(a65b1281a30c00).
xc_microtheory(a65b1281a30c00,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c00,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c00,420).
xc_kb_names(a65b1281a30c00,[]).
xc_mapping_rows(a65b1281a30c00,[]).
x_researchRequiresTech('x_FC-Tech-Miniaturization','x_FC-Tech-MachineTools') :- x_cid(a65b1281a30c01).
xc_microtheory(a65b1281a30c01,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c01,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c01,421).
xc_kb_names(a65b1281a30c01,[]).
xc_mapping_rows(a65b1281a30c01,[]).
x_researchRequiresTech('x_FC-Tech-Miniaturization','x_FC-Tech-Electronics') :- x_cid(a65b1281a30c02).
xc_microtheory(a65b1281a30c02,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c02,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c02,422).
xc_kb_names(a65b1281a30c02,[]).
xc_mapping_rows(a65b1281a30c02,[]).
x_isa('x_FC-Tech-MobileWarfare','x_FreeCiv-Tech') :- x_cid(a65b1281a30c03).
xc_microtheory(a65b1281a30c03,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c03,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c03,428).
xc_kb_names(a65b1281a30c03,[]).
xc_mapping_rows(a65b1281a30c03,[]).
x_researchRequiresTech('x_FC-Tech-MobileWarfare','x_FC-Tech-Automobile') :- x_cid(a65b1281a30c04).
xc_microtheory(a65b1281a30c04,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c04,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c04,429).
xc_kb_names(a65b1281a30c04,[]).
xc_mapping_rows(a65b1281a30c04,[]).
x_researchRequiresTech('x_FC-Tech-MobileWarfare','x_FC-Tech-Tactics') :- x_cid(a65b1281a30c05).
xc_microtheory(a65b1281a30c05,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c05,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c05,430).
xc_kb_names(a65b1281a30c05,[]).
xc_mapping_rows(a65b1281a30c05,[]).
x_isa('x_FC-Tech-Monarchy','x_FreeCiv-Tech') :- x_cid(a65b1281a30c06).
xc_microtheory(a65b1281a30c06,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c06,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c06,436).
xc_kb_names(a65b1281a30c06,[]).
xc_mapping_rows(a65b1281a30c06,[]).
x_researchRequiresTech('x_FC-Tech-Monarchy','x_FC-Tech-CeremonialBurial') :- x_cid(a65b1281a30c07).
xc_microtheory(a65b1281a30c07,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c07,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c07,437).
xc_kb_names(a65b1281a30c07,[]).
xc_mapping_rows(a65b1281a30c07,[]).
x_researchRequiresTech('x_FC-Tech-Monarchy','x_FC-Tech-CodeOfLaws') :- x_cid(a65b1281a30c08).
xc_microtheory(a65b1281a30c08,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c08,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c08,438).
xc_kb_names(a65b1281a30c08,[]).
xc_mapping_rows(a65b1281a30c08,[]).
x_isa('x_FC-Tech-Monotheism','x_FreeCiv-Tech') :- x_cid(a65b1281a30c09).
xc_microtheory(a65b1281a30c09,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c09,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c09,444).
xc_kb_names(a65b1281a30c09,[]).
xc_mapping_rows(a65b1281a30c09,[]).
x_researchRequiresTech('x_FC-Tech-Monotheism','x_FC-Tech-Philosophy') :- x_cid(a65b1281a30c0a).
xc_microtheory(a65b1281a30c0a,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c0a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c0a,445).
xc_kb_names(a65b1281a30c0a,[]).
xc_mapping_rows(a65b1281a30c0a,[]).
x_researchRequiresTech('x_FC-Tech-Monotheism','x_FC-Tech-Polytheism') :- x_cid(a65b1281a30c0b).
xc_microtheory(a65b1281a30c0b,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c0b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c0b,446).
xc_kb_names(a65b1281a30c0b,[]).
xc_mapping_rows(a65b1281a30c0b,[]).
x_isa('x_FC-Tech-Mysticism','x_FreeCiv-Tech') :- x_cid(a65b1281a30c0c).
xc_microtheory(a65b1281a30c0c,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c0c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c0c,452).
xc_kb_names(a65b1281a30c0c,[]).
xc_mapping_rows(a65b1281a30c0c,[]).
x_researchRequiresTech('x_FC-Tech-Mysticism','x_FC-Tech-CeremonialBurial') :- x_cid(a65b1281a30c0d).
xc_microtheory(a65b1281a30c0d,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c0d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c0d,453).
xc_kb_names(a65b1281a30c0d,[]).
xc_mapping_rows(a65b1281a30c0d,[]).
x_isa('x_FC-Tech-Navigation','x_FreeCiv-Tech') :- x_cid(a65b1281a30c0e).
xc_microtheory(a65b1281a30c0e,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c0e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c0e,459).
xc_kb_names(a65b1281a30c0e,[]).
xc_mapping_rows(a65b1281a30c0e,[]).
x_researchRequiresTech('x_FC-Tech-Navigation','x_FC-Tech-Seafaring') :- x_cid(a65b1281a30c0f).
xc_microtheory(a65b1281a30c0f,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c0f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c0f,460).
xc_kb_names(a65b1281a30c0f,[]).
xc_mapping_rows(a65b1281a30c0f,[]).
x_researchRequiresTech('x_FC-Tech-Navigation','x_FC-Tech-Astronomy') :- x_cid(a65b1281a30c10).
xc_microtheory(a65b1281a30c10,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c10,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c10,461).
xc_kb_names(a65b1281a30c10,[]).
xc_mapping_rows(a65b1281a30c10,[]).
x_isa('x_FC-Tech-NuclearFission','x_FreeCiv-Tech') :- x_cid(a65b1281a30c11).
xc_microtheory(a65b1281a30c11,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c11,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c11,468).
xc_kb_names(a65b1281a30c11,[]).
xc_mapping_rows(a65b1281a30c11,[]).
x_researchRequiresTech('x_FC-Tech-NuclearFission','x_FC-Tech-MassProduction') :- x_cid(a65b1281a30c12).
xc_microtheory(a65b1281a30c12,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c12,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c12,469).
xc_kb_names(a65b1281a30c12,[]).
xc_mapping_rows(a65b1281a30c12,[]).
x_researchRequiresTech('x_FC-Tech-NuclearFission','x_FC-Tech-AtomicTheory') :- x_cid(a65b1281a30c13).
xc_microtheory(a65b1281a30c13,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c13,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c13,470).
xc_kb_names(a65b1281a30c13,[]).
xc_mapping_rows(a65b1281a30c13,[]).
x_isa('x_FC-Tech-NuclearPower','x_FreeCiv-Tech') :- x_cid(a65b1281a30c14).
xc_microtheory(a65b1281a30c14,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c14,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c14,476).
xc_kb_names(a65b1281a30c14,[]).
xc_mapping_rows(a65b1281a30c14,[]).
x_researchRequiresTech('x_FC-Tech-NuclearPower','x_FC-Tech-NuclearFission') :- x_cid(a65b1281a30c15).
xc_microtheory(a65b1281a30c15,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c15,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c15,477).
xc_kb_names(a65b1281a30c15,[]).
xc_mapping_rows(a65b1281a30c15,[]).
x_researchRequiresTech('x_FC-Tech-NuclearPower','x_FC-Tech-Electronics') :- x_cid(a65b1281a30c16).
xc_microtheory(a65b1281a30c16,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c16,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c16,478).
xc_kb_names(a65b1281a30c16,[]).
xc_mapping_rows(a65b1281a30c16,[]).
x_isa('x_FC-Tech-Philosophy','x_FreeCiv-Tech') :- x_cid(a65b1281a30c17).
xc_microtheory(a65b1281a30c17,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c17,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c17,485).
xc_kb_names(a65b1281a30c17,[]).
xc_mapping_rows(a65b1281a30c17,[]).
x_researchRequiresTech('x_FC-Tech-Philosophy','x_FC-Tech-Mysticism') :- x_cid(a65b1281a30c18).
xc_microtheory(a65b1281a30c18,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c18,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c18,486).
xc_kb_names(a65b1281a30c18,[]).
xc_mapping_rows(a65b1281a30c18,[]).
x_researchRequiresTech('x_FC-Tech-Philosophy','x_FC-Tech-Literacy') :- x_cid(a65b1281a30c19).
xc_microtheory(a65b1281a30c19,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c19,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c19,487).
xc_kb_names(a65b1281a30c19,[]).
xc_mapping_rows(a65b1281a30c19,[]).
x_isa('x_FC-Tech-Physics','x_FreeCiv-Tech') :- x_cid(a65b1281a30c1a).
xc_microtheory(a65b1281a30c1a,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c1a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c1a,494).
xc_kb_names(a65b1281a30c1a,[]).
xc_mapping_rows(a65b1281a30c1a,[]).
x_researchRequiresTech('x_FC-Tech-Physics','x_FC-Tech-Literacy') :- x_cid(a65b1281a30c1b).
xc_microtheory(a65b1281a30c1b,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c1b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c1b,495).
xc_kb_names(a65b1281a30c1b,[]).
xc_mapping_rows(a65b1281a30c1b,[]).
x_researchRequiresTech('x_FC-Tech-Physics','x_FC-Tech-Navigation') :- x_cid(a65b1281a30c1c).
xc_microtheory(a65b1281a30c1c,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c1c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c1c,496).
xc_kb_names(a65b1281a30c1c,[]).
xc_mapping_rows(a65b1281a30c1c,[]).
x_isa('x_FC-Tech-Plastics','x_FreeCiv-Tech') :- x_cid(a65b1281a30c1d).
xc_microtheory(a65b1281a30c1d,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c1d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c1d,502).
xc_kb_names(a65b1281a30c1d,[]).
xc_mapping_rows(a65b1281a30c1d,[]).
x_researchRequiresTech('x_FC-Tech-Plastics','x_FC-Tech-Refining') :- x_cid(a65b1281a30c1e).
xc_microtheory(a65b1281a30c1e,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c1e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c1e,503).
xc_kb_names(a65b1281a30c1e,[]).
xc_mapping_rows(a65b1281a30c1e,[]).
x_researchRequiresTech('x_FC-Tech-Plastics','x_FC-Tech-SpaceFlight') :- x_cid(a65b1281a30c1f).
xc_microtheory(a65b1281a30c1f,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c1f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c1f,504).
xc_kb_names(a65b1281a30c1f,[]).
xc_mapping_rows(a65b1281a30c1f,[]).
x_isa('x_FC-Tech-Polytheism','x_FreeCiv-Tech') :- x_cid(a65b1281a30c20).
xc_microtheory(a65b1281a30c20,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c20,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c20,511).
xc_kb_names(a65b1281a30c20,[]).
xc_mapping_rows(a65b1281a30c20,[]).
x_researchRequiresTech('x_FC-Tech-Polytheism','x_FC-Tech-HorsebackRiding') :- x_cid(a65b1281a30c21).
xc_microtheory(a65b1281a30c21,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c21,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c21,512).
xc_kb_names(a65b1281a30c21,[]).
xc_mapping_rows(a65b1281a30c21,[]).
x_researchRequiresTech('x_FC-Tech-Polytheism','x_FC-Tech-CeremonialBurial') :- x_cid(a65b1281a30c22).
xc_microtheory(a65b1281a30c22,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c22,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c22,513).
xc_kb_names(a65b1281a30c22,[]).
xc_mapping_rows(a65b1281a30c22,[]).
x_isa('x_FC-Tech-Pottery','x_FreeCiv-Tech') :- x_cid(a65b1281a30c23).
xc_microtheory(a65b1281a30c23,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c23,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c23,519).
xc_kb_names(a65b1281a30c23,[]).
xc_mapping_rows(a65b1281a30c23,[]).
x_researchRequiresTech('x_FC-Tech-Pottery','x_FC-Tech-None') :- x_cid(a65b1281a30c24).
xc_microtheory(a65b1281a30c24,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c24,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c24,520).
xc_kb_names(a65b1281a30c24,[]).
xc_mapping_rows(a65b1281a30c24,[]).
x_isa('x_FC-Tech-Radio','x_FreeCiv-Tech') :- x_cid(a65b1281a30c25).
xc_microtheory(a65b1281a30c25,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c25,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c25,526).
xc_kb_names(a65b1281a30c25,[]).
xc_mapping_rows(a65b1281a30c25,[]).
x_researchRequiresTech('x_FC-Tech-Radio','x_FC-Tech-Flight') :- x_cid(a65b1281a30c26).
xc_microtheory(a65b1281a30c26,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c26,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c26,527).
xc_kb_names(a65b1281a30c26,[]).
xc_mapping_rows(a65b1281a30c26,[]).
x_researchRequiresTech('x_FC-Tech-Radio','x_FC-Tech-Electricity') :- x_cid(a65b1281a30c27).
xc_microtheory(a65b1281a30c27,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c27,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c27,528).
xc_kb_names(a65b1281a30c27,[]).
xc_mapping_rows(a65b1281a30c27,[]).
x_isa('x_FC-Tech-Railroad','x_FreeCiv-Tech') :- x_cid(a65b1281a30c28).
xc_microtheory(a65b1281a30c28,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c28,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c28,535).
xc_kb_names(a65b1281a30c28,[]).
xc_mapping_rows(a65b1281a30c28,[]).
x_researchRequiresTech('x_FC-Tech-Railroad','x_FC-Tech-SteamEngine') :- x_cid(a65b1281a30c29).
xc_microtheory(a65b1281a30c29,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c29,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c29,536).
xc_kb_names(a65b1281a30c29,[]).
xc_mapping_rows(a65b1281a30c29,[]).
x_researchRequiresTech('x_FC-Tech-Railroad','x_FC-Tech-BridgeBuilding') :- x_cid(a65b1281a30c2a).
xc_microtheory(a65b1281a30c2a,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c2a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c2a,537).
xc_kb_names(a65b1281a30c2a,[]).
xc_mapping_rows(a65b1281a30c2a,[]).
x_isa('x_FC-Tech-Recycling','x_FreeCiv-Tech') :- x_cid(a65b1281a30c2b).
xc_microtheory(a65b1281a30c2b,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c2b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c2b,545).
xc_kb_names(a65b1281a30c2b,[]).
xc_mapping_rows(a65b1281a30c2b,[]).
x_researchRequiresTech('x_FC-Tech-Recycling','x_FC-Tech-MassProduction') :- x_cid(a65b1281a30c2c).
xc_microtheory(a65b1281a30c2c,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c2c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c2c,546).
xc_kb_names(a65b1281a30c2c,[]).
xc_mapping_rows(a65b1281a30c2c,[]).
x_researchRequiresTech('x_FC-Tech-Recycling','x_FC-Tech-Democracy') :- x_cid(a65b1281a30c2d).
xc_microtheory(a65b1281a30c2d,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c2d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c2d,547).
xc_kb_names(a65b1281a30c2d,[]).
xc_mapping_rows(a65b1281a30c2d,[]).
x_isa('x_FC-Tech-Refining','x_FreeCiv-Tech') :- x_cid(a65b1281a30c2e).
xc_microtheory(a65b1281a30c2e,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c2e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c2e,553).
xc_kb_names(a65b1281a30c2e,[]).
xc_mapping_rows(a65b1281a30c2e,[]).
x_researchRequiresTech('x_FC-Tech-Refining','x_FC-Tech-Chemistry') :- x_cid(a65b1281a30c2f).
xc_microtheory(a65b1281a30c2f,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c2f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c2f,554).
xc_kb_names(a65b1281a30c2f,[]).
xc_mapping_rows(a65b1281a30c2f,[]).
x_researchRequiresTech('x_FC-Tech-Refining','x_FC-Tech-TheCorporation') :- x_cid(a65b1281a30c30).
xc_microtheory(a65b1281a30c30,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c30,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c30,555).
xc_kb_names(a65b1281a30c30,[]).
xc_mapping_rows(a65b1281a30c30,[]).
x_isa('x_FC-Tech-Refrigeration','x_FreeCiv-Tech') :- x_cid(a65b1281a30c31).
xc_microtheory(a65b1281a30c31,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c31,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c31,561).
xc_kb_names(a65b1281a30c31,[]).
xc_mapping_rows(a65b1281a30c31,[]).
x_researchRequiresTech('x_FC-Tech-Refrigeration','x_FC-Tech-Sanitation') :- x_cid(a65b1281a30c32).
xc_microtheory(a65b1281a30c32,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c32,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c32,562).
xc_kb_names(a65b1281a30c32,[]).
xc_mapping_rows(a65b1281a30c32,[]).
x_researchRequiresTech('x_FC-Tech-Refrigeration','x_FC-Tech-Electricity') :- x_cid(a65b1281a30c33).
xc_microtheory(a65b1281a30c33,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c33,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c33,563).
xc_kb_names(a65b1281a30c33,[]).
xc_mapping_rows(a65b1281a30c33,[]).
x_isa('x_FC-Tech-Robotics','x_FreeCiv-Tech') :- x_cid(a65b1281a30c34).
xc_microtheory(a65b1281a30c34,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c34,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c34,570).
xc_kb_names(a65b1281a30c34,[]).
xc_mapping_rows(a65b1281a30c34,[]).
x_researchRequiresTech('x_FC-Tech-Robotics','x_FC-Tech-MobileWarfare') :- x_cid(a65b1281a30c35).
xc_microtheory(a65b1281a30c35,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c35,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c35,571).
xc_kb_names(a65b1281a30c35,[]).
xc_mapping_rows(a65b1281a30c35,[]).
x_researchRequiresTech('x_FC-Tech-Robotics','x_FC-Tech-Computers') :- x_cid(a65b1281a30c36).
xc_microtheory(a65b1281a30c36,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c36,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c36,572).
xc_kb_names(a65b1281a30c36,[]).
xc_mapping_rows(a65b1281a30c36,[]).
x_isa('x_FC-Tech-Rocketry','x_FreeCiv-Tech') :- x_cid(a65b1281a30c37).
xc_microtheory(a65b1281a30c37,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c37,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c37,578).
xc_kb_names(a65b1281a30c37,[]).
xc_mapping_rows(a65b1281a30c37,[]).
x_researchRequiresTech('x_FC-Tech-Rocketry','x_FC-Tech-AdvancedFlight') :- x_cid(a65b1281a30c38).
xc_microtheory(a65b1281a30c38,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c38,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c38,579).
xc_kb_names(a65b1281a30c38,[]).
xc_mapping_rows(a65b1281a30c38,[]).
x_researchRequiresTech('x_FC-Tech-Rocketry','x_FC-Tech-Electronics') :- x_cid(a65b1281a30c39).
xc_microtheory(a65b1281a30c39,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c39,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c39,580).
xc_kb_names(a65b1281a30c39,[]).
xc_mapping_rows(a65b1281a30c39,[]).
x_isa('x_FC-Tech-Sanitation','x_FreeCiv-Tech') :- x_cid(a65b1281a30c3a).
xc_microtheory(a65b1281a30c3a,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c3a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c3a,586).
xc_kb_names(a65b1281a30c3a,[]).
xc_mapping_rows(a65b1281a30c3a,[]).
x_researchRequiresTech('x_FC-Tech-Sanitation','x_FC-Tech-Engineering') :- x_cid(a65b1281a30c3b).
xc_microtheory(a65b1281a30c3b,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c3b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c3b,587).
xc_kb_names(a65b1281a30c3b,[]).
xc_mapping_rows(a65b1281a30c3b,[]).
x_researchRequiresTech('x_FC-Tech-Sanitation','x_FC-Tech-Medicine') :- x_cid(a65b1281a30c3c).
xc_microtheory(a65b1281a30c3c,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c3c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c3c,588).
xc_kb_names(a65b1281a30c3c,[]).
xc_mapping_rows(a65b1281a30c3c,[]).
x_isa('x_FC-Tech-Seafaring','x_FreeCiv-Tech') :- x_cid(a65b1281a30c3d).
xc_microtheory(a65b1281a30c3d,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c3d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c3d,594).
xc_kb_names(a65b1281a30c3d,[]).
xc_mapping_rows(a65b1281a30c3d,[]).
x_researchRequiresTech('x_FC-Tech-Seafaring','x_FC-Tech-Pottery') :- x_cid(a65b1281a30c3e).
xc_microtheory(a65b1281a30c3e,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c3e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c3e,595).
xc_kb_names(a65b1281a30c3e,[]).
xc_mapping_rows(a65b1281a30c3e,[]).
x_researchRequiresTech('x_FC-Tech-Seafaring','x_FC-Tech-MapMaking') :- x_cid(a65b1281a30c3f).
xc_microtheory(a65b1281a30c3f,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c3f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c3f,596).
xc_kb_names(a65b1281a30c3f,[]).
xc_mapping_rows(a65b1281a30c3f,[]).
x_isa('x_FC-Tech-SpaceFlight','x_FreeCiv-Tech') :- x_cid(a65b1281a30c40).
xc_microtheory(a65b1281a30c40,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c40,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c40,603).
xc_kb_names(a65b1281a30c40,[]).
xc_mapping_rows(a65b1281a30c40,[]).
x_researchRequiresTech('x_FC-Tech-SpaceFlight','x_FC-Tech-Computers') :- x_cid(a65b1281a30c41).
xc_microtheory(a65b1281a30c41,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c41,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c41,604).
xc_kb_names(a65b1281a30c41,[]).
xc_mapping_rows(a65b1281a30c41,[]).
x_researchRequiresTech('x_FC-Tech-SpaceFlight','x_FC-Tech-Rocketry') :- x_cid(a65b1281a30c42).
xc_microtheory(a65b1281a30c42,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c42,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c42,605).
xc_kb_names(a65b1281a30c42,[]).
xc_mapping_rows(a65b1281a30c42,[]).
x_isa('x_FC-Tech-Stealth','x_FreeCiv-Tech') :- x_cid(a65b1281a30c43).
xc_microtheory(a65b1281a30c43,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c43,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c43,611).
xc_kb_names(a65b1281a30c43,[]).
xc_mapping_rows(a65b1281a30c43,[]).
x_researchRequiresTech('x_FC-Tech-Stealth','x_FC-Tech-Superconductors') :- x_cid(a65b1281a30c44).
xc_microtheory(a65b1281a30c44,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c44,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c44,612).
xc_kb_names(a65b1281a30c44,[]).
xc_mapping_rows(a65b1281a30c44,[]).
x_researchRequiresTech('x_FC-Tech-Stealth','x_FC-Tech-Robotics') :- x_cid(a65b1281a30c45).
xc_microtheory(a65b1281a30c45,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c45,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c45,613).
xc_kb_names(a65b1281a30c45,[]).
xc_mapping_rows(a65b1281a30c45,[]).
x_isa('x_FC-Tech-SteamEngine','x_FreeCiv-Tech') :- x_cid(a65b1281a30c46).
xc_microtheory(a65b1281a30c46,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c46,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c46,619).
xc_kb_names(a65b1281a30c46,[]).
xc_mapping_rows(a65b1281a30c46,[]).
x_researchRequiresTech('x_FC-Tech-SteamEngine','x_FC-Tech-Physics') :- x_cid(a65b1281a30c47).
xc_microtheory(a65b1281a30c47,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c47,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c47,620).
xc_kb_names(a65b1281a30c47,[]).
xc_mapping_rows(a65b1281a30c47,[]).
x_researchRequiresTech('x_FC-Tech-SteamEngine','x_FC-Tech-Invention') :- x_cid(a65b1281a30c48).
xc_microtheory(a65b1281a30c48,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c48,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c48,621).
xc_kb_names(a65b1281a30c48,[]).
xc_mapping_rows(a65b1281a30c48,[]).
x_isa('x_FC-Tech-Steel','x_FreeCiv-Tech') :- x_cid(a65b1281a30c49).
xc_microtheory(a65b1281a30c49,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c49,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c49,627).
xc_kb_names(a65b1281a30c49,[]).
xc_mapping_rows(a65b1281a30c49,[]).
x_researchRequiresTech('x_FC-Tech-Steel','x_FC-Tech-Electricity') :- x_cid(a65b1281a30c4a).
xc_microtheory(a65b1281a30c4a,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c4a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c4a,628).
xc_kb_names(a65b1281a30c4a,[]).
xc_mapping_rows(a65b1281a30c4a,[]).
x_researchRequiresTech('x_FC-Tech-Steel','x_FC-Tech-Industrialization') :- x_cid(a65b1281a30c4b).
xc_microtheory(a65b1281a30c4b,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c4b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c4b,629).
xc_kb_names(a65b1281a30c4b,[]).
xc_mapping_rows(a65b1281a30c4b,[]).
x_isa('x_FC-Tech-Superconductors','x_FreeCiv-Tech') :- x_cid(a65b1281a30c4c).
xc_microtheory(a65b1281a30c4c,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c4c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c4c,635).
xc_kb_names(a65b1281a30c4c,[]).
xc_mapping_rows(a65b1281a30c4c,[]).
x_researchRequiresTech('x_FC-Tech-Superconductors','x_FC-Tech-NuclearPower') :- x_cid(a65b1281a30c4d).
xc_microtheory(a65b1281a30c4d,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c4d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c4d,636).
xc_kb_names(a65b1281a30c4d,[]).
xc_mapping_rows(a65b1281a30c4d,[]).
x_researchRequiresTech('x_FC-Tech-Superconductors','x_FC-Tech-Laser') :- x_cid(a65b1281a30c4e).
xc_microtheory(a65b1281a30c4e,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c4e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c4e,637).
xc_kb_names(a65b1281a30c4e,[]).
xc_mapping_rows(a65b1281a30c4e,[]).
x_isa('x_FC-Tech-Tactics','x_FreeCiv-Tech') :- x_cid(a65b1281a30c4f).
xc_microtheory(a65b1281a30c4f,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c4f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c4f,643).
xc_kb_names(a65b1281a30c4f,[]).
xc_mapping_rows(a65b1281a30c4f,[]).
x_researchRequiresTech('x_FC-Tech-Tactics','x_FC-Tech-Conscription') :- x_cid(a65b1281a30c50).
xc_microtheory(a65b1281a30c50,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c50,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c50,644).
xc_kb_names(a65b1281a30c50,[]).
xc_mapping_rows(a65b1281a30c50,[]).
x_researchRequiresTech('x_FC-Tech-Tactics','x_FC-Tech-Leadership') :- x_cid(a65b1281a30c51).
xc_microtheory(a65b1281a30c51,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c51,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c51,645).
xc_kb_names(a65b1281a30c51,[]).
xc_mapping_rows(a65b1281a30c51,[]).
x_isa('x_FC-Tech-TheCorporation','x_FreeCiv-Tech') :- x_cid(a65b1281a30c52).
xc_microtheory(a65b1281a30c52,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c52,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c52,651).
xc_kb_names(a65b1281a30c52,[]).
xc_mapping_rows(a65b1281a30c52,[]).
x_researchRequiresTech('x_FC-Tech-TheCorporation','x_FC-Tech-Economics') :- x_cid(a65b1281a30c53).
xc_microtheory(a65b1281a30c53,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c53,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c53,652).
xc_kb_names(a65b1281a30c53,[]).
xc_mapping_rows(a65b1281a30c53,[]).
x_researchRequiresTech('x_FC-Tech-TheCorporation','x_FC-Tech-Industrialization') :- x_cid(a65b1281a30c54).
xc_microtheory(a65b1281a30c54,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c54,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c54,653).
xc_kb_names(a65b1281a30c54,[]).
xc_mapping_rows(a65b1281a30c54,[]).
x_isa('x_FC-Tech-TheRepublic','x_FreeCiv-Tech') :- x_cid(a65b1281a30c55).
xc_microtheory(a65b1281a30c55,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c55,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c55,659).
xc_kb_names(a65b1281a30c55,[]).
xc_mapping_rows(a65b1281a30c55,[]).
x_researchRequiresTech('x_FC-Tech-TheRepublic','x_FC-Tech-Literacy') :- x_cid(a65b1281a30c56).
xc_microtheory(a65b1281a30c56,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c56,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c56,660).
xc_kb_names(a65b1281a30c56,[]).
xc_mapping_rows(a65b1281a30c56,[]).
x_isa('x_FC-Tech-TheWheel','x_FreeCiv-Tech') :- x_cid(a65b1281a30c57).
xc_microtheory(a65b1281a30c57,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c57,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c57,666).
xc_kb_names(a65b1281a30c57,[]).
xc_mapping_rows(a65b1281a30c57,[]).
x_researchRequiresTech('x_FC-Tech-TheWheel','x_FC-Tech-HorsebackRiding') :- x_cid(a65b1281a30c58).
xc_microtheory(a65b1281a30c58,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c58,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c58,667).
xc_kb_names(a65b1281a30c58,[]).
xc_mapping_rows(a65b1281a30c58,[]).
x_isa('x_FC-Tech-Theology','x_FreeCiv-Tech') :- x_cid(a65b1281a30c59).
xc_microtheory(a65b1281a30c59,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c59,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c59,673).
xc_kb_names(a65b1281a30c59,[]).
xc_mapping_rows(a65b1281a30c59,[]).
x_researchRequiresTech('x_FC-Tech-Theology','x_FC-Tech-Feudalism') :- x_cid(a65b1281a30c5a).
xc_microtheory(a65b1281a30c5a,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c5a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c5a,674).
xc_kb_names(a65b1281a30c5a,[]).
xc_mapping_rows(a65b1281a30c5a,[]).
x_researchRequiresTech('x_FC-Tech-Theology','x_FC-Tech-Monotheism') :- x_cid(a65b1281a30c5b).
xc_microtheory(a65b1281a30c5b,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c5b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c5b,675).
xc_kb_names(a65b1281a30c5b,[]).
xc_mapping_rows(a65b1281a30c5b,[]).
x_isa('x_FC-Tech-TheoryOfGravity','x_FreeCiv-Tech') :- x_cid(a65b1281a30c5c).
xc_microtheory(a65b1281a30c5c,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c5c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c5c,681).
xc_kb_names(a65b1281a30c5c,[]).
xc_mapping_rows(a65b1281a30c5c,[]).
x_researchRequiresTech('x_FC-Tech-TheoryOfGravity','x_FC-Tech-Astronomy') :- x_cid(a65b1281a30c5d).
xc_microtheory(a65b1281a30c5d,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c5d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c5d,682).
xc_kb_names(a65b1281a30c5d,[]).
xc_mapping_rows(a65b1281a30c5d,[]).
x_researchRequiresTech('x_FC-Tech-TheoryOfGravity','x_FC-Tech-University') :- x_cid(a65b1281a30c5e).
xc_microtheory(a65b1281a30c5e,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c5e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c5e,683).
xc_kb_names(a65b1281a30c5e,[]).
xc_mapping_rows(a65b1281a30c5e,[]).
x_isa('x_FC-Tech-Trade','x_FreeCiv-Tech') :- x_cid(a65b1281a30c5f).
xc_microtheory(a65b1281a30c5f,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c5f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c5f,689).
xc_kb_names(a65b1281a30c5f,[]).
xc_mapping_rows(a65b1281a30c5f,[]).
x_researchRequiresTech('x_FC-Tech-Trade','x_FC-Tech-Currency') :- x_cid(a65b1281a30c60).
xc_microtheory(a65b1281a30c60,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c60,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c60,690).
xc_kb_names(a65b1281a30c60,[]).
xc_mapping_rows(a65b1281a30c60,[]).
x_researchRequiresTech('x_FC-Tech-Trade','x_FC-Tech-CodeOfLaws') :- x_cid(a65b1281a30c61).
xc_microtheory(a65b1281a30c61,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c61,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c61,691).
xc_kb_names(a65b1281a30c61,[]).
xc_mapping_rows(a65b1281a30c61,[]).
x_isa('x_FC-Tech-University','x_FreeCiv-Tech') :- x_cid(a65b1281a30c62).
xc_microtheory(a65b1281a30c62,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c62,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c62,697).
xc_kb_names(a65b1281a30c62,[]).
xc_mapping_rows(a65b1281a30c62,[]).
x_researchRequiresTech('x_FC-Tech-University','x_FC-Tech-Mathematics') :- x_cid(a65b1281a30c63).
xc_microtheory(a65b1281a30c63,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c63,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c63,698).
xc_kb_names(a65b1281a30c63,[]).
xc_mapping_rows(a65b1281a30c63,[]).
x_researchRequiresTech('x_FC-Tech-University','x_FC-Tech-Philosophy') :- x_cid(a65b1281a30c64).
xc_microtheory(a65b1281a30c64,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c64,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c64,699).
xc_kb_names(a65b1281a30c64,[]).
xc_mapping_rows(a65b1281a30c64,[]).
x_isa('x_FC-Tech-WarriorCode','x_FreeCiv-Tech') :- x_cid(a65b1281a30c65).
xc_microtheory(a65b1281a30c65,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c65,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c65,705).
xc_kb_names(a65b1281a30c65,[]).
xc_mapping_rows(a65b1281a30c65,[]).
x_researchRequiresTech('x_FC-Tech-WarriorCode','x_FC-Tech-None') :- x_cid(a65b1281a30c66).
xc_microtheory(a65b1281a30c66,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c66,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c66,706).
xc_kb_names(a65b1281a30c66,[]).
xc_mapping_rows(a65b1281a30c66,[]).
x_isa('x_FC-Tech-Writing','x_FreeCiv-Tech') :- x_cid(a65b1281a30c67).
xc_microtheory(a65b1281a30c67,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c67,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c67,712).
xc_kb_names(a65b1281a30c67,[]).
xc_mapping_rows(a65b1281a30c67,[]).
x_researchRequiresTech('x_FC-Tech-Writing','x_FC-Tech-Alphabet') :- x_cid(a65b1281a30c68).
xc_microtheory(a65b1281a30c68,'x_Freeciv-defaultMt').
xc_source_file(a65b1281a30c68,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/default/techs.krf').
xc_source_line(a65b1281a30c68,713).
xc_kb_names(a65b1281a30c68,[]).
xc_mapping_rows(a65b1281a30c68,[]).
kb_cache_footer(footer{count:249,digest:f99585c8a20046f5d897649ebaa37f28523ce071ae658b00e037671c310246bc,headerDigest:a1c11523b873194777c0ea5d13b95f401193c91b0520d559872d697cb30dba2c}).
