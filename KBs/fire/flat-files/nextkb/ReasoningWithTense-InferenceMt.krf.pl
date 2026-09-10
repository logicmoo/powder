:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:32,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:126,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:ec9dee3789d9b3b785d07d1a1a871f96ecaae011a8d70b84dad1a0780d64e776,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:7721,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf',sourceHash:'9650f99277b2d24d0f70906d0b1b1e27c01accddc4d3f8e25beca9911b00a7f6',warnings:[]}).
x_strictlyFunctionalInArgs(x_reasoningWithTenseMtTime,2) :- x_cid(a65b1276f3e8f9).
xc_microtheory(a65b1276f3e8f9,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e8f9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e8f9,3).
xc_kb_names(a65b1276f3e8f9,[]).
xc_mapping_rows(a65b1276f3e8f9,[]).
x_comment(x_mtPrecedes,"For any elements MT1 and MT2 of an instance SET of\n#$ReasoningWithTenseMicrotheorySet, where \n(#$reasoningWithTenseMtTime MT1 TIME-1) and \n(#$reasoningWithTenseMtTime MT2 TIME-2) hold, \n(#$mtPrecedes MT1 MT2) means that TIME-1 is entirely earlier than TIME-2 \n(i.e., (#$startsAfterEndingOf TIME-2 TIME-1)).  Given \n(#$mtPrecedes MT1 MT2), for each #$CycLSentence-Assertible PROP, PROP holds in MT1 \nonly if (#$was PROP) holds in MT2, PROP holds in MT2 only if \n(#$willBe PROP) holds in MT1, (#$hasAlwaysBeen PROP) holds in MT2 only \nif PROP holds in MT1, and (#$willAlwaysBe PROP) holds in MT1 only if \nPROP holds in MT2.  Note that when (#$reasoningWithTenseMtTime MT1 t) \nand (#$reasoningWithTenseMtTime MT2 t') hold with MT1 and MT2 to be \nelements of an instance SET of #$ReasoningWithTenseMicrotheorySet, t < t' \ncorresponds to (#$mtPrecedes MT1 MT2).  Thus #$mtPrecedes is an event-ordering \n(or an interval ordering, which is irreflexive and satisfies the Wiener\naxiom).") :- x_cid(a65b1276f3e8fa).
xc_microtheory(a65b1276f3e8fa,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e8fa,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e8fa,4).
xc_kb_names(a65b1276f3e8fa,[]).
xc_mapping_rows(a65b1276f3e8fa,[]).
x_argIsa('x_mtConverts-RWT-Aux',1,x_ReasoningWithTenseAuxiliaryMicrotheory) :- x_cid(a65b1276f3e8fb).
xc_microtheory(a65b1276f3e8fb,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e8fb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e8fb,20).
xc_kb_names(a65b1276f3e8fb,[]).
xc_mapping_rows(a65b1276f3e8fb,[]).
x_arg1Isa('x_mtConverts-RWT-Aux',x_ReasoningWithTenseAuxiliaryMicrotheory) :- x_cid(a65b1276f3e8fc).
xc_microtheory(a65b1276f3e8fc,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e8fc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e8fc,21).
xc_kb_names(a65b1276f3e8fc,[]).
xc_mapping_rows(a65b1276f3e8fc,[]).
x_comment('x_mtConverts-RWT-Aux',"#$mtConverts-RWT-Aux is a predicate used to assert a certain\nrelation between microtheories in reasoning with tense via\nmicrotheories.  #$mtConverts-RWT-Aux is like #$genlMt, but used for\nthe following two purposes.  (1) It is used for connecting elements Mt\nof a particular subset of #$ReasoningWithTenseMicrotheory to a\nparticular instance Mt-AUX of #$ReasoningWithTenseAuxiliaryMicrotheory\nso that these Mt can be `separated' from the others.  (2) When\n(#$mtConverts-RWT-Aux Mt-AUX Mt) holds, all assertions in Mt-AUX are\ninherited as well as `converted' into Mt.  To be precise,\n(#$mtConverts-RWT-Aux Mt-0 Mt-1) implies (#$genlMt Mt-1 Mt-0),\n(#$mtConverts-PlainOp Mt-0 Mt-1 #$willAlwaysBe) and\n(#$mtConverts-PlainOp Mt-0 Mt-1 #$hasAlwaysBeen), and thus for each\nPROP, PROP holds in Mt-AUX only if PROP, (#$willAlwaysBe PROP) and\n(#$hasAlwaysBeen PROP) hold in Mt.  For an example of how this\npredicate and microtheories are used in reasoning with tense via\nmicrotheories, see #$NoteOnModalReasoningViaMicrotheories.") :- x_cid(a65b1276f3e8fd).
xc_microtheory(a65b1276f3e8fd,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e8fd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e8fd,22).
xc_kb_names(a65b1276f3e8fd,[]).
xc_mapping_rows(a65b1276f3e8fd,[]).
x_argIsa('x_mtConverts-RWT-Aux',2,x_ReasoningWithTenseMicrotheory) :- x_cid(a65b1276f3e8fe).
xc_microtheory(a65b1276f3e8fe,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e8fe,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e8fe,39).
xc_kb_names(a65b1276f3e8fe,[]).
xc_mapping_rows(a65b1276f3e8fe,[]).
x_arg2Isa('x_mtConverts-RWT-Aux',x_ReasoningWithTenseMicrotheory) :- x_cid(a65b1276f3e8ff).
xc_microtheory(a65b1276f3e8ff,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e8ff,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e8ff,40).
xc_kb_names(a65b1276f3e8ff,[]).
xc_mapping_rows(a65b1276f3e8ff,[]).
x_comment(x_ReasoningWithTenseMicrotheory,"Each instance MT of \n#$ReasoningWithTenseMicrotheory is a microtheory that has \nthe following characteristics.  (i) MT is assigned a piece of time \nTIME (see #$reasoningWithTenseMtTime), be it a time point, or an hour, \nor a day, or a stage in a plan or in a scenerio, or any other amount \nexcept the empty interval and `gappy' intervals.  It is best to \nconsider it as a moment or an instant, whose temporal details can only \nbe meaningfully talked about outside of this microtheory.  (ii) Each \nstatement PROP in MT (either asserted or inferred) is understood, on \nthe semantic level, as true _at_ TIME.  Each PROP in MT is true `now' \nwhere `now' is TIME (see #$reasoningWithTenseMtTime).  Note that it doesn't in \ngeneral make sense to talk about, in MT, whether PROP is true \nthroughout the entire TIME or only a part of it.  Note also that \nconnectives #$and, #$or, #$not, #$implies and #$equiv etc. are really \ntruth-functional in this kind of microtheories.  Therefore, unlike \nother microtheories, formulas in MT should never be considered as \nabbreviations of #$holdsIn statements or #$holdsSometimeDuring \nstatements or the like because they require a quite different kind of \nsemantics.  (iii) MT can be related to another MT' in \n#$ReasoningWithTenseMicrotheory by way of #$mtPrecedes  \n(or #$mtPrecedes-Metric), provided that they are elements of the same  \ninstance of #$ReasoningWithTenseMicrotheorySet, and the relation  \nbetween statements in MT and those in MT' is determined by the rules  \nin #$ReasoningWithTense-InferenceMt.  See also  \n#$ReasoningWithTenseMicrotheorySet.") :- x_cid(a65b1276f3e900).
xc_microtheory(a65b1276f3e900,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e900,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e900,41).
xc_kb_names(a65b1276f3e900,[]).
xc_mapping_rows(a65b1276f3e900,[]).
x_argIsa(x_mtPrecedes,2,x_ReasoningWithTenseMicrotheory) :- x_cid(a65b1276f3e901).
xc_microtheory(a65b1276f3e901,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e901,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e901,66).
xc_kb_names(a65b1276f3e901,[]).
xc_mapping_rows(a65b1276f3e901,[]).
x_arg2Isa(x_mtPrecedes,x_ReasoningWithTenseMicrotheory) :- x_cid(a65b1276f3e902).
xc_microtheory(a65b1276f3e902,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e902,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e902,67).
xc_kb_names(a65b1276f3e902,[]).
xc_mapping_rows(a65b1276f3e902,[]).
x_argIsa(x_mtPrecedes,1,x_ReasoningWithTenseMicrotheory) :- x_cid(a65b1276f3e903).
xc_microtheory(a65b1276f3e903,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e903,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e903,68).
xc_kb_names(a65b1276f3e903,[]).
xc_mapping_rows(a65b1276f3e903,[]).
x_arg1Isa(x_mtPrecedes,x_ReasoningWithTenseMicrotheory) :- x_cid(a65b1276f3e904).
xc_microtheory(a65b1276f3e904,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e904,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e904,69).
xc_kb_names(a65b1276f3e904,[]).
xc_mapping_rows(a65b1276f3e904,[]).
x_argIsa(x_reasoningWithTenseMtDate,1,x_ReasoningWithTenseMicrotheory) :- x_cid(a65b1276f3e905).
xc_microtheory(a65b1276f3e905,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e905,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e905,70).
xc_kb_names(a65b1276f3e905,[]).
xc_mapping_rows(a65b1276f3e905,[]).
x_arg1Isa(x_reasoningWithTenseMtDate,x_ReasoningWithTenseMicrotheory) :- x_cid(a65b1276f3e906).
xc_microtheory(a65b1276f3e906,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e906,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e906,71).
xc_kb_names(a65b1276f3e906,[]).
xc_mapping_rows(a65b1276f3e906,[]).
x_argIsa(x_reasoningWithTenseMtTime,1,x_ReasoningWithTenseMicrotheory) :- x_cid(a65b1276f3e907).
xc_microtheory(a65b1276f3e907,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e907,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e907,72).
xc_kb_names(a65b1276f3e907,[]).
xc_mapping_rows(a65b1276f3e907,[]).
x_arg1Isa(x_reasoningWithTenseMtTime,x_ReasoningWithTenseMicrotheory) :- x_cid(a65b1276f3e908).
xc_microtheory(a65b1276f3e908,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e908,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e908,73).
xc_kb_names(a65b1276f3e908,[]).
xc_mapping_rows(a65b1276f3e908,[]).
x_argFormat(x_reasoningWithTenseMtTime,2,x_SingleEntry) :- x_cid(a65b1276f3e909).
xc_microtheory(a65b1276f3e909,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e909,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e909,74).
xc_kb_names(a65b1276f3e909,[]).
xc_mapping_rows(a65b1276f3e909,[]).
x_comment('x_ReasoningWithTense-InferenceMt',"This #$Microtheory contains rules about relations between \ninstances of #$ReasoningWithTenseMicrotheory.  At the present \n(Dec/1999), the notions involved in such rules are \n#$reasoningWithTenseMtTime, #$reasoningWithTenseMtDate and \n#$mtPrecedes etc.  Note that rules in this microtheory amount to \nsemantic interpretations of formulas in microtheories that are \ninstances of #$ReasoningWithTenseMicrotheory, and thus should not be \npresent in those microtheories.  Note also that although this \nmicrotheory is made a spec mt of #$ReasoningWithTense-LogicMt, it is \ndone only because we need to mention #$willBe, #$was, #$willAlwaysBe \nand #$hasAlwaysBeen etc. in certain rules in this microtheory.  In \neach spec mt of this microtheory, tense operators/predicates should \nonly occur inside of certain `meta language' predicates like #$ist, \n#$mtConverts-PlainOp and #$mtConverts-OpPlain etc., and no spec mt of this \nmicrotheory should be a genl mt of any instance of \n#$ReasoningWithTenseMicrotheory.") :- x_cid(a65b1276f3e90a).
xc_microtheory(a65b1276f3e90a,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e90a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e90a,75).
xc_kb_names(a65b1276f3e90a,[]).
xc_mapping_rows(a65b1276f3e90a,[]).
x_genls(x_ReasoningWithTenseMicrotheorySet,x_SetOfTypeFn(x_ReasoningWithTenseMicrotheory)) :- x_cid(a65b1276f3e90b).
xc_microtheory(a65b1276f3e90b,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e90b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e90b,92).
xc_kb_names(a65b1276f3e90b,[]).
xc_mapping_rows(a65b1276f3e90b,[]).
x_sharedNotes(x_mtPrecedes,x_SemanticAssumptionsMadeForReasoningWithTenseMts) :- x_cid(a65b1276f3e90c).
xc_microtheory(a65b1276f3e90c,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e90c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e90c,94).
xc_kb_names(a65b1276f3e90c,[]).
xc_mapping_rows(a65b1276f3e90c,[]).
x_sharedNotes(x_reasoningWithTenseMtDate,x_SemanticAssumptionsMadeForReasoningWithTenseMts) :- x_cid(a65b1276f3e90d).
xc_microtheory(a65b1276f3e90d,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e90d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e90d,95).
xc_kb_names(a65b1276f3e90d,[]).
xc_mapping_rows(a65b1276f3e90d,[]).
x_sharedNotes(x_reasoningWithTenseMtTime,x_SemanticAssumptionsMadeForReasoningWithTenseMts) :- x_cid(a65b1276f3e90e).
xc_microtheory(a65b1276f3e90e,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e90e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e90e,97).
xc_kb_names(a65b1276f3e90e,[]).
xc_mapping_rows(a65b1276f3e90e,[]).
x_comment(x_reasoningWithTenseMtTime,"(#$reasoningWithTenseMtTime MT TIME) means that each formula\nin MT, asserted or inferred, is true _at_ TIME.  When such a formula\nis asserted, TIME is considered the most specific time of MT, i.e.,\ninside of MT, the detailed temporal structure of TIME is ignored, and\nTIME is treated in such a way as if it is a time point.  Thus inside\nof MT, it doesn't make sense to talk about whether a formula in MT is\ntrue throughout or true sometime during TIME, though it may make sense\nto talk about that outside of MT.  Note that less specific time of MT\ncan be inferred by using #$reasoningWithTenseMtDate.") :- x_cid(a65b1276f3e90f).
xc_microtheory(a65b1276f3e90f,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e90f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e90f,99).
xc_kb_names(a65b1276f3e90f,[]).
xc_mapping_rows(a65b1276f3e90f,[]).
x_arg2Format(x_reasoningWithTenseMtTime,x_SingleEntry) :- x_cid(a65b1276f3e910).
xc_microtheory(a65b1276f3e910,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e910,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e910,109).
xc_kb_names(a65b1276f3e910,[]).
xc_mapping_rows(a65b1276f3e910,[]).
x_argIsa(x_reasoningWithTenseMtTime,2,x_TimeInterval) :- x_cid(a65b1276f3e911).
xc_microtheory(a65b1276f3e911,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e911,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e911,110).
xc_kb_names(a65b1276f3e911,[]).
xc_mapping_rows(a65b1276f3e911,[]).
x_arg2Isa(x_reasoningWithTenseMtTime,x_TimeInterval) :- x_cid(a65b1276f3e912).
xc_microtheory(a65b1276f3e912,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e912,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e912,111).
xc_kb_names(a65b1276f3e912,[]).
xc_mapping_rows(a65b1276f3e912,[]).
x_isa(x_reasoningWithTenseMtTime,x_GeneralTenseReasoningConstant) :- x_cid(a65b1276f3e913).
xc_microtheory(a65b1276f3e913,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e913,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e913,112).
xc_kb_names(a65b1276f3e913,[]).
xc_mapping_rows(a65b1276f3e913,[]).
x_comment(x_reasoningWithTenseMtDate,"(#$reasoningWithTenseMtDate MT DATE) means that DATE, an\ninstance of #$Date, `subsumes' TIME, where\n(#$reasoningWithTenseMtTime MT TIME) holds.  Note that \n#$reasoningWithTenseMtDate can be at most as specific as \n#$reasoningWithTenseMtTime.  For example, suppose that \n(#$reasoningWithTenseMtTime MT `January 20th, 2000') holds.  \nThen we can have (#$reasoningWithTenseMtDate MT `January, 2000') or \neven (#$reasoningWithTenseMtDate MT `Year 2000'), but we cannot have \n(#$reasoningWithTenseMtDate MT `9:00-10:00am, January 20th, 2000').") :- x_cid(a65b1276f3e914).
xc_microtheory(a65b1276f3e914,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e914,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e914,113).
xc_kb_names(a65b1276f3e914,[]).
xc_mapping_rows(a65b1276f3e914,[]).
x_argIsa(x_reasoningWithTenseMtDate,2,x_Date) :- x_cid(a65b1276f3e915).
xc_microtheory(a65b1276f3e915,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e915,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e915,123).
xc_kb_names(a65b1276f3e915,[]).
xc_mapping_rows(a65b1276f3e915,[]).
x_arg2Isa(x_reasoningWithTenseMtDate,x_Date) :- x_cid(a65b1276f3e916).
xc_microtheory(a65b1276f3e916,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e916,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e916,124).
xc_kb_names(a65b1276f3e916,[]).
xc_mapping_rows(a65b1276f3e916,[]).
x_isa(x_reasoningWithTenseMtDate,x_GeneralTenseReasoningConstant) :- x_cid(a65b1276f3e917).
xc_microtheory(a65b1276f3e917,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e917,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e917,125).
xc_kb_names(a65b1276f3e917,[]).
xc_mapping_rows(a65b1276f3e917,[]).
x_isa(x_mtPrecedes,x_GeneralTenseReasoningConstant) :- x_cid(a65b1276f3e918).
xc_microtheory(a65b1276f3e918,'x_ReasoningWithTense-InferenceMt').
xc_source_file(a65b1276f3e918,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt.krf').
xc_source_line(a65b1276f3e918,126).
xc_kb_names(a65b1276f3e918,[]).
xc_mapping_rows(a65b1276f3e918,[]).
kb_cache_footer(footer{count:32,digest:ec9dee3789d9b3b785d07d1a1a871f96ecaae011a8d70b84dad1a0780d64e776,headerDigest:'8d81a812fc9441aa9d77795d7bb0189c78d4de6fcbf73b931ecf715e8a096a35'}).
