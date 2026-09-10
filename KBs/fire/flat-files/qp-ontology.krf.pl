:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:543,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:1425,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'9212c1b89d97591c0e2cd1404d72757bf0d266df6332d08950fc371dd5554238',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:61698,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf',sourceHash:'82cdcfe63ffb4aacc724621ed5b278f5c4054be407f30325f6f243ae8ba6088c',warnings:[warning('c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf',1156,9,"Empty expression outside a declared list-data slot retained as x_TheEmptyList.")]}).
x_genlMt(x_QPTheoryMt,x_OrdinalReasoningMt) :- x_cid(a65b159065765f).
xc_microtheory(a65b159065765f,x_QPTheoryMt).
xc_source_file(a65b159065765f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065765f,14).
xc_kb_names(a65b159065765f,[]).
xc_mapping_rows(a65b159065765f,[]).
x_isa(x_ContinuousQuantity,x_Collection) :- x_cid(a65b1590657660).
xc_microtheory(a65b1590657660,x_QPTheoryMt).
xc_source_file(a65b1590657660,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657660,43).
xc_kb_names(a65b1590657660,[]).
xc_mapping_rows(a65b1590657660,[]).
x_comment(x_ContinuousQuantity,"Continuous parameters are fluents representing \nproperties such as temperature, heat, price, etc.  Typically they \nare tied to some particular entity or situation.  Depending on their type, \nthey could have temporal or spatial derivatives.  Continuity applies to them, \nand they are dense. N.B. this is not a spec of Quantity, which is a collection\n of specific values that these fluents can take on.") :- x_cid(a65b1590657661).
xc_microtheory(a65b1590657661,x_QPTheoryMt).
xc_source_file(a65b1590657661,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657661,44).
xc_kb_names(a65b1590657661,[]).
xc_mapping_rows(a65b1590657661,[]).
x_genls(x_ContinuousQuantity,x_Thing) :- x_cid(a65b1590657662).
xc_microtheory(a65b1590657662,x_QPTheoryMt).
xc_source_file(a65b1590657662,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657662,50).
xc_kb_names(a65b1590657662,[]).
xc_mapping_rows(a65b1590657662,[]).
x_comment(x_ContinuousQuantityType,"Something is a ContinuousQuantityType if instances of it are \ncontinuous quantities.") :- x_cid(a65b1590657663).
xc_microtheory(a65b1590657663,x_QPTheoryMt).
xc_source_file(a65b1590657663,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657663,56).
xc_kb_names(a65b1590657663,[]).
xc_mapping_rows(a65b1590657663,[]).
x_isa(x_ContinuousQuantityType,x_CollectionType) :- x_cid(a65b1590657664).
xc_microtheory(a65b1590657664,x_QPTheoryMt).
xc_source_file(a65b1590657664,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657664,58).
xc_kb_names(a65b1590657664,[]).
xc_mapping_rows(a65b1590657664,[]).
x_genls(x_ContinuousQuantityType,x_Collection) :- x_cid(a65b1590657665).
xc_microtheory(a65b1590657665,x_QPTheoryMt).
xc_source_file(a65b1590657665,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657665,59).
xc_kb_names(a65b1590657665,[]).
xc_mapping_rows(a65b1590657665,[]).
x_comment(x_QPQuantityFn,"(QPQuantityFn ?q) denotes a function which, when applied to particular\nentities, denotes a QP theory quantity of type ?q.  ?q is spec of ScalarInterval,\nwhich includes physical quantities but also more abstract ones, like Morale. \nExamples include (QPQuantityFn Temperature), (QPQuantityFn Morale).\nIn QP theory, quantities are essentially fluents, since they are terms\nwhose values are situation-specific.") :- x_cid(a65b1590657666).
xc_microtheory(a65b1590657666,x_QPTheoryMt).
xc_source_file(a65b1590657666,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657666,62).
xc_kb_names(a65b1590657666,[]).
xc_mapping_rows(a65b1590657666,[]).
x_isa(x_QPQuantityFn,x_UnaryFunction) :- x_cid(a65b1590657667).
xc_microtheory(a65b1590657667,x_QPTheoryMt).
xc_source_file(a65b1590657667,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657667,68).
xc_kb_names(a65b1590657667,[]).
xc_mapping_rows(a65b1590657667,[]).
x_arity(x_QPQuantityFn,1) :- x_cid(a65b1590657668).
xc_microtheory(a65b1590657668,x_QPTheoryMt).
xc_source_file(a65b1590657668,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657668,69).
xc_kb_names(a65b1590657668,[]).
xc_mapping_rows(a65b1590657668,[]).
x_arg1Isa(x_QPQuantityFn,x_ScalarInterval) :- x_cid(a65b1590657669).
xc_microtheory(a65b1590657669,x_QPTheoryMt).
xc_source_file(a65b1590657669,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657669,70).
xc_kb_names(a65b1590657669,[]).
xc_mapping_rows(a65b1590657669,[]).
x_resultIsa(x_QPQuantityFn,x_VariableArityFunction) :- x_cid(a65b159065766a).
xc_microtheory(a65b159065766a,x_QPTheoryMt).
xc_source_file(a65b159065766a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065766a,71).
xc_kb_names(a65b159065766a,[]).
xc_mapping_rows(a65b159065766a,[]).
x_resultResultIsa(x_QPQuantityFn,x_ContinuousQuantity) :- x_cid(a65b159065766b).
xc_microtheory(a65b159065766b,x_QPTheoryMt).
xc_source_file(a65b159065766b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065766b,72).
xc_kb_names(a65b159065766b,[]).
xc_mapping_rows(a65b159065766b,[]).
x_isa(x_hasQuantity,x_BinaryPredicate) :- x_cid(a65b159065766c).
xc_microtheory(a65b159065766c,x_QPTheoryMt).
xc_source_file(a65b159065766c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065766c,74).
xc_kb_names(a65b159065766c,[]).
xc_mapping_rows(a65b159065766c,[]).
x_arity(x_hasQuantity,2) :- x_cid(a65b159065766d).
xc_microtheory(a65b159065766d,x_QPTheoryMt).
xc_source_file(a65b159065766d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065766d,75).
xc_kb_names(a65b159065766d,[]).
xc_mapping_rows(a65b159065766d,[]).
x_arg1Isa(x_hasQuantity,x_Thing) :- x_cid(a65b159065766e).
xc_microtheory(a65b159065766e,x_QPTheoryMt).
xc_source_file(a65b159065766e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065766e,76).
xc_kb_names(a65b159065766e,[]).
xc_mapping_rows(a65b159065766e,[]).
x_arg2Isa(x_hasQuantity,x_ContinuousQuantity) :- x_cid(a65b159065766f).
xc_microtheory(a65b159065766f,x_QPTheoryMt).
xc_source_file(a65b159065766f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065766f,77).
xc_kb_names(a65b159065766f,[]).
xc_mapping_rows(a65b159065766f,[]).
x_comment(x_hasQuantity,"(hasQuantity ?o ?q) means that entity ?o has the quantity ?q.  Typically ?q is a NAT\nthat denotes a continuous quantity.") :- x_cid(a65b1590657670).
xc_microtheory(a65b1590657670,x_QPTheoryMt).
xc_source_file(a65b1590657670,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657670,78).
xc_kb_names(a65b1590657670,[]).
xc_mapping_rows(a65b1590657670,[]).
x_comment(x_qpBasisQPair,"(qpBasisQPair ?q1 ?q2) indicates that, in the scenario model this statement\n appears in, that the ordinal relationship between ?q1 and ?q2 should be tracked\n as part of the basis set for qualitative states.") :- x_cid(a65b1590657671).
xc_microtheory(a65b1590657671,x_QPTheoryMt).
xc_source_file(a65b1590657671,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657671,82).
xc_kb_names(a65b1590657671,[]).
xc_mapping_rows(a65b1590657671,[]).
x_isa(x_qpBasisQPair,x_BinaryPredicate) :- x_cid(a65b1590657672).
xc_microtheory(a65b1590657672,x_QPTheoryMt).
xc_source_file(a65b1590657672,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657672,86).
xc_kb_names(a65b1590657672,[]).
xc_mapping_rows(a65b1590657672,[]).
x_arity(x_qpBasisQPair,2) :- x_cid(a65b1590657673).
xc_microtheory(a65b1590657673,x_QPTheoryMt).
xc_source_file(a65b1590657673,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657673,87).
xc_kb_names(a65b1590657673,[]).
xc_mapping_rows(a65b1590657673,[]).
x_arg1Isa(x_qpBasisQPair,x_ContinuousQuantity) :- x_cid(a65b1590657674).
xc_microtheory(a65b1590657674,x_QPTheoryMt).
xc_source_file(a65b1590657674,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657674,88).
xc_kb_names(a65b1590657674,[]).
xc_mapping_rows(a65b1590657674,[]).
x_arg2Isa(x_qpBasisQPair,x_ContinuousQuantity) :- x_cid(a65b1590657675).
xc_microtheory(a65b1590657675,x_QPTheoryMt).
xc_source_file(a65b1590657675,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657675,89).
xc_kb_names(a65b1590657675,[]).
xc_mapping_rows(a65b1590657675,[]).
x_isa(x_qPlusFn,x_VariableArityFunction) :- x_cid(a65b1590657676).
xc_microtheory(a65b1590657676,x_QPTheoryMt).
xc_source_file(a65b1590657676,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657676,94).
xc_kb_names(a65b1590657676,[]).
xc_mapping_rows(a65b1590657676,[]).
x_comment(x_QPlusFn,"QPlusFn is a PlusFn for continuous quantities, such as those\n used in QP theory.") :- x_cid(a65b1590657677).
xc_microtheory(a65b1590657677,x_QPTheoryMt).
xc_source_file(a65b1590657677,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657677,95).
xc_kb_names(a65b1590657677,[]).
xc_mapping_rows(a65b1590657677,[]).
x_argsIsa(x_QPlusFn,x_ContinuousQuantity) :- x_cid(a65b1590657678).
xc_microtheory(a65b1590657678,x_QPTheoryMt).
xc_source_file(a65b1590657678,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657678,97).
xc_kb_names(a65b1590657678,[]).
xc_mapping_rows(a65b1590657678,[]).
x_resultIsa(x_QPlusFn,x_ContinuousQuantity) :- x_cid(a65b1590657679).
xc_microtheory(a65b1590657679,x_QPTheoryMt).
xc_source_file(a65b1590657679,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657679,98).
xc_kb_names(a65b1590657679,[]).
xc_mapping_rows(a65b1590657679,[]).
x_isa(x_QDifferenceFn,x_BinaryFunction) :- x_cid(a65b159065767a).
xc_microtheory(a65b159065767a,x_QPTheoryMt).
xc_source_file(a65b159065767a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065767a,100).
xc_kb_names(a65b159065767a,[]).
xc_mapping_rows(a65b159065767a,[]).
x_comment(x_QDifferenceFn,"QDifferenceFn is a DifferenceFn for continuous\n quantities, such as those used in QP theory. Used by inference rules for q= to infer qprops.") :- x_cid(a65b159065767b).
xc_microtheory(a65b159065767b,x_QPTheoryMt).
xc_source_file(a65b159065767b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065767b,101).
xc_kb_names(a65b159065767b,[]).
xc_mapping_rows(a65b159065767b,[]).
x_arg1Isa(x_QDifferenceFn,x_ContinuousQuantity) :- x_cid(a65b159065767c).
xc_microtheory(a65b159065767c,x_QPTheoryMt).
xc_source_file(a65b159065767c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065767c,103).
xc_kb_names(a65b159065767c,[]).
xc_mapping_rows(a65b159065767c,[]).
x_arg2Isa(x_QDifferenceFn,x_ContinuousQuantity) :- x_cid(a65b159065767d).
xc_microtheory(a65b159065767d,x_QPTheoryMt).
xc_source_file(a65b159065767d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065767d,104).
xc_kb_names(a65b159065767d,[]).
xc_mapping_rows(a65b159065767d,[]).
x_resultIsa(x_QDifferenceFn,x_ContinuousQuantity) :- x_cid(a65b159065767e).
xc_microtheory(a65b159065767e,x_QPTheoryMt).
xc_source_file(a65b159065767e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065767e,105).
xc_kb_names(a65b159065767e,[]).
xc_mapping_rows(a65b159065767e,[]).
x_isa(x_QMinusFn,x_UnaryFunction) :- x_cid(a65b159065767f).
xc_microtheory(a65b159065767f,x_QPTheoryMt).
xc_source_file(a65b159065767f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065767f,107).
xc_kb_names(a65b159065767f,[]).
xc_mapping_rows(a65b159065767f,[]).
x_comment(x_QMinusFn,"QMinusFn is a MinusFn for continuous quantities, such as \n those used in QP theory, used in q= expressions to infer qprops.") :- x_cid(a65b1590657680).
xc_microtheory(a65b1590657680,x_QPTheoryMt).
xc_source_file(a65b1590657680,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657680,108).
xc_kb_names(a65b1590657680,[]).
xc_mapping_rows(a65b1590657680,[]).
x_arg1Isa(x_QMinusFn,x_ContinuousQuantity) :- x_cid(a65b1590657681).
xc_microtheory(a65b1590657681,x_QPTheoryMt).
xc_source_file(a65b1590657681,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657681,110).
xc_kb_names(a65b1590657681,[]).
xc_mapping_rows(a65b1590657681,[]).
x_resultIsa(x_QMinusFn,x_ContinuousQuantity) :- x_cid(a65b1590657682).
xc_microtheory(a65b1590657682,x_QPTheoryMt).
xc_source_file(a65b1590657682,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657682,111).
xc_kb_names(a65b1590657682,[]).
xc_mapping_rows(a65b1590657682,[]).
x_isa(x_ModelFragment,x_Collection) :- x_cid(a65b1590657683).
xc_microtheory(a65b1590657683,x_QPTheoryMt).
xc_source_file(a65b1590657683,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657683,127).
xc_kb_names(a65b1590657683,[]).
xc_mapping_rows(a65b1590657683,[]).
x_genls(x_ModelFragment,x_TemporallyExtendedThing) :- x_cid(a65b1590657684).
xc_microtheory(a65b1590657684,x_QPTheoryMt).
xc_source_file(a65b1590657684,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657684,128).
xc_kb_names(a65b1590657684,[]).
xc_mapping_rows(a65b1590657684,[]).
x_comment(x_ModelFragment,"Instances of ModelFragment represent instances of model fragments,\nin the sense of compositional modeling (Falkenhainer & Forbus, 1991).\nA model fragment is active whenever its participants exist and its conditions hold.\nWhen it is active, its consequences are believed to be true.") :- x_cid(a65b1590657685).
xc_microtheory(a65b1590657685,x_QPTheoryMt).
xc_source_file(a65b1590657685,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657685,129).
xc_kb_names(a65b1590657685,[]).
xc_mapping_rows(a65b1590657685,[]).
x_isa(x_PhysicalModelFragment,x_Collection) :- x_cid(a65b1590657686).
xc_microtheory(a65b1590657686,x_QPTheoryMt).
xc_source_file(a65b1590657686,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657686,135).
xc_kb_names(a65b1590657686,[]).
xc_mapping_rows(a65b1590657686,[]).
x_genls(x_PhysicalModelFragment,x_ModelFragment) :- x_cid(a65b1590657687).
xc_microtheory(a65b1590657687,x_QPTheoryMt).
xc_source_file(a65b1590657687,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657687,136).
xc_kb_names(a65b1590657687,[]).
xc_mapping_rows(a65b1590657687,[]).
x_genls(x_PhysicalModelFragment,x_PartiallyTangible) :- x_cid(a65b1590657688).
xc_microtheory(a65b1590657688,x_QPTheoryMt).
xc_source_file(a65b1590657688,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657688,137).
xc_kb_names(a65b1590657688,[]).
xc_mapping_rows(a65b1590657688,[]).
x_comment(x_PhysicalModelFragment,"PhysicalModelFragments represent things for which physical existence is a concern.\nExamples include physical processes and contained fluids, the latter having existence\npredicated on an ordinal relationship and hence something which can be predicted within\nQP theory.") :- x_cid(a65b1590657689).
xc_microtheory(a65b1590657689,x_QPTheoryMt).
xc_source_file(a65b1590657689,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657689,138).
xc_kb_names(a65b1590657689,[]).
xc_mapping_rows(a65b1590657689,[]).
x_isa(x_ConceptualModelFragment,x_Collection) :- x_cid(a65b159065768a).
xc_microtheory(a65b159065768a,x_QPTheoryMt).
xc_source_file(a65b159065768a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065768a,144).
xc_kb_names(a65b159065768a,[]).
xc_mapping_rows(a65b159065768a,[]).
x_genls(x_ConceptualModelFragment,x_ModelFragment) :- x_cid(a65b159065768b).
xc_microtheory(a65b159065768b,x_QPTheoryMt).
xc_source_file(a65b159065768b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065768b,145).
xc_kb_names(a65b159065768b,[]).
xc_mapping_rows(a65b159065768b,[]).
x_comment(x_ConceptualModelFragment,"Instances of ConceptualModelFragment represent model fragments that do not entail\nphysical existence, such as air being saturated or a container being full.  Otherwise\nthey have the same properties as other model fragments.") :- x_cid(a65b159065768c).
xc_microtheory(a65b159065768c,x_QPTheoryMt).
xc_source_file(a65b159065768c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065768c,146).
xc_kb_names(a65b159065768c,[]).
xc_mapping_rows(a65b159065768c,[]).
x_disjointWith(x_PhysicalModelFragment,x_ConceptualModelFragment) :- x_cid(a65b159065768d).
xc_microtheory(a65b159065768d,x_QPTheoryMt).
xc_source_file(a65b159065768d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065768d,151).
xc_kb_names(a65b159065768d,[]).
xc_mapping_rows(a65b159065768d,[]).
x_isa(x_QPProcess,x_Collection) :- x_cid(a65b159065768e).
xc_microtheory(a65b159065768e,x_QPTheoryMt).
xc_source_file(a65b159065768e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065768e,153).
xc_kb_names(a65b159065768e,[]).
xc_mapping_rows(a65b159065768e,[]).
x_genls(x_QPProcess,x_PhysicalModelFragment) :- x_cid(a65b159065768f).
xc_microtheory(a65b159065768f,x_QPTheoryMt).
xc_source_file(a65b159065768f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065768f,154).
xc_kb_names(a65b159065768f,[]).
xc_mapping_rows(a65b159065768f,[]).
x_comment(x_QPProcess,"Instances of QPProcess represent QP theory's notion of continuous process.\nThey serve as the mechanism of change in the continuous world.  \nThey are a spec of PhysicalModelFragment, because they are held to exist, e.g., their\nquantities do not exist except when it is active.\nOnly continuous processes can have direct influences.") :- x_cid(a65b1590657690).
xc_microtheory(a65b1590657690,x_QPTheoryMt).
xc_source_file(a65b1590657690,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657690,155).
xc_kb_names(a65b1590657690,[]).
xc_mapping_rows(a65b1590657690,[]).
x_isa(x_activeMF,x_UnaryPredicate) :- x_cid(a65b1590657691).
xc_microtheory(a65b1590657691,x_QPTheoryMt).
xc_source_file(a65b1590657691,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657691,164).
xc_kb_names(a65b1590657691,[]).
xc_mapping_rows(a65b1590657691,[]).
x_arity(x_activeMF,1) :- x_cid(a65b1590657692).
xc_microtheory(a65b1590657692,x_QPTheoryMt).
xc_source_file(a65b1590657692,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657692,165).
xc_kb_names(a65b1590657692,[]).
xc_mapping_rows(a65b1590657692,[]).
x_comment(x_activeMF,"(activeMF ?mf) means that ?mf is active.  This occurs only when\nits participants all exist, the configurational constraints hold, and\nthe conditions are true.  When a QPProcess is active, its consequences\nhold.  These tend to be direct influences, and the changes they cause\ndirectly and indirectly constitute the causal effects of the process.") :- x_cid(a65b1590657693).
xc_microtheory(a65b1590657693,x_QPTheoryMt).
xc_source_file(a65b1590657693,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657693,166).
xc_kb_names(a65b1590657693,[]).
xc_mapping_rows(a65b1590657693,[]).
x_arg1Isa(x_activeMF,x_ModelFragment) :- x_cid(a65b1590657694).
xc_microtheory(a65b1590657694,x_QPTheoryMt).
xc_source_file(a65b1590657694,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657694,171).
xc_kb_names(a65b1590657694,[]).
xc_mapping_rows(a65b1590657694,[]).
x_isa(x_existsMF,x_UnaryPredicate) :- x_cid(a65b1590657695).
xc_microtheory(a65b1590657695,x_QPTheoryMt).
xc_source_file(a65b1590657695,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657695,173).
xc_kb_names(a65b1590657695,[]).
xc_mapping_rows(a65b1590657695,[]).
x_arity(x_existsMF,1) :- x_cid(a65b1590657696).
xc_microtheory(a65b1590657696,x_QPTheoryMt).
xc_source_file(a65b1590657696,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657696,174).
xc_kb_names(a65b1590657696,[]).
xc_mapping_rows(a65b1590657696,[]).
x_comment(x_existsMF,"(existsMF ?mf) means that ?mf exists. This occurs only when\nits participants all exist, and their configurational constraints hold.") :- x_cid(a65b1590657697).
xc_microtheory(a65b1590657697,x_QPTheoryMt).
xc_source_file(a65b1590657697,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657697,175).
xc_kb_names(a65b1590657697,[]).
xc_mapping_rows(a65b1590657697,[]).
x_arg1Isa(x_existsMF,x_ModelFragment) :- x_cid(a65b1590657698).
xc_microtheory(a65b1590657698,x_QPTheoryMt).
xc_source_file(a65b1590657698,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657698,177).
xc_kb_names(a65b1590657698,[]).
xc_mapping_rows(a65b1590657698,[]).
'x_<=='(x_not(x_activeMF(V1)),x_wmOnly(x_lookupOnly(x_localOnly(x_mfiConditionOf(V1,V2)))),x_not(V2)) :- x_cid(a65b1590657699,V1,V2).
xc_microtheory(a65b1590657699,x_QPTheoryMt).
xc_source_file(a65b1590657699,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657699,187).
xc_kb_names(a65b1590657699,["?mfi","?c"]).
xc_mapping_rows(a65b1590657699,[]).
'x_<=='(x_activeMF(V1),x_wmOnly(x_lookupOnly(x_localOnly(x_isa(V1,x_ModelFragment)))),x_evaluate(V2,x_TheClosedRetrievalSetOf(V3,x_mfiConditionOf(V1,V3))),x_everySatisfies(V3,V2,V3)) :- x_cid(a65b159065769a,V1,V2,V3).
xc_microtheory(a65b159065769a,x_QPTheoryMt).
xc_source_file(a65b159065769a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065769a,191).
xc_kb_names(a65b159065769a,["?mfi","?conditions","?c"]).
xc_mapping_rows(a65b159065769a,[]).
x_isa(x_mfCondition,x_BinaryPredicate) :- x_cid(a65b159065769b).
xc_microtheory(a65b159065769b,x_QPTheoryMt).
xc_source_file(a65b159065769b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065769b,200).
xc_kb_names(a65b159065769b,[]).
xc_mapping_rows(a65b159065769b,[]).
x_arity(x_mfCondition,2) :- x_cid(a65b159065769c).
xc_microtheory(a65b159065769c,x_QPTheoryMt).
xc_source_file(a65b159065769c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065769c,201).
xc_kb_names(a65b159065769c,[]).
xc_mapping_rows(a65b159065769c,[]).
x_arg1Isa(x_mfCondition,x_ModelFragment) :- x_cid(a65b159065769d).
xc_microtheory(a65b159065769d,x_QPTheoryMt).
xc_source_file(a65b159065769d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065769d,202).
xc_kb_names(a65b159065769d,[]).
xc_mapping_rows(a65b159065769d,[]).
x_arg2Isa(x_mfCondition,'x_CycLSentence-Assertible') :- x_cid(a65b159065769e).
xc_microtheory(a65b159065769e,x_QPTheoryMt).
xc_source_file(a65b159065769e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065769e,203).
xc_kb_names(a65b159065769e,[]).
xc_mapping_rows(a65b159065769e,[]).
x_comment(x_mfCondition,"(mfCondition ?mf ?c) indicates that the statement ?c is a conjunct in the conditions\nunder which model fragment instance ?mf is active.  We decompose the conjunction into\nindividual statements to support more flexible reasoning about them.") :- x_cid(a65b159065769f).
xc_microtheory(a65b159065769f,x_QPTheoryMt).
xc_source_file(a65b159065769f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065769f,204).
xc_kb_names(a65b159065769f,[]).
xc_mapping_rows(a65b159065769f,[]).
x_isa(x_mfConsequence,x_BinaryPredicate) :- x_cid(a65b15906576a0).
xc_microtheory(a65b15906576a0,x_QPTheoryMt).
xc_source_file(a65b15906576a0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576a0,209).
xc_kb_names(a65b15906576a0,[]).
xc_mapping_rows(a65b15906576a0,[]).
x_arity(x_mfConsequence,2) :- x_cid(a65b15906576a1).
xc_microtheory(a65b15906576a1,x_QPTheoryMt).
xc_source_file(a65b15906576a1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576a1,210).
xc_kb_names(a65b15906576a1,[]).
xc_mapping_rows(a65b15906576a1,[]).
x_arg1Isa(x_mfConsequence,x_ModelFragment) :- x_cid(a65b15906576a2).
xc_microtheory(a65b15906576a2,x_QPTheoryMt).
xc_source_file(a65b15906576a2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576a2,211).
xc_kb_names(a65b15906576a2,[]).
xc_mapping_rows(a65b15906576a2,[]).
x_arg2Isa(x_mfConsequence,'x_CycLSentence-Assertible') :- x_cid(a65b15906576a3).
xc_microtheory(a65b15906576a3,x_QPTheoryMt).
xc_source_file(a65b15906576a3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576a3,212).
xc_kb_names(a65b15906576a3,[]).
xc_mapping_rows(a65b15906576a3,[]).
x_comment(x_mfConsequence,"(mfConsequence ?mf ?c) indicates that the statement ?c is a consequence which is entailed\nwhenever model fragment instance ?mf is active.") :- x_cid(a65b15906576a4).
xc_microtheory(a65b15906576a4,x_QPTheoryMt).
xc_source_file(a65b15906576a4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576a4,213).
xc_kb_names(a65b15906576a4,[]).
xc_mapping_rows(a65b15906576a4,[]).
x_isa(x_mfParticipant,x_BinaryRelation) :- x_cid(a65b15906576a5).
xc_microtheory(a65b15906576a5,x_QPTheoryMt).
xc_source_file(a65b15906576a5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576a5,221).
xc_kb_names(a65b15906576a5,[]).
xc_mapping_rows(a65b15906576a5,[]).
x_arity(x_mfParticipant,2) :- x_cid(a65b15906576a6).
xc_microtheory(a65b15906576a6,x_QPTheoryMt).
xc_source_file(a65b15906576a6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576a6,222).
xc_kb_names(a65b15906576a6,[]).
xc_mapping_rows(a65b15906576a6,[]).
x_arg1Isa(x_mfParticipant,x_ModelFragment) :- x_cid(a65b15906576a7).
xc_microtheory(a65b15906576a7,x_QPTheoryMt).
xc_source_file(a65b15906576a7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576a7,223).
xc_kb_names(a65b15906576a7,[]).
xc_mapping_rows(a65b15906576a7,[]).
x_arg2Isa(x_mfParticipant,x_Thing) :- x_cid(a65b15906576a8).
xc_microtheory(a65b15906576a8,x_QPTheoryMt).
xc_source_file(a65b15906576a8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576a8,224).
xc_kb_names(a65b15906576a8,[]).
xc_mapping_rows(a65b15906576a8,[]).
x_comment(x_mfParticipant,"(mfParticipant ?mfi ?e) indicates that model fragment instance ?mf1 has entity ?e\nas one of its participants.  This is intended for queries, the specific participant\nrelations are defined to be specPreds of this relationships.") :- x_cid(a65b15906576a9).
xc_microtheory(a65b15906576a9,x_QPTheoryMt).
xc_source_file(a65b15906576a9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576a9,225).
xc_kb_names(a65b15906576a9,[]).
xc_mapping_rows(a65b15906576a9,[]).
x_isa(x_ModelFragmentType,x_Collection) :- x_cid(a65b15906576aa).
xc_microtheory(a65b15906576aa,x_QPTheoryMt).
xc_source_file(a65b15906576aa,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576aa,232).
xc_kb_names(a65b15906576aa,[]).
xc_mapping_rows(a65b15906576aa,[]).
x_comment(x_ModelFragmentType,"Instances of ModelFragmentTypes are types of model fragments,\nin the compositional modeling methodology of Falkenhainer and Forbus (1991).\nTheir instantiations are instances of ModelFragment.") :- x_cid(a65b15906576ab).
xc_microtheory(a65b15906576ab,x_QPTheoryMt).
xc_source_file(a65b15906576ab,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576ab,233).
xc_kb_names(a65b15906576ab,[]).
xc_mapping_rows(a65b15906576ab,[]).
x_isa(x_PhysicalModelFragmentType,x_Collection) :- x_cid(a65b15906576ac).
xc_microtheory(a65b15906576ac,x_QPTheoryMt).
xc_source_file(a65b15906576ac,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576ac,239).
xc_kb_names(a65b15906576ac,[]).
xc_mapping_rows(a65b15906576ac,[]).
x_genls(x_PhysicalModelFragmentType,x_ModelFragmentType) :- x_cid(a65b15906576ad).
xc_microtheory(a65b15906576ad,x_QPTheoryMt).
xc_source_file(a65b15906576ad,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576ad,240).
xc_kb_names(a65b15906576ad,[]).
xc_mapping_rows(a65b15906576ad,[]).
x_comment(x_PhysicalModelFragmentType,"Instances of PhysicalModelFragmentType are are types of model fragments whose\ninstantiations in a model will be instances of PhysicalModelFragment.") :- x_cid(a65b15906576ae).
xc_microtheory(a65b15906576ae,x_QPTheoryMt).
xc_source_file(a65b15906576ae,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576ae,241).
xc_kb_names(a65b15906576ae,[]).
xc_mapping_rows(a65b15906576ae,[]).
x_isa(x_ConceptualModelFragmentType,x_Collection) :- x_cid(a65b15906576af).
xc_microtheory(a65b15906576af,x_QPTheoryMt).
xc_source_file(a65b15906576af,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576af,245).
xc_kb_names(a65b15906576af,[]).
xc_mapping_rows(a65b15906576af,[]).
x_genls(x_ConceptualModelFragmentType,x_ModelFragmentType) :- x_cid(a65b15906576b0).
xc_microtheory(a65b15906576b0,x_QPTheoryMt).
xc_source_file(a65b15906576b0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576b0,246).
xc_kb_names(a65b15906576b0,[]).
xc_mapping_rows(a65b15906576b0,[]).
x_comment(x_ConceptualModelFragmentType,"An instance of ConceptualModelFragmentType is a type of model fragment whose\ninstantiations in a model are instances of ConceptualModelFragment.") :- x_cid(a65b15906576b1).
xc_microtheory(a65b15906576b1,x_QPTheoryMt).
xc_source_file(a65b15906576b1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576b1,247).
xc_kb_names(a65b15906576b1,[]).
xc_mapping_rows(a65b15906576b1,[]).
x_disjointWith(x_PhysicalModelFragmentType,x_ConceptualModelFragmentType) :- x_cid(a65b15906576b2).
xc_microtheory(a65b15906576b2,x_QPTheoryMt).
xc_source_file(a65b15906576b2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576b2,251).
xc_kb_names(a65b15906576b2,[]).
xc_mapping_rows(a65b15906576b2,[]).
x_isa(x_QPProcessType,x_Collection) :- x_cid(a65b15906576b3).
xc_microtheory(a65b15906576b3,x_QPTheoryMt).
xc_source_file(a65b15906576b3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576b3,253).
xc_kb_names(a65b15906576b3,[]).
xc_mapping_rows(a65b15906576b3,[]).
x_genls(x_QPProcessType,x_PhysicalModelFragmentType) :- x_cid(a65b15906576b4).
xc_microtheory(a65b15906576b4,x_QPTheoryMt).
xc_source_file(a65b15906576b4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576b4,254).
xc_kb_names(a65b15906576b4,[]).
xc_mapping_rows(a65b15906576b4,[]).
x_comment(x_QPProcessType,"An instance of QPProcessType is a type of model fragment whose\ninstantiations in a model are instances of QPProcess.") :- x_cid(a65b15906576b5).
xc_microtheory(a65b15906576b5,x_QPTheoryMt).
xc_source_file(a65b15906576b5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576b5,255).
xc_kb_names(a65b15906576b5,[]).
xc_mapping_rows(a65b15906576b5,[]).
x_isa(x_mfTypeCondition,x_Predicate) :- x_cid(a65b15906576b6).
xc_microtheory(a65b15906576b6,x_QPTheoryMt).
xc_source_file(a65b15906576b6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576b6,269).
xc_kb_names(a65b15906576b6,[]).
xc_mapping_rows(a65b15906576b6,[]).
x_arity(x_mfTypeCondition,2) :- x_cid(a65b15906576b7).
xc_microtheory(a65b15906576b7,x_QPTheoryMt).
xc_source_file(a65b15906576b7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576b7,270).
xc_kb_names(a65b15906576b7,[]).
xc_mapping_rows(a65b15906576b7,[]).
x_arg1Isa(x_mfTypeCondition,x_ModelFragmentType) :- x_cid(a65b15906576b8).
xc_microtheory(a65b15906576b8,x_QPTheoryMt).
xc_source_file(a65b15906576b8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576b8,271).
xc_kb_names(a65b15906576b8,[]).
xc_mapping_rows(a65b15906576b8,[]).
x_arg2Isa(x_mfTypeCondition,'x_CycLSentence-Assertible') :- x_cid(a65b15906576b9).
xc_microtheory(a65b15906576b9,x_QPTheoryMt).
xc_source_file(a65b15906576b9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576b9,272).
xc_kb_names(a65b15906576b9,[]).
xc_mapping_rows(a65b15906576b9,[]).
x_comment(x_mfTypeCondition,"(mfTypeCondition ?mft ?s) indicates that the non-ground statement ?s is one of the\nconjuncts defining the conditions under which instances of model fragment type ?mft\nis active.") :- x_cid(a65b15906576ba).
xc_microtheory(a65b15906576ba,x_QPTheoryMt).
xc_source_file(a65b15906576ba,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576ba,273).
xc_kb_names(a65b15906576ba,[]).
xc_mapping_rows(a65b15906576ba,[]).
x_isa(x_mfTypeConsequence,x_Predicate) :- x_cid(a65b15906576bb).
xc_microtheory(a65b15906576bb,x_QPTheoryMt).
xc_source_file(a65b15906576bb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576bb,278).
xc_kb_names(a65b15906576bb,[]).
xc_mapping_rows(a65b15906576bb,[]).
x_arity(x_mfTypeConsequence,2) :- x_cid(a65b15906576bc).
xc_microtheory(a65b15906576bc,x_QPTheoryMt).
xc_source_file(a65b15906576bc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576bc,279).
xc_kb_names(a65b15906576bc,[]).
xc_mapping_rows(a65b15906576bc,[]).
x_arg1Isa(x_mfTypeConsequence,x_ModelFragmentType) :- x_cid(a65b15906576bd).
xc_microtheory(a65b15906576bd,x_QPTheoryMt).
xc_source_file(a65b15906576bd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576bd,280).
xc_kb_names(a65b15906576bd,[]).
xc_mapping_rows(a65b15906576bd,[]).
x_arg2Isa(x_mfTypeConsequence,'x_CycLSentence-Assertible') :- x_cid(a65b15906576be).
xc_microtheory(a65b15906576be,x_QPTheoryMt).
xc_source_file(a65b15906576be,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576be,281).
xc_kb_names(a65b15906576be,[]).
xc_mapping_rows(a65b15906576be,[]).
x_comment(x_mfTypeConsequence,"(mfTypeConsequence ?mft ?s) indicates that the non-ground statement ?s is one of the\nconsequences of instances of model fragment type ?mft being active.") :- x_cid(a65b15906576bf).
xc_microtheory(a65b15906576bf,x_QPTheoryMt).
xc_source_file(a65b15906576bf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576bf,282).
xc_kb_names(a65b15906576bf,[]).
xc_mapping_rows(a65b15906576bf,[]).
x_isa(x_mfTypeBiconditionalConsequence,x_Predicate) :- x_cid(a65b15906576c0).
xc_microtheory(a65b15906576c0,x_QPTheoryMt).
xc_source_file(a65b15906576c0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576c0,286).
xc_kb_names(a65b15906576c0,[]).
xc_mapping_rows(a65b15906576c0,[]).
x_arity(x_mfTypeBiconditionalConsequence,2) :- x_cid(a65b15906576c1).
xc_microtheory(a65b15906576c1,x_QPTheoryMt).
xc_source_file(a65b15906576c1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576c1,287).
xc_kb_names(a65b15906576c1,[]).
xc_mapping_rows(a65b15906576c1,[]).
x_arg1Isa(x_mfTypeBiconditionalConsequence,x_ModelFragmentType) :- x_cid(a65b15906576c2).
xc_microtheory(a65b15906576c2,x_QPTheoryMt).
xc_source_file(a65b15906576c2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576c2,288).
xc_kb_names(a65b15906576c2,[]).
xc_mapping_rows(a65b15906576c2,[]).
x_arg2Isa(x_mfTypeBiconditionalConsequence,'x_CycLSentence-Assertible') :- x_cid(a65b15906576c3).
xc_microtheory(a65b15906576c3,x_QPTheoryMt).
xc_source_file(a65b15906576c3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576c3,289).
xc_kb_names(a65b15906576c3,[]).
xc_mapping_rows(a65b15906576c3,[]).
x_comment(x_mfTypeBiconditionalConsequence,"(mfTypeBiconditionalConsequence ?mft ?s) indicates that, for every instance I of \nmodel fragment type ?mft, (substitute I ?self ?s) holds iff I is active, i.e., (activeMF I) is true.") :- x_cid(a65b15906576c4).
xc_microtheory(a65b15906576c4,x_QPTheoryMt).
xc_source_file(a65b15906576c4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576c4,290).
xc_kb_names(a65b15906576c4,[]).
xc_mapping_rows(a65b15906576c4,[]).
x_isa(x_MFParticipantSlot,x_Collection) :- x_cid(a65b15906576c5).
xc_microtheory(a65b15906576c5,x_QPTheoryMt).
xc_source_file(a65b15906576c5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576c5,294).
xc_kb_names(a65b15906576c5,[]).
xc_mapping_rows(a65b15906576c5,[]).
x_comment(x_MFParticipantSlot,"Instances of MFParticipantSlot are essentially role relations for model fragment\ninstances.  They are all specPreds of mfParticipant.") :- x_cid(a65b15906576c6).
xc_microtheory(a65b15906576c6,x_QPTheoryMt).
xc_source_file(a65b15906576c6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576c6,296).
xc_kb_names(a65b15906576c6,[]).
xc_mapping_rows(a65b15906576c6,[]).
x_isa(x_mfTypeParticipant,x_Predicate) :- x_cid(a65b15906576c7).
xc_microtheory(a65b15906576c7,x_QPTheoryMt).
xc_source_file(a65b15906576c7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576c7,300).
xc_kb_names(a65b15906576c7,[]).
xc_mapping_rows(a65b15906576c7,[]).
x_arity(x_mfTypeParticipant,4) :- x_cid(a65b15906576c8).
xc_microtheory(a65b15906576c8,x_QPTheoryMt).
xc_source_file(a65b15906576c8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576c8,301).
xc_kb_names(a65b15906576c8,[]).
xc_mapping_rows(a65b15906576c8,[]).
x_arg1Isa(x_mfTypeParticipant,x_ModelFragmentType) :- x_cid(a65b15906576c9).
xc_microtheory(a65b15906576c9,x_QPTheoryMt).
xc_source_file(a65b15906576c9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576c9,302).
xc_kb_names(a65b15906576c9,[]).
xc_mapping_rows(a65b15906576c9,[]).
x_arg2Isa(x_mfTypeParticipant,x_CycLVariable) :- x_cid(a65b15906576ca).
xc_microtheory(a65b15906576ca,x_QPTheoryMt).
xc_source_file(a65b15906576ca,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576ca,303).
xc_kb_names(a65b15906576ca,[]).
xc_mapping_rows(a65b15906576ca,[]).
x_arg3Isa(x_mfTypeParticipant,x_Collection) :- x_cid(a65b15906576cb).
xc_microtheory(a65b15906576cb,x_QPTheoryMt).
xc_source_file(a65b15906576cb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576cb,304).
xc_kb_names(a65b15906576cb,[]).
xc_mapping_rows(a65b15906576cb,[]).
x_arg4Isa(x_mfTypeParticipant,x_QPParticipantSlot) :- x_cid(a65b15906576cc).
xc_microtheory(a65b15906576cc,x_QPTheoryMt).
xc_source_file(a65b15906576cc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576cc,305).
xc_kb_names(a65b15906576cc,[]).
xc_mapping_rows(a65b15906576cc,[]).
x_comment(x_mfTypeParticipant,"(mfTypeParticipant ?mft ?v ?col ?rel) indicates that model fragments of type ?mft have as\none of their participants an instance of ?col, and that the relationship ?rel is used\nto indicate the particular role that bindings of ?v have in instances of ?mft.") :- x_cid(a65b15906576cd).
xc_microtheory(a65b15906576cd,x_QPTheoryMt).
xc_source_file(a65b15906576cd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576cd,306).
xc_kb_names(a65b15906576cd,[]).
xc_mapping_rows(a65b15906576cd,[]).
x_isa(x_mfTypeParticipantConstraint,x_BinaryPredicate) :- x_cid(a65b15906576ce).
xc_microtheory(a65b15906576ce,x_QPTheoryMt).
xc_source_file(a65b15906576ce,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576ce,311).
xc_kb_names(a65b15906576ce,[]).
xc_mapping_rows(a65b15906576ce,[]).
x_arity(x_mfTypeParticipantConstraint,2) :- x_cid(a65b15906576cf).
xc_microtheory(a65b15906576cf,x_QPTheoryMt).
xc_source_file(a65b15906576cf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576cf,312).
xc_kb_names(a65b15906576cf,[]).
xc_mapping_rows(a65b15906576cf,[]).
x_arg1Isa(x_mfTypeParticipantConstraint,x_ModelFragmentType) :- x_cid(a65b15906576d0).
xc_microtheory(a65b15906576d0,x_QPTheoryMt).
xc_source_file(a65b15906576d0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576d0,313).
xc_kb_names(a65b15906576d0,[]).
xc_mapping_rows(a65b15906576d0,[]).
x_arg2Isa(x_mfTypeParticipantConstraint,'x_CycLSentence-Assertible') :- x_cid(a65b15906576d1).
xc_microtheory(a65b15906576d1,x_QPTheoryMt).
xc_source_file(a65b15906576d1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576d1,314).
xc_kb_names(a65b15906576d1,[]).
xc_mapping_rows(a65b15906576d1,[]).
x_comment(x_mfTypeParticipantConstraint,"(mfTypeParticipantConstraint ?mft ?c) indicates that ?c is one of the constraints must\nhold when instantiating a model fragment of type ?mft.") :- x_cid(a65b15906576d2).
xc_microtheory(a65b15906576d2,x_QPTheoryMt).
xc_source_file(a65b15906576d2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576d2,315).
xc_kb_names(a65b15906576d2,[]).
xc_mapping_rows(a65b15906576d2,[]).
x_isa(x_mfTypeParticipants,x_BinaryPredicate) :- x_cid(a65b15906576d3).
xc_microtheory(a65b15906576d3,x_QPTheoryMt).
xc_source_file(a65b15906576d3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576d3,319).
xc_kb_names(a65b15906576d3,[]).
xc_mapping_rows(a65b15906576d3,[]).
x_arity(x_mfTypeParticipants,2) :- x_cid(a65b15906576d4).
xc_microtheory(a65b15906576d4,x_QPTheoryMt).
xc_source_file(a65b15906576d4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576d4,320).
xc_kb_names(a65b15906576d4,[]).
xc_mapping_rows(a65b15906576d4,[]).
x_arg1Isa(x_mfTypeParticipants,x_ModelFragmentType) :- x_cid(a65b15906576d5).
xc_microtheory(a65b15906576d5,x_QPTheoryMt).
xc_source_file(a65b15906576d5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576d5,321).
xc_kb_names(a65b15906576d5,[]).
xc_mapping_rows(a65b15906576d5,[]).
x_arg2Isa(x_mfTypeParticipants,'x_Set-Mathematical') :- x_cid(a65b15906576d6).
xc_microtheory(a65b15906576d6,x_QPTheoryMt).
xc_source_file(a65b15906576d6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576d6,322).
xc_kb_names(a65b15906576d6,[]).
xc_mapping_rows(a65b15906576d6,[]).
x_comment(x_mfTypeParticipants,"(mfTypeParticipants ?mft ?set) indicates that the set of variables used to represent\nparticipants in model fragments of type ?mft is ?set.  This statement is computed from the\nindividual mfTypeParticipant statements.") :- x_cid(a65b15906576d7).
xc_microtheory(a65b15906576d7,x_QPTheoryMt).
xc_source_file(a65b15906576d7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576d7,323).
xc_kb_names(a65b15906576d7,[]).
xc_mapping_rows(a65b15906576d7,[]).
x_isa(x_mfiParticipantOf,x_Predicate) :- x_cid(a65b15906576d8).
xc_microtheory(a65b15906576d8,x_QPTheoryMt).
xc_source_file(a65b15906576d8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576d8,336).
xc_kb_names(a65b15906576d8,[]).
xc_mapping_rows(a65b15906576d8,[]).
x_arity(x_mfiParticipantOf,3) :- x_cid(a65b15906576d9).
xc_microtheory(a65b15906576d9,x_QPTheoryMt).
xc_source_file(a65b15906576d9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576d9,337).
xc_kb_names(a65b15906576d9,[]).
xc_mapping_rows(a65b15906576d9,[]).
x_arg1Isa(x_mfiParticipantOf,x_ModelFragment) :- x_cid(a65b15906576da).
xc_microtheory(a65b15906576da,x_QPTheoryMt).
xc_source_file(a65b15906576da,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576da,338).
xc_kb_names(a65b15906576da,[]).
xc_mapping_rows(a65b15906576da,[]).
x_arg2Isa(x_mfiParticipantOf,x_CycLTerm) :- x_cid(a65b15906576db).
xc_microtheory(a65b15906576db,x_QPTheoryMt).
xc_source_file(a65b15906576db,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576db,339).
xc_kb_names(a65b15906576db,[]).
xc_mapping_rows(a65b15906576db,[]).
x_arg3Isa(x_mfiParticipantOf,x_QPParticipantSlot) :- x_cid(a65b15906576dc).
xc_microtheory(a65b15906576dc,x_QPTheoryMt).
xc_source_file(a65b15906576dc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576dc,340).
xc_kb_names(a65b15906576dc,[]).
xc_mapping_rows(a65b15906576dc,[]).
x_comment(x_mfiParticipantOf,"(mfiParticipantOf ?mfi ?t ?slot) indicates that when model fragment instance ?mfi uses entity term ?t as slot ?slot.") :- x_cid(a65b15906576dd).
xc_microtheory(a65b15906576dd,x_QPTheoryMt).
xc_source_file(a65b15906576dd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576dd,341).
xc_kb_names(a65b15906576dd,[]).
xc_mapping_rows(a65b15906576dd,[]).
x_isa(x_mfiConsequenceOf,x_BinaryPredicate) :- x_cid(a65b15906576de).
xc_microtheory(a65b15906576de,x_QPTheoryMt).
xc_source_file(a65b15906576de,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576de,344).
xc_kb_names(a65b15906576de,[]).
xc_mapping_rows(a65b15906576de,[]).
x_arity(x_mfiConsequenceOf,2) :- x_cid(a65b15906576df).
xc_microtheory(a65b15906576df,x_QPTheoryMt).
xc_source_file(a65b15906576df,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576df,345).
xc_kb_names(a65b15906576df,[]).
xc_mapping_rows(a65b15906576df,[]).
x_arg1Isa(x_mfiConsequenceOf,x_ModelFragment) :- x_cid(a65b15906576e0).
xc_microtheory(a65b15906576e0,x_QPTheoryMt).
xc_source_file(a65b15906576e0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576e0,346).
xc_kb_names(a65b15906576e0,[]).
xc_mapping_rows(a65b15906576e0,[]).
x_arg2Isa(x_mfiConsequenceOf,x_CycLAssertion) :- x_cid(a65b15906576e1).
xc_microtheory(a65b15906576e1,x_QPTheoryMt).
xc_source_file(a65b15906576e1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576e1,347).
xc_kb_names(a65b15906576e1,[]).
xc_mapping_rows(a65b15906576e1,[]).
x_comment(x_mfiConsequenceOf,"(mfiConsequenceOf ?mfi ?c) indicates that when model fragment instance ?mfi is active, ?c holds.") :- x_cid(a65b15906576e2).
xc_microtheory(a65b15906576e2,x_QPTheoryMt).
xc_source_file(a65b15906576e2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576e2,348).
xc_kb_names(a65b15906576e2,[]).
xc_mapping_rows(a65b15906576e2,[]).
x_isa(x_mfiReverseConsequenceOf,x_BinaryPredicate) :- x_cid(a65b15906576e3).
xc_microtheory(a65b15906576e3,x_QPTheoryMt).
xc_source_file(a65b15906576e3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576e3,351).
xc_kb_names(a65b15906576e3,[]).
xc_mapping_rows(a65b15906576e3,[]).
x_arity(x_mfiReverseConsequenceOf,2) :- x_cid(a65b15906576e4).
xc_microtheory(a65b15906576e4,x_QPTheoryMt).
xc_source_file(a65b15906576e4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576e4,352).
xc_kb_names(a65b15906576e4,[]).
xc_mapping_rows(a65b15906576e4,[]).
x_arg1Isa(x_mfiReverseConsequenceOf,x_ModelFragment) :- x_cid(a65b15906576e5).
xc_microtheory(a65b15906576e5,x_QPTheoryMt).
xc_source_file(a65b15906576e5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576e5,353).
xc_kb_names(a65b15906576e5,[]).
xc_mapping_rows(a65b15906576e5,[]).
x_arg2Isa(x_mfiReverseConsequenceOf,x_CycLAssertion) :- x_cid(a65b15906576e6).
xc_microtheory(a65b15906576e6,x_QPTheoryMt).
xc_source_file(a65b15906576e6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576e6,354).
xc_kb_names(a65b15906576e6,[]).
xc_mapping_rows(a65b15906576e6,[]).
x_comment(x_mfiReverseConsequenceOf,"(mfiReverseConsequenceOf ?mfi ?c) indicates that when ?c holds, ?mfi is active.\nThis is instantiated as the other half of the implication of an mfTypeBiconditionalConsequence,\nas an optimization for model formulation algorithms.") :- x_cid(a65b15906576e7).
xc_microtheory(a65b15906576e7,x_QPTheoryMt).
xc_source_file(a65b15906576e7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576e7,355).
xc_kb_names(a65b15906576e7,[]).
xc_mapping_rows(a65b15906576e7,[]).
x_isa(x_mfiConditionOf,x_BinaryPredicate) :- x_cid(a65b15906576e8).
xc_microtheory(a65b15906576e8,x_QPTheoryMt).
xc_source_file(a65b15906576e8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576e8,360).
xc_kb_names(a65b15906576e8,[]).
xc_mapping_rows(a65b15906576e8,[]).
x_arity(x_mfiConditionOf,2) :- x_cid(a65b15906576e9).
xc_microtheory(a65b15906576e9,x_QPTheoryMt).
xc_source_file(a65b15906576e9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576e9,361).
xc_kb_names(a65b15906576e9,[]).
xc_mapping_rows(a65b15906576e9,[]).
x_arg1Isa(x_mfiConditionOf,x_ModelFragment) :- x_cid(a65b15906576ea).
xc_microtheory(a65b15906576ea,x_QPTheoryMt).
xc_source_file(a65b15906576ea,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576ea,362).
xc_kb_names(a65b15906576ea,[]).
xc_mapping_rows(a65b15906576ea,[]).
x_arg2Isa(x_mfiConditionOf,x_CycLAssertion) :- x_cid(a65b15906576eb).
xc_microtheory(a65b15906576eb,x_QPTheoryMt).
xc_source_file(a65b15906576eb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576eb,363).
xc_kb_names(a65b15906576eb,[]).
xc_mapping_rows(a65b15906576eb,[]).
x_comment(x_mfiConditionOf,"(mfiConditionOf ?mfi ?c) indicates that ?c is a condition for model fragment instance ?mfi to be active.\nThese statements are combined conjunctively during model formulation to compute the appropriate full condition.") :- x_cid(a65b15906576ec).
xc_microtheory(a65b15906576ec,x_QPTheoryMt).
xc_source_file(a65b15906576ec,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576ec,364).
xc_kb_names(a65b15906576ec,[]).
xc_mapping_rows(a65b15906576ec,[]).
x_isa(x_mfiType,x_BinaryPredicate) :- x_cid(a65b15906576ed).
xc_microtheory(a65b15906576ed,x_QPTheoryMt).
xc_source_file(a65b15906576ed,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576ed,368).
xc_kb_names(a65b15906576ed,[]).
xc_mapping_rows(a65b15906576ed,[]).
x_arity(x_mfiType,2) :- x_cid(a65b15906576ee).
xc_microtheory(a65b15906576ee,x_QPTheoryMt).
xc_source_file(a65b15906576ee,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576ee,369).
xc_kb_names(a65b15906576ee,[]).
xc_mapping_rows(a65b15906576ee,[]).
x_arg1Isa(x_mfiType,x_ModelFragment) :- x_cid(a65b15906576ef).
xc_microtheory(a65b15906576ef,x_QPTheoryMt).
xc_source_file(a65b15906576ef,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576ef,370).
xc_kb_names(a65b15906576ef,[]).
xc_mapping_rows(a65b15906576ef,[]).
x_arg2Isa(x_mfiType,x_ModelFragmentType) :- x_cid(a65b15906576f0).
xc_microtheory(a65b15906576f0,x_QPTheoryMt).
xc_source_file(a65b15906576f0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576f0,371).
xc_kb_names(a65b15906576f0,[]).
xc_mapping_rows(a65b15906576f0,[]).
x_comment(x_mfiType,"(mfiType ?mfi ?type) indicates that ?mfi was instantiated with type ?type.") :- x_cid(a65b15906576f1).
xc_microtheory(a65b15906576f1,x_QPTheoryMt).
xc_source_file(a65b15906576f1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576f1,372).
xc_kb_names(a65b15906576f1,[]).
xc_mapping_rows(a65b15906576f1,[]).
x_isa(x_mfiAntecedents,x_BinaryPredicate) :- x_cid(a65b15906576f2).
xc_microtheory(a65b15906576f2,x_QPTheoryMt).
xc_source_file(a65b15906576f2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576f2,375).
xc_kb_names(a65b15906576f2,[]).
xc_mapping_rows(a65b15906576f2,[]).
x_arity(x_mfiAntecedents,2) :- x_cid(a65b15906576f3).
xc_microtheory(a65b15906576f3,x_QPTheoryMt).
xc_source_file(a65b15906576f3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576f3,376).
xc_kb_names(a65b15906576f3,[]).
xc_mapping_rows(a65b15906576f3,[]).
x_arg1Isa(x_mfiAntecedents,x_ModelFragment) :- x_cid(a65b15906576f4).
xc_microtheory(a65b15906576f4,x_QPTheoryMt).
xc_source_file(a65b15906576f4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576f4,377).
xc_kb_names(a65b15906576f4,[]).
xc_mapping_rows(a65b15906576f4,[]).
x_arg2Isa(x_mfiAntecedents,'x_Set-Extensional') :- x_cid(a65b15906576f5).
xc_microtheory(a65b15906576f5,x_QPTheoryMt).
xc_source_file(a65b15906576f5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576f5,378).
xc_kb_names(a65b15906576f5,[]).
xc_mapping_rows(a65b15906576f5,[]).
x_comment(x_mfiAntecedents,"(mfiAntecedents ?mfi ?set) indicates that ?mfi was instantiated based on the\n set of assertions ?set.") :- x_cid(a65b15906576f6).
xc_microtheory(a65b15906576f6,x_QPTheoryMt).
xc_source_file(a65b15906576f6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576f6,379).
xc_kb_names(a65b15906576f6,[]).
xc_mapping_rows(a65b15906576f6,[]).
x_isa(x_mfiBindings,x_BinaryPredicate) :- x_cid(a65b15906576f7).
xc_microtheory(a65b15906576f7,x_QPTheoryMt).
xc_source_file(a65b15906576f7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576f7,383).
xc_kb_names(a65b15906576f7,[]).
xc_mapping_rows(a65b15906576f7,[]).
x_arity(x_mfiBindings,2) :- x_cid(a65b15906576f8).
xc_microtheory(a65b15906576f8,x_QPTheoryMt).
xc_source_file(a65b15906576f8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576f8,384).
xc_kb_names(a65b15906576f8,[]).
xc_mapping_rows(a65b15906576f8,[]).
x_arg1Isa(x_mfiBindings,x_ModelFragment) :- x_cid(a65b15906576f9).
xc_microtheory(a65b15906576f9,x_QPTheoryMt).
xc_source_file(a65b15906576f9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576f9,385).
xc_kb_names(a65b15906576f9,[]).
xc_mapping_rows(a65b15906576f9,[]).
x_arg2Isa(x_mfiBindings,'x_Set-Extensional') :- x_cid(a65b15906576fa).
xc_microtheory(a65b15906576fa,x_QPTheoryMt).
xc_source_file(a65b15906576fa,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576fa,386).
xc_kb_names(a65b15906576fa,[]).
xc_mapping_rows(a65b15906576fa,[]).
x_comment(x_mfiBindings,"(mfiBindings ?mfi ?set) indicates that the bindings used to instantiate ?mfi were ?set.") :- x_cid(a65b15906576fb).
xc_microtheory(a65b15906576fb,x_QPTheoryMt).
xc_source_file(a65b15906576fb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576fb,387).
xc_kb_names(a65b15906576fb,[]).
xc_mapping_rows(a65b15906576fb,[]).
x_isa(x_qpUniversalFact,x_UnaryPredicate) :- x_cid(a65b15906576fc).
xc_microtheory(a65b15906576fc,x_QPTheoryMt).
xc_source_file(a65b15906576fc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576fc,403).
xc_kb_names(a65b15906576fc,[]).
xc_mapping_rows(a65b15906576fc,[]).
x_arity(x_qpUniversalFact,1) :- x_cid(a65b15906576fd).
xc_microtheory(a65b15906576fd,x_QPTheoryMt).
xc_source_file(a65b15906576fd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576fd,404).
xc_kb_names(a65b15906576fd,[]).
xc_mapping_rows(a65b15906576fd,[]).
x_arg1Isa(x_qpUniversalFact,'x_CycLExpression-Assertible') :- x_cid(a65b15906576fe).
xc_microtheory(a65b15906576fe,x_QPTheoryMt).
xc_source_file(a65b15906576fe,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576fe,405).
xc_kb_names(a65b15906576fe,[]).
xc_mapping_rows(a65b15906576fe,[]).
x_comment(x_qpUniversalFact,"The relationship (qpUniversalFact ?f) holds iff ?f is assumed to hold without change\n over an entire analysis, independent of qualitative state.\n  For example, (qpUniversalFact (isa F Container)).") :- x_cid(a65b15906576ff).
xc_microtheory(a65b15906576ff,x_QPTheoryMt).
xc_source_file(a65b15906576ff,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906576ff,406).
xc_kb_names(a65b15906576ff,[]).
xc_mapping_rows(a65b15906576ff,[]).
x_isa(x_DomainTheoryMicrotheory,x_Collection) :- x_cid(a65b1590657700).
xc_microtheory(a65b1590657700,x_QPTheoryMt).
xc_source_file(a65b1590657700,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657700,411).
xc_kb_names(a65b1590657700,[]).
xc_mapping_rows(a65b1590657700,[]).
x_genls(x_DomainTheoryMicrotheory,x_Microtheory) :- x_cid(a65b1590657701).
xc_microtheory(a65b1590657701,x_QPTheoryMt).
xc_source_file(a65b1590657701,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657701,412).
xc_kb_names(a65b1590657701,[]).
xc_mapping_rows(a65b1590657701,[]).
x_comment(x_DomainTheoryMicrotheory,"A DomainTheoryMicrotheory is a microtheory that contains a domain theory.  An analysis might\n rely on several domain theories, to support compositionality.") :- x_cid(a65b1590657702).
xc_microtheory(a65b1590657702,x_QPTheoryMt).
xc_source_file(a65b1590657702,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657702,413).
xc_kb_names(a65b1590657702,[]).
xc_mapping_rows(a65b1590657702,[]).
x_isa(x_ScenarioModelMicrotheory,x_Collection) :- x_cid(a65b1590657703).
xc_microtheory(a65b1590657703,x_QPTheoryMt).
xc_source_file(a65b1590657703,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657703,417).
xc_kb_names(a65b1590657703,[]).
xc_mapping_rows(a65b1590657703,[]).
x_genls(x_ScenarioModelMicrotheory,x_Microtheory) :- x_cid(a65b1590657704).
xc_microtheory(a65b1590657704,x_QPTheoryMt).
xc_source_file(a65b1590657704,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657704,418).
xc_kb_names(a65b1590657704,[]).
xc_mapping_rows(a65b1590657704,[]).
x_comment(x_ScenarioModelMicrotheory,"A ScenarioModelMicrotheory is a microtheory that holds the scenario model constructed for \n a QP analysis.") :- x_cid(a65b1590657705).
xc_microtheory(a65b1590657705,x_QPTheoryMt).
xc_source_file(a65b1590657705,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657705,419).
xc_kb_names(a65b1590657705,[]).
xc_mapping_rows(a65b1590657705,[]).
x_isa(x_domainTheoryOf,x_BinaryPredicate) :- x_cid(a65b1590657706).
xc_microtheory(a65b1590657706,x_QPTheoryMt).
xc_source_file(a65b1590657706,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657706,423).
xc_kb_names(a65b1590657706,[]).
xc_mapping_rows(a65b1590657706,[]).
x_arity(x_domainTheoryOf,2) :- x_cid(a65b1590657707).
xc_microtheory(a65b1590657707,x_QPTheoryMt).
xc_source_file(a65b1590657707,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657707,424).
xc_kb_names(a65b1590657707,[]).
xc_mapping_rows(a65b1590657707,[]).
x_arg1Isa(x_domainTheoryOf,x_DomainTheoryMicrotheory) :- x_cid(a65b1590657708).
xc_microtheory(a65b1590657708,x_QPTheoryMt).
xc_source_file(a65b1590657708,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657708,425).
xc_kb_names(a65b1590657708,[]).
xc_mapping_rows(a65b1590657708,[]).
x_arg2Isa(x_domainTheoryOf,x_ScenarioModelMicrotheory) :- x_cid(a65b1590657709).
xc_microtheory(a65b1590657709,x_QPTheoryMt).
xc_source_file(a65b1590657709,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657709,426).
xc_kb_names(a65b1590657709,[]).
xc_mapping_rows(a65b1590657709,[]).
x_comment(x_domainTheoryOf,"(domainTheoryOf ?sm ?dt) indicates that scenario model ?sm was constructed using\n domain theory ?dt.  Often ?dt will be a spindle microtheory.  Being able to trace back\n what was used in building a scenario will be important for learning QP models.") :- x_cid(a65b159065770a).
xc_microtheory(a65b159065770a,x_QPTheoryMt).
xc_source_file(a65b159065770a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065770a,427).
xc_kb_names(a65b159065770a,[]).
xc_mapping_rows(a65b159065770a,[]).
x_isa(x_QPAnalysisMts,x_Collection) :- x_cid(a65b159065770b).
xc_microtheory(a65b159065770b,x_QPTheoryMt).
xc_source_file(a65b159065770b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065770b,441).
xc_kb_names(a65b159065770b,[]).
xc_mapping_rows(a65b159065770b,[]).
x_genls(x_QPAnalysisMts,x_Microtheory) :- x_cid(a65b159065770c).
xc_microtheory(a65b159065770c,x_QPTheoryMt).
xc_source_file(a65b159065770c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065770c,442).
xc_kb_names(a65b159065770c,[]).
xc_mapping_rows(a65b159065770c,[]).
x_comment(x_QPAnalysisMts,"An instance of QPAnalysisMts is a microtheory representing the background information\nand facts that hold throughout a qualitative analysis.  \nSpecMts of Mts of this type represent specific qualitative states.") :- x_cid(a65b159065770d).
xc_microtheory(a65b159065770d,x_QPTheoryMt).
xc_source_file(a65b159065770d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065770d,443).
xc_kb_names(a65b159065770d,[]).
xc_mapping_rows(a65b159065770d,[]).
x_isa(x_QPState,x_Collection) :- x_cid(a65b159065770e).
xc_microtheory(a65b159065770e,x_QPTheoryMt).
xc_source_file(a65b159065770e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065770e,452).
xc_kb_names(a65b159065770e,[]).
xc_mapping_rows(a65b159065770e,[]).
x_genls(x_QPState,x_Microtheory) :- x_cid(a65b159065770f).
xc_microtheory(a65b159065770f,x_QPTheoryMt).
xc_source_file(a65b159065770f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065770f,453).
xc_kb_names(a65b159065770f,[]).
xc_mapping_rows(a65b159065770f,[]).
x_comment(x_QPState,"An instance of QPState is a qualitative state, part of some analysis. \n These can be partial, with multiple elaborations to form complete states.") :- x_cid(a65b1590657710).
xc_microtheory(a65b1590657710,x_QPTheoryMt).
xc_source_file(a65b1590657710,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657710,454).
xc_kb_names(a65b1590657710,[]).
xc_mapping_rows(a65b1590657710,[]).
x_isa(x_scenarioModelOf,x_BinaryPredicate) :- x_cid(a65b1590657711).
xc_microtheory(a65b1590657711,x_QPTheoryMt).
xc_source_file(a65b1590657711,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657711,458).
xc_kb_names(a65b1590657711,[]).
xc_mapping_rows(a65b1590657711,[]).
x_arity(x_scenarioModelOf,2) :- x_cid(a65b1590657712).
xc_microtheory(a65b1590657712,x_QPTheoryMt).
xc_source_file(a65b1590657712,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657712,459).
xc_kb_names(a65b1590657712,[]).
xc_mapping_rows(a65b1590657712,[]).
x_arg1Isa(x_scenarioModelOf,x_QPState) :- x_cid(a65b1590657713).
xc_microtheory(a65b1590657713,x_QPTheoryMt).
xc_source_file(a65b1590657713,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657713,460).
xc_kb_names(a65b1590657713,[]).
xc_mapping_rows(a65b1590657713,[]).
x_arg2Isa(x_scenarioModelOf,x_ScenarioModelMicrotheory) :- x_cid(a65b1590657714).
xc_microtheory(a65b1590657714,x_QPTheoryMt).
xc_source_file(a65b1590657714,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657714,461).
xc_kb_names(a65b1590657714,[]).
xc_mapping_rows(a65b1590657714,[]).
x_comment(x_scenarioModelOf,"(scenarioModelOf ?state ?sm) indicates that state ?state is based on scenario model ?sm.") :- x_cid(a65b1590657715).
xc_microtheory(a65b1590657715,x_QPTheoryMt).
xc_source_file(a65b1590657715,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657715,462).
xc_kb_names(a65b1590657715,[]).
xc_mapping_rows(a65b1590657715,[]).
x_isa(x_FluentOrdinalPredicate,x_Collection) :- x_cid(a65b1590657716).
xc_microtheory(a65b1590657716,x_QPTheoryMt).
xc_source_file(a65b1590657716,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657716,473).
xc_kb_names(a65b1590657716,[]).
xc_mapping_rows(a65b1590657716,[]).
x_genls(x_FluentOrdinalPredicate,x_BinaryPredicate) :- x_cid(a65b1590657717).
xc_microtheory(a65b1590657717,x_QPTheoryMt).
xc_source_file(a65b1590657717,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657717,474).
xc_kb_names(a65b1590657717,[]).
xc_mapping_rows(a65b1590657717,[]).
x_comment(x_FluentOrdinalPredicate,"FluentOrdinalPredicate is the collection of ordinal relationships that can be\n applied to fluents for reasoning about relative magnitudes and transitivity.\n This distinction is useful in predicates used for implementing qualitative reasoning") :- x_cid(a65b1590657718).
xc_microtheory(a65b1590657718,x_QPTheoryMt).
xc_source_file(a65b1590657718,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657718,475).
xc_kb_names(a65b1590657718,[]).
xc_mapping_rows(a65b1590657718,[]).
x_isa(x_qGreaterThan,x_FluentOrdinalPredicate) :- x_cid(a65b1590657719).
xc_microtheory(a65b1590657719,x_QPTheoryMt).
xc_source_file(a65b1590657719,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657719,485).
xc_kb_names(a65b1590657719,[]).
xc_mapping_rows(a65b1590657719,[]).
x_isa(x_qGreaterThan,x_AntiSymmetricBinaryPredicate) :- x_cid(a65b159065771a).
xc_microtheory(a65b159065771a,x_QPTheoryMt).
xc_source_file(a65b159065771a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065771a,486).
xc_kb_names(a65b159065771a,[]).
xc_mapping_rows(a65b159065771a,[]).
x_arg1Isa(x_qGreaterThan,x_Thing) :- x_cid(a65b159065771b).
xc_microtheory(a65b159065771b,x_QPTheoryMt).
xc_source_file(a65b159065771b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065771b,487).
xc_kb_names(a65b159065771b,[]).
xc_mapping_rows(a65b159065771b,[]).
x_arg2Isa(x_qGreaterThan,x_Thing) :- x_cid(a65b159065771c).
xc_microtheory(a65b159065771c,x_QPTheoryMt).
xc_source_file(a65b159065771c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065771c,488).
xc_kb_names(a65b159065771c,[]).
xc_mapping_rows(a65b159065771c,[]).
x_comment(x_qGreaterThan,"(qGreaterThan ?q1 ?q2) means that the value of ?q1 is greater than the value of ?q2.") :- x_cid(a65b159065771d).
xc_microtheory(a65b159065771d,x_QPTheoryMt).
xc_source_file(a65b159065771d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065771d,489).
xc_kb_names(a65b159065771d,[]).
xc_mapping_rows(a65b159065771d,[]).
x_isa(x_qLessThan,x_FluentOrdinalPredicate) :- x_cid(a65b159065771e).
xc_microtheory(a65b159065771e,x_QPTheoryMt).
xc_source_file(a65b159065771e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065771e,492).
xc_kb_names(a65b159065771e,[]).
xc_mapping_rows(a65b159065771e,[]).
x_isa(x_qLessThan,x_AntiSymmetricBinaryPredicate) :- x_cid(a65b159065771f).
xc_microtheory(a65b159065771f,x_QPTheoryMt).
xc_source_file(a65b159065771f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065771f,493).
xc_kb_names(a65b159065771f,[]).
xc_mapping_rows(a65b159065771f,[]).
x_arg1Isa(x_qLessThan,x_Thing) :- x_cid(a65b1590657720).
xc_microtheory(a65b1590657720,x_QPTheoryMt).
xc_source_file(a65b1590657720,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657720,494).
xc_kb_names(a65b1590657720,[]).
xc_mapping_rows(a65b1590657720,[]).
x_arg2Isa(x_qLessThan,x_Thing) :- x_cid(a65b1590657721).
xc_microtheory(a65b1590657721,x_QPTheoryMt).
xc_source_file(a65b1590657721,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657721,495).
xc_kb_names(a65b1590657721,[]).
xc_mapping_rows(a65b1590657721,[]).
x_comment(x_qLessThan,"(qLessThan ?q1 ?q2) means that the value of ?q1 is less than the value of ?q2.") :- x_cid(a65b1590657722).
xc_microtheory(a65b1590657722,x_QPTheoryMt).
xc_source_file(a65b1590657722,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657722,496).
xc_kb_names(a65b1590657722,[]).
xc_mapping_rows(a65b1590657722,[]).
x_isa(x_qEqualTo,x_FluentOrdinalPredicate) :- x_cid(a65b1590657723).
xc_microtheory(a65b1590657723,x_QPTheoryMt).
xc_source_file(a65b1590657723,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657723,499).
xc_kb_names(a65b1590657723,[]).
xc_mapping_rows(a65b1590657723,[]).
x_isa(x_qEqualTo,x_ReflexiveBinaryPredicate) :- x_cid(a65b1590657724).
xc_microtheory(a65b1590657724,x_QPTheoryMt).
xc_source_file(a65b1590657724,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657724,500).
xc_kb_names(a65b1590657724,[]).
xc_mapping_rows(a65b1590657724,[]).
x_isa(x_qEqualTo,x_SymmetricBinaryPredicate) :- x_cid(a65b1590657725).
xc_microtheory(a65b1590657725,x_QPTheoryMt).
xc_source_file(a65b1590657725,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657725,501).
xc_kb_names(a65b1590657725,[]).
xc_mapping_rows(a65b1590657725,[]).
x_arg1Isa(x_qEqualTo,x_Thing) :- x_cid(a65b1590657726).
xc_microtheory(a65b1590657726,x_QPTheoryMt).
xc_source_file(a65b1590657726,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657726,502).
xc_kb_names(a65b1590657726,[]).
xc_mapping_rows(a65b1590657726,[]).
x_arg2Isa(x_qEqualTo,x_Thing) :- x_cid(a65b1590657727).
xc_microtheory(a65b1590657727,x_QPTheoryMt).
xc_source_file(a65b1590657727,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657727,503).
xc_kb_names(a65b1590657727,[]).
xc_mapping_rows(a65b1590657727,[]).
x_comment(x_qEqualTo,"(qEqualTo ?q1 ?q2) means that the value of ?q1 is equal to the value of ?q2.") :- x_cid(a65b1590657728).
xc_microtheory(a65b1590657728,x_QPTheoryMt).
xc_source_file(a65b1590657728,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657728,504).
xc_kb_names(a65b1590657728,[]).
xc_mapping_rows(a65b1590657728,[]).
x_isa(x_qLessThanOrEqualTo,x_FluentOrdinalPredicate) :- x_cid(a65b1590657729).
xc_microtheory(a65b1590657729,x_QPTheoryMt).
xc_source_file(a65b1590657729,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657729,507).
xc_kb_names(a65b1590657729,[]).
xc_mapping_rows(a65b1590657729,[]).
x_isa(x_qLessThanOrEqualTo,x_AntiSymmetricBinaryPredicate) :- x_cid(a65b159065772a).
xc_microtheory(a65b159065772a,x_QPTheoryMt).
xc_source_file(a65b159065772a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065772a,508).
xc_kb_names(a65b159065772a,[]).
xc_mapping_rows(a65b159065772a,[]).
x_arg1Isa(x_qLessThanOrEqualTo,x_Thing) :- x_cid(a65b159065772b).
xc_microtheory(a65b159065772b,x_QPTheoryMt).
xc_source_file(a65b159065772b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065772b,509).
xc_kb_names(a65b159065772b,[]).
xc_mapping_rows(a65b159065772b,[]).
x_arg2Isa(x_qLessThanOrEqualTo,x_Thing) :- x_cid(a65b159065772c).
xc_microtheory(a65b159065772c,x_QPTheoryMt).
xc_source_file(a65b159065772c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065772c,510).
xc_kb_names(a65b159065772c,[]).
xc_mapping_rows(a65b159065772c,[]).
x_comment(x_qLessThanOrEqualTo,"(qLessThanOrEqualTo ?q1 ?q2) means that the value of ?q1 is less than or equal to the value of ?q2.") :- x_cid(a65b159065772d).
xc_microtheory(a65b159065772d,x_QPTheoryMt).
xc_source_file(a65b159065772d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065772d,511).
xc_kb_names(a65b159065772d,[]).
xc_mapping_rows(a65b159065772d,[]).
x_isa(x_qGreaterThanOrEqualTo,x_FluentOrdinalPredicate) :- x_cid(a65b159065772e).
xc_microtheory(a65b159065772e,x_QPTheoryMt).
xc_source_file(a65b159065772e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065772e,514).
xc_kb_names(a65b159065772e,[]).
xc_mapping_rows(a65b159065772e,[]).
x_isa(x_qGreaterThanOrEqualTo,x_AntiSymmetricBinaryPredicate) :- x_cid(a65b159065772f).
xc_microtheory(a65b159065772f,x_QPTheoryMt).
xc_source_file(a65b159065772f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065772f,515).
xc_kb_names(a65b159065772f,[]).
xc_mapping_rows(a65b159065772f,[]).
x_arg1Isa(x_qGreaterThanOrEqualTo,x_Thing) :- x_cid(a65b1590657730).
xc_microtheory(a65b1590657730,x_QPTheoryMt).
xc_source_file(a65b1590657730,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657730,516).
xc_kb_names(a65b1590657730,[]).
xc_mapping_rows(a65b1590657730,[]).
x_arg2Isa(x_qGreaterThanOrEqualTo,x_Thing) :- x_cid(a65b1590657731).
xc_microtheory(a65b1590657731,x_QPTheoryMt).
xc_source_file(a65b1590657731,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657731,517).
xc_kb_names(a65b1590657731,[]).
xc_mapping_rows(a65b1590657731,[]).
x_comment(x_qGreaterThanOrEqualTo,"(qGreaterThanOrEqualTo ?q1 ?q2) means that the value of ?q1 is greater than or equal to the value of ?q2.") :- x_cid(a65b1590657732).
xc_microtheory(a65b1590657732,x_QPTheoryMt).
xc_source_file(a65b1590657732,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657732,518).
xc_kb_names(a65b1590657732,[]).
xc_mapping_rows(a65b1590657732,[]).
x_isa(x_qUnrelatedTo,x_FluentOrdinalPredicate) :- x_cid(a65b1590657733).
xc_microtheory(a65b1590657733,x_QPTheoryMt).
xc_source_file(a65b1590657733,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657733,521).
xc_kb_names(a65b1590657733,[]).
xc_mapping_rows(a65b1590657733,[]).
x_isa(x_qUnrelatedTo,x_SymmetricBinaryPredicate) :- x_cid(a65b1590657734).
xc_microtheory(a65b1590657734,x_QPTheoryMt).
xc_source_file(a65b1590657734,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657734,522).
xc_kb_names(a65b1590657734,[]).
xc_mapping_rows(a65b1590657734,[]).
x_arg1Isa(x_qUnrelatedTo,x_Thing) :- x_cid(a65b1590657735).
xc_microtheory(a65b1590657735,x_QPTheoryMt).
xc_source_file(a65b1590657735,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657735,523).
xc_kb_names(a65b1590657735,[]).
xc_mapping_rows(a65b1590657735,[]).
x_arg2Isa(x_qUnrelatedTo,x_Thing) :- x_cid(a65b1590657736).
xc_microtheory(a65b1590657736,x_QPTheoryMt).
xc_source_file(a65b1590657736,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657736,524).
xc_kb_names(a65b1590657736,[]).
xc_mapping_rows(a65b1590657736,[]).
x_comment(x_qUnrelatedTo,"(qUnrelatedTo ?q1 ?q2) means that no ordinal relation between ?q1 and ?q2 is appropriate, because either (or both)\n   of ?q1 or ?q2 does not exist. This is to prevent anomalies like conjecturing ordinals involving pressures of entities\n   that don't actually exist in a qualitative state.  It provides one of the mutually exclusive and collectively\n   exhaustive alternatives to qGreaterThan, qLessThan, and qEqualTo in dependency-directed searches involved in \n   constructing new qualitative states.") :- x_cid(a65b1590657737).
xc_microtheory(a65b1590657737,x_QPTheoryMt).
xc_source_file(a65b1590657737,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657737,525).
xc_kb_names(a65b1590657737,[]).
xc_mapping_rows(a65b1590657737,[]).
'x_<=='(x_qUnrelatedTo(V1,V2),x_not(x_hasQuantity(V3,V1))) :- x_cid(a65b1590657738,V1,V2,V3).
xc_microtheory(a65b1590657738,x_QPTheoryMt).
xc_source_file(a65b1590657738,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657738,536).
xc_kb_names(a65b1590657738,["?q1","?q2","?e"]).
xc_mapping_rows(a65b1590657738,[]).
'x_<=='(x_qUnrelatedTo(V1,V2),x_not(x_hasQuantity(V3,V1))) :- x_cid(a65b1590657739,V1,V2,V3).
xc_microtheory(a65b1590657739,x_QPTheoryMt).
xc_source_file(a65b1590657739,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657739,537).
xc_kb_names(a65b1590657739,["?q1","?q2","?e"]).
xc_mapping_rows(a65b1590657739,[]).
'x_<=='(x_not(x_qUnrelatedTo(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_LookupOnly(x_qGreaterThan(V1,V2))) :- x_cid(a65b159065773a,V1,V2).
xc_microtheory(a65b159065773a,x_QPTheoryMt).
xc_source_file(a65b159065773a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065773a,541).
xc_kb_names(a65b159065773a,["?q1","?q2"]).
xc_mapping_rows(a65b159065773a,[]).
'x_<=='(x_not(x_qUnrelatedTo(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_LookupOnly(x_qGreaterThan(V1,V2))) :- x_cid(a65b159065773b,V1,V2).
xc_microtheory(a65b159065773b,x_QPTheoryMt).
xc_source_file(a65b159065773b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065773b,545).
xc_kb_names(a65b159065773b,["?q1","?q2"]).
xc_mapping_rows(a65b159065773b,[]).
'x_<=='(x_not(x_qUnrelatedTo(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_LookupOnly(x_qGreaterThan(V1,V2))) :- x_cid(a65b159065773c,V1,V2).
xc_microtheory(a65b159065773c,x_QPTheoryMt).
xc_source_file(a65b159065773c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065773c,549).
xc_kb_names(a65b159065773c,["?q1","?q2"]).
xc_mapping_rows(a65b159065773c,[]).
'x_<=='(x_not(x_qUnrelatedTo(V1,V2)),x_groundExpression(V1),x_hasQuantity(V3,V1)) :- x_cid(a65b159065773d,V1,V2,V3).
xc_microtheory(a65b159065773d,x_QPTheoryMt).
xc_source_file(a65b159065773d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065773d,553).
xc_kb_names(a65b159065773d,["?q1","?q2","?e"]).
xc_mapping_rows(a65b159065773d,[]).
'x_<=='(x_not(x_qUnrelatedTo(V1,V2)),x_groundExpression(V2),x_hasQuantity(V3,V2)) :- x_cid(a65b159065773e,V1,V2,V3).
xc_microtheory(a65b159065773e,x_QPTheoryMt).
xc_source_file(a65b159065773e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065773e,556).
xc_kb_names(a65b159065773e,["?q1","?q2","?e"]).
xc_mapping_rows(a65b159065773e,[]).
x_isa(x_oppositeQPOrdinal,x_BinaryPredicate) :- x_cid(a65b159065773f).
xc_microtheory(a65b159065773f,x_QPTheoryMt).
xc_source_file(a65b159065773f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065773f,560).
xc_kb_names(a65b159065773f,[]).
xc_mapping_rows(a65b159065773f,[]).
x_arity(x_oppositeQPOrdinal,2) :- x_cid(a65b1590657740).
xc_microtheory(a65b1590657740,x_QPTheoryMt).
xc_source_file(a65b1590657740,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657740,561).
xc_kb_names(a65b1590657740,[]).
xc_mapping_rows(a65b1590657740,[]).
x_arg1Isa(x_oppositeQPOrdinal,x_FluentOrdinalPredicate) :- x_cid(a65b1590657741).
xc_microtheory(a65b1590657741,x_QPTheoryMt).
xc_source_file(a65b1590657741,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657741,562).
xc_kb_names(a65b1590657741,[]).
xc_mapping_rows(a65b1590657741,[]).
x_arg2Isa(x_oppositeQPOrdinal,x_FluentOrdinalPredicate) :- x_cid(a65b1590657742).
xc_microtheory(a65b1590657742,x_QPTheoryMt).
xc_source_file(a65b1590657742,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657742,563).
xc_kb_names(a65b1590657742,[]).
xc_mapping_rows(a65b1590657742,[]).
x_comment(x_oppositeQPOrdinal,"(oppositeQPOrdinal ?o1 ?o2) indicates that ?o1 and ?o2 are the opposite of each other.\n This is useful for detecting redundancy in ordinal descriptions.") :- x_cid(a65b1590657743).
xc_microtheory(a65b1590657743,x_QPTheoryMt).
xc_source_file(a65b1590657743,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657743,564).
xc_kb_names(a65b1590657743,[]).
xc_mapping_rows(a65b1590657743,[]).
x_oppositeQPOrdinal(x_qGreaterThan,x_qLessThan) :- x_cid(a65b1590657744).
xc_microtheory(a65b1590657744,x_QPTheoryMt).
xc_source_file(a65b1590657744,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657744,566).
xc_kb_names(a65b1590657744,[]).
xc_mapping_rows(a65b1590657744,[]).
x_oppositeQPOrdinal(x_qLessThan,x_qGreaterThan) :- x_cid(a65b1590657745).
xc_microtheory(a65b1590657745,x_QPTheoryMt).
xc_source_file(a65b1590657745,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657745,567).
xc_kb_names(a65b1590657745,[]).
xc_mapping_rows(a65b1590657745,[]).
x_oppositeQPOrdinal(x_qEqualTo,x_qEqualTo) :- x_cid(a65b1590657746).
xc_microtheory(a65b1590657746,x_QPTheoryMt).
xc_source_file(a65b1590657746,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657746,568).
xc_kb_names(a65b1590657746,[]).
xc_mapping_rows(a65b1590657746,[]).
x_oppositeQPOrdinal(x_qGreaterThanOrEqualTo,x_qLessThanOrEqualTo) :- x_cid(a65b1590657747).
xc_microtheory(a65b1590657747,x_QPTheoryMt).
xc_source_file(a65b1590657747,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657747,569).
xc_kb_names(a65b1590657747,[]).
xc_mapping_rows(a65b1590657747,[]).
x_oppositeQPOrdinal(x_qLessThanOrEqualTo,x_qGreaterThanOrEqualTo) :- x_cid(a65b1590657748).
xc_microtheory(a65b1590657748,x_QPTheoryMt).
xc_source_file(a65b1590657748,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657748,570).
xc_kb_names(a65b1590657748,[]).
xc_mapping_rows(a65b1590657748,[]).
x_isa('x_q=',x_BinaryPredicate) :- x_cid(a65b1590657749).
xc_microtheory(a65b1590657749,x_QPTheoryMt).
xc_source_file(a65b1590657749,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657749,573).
xc_kb_names(a65b1590657749,[]).
xc_mapping_rows(a65b1590657749,[]).
x_arity('x_q=',2) :- x_cid(a65b159065774a).
xc_microtheory(a65b159065774a,x_QPTheoryMt).
xc_source_file(a65b159065774a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065774a,574).
xc_kb_names(a65b159065774a,[]).
xc_mapping_rows(a65b159065774a,[]).
x_arg1Isa('x_q=',x_ContinuousQuantity) :- x_cid(a65b159065774b).
xc_microtheory(a65b159065774b,x_QPTheoryMt).
xc_source_file(a65b159065774b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065774b,575).
xc_kb_names(a65b159065774b,[]).
xc_mapping_rows(a65b159065774b,[]).
x_arg2Isa('x_q=',x_ContinuousQuantity) :- x_cid(a65b159065774c).
xc_microtheory(a65b159065774c,x_QPTheoryMt).
xc_source_file(a65b159065774c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065774c,576).
xc_kb_names(a65b159065774c,[]).
xc_mapping_rows(a65b159065774c,[]).
x_comment('x_q=',"(q= ?A ?B) states that A is causally equal to B.") :- x_cid(a65b159065774d).
xc_microtheory(a65b159065774d,x_QPTheoryMt).
xc_source_file(a65b159065774d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065774d,577).
xc_kb_names(a65b159065774d,[]).
xc_mapping_rows(a65b159065774d,[]).
x_isa(x_QPDerivativeFn,x_UnaryFunction) :- x_cid(a65b159065774e).
xc_microtheory(a65b159065774e,x_QPTheoryMt).
xc_source_file(a65b159065774e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065774e,580).
xc_kb_names(a65b159065774e,[]).
xc_mapping_rows(a65b159065774e,[]).
x_arity(x_QPDerivativeFn,1) :- x_cid(a65b159065774f).
xc_microtheory(a65b159065774f,x_QPTheoryMt).
xc_source_file(a65b159065774f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065774f,581).
xc_kb_names(a65b159065774f,[]).
xc_mapping_rows(a65b159065774f,[]).
x_arg1Isa(x_QPDerivativeFn,x_ContinuousQuantity) :- x_cid(a65b1590657750).
xc_microtheory(a65b1590657750,x_QPTheoryMt).
xc_source_file(a65b1590657750,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657750,582).
xc_kb_names(a65b1590657750,[]).
xc_mapping_rows(a65b1590657750,[]).
x_resultIsa(x_QPDerivativeFn,x_ContinuousQuantity) :- x_cid(a65b1590657751).
xc_microtheory(a65b1590657751,x_QPTheoryMt).
xc_source_file(a65b1590657751,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657751,583).
xc_kb_names(a65b1590657751,[]).
xc_mapping_rows(a65b1590657751,[]).
x_comment(x_QPDerivativeFn,"(QPDerivativeFn ?q) is the term denoting the temporal derivative of ?q.") :- x_cid(a65b1590657752).
xc_microtheory(a65b1590657752,x_QPTheoryMt).
xc_source_file(a65b1590657752,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657752,584).
xc_kb_names(a65b1590657752,[]).
xc_mapping_rows(a65b1590657752,[]).
'x_<=='(x_qEqualTo(V1,x_Zero),x_groundExpression(V1),x_different(V1,x_Zero),x_wmOnly(x_sourceOfInfluence('x_q='(V1,x_Zero),V2))) :- x_cid(a65b1590657753,V1,V2).
xc_microtheory(a65b1590657753,x_QPTheoryMt).
xc_source_file(a65b1590657753,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657753,590).
xc_kb_names(a65b1590657753,["?A","?source"]).
xc_mapping_rows(a65b1590657753,[]).
'x_<=='(x_qEqualTo(x_QPDerivativeFn(V1),x_Zero),x_groundExpression(V1),x_different(V1,x_Zero),x_wmOnly(x_sourceOfInfluence('x_q='(V1,x_Zero),V2))) :- x_cid(a65b1590657754,V1,V2).
xc_microtheory(a65b1590657754,x_QPTheoryMt).
xc_source_file(a65b1590657754,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657754,596).
xc_kb_names(a65b1590657754,["?A","?source"]).
xc_mapping_rows(a65b1590657754,[]).
'x_<=='(x_qprop(V1,V2),x_wmOnly(x_sourceOfInfluence('x_q='(V1,V2),V3)),x_noArgumentHasPredicate('x_q='(V1,V2),x_QDifferenceFn),x_different(V1,x_Zero),x_different(V2,x_Zero)) :- x_cid(a65b1590657755,V1,V2,V3).
xc_microtheory(a65b1590657755,x_QPTheoryMt).
xc_source_file(a65b1590657755,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657755,601).
xc_kb_names(a65b1590657755,["?A","?B","?source"]).
xc_mapping_rows(a65b1590657755,[]).
'x_<=='(x_qEqualTo(V1,V2),x_wmOnly('x_q='(V1,V2)),x_noArgumentHasPredicate('x_q='(V1,V2),x_QDifferenceFn),x_different(V1,x_Zero),x_different(V2,x_Zero)) :- x_cid(a65b1590657756,V1,V2).
xc_microtheory(a65b1590657756,x_QPTheoryMt).
xc_source_file(a65b1590657756,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657756,607).
xc_kb_names(a65b1590657756,["?A","?B"]).
xc_mapping_rows(a65b1590657756,[]).
'x_<=='(x_qEqualTo(x_QPDerivativeFn(V1),x_QPDerivativeFn(V2)),x_wmOnly('x_q='(V1,V2)),x_different(V1,x_Zero),x_different(V2,x_Zero)) :- x_cid(a65b1590657757,V1,V2).
xc_microtheory(a65b1590657757,x_QPTheoryMt).
xc_source_file(a65b1590657757,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657757,613).
xc_kb_names(a65b1590657757,["?A","?B"]).
xc_mapping_rows(a65b1590657757,[]).
'x_<=='(x_qpCorrespondence(V1,x_Zero,V2,x_Zero),x_wmOnly('x_q='(V1,V2)),x_different(V1,x_Zero),x_different(V2,x_Zero)) :- x_cid(a65b1590657758,V1,V2).
xc_microtheory(a65b1590657758,x_QPTheoryMt).
xc_source_file(a65b1590657758,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657758,618).
xc_kb_names(a65b1590657758,["?A","?B"]).
xc_mapping_rows(a65b1590657758,[]).
'x_<=='(x_qprop(V1,V2),x_wmOnly(x_sourceOfInfluence('x_q='(V1,x_QDifferenceFn(V2,V3)),V4))) :- x_cid(a65b1590657759,V1,V2,V3,V4).
xc_microtheory(a65b1590657759,x_QPTheoryMt).
xc_source_file(a65b1590657759,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657759,626).
xc_kb_names(a65b1590657759,["?out","?in1","?in2","?source"]).
xc_mapping_rows(a65b1590657759,[]).
'x_<=='('x_qprop-'(V1,V2),x_wmOnly(x_sourceOfInfluence('x_q='(V1,x_QDifferenceFn(V3,V2)),V4))) :- x_cid(a65b159065775a,V1,V2,V3,V4).
xc_microtheory(a65b159065775a,x_QPTheoryMt).
xc_source_file(a65b159065775a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065775a,631).
xc_kb_names(a65b159065775a,["?out","?in2","?in1","?source"]).
xc_mapping_rows(a65b159065775a,[]).
'x_<=='(x_qpCorrespondence(V1,x_Zero,V2,V3),x_wmOnly('x_q='(V1,x_QDifferenceFn(V2,V3)))) :- x_cid(a65b159065775b,V1,V2,V3).
xc_microtheory(a65b159065775b,x_QPTheoryMt).
xc_source_file(a65b159065775b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065775b,636).
xc_kb_names(a65b159065775b,["?out","?in1","?in2"]).
xc_mapping_rows(a65b159065775b,[]).
'x_<=='(x_qprop(V1,V2),x_wmOnly(x_sourceOfInfluence('x_q='(V1,V2),V3)),x_noArgumentHasPredicate('x_q='(V1,V2),x_QDifferenceFn)) :- x_cid(a65b159065775c,V1,V2,V3).
xc_microtheory(a65b159065775c,x_QPTheoryMt).
xc_source_file(a65b159065775c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065775c,639).
xc_kb_names(a65b159065775c,["?out","?in","?source"]).
xc_mapping_rows(a65b159065775c,[]).
'x_<=='(x_qpCorrespondence(V1,x_Zero,V2,x_Zero),x_wmOnly(x_sourceOfInfluence('x_q='(V1,V2),V3)),x_noArgumentHasPredicate('x_q='(V1,V2),x_QDifferenceFn)) :- x_cid(a65b159065775d,V1,V2,V3).
xc_microtheory(a65b159065775d,x_QPTheoryMt).
xc_source_file(a65b159065775d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065775d,643).
xc_kb_names(a65b159065775d,["?out","?in","?source"]).
xc_mapping_rows(a65b159065775d,[]).
'x_<=='(x_qpCorrespondence(V1,x_Zero,V2,V3),x_wmOnly(x_sourceOfInfluence('x_q='(V1,x_QDifferenceFn(V2,V3)),V4))) :- x_cid(a65b159065775e,V1,V2,V3,V4).
xc_microtheory(a65b159065775e,x_QPTheoryMt).
xc_source_file(a65b159065775e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065775e,647).
xc_kb_names(a65b159065775e,["?out","?in1","?in2","?source"]).
xc_mapping_rows(a65b159065775e,[]).
x_isa(x_qprop,x_Predicate) :- x_cid(a65b159065775f).
xc_microtheory(a65b159065775f,x_QPTheoryMt).
xc_source_file(a65b159065775f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065775f,658).
xc_kb_names(a65b159065775f,[]).
xc_mapping_rows(a65b159065775f,[]).
x_arity(x_qprop,2) :- x_cid(a65b1590657760).
xc_microtheory(a65b1590657760,x_QPTheoryMt).
xc_source_file(a65b1590657760,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657760,659).
xc_kb_names(a65b1590657760,[]).
xc_mapping_rows(a65b1590657760,[]).
x_arg1Isa(x_qprop,x_ContinuousQuantity) :- x_cid(a65b1590657761).
xc_microtheory(a65b1590657761,x_QPTheoryMt).
xc_source_file(a65b1590657761,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657761,660).
xc_kb_names(a65b1590657761,[]).
xc_mapping_rows(a65b1590657761,[]).
x_arg2Isa(x_qprop,x_ContinuousQuantity) :- x_cid(a65b1590657762).
xc_microtheory(a65b1590657762,x_QPTheoryMt).
xc_source_file(a65b1590657762,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657762,661).
xc_kb_names(a65b1590657762,[]).
xc_mapping_rows(a65b1590657762,[]).
x_comment(x_qprop,"(qprop ?A ?B) means that there exists a function which determines ?A, \ndepends at least on ?B, and is increasing monotonic in its dependence on ?B.  \nNote that ?A may depend on other parameters as well, \nhence closed-world assumptions are needed to reason about parameter changes.  \nThis is the weakest information that suffices to say, if ?B is going up then, \nall else being equal, ?A will go up, and if ?B goes down, then ?A will go down. See also qprop-.") :- x_cid(a65b1590657763).
xc_microtheory(a65b1590657763,x_QPTheoryMt).
xc_source_file(a65b1590657763,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657763,662).
xc_kb_names(a65b1590657763,[]).
xc_mapping_rows(a65b1590657763,[]).
x_isa('x_qprop-',x_Predicate) :- x_cid(a65b1590657764).
xc_microtheory(a65b1590657764,x_QPTheoryMt).
xc_source_file(a65b1590657764,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657764,670).
xc_kb_names(a65b1590657764,[]).
xc_mapping_rows(a65b1590657764,[]).
x_arity('x_qprop-',2) :- x_cid(a65b1590657765).
xc_microtheory(a65b1590657765,x_QPTheoryMt).
xc_source_file(a65b1590657765,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657765,671).
xc_kb_names(a65b1590657765,[]).
xc_mapping_rows(a65b1590657765,[]).
x_arg1Isa('x_qprop-',x_ContinuousQuantity) :- x_cid(a65b1590657766).
xc_microtheory(a65b1590657766,x_QPTheoryMt).
xc_source_file(a65b1590657766,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657766,672).
xc_kb_names(a65b1590657766,[]).
xc_mapping_rows(a65b1590657766,[]).
x_arg2Isa('x_qprop-',x_ContinuousQuantity) :- x_cid(a65b1590657767).
xc_microtheory(a65b1590657767,x_QPTheoryMt).
xc_source_file(a65b1590657767,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657767,673).
xc_kb_names(a65b1590657767,[]).
xc_mapping_rows(a65b1590657767,[]).
x_comment('x_qprop-',"(qprop- ?A ?B) means that there exists a function which determines ?A,\n depends at least on ?B, and is decreasing monotonic in its dependence on ?B.\nNote that ?A may depend on other parameters as well, hence closed-world assumptions\nare needed to reason about parameter changes.  This is the weakest information that\nsuffices to say, if ?B is going up then, all else being equal, \n?A will go up, and if ?B goes down, then ?A will go down. See also qprop.") :- x_cid(a65b1590657768).
xc_microtheory(a65b1590657768,x_QPTheoryMt).
xc_source_file(a65b1590657768,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657768,674).
xc_kb_names(a65b1590657768,[]).
xc_mapping_rows(a65b1590657768,[]).
x_isa('x_c+',x_Predicate) :- x_cid(a65b1590657769).
xc_microtheory(a65b1590657769,x_QPTheoryMt).
xc_source_file(a65b1590657769,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657769,682).
xc_kb_names(a65b1590657769,[]).
xc_mapping_rows(a65b1590657769,[]).
x_arity('x_c+',2) :- x_cid(a65b159065776a).
xc_microtheory(a65b159065776a,x_QPTheoryMt).
xc_source_file(a65b159065776a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065776a,683).
xc_kb_names(a65b159065776a,[]).
xc_mapping_rows(a65b159065776a,[]).
x_arg1Isa('x_c+',x_ContinuousQuantity) :- x_cid(a65b159065776b).
xc_microtheory(a65b159065776b,x_QPTheoryMt).
xc_source_file(a65b159065776b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065776b,684).
xc_kb_names(a65b159065776b,[]).
xc_mapping_rows(a65b159065776b,[]).
x_arg2Isa('x_c+',x_ContinuousQuantity) :- x_cid(a65b159065776c).
xc_microtheory(a65b159065776c,x_QPTheoryMt).
xc_source_file(a65b159065776c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065776c,685).
xc_kb_names(a65b159065776c,[]).
xc_mapping_rows(a65b159065776c,[]).
x_comment('x_c+',"(c+ ?A ?B) means there is a linear, increasing monotonic functional dependence\nof ?A on ?B.  Hence ?A is the summation of its additive proportionalities.  It is a more \nprecise influence than qprop.") :- x_cid(a65b159065776d).
xc_microtheory(a65b159065776d,x_QPTheoryMt).
xc_source_file(a65b159065776d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065776d,686).
xc_kb_names(a65b159065776d,[]).
xc_mapping_rows(a65b159065776d,[]).
x_isa('x_c-',x_Predicate) :- x_cid(a65b159065776e).
xc_microtheory(a65b159065776e,x_QPTheoryMt).
xc_source_file(a65b159065776e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065776e,691).
xc_kb_names(a65b159065776e,[]).
xc_mapping_rows(a65b159065776e,[]).
x_arity('x_c-',2) :- x_cid(a65b159065776f).
xc_microtheory(a65b159065776f,x_QPTheoryMt).
xc_source_file(a65b159065776f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065776f,692).
xc_kb_names(a65b159065776f,[]).
xc_mapping_rows(a65b159065776f,[]).
x_arg1Isa('x_c-',x_ContinuousQuantity) :- x_cid(a65b1590657770).
xc_microtheory(a65b1590657770,x_QPTheoryMt).
xc_source_file(a65b1590657770,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657770,693).
xc_kb_names(a65b1590657770,[]).
xc_mapping_rows(a65b1590657770,[]).
x_arg2Isa('x_c-',x_ContinuousQuantity) :- x_cid(a65b1590657771).
xc_microtheory(a65b1590657771,x_QPTheoryMt).
xc_source_file(a65b1590657771,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657771,694).
xc_kb_names(a65b1590657771,[]).
xc_mapping_rows(a65b1590657771,[]).
x_comment('x_c-',"(c- ?A ?B) means there is a linear, decreasing monotonic functional dependence\nof ?A on ?B. See also c+.") :- x_cid(a65b1590657772).
xc_microtheory(a65b1590657772,x_QPTheoryMt).
xc_source_file(a65b1590657772,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657772,695).
xc_kb_names(a65b1590657772,[]).
xc_mapping_rows(a65b1590657772,[]).
x_isa('x_i+',x_Predicate) :- x_cid(a65b1590657773).
xc_microtheory(a65b1590657773,x_QPTheoryMt).
xc_source_file(a65b1590657773,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657773,702).
xc_kb_names(a65b1590657773,[]).
xc_mapping_rows(a65b1590657773,[]).
x_arity('x_i+',2) :- x_cid(a65b1590657774).
xc_microtheory(a65b1590657774,x_QPTheoryMt).
xc_source_file(a65b1590657774,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657774,703).
xc_kb_names(a65b1590657774,[]).
xc_mapping_rows(a65b1590657774,[]).
x_arg1Isa('x_i+',x_ContinuousQuantity) :- x_cid(a65b1590657775).
xc_microtheory(a65b1590657775,x_QPTheoryMt).
xc_source_file(a65b1590657775,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657775,704).
xc_kb_names(a65b1590657775,[]).
xc_mapping_rows(a65b1590657775,[]).
x_arg2Isa('x_i+',x_ContinuousQuantity) :- x_cid(a65b1590657776).
xc_microtheory(a65b1590657776,x_QPTheoryMt).
xc_source_file(a65b1590657776,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657776,705).
xc_kb_names(a65b1590657776,[]).
xc_mapping_rows(a65b1590657776,[]).
x_comment('x_i+',"i+ is QP theory's I+.  (I+ ?c ?r) means that D[?c] \n= ... + ?r + ...., with a non-zero value for ?r causing changes in ?c.\nThis is a derivative operator, and the use of addition instead of an unspecified\nfunction for combining effects makes it possible to reason about dynamic \nequilibria.") :- x_cid(a65b1590657777).
xc_microtheory(a65b1590657777,x_QPTheoryMt).
xc_source_file(a65b1590657777,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657777,706).
xc_kb_names(a65b1590657777,[]).
xc_mapping_rows(a65b1590657777,[]).
x_isa('x_i-',x_Predicate) :- x_cid(a65b1590657778).
xc_microtheory(a65b1590657778,x_QPTheoryMt).
xc_source_file(a65b1590657778,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657778,713).
xc_kb_names(a65b1590657778,[]).
xc_mapping_rows(a65b1590657778,[]).
x_arity('x_i-',2) :- x_cid(a65b1590657779).
xc_microtheory(a65b1590657779,x_QPTheoryMt).
xc_source_file(a65b1590657779,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657779,714).
xc_kb_names(a65b1590657779,[]).
xc_mapping_rows(a65b1590657779,[]).
x_arg1Isa('x_i-',x_ContinuousQuantity) :- x_cid(a65b159065777a).
xc_microtheory(a65b159065777a,x_QPTheoryMt).
xc_source_file(a65b159065777a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065777a,715).
xc_kb_names(a65b159065777a,[]).
xc_mapping_rows(a65b159065777a,[]).
x_arg2Isa('x_i-',x_ContinuousQuantity) :- x_cid(a65b159065777b).
xc_microtheory(a65b159065777b,x_QPTheoryMt).
xc_source_file(a65b159065777b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065777b,716).
xc_kb_names(a65b159065777b,[]).
xc_mapping_rows(a65b159065777b,[]).
x_comment('x_i-',"i+ is QP theory's I-.  (I- ?c ?r) means that D[?c] \n= ... - ?r + ...., with a non-zero value for ?r causing changes in ?c.\nThis is a derivative operator, and the use of subtraction instead of an unspecified\nfunction for combining effects makes it possible to reason about dynamic \nequilibria.") :- x_cid(a65b159065777c).
xc_microtheory(a65b159065777c,x_QPTheoryMt).
xc_source_file(a65b159065777c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065777c,717).
xc_kb_names(a65b159065777c,[]).
xc_mapping_rows(a65b159065777c,[]).
x_isa(x_sourceOfInfluence,x_BinaryPredicate) :- x_cid(a65b159065777d).
xc_microtheory(a65b159065777d,x_QPTheoryMt).
xc_source_file(a65b159065777d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065777d,724).
xc_kb_names(a65b159065777d,[]).
xc_mapping_rows(a65b159065777d,[]).
x_arity(x_sourceOfInfluence,2) :- x_cid(a65b159065777e).
xc_microtheory(a65b159065777e,x_QPTheoryMt).
xc_source_file(a65b159065777e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065777e,725).
xc_kb_names(a65b159065777e,[]).
xc_mapping_rows(a65b159065777e,[]).
x_arg1Isa(x_sourceOfInfluence,x_CyclAssertion) :- x_cid(a65b159065777f).
xc_microtheory(a65b159065777f,x_QPTheoryMt).
xc_source_file(a65b159065777f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065777f,726).
xc_kb_names(a65b159065777f,[]).
xc_mapping_rows(a65b159065777f,[]).
x_arg2Isa(x_sourceOfInfluence,x_Thing) :- x_cid(a65b1590657780).
xc_microtheory(a65b1590657780,x_QPTheoryMt).
xc_source_file(a65b1590657780,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657780,727).
xc_kb_names(a65b1590657780,[]).
xc_mapping_rows(a65b1590657780,[]).
x_comment(x_sourceOfInfluence,"(sourceOfInfluence ?inf ?source) indicates that ?source is the model fragment, entity or\nother thing from which the influence ?inf came.  This is crucial information for combining\ninfluences.  In Gizmo, this information is packaged into a third argument on influences,\nbut since it is logically distinct when using QP theory more broadly (e.g., we might not\nhave made a committment to the source yet), in this ontology it is broken out as a\nseparate relationship.") :- x_cid(a65b1590657781).
xc_microtheory(a65b1590657781,x_QPTheoryMt).
xc_source_file(a65b1590657781,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657781,728).
xc_kb_names(a65b1590657781,[]).
xc_mapping_rows(a65b1590657781,[]).
'x_<=='(x_sourceOfInfluence(x_qprop(V1,V2),V3),x_wmOnly(x_mfiConsequenceOf(V3,'x_q='(V1,V2))),x_wmOnly(x_isa(V2,x_ContinuousQuantity))) :- x_cid(a65b1590657782,V1,V2,V3).
xc_microtheory(a65b1590657782,x_QPTheoryMt).
xc_source_file(a65b1590657782,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657782,736).
xc_kb_names(a65b1590657782,["?q1","?q2","?source"]).
xc_mapping_rows(a65b1590657782,[]).
'x_<=='(x_sourceOfInfluence(x_qprop(V1,V2),V3),x_wmOnly(x_sourceOfInfluence('x_q='(V1,x_QDifferenceFn(V2,V4)),V3)),x_wmOnly(x_isa(V2,x_ContinuousQuantity))) :- x_cid(a65b1590657783,V1,V2,V3,V4).
xc_microtheory(a65b1590657783,x_QPTheoryMt).
xc_source_file(a65b1590657783,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657783,740).
xc_kb_names(a65b1590657783,["?qout","?qin1","?source","?qin2"]).
xc_mapping_rows(a65b1590657783,[]).
'x_<=='(x_sourceOfInfluence('x_qprop-'(V1,V2),V3),x_wmOnly(x_sourceOfInfluence('x_q='(V1,x_QDifferenceFn(V4,V2)),V3)),x_wmOnly(x_isa(V2,x_ContinuousQuantity))) :- x_cid(a65b1590657784,V1,V2,V3,V4).
xc_microtheory(a65b1590657784,x_QPTheoryMt).
xc_source_file(a65b1590657784,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657784,744).
xc_kb_names(a65b1590657784,["?qout","?qin2","?source","?qin1"]).
xc_mapping_rows(a65b1590657784,[]).
x_isa(x_qpExplicitFunction,x_Predicate) :- x_cid(a65b1590657785).
xc_microtheory(a65b1590657785,x_QPTheoryMt).
xc_source_file(a65b1590657785,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657785,749).
xc_kb_names(a65b1590657785,[]).
xc_mapping_rows(a65b1590657785,[]).
x_arity(x_qpExplicitFunction,4) :- x_cid(a65b1590657786).
xc_microtheory(a65b1590657786,x_QPTheoryMt).
xc_source_file(a65b1590657786,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657786,750).
xc_kb_names(a65b1590657786,[]).
xc_mapping_rows(a65b1590657786,[]).
x_arg1Isa(x_qpExplicitFunction,x_Thing) :- x_cid(a65b1590657787).
xc_microtheory(a65b1590657787,x_QPTheoryMt).
xc_source_file(a65b1590657787,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657787,751).
xc_kb_names(a65b1590657787,[]).
xc_mapping_rows(a65b1590657787,[]).
x_arg2Isa(x_qpExplicitFunction,x_ContinuousQuantity) :- x_cid(a65b1590657788).
xc_microtheory(a65b1590657788,x_QPTheoryMt).
xc_source_file(a65b1590657788,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657788,752).
xc_kb_names(a65b1590657788,[]).
xc_mapping_rows(a65b1590657788,[]).
x_arg3Isa(x_qpExplicitFunction,x_CycLAssertion) :- x_cid(a65b1590657789).
xc_microtheory(a65b1590657789,x_QPTheoryMt).
xc_source_file(a65b1590657789,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657789,753).
xc_kb_names(a65b1590657789,[]).
xc_mapping_rows(a65b1590657789,[]).
x_arg4Isa(x_qpExplicitFunction,x_Thing) :- x_cid(a65b159065778a).
xc_microtheory(a65b159065778a,x_QPTheoryMt).
xc_source_file(a65b159065778a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065778a,754).
xc_kb_names(a65b159065778a,[]).
xc_mapping_rows(a65b159065778a,[]).
x_comment(x_qpExplicitFunction,"(qpExplicitFunction ?fn ?q ?ins+ ?ins-) indicates that ?q is determined\n by the function ?f, whose inputs ?ins+ are qprop contributions and ?ins- are\n qprop- contributions.") :- x_cid(a65b159065778b).
xc_microtheory(a65b159065778b,x_QPTheoryMt).
xc_source_file(a65b159065778b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065778b,755).
xc_kb_names(a65b159065778b,[]).
xc_mapping_rows(a65b159065778b,[]).
'x_<=='(x_sourceOfInfluence(x_qprop(V1,V2),V3),x_wmOnly(x_mfiConsequenceOf(V3,x_qpExplicitFunction(V4,V1,V5,V6))),x_elementOf(V2,V5)) :- x_cid(a65b159065778c,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b159065778c,x_QPTheoryMt).
xc_source_file(a65b159065778c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065778c,760).
xc_kb_names(a65b159065778c,["?q","?in","?source","?fn","?ins+","?ins-"]).
xc_mapping_rows(a65b159065778c,[]).
'x_<=='(x_sourceOfInfluence('x_qprop-'(V1,V2),V3),x_wmOnly(x_mfiConsequenceOf(V3,x_qpExplicitFunction(V4,V1,V5,V6))),x_elementOf(V2,V6)) :- x_cid(a65b159065778d,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b159065778d,x_QPTheoryMt).
xc_source_file(a65b159065778d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065778d,765).
xc_kb_names(a65b159065778d,["?q","?in","?source","?fn","?ins+","?ins-"]).
xc_mapping_rows(a65b159065778d,[]).
'x_<=='(x_qpCorrespondence(V1,V2,V3,V4),x_different(V1,x_Zero),x_wmOnly(x_qpExplicitFunction(V5,V1,x_TheSet(V3),x_TheSet)),x_wmOnly(x_qpExplicitFunction(V5,V2,x_TheSet(V4),x_TheSet)),x_different(V1,V2)) :- x_cid(a65b159065778e,V1,V2,V3,V4,V5).
xc_microtheory(a65b159065778e,x_QPTheoryMt).
xc_source_file(a65b159065778e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065778e,770).
xc_kb_names(a65b159065778e,["?q1","?q2","?r1","?r2","?fn"]).
xc_mapping_rows(a65b159065778e,[]).
'x_<=='(x_qpCorrespondence(V1,V2,V3,V4),x_different(V1,x_Zero),x_wmOnly(x_qpExplicitFunction(V5,V1,x_TheSet,x_TheSet(V3))),x_wmOnly(x_qpExplicitFunction(V5,V2,x_TheSet,x_TheSet(V4))),x_different(V1,V2)) :- x_cid(a65b159065778f,V1,V2,V3,V4,V5).
xc_microtheory(a65b159065778f,x_QPTheoryMt).
xc_source_file(a65b159065778f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065778f,776).
xc_kb_names(a65b159065778f,["?q1","?q2","?r1","?r2","?fn"]).
xc_mapping_rows(a65b159065778f,[]).
'x_<=='(x_qprop(V1,V2),x_wmOnly(x_qpExplicitFunction(V3,V1,x_TheSet(V2),x_TheSet))) :- x_cid(a65b1590657790,V1,V2,V3).
xc_microtheory(a65b1590657790,x_QPTheoryMt).
xc_source_file(a65b1590657790,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657790,782).
xc_kb_names(a65b1590657790,["?q1","?q2","?fn"]).
xc_mapping_rows(a65b1590657790,[]).
'x_<=='('x_qprop-'(V1,V2),x_wmOnly(x_qpExplicitFunction(V3,V1,x_TheSet,x_TheSet(V2)))) :- x_cid(a65b1590657791,V1,V2,V3).
xc_microtheory(a65b1590657791,x_QPTheoryMt).
xc_source_file(a65b1590657791,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657791,785).
xc_kb_names(a65b1590657791,["?q1","?q2","?fn"]).
xc_mapping_rows(a65b1590657791,[]).
x_isa(x_qpCorrespondence,x_Predicate) :- x_cid(a65b1590657792).
xc_microtheory(a65b1590657792,x_QPTheoryMt).
xc_source_file(a65b1590657792,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657792,789).
xc_kb_names(a65b1590657792,[]).
xc_mapping_rows(a65b1590657792,[]).
x_arity(x_qpCorrespondence,4) :- x_cid(a65b1590657793).
xc_microtheory(a65b1590657793,x_QPTheoryMt).
xc_source_file(a65b1590657793,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657793,790).
xc_kb_names(a65b1590657793,[]).
xc_mapping_rows(a65b1590657793,[]).
x_arg1Isa(x_qpCorrespondence,x_ContinuousQuantity) :- x_cid(a65b1590657794).
xc_microtheory(a65b1590657794,x_QPTheoryMt).
xc_source_file(a65b1590657794,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657794,795).
xc_kb_names(a65b1590657794,[]).
xc_mapping_rows(a65b1590657794,[]).
x_arg2Isa(x_qpCorrespondence,x_ScalarInterval) :- x_cid(a65b1590657795).
xc_microtheory(a65b1590657795,x_QPTheoryMt).
xc_source_file(a65b1590657795,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657795,796).
xc_kb_names(a65b1590657795,[]).
xc_mapping_rows(a65b1590657795,[]).
x_arg3Isa(x_qpCorrespondence,x_ContinuousQuantity) :- x_cid(a65b1590657796).
xc_microtheory(a65b1590657796,x_QPTheoryMt).
xc_source_file(a65b1590657796,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657796,797).
xc_kb_names(a65b1590657796,[]).
xc_mapping_rows(a65b1590657796,[]).
x_arg4Isa(x_qpCorrespondence,x_ScalarInterval) :- x_cid(a65b1590657797).
xc_microtheory(a65b1590657797,x_QPTheoryMt).
xc_source_file(a65b1590657797,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657797,798).
xc_kb_names(a65b1590657797,[]).
xc_mapping_rows(a65b1590657797,[]).
'x_<=='(x_qGreaterThan(V1,V2),x_different(V1,x_Zero),x_groundExpression(V1),x_groundExpression(V2),x_wmOnly(x_qpCorrespondence(V1,V2,V3,V4)),x_wmOnly(x_qprop(V1,V3)),x_wmOnly(x_qGreaterThan(V3,V4))) :- x_cid(a65b1590657798,V1,V2,V3,V4).
xc_microtheory(a65b1590657798,x_QPTheoryMt).
xc_source_file(a65b1590657798,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657798,800).
xc_kb_names(a65b1590657798,["?q1","?q2","?r1","?r2"]).
xc_mapping_rows(a65b1590657798,[]).
'x_<=='(x_qLessThan(V1,V2),x_different(V1,x_Zero),x_groundExpression(V1),x_groundExpression(V2),x_wmOnly(x_qpCorrespondence(V1,V2,V3,V4)),x_wmOnly(x_qprop(V1,V3)),x_wmOnly(x_qLessThan(V3,V4))) :- x_cid(a65b1590657799,V1,V2,V3,V4).
xc_microtheory(a65b1590657799,x_QPTheoryMt).
xc_source_file(a65b1590657799,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657799,808).
xc_kb_names(a65b1590657799,["?q1","?q2","?r1","?r2"]).
xc_mapping_rows(a65b1590657799,[]).
'x_<=='(x_qGreaterThan(V1,V2),x_different(V1,x_Zero),x_groundExpression(V1),x_groundExpression(V2),x_wmOnly(x_qpCorrespondence(V1,V2,V3,V4)),x_wmOnly('x_qprop-'(V1,V3)),x_wmOnly(x_qLessThan(V3,V4))) :- x_cid(a65b159065779a,V1,V2,V3,V4).
xc_microtheory(a65b159065779a,x_QPTheoryMt).
xc_source_file(a65b159065779a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065779a,816).
xc_kb_names(a65b159065779a,["?q1","?q2","?r1","?r2"]).
xc_mapping_rows(a65b159065779a,[]).
'x_<=='(x_qLessThan(V1,V2),x_different(V1,x_Zero),x_groundExpression(V1),x_groundExpression(V2),x_wmOnly(x_qpCorrespondence(V1,V2,V3,V4)),x_wmOnly('x_qprop-'(V1,V3)),x_wmOnly(x_qGreaterThan(V3,V4))) :- x_cid(a65b159065779b,V1,V2,V3,V4).
xc_microtheory(a65b159065779b,x_QPTheoryMt).
xc_source_file(a65b159065779b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065779b,824).
xc_kb_names(a65b159065779b,["?q1","?q2","?r1","?r2"]).
xc_mapping_rows(a65b159065779b,[]).
'x_<=='(x_qEqualTo(V1,V2),x_different(V1,x_Zero),x_groundExpression(V1),x_groundExpression(V2),x_wmOnly(x_qpCorrespondence(V1,V2,V3,V4)),x_wmOnly(x_qprop(V1,V3)),x_wmOnly(x_qEqualTo(V3,V4))) :- x_cid(a65b159065779c,V1,V2,V3,V4).
xc_microtheory(a65b159065779c,x_QPTheoryMt).
xc_source_file(a65b159065779c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065779c,832).
xc_kb_names(a65b159065779c,["?q1","?q2","?r1","?r2"]).
xc_mapping_rows(a65b159065779c,[]).
'x_<=='(x_qEqualTo(V1,V2),x_different(V1,x_Zero),x_groundExpression(V1),x_groundExpression(V2),x_wmOnly(x_qpCorrespondence(V1,V2,V3,V4)),x_wmOnly('x_qprop-'(V1,V3)),x_wmOnly(x_qEqualTo(V3,V4))) :- x_cid(a65b159065779d,V1,V2,V3,V4).
xc_microtheory(a65b159065779d,x_QPTheoryMt).
xc_source_file(a65b159065779d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065779d,840).
xc_kb_names(a65b159065779d,["?q1","?q2","?r1","?r2"]).
xc_mapping_rows(a65b159065779d,[]).
x_isa(x_hasQPQuantityOfType,x_BinaryPredicate) :- x_cid(a65b159065779e).
xc_microtheory(a65b159065779e,x_QPTheoryMt).
xc_source_file(a65b159065779e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065779e,849).
xc_kb_names(a65b159065779e,[]).
xc_mapping_rows(a65b159065779e,[]).
x_arg1Isa(x_hasQPQuantityOfType,x_SomethingExisting) :- x_cid(a65b159065779f).
xc_microtheory(a65b159065779f,x_QPTheoryMt).
xc_source_file(a65b159065779f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065779f,850).
xc_kb_names(a65b159065779f,[]).
xc_mapping_rows(a65b159065779f,[]).
x_arg2Isa(x_hasQPQuantityOfType,x_ContinuousQuantity) :- x_cid(a65b15906577a0).
xc_microtheory(a65b15906577a0,x_QPTheoryMt).
xc_source_file(a65b15906577a0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577a0,851).
xc_kb_names(a65b15906577a0,[]).
xc_mapping_rows(a65b15906577a0,[]).
x_comment(x_hasQPQuantityOfType,"(hasQPQuantityOfType ?mte ?qt) indicates that every instance of model fragment or entity\n type ?mte has a quantity of type ?qt.  \n For example, (hasQPQuantityOfType LiquidFlow LiquidFlowRate).") :- x_cid(a65b15906577a1).
xc_microtheory(a65b15906577a1,x_QPTheoryMt).
xc_source_file(a65b15906577a1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577a1,852).
xc_kb_names(a65b15906577a1,[]).
xc_mapping_rows(a65b15906577a1,[]).
x_isa(x_qpQuantityDimensionOfType,x_TernaryPredicate) :- x_cid(a65b15906577a2).
xc_microtheory(a65b15906577a2,x_QPTheoryMt).
xc_source_file(a65b15906577a2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577a2,858).
xc_kb_names(a65b15906577a2,[]).
xc_mapping_rows(a65b15906577a2,[]).
x_arg1Isa(x_qpQuantityDimensionOfType,x_SomethingExisting) :- x_cid(a65b15906577a3).
xc_microtheory(a65b15906577a3,x_QPTheoryMt).
xc_source_file(a65b15906577a3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577a3,859).
xc_kb_names(a65b15906577a3,[]).
xc_mapping_rows(a65b15906577a3,[]).
x_arg2Isa(x_qpQuantityDimensionOfType,x_ContinuousQuantity) :- x_cid(a65b15906577a4).
xc_microtheory(a65b15906577a4,x_QPTheoryMt).
xc_source_file(a65b15906577a4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577a4,860).
xc_kb_names(a65b15906577a4,[]).
xc_mapping_rows(a65b15906577a4,[]).
x_arg3Isa(x_qpQuantityDimensionOfType,x_UnitOfMeasure) :- x_cid(a65b15906577a5).
xc_microtheory(a65b15906577a5,x_QPTheoryMt).
xc_source_file(a65b15906577a5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577a5,861).
xc_kb_names(a65b15906577a5,[]).
xc_mapping_rows(a65b15906577a5,[]).
x_comment(x_qpQuantityDimensionOfType,"(qpQuantityDimentionOfType ?et ?qt ?ut) indicates that instances of entity type ?et\n have instances of quantity type ?qt with units ?ut.") :- x_cid(a65b15906577a6).
xc_microtheory(a65b15906577a6,x_QPTheoryMt).
xc_source_file(a65b15906577a6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577a6,862).
xc_kb_names(a65b15906577a6,[]).
xc_mapping_rows(a65b15906577a6,[]).
x_isa(x_dsValue,x_BinaryPredicate) :- x_cid(a65b15906577a7).
xc_microtheory(a65b15906577a7,x_QPTheoryMt).
xc_source_file(a65b15906577a7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577a7,866).
xc_kb_names(a65b15906577a7,[]).
xc_mapping_rows(a65b15906577a7,[]).
x_arity(x_dsValue,2) :- x_cid(a65b15906577a8).
xc_microtheory(a65b15906577a8,x_QPTheoryMt).
xc_source_file(a65b15906577a8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577a8,867).
xc_kb_names(a65b15906577a8,[]).
xc_mapping_rows(a65b15906577a8,[]).
x_arg1Isa(x_dsValue,x_ContinuousQuantity) :- x_cid(a65b15906577a9).
xc_microtheory(a65b15906577a9,x_QPTheoryMt).
xc_source_file(a65b15906577a9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577a9,868).
xc_kb_names(a65b15906577a9,[]).
xc_mapping_rows(a65b15906577a9,[]).
x_arg2Isa(x_dsValue,x_PossibleDsValue) :- x_cid(a65b15906577aa).
xc_microtheory(a65b15906577aa,x_QPTheoryMt).
xc_source_file(a65b15906577aa,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577aa,869).
xc_kb_names(a65b15906577aa,[]).
xc_mapping_rows(a65b15906577aa,[]).
x_isa(x_unknownMF,x_BinaryPredicate) :- x_cid(a65b15906577ab).
xc_microtheory(a65b15906577ab,x_QPTheoryMt).
xc_source_file(a65b15906577ab,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577ab,880).
xc_kb_names(a65b15906577ab,[]).
xc_mapping_rows(a65b15906577ab,[]).
x_comment(x_unknownMF,"(unknownMF <state> <mfi>) indicates that in <state>, it is not known whether or not\n model fragment instance <mfi> is active.") :- x_cid(a65b15906577ac).
xc_microtheory(a65b15906577ac,x_QPTheoryMt).
xc_source_file(a65b15906577ac,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577ac,881).
xc_kb_names(a65b15906577ac,[]).
xc_mapping_rows(a65b15906577ac,[]).
x_arg1Isa(x_unknownMF,x_QualitativeState) :- x_cid(a65b15906577ad).
xc_microtheory(a65b15906577ad,x_QPTheoryMt).
xc_source_file(a65b15906577ad,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577ad,884).
xc_kb_names(a65b15906577ad,[]).
xc_mapping_rows(a65b15906577ad,[]).
x_arg2Isa(x_unknownMF,x_ModelFragment) :- x_cid(a65b15906577ae).
xc_microtheory(a65b15906577ae,x_QPTheoryMt).
xc_source_file(a65b15906577ae,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577ae,885).
xc_kb_names(a65b15906577ae,[]).
xc_mapping_rows(a65b15906577ae,[]).
x_isa(x_unknownMFsIn,x_BinaryPredicate) :- x_cid(a65b15906577af).
xc_microtheory(a65b15906577af,x_QPTheoryMt).
xc_source_file(a65b15906577af,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577af,887).
xc_kb_names(a65b15906577af,[]).
xc_mapping_rows(a65b15906577af,[]).
x_comment(x_unknownMFsIn,"(unknownMFsIn <state> <set of mfis>) indicates that in <state>, the set of model fragment\n instances whose status is unknown is <set of mfis>.") :- x_cid(a65b15906577b0).
xc_microtheory(a65b15906577b0,x_QPTheoryMt).
xc_source_file(a65b15906577b0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577b0,888).
xc_kb_names(a65b15906577b0,[]).
xc_mapping_rows(a65b15906577b0,[]).
x_arg1Isa(x_unknownMFsIn,x_QualitativeState) :- x_cid(a65b15906577b1).
xc_microtheory(a65b15906577b1,x_QPTheoryMt).
xc_source_file(a65b15906577b1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577b1,891).
xc_kb_names(a65b15906577b1,[]).
xc_mapping_rows(a65b15906577b1,[]).
x_arg2Isa(x_unknownMFsIn,'x_Set-Extensional') :- x_cid(a65b15906577b2).
xc_microtheory(a65b15906577b2,x_QPTheoryMt).
xc_source_file(a65b15906577b2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577b2,892).
xc_kb_names(a65b15906577b2,[]).
xc_mapping_rows(a65b15906577b2,[]).
'x_<=='(x_unknownMF(V1,V2),x_uninferredSentence(x_wmOnly('x_ist-Information'(V1,x_activeMF(V2)))),x_uninferredSentence(x_wmOnly('x_ist-Information'(V1,x_not(x_activeMF(V2)))))) :- x_cid(a65b15906577b3,V1,V2).
xc_microtheory(a65b15906577b3,x_QPTheoryMt).
xc_source_file(a65b15906577b3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577b3,894).
xc_kb_names(a65b15906577b3,["?state","?mfi"]).
xc_mapping_rows(a65b15906577b3,[]).
'x_<=='(x_unknownMFsIn(V1,V2),x_wmOnly(x_evaluate(V2,x_TheClosedRetrievalSetOf(V3,x_and('x_ist-Information'(V1,x_scenarioHasMFI(V1,V3)),x_unknownMF(V1,V3)))))) :- x_cid(a65b15906577b4,V1,V2,V3).
xc_microtheory(a65b15906577b4,x_QPTheoryMt).
xc_source_file(a65b15906577b4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577b4,898).
xc_kb_names(a65b15906577b4,["?state","?set","?mfi"]).
xc_mapping_rows(a65b15906577b4,[]).
x_isa(x_quantitiesInQPState,x_BinaryPredicate) :- x_cid(a65b15906577b5).
xc_microtheory(a65b15906577b5,x_QPTheoryMt).
xc_source_file(a65b15906577b5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577b5,910).
xc_kb_names(a65b15906577b5,[]).
xc_mapping_rows(a65b15906577b5,[]).
x_comment(x_quantitiesInQPState,"(quantitiesInQPState ?state ?qset) indicates that in state ?state, the set of quantities ?qset\n are all the quantities known to exist in that state.") :- x_cid(a65b15906577b6).
xc_microtheory(a65b15906577b6,x_QPTheoryMt).
xc_source_file(a65b15906577b6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577b6,911).
xc_kb_names(a65b15906577b6,[]).
xc_mapping_rows(a65b15906577b6,[]).
x_arg1Isa(x_quantitiesInQPState,x_QualitativeState) :- x_cid(a65b15906577b7).
xc_microtheory(a65b15906577b7,x_QPTheoryMt).
xc_source_file(a65b15906577b7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577b7,914).
xc_kb_names(a65b15906577b7,[]).
xc_mapping_rows(a65b15906577b7,[]).
x_arg2Isa(x_quantitiesInQPState,'x_Set-Extensional') :- x_cid(a65b15906577b8).
xc_microtheory(a65b15906577b8,x_QPTheoryMt).
xc_source_file(a65b15906577b8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577b8,915).
xc_kb_names(a65b15906577b8,[]).
xc_mapping_rows(a65b15906577b8,[]).
'x_<=='(x_quantitiesInQPState(V1,V2),x_wmOnly(x_evaluate(V2,x_SortFn(x_TheClosedRetrievalSetOf(V3,x_and(x_considerEntity(V4),x_hasQuantity(V4,V3))),x_Kappa(t(V5,V6),x_alphalessp(V5,V6)),x_IdentityFn)))) :- x_cid(a65b15906577b9,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b15906577b9,x_QPTheoryMt).
xc_source_file(a65b15906577b9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577b9,917).
xc_kb_names(a65b15906577b9,["?state","?qset","?q","?e","?one","?two"]).
xc_mapping_rows(a65b15906577b9,[]).
x_isa(x_directInfluencesOn,x_TernaryPredicate) :- x_cid(a65b15906577ba).
xc_microtheory(a65b15906577ba,x_QPTheoryMt).
xc_source_file(a65b15906577ba,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577ba,923).
xc_kb_names(a65b15906577ba,[]).
xc_mapping_rows(a65b15906577ba,[]).
x_comment(x_directInfluencesOn,"(directInfluencesOn ?q ?+s ?-s) indicates that the direct influences on quantity ?q consist of\n a (possibly empty) positive set ?+s and a (possibly empty) negative set ?-s.  The sets consist of\n lists, where the first element is the rate parameter and the second element is the source of that\n influence.  Note that the sign of the rate parameters must be determined in order to determine\n what the actual impact of any specific influence must be.") :- x_cid(a65b15906577bb).
xc_microtheory(a65b15906577bb,x_QPTheoryMt).
xc_source_file(a65b15906577bb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577bb,924).
xc_kb_names(a65b15906577bb,[]).
xc_mapping_rows(a65b15906577bb,[]).
x_arg1Isa(x_directInfluencesOn,x_ContinuousQuantity) :- x_cid(a65b15906577bc).
xc_microtheory(a65b15906577bc,x_QPTheoryMt).
xc_source_file(a65b15906577bc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577bc,930).
xc_kb_names(a65b15906577bc,[]).
xc_mapping_rows(a65b15906577bc,[]).
x_arg2Isa(x_directInfluencesOn,'x_Set-Extensional') :- x_cid(a65b15906577bd).
xc_microtheory(a65b15906577bd,x_QPTheoryMt).
xc_source_file(a65b15906577bd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577bd,931).
xc_kb_names(a65b15906577bd,[]).
xc_mapping_rows(a65b15906577bd,[]).
x_arg3Isa(x_directInfluencesOn,'x_Set-Extensional') :- x_cid(a65b15906577be).
xc_microtheory(a65b15906577be,x_QPTheoryMt).
xc_source_file(a65b15906577be,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577be,932).
xc_kb_names(a65b15906577be,[]).
xc_mapping_rows(a65b15906577be,[]).
'x_<=='(x_directInfluencesOn(V1,V2,V3),x_wmOnly(x_evaluate(V2,x_TheClosedRetrievalSetOf(V4,x_and(x_sourceOfInfluence('x_i+'(V1,V5),V6),x_unifies(V4,x_TheList(V5,V6)))))),x_wmOnly(x_evaluate(V3,x_TheClosedRetrievalSetOf(V7,x_and(x_sourceOfInfluence('x_i-'(V1,V5),V6),x_unifies(V7,x_TheList(V5,V6))))))) :- x_cid(a65b15906577bf,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b15906577bf,x_QPTheoryMt).
xc_source_file(a65b15906577bf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577bf,934).
xc_kb_names(a65b15906577bf,["?q","?+s","?-s","?+","?rate","?source","?-"]).
xc_mapping_rows(a65b15906577bf,[]).
x_isa(x_indirectInfluencesOn,x_TernaryPredicate) :- x_cid(a65b15906577c0).
xc_microtheory(a65b15906577c0,x_QPTheoryMt).
xc_source_file(a65b15906577c0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577c0,946).
xc_kb_names(a65b15906577c0,[]).
xc_mapping_rows(a65b15906577c0,[]).
x_comment(x_indirectInfluencesOn,"(indirectInfluencesOn ?q ?+s ?-s) indicates that the indirect influences on quantity ?q consist of\n a (possibly empty) positive set ?+s and a (possibly empty) negative set ?-s.  The sets consist of\n lists, where the first element is the rate parameter and the second element is the source of that\n influence.  Note that the sign of the constraining parameters must be determined in order to determine\n what the actual impact of any specific influence must be.") :- x_cid(a65b15906577c1).
xc_microtheory(a65b15906577c1,x_QPTheoryMt).
xc_source_file(a65b15906577c1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577c1,947).
xc_kb_names(a65b15906577c1,[]).
xc_mapping_rows(a65b15906577c1,[]).
x_arg1Isa(x_indirectInfluencesOn,x_ContinuousQuantity) :- x_cid(a65b15906577c2).
xc_microtheory(a65b15906577c2,x_QPTheoryMt).
xc_source_file(a65b15906577c2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577c2,953).
xc_kb_names(a65b15906577c2,[]).
xc_mapping_rows(a65b15906577c2,[]).
x_arg2Isa(x_indirectInfluencesOn,'x_Set-Extensional') :- x_cid(a65b15906577c3).
xc_microtheory(a65b15906577c3,x_QPTheoryMt).
xc_source_file(a65b15906577c3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577c3,954).
xc_kb_names(a65b15906577c3,[]).
xc_mapping_rows(a65b15906577c3,[]).
x_arg3Isa(x_indirectInfluencesOn,'x_Set-Extensional') :- x_cid(a65b15906577c4).
xc_microtheory(a65b15906577c4,x_QPTheoryMt).
xc_source_file(a65b15906577c4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577c4,955).
xc_kb_names(a65b15906577c4,[]).
xc_mapping_rows(a65b15906577c4,[]).
'x_<=='(x_indirectInfluencesOn(V1,V2,V3),x_wmOnly(x_evaluate(V2,x_TheClosedRetrievalSetOf(V4,x_and(x_sourceOfInfluence(x_qprop(V1,V5),V6),x_unifies(V4,x_TheList(V5,V6)))))),x_wmOnly(x_evaluate(V3,x_TheClosedRetrievalSetOf(V7,x_and(x_sourceOfInfluence('x_qprop-'(V1,V5),V6),x_unifies(V7,x_TheList(V5,V6))))))) :- x_cid(a65b15906577c5,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b15906577c5,x_QPTheoryMt).
xc_source_file(a65b15906577c5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577c5,957).
xc_kb_names(a65b15906577c5,["?q","?+s","?-s","?+","?constrainer","?source","?-"]).
xc_mapping_rows(a65b15906577c5,[]).
x_isa(x_uninfluencedQuantity,x_UnaryPredicate) :- x_cid(a65b15906577c6).
xc_microtheory(a65b15906577c6,x_QPTheoryMt).
xc_source_file(a65b15906577c6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577c6,969).
xc_kb_names(a65b15906577c6,[]).
xc_mapping_rows(a65b15906577c6,[]).
x_arity(x_uninfluencedQuantity,1) :- x_cid(a65b15906577c7).
xc_microtheory(a65b15906577c7,x_QPTheoryMt).
xc_source_file(a65b15906577c7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577c7,970).
xc_kb_names(a65b15906577c7,[]).
xc_mapping_rows(a65b15906577c7,[]).
x_comment(x_uninfluencedQuantity,"(uninfluencedQuantity ?q) indicates that quantity ?q has neither direct nor indirect influences constraining it.\n In QP theory, this means Ds[?q]=0.") :- x_cid(a65b15906577c8).
xc_microtheory(a65b15906577c8,x_QPTheoryMt).
xc_source_file(a65b15906577c8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577c8,971).
xc_kb_names(a65b15906577c8,[]).
xc_mapping_rows(a65b15906577c8,[]).
x_arg1Isa(x_uninfluencedQuantity,x_ContinuousQuantity) :- x_cid(a65b15906577c9).
xc_microtheory(a65b15906577c9,x_QPTheoryMt).
xc_source_file(a65b15906577c9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577c9,974).
xc_kb_names(a65b15906577c9,[]).
xc_mapping_rows(a65b15906577c9,[]).
'x_<=='(x_uninfluencedQuantity(V1),x_lookupOnly(x_wmOnly(x_directInfluencesOn(V1,x_TheSet,x_TheSet))),x_lookupOnly(x_wmOnly(x_indirectInfluencesOn(V1,x_TheSet,x_TheSet)))) :- x_cid(a65b15906577ca,V1).
xc_microtheory(a65b15906577ca,x_QPTheoryMt).
xc_source_file(a65b15906577ca,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577ca,976).
xc_kb_names(a65b15906577ca,["?q"]).
xc_mapping_rows(a65b15906577ca,[]).
x_isa(x_PossibleDsValue,x_Collection) :- x_cid(a65b15906577cb).
xc_microtheory(a65b15906577cb,x_QPTheoryMt).
xc_source_file(a65b15906577cb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577cb,980).
xc_kb_names(a65b15906577cb,[]).
xc_mapping_rows(a65b15906577cb,[]).
x_genls(x_PossibleDsValue,x_Thing) :- x_cid(a65b15906577cc).
xc_microtheory(a65b15906577cc,x_QPTheoryMt).
xc_source_file(a65b15906577cc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577cc,981).
xc_kb_names(a65b15906577cc,[]).
xc_mapping_rows(a65b15906577cc,[]).
x_comment(x_PossibleDsValue,"PossibleDsValue is the set of the known Ds values + Ambig") :- x_cid(a65b15906577cd).
xc_microtheory(a65b15906577cd,x_QPTheoryMt).
xc_source_file(a65b15906577cd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577cd,982).
xc_kb_names(a65b15906577cd,[]).
xc_mapping_rows(a65b15906577cd,[]).
x_isa(x_Ambig,x_PossibleDsValue) :- x_cid(a65b15906577ce).
xc_microtheory(a65b15906577ce,x_QPTheoryMt).
xc_source_file(a65b15906577ce,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577ce,984).
xc_kb_names(a65b15906577ce,[]).
xc_mapping_rows(a65b15906577ce,[]).
x_isa(x_KnownDsValue,x_Collection) :- x_cid(a65b15906577cf).
xc_microtheory(a65b15906577cf,x_QPTheoryMt).
xc_source_file(a65b15906577cf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577cf,986).
xc_kb_names(a65b15906577cf,[]).
xc_mapping_rows(a65b15906577cf,[]).
x_genls(x_KnownDsValue,x_PossibleDsValue) :- x_cid(a65b15906577d0).
xc_microtheory(a65b15906577d0,x_QPTheoryMt).
xc_source_file(a65b15906577d0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577d0,987).
xc_kb_names(a65b15906577d0,[]).
xc_mapping_rows(a65b15906577d0,[]).
x_comment(x_KnownDsValue,"KnownDsValue are the set of Ds values that are clear, unambiguous outcomes, i.e. one of {-1, 0, 1}.") :- x_cid(a65b15906577d1).
xc_microtheory(a65b15906577d1,x_QPTheoryMt).
xc_source_file(a65b15906577d1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577d1,988).
xc_kb_names(a65b15906577d1,[]).
xc_mapping_rows(a65b15906577d1,[]).
x_isa(1,x_KnownDsValue) :- x_cid(a65b15906577d2).
xc_microtheory(a65b15906577d2,x_QPTheoryMt).
xc_source_file(a65b15906577d2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577d2,990).
xc_kb_names(a65b15906577d2,[]).
xc_mapping_rows(a65b15906577d2,[]).
x_isa(0,x_KnownDsValue) :- x_cid(a65b15906577d3).
xc_microtheory(a65b15906577d3,x_QPTheoryMt).
xc_source_file(a65b15906577d3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577d3,991).
xc_kb_names(a65b15906577d3,[]).
xc_mapping_rows(a65b15906577d3,[]).
x_isa(-1,x_KnownDsValue) :- x_cid(a65b15906577d4).
xc_microtheory(a65b15906577d4,x_QPTheoryMt).
xc_source_file(a65b15906577d4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577d4,992).
xc_kb_names(a65b15906577d4,[]).
xc_mapping_rows(a65b15906577d4,[]).
x_isa(x_oppositeDsValue,x_SymmetricBinaryPredicate) :- x_cid(a65b15906577d5).
xc_microtheory(a65b15906577d5,x_QPTheoryMt).
xc_source_file(a65b15906577d5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577d5,994).
xc_kb_names(a65b15906577d5,[]).
xc_mapping_rows(a65b15906577d5,[]).
x_comment(x_oppositeDsValue,"(oppositeDsValue ?x ?y) is true when Ds\n values ?x and ?y are opposite.") :- x_cid(a65b15906577d6).
xc_microtheory(a65b15906577d6,x_QPTheoryMt).
xc_source_file(a65b15906577d6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577d6,995).
xc_kb_names(a65b15906577d6,[]).
xc_mapping_rows(a65b15906577d6,[]).
x_arg1Isa(x_oppositeDsValue,x_KnownDsValue) :- x_cid(a65b15906577d7).
xc_microtheory(a65b15906577d7,x_QPTheoryMt).
xc_source_file(a65b15906577d7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577d7,997).
xc_kb_names(a65b15906577d7,[]).
xc_mapping_rows(a65b15906577d7,[]).
x_arg2Isa(x_oppositeDsValue,x_KnownDsValue) :- x_cid(a65b15906577d8).
xc_microtheory(a65b15906577d8,x_QPTheoryMt).
xc_source_file(a65b15906577d8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577d8,998).
xc_kb_names(a65b15906577d8,[]).
xc_mapping_rows(a65b15906577d8,[]).
x_oppositeDsValue(1,-1) :- x_cid(a65b15906577d9).
xc_microtheory(a65b15906577d9,x_QPTheoryMt).
xc_source_file(a65b15906577d9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577d9,999).
xc_kb_names(a65b15906577d9,[]).
xc_mapping_rows(a65b15906577d9,[]).
x_oppositeDsValue(-1,1) :- x_cid(a65b15906577da).
xc_microtheory(a65b15906577da,x_QPTheoryMt).
xc_source_file(a65b15906577da,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577da,1000).
xc_kb_names(a65b15906577da,[]).
xc_mapping_rows(a65b15906577da,[]).
x_isa(x_performQPAnalysis,x_QuintaryPredicate) :- x_cid(a65b15906577db).
xc_microtheory(a65b15906577db,x_QPTheoryMt).
xc_source_file(a65b15906577db,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577db,1006).
xc_kb_names(a65b15906577db,[]).
xc_mapping_rows(a65b15906577db,[]).
x_arity(x_performQPAnalysis,5) :- x_cid(a65b15906577dc).
xc_microtheory(a65b15906577dc,x_QPTheoryMt).
xc_source_file(a65b15906577dc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577dc,1007).
xc_kb_names(a65b15906577dc,[]).
xc_mapping_rows(a65b15906577dc,[]).
x_comment(x_performQPAnalysis,"(performQPAnalysis ?state ?sm ?dt ?scenario ?asns) uses QP theory to analyze scenario\n ?scenario, with respect to domain theory ?dt under modeling assumptions ?asns, using ?state for the results.  Everything\n except for ?state can be in the KB or WM, but ?state will always be in WM.") :- x_cid(a65b15906577dd).
xc_microtheory(a65b15906577dd,x_QPTheoryMt).
xc_source_file(a65b15906577dd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577dd,1008).
xc_kb_names(a65b15906577dd,[]).
xc_mapping_rows(a65b15906577dd,[]).
x_arg1Isa(x_performQPAnalysis,x_Microtheory) :- x_cid(a65b15906577de).
xc_microtheory(a65b15906577de,x_QPTheoryMt).
xc_source_file(a65b15906577de,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577de,1011).
xc_kb_names(a65b15906577de,[]).
xc_mapping_rows(a65b15906577de,[]).
x_arg2Isa(x_performQPAnalysis,x_Microtheory) :- x_cid(a65b15906577df).
xc_microtheory(a65b15906577df,x_QPTheoryMt).
xc_source_file(a65b15906577df,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577df,1012).
xc_kb_names(a65b15906577df,[]).
xc_mapping_rows(a65b15906577df,[]).
x_arg3Isa(x_performQPAnalysis,x_Microtheory) :- x_cid(a65b15906577e0).
xc_microtheory(a65b15906577e0,x_QPTheoryMt).
xc_source_file(a65b15906577e0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577e0,1013).
xc_kb_names(a65b15906577e0,[]).
xc_mapping_rows(a65b15906577e0,[]).
x_arg4Isa(x_performQPAnalysis,x_Microtheory) :- x_cid(a65b15906577e1).
xc_microtheory(a65b15906577e1,x_QPTheoryMt).
xc_source_file(a65b15906577e1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577e1,1014).
xc_kb_names(a65b15906577e1,[]).
xc_mapping_rows(a65b15906577e1,[]).
x_arg5Isa(x_performQPAnalysis,x_Microtheory) :- x_cid(a65b15906577e2).
xc_microtheory(a65b15906577e2,x_QPTheoryMt).
xc_source_file(a65b15906577e2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577e2,1015).
xc_kb_names(a65b15906577e2,[]).
xc_mapping_rows(a65b15906577e2,[]).
x_isa(x_formulateQPModel,x_QuintaryPredicate) :- x_cid(a65b15906577e3).
xc_microtheory(a65b15906577e3,x_QPTheoryMt).
xc_source_file(a65b15906577e3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577e3,1017).
xc_kb_names(a65b15906577e3,[]).
xc_mapping_rows(a65b15906577e3,[]).
x_arity(x_formulateQPModel,5) :- x_cid(a65b15906577e4).
xc_microtheory(a65b15906577e4,x_QPTheoryMt).
xc_source_file(a65b15906577e4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577e4,1018).
xc_kb_names(a65b15906577e4,[]).
xc_mapping_rows(a65b15906577e4,[]).
x_arg1Isa(x_formulateQPModel,x_Microtheory) :- x_cid(a65b15906577e5).
xc_microtheory(a65b15906577e5,x_QPTheoryMt).
xc_source_file(a65b15906577e5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577e5,1019).
xc_kb_names(a65b15906577e5,[]).
xc_mapping_rows(a65b15906577e5,[]).
x_arg2Isa(x_formulateQPModel,x_Microtheory) :- x_cid(a65b15906577e6).
xc_microtheory(a65b15906577e6,x_QPTheoryMt).
xc_source_file(a65b15906577e6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577e6,1020).
xc_kb_names(a65b15906577e6,[]).
xc_mapping_rows(a65b15906577e6,[]).
x_arg3Isa(x_formulateQPModel,x_Microtheory) :- x_cid(a65b15906577e7).
xc_microtheory(a65b15906577e7,x_QPTheoryMt).
xc_source_file(a65b15906577e7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577e7,1021).
xc_kb_names(a65b15906577e7,[]).
xc_mapping_rows(a65b15906577e7,[]).
x_arg4Isa(x_formulateQPModel,x_Microtheory) :- x_cid(a65b15906577e8).
xc_microtheory(a65b15906577e8,x_QPTheoryMt).
xc_source_file(a65b15906577e8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577e8,1022).
xc_kb_names(a65b15906577e8,[]).
xc_mapping_rows(a65b15906577e8,[]).
x_arg5Isa(x_formulateQPModel,'x_Set-Mathematical') :- x_cid(a65b15906577e9).
xc_microtheory(a65b15906577e9,x_QPTheoryMt).
xc_source_file(a65b15906577e9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577e9,1023).
xc_kb_names(a65b15906577e9,[]).
xc_mapping_rows(a65b15906577e9,[]).
x_comment(x_formulateQPModel,"(formulateQPModel ?sm ?dt ?sc ?asn ?mfis) collects model fragment instances into the set ?mfis given a scenario microtheory (?sm), domain theory microtheory (?dt), scenario context (?sc), and assumption microtheory (?asn)") :- x_cid(a65b15906577ea).
xc_microtheory(a65b15906577ea,x_QPTheoryMt).
xc_source_file(a65b15906577ea,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577ea,1024).
xc_kb_names(a65b15906577ea,[]).
xc_mapping_rows(a65b15906577ea,[]).
x_isa(x_resolveDsValue,x_BinaryPredicate) :- x_cid(a65b15906577eb).
xc_microtheory(a65b15906577eb,x_QPTheoryMt).
xc_source_file(a65b15906577eb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577eb,1029).
xc_kb_names(a65b15906577eb,[]).
xc_mapping_rows(a65b15906577eb,[]).
x_arity(x_resolveDsValue,2) :- x_cid(a65b15906577ec).
xc_microtheory(a65b15906577ec,x_QPTheoryMt).
xc_source_file(a65b15906577ec,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577ec,1030).
xc_kb_names(a65b15906577ec,[]).
xc_mapping_rows(a65b15906577ec,[]).
x_arg1Isa(x_resolveDsValue,x_Quantity) :- x_cid(a65b15906577ed).
xc_microtheory(a65b15906577ed,x_QPTheoryMt).
xc_source_file(a65b15906577ed,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577ed,1031).
xc_kb_names(a65b15906577ed,[]).
xc_mapping_rows(a65b15906577ed,[]).
x_arg2Isa(x_resolveDsValue,x_PossibleDsValue) :- x_cid(a65b15906577ee).
xc_microtheory(a65b15906577ee,x_QPTheoryMt).
xc_source_file(a65b15906577ee,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577ee,1032).
xc_kb_names(a65b15906577ee,[]).
xc_mapping_rows(a65b15906577ee,[]).
x_comment(x_resolveDsValue,"(resolveDsValue ?q ?value)") :- x_cid(a65b15906577ef).
xc_microtheory(a65b15906577ef,x_QPTheoryMt).
xc_source_file(a65b15906577ef,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577ef,1033).
xc_kb_names(a65b15906577ef,[]).
xc_mapping_rows(a65b15906577ef,[]).
x_isa(x_findInfluencesInState,x_BinaryPredicate) :- x_cid(a65b15906577f0).
xc_microtheory(a65b15906577f0,x_QPTheoryMt).
xc_source_file(a65b15906577f0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577f0,1037).
xc_kb_names(a65b15906577f0,[]).
xc_mapping_rows(a65b15906577f0,[]).
x_arity(x_findInfluencesInState,2) :- x_cid(a65b15906577f1).
xc_microtheory(a65b15906577f1,x_QPTheoryMt).
xc_source_file(a65b15906577f1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577f1,1038).
xc_kb_names(a65b15906577f1,[]).
xc_mapping_rows(a65b15906577f1,[]).
x_arg1Isa(x_findInfluencesInState,x_QualitativeState) :- x_cid(a65b15906577f2).
xc_microtheory(a65b15906577f2,x_QPTheoryMt).
xc_source_file(a65b15906577f2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577f2,1039).
xc_kb_names(a65b15906577f2,[]).
xc_mapping_rows(a65b15906577f2,[]).
x_arg2Isa(x_findInfluencesInState,'x_List-Extensional') :- x_cid(a65b15906577f3).
xc_microtheory(a65b15906577f3,x_QPTheoryMt).
xc_source_file(a65b15906577f3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577f3,1040).
xc_kb_names(a65b15906577f3,[]).
xc_mapping_rows(a65b15906577f3,[]).
x_comment(x_findInfluencesInState,"(findInfluencesInState ?state ?quantities) binds ?quantities to a list representing the influence resolution ordering.") :- x_cid(a65b15906577f4).
xc_microtheory(a65b15906577f4,x_QPTheoryMt).
xc_source_file(a65b15906577f4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577f4,1041).
xc_kb_names(a65b15906577f4,[]).
xc_mapping_rows(a65b15906577f4,[]).
x_isa(x_formulateEntityModel,x_QuintaryPredicate) :- x_cid(a65b15906577f5).
xc_microtheory(a65b15906577f5,x_QPTheoryMt).
xc_source_file(a65b15906577f5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577f5,1043).
xc_kb_names(a65b15906577f5,[]).
xc_mapping_rows(a65b15906577f5,[]).
x_arity(x_formulateEntityModel,5) :- x_cid(a65b15906577f6).
xc_microtheory(a65b15906577f6,x_QPTheoryMt).
xc_source_file(a65b15906577f6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577f6,1044).
xc_kb_names(a65b15906577f6,[]).
xc_mapping_rows(a65b15906577f6,[]).
x_arg1Isa(x_formulateEntityModel,x_Thing) :- x_cid(a65b15906577f7).
xc_microtheory(a65b15906577f7,x_QPTheoryMt).
xc_source_file(a65b15906577f7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577f7,1045).
xc_kb_names(a65b15906577f7,[]).
xc_mapping_rows(a65b15906577f7,[]).
x_arg2Isa(x_formulateEntityModel,x_Microtheory) :- x_cid(a65b15906577f8).
xc_microtheory(a65b15906577f8,x_QPTheoryMt).
xc_source_file(a65b15906577f8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577f8,1046).
xc_kb_names(a65b15906577f8,[]).
xc_mapping_rows(a65b15906577f8,[]).
x_arg3Isa(x_formulateEntityModel,x_Microtheory) :- x_cid(a65b15906577f9).
xc_microtheory(a65b15906577f9,x_QPTheoryMt).
xc_source_file(a65b15906577f9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577f9,1047).
xc_kb_names(a65b15906577f9,[]).
xc_mapping_rows(a65b15906577f9,[]).
x_arg4Isa(x_formulateEntityModel,x_Microtheory) :- x_cid(a65b15906577fa).
xc_microtheory(a65b15906577fa,x_QPTheoryMt).
xc_source_file(a65b15906577fa,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577fa,1048).
xc_kb_names(a65b15906577fa,[]).
xc_mapping_rows(a65b15906577fa,[]).
x_arg5Isa(x_formulateEntityModel,x_Microtheory) :- x_cid(a65b15906577fb).
xc_microtheory(a65b15906577fb,x_QPTheoryMt).
xc_source_file(a65b15906577fb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577fb,1049).
xc_kb_names(a65b15906577fb,[]).
xc_mapping_rows(a65b15906577fb,[]).
x_comment(x_formulateEntityModel,"(formulateEntityModel ?entity ?sm ?dt ?sc ?asn) is an outsourced tell-handler to support goal-directed and incremental model formulation.") :- x_cid(a65b15906577fc).
xc_microtheory(a65b15906577fc,x_QPTheoryMt).
xc_source_file(a65b15906577fc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577fc,1050).
xc_kb_names(a65b15906577fc,[]).
xc_mapping_rows(a65b15906577fc,[]).
x_isa(x_formulateQuantityModel,x_QuintaryPredicate) :- x_cid(a65b15906577fd).
xc_microtheory(a65b15906577fd,x_QPTheoryMt).
xc_source_file(a65b15906577fd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577fd,1052).
xc_kb_names(a65b15906577fd,[]).
xc_mapping_rows(a65b15906577fd,[]).
x_arity(x_formulateQuantityModel,5) :- x_cid(a65b15906577fe).
xc_microtheory(a65b15906577fe,x_QPTheoryMt).
xc_source_file(a65b15906577fe,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577fe,1053).
xc_kb_names(a65b15906577fe,[]).
xc_mapping_rows(a65b15906577fe,[]).
x_arg1Isa(x_formulateQuantityModel,x_Quantity) :- x_cid(a65b15906577ff).
xc_microtheory(a65b15906577ff,x_QPTheoryMt).
xc_source_file(a65b15906577ff,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b15906577ff,1054).
xc_kb_names(a65b15906577ff,[]).
xc_mapping_rows(a65b15906577ff,[]).
x_arg2Isa(x_formulateQuantityModel,x_Microtheory) :- x_cid(a65b1590657800).
xc_microtheory(a65b1590657800,x_QPTheoryMt).
xc_source_file(a65b1590657800,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657800,1055).
xc_kb_names(a65b1590657800,[]).
xc_mapping_rows(a65b1590657800,[]).
x_arg3Isa(x_formulateQuantityModel,x_Microtheory) :- x_cid(a65b1590657801).
xc_microtheory(a65b1590657801,x_QPTheoryMt).
xc_source_file(a65b1590657801,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657801,1056).
xc_kb_names(a65b1590657801,[]).
xc_mapping_rows(a65b1590657801,[]).
x_arg4Isa(x_formulateQuantityModel,x_Microtheory) :- x_cid(a65b1590657802).
xc_microtheory(a65b1590657802,x_QPTheoryMt).
xc_source_file(a65b1590657802,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657802,1057).
xc_kb_names(a65b1590657802,[]).
xc_mapping_rows(a65b1590657802,[]).
x_arg5Isa(x_formulateQuantityModel,x_Microtheory) :- x_cid(a65b1590657803).
xc_microtheory(a65b1590657803,x_QPTheoryMt).
xc_source_file(a65b1590657803,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657803,1058).
xc_kb_names(a65b1590657803,[]).
xc_mapping_rows(a65b1590657803,[]).
x_comment(x_formulateQuantityModel,"(formulateQuantityModel ?quantity ?sm ?dt ?sc ?asn) is an outsourced tell-handler to support goal-directed and incremental model formulation.") :- x_cid(a65b1590657804).
xc_microtheory(a65b1590657804,x_QPTheoryMt).
xc_source_file(a65b1590657804,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657804,1059).
xc_kb_names(a65b1590657804,[]).
xc_mapping_rows(a65b1590657804,[]).
x_isa(x_resolveInfluencesIn,x_UnaryPredicate) :- x_cid(a65b1590657805).
xc_microtheory(a65b1590657805,x_QPTheoryMt).
xc_source_file(a65b1590657805,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657805,1061).
xc_kb_names(a65b1590657805,[]).
xc_mapping_rows(a65b1590657805,[]).
x_arity(x_resolveInfluencesIn,1) :- x_cid(a65b1590657806).
xc_microtheory(a65b1590657806,x_QPTheoryMt).
xc_source_file(a65b1590657806,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657806,1062).
xc_kb_names(a65b1590657806,[]).
xc_mapping_rows(a65b1590657806,[]).
x_comment(x_resolveInfluencesIn,"(resolveInfluencesIn ?state) is a predicate used to invoke influence resolution on ?state, via SOLVE.") :- x_cid(a65b1590657807).
xc_microtheory(a65b1590657807,x_QPTheoryMt).
xc_source_file(a65b1590657807,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657807,1063).
xc_kb_names(a65b1590657807,[]).
xc_mapping_rows(a65b1590657807,[]).
x_arg1Isa(x_resolveInfluencesIn,x_Microtheory) :- x_cid(a65b1590657808).
xc_microtheory(a65b1590657808,x_QPTheoryMt).
xc_source_file(a65b1590657808,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657808,1064).
xc_kb_names(a65b1590657808,[]).
xc_mapping_rows(a65b1590657808,[]).
x_defSuggestion(x_FirstPrinciplesQPAnalysis,x_performQPAnalysis(V1,V2,V3,V4,V5),':subgoals',t(x_formulateQPModel(V2,V3,V4,V5,V6),x_forEffectOnly(x_tell(x_scenarioModelOf(V1,V2))),x_forEffectOnly('x_ist-Information'(V1,x_activeMF(V7))),x_forEffectOnly('x_ist-Information'(V1,x_not(x_activeMF(V7)))),x_resolveInfluencesIn(V1))) :- x_cid(a65b1590657809,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b1590657809,x_QPTheoryMt).
xc_source_file(a65b1590657809,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657809,1073).
xc_kb_names(a65b1590657809,["?state","?scenario-model","?domain-theory","?scenario","?asns-mt","?mfis","?mf"]).
xc_mapping_rows(a65b1590657809,[]).
x_comment(x_FirstPrinciplesQPAnalysis,"FirstPrinciplesQPAnalysis is a suggestion for performQPAnalysis,\n which works by doing model formulation followed by influence resolution. \n Queries about what model fragments are active or not are used to establish\n the process and view structure via backchaining, before IR.") :- x_cid(a65b159065780a).
xc_microtheory(a65b159065780a,x_QPTheoryMt).
xc_source_file(a65b159065780a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065780a,1083).
xc_kb_names(a65b159065780a,[]).
xc_mapping_rows(a65b159065780a,[]).
x_defSuggestion('x_ResolveInfluences-Main',x_resolveInfluencesIn(V1),':subgoals',t(x_findInfluencesInState(V1,V2),x_solveSequentially(V3,V2,x_dsValue(V3,V4)))) :- x_cid(a65b159065780b,V1,V2,V3,V4).
xc_microtheory(a65b159065780b,x_QPTheoryMt).
xc_source_file(a65b159065780b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065780b,1089).
xc_kb_names(a65b159065780b,["?state","?quantities","?q","?value"]).
xc_mapping_rows(a65b159065780b,[]).
x_comment('x_ResolveInfluences-Main',"ResolveInfluences-Main is the backbone for resolving influences.\n It uses an outsourced predicate, findInfluencesInState, to get a list\n of relevant quantities in sorted order, then solves dsValue for each in turn.\n Ambiguity handling is controlled via inheritance.  See IR-BranchOnAmbiguityStrategyMt\n and IR-Propagate-AmbibguityStrategyMt for details.") :- x_cid(a65b159065780c).
xc_microtheory(a65b159065780c,x_QPTheoryMt).
xc_source_file(a65b159065780c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065780c,1096).
xc_kb_names(a65b159065780c,[]).
xc_mapping_rows(a65b159065780c,[]).
x_defSuggestion(x_SolveDsViaModel,x_dsValue(V1,V2),':subgoals',t(x_resolveDsValue(V1,V2),x_different(V2,x_Ambig),x_different(V2,x_Unknown))) :- x_cid(a65b159065780d,V1,V2).
xc_microtheory(a65b159065780d,x_QPTheoryMt).
xc_source_file(a65b159065780d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065780d,1107).
xc_kb_names(a65b159065780d,["?q","?value"]).
xc_mapping_rows(a65b159065780d,[]).
x_isa('x_IR-BranchOnAmbiguityStrategyMt',x_Microtheory) :- x_cid(a65b159065780e).
xc_microtheory(a65b159065780e,x_QPTheoryMt).
xc_source_file(a65b159065780e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065780e,1120).
xc_kb_names(a65b159065780e,[]).
xc_mapping_rows(a65b159065780e,[]).
x_comment('x_IR-BranchOnAmbiguityStrategyMt',"IR-BranchOnAmbiguityStrategyMt contains the strategy of branching\n   on all possible values in response to ambiguous influences on a quantity.") :- x_cid(a65b159065780f).
xc_microtheory(a65b159065780f,x_QPTheoryMt).
xc_source_file(a65b159065780f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065780f,1121).
xc_kb_names(a65b159065780f,[]).
xc_mapping_rows(a65b159065780f,[]).
x_defSuggestion('x_SolveDsViaGuessing-1',x_dsValue(V1,V2),':subgoals',t(x_resolveDsValue(V1,V3),x_unifies(V3,x_Ambig),x_unifies(V2,-1))) :- x_cid(a65b1590657810,V1,V2,V3).
xc_microtheory(a65b1590657810,'x_IR-BranchOnAmbiguityStrategyMt').
xc_source_file(a65b1590657810,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657810,1127).
xc_kb_names(a65b1590657810,["?q","?value","?result"]).
xc_mapping_rows(a65b1590657810,[]).
x_defSuggestion(x_SolveDsViaGuessing0,x_dsValue(V1,V2),':subgoals',t(x_resolveDsValue(V1,V3),x_unifies(V3,x_Ambig),x_unifies(V2,0))) :- x_cid(a65b1590657811,V1,V2,V3).
xc_microtheory(a65b1590657811,'x_IR-BranchOnAmbiguityStrategyMt').
xc_source_file(a65b1590657811,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657811,1133).
xc_kb_names(a65b1590657811,["?q","?value","?result"]).
xc_mapping_rows(a65b1590657811,[]).
x_defSuggestion(x_SolveDsViaGuessing1,x_dsValue(V1,V2),':subgoals',t(x_resolveDsValue(V1,V3),x_unifies(V3,x_Ambig),x_unifies(V2,1))) :- x_cid(a65b1590657812,V1,V2,V3).
xc_microtheory(a65b1590657812,'x_IR-BranchOnAmbiguityStrategyMt').
xc_source_file(a65b1590657812,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657812,1139).
xc_kb_names(a65b1590657812,["?q","?value","?result"]).
xc_mapping_rows(a65b1590657812,[]).
x_isa('x_IR-PropagateAmbiguityStrategyMt',x_Microtheory) :- x_cid(a65b1590657813).
xc_microtheory(a65b1590657813,x_BaseKB).
xc_source_file(a65b1590657813,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657813,1146).
xc_kb_names(a65b1590657813,[]).
xc_mapping_rows(a65b1590657813,[]).
x_comment('x_IR-PropagateAmbiguityStrategyMt',"IR-PropagateAmbiguityStrategyMt contains the strategy of passing along a value\n representing that a value is ambiguous in response to ambiguous influences\n on a quantity.") :- x_cid(a65b1590657814).
xc_microtheory(a65b1590657814,x_BaseKB).
xc_source_file(a65b1590657814,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657814,1147).
xc_kb_names(a65b1590657814,[]).
xc_mapping_rows(a65b1590657814,[]).
x_defSuggestion(x_SolveDsViaAmbiguityPropagation,x_dsValue(V1,V2),':test',x_TheEmptyList,':subgoals',t(x_resolveDsValue(V1,V3),x_unifies(V3,x_Ambig),x_unifies(V2,x_Ambig))) :- x_cid(a65b1590657815,V1,V2,V3).
xc_microtheory(a65b1590657815,'x_IR-PropagateAmbiguityStrategyMt').
xc_source_file(a65b1590657815,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657815,1154).
xc_kb_names(a65b1590657815,["?q","?value","?result"]).
xc_mapping_rows(a65b1590657815,[warnings("Empty expression outside a declared list-data slot retained as x_TheEmptyList.")]).
xc_warnings(a65b1590657815,["Empty expression outside a declared list-data slot retained as x_TheEmptyList."]).
x_isa(x_LimitHypothesis,x_Collection) :- x_cid(a65b1590657816).
xc_microtheory(a65b1590657816,x_QPTheoryMt).
xc_source_file(a65b1590657816,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657816,1167).
xc_kb_names(a65b1590657816,[]).
xc_mapping_rows(a65b1590657816,[]).
x_genls(x_LimitHypothesis,'x_CycLSentence-Assertible') :- x_cid(a65b1590657817).
xc_microtheory(a65b1590657817,x_QPTheoryMt).
xc_source_file(a65b1590657817,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657817,1168).
xc_kb_names(a65b1590657817,[]).
xc_mapping_rows(a65b1590657817,[]).
x_comment(x_LimitHypothesis,"Instances of LimitHypothesis are possible changes in ordinal relationships\n with a qualitative model of a dynamical system that indicate potential changes\n in qualitative state.  Generally there can be several possible changes, and\n sometimes multiple changes can occur at once.  These hypotheses only represent\n possible change(s) in ordinal relationships; finding what state(s) result when\n they occur is performed via limit analysis, one of the basic operations of \n qualitative process theory.  Limit hypotheses can also be specified within\n situation-specific explanations, as found in textbooks.") :- x_cid(a65b1590657818).
xc_microtheory(a65b1590657818,x_QPTheoryMt).
xc_source_file(a65b1590657818,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657818,1169).
xc_kb_names(a65b1590657818,[]).
xc_mapping_rows(a65b1590657818,[]).
x_isa(x_SingleLimitHypothesis,x_Collection) :- x_cid(a65b1590657819).
xc_microtheory(a65b1590657819,x_QPTheoryMt).
xc_source_file(a65b1590657819,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657819,1178).
xc_kb_names(a65b1590657819,[]).
xc_mapping_rows(a65b1590657819,[]).
x_genls(x_SingleLimitHypothesis,x_LimitHypothesis) :- x_cid(a65b159065781a).
xc_microtheory(a65b159065781a,x_QPTheoryMt).
xc_source_file(a65b159065781a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065781a,1179).
xc_kb_names(a65b159065781a,[]).
xc_mapping_rows(a65b159065781a,[]).
x_comment(x_SingleLimitHypothesis,"A SingleLimitHypothesis is the hypothesis that exactly one ordinal relationship\n is changing.  Single limit hypotheses are specified as NATs, using LhFn.") :- x_cid(a65b159065781b).
xc_microtheory(a65b159065781b,x_QPTheoryMt).
xc_source_file(a65b159065781b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065781b,1180).
xc_kb_names(a65b159065781b,[]).
xc_mapping_rows(a65b159065781b,[]).
x_isa(x_applicableLh,x_BinaryPredicate) :- x_cid(a65b159065781c).
xc_microtheory(a65b159065781c,x_QPTheoryMt).
xc_source_file(a65b159065781c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065781c,1184).
xc_kb_names(a65b159065781c,[]).
xc_mapping_rows(a65b159065781c,[]).
x_arity(x_applicableLh,2) :- x_cid(a65b159065781d).
xc_microtheory(a65b159065781d,x_QPTheoryMt).
xc_source_file(a65b159065781d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065781d,1185).
xc_kb_names(a65b159065781d,[]).
xc_mapping_rows(a65b159065781d,[]).
x_arg1Isa(x_applicableLh,x_QualitativeState) :- x_cid(a65b159065781e).
xc_microtheory(a65b159065781e,x_QPTheoryMt).
xc_source_file(a65b159065781e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065781e,1186).
xc_kb_names(a65b159065781e,[]).
xc_mapping_rows(a65b159065781e,[]).
x_arg2Isa(x_applicableLh,x_LimitHypothesis) :- x_cid(a65b159065781f).
xc_microtheory(a65b159065781f,x_QPTheoryMt).
xc_source_file(a65b159065781f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065781f,1187).
xc_kb_names(a65b159065781f,[]).
xc_mapping_rows(a65b159065781f,[]).
x_comment(x_applicableLh,"(applicableLh <state> <lh>) indicates that the limit hypothesis <lh>\n is applicable to qualitatve state <state>).  Single change LHs are found via\n rules, multiple-change LHs are introduced dynamically by code as needed.") :- x_cid(a65b1590657820).
xc_microtheory(a65b1590657820,x_QPTheoryMt).
xc_source_file(a65b1590657820,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657820,1188).
xc_kb_names(a65b1590657820,[]).
xc_mapping_rows(a65b1590657820,[]).
x_isa(x_ordinalLimitCondition,x_BinaryPredicate) :- x_cid(a65b1590657821).
xc_microtheory(a65b1590657821,x_QPTheoryMt).
xc_source_file(a65b1590657821,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657821,1193).
xc_kb_names(a65b1590657821,[]).
xc_mapping_rows(a65b1590657821,[]).
x_arity(x_ordinalLimitCondition,2) :- x_cid(a65b1590657822).
xc_microtheory(a65b1590657822,x_QPTheoryMt).
xc_source_file(a65b1590657822,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657822,1194).
xc_kb_names(a65b1590657822,[]).
xc_mapping_rows(a65b1590657822,[]).
x_arg2Isa(x_ordinalLimitCondition,x_ContinuousQuantity) :- x_cid(a65b1590657823).
xc_microtheory(a65b1590657823,x_QPTheoryMt).
xc_source_file(a65b1590657823,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657823,1195).
xc_kb_names(a65b1590657823,[]).
xc_mapping_rows(a65b1590657823,[]).
x_arg3Isa(x_ordinalLimitCondition,x_ContinuousQuantity) :- x_cid(a65b1590657824).
xc_microtheory(a65b1590657824,x_QPTheoryMt).
xc_source_file(a65b1590657824,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657824,1196).
xc_kb_names(a65b1590657824,[]).
xc_mapping_rows(a65b1590657824,[]).
x_comment(x_ordinalLimitCondition,"(ordinalLimitCondition <q1> <q2>) indicates that <q1> and <q2>\n is one of the ordinals that defines the current qualitative\n state.  This implies that changes in their relationship can lead to\n qualitative state changes.") :- x_cid(a65b1590657825).
xc_microtheory(a65b1590657825,x_QPTheoryMt).
xc_source_file(a65b1590657825,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657825,1197).
xc_kb_names(a65b1590657825,[]).
xc_mapping_rows(a65b1590657825,[]).
x_isa(x_possibleOrdinalChange,x_QuaternaryPredicate) :- x_cid(a65b1590657826).
xc_microtheory(a65b1590657826,x_QPTheoryMt).
xc_source_file(a65b1590657826,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657826,1203).
xc_kb_names(a65b1590657826,[]).
xc_mapping_rows(a65b1590657826,[]).
x_arity(x_possibleOrdinalChange,4) :- x_cid(a65b1590657827).
xc_microtheory(a65b1590657827,x_QPTheoryMt).
xc_source_file(a65b1590657827,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657827,1204).
xc_kb_names(a65b1590657827,[]).
xc_mapping_rows(a65b1590657827,[]).
x_arg1Isa(x_possibleOrdinalChange,x_FluentOrdinalPredicate) :- x_cid(a65b1590657828).
xc_microtheory(a65b1590657828,x_QPTheoryMt).
xc_source_file(a65b1590657828,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657828,1205).
xc_kb_names(a65b1590657828,[]).
xc_mapping_rows(a65b1590657828,[]).
x_arg2Isa(x_possibleOrdinalChange,x_KnownDsValue) :- x_cid(a65b1590657829).
xc_microtheory(a65b1590657829,x_QPTheoryMt).
xc_source_file(a65b1590657829,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657829,1206).
xc_kb_names(a65b1590657829,[]).
xc_mapping_rows(a65b1590657829,[]).
x_arg3Isa(x_possibleOrdinalChange,x_KnownDsValue) :- x_cid(a65b159065782a).
xc_microtheory(a65b159065782a,x_QPTheoryMt).
xc_source_file(a65b159065782a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065782a,1207).
xc_kb_names(a65b159065782a,[]).
xc_mapping_rows(a65b159065782a,[]).
x_arg4Isa(x_possibleOrdinalChange,x_FluentOrdinalPredicate) :- x_cid(a65b159065782b).
xc_microtheory(a65b159065782b,x_QPTheoryMt).
xc_source_file(a65b159065782b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065782b,1208).
xc_kb_names(a65b159065782b,[]).
xc_mapping_rows(a65b159065782b,[]).
x_possibleOrdinalChange(x_qGreaterThan,-1,-1,x_qEqualTo) :- x_cid(a65b159065782c).
xc_microtheory(a65b159065782c,x_QPTheoryMt).
xc_source_file(a65b159065782c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065782c,1213).
xc_kb_names(a65b159065782c,[]).
xc_mapping_rows(a65b159065782c,[]).
x_possibleOrdinalChange(x_qGreaterThan,-1,0,x_qEqualTo) :- x_cid(a65b159065782d).
xc_microtheory(a65b159065782d,x_QPTheoryMt).
xc_source_file(a65b159065782d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065782d,1214).
xc_kb_names(a65b159065782d,[]).
xc_mapping_rows(a65b159065782d,[]).
x_possibleOrdinalChange(x_qGreaterThan,-1,1,x_qEqualTo) :- x_cid(a65b159065782e).
xc_microtheory(a65b159065782e,x_QPTheoryMt).
xc_source_file(a65b159065782e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065782e,1215).
xc_kb_names(a65b159065782e,[]).
xc_mapping_rows(a65b159065782e,[]).
x_possibleOrdinalChange(x_qGreaterThan,0,1,x_qEqualTo) :- x_cid(a65b159065782f).
xc_microtheory(a65b159065782f,x_QPTheoryMt).
xc_source_file(a65b159065782f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065782f,1216).
xc_kb_names(a65b159065782f,[]).
xc_mapping_rows(a65b159065782f,[]).
x_possibleOrdinalChange(x_qGreaterThan,1,1,x_qEqualTo) :- x_cid(a65b1590657830).
xc_microtheory(a65b1590657830,x_QPTheoryMt).
xc_source_file(a65b1590657830,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657830,1217).
xc_kb_names(a65b1590657830,[]).
xc_mapping_rows(a65b1590657830,[]).
x_possibleOrdinalChange(x_qEqualTo,-1,-1,x_qGreaterThan) :- x_cid(a65b1590657831).
xc_microtheory(a65b1590657831,x_QPTheoryMt).
xc_source_file(a65b1590657831,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657831,1220).
xc_kb_names(a65b1590657831,[]).
xc_mapping_rows(a65b1590657831,[]).
x_possibleOrdinalChange(x_qEqualTo,-1,-1,x_qLessThan) :- x_cid(a65b1590657832).
xc_microtheory(a65b1590657832,x_QPTheoryMt).
xc_source_file(a65b1590657832,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657832,1221).
xc_kb_names(a65b1590657832,[]).
xc_mapping_rows(a65b1590657832,[]).
x_possibleOrdinalChange(x_qEqualTo,-1,0,x_qLessThan) :- x_cid(a65b1590657833).
xc_microtheory(a65b1590657833,x_QPTheoryMt).
xc_source_file(a65b1590657833,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657833,1222).
xc_kb_names(a65b1590657833,[]).
xc_mapping_rows(a65b1590657833,[]).
x_possibleOrdinalChange(x_qEqualTo,-1,1,x_qLessThan) :- x_cid(a65b1590657834).
xc_microtheory(a65b1590657834,x_QPTheoryMt).
xc_source_file(a65b1590657834,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657834,1223).
xc_kb_names(a65b1590657834,[]).
xc_mapping_rows(a65b1590657834,[]).
x_possibleOrdinalChange(x_qEqualTo,0,-1,x_qGreaterThan) :- x_cid(a65b1590657835).
xc_microtheory(a65b1590657835,x_QPTheoryMt).
xc_source_file(a65b1590657835,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657835,1224).
xc_kb_names(a65b1590657835,[]).
xc_mapping_rows(a65b1590657835,[]).
x_possibleOrdinalChange(x_qEqualTo,0,1,x_qLessThan) :- x_cid(a65b1590657836).
xc_microtheory(a65b1590657836,x_QPTheoryMt).
xc_source_file(a65b1590657836,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657836,1225).
xc_kb_names(a65b1590657836,[]).
xc_mapping_rows(a65b1590657836,[]).
x_possibleOrdinalChange(x_qEqualTo,1,-1,x_qGreaterThan) :- x_cid(a65b1590657837).
xc_microtheory(a65b1590657837,x_QPTheoryMt).
xc_source_file(a65b1590657837,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657837,1226).
xc_kb_names(a65b1590657837,[]).
xc_mapping_rows(a65b1590657837,[]).
x_possibleOrdinalChange(x_qEqualTo,1,0,x_qGreaterThan) :- x_cid(a65b1590657838).
xc_microtheory(a65b1590657838,x_QPTheoryMt).
xc_source_file(a65b1590657838,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657838,1227).
xc_kb_names(a65b1590657838,[]).
xc_mapping_rows(a65b1590657838,[]).
x_possibleOrdinalChange(x_qEqualTo,1,1,x_qGreaterThan) :- x_cid(a65b1590657839).
xc_microtheory(a65b1590657839,x_QPTheoryMt).
xc_source_file(a65b1590657839,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657839,1228).
xc_kb_names(a65b1590657839,[]).
xc_mapping_rows(a65b1590657839,[]).
x_possibleOrdinalChange(x_qEqualTo,1,1,x_qLessThan) :- x_cid(a65b159065783a).
xc_microtheory(a65b159065783a,x_QPTheoryMt).
xc_source_file(a65b159065783a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065783a,1229).
xc_kb_names(a65b159065783a,[]).
xc_mapping_rows(a65b159065783a,[]).
x_possibleOrdinalChange(x_qLessThan,-1,-1,x_qEqualTo) :- x_cid(a65b159065783b).
xc_microtheory(a65b159065783b,x_QPTheoryMt).
xc_source_file(a65b159065783b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065783b,1231).
xc_kb_names(a65b159065783b,[]).
xc_mapping_rows(a65b159065783b,[]).
x_possibleOrdinalChange(x_qLessThan,0,-1,x_qEqualTo) :- x_cid(a65b159065783c).
xc_microtheory(a65b159065783c,x_QPTheoryMt).
xc_source_file(a65b159065783c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065783c,1232).
xc_kb_names(a65b159065783c,[]).
xc_mapping_rows(a65b159065783c,[]).
x_possibleOrdinalChange(x_qLessThan,1,-1,x_qEqualTo) :- x_cid(a65b159065783d).
xc_microtheory(a65b159065783d,x_QPTheoryMt).
xc_source_file(a65b159065783d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065783d,1233).
xc_kb_names(a65b159065783d,[]).
xc_mapping_rows(a65b159065783d,[]).
x_possibleOrdinalChange(x_qLessThan,1,0,x_qEqualTo) :- x_cid(a65b159065783e).
xc_microtheory(a65b159065783e,x_QPTheoryMt).
xc_source_file(a65b159065783e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065783e,1234).
xc_kb_names(a65b159065783e,[]).
xc_mapping_rows(a65b159065783e,[]).
x_possibleOrdinalChange(x_qLessThan,1,1,x_qEqualTo) :- x_cid(a65b159065783f).
xc_microtheory(a65b159065783f,x_QPTheoryMt).
xc_source_file(a65b159065783f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065783f,1235).
xc_kb_names(a65b159065783f,[]).
xc_mapping_rows(a65b159065783f,[]).
x_dsValue(x_Zero,0) :- x_cid(a65b1590657840).
xc_microtheory(a65b1590657840,x_QPTheoryMt).
xc_source_file(a65b1590657840,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657840,1244).
xc_kb_names(a65b1590657840,[]).
xc_mapping_rows(a65b1590657840,[]).
x_isa(x_ConjunctiveLimitHypothesis,x_Collection) :- x_cid(a65b1590657841).
xc_microtheory(a65b1590657841,x_QPTheoryMt).
xc_source_file(a65b1590657841,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657841,1246).
xc_kb_names(a65b1590657841,[]).
xc_mapping_rows(a65b1590657841,[]).
x_genls(x_ConjunctiveLimitHypothesis,x_LimitHypothesis) :- x_cid(a65b1590657842).
xc_microtheory(a65b1590657842,x_QPTheoryMt).
xc_source_file(a65b1590657842,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657842,1247).
xc_kb_names(a65b1590657842,[]).
xc_mapping_rows(a65b1590657842,[]).
x_comment(x_ConjunctiveLimitHypothesis,"A ConjunctiveLimitHypothesis is the hypothesis that set of ordinal relationships\n is changing at the same time.  Such conjunctive changes are often mandated by the\n qualitative mathematics of a situation, or as coincidences in independently changing\n parts of the system being modeled.  Conjunctive limit hypotheses are specified\n as NATs, using ClhFn.") :- x_cid(a65b1590657843).
xc_microtheory(a65b1590657843,x_QPTheoryMt).
xc_source_file(a65b1590657843,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657843,1248).
xc_kb_names(a65b1590657843,[]).
xc_mapping_rows(a65b1590657843,[]).
x_isa(x_LhFn,'x_Function-Denotational') :- x_cid(a65b1590657844).
xc_microtheory(a65b1590657844,x_QPTheoryMt).
xc_source_file(a65b1590657844,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657844,1255).
xc_kb_names(a65b1590657844,[]).
xc_mapping_rows(a65b1590657844,[]).
x_arity(x_LhFn,4) :- x_cid(a65b1590657845).
xc_microtheory(a65b1590657845,x_QPTheoryMt).
xc_source_file(a65b1590657845,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657845,1256).
xc_kb_names(a65b1590657845,[]).
xc_mapping_rows(a65b1590657845,[]).
x_arg1Isa(x_LhFn,x_ContinuousQuantity) :- x_cid(a65b1590657846).
xc_microtheory(a65b1590657846,x_QPTheoryMt).
xc_source_file(a65b1590657846,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657846,1257).
xc_kb_names(a65b1590657846,[]).
xc_mapping_rows(a65b1590657846,[]).
x_arg2Isa(x_LhFn,x_ContinuousQuantity) :- x_cid(a65b1590657847).
xc_microtheory(a65b1590657847,x_QPTheoryMt).
xc_source_file(a65b1590657847,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657847,1258).
xc_kb_names(a65b1590657847,[]).
xc_mapping_rows(a65b1590657847,[]).
x_arg3Isa(x_LhFn,x_FluentOrdinalPredicate) :- x_cid(a65b1590657848).
xc_microtheory(a65b1590657848,x_QPTheoryMt).
xc_source_file(a65b1590657848,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657848,1259).
xc_kb_names(a65b1590657848,[]).
xc_mapping_rows(a65b1590657848,[]).
x_arg4Isa(x_LhFn,x_FluentOrdinalPredicate) :- x_cid(a65b1590657849).
xc_microtheory(a65b1590657849,x_QPTheoryMt).
xc_source_file(a65b1590657849,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657849,1260).
xc_kb_names(a65b1590657849,[]).
xc_mapping_rows(a65b1590657849,[]).
x_resultIsa(x_LhFn,x_LimitHypothesis) :- x_cid(a65b159065784a).
xc_microtheory(a65b159065784a,x_QPTheoryMt).
xc_source_file(a65b159065784a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065784a,1261).
xc_kb_names(a65b159065784a,[]).
xc_mapping_rows(a65b159065784a,[]).
x_comment(x_LhFn,"(LhFn <q1> <q2> <before> <after>) denotes the limit hypothesis that the\n ordinal relationship between <q1> and <q2> changes from <before> to <after>).\n Limit hypotheses are defined in qualitative process theory.  <q1> and <q2> are\n not arbitrary, they are quantity conditions upon which aspects of dynamical\n state depend.  Hence changes in them correspond to changes in qualitative state.") :- x_cid(a65b159065784b).
xc_microtheory(a65b159065784b,x_QPTheoryMt).
xc_source_file(a65b159065784b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065784b,1262).
xc_kb_names(a65b159065784b,[]).
xc_mapping_rows(a65b159065784b,[]).
x_isa(x_lhsForQState,x_BinaryRelation) :- x_cid(a65b159065784c).
xc_microtheory(a65b159065784c,x_QPTheoryMt).
xc_source_file(a65b159065784c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065784c,1269).
xc_kb_names(a65b159065784c,[]).
xc_mapping_rows(a65b159065784c,[]).
x_arity(x_lhsForQstate,2) :- x_cid(a65b159065784d).
xc_microtheory(a65b159065784d,x_QPTheoryMt).
xc_source_file(a65b159065784d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065784d,1270).
xc_kb_names(a65b159065784d,[]).
xc_mapping_rows(a65b159065784d,[]).
x_arg1Isa(x_lhsForQstate,x_QualitativeState) :- x_cid(a65b159065784e).
xc_microtheory(a65b159065784e,x_QPTheoryMt).
xc_source_file(a65b159065784e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065784e,1271).
xc_kb_names(a65b159065784e,[]).
xc_mapping_rows(a65b159065784e,[]).
x_arg2Isa(x_lhsForQstate,'x_Set-Extensional') :- x_cid(a65b159065784f).
xc_microtheory(a65b159065784f,x_QPTheoryMt).
xc_source_file(a65b159065784f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065784f,1272).
xc_kb_names(a65b159065784f,[]).
xc_mapping_rows(a65b159065784f,[]).
x_comment(x_lhsForQstate,"(lhsForQstate <Qs> <lhs>) indicates that the non-redundant set of lhs potentially\n  applicable to <Qs> is the set <lhs>.") :- x_cid(a65b1590657850).
xc_microtheory(a65b1590657850,x_QPTheoryMt).
xc_source_file(a65b1590657850,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657850,1273).
xc_kb_names(a65b1590657850,[]).
xc_mapping_rows(a65b1590657850,[]).
x_isa(x_ClhFn,x_VariableArityFunction) :- x_cid(a65b1590657851).
xc_microtheory(a65b1590657851,x_QPTheoryMt).
xc_source_file(a65b1590657851,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657851,1277).
xc_kb_names(a65b1590657851,[]).
xc_mapping_rows(a65b1590657851,[]).
x_arityMin(x_ClhFn,2) :- x_cid(a65b1590657852).
xc_microtheory(a65b1590657852,x_QPTheoryMt).
xc_source_file(a65b1590657852,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657852,1278).
xc_kb_names(a65b1590657852,[]).
xc_mapping_rows(a65b1590657852,[]).
x_argsIsa(x_ClhFn,x_SingleLimitHypothesis) :- x_cid(a65b1590657853).
xc_microtheory(a65b1590657853,x_QPTheoryMt).
xc_source_file(a65b1590657853,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657853,1279).
xc_kb_names(a65b1590657853,[]).
xc_mapping_rows(a65b1590657853,[]).
x_resultIsa(x_ConjunctiveLimitHypothesis) :- x_cid(a65b1590657854).
xc_microtheory(a65b1590657854,x_QPTheoryMt).
xc_source_file(a65b1590657854,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657854,1280).
xc_kb_names(a65b1590657854,[]).
xc_mapping_rows(a65b1590657854,[]).
x_comment(x_ClhFn,"(ClhFn . <single LH's>) denotes the limit hypothesis that the conjunction of\n changes represented by <single LH's> all occur at the same time.") :- x_cid(a65b1590657855).
xc_microtheory(a65b1590657855,x_QPTheoryMt).
xc_source_file(a65b1590657855,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657855,1281).
xc_kb_names(a65b1590657855,[]).
xc_mapping_rows(a65b1590657855,[]).
x_isa(x_possibleQstateTransition,x_TernaryRelation) :- x_cid(a65b1590657856).
xc_microtheory(a65b1590657856,x_QPTheoryMt).
xc_source_file(a65b1590657856,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657856,1285).
xc_kb_names(a65b1590657856,[]).
xc_mapping_rows(a65b1590657856,[]).
x_arity(x_possibleQstateTransition,3) :- x_cid(a65b1590657857).
xc_microtheory(a65b1590657857,x_QPTheoryMt).
xc_source_file(a65b1590657857,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657857,1286).
xc_kb_names(a65b1590657857,[]).
xc_mapping_rows(a65b1590657857,[]).
x_arg1Isa(x_possibleQstateTransition,x_QualitativeState) :- x_cid(a65b1590657858).
xc_microtheory(a65b1590657858,x_QPTheoryMt).
xc_source_file(a65b1590657858,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657858,1287).
xc_kb_names(a65b1590657858,[]).
xc_mapping_rows(a65b1590657858,[]).
x_arg2Isa(x_possibleQstateTransition,x_LimitHypothesis) :- x_cid(a65b1590657859).
xc_microtheory(a65b1590657859,x_QPTheoryMt).
xc_source_file(a65b1590657859,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657859,1288).
xc_kb_names(a65b1590657859,[]).
xc_mapping_rows(a65b1590657859,[]).
x_arg3Isa(x_possibleQstateTransition,x_QualitativeState) :- x_cid(a65b159065785a).
xc_microtheory(a65b159065785a,x_QPTheoryMt).
xc_source_file(a65b159065785a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065785a,1289).
xc_kb_names(a65b159065785a,[]).
xc_mapping_rows(a65b159065785a,[]).
x_comment(x_possibleQstateTransition,"(possibleQstateTransition <qs1> <lh> <qs2>) indicates that a transition\n to <qs2> is possible from <qs1>, with <lh> as the explanation.") :- x_cid(a65b159065785b).
xc_microtheory(a65b159065785b,x_QPTheoryMt).
xc_source_file(a65b159065785b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065785b,1290).
xc_kb_names(a65b159065785b,[]).
xc_mapping_rows(a65b159065785b,[]).
x_isa(x_filteredQstateTransition,x_TernaryRelation) :- x_cid(a65b159065785c).
xc_microtheory(a65b159065785c,x_QPTheoryMt).
xc_source_file(a65b159065785c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065785c,1294).
xc_kb_names(a65b159065785c,[]).
xc_mapping_rows(a65b159065785c,[]).
x_arity(x_filteredQstateTransition,3) :- x_cid(a65b159065785d).
xc_microtheory(a65b159065785d,x_QPTheoryMt).
xc_source_file(a65b159065785d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065785d,1295).
xc_kb_names(a65b159065785d,[]).
xc_mapping_rows(a65b159065785d,[]).
x_arg1Isa(x_filteredQstateTransition,x_QualitativeState) :- x_cid(a65b159065785e).
xc_microtheory(a65b159065785e,x_QPTheoryMt).
xc_source_file(a65b159065785e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065785e,1296).
xc_kb_names(a65b159065785e,[]).
xc_mapping_rows(a65b159065785e,[]).
x_arg2Isa(x_filteredQstateTransition,x_LimitHypothesis) :- x_cid(a65b159065785f).
xc_microtheory(a65b159065785f,x_QPTheoryMt).
xc_source_file(a65b159065785f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065785f,1297).
xc_kb_names(a65b159065785f,[]).
xc_mapping_rows(a65b159065785f,[]).
x_arg3Isa(x_filteredQstateTransition,x_QualitativeState) :- x_cid(a65b1590657860).
xc_microtheory(a65b1590657860,x_QPTheoryMt).
xc_source_file(a65b1590657860,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657860,1298).
xc_kb_names(a65b1590657860,[]).
xc_mapping_rows(a65b1590657860,[]).
x_comment(x_filteredQstateTransition,"(filteredQstateTransition <qs1> <lh> <qs2>) indicates that a transition\n to <qs2> is not possible from <qs1> via <lh>, since there is a closer state.") :- x_cid(a65b1590657861).
xc_microtheory(a65b1590657861,x_QPTheoryMt).
xc_source_file(a65b1590657861,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657861,1299).
xc_kb_names(a65b1590657861,[]).
xc_mapping_rows(a65b1590657861,[]).
x_isa(x_IntervalDurationEvent,x_Collection) :- x_cid(a65b1590657862).
xc_microtheory(a65b1590657862,x_QPTheoryMt).
xc_source_file(a65b1590657862,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657862,1303).
xc_kb_names(a65b1590657862,[]).
xc_mapping_rows(a65b1590657862,[]).
x_genls(x_IntervalDurationEvent,x_Event) :- x_cid(a65b1590657863).
xc_microtheory(a65b1590657863,x_QPTheoryMt).
xc_source_file(a65b1590657863,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657863,1304).
xc_kb_names(a65b1590657863,[]).
xc_mapping_rows(a65b1590657863,[]).
x_comment(x_IntervalDurationEvent,"An instance of IntervalDurationEvent is an event that last an interval\n of time, longer than an instant.") :- x_cid(a65b1590657864).
xc_microtheory(a65b1590657864,x_QPTheoryMt).
xc_source_file(a65b1590657864,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657864,1305).
xc_kb_names(a65b1590657864,[]).
xc_mapping_rows(a65b1590657864,[]).
x_disjointWith(x_InstantaneousEvent,x_IntervalDurationEvent) :- x_cid(a65b1590657865).
xc_microtheory(a65b1590657865,x_QPTheoryMt).
xc_source_file(a65b1590657865,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657865,1308).
xc_kb_names(a65b1590657865,[]).
xc_mapping_rows(a65b1590657865,[]).
x_isa(x_contradictoryOrdinals,x_BinaryRelation) :- x_cid(a65b1590657866).
xc_microtheory(a65b1590657866,x_QPTheoryMt).
xc_source_file(a65b1590657866,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657866,1310).
xc_kb_names(a65b1590657866,[]).
xc_mapping_rows(a65b1590657866,[]).
x_arity(x_contradictoryOrdinals,2) :- x_cid(a65b1590657867).
xc_microtheory(a65b1590657867,x_QPTheoryMt).
xc_source_file(a65b1590657867,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657867,1311).
xc_kb_names(a65b1590657867,[]).
xc_mapping_rows(a65b1590657867,[]).
x_arg1Isa(x_contradictoryOrdinals,x_ContinuousQuantity) :- x_cid(a65b1590657868).
xc_microtheory(a65b1590657868,x_QPTheoryMt).
xc_source_file(a65b1590657868,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657868,1312).
xc_kb_names(a65b1590657868,[]).
xc_mapping_rows(a65b1590657868,[]).
x_arg2Isa(x_contradictoryOrdinals,x_ContinuousQuantity) :- x_cid(a65b1590657869).
xc_microtheory(a65b1590657869,x_QPTheoryMt).
xc_source_file(a65b1590657869,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657869,1313).
xc_kb_names(a65b1590657869,[]).
xc_mapping_rows(a65b1590657869,[]).
x_comment(x_contradictoryOrdinals,"(contradictoryOrdinals ?q1 ?q2) indicates that, in the current logical\n enviornment, the assumptions imply a contradiction involving the ordinal relationships\n between ?q1 and ?q2.  Intended for checking consistentcy of proposed qualitative states.") :- x_cid(a65b159065786a).
xc_microtheory(a65b159065786a,x_QPTheoryMt).
xc_source_file(a65b159065786a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065786a,1314).
xc_kb_names(a65b159065786a,[]).
xc_mapping_rows(a65b159065786a,[]).
'x_<=='(x_contradictoryOrdinals(V1,V2),x_wmOnly(x_lookupOnly(x_localOnly(x_qGreaterThan(V1,V2)))),x_wmOnly(x_qLessThan(V1,V2))) :- x_cid(a65b159065786b,V1,V2).
xc_microtheory(a65b159065786b,x_QPTheoryMt).
xc_source_file(a65b159065786b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065786b,1319).
xc_kb_names(a65b159065786b,["?q1","?q2"]).
xc_mapping_rows(a65b159065786b,[]).
'x_<=='(x_contradictoryOrdinals(V1,V2),x_wmOnly(x_lookupOnly(x_localOnly(x_qGreaterThan(V1,V2)))),x_wmOnly(x_qEqualTo(V1,V2))) :- x_cid(a65b159065786c,V1,V2).
xc_microtheory(a65b159065786c,x_QPTheoryMt).
xc_source_file(a65b159065786c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065786c,1323).
xc_kb_names(a65b159065786c,["?q1","?q2"]).
xc_mapping_rows(a65b159065786c,[]).
'x_<=='(x_contradictoryOrdinals(V1,V2),x_wmOnly(x_lookupOnly(x_localOnly(x_qLessThan(V1,V2)))),x_wmOnly(x_qEqualTo(V1,V2))) :- x_cid(a65b159065786d,V1,V2).
xc_microtheory(a65b159065786d,x_QPTheoryMt).
xc_source_file(a65b159065786d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065786d,1327).
xc_kb_names(a65b159065786d,["?q1","?q2"]).
xc_mapping_rows(a65b159065786d,[]).
'x_<=='(x_contradictoryOrdinals(V1,x_Zero),x_wmOnly(x_lookupOnly(x_localOnly(x_qGreaterThan(V1,x_Zero)))),x_wmOnly(x_qLessThan(V1,x_Zero))) :- x_cid(a65b159065786e,V1).
xc_microtheory(a65b159065786e,x_QPTheoryMt).
xc_source_file(a65b159065786e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065786e,1331).
xc_kb_names(a65b159065786e,["?q1"]).
xc_mapping_rows(a65b159065786e,[]).
'x_<=='(x_contradictoryOrdinals(V1,x_Zero),x_wmOnly(x_lookupOnly(x_localOnly(x_qGreaterThan(V1,x_Zero)))),x_wmOnly(x_qEqualTo(V1,x_Zero))) :- x_cid(a65b159065786f,V1).
xc_microtheory(a65b159065786f,x_QPTheoryMt).
xc_source_file(a65b159065786f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065786f,1335).
xc_kb_names(a65b159065786f,["?q1"]).
xc_mapping_rows(a65b159065786f,[]).
'x_<=='(x_applicableLh(V1,V2),'x_ist-Information'(V1,x_ordinalLimitCondition(V3,V4)),x_groundExpression(V3),x_groundExpression(V4),'x_ist-Information'(V1,x_ordinalRelationFor(V5,V3,V4)),x_lookupOnly('x_ist-Information'(V1,x_dsValue(V3,V6))),x_lookupOnly('x_ist-Information'(V1,x_dsValue(V4,V7))),x_possibleOrdinalChange(V5,V6,V7,V8),x_different(V8,V5),x_unifies(V2,x_LhFn(V3,V4,V5,V8))) :- x_cid(a65b1590657870,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b1590657870,x_QPTheoryMt).
xc_source_file(a65b1590657870,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657870,1341).
xc_kb_names(a65b1590657870,["?state","?lh","?q1","?q2","?qrel-b","?ds1","?ds2","?qrel-a"]).
xc_mapping_rows(a65b1590657870,[]).
'x_<=='(x_applicableLh(V1,V2),'x_ist-Information'(V1,x_ordinalLimitCondition(V3,V4)),x_groundExpression(V4),x_groundExpression(V3),'x_ist-Information'(V1,x_ordinalRelationFor(V5,V4,V3)),x_lookupOnly('x_ist-Information'(V1,x_dsValue(V4,V6))),x_lookupOnly('x_ist-Information'(V1,x_dsValue(V3,V7))),x_possibleOrdinalChange(V5,V6,V7,V8),x_different(V8,V5),x_unifies(V2,x_LhFn(V4,V3,V5,V8))) :- x_cid(a65b1590657871,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b1590657871,x_QPTheoryMt).
xc_source_file(a65b1590657871,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657871,1356).
xc_kb_names(a65b1590657871,["?state","?lh","?q2","?q1","?qrel-b","?ds1","?ds2","?qrel-a"]).
xc_mapping_rows(a65b1590657871,[]).
'x_<=='(x_ordinalLimitCondition(V1,V2),x_wmOnly(x_lookupOnly(x_mfiConditionOf(V3,t(V4,V1,V2)))),x_alphalessp(V1,V2),x_isa(V4,x_FluentOrdinalPredicate)) :- x_cid(a65b1590657872,V1,V2,V3,V4).
xc_microtheory(a65b1590657872,x_QPTheoryMt).
xc_source_file(a65b1590657872,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657872,1381).
xc_kb_names(a65b1590657872,["?q1","?q2","?mfi","?qrel"]).
xc_mapping_rows(a65b1590657872,[]).
'x_<=='(x_ordinalLimitCondition(V1,V2),x_wmOnly(x_lookupOnly(x_mfiConditionOf(V3,t(V4,V2,V1)))),x_alphalessp(V1,V2),x_isa(V4,x_FluentOrdinalPredicate)) :- x_cid(a65b1590657873,V1,V2,V3,V4).
xc_microtheory(a65b1590657873,x_QPTheoryMt).
xc_source_file(a65b1590657873,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657873,1387).
xc_kb_names(a65b1590657873,["?q1","?q2","?mfi","?qrel"]).
xc_mapping_rows(a65b1590657873,[]).
x_isa(x_ordinalRelationFor,x_TernaryPredicate) :- x_cid(a65b1590657874).
xc_microtheory(a65b1590657874,x_QPTheoryMt).
xc_source_file(a65b1590657874,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657874,1393).
xc_kb_names(a65b1590657874,[]).
xc_mapping_rows(a65b1590657874,[]).
'x_<=='(x_ordinalRelationFor(x_qLessThan,V1,V2),x_lookupOnly(x_wmOnly(x_qLessThan(V1,V2)))) :- x_cid(a65b1590657875,V1,V2).
xc_microtheory(a65b1590657875,x_QPTheoryMt).
xc_source_file(a65b1590657875,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657875,1396).
xc_kb_names(a65b1590657875,["?q1","?q2"]).
xc_mapping_rows(a65b1590657875,[]).
'x_<=='(x_ordinalRelationFor(x_qEqualTo,V1,V2),x_lookupOnly(x_wmOnly(x_qEqualTo(V1,V2)))) :- x_cid(a65b1590657876,V1,V2).
xc_microtheory(a65b1590657876,x_QPTheoryMt).
xc_source_file(a65b1590657876,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657876,1398).
xc_kb_names(a65b1590657876,["?q1","?q2"]).
xc_mapping_rows(a65b1590657876,[]).
'x_<=='(x_ordinalRelationFor(x_qGreaterThan,V1,V2),x_lookupOnly(x_wmOnly(x_qGreaterThan(V1,V2)))) :- x_cid(a65b1590657877,V1,V2).
xc_microtheory(a65b1590657877,x_QPTheoryMt).
xc_source_file(a65b1590657877,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657877,1400).
xc_kb_names(a65b1590657877,["?q1","?q2"]).
xc_mapping_rows(a65b1590657877,[]).
'x_<=='(x_ordinalRelationFor(x_qLessThanOrEqualTo,V1,V2),x_lookupOnly(x_wmOnly(x_qLessThanOrEqualTo(V1,V2)))) :- x_cid(a65b1590657878,V1,V2).
xc_microtheory(a65b1590657878,x_QPTheoryMt).
xc_source_file(a65b1590657878,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657878,1402).
xc_kb_names(a65b1590657878,["?q1","?q2"]).
xc_mapping_rows(a65b1590657878,[]).
'x_<=='(x_ordinalRelationFor(x_qGreaterThanOrEqualTo,V1,V2),x_lookupOnly(x_wmOnly(x_qGreaterThanOrEqualTo(V1,V2)))) :- x_cid(a65b1590657879,V1,V2).
xc_microtheory(a65b1590657879,x_QPTheoryMt).
xc_source_file(a65b1590657879,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b1590657879,1404).
xc_kb_names(a65b1590657879,["?q1","?q2"]).
xc_mapping_rows(a65b1590657879,[]).
x_isa(x_attainableFrom,x_BinaryPredicate) :- x_cid(a65b159065787a).
xc_microtheory(a65b159065787a,x_QPTheoryMt).
xc_source_file(a65b159065787a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065787a,1416).
xc_kb_names(a65b159065787a,[]).
xc_mapping_rows(a65b159065787a,[]).
x_arity(x_attainableFrom,2) :- x_cid(a65b159065787b).
xc_microtheory(a65b159065787b,x_QPTheoryMt).
xc_source_file(a65b159065787b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065787b,1417).
xc_kb_names(a65b159065787b,[]).
xc_mapping_rows(a65b159065787b,[]).
x_arg1Isa(x_attainableFrom,x_QualitativeState) :- x_cid(a65b159065787c).
xc_microtheory(a65b159065787c,x_QPTheoryMt).
xc_source_file(a65b159065787c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065787c,1418).
xc_kb_names(a65b159065787c,[]).
xc_mapping_rows(a65b159065787c,[]).
x_arg2Isa(x_attainableFrom,x_QualitativeState) :- x_cid(a65b159065787d).
xc_microtheory(a65b159065787d,x_QPTheoryMt).
xc_source_file(a65b159065787d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/qp-ontology.krf').
xc_source_line(a65b159065787d,1419).
xc_kb_names(a65b159065787d,[]).
xc_mapping_rows(a65b159065787d,[]).
kb_cache_footer(footer{count:543,digest:'9212c1b89d97591c0e2cd1404d72757bf0d266df6332d08950fc371dd5554238',headerDigest:'45c353d1466d07bf7654f472c882fa40a2c3fd0812d4636ce2f11c95d5c08543'}).
