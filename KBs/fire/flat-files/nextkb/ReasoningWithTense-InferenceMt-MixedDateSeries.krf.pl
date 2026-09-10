:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:63,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:156,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'040ffdcda4ca92146d3154f63df1ce7e65c8c8a6223f3aed8cbc87307c174f61',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:8517,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf',sourceHash:'96fc2f29b7080d8d8997b75097d00259751ccad60e13241627be93a7181987ee',warnings:[]}).
x_genlPreds('x_mtPrecedes-Metric','x_mtPrecedes-SemiMetric-Forward') :- x_cid(a65b1276ed685f).
xc_microtheory(a65b1276ed685f,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed685f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed685f,3).
xc_kb_names(a65b1276ed685f,[]).
xc_mapping_rows(a65b1276ed685f,[]).
x_comment('x_mtPrecedes-SemiMetric-Forward',"For any instances MT1 and MT2 of\n#$ReasoningWithTenseMicrotheory-MixedDateSeries,\n(#$mtPrecedes-SemiMetric-Forward MT1 MT2 TYPE n) means that for some\ninstances DATE-1 and TATE-2 of TYPE such that\n(#$reasoningWithTenseMtDate MT1 DATE-1) and\n(#$reasoningWithTenseMtTime MT2 DATE-2) hold (notice the difference\nbetween MtTime and MtDate), DATE-1 is entirely earlier than DATE-2\nwith exactly n-1 distinct elements of TYPE between the two.  Note that\nif (#$reasoningWithTenseMtTime MT1 DATE) and (#$isa DATE TYPE) hold,\nthen (#$mtPrecedes-SemiMetric-Forward MT1 MT2 TYPE n) implies\n(#$mtPrecedes-Metric MT1 MT2 TYPE n).  Note also that\n(#$mtPrecedes-SemiMetric-Forward MT1 MT2 TYPE n) implies (#$mtPrecedes MT1\nMT2).") :- x_cid(a65b1276ed6860).
xc_microtheory(a65b1276ed6860,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6860,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6860,4).
xc_kb_names(a65b1276ed6860,[]).
xc_mapping_rows(a65b1276ed6860,[]).
x_arg4Format('x_mtPrecedes-SemiMetric-Forward',x_SingleEntry) :- x_cid(a65b1276ed6861).
xc_microtheory(a65b1276ed6861,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6861,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6861,17).
xc_kb_names(a65b1276ed6861,[]).
xc_mapping_rows(a65b1276ed6861,[]).
x_arg3Format('x_mtPrecedes-SemiMetric-Forward',x_SingleEntry) :- x_cid(a65b1276ed6862).
xc_microtheory(a65b1276ed6862,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6862,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6862,18).
xc_kb_names(a65b1276ed6862,[]).
xc_mapping_rows(a65b1276ed6862,[]).
x_arg2Format('x_mtPrecedes-SemiMetric-Forward',x_SingleEntry) :- x_cid(a65b1276ed6863).
xc_microtheory(a65b1276ed6863,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6863,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6863,19).
xc_kb_names(a65b1276ed6863,[]).
xc_mapping_rows(a65b1276ed6863,[]).
x_argIsa('x_mtPrecedes-SemiMetric-Forward',4,x_PositiveInteger) :- x_cid(a65b1276ed6864).
xc_microtheory(a65b1276ed6864,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6864,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6864,20).
xc_kb_names(a65b1276ed6864,[]).
xc_mapping_rows(a65b1276ed6864,[]).
x_arg4Isa('x_mtPrecedes-SemiMetric-Forward',x_PositiveInteger) :- x_cid(a65b1276ed6865).
xc_microtheory(a65b1276ed6865,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6865,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6865,21).
xc_kb_names(a65b1276ed6865,[]).
xc_mapping_rows(a65b1276ed6865,[]).
x_argIsa('x_mtPrecedes-SemiMetric-Forward',2,'x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed6866).
xc_microtheory(a65b1276ed6866,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6866,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6866,22).
xc_kb_names(a65b1276ed6866,[]).
xc_mapping_rows(a65b1276ed6866,[]).
x_arg2Isa('x_mtPrecedes-SemiMetric-Forward','x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed6867).
xc_microtheory(a65b1276ed6867,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6867,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6867,24).
xc_kb_names(a65b1276ed6867,[]).
xc_mapping_rows(a65b1276ed6867,[]).
x_argIsa('x_mtPrecedes-SemiMetric-Forward',1,'x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed6868).
xc_microtheory(a65b1276ed6868,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6868,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6868,26).
xc_kb_names(a65b1276ed6868,[]).
xc_mapping_rows(a65b1276ed6868,[]).
x_arg1Isa('x_mtPrecedes-SemiMetric-Forward','x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed6869).
xc_microtheory(a65b1276ed6869,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6869,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6869,28).
xc_kb_names(a65b1276ed6869,[]).
xc_mapping_rows(a65b1276ed6869,[]).
x_isa('x_mtPrecedes-SemiMetric-Forward',x_GeneralTenseReasoningConstant) :- x_cid(a65b1276ed686a).
xc_microtheory(a65b1276ed686a,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed686a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed686a,30).
xc_kb_names(a65b1276ed686a,[]).
xc_mapping_rows(a65b1276ed686a,[]).
x_argFormat('x_mtPrecedes-SemiMetric-Backward',1,x_SingleEntry) :- x_cid(a65b1276ed686b).
xc_microtheory(a65b1276ed686b,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed686b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed686b,31).
xc_kb_names(a65b1276ed686b,[]).
xc_mapping_rows(a65b1276ed686b,[]).
x_argFormat('x_mtPrecedes-SemiMetric-Backward',4,x_SingleEntry) :- x_cid(a65b1276ed686c).
xc_microtheory(a65b1276ed686c,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed686c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed686c,32).
xc_kb_names(a65b1276ed686c,[]).
xc_mapping_rows(a65b1276ed686c,[]).
x_argFormat('x_mtPrecedes-SemiMetric-Backward',3,x_SingleEntry) :- x_cid(a65b1276ed686d).
xc_microtheory(a65b1276ed686d,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed686d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed686d,33).
xc_kb_names(a65b1276ed686d,[]).
xc_mapping_rows(a65b1276ed686d,[]).
x_strictlyFunctionalInArgs('x_mtPrecedes-Metric',3) :- x_cid(a65b1276ed686e).
xc_microtheory(a65b1276ed686e,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed686e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed686e,34).
xc_kb_names(a65b1276ed686e,[]).
xc_mapping_rows(a65b1276ed686e,[]).
x_genlPreds('x_mtPrecedes-Metric','x_mtPrecedes-SemiMetric-Backward') :- x_cid(a65b1276ed686f).
xc_microtheory(a65b1276ed686f,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed686f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed686f,35).
xc_kb_names(a65b1276ed686f,[]).
xc_mapping_rows(a65b1276ed686f,[]).
x_comment('x_mtPrecedes-SemiMetric-Backward',"For any instances MT1 and MT2 of\n#$ReasoningWithTenseMicrotheory-MixedDateSeries,\n(#$mtPrecedes-SemiMetric-Backward MT1 MT2 TYPE n) means that for some\ninstances DATE-1 and TATE-2 of TYPE such that\n(#$reasoningWithTenseMtTime MT1 DATE-1) and\n(#$reasoningWithTenseMtDate MT2 DATE-2) hold (notice the difference\nbetween MtTime and MtDate), DATE-1 is entirely earlier than DATE-2\nwith exactly n-1 distinct elements of TYPE between the two.  Note that\nif (#$reasoningWithTenseMtTime MT2 DATE) and (#$isa DATE TYPE) hold,\nthen (#$mtPrecedes-SemiMetric-Backward MT1 MT2 TYPE n) implies\n(#$mtPrecedes-Metric MT1 MT2 TYPE n).  Note also that\n(#$mtPrecedes-SemiMetric-Backward MT1 MT2 TYPE n) implies (#$mtPrecedes\nMT1 MT2).") :- x_cid(a65b1276ed6870).
xc_microtheory(a65b1276ed6870,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6870,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6870,36).
xc_kb_names(a65b1276ed6870,[]).
xc_mapping_rows(a65b1276ed6870,[]).
x_arg4Format('x_mtPrecedes-SemiMetric-Backward',x_SingleEntry) :- x_cid(a65b1276ed6871).
xc_microtheory(a65b1276ed6871,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6871,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6871,50).
xc_kb_names(a65b1276ed6871,[]).
xc_mapping_rows(a65b1276ed6871,[]).
x_arg3Format('x_mtPrecedes-SemiMetric-Backward',x_SingleEntry) :- x_cid(a65b1276ed6872).
xc_microtheory(a65b1276ed6872,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6872,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6872,51).
xc_kb_names(a65b1276ed6872,[]).
xc_mapping_rows(a65b1276ed6872,[]).
x_arg1Format('x_mtPrecedes-SemiMetric-Backward',x_SingleEntry) :- x_cid(a65b1276ed6873).
xc_microtheory(a65b1276ed6873,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6873,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6873,52).
xc_kb_names(a65b1276ed6873,[]).
xc_mapping_rows(a65b1276ed6873,[]).
x_argIsa('x_mtPrecedes-SemiMetric-Backward',4,x_PositiveInteger) :- x_cid(a65b1276ed6874).
xc_microtheory(a65b1276ed6874,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6874,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6874,53).
xc_kb_names(a65b1276ed6874,[]).
xc_mapping_rows(a65b1276ed6874,[]).
x_arg4Isa('x_mtPrecedes-SemiMetric-Backward',x_PositiveInteger) :- x_cid(a65b1276ed6875).
xc_microtheory(a65b1276ed6875,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6875,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6875,54).
xc_kb_names(a65b1276ed6875,[]).
xc_mapping_rows(a65b1276ed6875,[]).
x_argIsa('x_mtPrecedes-SemiMetric-Backward',2,'x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed6876).
xc_microtheory(a65b1276ed6876,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6876,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6876,55).
xc_kb_names(a65b1276ed6876,[]).
xc_mapping_rows(a65b1276ed6876,[]).
x_arg2Isa('x_mtPrecedes-SemiMetric-Backward','x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed6877).
xc_microtheory(a65b1276ed6877,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6877,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6877,57).
xc_kb_names(a65b1276ed6877,[]).
xc_mapping_rows(a65b1276ed6877,[]).
x_argIsa('x_mtPrecedes-SemiMetric-Backward',1,'x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed6878).
xc_microtheory(a65b1276ed6878,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6878,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6878,59).
xc_kb_names(a65b1276ed6878,[]).
xc_mapping_rows(a65b1276ed6878,[]).
x_arg1Isa('x_mtPrecedes-SemiMetric-Backward','x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed6879).
xc_microtheory(a65b1276ed6879,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6879,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6879,61).
xc_kb_names(a65b1276ed6879,[]).
xc_mapping_rows(a65b1276ed6879,[]).
x_isa('x_mtPrecedes-SemiMetric-Backward',x_GeneralTenseReasoningConstant) :- x_cid(a65b1276ed687a).
xc_microtheory(a65b1276ed687a,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed687a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed687a,63).
xc_kb_names(a65b1276ed687a,[]).
xc_mapping_rows(a65b1276ed687a,[]).
x_argFormat('x_mtPrecedes-Metric',4,x_SingleEntry) :- x_cid(a65b1276ed687b).
xc_microtheory(a65b1276ed687b,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed687b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed687b,64).
xc_kb_names(a65b1276ed687b,[]).
xc_mapping_rows(a65b1276ed687b,[]).
x_strictlyFunctionalInArgs('x_mtPrecedes-SemiMetric-Forward',2) :- x_cid(a65b1276ed687c).
xc_microtheory(a65b1276ed687c,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed687c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed687c,65).
xc_kb_names(a65b1276ed687c,[]).
xc_mapping_rows(a65b1276ed687c,[]).
x_arg4Format('x_mtPrecedes-Metric',x_SingleEntry) :- x_cid(a65b1276ed687d).
xc_microtheory(a65b1276ed687d,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed687d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed687d,66).
xc_kb_names(a65b1276ed687d,[]).
xc_mapping_rows(a65b1276ed687d,[]).
x_argFormat('x_mtPrecedes-Metric',3,x_SingleEntry) :- x_cid(a65b1276ed687e).
xc_microtheory(a65b1276ed687e,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed687e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed687e,67).
xc_kb_names(a65b1276ed687e,[]).
xc_mapping_rows(a65b1276ed687e,[]).
x_arg3Format('x_mtPrecedes-Metric',x_SingleEntry) :- x_cid(a65b1276ed687f).
xc_microtheory(a65b1276ed687f,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed687f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed687f,68).
xc_kb_names(a65b1276ed687f,[]).
xc_mapping_rows(a65b1276ed687f,[]).
x_argFormat('x_mtPrecedes-Metric',2,x_SingleEntry) :- x_cid(a65b1276ed6880).
xc_microtheory(a65b1276ed6880,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6880,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6880,69).
xc_kb_names(a65b1276ed6880,[]).
xc_mapping_rows(a65b1276ed6880,[]).
x_arg1Format('x_mtPrecedes-Metric',x_SingleEntry) :- x_cid(a65b1276ed6881).
xc_microtheory(a65b1276ed6881,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6881,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6881,70).
xc_kb_names(a65b1276ed6881,[]).
xc_mapping_rows(a65b1276ed6881,[]).
x_arg2Format('x_mtPrecedes-Metric',x_SingleEntry) :- x_cid(a65b1276ed6882).
xc_microtheory(a65b1276ed6882,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6882,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6882,71).
xc_kb_names(a65b1276ed6882,[]).
xc_mapping_rows(a65b1276ed6882,[]).
x_argFormat('x_mtPrecedes-Metric',1,x_SingleEntry) :- x_cid(a65b1276ed6883).
xc_microtheory(a65b1276ed6883,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6883,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6883,72).
xc_kb_names(a65b1276ed6883,[]).
xc_mapping_rows(a65b1276ed6883,[]).
x_comment('x_ReasoningWithTense-InferenceMt-MixedDateSeries',"This #$Microtheory contains rules about relations between\ninstances of #$ReasoningWithTenseMicrotheory-MixedDateSeries.  Note \nthat rules in this microtheory amounts to semantic \ninterpretations of formulas in microtheories that are instances of\n#$ReasoningWithTenseMicrotheory-SingleDateSeries, and thus\nshould not be present in those microtheories.") :- x_cid(a65b1276ed6884).
xc_microtheory(a65b1276ed6884,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6884,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6884,73).
xc_kb_names(a65b1276ed6884,[]).
xc_mapping_rows(a65b1276ed6884,[]).
x_comment('x_mtPrecedes-NthDate-Forward',"For any instances MT1 and MT2 of\n#$ReasoningWithTenseMicrotheory-MixedDateSeries,\n(#$mtPrecedes-NthDate-Forward MT1 MT2 TYPE n) means that there is an\ninstance CVR-TYPE of #$CalendarCoveringType such that (#$genls TYPE\nCVR-TYPE) holds, and there is an instance DATE-1 of CVR-TYPE and an\ninstance DATE-2 of TYPE such that (#$reasoningWithTenseMtDate MT1\nDATE-1) and (#$reasoningWithTenseMtTime MT2 DATE-2) hold (notice the\ndifference between MtDate and MtTime), and DATE-1 is entirely earlier\nthan DATE-2 with exactly n-1 distinct dates of TYPE between the two.\nFor example, let (#$mtPrecedes-NthDate-Forward MT1 MT2 #$Friday 1) hold.\nWe know that #$CalendarDay is the only element of\n#$CalendarCoveringType of which #$Friday is a spec.  Thus there is a\nDAY1 in #$CalendarDay and a DAY2 in #$Friday such that\n(#$reasoningWithTenseMtDate MT1 DAY1) and (#$reasoningWithTenseMtDate\nMT2 DAY2) hold, and such that DAY1 is entirely earlier than DAY2, with\nno instance of #$Friday between the two.  It is easy to see that this\nmeans DAY2 is the first Friday after DAY1.  Note that\n(#$mtPrecedes-NthDate-Forward MT1 MT2 TYPE n) implies (#$mtPrecedes MT1\nMT2).") :- x_cid(a65b1276ed6885).
xc_microtheory(a65b1276ed6885,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6885,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6885,80).
xc_kb_names(a65b1276ed6885,[]).
xc_mapping_rows(a65b1276ed6885,[]).
x_argIsa('x_mtPrecedes-NthDate-Forward',2,'x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed6886).
xc_microtheory(a65b1276ed6886,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6886,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6886,99).
xc_kb_names(a65b1276ed6886,[]).
xc_mapping_rows(a65b1276ed6886,[]).
x_arg2Isa('x_mtPrecedes-NthDate-Forward','x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed6887).
xc_microtheory(a65b1276ed6887,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6887,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6887,101).
xc_kb_names(a65b1276ed6887,[]).
xc_mapping_rows(a65b1276ed6887,[]).
x_argIsa('x_mtPrecedes-NthDate-Forward',1,'x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed6888).
xc_microtheory(a65b1276ed6888,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6888,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6888,103).
xc_kb_names(a65b1276ed6888,[]).
xc_mapping_rows(a65b1276ed6888,[]).
x_arg1Isa('x_mtPrecedes-NthDate-Forward','x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed6889).
xc_microtheory(a65b1276ed6889,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6889,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6889,105).
xc_kb_names(a65b1276ed6889,[]).
xc_mapping_rows(a65b1276ed6889,[]).
x_comment('x_mtPrecedes-NthDate-Backward',"For any instances MT1 and MT2 of\n#$ReasoningWithTenseMicrotheory-MixedDateSeries,\n(#$mtPrecedes-NthDate-Backward MT1 MT2 TYPE n) means that there is an\ninstance CVR-TYPE of #$CalendarCoveringType such that (#$genls TYPE\nCVR-TYPE) holds, and there is an instance DATE-2 of CVR-TYPE and an\ninstance DATE-1 of TYPE such that (#$reasoningWithTenseMtTime MT1\nDATE-1) and (#$reasoningWithTenseMtTime MT2 DATE-2) hold (notice here\nwe use MtTime rather than MtDate), and DATE-1 is entirely earlier than\nDATE-2 with exactly n-1 distinct dates of TYPE between the two.  For\nexample, let (#$mtPrecedes-NthDate-Backward MT1 MT2 #$Friday 1) hold.\nWe know that #$CalendarDay is the only element of\n#$CalendarCoveringType of which #$Friday is a spec.  Thus there is a\nDAY2 in #$CalendarDay and a DAY1 in #$Friday such that\n(#$reasoningWithTenseMtTime MT1 DAY1) and (#$reasoningWithTenseMtTime\nMT2 DAY2) hold, and such that DAY1 is entirely earlier than DAY2, with\nno instance of #$Friday between the two.  It is easy to see that this\nmeans DAY1 is the last Friday before DAY2.  Note that\n(#$mtPrecedes-NthDate-Backward MT1 MT2 TYPE n) implies (#$mtPrecedes MT1\nMT2).") :- x_cid(a65b1276ed688a).
xc_microtheory(a65b1276ed688a,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed688a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed688a,107).
xc_kb_names(a65b1276ed688a,[]).
xc_mapping_rows(a65b1276ed688a,[]).
x_argIsa('x_mtPrecedes-NthDate-Backward',2,'x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed688b).
xc_microtheory(a65b1276ed688b,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed688b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed688b,126).
xc_kb_names(a65b1276ed688b,[]).
xc_mapping_rows(a65b1276ed688b,[]).
x_arg2Isa('x_mtPrecedes-NthDate-Backward','x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed688c).
xc_microtheory(a65b1276ed688c,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed688c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed688c,128).
xc_kb_names(a65b1276ed688c,[]).
xc_mapping_rows(a65b1276ed688c,[]).
x_argIsa('x_mtPrecedes-NthDate-Backward',1,'x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed688d).
xc_microtheory(a65b1276ed688d,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed688d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed688d,130).
xc_kb_names(a65b1276ed688d,[]).
xc_mapping_rows(a65b1276ed688d,[]).
x_arg1Isa('x_mtPrecedes-NthDate-Backward','x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed688e).
xc_microtheory(a65b1276ed688e,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed688e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed688e,132).
xc_kb_names(a65b1276ed688e,[]).
xc_mapping_rows(a65b1276ed688e,[]).
x_argIsa('x_mtPrecedes-Metric',2,'x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed688f).
xc_microtheory(a65b1276ed688f,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed688f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed688f,134).
xc_kb_names(a65b1276ed688f,[]).
xc_mapping_rows(a65b1276ed688f,[]).
x_arg2Isa('x_mtPrecedes-Metric','x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed6890).
xc_microtheory(a65b1276ed6890,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6890,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6890,136).
xc_kb_names(a65b1276ed6890,[]).
xc_mapping_rows(a65b1276ed6890,[]).
x_argIsa('x_mtPrecedes-Metric',1,'x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed6891).
xc_microtheory(a65b1276ed6891,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6891,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6891,138).
xc_kb_names(a65b1276ed6891,[]).
xc_mapping_rows(a65b1276ed6891,[]).
x_arg1Isa('x_mtPrecedes-Metric','x_ReasoningWithTenseMicrotheory-MixedDateSeries') :- x_cid(a65b1276ed6892).
xc_microtheory(a65b1276ed6892,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6892,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6892,140).
xc_kb_names(a65b1276ed6892,[]).
xc_mapping_rows(a65b1276ed6892,[]).
x_arg3Isa('x_mtPrecedes-SemiMetric-Forward','x_ConventionallyClassifiedTimeIntervalSeries-CoveringAndDisjoint') :- x_cid(a65b1276ed6893).
xc_microtheory(a65b1276ed6893,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6893,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6893,142).
xc_kb_names(a65b1276ed6893,[]).
xc_mapping_rows(a65b1276ed6893,[]).
x_argIsa('x_mtPrecedes-SemiMetric-Forward',3,'x_ConventionallyClassifiedTimeIntervalSeries-CoveringAndDisjoint') :- x_cid(a65b1276ed6894).
xc_microtheory(a65b1276ed6894,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6894,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6894,144).
xc_kb_names(a65b1276ed6894,[]).
xc_mapping_rows(a65b1276ed6894,[]).
x_arg3Isa('x_mtPrecedes-SemiMetric-Backward','x_ConventionallyClassifiedTimeIntervalSeries-CoveringAndDisjoint') :- x_cid(a65b1276ed6895).
xc_microtheory(a65b1276ed6895,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6895,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6895,146).
xc_kb_names(a65b1276ed6895,[]).
xc_mapping_rows(a65b1276ed6895,[]).
x_argIsa('x_mtPrecedes-SemiMetric-Backward',3,'x_ConventionallyClassifiedTimeIntervalSeries-CoveringAndDisjoint') :- x_cid(a65b1276ed6896).
xc_microtheory(a65b1276ed6896,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6896,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6896,148).
xc_kb_names(a65b1276ed6896,[]).
xc_mapping_rows(a65b1276ed6896,[]).
x_strictlyFunctionalInArgs('x_mtPrecedes-Metric',2) :- x_cid(a65b1276ed6897).
xc_microtheory(a65b1276ed6897,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6897,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6897,150).
xc_kb_names(a65b1276ed6897,[]).
xc_mapping_rows(a65b1276ed6897,[]).
x_strictlyFunctionalInArgs('x_mtPrecedes-Metric',4) :- x_cid(a65b1276ed6898).
xc_microtheory(a65b1276ed6898,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6898,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6898,151).
xc_kb_names(a65b1276ed6898,[]).
xc_mapping_rows(a65b1276ed6898,[]).
x_strictlyFunctionalInArgs('x_mtPrecedes-SemiMetric-Forward',4) :- x_cid(a65b1276ed6899).
xc_microtheory(a65b1276ed6899,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed6899,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed6899,152).
xc_kb_names(a65b1276ed6899,[]).
xc_mapping_rows(a65b1276ed6899,[]).
x_strictlyFunctionalInArgs('x_mtPrecedes-SemiMetric-Forward',3) :- x_cid(a65b1276ed689a).
xc_microtheory(a65b1276ed689a,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed689a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed689a,153).
xc_kb_names(a65b1276ed689a,[]).
xc_mapping_rows(a65b1276ed689a,[]).
x_argFormat('x_mtPrecedes-SemiMetric-Forward',4,x_SingleEntry) :- x_cid(a65b1276ed689b).
xc_microtheory(a65b1276ed689b,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed689b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed689b,154).
xc_kb_names(a65b1276ed689b,[]).
xc_mapping_rows(a65b1276ed689b,[]).
x_argFormat('x_mtPrecedes-SemiMetric-Forward',2,x_SingleEntry) :- x_cid(a65b1276ed689c).
xc_microtheory(a65b1276ed689c,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed689c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed689c,155).
xc_kb_names(a65b1276ed689c,[]).
xc_mapping_rows(a65b1276ed689c,[]).
x_argFormat('x_mtPrecedes-SemiMetric-Forward',3,x_SingleEntry) :- x_cid(a65b1276ed689d).
xc_microtheory(a65b1276ed689d,'x_ReasoningWithTense-InferenceMt-MixedDateSeries').
xc_source_file(a65b1276ed689d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ReasoningWithTense-InferenceMt-MixedDateSeries.krf').
xc_source_line(a65b1276ed689d,156).
xc_kb_names(a65b1276ed689d,[]).
xc_mapping_rows(a65b1276ed689d,[]).
kb_cache_footer(footer{count:63,digest:'040ffdcda4ca92146d3154f63df1ce7e65c8c8a6223f3aed8cbc87307c174f61',headerDigest:'8a5e564d05469560c717e08a041c14957ab0af7e54d8c56bee815d2f295ac3ba'}).
