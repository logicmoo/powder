:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:2,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:16,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'445c63c3ae97ea5d8b1d82e5ef17bd4538ca3ad15ea595ed4b9fed79c12e4667',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/AspectTense-InferenceMt.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:569,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/AspectTense-InferenceMt.krf',sourceHash:'1d570532004c445493ff86a197f244c864e931278a97d2b34d15cfaa7334ae72',warnings:[]}).
x_isa('x_mtPrecedes-Immediately',x_GeneralTenseReasoningConstant) :- x_cid(a65b126c226953).
xc_microtheory(a65b126c226953,'x_AspectTense-InferenceMt').
xc_source_file(a65b126c226953,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/AspectTense-InferenceMt.krf').
xc_source_line(a65b126c226953,3).
xc_kb_names(a65b126c226953,[]).
xc_mapping_rows(a65b126c226953,[]).
x_comment('x_mtPrecedes-Immediately',"Suppose that MT1 and MT2 are instances of\n\n#$ReasoningWithTenseMicrotheory; then (#$mtPrecedes-Immediately\n\nMT1 MT2) is true iff (#$mtPrecedes MT1 and MT2), and\n\n(#$reasoningWithTenseMtTime MT1 BEFORE), and (#$reasoningWithTenseMtTime\n\nMT2 AFTER), and (#$contiguousAfter AFTER BEFORE). Other than a\n\ncontiguous-instant temporal relation, no particular assumption is made\n\nabout the temporal extension of MT1 and MT2.") :- x_cid(a65b126c226954).
xc_microtheory(a65b126c226954,'x_AspectTense-InferenceMt').
xc_source_file(a65b126c226954,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/AspectTense-InferenceMt.krf').
xc_source_line(a65b126c226954,4).
xc_kb_names(a65b126c226954,[]).
xc_mapping_rows(a65b126c226954,[]).
kb_cache_footer(footer{count:2,digest:'445c63c3ae97ea5d8b1d82e5ef17bd4538ca3ad15ea595ed4b9fed79c12e4667',headerDigest:ef80b3d2cd8338c31a28547eccc50e48485225f0b7c9c343ae2e9330647848cc}).
