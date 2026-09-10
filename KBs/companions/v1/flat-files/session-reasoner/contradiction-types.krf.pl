:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:15,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:54,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:a9eb086ec855f84ae55386b23a5958294af6dc3c9658d0f3f054328b2e513d3f,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/contradiction-types.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3316,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/contradiction-types.krf',sourceHash:'8cad9cdb8e13794f88f8a15d2d49dbdbfda9937e7376f46465ff134c1f7516d7',warnings:[]}).
x_isa(x_useContradictionType,x_Predicate) :- x_cid(a65b125e43fd71).
xc_microtheory(a65b125e43fd71,x_ContradictionTypesMt).
xc_source_file(a65b125e43fd71,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/contradiction-types.krf').
xc_source_line(a65b125e43fd71,15).
xc_kb_names(a65b125e43fd71,[]).
xc_mapping_rows(a65b125e43fd71,[]).
x_arity(x_useContradictionType,1) :- x_cid(a65b125e43fd72).
xc_microtheory(a65b125e43fd72,x_ContradictionTypesMt).
xc_source_file(a65b125e43fd72,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/contradiction-types.krf').
xc_source_line(a65b125e43fd72,16).
xc_kb_names(a65b125e43fd72,[]).
xc_mapping_rows(a65b125e43fd72,[]).
x_comment(x_useContradictionType,"(useContradictionType ?x) means that the contradiction type ?x should be one of the contradictions detected by the learning by reading\nsystem when the microtheory in which it is asserted is being used as the source of contradictions to detect.") :- x_cid(a65b125e43fd73).
xc_microtheory(a65b125e43fd73,x_ContradictionTypesMt).
xc_source_file(a65b125e43fd73,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/contradiction-types.krf').
xc_source_line(a65b125e43fd73,17).
xc_kb_names(a65b125e43fd73,[]).
xc_mapping_rows(a65b125e43fd73,[]).
x_isa(x_lbrContradictionType,x_Collection) :- x_cid(a65b125e43fd74).
xc_microtheory(a65b125e43fd74,x_ContradictionTypesMt).
xc_source_file(a65b125e43fd74,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/contradiction-types.krf').
xc_source_line(a65b125e43fd74,20).
xc_kb_names(a65b125e43fd74,[]).
xc_mapping_rows(a65b125e43fd74,[]).
x_comment(x_lbrContradictionType,"The collection of contradiction types detected by the lbr system. They are detected when (useContradictionType ?x)\nis asserted in the microtheory being used as the source of contradictions to detect.") :- x_cid(a65b125e43fd75).
xc_microtheory(a65b125e43fd75,x_ContradictionTypesMt).
xc_source_file(a65b125e43fd75,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/contradiction-types.krf').
xc_source_line(a65b125e43fd75,21).
xc_kb_names(a65b125e43fd75,[]).
xc_mapping_rows(a65b125e43fd75,[]).
x_isa(x_deductivelyValidLbrContradictionType,x_Collection) :- x_cid(a65b125e43fd76).
xc_microtheory(a65b125e43fd76,x_ContradictionTypesMt).
xc_source_file(a65b125e43fd76,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/contradiction-types.krf').
xc_source_line(a65b125e43fd76,24).
xc_kb_names(a65b125e43fd76,[]).
xc_mapping_rows(a65b125e43fd76,[]).
x_genls(x_deductivelyValidLbrContradictionType,x_lbrContradictionType) :- x_cid(a65b125e43fd77).
xc_microtheory(a65b125e43fd77,x_ContradictionTypesMt).
xc_source_file(a65b125e43fd77,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/contradiction-types.krf').
xc_source_line(a65b125e43fd77,25).
xc_kb_names(a65b125e43fd77,[]).
xc_mapping_rows(a65b125e43fd77,[]).
x_comment(x_deductivelyValidLbrContradictionType,"A member of deductivelyValidLbrContradictionType is a type of contradiction where if it's detected, something\nhas definitely gone wrong - for example, if something is believed to be a member of two disjoint sets at the same time. Contrast with notDeductivelyValidLbrContradictionType.") :- x_cid(a65b125e43fd78).
xc_microtheory(a65b125e43fd78,x_ContradictionTypesMt).
xc_source_file(a65b125e43fd78,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/contradiction-types.krf').
xc_source_line(a65b125e43fd78,26).
xc_kb_names(a65b125e43fd78,[]).
xc_mapping_rows(a65b125e43fd78,[]).
x_isa(x_notDeductivelyValidLbrContradictionType,x_Collection) :- x_cid(a65b125e43fd79).
xc_microtheory(a65b125e43fd79,x_ContradictionTypesMt).
xc_source_file(a65b125e43fd79,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/contradiction-types.krf').
xc_source_line(a65b125e43fd79,29).
xc_kb_names(a65b125e43fd79,[]).
xc_mapping_rows(a65b125e43fd79,[]).
x_genls(x_notDeductivelyValidLbrContradictionType,x_lbrContradictionType) :- x_cid(a65b125e43fd7a).
xc_microtheory(a65b125e43fd7a,x_ContradictionTypesMt).
xc_source_file(a65b125e43fd7a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/contradiction-types.krf').
xc_source_line(a65b125e43fd7a,30).
xc_kb_names(a65b125e43fd7a,[]).
xc_mapping_rows(a65b125e43fd7a,[]).
x_comment(x_notDeductivelyValidLbrContradictionType,"A member of notDeductivelyValidLbrContradictionType is a type of contradiction where if it's detected, something\nmay have gone wrong, but not necessarily - for example, if some entity X is a member of a collection and is also filling a slot in a role relation that has an argIsa\nof a different type, that's a clue that something has gone wrong, but it's not certain, since X could also be a member of another collection that would let it qualify\nfor that argIsa. Contrast with deductivelyValidLbrContradictionType.") :- x_cid(a65b125e43fd7b).
xc_microtheory(a65b125e43fd7b,x_ContradictionTypesMt).
xc_source_file(a65b125e43fd7b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/contradiction-types.krf').
xc_source_line(a65b125e43fd7b,31).
xc_kb_names(a65b125e43fd7b,[]).
xc_mapping_rows(a65b125e43fd7b,[]).
x_isa(x_choiceMakesAnArgIsaThatViolatesEarlierIsa,x_lbrContradictionType) :- x_cid(a65b125e43fd7c).
xc_microtheory(a65b125e43fd7c,x_ContradictionTypesMt).
xc_source_file(a65b125e43fd7c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/contradiction-types.krf').
xc_source_line(a65b125e43fd7c,38).
xc_kb_names(a65b125e43fd7c,[]).
xc_mapping_rows(a65b125e43fd7c,[]).
x_isa(x_choiceMakesAnArgIsaThatViolatesEarlierIsa,x_notDeductivelyValidLbrContradictionType) :- x_cid(a65b125e43fd7d).
xc_microtheory(a65b125e43fd7d,x_ContradictionTypesMt).
xc_source_file(a65b125e43fd7d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/contradiction-types.krf').
xc_source_line(a65b125e43fd7d,39).
xc_kb_names(a65b125e43fd7d,[]).
xc_mapping_rows(a65b125e43fd7d,[]).
x_comment(x_choiceMakesAnArgIsaThatViolatesEarlierIsa,"This contradiction type flags as a potential source of a contradiction any choice that use some entity X\nas the argument of some assertion, but X has been established earlier as being isa some collection that isn't something that falls under the argIsa for that slot.\nThis is a notDeductivelyValidLbrContradictionType because it could be a member of another collection that does belong to that argIsa.") :- x_cid(a65b125e43fd7e).
xc_microtheory(a65b125e43fd7e,x_ContradictionTypesMt).
xc_source_file(a65b125e43fd7e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/contradiction-types.krf').
xc_source_line(a65b125e43fd7e,40).
xc_kb_names(a65b125e43fd7e,[]).
xc_mapping_rows(a65b125e43fd7e,[]).
x_useContradictionType(x_choiceMakesAnArgIsaThatViolatesEarlierIsa) :- x_cid(a65b125e43fd7f).
xc_microtheory(a65b125e43fd7f,x_AllContradictionTypesMt).
xc_source_file(a65b125e43fd7f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/contradiction-types.krf').
xc_source_line(a65b125e43fd7f,47).
xc_kb_names(a65b125e43fd7f,[]).
xc_mapping_rows(a65b125e43fd7f,[]).
kb_cache_footer(footer{count:15,digest:a9eb086ec855f84ae55386b23a5958294af6dc3c9658d0f3f054328b2e513d3f,headerDigest:f0b09d2ef0e465403857439816ec75ce2cfefc1f18377204f4e6f5b9ccfe407f}).
