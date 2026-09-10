:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:204,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:1256,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:af03744dde12a945e94f5660e04fb1a184e49ab7d5bcf5ad43b025866d4ed4cc,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:55438,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf',sourceHash:a527ec13ee8e97b80695df866d569d63bd56a891fa9acb4d20dd1b570a952ebf,warnings:[]}).
x_isa(x_PartitionedValidationTest,x_Collection) :- x_cid(a65b1404f34783).
xc_microtheory(a65b1404f34783,x_CompanionsMt).
xc_source_file(a65b1404f34783,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34783,77).
xc_kb_names(a65b1404f34783,[]).
xc_mapping_rows(a65b1404f34783,[]).
x_genls(x_PartitionedValidationTest,x_PerformanceTesting) :- x_cid(a65b1404f34784).
xc_microtheory(a65b1404f34784,x_CompanionsMt).
xc_source_file(a65b1404f34784,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34784,78).
xc_kb_names(a65b1404f34784,[]).
xc_mapping_rows(a65b1404f34784,[]).
x_comment(x_PartitionedValidationTest,"A PartitionedValidationTest is a learning\n          evaluation that partitions a dataset into 2 sets - training and\n          testing - and then training on some subset of the training set and\n          testing on the entire testing set.") :- x_cid(a65b1404f34785).
xc_microtheory(a65b1404f34785,x_CompanionsMt).
xc_source_file(a65b1404f34785,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34785,79).
xc_kb_names(a65b1404f34785,[]).
xc_mapping_rows(a65b1404f34785,[]).
x_isa(x_CrossValidationTest,x_Collection) :- x_cid(a65b1404f34786).
xc_microtheory(a65b1404f34786,x_CompanionsMt).
xc_source_file(a65b1404f34786,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34786,87).
xc_kb_names(a65b1404f34786,[]).
xc_mapping_rows(a65b1404f34786,[]).
x_genls(x_CrossValidationTest,x_PerformanceTesting) :- x_cid(a65b1404f34787).
xc_microtheory(a65b1404f34787,x_CompanionsMt).
xc_source_file(a65b1404f34787,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34787,88).
xc_kb_names(a65b1404f34787,[]).
xc_mapping_rows(a65b1404f34787,[]).
x_comment(x_CrossValidationTest,"A CrossValidationTest is a learning evaluation\n          that partitions a dataset randomly into groups called folds,\n          and iterates through training and testing phases on rotating subsets\n          of the folds.") :- x_cid(a65b1404f34788).
xc_microtheory(a65b1404f34788,x_CompanionsMt).
xc_source_file(a65b1404f34788,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34788,89).
xc_kb_names(a65b1404f34788,[]).
xc_mapping_rows(a65b1404f34788,[]).
x_isa('x_CrossValidationTest-LeaveOneOut',x_Collection) :- x_cid(a65b1404f34789).
xc_microtheory(a65b1404f34789,x_CompanionsMt).
xc_source_file(a65b1404f34789,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34789,94).
xc_kb_names(a65b1404f34789,[]).
xc_mapping_rows(a65b1404f34789,[]).
x_genls('x_CrossValidationTest-LeaveOneOut',x_CrossValidationTest) :- x_cid(a65b1404f3478a).
xc_microtheory(a65b1404f3478a,x_CompanionsMt).
xc_source_file(a65b1404f3478a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3478a,95).
xc_kb_names(a65b1404f3478a,[]).
xc_mapping_rows(a65b1404f3478a,[]).
x_comment('x_CrossValidationTest-LeaveOneOut',"A CrossValidationTest-LeaveOneOut is an CrossValidationTest in which\n          the Companion's concept learning ability is evaluated by\n          dividing a dataset into representative groups called folds,\n          and then repeatedly training on all but one and testing on the one.") :- x_cid(a65b1404f3478b).
xc_microtheory(a65b1404f3478b,x_CompanionsMt).
xc_source_file(a65b1404f3478b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3478b,96).
xc_kb_names(a65b1404f3478b,[]).
xc_mapping_rows(a65b1404f3478b,[]).
x_isa(x_CrossValidationTestRound,x_Collection) :- x_cid(a65b1404f3478c).
xc_microtheory(a65b1404f3478c,x_CompanionsMt).
xc_source_file(a65b1404f3478c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3478c,101).
xc_kb_names(a65b1404f3478c,[]).
xc_mapping_rows(a65b1404f3478c,[]).
x_comment(x_CrossValidationTestRound,"A CrossValidationTestRound is one training/testing\n         sequence in a CrossValidationTest.") :- x_cid(a65b1404f3478d).
xc_microtheory(a65b1404f3478d,x_CompanionsMt).
xc_source_file(a65b1404f3478d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3478d,102).
xc_kb_names(a65b1404f3478d,[]).
xc_mapping_rows(a65b1404f3478d,[]).
x_isa(x_examplesInTrainingSet,x_Predicate) :- x_cid(a65b1404f3478e).
xc_microtheory(a65b1404f3478e,x_CompanionsMt).
xc_source_file(a65b1404f3478e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3478e,107).
xc_kb_names(a65b1404f3478e,[]).
xc_mapping_rows(a65b1404f3478e,[]).
x_arity(x_examplesInTrainingSet,3) :- x_cid(a65b1404f3478f).
xc_microtheory(a65b1404f3478f,x_CompanionsMt).
xc_source_file(a65b1404f3478f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3478f,108).
xc_kb_names(a65b1404f3478f,[]).
xc_mapping_rows(a65b1404f3478f,[]).
x_arg1Isa(x_examplesInTrainingSet,x_PartitionedValidationTest) :- x_cid(a65b1404f34790).
xc_microtheory(a65b1404f34790,x_CompanionsMt).
xc_source_file(a65b1404f34790,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34790,109).
xc_kb_names(a65b1404f34790,[]).
xc_mapping_rows(a65b1404f34790,[]).
x_arg2Isa(x_examplesInTrainingSet,x_UnitOfVolume) :- x_cid(a65b1404f34791).
xc_microtheory(a65b1404f34791,x_CompanionsMt).
xc_source_file(a65b1404f34791,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34791,110).
xc_kb_names(a65b1404f34791,[]).
xc_mapping_rows(a65b1404f34791,[]).
x_arg3Isa(x_examplesInTrainingSet,'x_List-Extensional') :- x_cid(a65b1404f34792).
xc_microtheory(a65b1404f34792,x_CompanionsMt).
xc_source_file(a65b1404f34792,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34792,111).
xc_kb_names(a65b1404f34792,[]).
xc_mapping_rows(a65b1404f34792,[]).
x_comment(x_examplesInTrainingSet,"(examplesInTrainingSet ?test ?round-number ?examples)") :- x_cid(a65b1404f34793).
xc_microtheory(a65b1404f34793,x_CompanionsMt).
xc_source_file(a65b1404f34793,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34793,112).
xc_kb_names(a65b1404f34793,[]).
xc_mapping_rows(a65b1404f34793,[]).
x_isa(x_examplesInTestingSet,x_Predicate) :- x_cid(a65b1404f34794).
xc_microtheory(a65b1404f34794,x_CompanionsMt).
xc_source_file(a65b1404f34794,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34794,114).
xc_kb_names(a65b1404f34794,[]).
xc_mapping_rows(a65b1404f34794,[]).
x_arity(x_examplesInTestingSet,2) :- x_cid(a65b1404f34795).
xc_microtheory(a65b1404f34795,x_CompanionsMt).
xc_source_file(a65b1404f34795,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34795,115).
xc_kb_names(a65b1404f34795,[]).
xc_mapping_rows(a65b1404f34795,[]).
x_arg1Isa(x_examplesInTestingSet,x_PartitionedValidationTest) :- x_cid(a65b1404f34796).
xc_microtheory(a65b1404f34796,x_CompanionsMt).
xc_source_file(a65b1404f34796,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34796,116).
xc_kb_names(a65b1404f34796,[]).
xc_mapping_rows(a65b1404f34796,[]).
x_arg2Isa(x_examplesInTestingSet,'x_List-Extensional') :- x_cid(a65b1404f34797).
xc_microtheory(a65b1404f34797,x_CompanionsMt).
xc_source_file(a65b1404f34797,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34797,117).
xc_kb_names(a65b1404f34797,[]).
xc_mapping_rows(a65b1404f34797,[]).
x_comment(x_examplesInTestingSet,"(examplesInTestingSet ?test ?examples)") :- x_cid(a65b1404f34798).
xc_microtheory(a65b1404f34798,x_CompanionsMt).
xc_source_file(a65b1404f34798,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34798,118).
xc_kb_names(a65b1404f34798,[]).
xc_mapping_rows(a65b1404f34798,[]).
x_isa(x_examplesInEncodingSet,x_Predicate) :- x_cid(a65b1404f34799).
xc_microtheory(a65b1404f34799,x_CompanionsMt).
xc_source_file(a65b1404f34799,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34799,120).
xc_kb_names(a65b1404f34799,[]).
xc_mapping_rows(a65b1404f34799,[]).
x_arity(x_examplesInTestingSet,2) :- x_cid(a65b1404f3479a).
xc_microtheory(a65b1404f3479a,x_CompanionsMt).
xc_source_file(a65b1404f3479a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3479a,121).
xc_kb_names(a65b1404f3479a,[]).
xc_mapping_rows(a65b1404f3479a,[]).
x_arg1Isa(x_examplesInEncodingSet,x_PartitionedValidationTest) :- x_cid(a65b1404f3479b).
xc_microtheory(a65b1404f3479b,x_CompanionsMt).
xc_source_file(a65b1404f3479b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3479b,122).
xc_kb_names(a65b1404f3479b,[]).
xc_mapping_rows(a65b1404f3479b,[]).
x_arg2Isa(x_examplesInEncodingSet,'x_List-Extensional') :- x_cid(a65b1404f3479c).
xc_microtheory(a65b1404f3479c,x_CompanionsMt).
xc_source_file(a65b1404f3479c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3479c,123).
xc_kb_names(a65b1404f3479c,[]).
xc_mapping_rows(a65b1404f3479c,[]).
x_comment(x_examplesInEncodingSet,"(examplesInTestingSet ?test ?examples)") :- x_cid(a65b1404f3479d).
xc_microtheory(a65b1404f3479d,x_CompanionsMt).
xc_source_file(a65b1404f3479d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3479d,124).
xc_kb_names(a65b1404f3479d,[]).
xc_mapping_rows(a65b1404f3479d,[]).
x_isa(x_examplesOfConceptInExperiment,x_Predicate) :- x_cid(a65b1404f3479e).
xc_microtheory(a65b1404f3479e,x_CompanionsMt).
xc_source_file(a65b1404f3479e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3479e,126).
xc_kb_names(a65b1404f3479e,[]).
xc_mapping_rows(a65b1404f3479e,[]).
x_arity(x_examplesOfConceptInExperiment,3) :- x_cid(a65b1404f3479f).
xc_microtheory(a65b1404f3479f,x_CompanionsMt).
xc_source_file(a65b1404f3479f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3479f,127).
xc_kb_names(a65b1404f3479f,[]).
xc_mapping_rows(a65b1404f3479f,[]).
x_arg1Isa(x_examplesOfConceptInExperiment,x_CrossValidationTest) :- x_cid(a65b1404f347a0).
xc_microtheory(a65b1404f347a0,x_CompanionsMt).
xc_source_file(a65b1404f347a0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347a0,128).
xc_kb_names(a65b1404f347a0,[]).
xc_mapping_rows(a65b1404f347a0,[]).
x_arg2Isa(x_examplesOfConceptInExperiment,x_Collection) :- x_cid(a65b1404f347a1).
xc_microtheory(a65b1404f347a1,x_CompanionsMt).
xc_source_file(a65b1404f347a1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347a1,129).
xc_kb_names(a65b1404f347a1,[]).
xc_mapping_rows(a65b1404f347a1,[]).
x_arg3Isa(x_examplesOfConceptInExperiment,'x_List-Extensional') :- x_cid(a65b1404f347a2).
xc_microtheory(a65b1404f347a2,x_CompanionsMt).
xc_source_file(a65b1404f347a2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347a2,130).
xc_kb_names(a65b1404f347a2,[]).
xc_mapping_rows(a65b1404f347a2,[]).
x_comment(x_examplesOfConceptInExperiment,"(examplesOfConceptInExperiment ?experiment ?concept ?examples)\n   Says that ?examples are the examples of ?concept in ?experiment.") :- x_cid(a65b1404f347a3).
xc_microtheory(a65b1404f347a3,x_CompanionsMt).
xc_source_file(a65b1404f347a3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347a3,131).
xc_kb_names(a65b1404f347a3,[]).
xc_mapping_rows(a65b1404f347a3,[]).
x_isa('x_examplesOfConceptInExperiment-Training',x_Predicate) :- x_cid(a65b1404f347a4).
xc_microtheory(a65b1404f347a4,x_CompanionsMt).
xc_source_file(a65b1404f347a4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347a4,135).
xc_kb_names(a65b1404f347a4,[]).
xc_mapping_rows(a65b1404f347a4,[]).
x_arity('x_examplesOfConceptInExperiment-Training',3) :- x_cid(a65b1404f347a5).
xc_microtheory(a65b1404f347a5,x_CompanionsMt).
xc_source_file(a65b1404f347a5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347a5,136).
xc_kb_names(a65b1404f347a5,[]).
xc_mapping_rows(a65b1404f347a5,[]).
x_arg1Isa('x_examplesOfConceptInExperiment-Training',x_PartitionedValidationTest) :- x_cid(a65b1404f347a6).
xc_microtheory(a65b1404f347a6,x_CompanionsMt).
xc_source_file(a65b1404f347a6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347a6,137).
xc_kb_names(a65b1404f347a6,[]).
xc_mapping_rows(a65b1404f347a6,[]).
x_arg2Isa('x_examplesOfConceptInExperiment-Training',x_Collection) :- x_cid(a65b1404f347a7).
xc_microtheory(a65b1404f347a7,x_CompanionsMt).
xc_source_file(a65b1404f347a7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347a7,138).
xc_kb_names(a65b1404f347a7,[]).
xc_mapping_rows(a65b1404f347a7,[]).
x_arg3Isa('x_examplesOfConceptInExperiment-Training','x_List-Extensional') :- x_cid(a65b1404f347a8).
xc_microtheory(a65b1404f347a8,x_CompanionsMt).
xc_source_file(a65b1404f347a8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347a8,139).
xc_kb_names(a65b1404f347a8,[]).
xc_mapping_rows(a65b1404f347a8,[]).
x_comment('x_examplesOfConceptInExperiment-Training',"(examplesOfConceptInExperiment-Training ?experiment ?concept ?examples)\n   Says that ?examples are the examples of ?concept in ?experiment.") :- x_cid(a65b1404f347a9).
xc_microtheory(a65b1404f347a9,x_CompanionsMt).
xc_source_file(a65b1404f347a9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347a9,140).
xc_kb_names(a65b1404f347a9,[]).
xc_mapping_rows(a65b1404f347a9,[]).
x_isa('x_examplesOfConceptInExperiment-Testing',x_Predicate) :- x_cid(a65b1404f347aa).
xc_microtheory(a65b1404f347aa,x_CompanionsMt).
xc_source_file(a65b1404f347aa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347aa,144).
xc_kb_names(a65b1404f347aa,[]).
xc_mapping_rows(a65b1404f347aa,[]).
x_arity('x_examplesOfConceptInExperiment-Testing',3) :- x_cid(a65b1404f347ab).
xc_microtheory(a65b1404f347ab,x_CompanionsMt).
xc_source_file(a65b1404f347ab,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347ab,145).
xc_kb_names(a65b1404f347ab,[]).
xc_mapping_rows(a65b1404f347ab,[]).
x_arg1Isa('x_examplesOfConceptInExperiment-Testing',x_PartitionedValidationTest) :- x_cid(a65b1404f347ac).
xc_microtheory(a65b1404f347ac,x_CompanionsMt).
xc_source_file(a65b1404f347ac,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347ac,146).
xc_kb_names(a65b1404f347ac,[]).
xc_mapping_rows(a65b1404f347ac,[]).
x_arg2Isa('x_examplesOfConceptInExperiment-Testing',x_Collection) :- x_cid(a65b1404f347ad).
xc_microtheory(a65b1404f347ad,x_CompanionsMt).
xc_source_file(a65b1404f347ad,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347ad,147).
xc_kb_names(a65b1404f347ad,[]).
xc_mapping_rows(a65b1404f347ad,[]).
x_arg3Isa('x_examplesOfConceptInExperiment-Testing','x_List-Extensional') :- x_cid(a65b1404f347ae).
xc_microtheory(a65b1404f347ae,x_CompanionsMt).
xc_source_file(a65b1404f347ae,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347ae,148).
xc_kb_names(a65b1404f347ae,[]).
xc_mapping_rows(a65b1404f347ae,[]).
x_comment('x_examplesOfConceptInExperiment-Testing',"(examplesOfConceptInExperiment-Testing ?experiment ?concept ?examples)\n   Says that ?examples are the examples of ?concept in ?experiment.") :- x_cid(a65b1404f347af).
xc_microtheory(a65b1404f347af,x_CompanionsMt).
xc_source_file(a65b1404f347af,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347af,149).
xc_kb_names(a65b1404f347af,[]).
xc_mapping_rows(a65b1404f347af,[]).
x_isa('x_examplesOfConceptInExperiment-Encoding',x_Predicate) :- x_cid(a65b1404f347b0).
xc_microtheory(a65b1404f347b0,x_CompanionsMt).
xc_source_file(a65b1404f347b0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347b0,153).
xc_kb_names(a65b1404f347b0,[]).
xc_mapping_rows(a65b1404f347b0,[]).
x_arity('x_examplesOfConceptInExperiment-Encoding',3) :- x_cid(a65b1404f347b1).
xc_microtheory(a65b1404f347b1,x_CompanionsMt).
xc_source_file(a65b1404f347b1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347b1,154).
xc_kb_names(a65b1404f347b1,[]).
xc_mapping_rows(a65b1404f347b1,[]).
x_arg1Isa('x_examplesOfConceptInExperiment-Encoding',x_PartitionedValidationTest) :- x_cid(a65b1404f347b2).
xc_microtheory(a65b1404f347b2,x_CompanionsMt).
xc_source_file(a65b1404f347b2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347b2,155).
xc_kb_names(a65b1404f347b2,[]).
xc_mapping_rows(a65b1404f347b2,[]).
x_arg2Isa('x_examplesOfConceptInExperiment-Encoding',x_Collection) :- x_cid(a65b1404f347b3).
xc_microtheory(a65b1404f347b3,x_CompanionsMt).
xc_source_file(a65b1404f347b3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347b3,156).
xc_kb_names(a65b1404f347b3,[]).
xc_mapping_rows(a65b1404f347b3,[]).
x_arg3Isa('x_examplesOfConceptInExperiment-Encoding','x_List-Extensional') :- x_cid(a65b1404f347b4).
xc_microtheory(a65b1404f347b4,x_CompanionsMt).
xc_source_file(a65b1404f347b4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347b4,157).
xc_kb_names(a65b1404f347b4,[]).
xc_mapping_rows(a65b1404f347b4,[]).
x_comment('x_examplesOfConceptInExperiment-Encoding',"(examplesOfConceptInExperiment-Encoding ?experiment ?concept ?examples)\n   Says that ?examples are the examples of ?concept in ?experiment.") :- x_cid(a65b1404f347b5).
xc_microtheory(a65b1404f347b5,x_CompanionsMt).
xc_source_file(a65b1404f347b5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347b5,158).
xc_kb_names(a65b1404f347b5,[]).
xc_mapping_rows(a65b1404f347b5,[]).
x_isa(x_exampleOfConceptInExperiment,x_Predicate) :- x_cid(a65b1404f347b6).
xc_microtheory(a65b1404f347b6,x_CompanionsMt).
xc_source_file(a65b1404f347b6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347b6,162).
xc_kb_names(a65b1404f347b6,[]).
xc_mapping_rows(a65b1404f347b6,[]).
x_arity(x_exampleOfConceptInExperiment,3) :- x_cid(a65b1404f347b7).
xc_microtheory(a65b1404f347b7,x_CompanionsMt).
xc_source_file(a65b1404f347b7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347b7,163).
xc_kb_names(a65b1404f347b7,[]).
xc_mapping_rows(a65b1404f347b7,[]).
x_arg1Isa(x_exampleOfConceptInExperiment,x_CrossValidationTest) :- x_cid(a65b1404f347b8).
xc_microtheory(a65b1404f347b8,x_CompanionsMt).
xc_source_file(a65b1404f347b8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347b8,164).
xc_kb_names(a65b1404f347b8,[]).
xc_mapping_rows(a65b1404f347b8,[]).
x_arg2Isa(x_exampleOfConceptInExperiment,x_Collection) :- x_cid(a65b1404f347b9).
xc_microtheory(a65b1404f347b9,x_CompanionsMt).
xc_source_file(a65b1404f347b9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347b9,165).
xc_kb_names(a65b1404f347b9,[]).
xc_mapping_rows(a65b1404f347b9,[]).
x_arg3Isa(x_exampleOfConceptInExperiment,x_Thing) :- x_cid(a65b1404f347ba).
xc_microtheory(a65b1404f347ba,x_CompanionsMt).
xc_source_file(a65b1404f347ba,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347ba,166).
xc_kb_names(a65b1404f347ba,[]).
xc_mapping_rows(a65b1404f347ba,[]).
x_comment(x_exampleOfConceptInExperiment,"(exampleOfConceptInExperiment ?experiment ?concept ?example)\n   Says that ?example is one the examples of ?concept in ?experiment.") :- x_cid(a65b1404f347bb).
xc_microtheory(a65b1404f347bb,x_CompanionsMt).
xc_source_file(a65b1404f347bb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347bb,167).
xc_kb_names(a65b1404f347bb,[]).
xc_mapping_rows(a65b1404f347bb,[]).
x_isa('x_exampleOfConceptInExperiment-Training',x_Predicate) :- x_cid(a65b1404f347bc).
xc_microtheory(a65b1404f347bc,x_CompanionsMt).
xc_source_file(a65b1404f347bc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347bc,171).
xc_kb_names(a65b1404f347bc,[]).
xc_mapping_rows(a65b1404f347bc,[]).
x_arity('x_exampleOfConceptInExperiment-Training',3) :- x_cid(a65b1404f347bd).
xc_microtheory(a65b1404f347bd,x_CompanionsMt).
xc_source_file(a65b1404f347bd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347bd,172).
xc_kb_names(a65b1404f347bd,[]).
xc_mapping_rows(a65b1404f347bd,[]).
x_arg1Isa('x_exampleOfConceptInExperiment-Training',x_PartitionedValidationTest) :- x_cid(a65b1404f347be).
xc_microtheory(a65b1404f347be,x_CompanionsMt).
xc_source_file(a65b1404f347be,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347be,173).
xc_kb_names(a65b1404f347be,[]).
xc_mapping_rows(a65b1404f347be,[]).
x_arg2Isa('x_exampleOfConceptInExperiment-Training',x_Collection) :- x_cid(a65b1404f347bf).
xc_microtheory(a65b1404f347bf,x_CompanionsMt).
xc_source_file(a65b1404f347bf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347bf,174).
xc_kb_names(a65b1404f347bf,[]).
xc_mapping_rows(a65b1404f347bf,[]).
x_arg3Isa('x_exampleOfConceptInExperiment-Training',x_Thing) :- x_cid(a65b1404f347c0).
xc_microtheory(a65b1404f347c0,x_CompanionsMt).
xc_source_file(a65b1404f347c0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347c0,175).
xc_kb_names(a65b1404f347c0,[]).
xc_mapping_rows(a65b1404f347c0,[]).
x_comment('x_exampleOfConceptInExperiment-Training',"(exampleOfConceptInExperiment-Training ?experiment ?concept ?example)\n   Says that ?example is one the examples of ?concept in ?experiment.") :- x_cid(a65b1404f347c1).
xc_microtheory(a65b1404f347c1,x_CompanionsMt).
xc_source_file(a65b1404f347c1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347c1,176).
xc_kb_names(a65b1404f347c1,[]).
xc_mapping_rows(a65b1404f347c1,[]).
x_isa('x_exampleOfConceptInExperiment-Testing',x_Predicate) :- x_cid(a65b1404f347c2).
xc_microtheory(a65b1404f347c2,x_CompanionsMt).
xc_source_file(a65b1404f347c2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347c2,180).
xc_kb_names(a65b1404f347c2,[]).
xc_mapping_rows(a65b1404f347c2,[]).
x_arity('x_exampleOfConceptInExperiment-Testing',3) :- x_cid(a65b1404f347c3).
xc_microtheory(a65b1404f347c3,x_CompanionsMt).
xc_source_file(a65b1404f347c3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347c3,181).
xc_kb_names(a65b1404f347c3,[]).
xc_mapping_rows(a65b1404f347c3,[]).
x_arg1Isa('x_exampleOfConceptInExperiment-Testing',x_PartitionedValidationTest) :- x_cid(a65b1404f347c4).
xc_microtheory(a65b1404f347c4,x_CompanionsMt).
xc_source_file(a65b1404f347c4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347c4,182).
xc_kb_names(a65b1404f347c4,[]).
xc_mapping_rows(a65b1404f347c4,[]).
x_arg2Isa('x_exampleOfConceptInExperiment-Testing',x_Collection) :- x_cid(a65b1404f347c5).
xc_microtheory(a65b1404f347c5,x_CompanionsMt).
xc_source_file(a65b1404f347c5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347c5,183).
xc_kb_names(a65b1404f347c5,[]).
xc_mapping_rows(a65b1404f347c5,[]).
x_arg3Isa('x_exampleOfConceptInExperiment-Testing',x_Thing) :- x_cid(a65b1404f347c6).
xc_microtheory(a65b1404f347c6,x_CompanionsMt).
xc_source_file(a65b1404f347c6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347c6,184).
xc_kb_names(a65b1404f347c6,[]).
xc_mapping_rows(a65b1404f347c6,[]).
x_comment('x_exampleOfConceptInExperiment-Testing',"(exampleOfConceptInExperiment-Testing ?experiment ?concept ?example)\n   Says that ?example is one the examples of ?concept in ?experiment.") :- x_cid(a65b1404f347c7).
xc_microtheory(a65b1404f347c7,x_CompanionsMt).
xc_source_file(a65b1404f347c7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347c7,185).
xc_kb_names(a65b1404f347c7,[]).
xc_mapping_rows(a65b1404f347c7,[]).
x_isa('x_exampleOfConceptInExperiment-Encoding',x_Predicate) :- x_cid(a65b1404f347c8).
xc_microtheory(a65b1404f347c8,x_CompanionsMt).
xc_source_file(a65b1404f347c8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347c8,189).
xc_kb_names(a65b1404f347c8,[]).
xc_mapping_rows(a65b1404f347c8,[]).
x_arity('x_exampleOfConceptInExperiment-Encoding',3) :- x_cid(a65b1404f347c9).
xc_microtheory(a65b1404f347c9,x_CompanionsMt).
xc_source_file(a65b1404f347c9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347c9,190).
xc_kb_names(a65b1404f347c9,[]).
xc_mapping_rows(a65b1404f347c9,[]).
x_arg1Isa('x_exampleOfConceptInExperiment-Encoding',x_PartitionedValidationTest) :- x_cid(a65b1404f347ca).
xc_microtheory(a65b1404f347ca,x_CompanionsMt).
xc_source_file(a65b1404f347ca,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347ca,191).
xc_kb_names(a65b1404f347ca,[]).
xc_mapping_rows(a65b1404f347ca,[]).
x_arg2Isa('x_exampleOfConceptInExperiment-Encoding',x_Collection) :- x_cid(a65b1404f347cb).
xc_microtheory(a65b1404f347cb,x_CompanionsMt).
xc_source_file(a65b1404f347cb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347cb,192).
xc_kb_names(a65b1404f347cb,[]).
xc_mapping_rows(a65b1404f347cb,[]).
x_arg3Isa('x_exampleOfConceptInExperiment-Encoding',x_Thing) :- x_cid(a65b1404f347cc).
xc_microtheory(a65b1404f347cc,x_CompanionsMt).
xc_source_file(a65b1404f347cc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347cc,193).
xc_kb_names(a65b1404f347cc,[]).
xc_mapping_rows(a65b1404f347cc,[]).
x_comment('x_exampleOfConceptInExperiment-Encoding',"(exampleOfConceptInExperiment-Encoding ?experiment ?concept ?example)\n   Says that ?example is one the examples of ?concept in ?experiment.") :- x_cid(a65b1404f347cd).
xc_microtheory(a65b1404f347cd,x_CompanionsMt).
xc_source_file(a65b1404f347cd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347cd,194).
xc_kb_names(a65b1404f347cd,[]).
xc_mapping_rows(a65b1404f347cd,[]).
x_isa(x_negativeExampleOfConceptInExperiment,x_Predicate) :- x_cid(a65b1404f347ce).
xc_microtheory(a65b1404f347ce,x_CompanionsMt).
xc_source_file(a65b1404f347ce,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347ce,198).
xc_kb_names(a65b1404f347ce,[]).
xc_mapping_rows(a65b1404f347ce,[]).
x_arity(x_negativeExampleOfConceptInExperiment,3) :- x_cid(a65b1404f347cf).
xc_microtheory(a65b1404f347cf,x_CompanionsMt).
xc_source_file(a65b1404f347cf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347cf,199).
xc_kb_names(a65b1404f347cf,[]).
xc_mapping_rows(a65b1404f347cf,[]).
x_arg1Isa(x_negativeExampleOfConceptInExperiment,x_CrossValidationTest) :- x_cid(a65b1404f347d0).
xc_microtheory(a65b1404f347d0,x_CompanionsMt).
xc_source_file(a65b1404f347d0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347d0,200).
xc_kb_names(a65b1404f347d0,[]).
xc_mapping_rows(a65b1404f347d0,[]).
x_arg2Isa(x_negativeExampleOfConceptInExperiment,x_Collection) :- x_cid(a65b1404f347d1).
xc_microtheory(a65b1404f347d1,x_CompanionsMt).
xc_source_file(a65b1404f347d1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347d1,201).
xc_kb_names(a65b1404f347d1,[]).
xc_mapping_rows(a65b1404f347d1,[]).
x_arg3Isa(x_negativeExampleOfConceptInExperiment,x_Thing) :- x_cid(a65b1404f347d2).
xc_microtheory(a65b1404f347d2,x_CompanionsMt).
xc_source_file(a65b1404f347d2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347d2,202).
xc_kb_names(a65b1404f347d2,[]).
xc_mapping_rows(a65b1404f347d2,[]).
x_comment(x_negativeExampleOfConceptInExperiment,"(negativeExampleOfConceptInExperiment ?experiment ?concept ?example)\n   Says that ?example is an example of [NOT ?concept] in ?experiment.") :- x_cid(a65b1404f347d3).
xc_microtheory(a65b1404f347d3,x_CompanionsMt).
xc_source_file(a65b1404f347d3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347d3,203).
xc_kb_names(a65b1404f347d3,[]).
xc_mapping_rows(a65b1404f347d3,[]).
x_isa(x_shuffleExamples,x_Predicate) :- x_cid(a65b1404f347d4).
xc_microtheory(a65b1404f347d4,x_CompanionsMt).
xc_source_file(a65b1404f347d4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347d4,208).
xc_kb_names(a65b1404f347d4,[]).
xc_mapping_rows(a65b1404f347d4,[]).
x_arity(x_shuffleExamples,3) :- x_cid(a65b1404f347d5).
xc_microtheory(a65b1404f347d5,x_CompanionsMt).
xc_source_file(a65b1404f347d5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347d5,209).
xc_kb_names(a65b1404f347d5,[]).
xc_mapping_rows(a65b1404f347d5,[]).
x_isa(x_preparedFor,x_Predicate) :- x_cid(a65b1404f347d6).
xc_microtheory(a65b1404f347d6,x_CompanionsMt).
xc_source_file(a65b1404f347d6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347d6,213).
xc_kb_names(a65b1404f347d6,[]).
xc_mapping_rows(a65b1404f347d6,[]).
x_arity(x_preparedFor,1) :- x_cid(a65b1404f347d7).
xc_microtheory(a65b1404f347d7,x_CompanionsMt).
xc_source_file(a65b1404f347d7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347d7,214).
xc_kb_names(a65b1404f347d7,[]).
xc_mapping_rows(a65b1404f347d7,[]).
x_arg1Isa(x_preparedFor,x_Thing) :- x_cid(a65b1404f347d8).
xc_microtheory(a65b1404f347d8,x_CompanionsMt).
xc_source_file(a65b1404f347d8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347d8,215).
xc_kb_names(a65b1404f347d8,[]).
xc_mapping_rows(a65b1404f347d8,[]).
x_isa(x_trainedOn,x_Predicate) :- x_cid(a65b1404f347d9).
xc_microtheory(a65b1404f347d9,x_CompanionsMt).
xc_source_file(a65b1404f347d9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347d9,217).
xc_kb_names(a65b1404f347d9,[]).
xc_mapping_rows(a65b1404f347d9,[]).
x_arity(x_trainedOn,1) :- x_cid(a65b1404f347da).
xc_microtheory(a65b1404f347da,x_CompanionsMt).
xc_source_file(a65b1404f347da,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347da,218).
xc_kb_names(a65b1404f347da,[]).
xc_mapping_rows(a65b1404f347da,[]).
x_arg1Isa(x_trainedOn,x_Thing) :- x_cid(a65b1404f347db).
xc_microtheory(a65b1404f347db,x_CompanionsMt).
xc_source_file(a65b1404f347db,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347db,219).
xc_kb_names(a65b1404f347db,[]).
xc_mapping_rows(a65b1404f347db,[]).
x_isa(x_testedOn,x_Predicate) :- x_cid(a65b1404f347dc).
xc_microtheory(a65b1404f347dc,x_CompanionsMt).
xc_source_file(a65b1404f347dc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347dc,221).
xc_kb_names(a65b1404f347dc,[]).
xc_mapping_rows(a65b1404f347dc,[]).
x_arity(x_testedOn,1) :- x_cid(a65b1404f347dd).
xc_microtheory(a65b1404f347dd,x_CompanionsMt).
xc_source_file(a65b1404f347dd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347dd,222).
xc_kb_names(a65b1404f347dd,[]).
xc_mapping_rows(a65b1404f347dd,[]).
x_arg1Isa(x_testedOn,x_Thing) :- x_cid(a65b1404f347de).
xc_microtheory(a65b1404f347de,x_CompanionsMt).
xc_source_file(a65b1404f347de,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347de,223).
xc_kb_names(a65b1404f347de,[]).
xc_mapping_rows(a65b1404f347de,[]).
x_isa(x_ValidationRoundFn,'x_Function-Denotational') :- x_cid(a65b1404f347df).
xc_microtheory(a65b1404f347df,x_CompanionsMt).
xc_source_file(a65b1404f347df,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347df,226).
xc_kb_names(a65b1404f347df,[]).
xc_mapping_rows(a65b1404f347df,[]).
x_arity(x_ValidationRoundFn,2) :- x_cid(a65b1404f347e0).
xc_microtheory(a65b1404f347e0,x_CompanionsMt).
xc_source_file(a65b1404f347e0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347e0,227).
xc_kb_names(a65b1404f347e0,[]).
xc_mapping_rows(a65b1404f347e0,[]).
x_arg1Isa(x_ValidationRoundFn,x_CrossValidationTest) :- x_cid(a65b1404f347e1).
xc_microtheory(a65b1404f347e1,x_CompanionsMt).
xc_source_file(a65b1404f347e1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347e1,228).
xc_kb_names(a65b1404f347e1,[]).
xc_mapping_rows(a65b1404f347e1,[]).
x_arg2Isa(x_ValidationRoundFn,x_Integer) :- x_cid(a65b1404f347e2).
xc_microtheory(a65b1404f347e2,x_CompanionsMt).
xc_source_file(a65b1404f347e2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347e2,229).
xc_kb_names(a65b1404f347e2,[]).
xc_mapping_rows(a65b1404f347e2,[]).
x_resultIsa(x_ValidationRoundFn,x_CrossValidationTestRound) :- x_cid(a65b1404f347e3).
xc_microtheory(a65b1404f347e3,x_CompanionsMt).
xc_source_file(a65b1404f347e3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347e3,230).
xc_kb_names(a65b1404f347e3,[]).
xc_mapping_rows(a65b1404f347e3,[]).
x_isa(x_examplesInCVTestFold,x_Predicate) :- x_cid(a65b1404f347e4).
xc_microtheory(a65b1404f347e4,x_CompanionsMt).
xc_source_file(a65b1404f347e4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347e4,232).
xc_kb_names(a65b1404f347e4,[]).
xc_mapping_rows(a65b1404f347e4,[]).
x_arity(x_examplesInCVTestFold,3) :- x_cid(a65b1404f347e5).
xc_microtheory(a65b1404f347e5,x_CompanionsMt).
xc_source_file(a65b1404f347e5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347e5,233).
xc_kb_names(a65b1404f347e5,[]).
xc_mapping_rows(a65b1404f347e5,[]).
x_arg1Isa(x_examplesInCVTestFold,x_CrossValidationTest) :- x_cid(a65b1404f347e6).
xc_microtheory(a65b1404f347e6,x_CompanionsMt).
xc_source_file(a65b1404f347e6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347e6,234).
xc_kb_names(a65b1404f347e6,[]).
xc_mapping_rows(a65b1404f347e6,[]).
x_arg2Isa(x_examplesInCVTestFold,x_Integer) :- x_cid(a65b1404f347e7).
xc_microtheory(a65b1404f347e7,x_CompanionsMt).
xc_source_file(a65b1404f347e7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347e7,235).
xc_kb_names(a65b1404f347e7,[]).
xc_mapping_rows(a65b1404f347e7,[]).
x_arg3Isa(x_examplesInCVTestFold,'x_List-Extensional') :- x_cid(a65b1404f347e8).
xc_microtheory(a65b1404f347e8,x_CompanionsMt).
xc_source_file(a65b1404f347e8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347e8,236).
xc_kb_names(a65b1404f347e8,[]).
xc_mapping_rows(a65b1404f347e8,[]).
x_comment(x_examplesInCVTestFold,"") :- x_cid(a65b1404f347e9).
xc_microtheory(a65b1404f347e9,x_CompanionsMt).
xc_source_file(a65b1404f347e9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347e9,237).
xc_kb_names(a65b1404f347e9,[]).
xc_mapping_rows(a65b1404f347e9,[]).
x_isa(x_numberOfValidationRounds,x_Predicate) :- x_cid(a65b1404f347ea).
xc_microtheory(a65b1404f347ea,x_CompanionsMt).
xc_source_file(a65b1404f347ea,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347ea,239).
xc_kb_names(a65b1404f347ea,[]).
xc_mapping_rows(a65b1404f347ea,[]).
x_arity(x_numberOfValidationRounds,2) :- x_cid(a65b1404f347eb).
xc_microtheory(a65b1404f347eb,x_CompanionsMt).
xc_source_file(a65b1404f347eb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347eb,240).
xc_kb_names(a65b1404f347eb,[]).
xc_mapping_rows(a65b1404f347eb,[]).
x_arg1Isa(x_numberOfValidationRounds,x_CrossValidationTest) :- x_cid(a65b1404f347ec).
xc_microtheory(a65b1404f347ec,x_CompanionsMt).
xc_source_file(a65b1404f347ec,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347ec,241).
xc_kb_names(a65b1404f347ec,[]).
xc_mapping_rows(a65b1404f347ec,[]).
x_arg2Isa(x_numberOfValidationRounds,x_Integer) :- x_cid(a65b1404f347ed).
xc_microtheory(a65b1404f347ed,x_CompanionsMt).
xc_source_file(a65b1404f347ed,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347ed,242).
xc_kb_names(a65b1404f347ed,[]).
xc_mapping_rows(a65b1404f347ed,[]).
x_comment(x_numberOfValidationRounds,"(numberOfValidationRounds ?experiment ?number-of-folds)\n   Says that the cross-validation experiment ?experiment has\n   ?number-of-folds folds.") :- x_cid(a65b1404f347ee).
xc_microtheory(a65b1404f347ee,x_CompanionsMt).
xc_source_file(a65b1404f347ee,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347ee,243).
xc_kb_names(a65b1404f347ee,[]).
xc_mapping_rows(a65b1404f347ee,[]).
x_isa(x_trainingFoldsForCVTestRound,x_Predicate) :- x_cid(a65b1404f347ef).
xc_microtheory(a65b1404f347ef,x_CompanionsMt).
xc_source_file(a65b1404f347ef,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347ef,248).
xc_kb_names(a65b1404f347ef,[]).
xc_mapping_rows(a65b1404f347ef,[]).
x_arity(x_trainingFoldsForCVTestRound,3) :- x_cid(a65b1404f347f0).
xc_microtheory(a65b1404f347f0,x_CompanionsMt).
xc_source_file(a65b1404f347f0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347f0,249).
xc_kb_names(a65b1404f347f0,[]).
xc_mapping_rows(a65b1404f347f0,[]).
x_arg1Isa(x_trainingFoldsForCVTestRound,x_CrossValidationTest) :- x_cid(a65b1404f347f1).
xc_microtheory(a65b1404f347f1,x_CompanionsMt).
xc_source_file(a65b1404f347f1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347f1,250).
xc_kb_names(a65b1404f347f1,[]).
xc_mapping_rows(a65b1404f347f1,[]).
x_arg2Isa(x_trainingFoldsForCVTestRound,x_Integer) :- x_cid(a65b1404f347f2).
xc_microtheory(a65b1404f347f2,x_CompanionsMt).
xc_source_file(a65b1404f347f2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347f2,251).
xc_kb_names(a65b1404f347f2,[]).
xc_mapping_rows(a65b1404f347f2,[]).
x_arg3Isa(x_trainingFoldsForCVTestRound,'x_List-Extensional') :- x_cid(a65b1404f347f3).
xc_microtheory(a65b1404f347f3,x_CompanionsMt).
xc_source_file(a65b1404f347f3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347f3,252).
xc_kb_names(a65b1404f347f3,[]).
xc_mapping_rows(a65b1404f347f3,[]).
x_comment(x_trainingFoldsForCVTestRound,"(trainingFoldsForCVTestRound ?experiment ?round-number ?training-fold-number-list)\n   Says that in the cross-validation experiment ?experiment, during round number\n   ?round-number, the fold-numbers that are trained on are listed in order according\n   to ?training-fold-number-list.") :- x_cid(a65b1404f347f4).
xc_microtheory(a65b1404f347f4,x_CompanionsMt).
xc_source_file(a65b1404f347f4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347f4,253).
xc_kb_names(a65b1404f347f4,[]).
xc_mapping_rows(a65b1404f347f4,[]).
x_isa(x_testingFoldsForCVTestRound,x_Predicate) :- x_cid(a65b1404f347f5).
xc_microtheory(a65b1404f347f5,x_CompanionsMt).
xc_source_file(a65b1404f347f5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347f5,259).
xc_kb_names(a65b1404f347f5,[]).
xc_mapping_rows(a65b1404f347f5,[]).
x_arity(x_testingFoldsForCVTestRound,3) :- x_cid(a65b1404f347f6).
xc_microtheory(a65b1404f347f6,x_CompanionsMt).
xc_source_file(a65b1404f347f6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347f6,260).
xc_kb_names(a65b1404f347f6,[]).
xc_mapping_rows(a65b1404f347f6,[]).
x_arg1Isa(x_testingFoldsForCVTestRound,x_CrossValidationTest) :- x_cid(a65b1404f347f7).
xc_microtheory(a65b1404f347f7,x_CompanionsMt).
xc_source_file(a65b1404f347f7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347f7,261).
xc_kb_names(a65b1404f347f7,[]).
xc_mapping_rows(a65b1404f347f7,[]).
x_arg2Isa(x_testingFoldsForCVTestRound,x_Integer) :- x_cid(a65b1404f347f8).
xc_microtheory(a65b1404f347f8,x_CompanionsMt).
xc_source_file(a65b1404f347f8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347f8,262).
xc_kb_names(a65b1404f347f8,[]).
xc_mapping_rows(a65b1404f347f8,[]).
x_arg3Isa(x_testingFoldsForCVTestRound,'x_List-Extensional') :- x_cid(a65b1404f347f9).
xc_microtheory(a65b1404f347f9,x_CompanionsMt).
xc_source_file(a65b1404f347f9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347f9,263).
xc_kb_names(a65b1404f347f9,[]).
xc_mapping_rows(a65b1404f347f9,[]).
x_comment(x_testingFoldsForCVTestRound,"(testingFoldsForCVTestRound ?experiment ?round-number ?testing-fold-number-list)\n   Says that in the cross-validation experiment ?experiment, during round number\n   ?round-number, the fold-numbers that are tested on are listed in order according\n   to ?testing-fold-number-list.") :- x_cid(a65b1404f347fa).
xc_microtheory(a65b1404f347fa,x_CompanionsMt).
xc_source_file(a65b1404f347fa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347fa,264).
xc_kb_names(a65b1404f347fa,[]).
xc_mapping_rows(a65b1404f347fa,[]).
x_isa(x_roundForValidationTest,x_Predicate) :- x_cid(a65b1404f347fb).
xc_microtheory(a65b1404f347fb,x_CompanionsMt).
xc_source_file(a65b1404f347fb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347fb,270).
xc_kb_names(a65b1404f347fb,[]).
xc_mapping_rows(a65b1404f347fb,[]).
x_arity(x_roundForValidationTest,2) :- x_cid(a65b1404f347fc).
xc_microtheory(a65b1404f347fc,x_CompanionsMt).
xc_source_file(a65b1404f347fc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347fc,271).
xc_kb_names(a65b1404f347fc,[]).
xc_mapping_rows(a65b1404f347fc,[]).
x_arg1Isa(x_roundForValidationTest,x_CrossValidationTest) :- x_cid(a65b1404f347fd).
xc_microtheory(a65b1404f347fd,x_CompanionsMt).
xc_source_file(a65b1404f347fd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347fd,272).
xc_kb_names(a65b1404f347fd,[]).
xc_mapping_rows(a65b1404f347fd,[]).
x_arg2Isa(x_roundForValidationTest,x_CrossValidationTestRound) :- x_cid(a65b1404f347fe).
xc_microtheory(a65b1404f347fe,x_CompanionsMt).
xc_source_file(a65b1404f347fe,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347fe,273).
xc_kb_names(a65b1404f347fe,[]).
xc_mapping_rows(a65b1404f347fe,[]).
x_comment(x_roundForValidationTest,"(roundForValidationTest ?experiment ?round) Says that ?round is one of the\nrounds in the cross-validation experiment ?experiment.") :- x_cid(a65b1404f347ff).
xc_microtheory(a65b1404f347ff,x_CompanionsMt).
xc_source_file(a65b1404f347ff,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f347ff,274).
xc_kb_names(a65b1404f347ff,[]).
xc_mapping_rows(a65b1404f347ff,[]).
x_isa(x_runValidationTest,x_ComplexActionPredicate) :- x_cid(a65b1404f34800).
xc_microtheory(a65b1404f34800,x_CompanionsMt).
xc_source_file(a65b1404f34800,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34800,285).
xc_kb_names(a65b1404f34800,[]).
xc_mapping_rows(a65b1404f34800,[]).
x_arity(x_runValidationTest,1) :- x_cid(a65b1404f34801).
xc_microtheory(a65b1404f34801,x_CompanionsMt).
xc_source_file(a65b1404f34801,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34801,286).
xc_kb_names(a65b1404f34801,[]).
xc_mapping_rows(a65b1404f34801,[]).
x_isa(x_prepareForValidationTest,x_ComplexActionPredicate) :- x_cid(a65b1404f34802).
xc_microtheory(a65b1404f34802,x_CompanionsMt).
xc_source_file(a65b1404f34802,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34802,288).
xc_kb_names(a65b1404f34802,[]).
xc_mapping_rows(a65b1404f34802,[]).
x_arity(x_prepareForValidationTest,1) :- x_cid(a65b1404f34803).
xc_microtheory(a65b1404f34803,x_CompanionsMt).
xc_source_file(a65b1404f34803,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34803,289).
xc_kb_names(a65b1404f34803,[]).
xc_mapping_rows(a65b1404f34803,[]).
x_isa(x_runValidationTestRound,x_ComplexActionPredicate) :- x_cid(a65b1404f34804).
xc_microtheory(a65b1404f34804,x_CompanionsMt).
xc_source_file(a65b1404f34804,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34804,291).
xc_kb_names(a65b1404f34804,[]).
xc_mapping_rows(a65b1404f34804,[]).
x_arity(x_runValidationTestRound,2) :- x_cid(a65b1404f34805).
xc_microtheory(a65b1404f34805,x_CompanionsMt).
xc_source_file(a65b1404f34805,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34805,292).
xc_kb_names(a65b1404f34805,[]).
xc_mapping_rows(a65b1404f34805,[]).
x_isa(x_prepareForValidationTestRound,x_ComplexActionPredicate) :- x_cid(a65b1404f34806).
xc_microtheory(a65b1404f34806,x_CompanionsMt).
xc_source_file(a65b1404f34806,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34806,294).
xc_kb_names(a65b1404f34806,[]).
xc_mapping_rows(a65b1404f34806,[]).
x_arity(x_prepareForValidationTestRound,2) :- x_cid(a65b1404f34807).
xc_microtheory(a65b1404f34807,x_CompanionsMt).
xc_source_file(a65b1404f34807,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34807,295).
xc_kb_names(a65b1404f34807,[]).
xc_mapping_rows(a65b1404f34807,[]).
x_isa(x_trainForValidationTestRound,x_ComplexActionPredicate) :- x_cid(a65b1404f34808).
xc_microtheory(a65b1404f34808,x_CompanionsMt).
xc_source_file(a65b1404f34808,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34808,297).
xc_kb_names(a65b1404f34808,[]).
xc_mapping_rows(a65b1404f34808,[]).
x_arity(x_trainForValidationTestRound,2) :- x_cid(a65b1404f34809).
xc_microtheory(a65b1404f34809,x_CompanionsMt).
xc_source_file(a65b1404f34809,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34809,298).
xc_kb_names(a65b1404f34809,[]).
xc_mapping_rows(a65b1404f34809,[]).
x_isa(x_testForValidationTestRound,x_ComplexActionPredicate) :- x_cid(a65b1404f3480a).
xc_microtheory(a65b1404f3480a,x_CompanionsMt).
xc_source_file(a65b1404f3480a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3480a,300).
xc_kb_names(a65b1404f3480a,[]).
xc_mapping_rows(a65b1404f3480a,[]).
x_arity(x_testForValidationTestRound,2) :- x_cid(a65b1404f3480b).
xc_microtheory(a65b1404f3480b,x_CompanionsMt).
xc_source_file(a65b1404f3480b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3480b,301).
xc_kb_names(a65b1404f3480b,[]).
xc_mapping_rows(a65b1404f3480b,[]).
x_isa(x_trainOnExample,x_ComplexActionPredicate) :- x_cid(a65b1404f3480c).
xc_microtheory(a65b1404f3480c,x_CompanionsMt).
xc_source_file(a65b1404f3480c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3480c,303).
xc_kb_names(a65b1404f3480c,[]).
xc_mapping_rows(a65b1404f3480c,[]).
x_arity(x_trainOnExample,2) :- x_cid(a65b1404f3480d).
xc_microtheory(a65b1404f3480d,x_CompanionsMt).
xc_source_file(a65b1404f3480d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3480d,304).
xc_kb_names(a65b1404f3480d,[]).
xc_mapping_rows(a65b1404f3480d,[]).
x_isa(x_testOnExample,x_ComplexActionPredicate) :- x_cid(a65b1404f3480e).
xc_microtheory(a65b1404f3480e,x_CompanionsMt).
xc_source_file(a65b1404f3480e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3480e,306).
xc_kb_names(a65b1404f3480e,[]).
xc_mapping_rows(a65b1404f3480e,[]).
x_arity(x_testOnExample,2) :- x_cid(a65b1404f3480f).
xc_microtheory(a65b1404f3480f,x_CompanionsMt).
xc_source_file(a65b1404f3480f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3480f,307).
xc_kb_names(a65b1404f3480f,[]).
xc_mapping_rows(a65b1404f3480f,[]).
x_isa(x_wrapUpValidationTestRound,x_ComplexActionPredicate) :- x_cid(a65b1404f34810).
xc_microtheory(a65b1404f34810,x_CompanionsMt).
xc_source_file(a65b1404f34810,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34810,309).
xc_kb_names(a65b1404f34810,[]).
xc_mapping_rows(a65b1404f34810,[]).
x_arity(x_wrapUpValidationTestRound,2) :- x_cid(a65b1404f34811).
xc_microtheory(a65b1404f34811,x_CompanionsMt).
xc_source_file(a65b1404f34811,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34811,310).
xc_kb_names(a65b1404f34811,[]).
xc_mapping_rows(a65b1404f34811,[]).
x_isa(x_wrapUpValidationTest,x_ComplexActionPredicate) :- x_cid(a65b1404f34812).
xc_microtheory(a65b1404f34812,x_CompanionsMt).
xc_source_file(a65b1404f34812,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34812,312).
xc_kb_names(a65b1404f34812,[]).
xc_mapping_rows(a65b1404f34812,[]).
x_arity(x_wrapUpValidationTest,1) :- x_cid(a65b1404f34813).
xc_microtheory(a65b1404f34813,x_CompanionsMt).
xc_source_file(a65b1404f34813,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34813,313).
xc_kb_names(a65b1404f34813,[]).
xc_mapping_rows(a65b1404f34813,[]).
x_isa(x_trainOnCVTestFold,x_ComplexActionPredicate) :- x_cid(a65b1404f34814).
xc_microtheory(a65b1404f34814,x_CompanionsMt).
xc_source_file(a65b1404f34814,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34814,318).
xc_kb_names(a65b1404f34814,[]).
xc_mapping_rows(a65b1404f34814,[]).
x_arity(x_trainOnCVTestFold,3) :- x_cid(a65b1404f34815).
xc_microtheory(a65b1404f34815,x_CompanionsMt).
xc_source_file(a65b1404f34815,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34815,319).
xc_kb_names(a65b1404f34815,[]).
xc_mapping_rows(a65b1404f34815,[]).
x_isa(x_testOnCVTestFold,x_ComplexActionPredicate) :- x_cid(a65b1404f34816).
xc_microtheory(a65b1404f34816,x_CompanionsMt).
xc_source_file(a65b1404f34816,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34816,321).
xc_kb_names(a65b1404f34816,[]).
xc_mapping_rows(a65b1404f34816,[]).
x_arity(x_testOnCVTestFold,3) :- x_cid(a65b1404f34817).
xc_microtheory(a65b1404f34817,x_CompanionsMt).
xc_source_file(a65b1404f34817,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34817,322).
xc_kb_names(a65b1404f34817,[]).
xc_mapping_rows(a65b1404f34817,[]).
x_preconditionForMethod(x_and(x_groundExpression(V1),x_agendaContext(V2),x_currentSessionReasoner(V3),x_currentExecutive(V4),x_currentAgendaItem(V5),x_numAnswers(1,x_usesSetupMt(V1,V6)),x_numAnswers(1,x_usesBookkeepingMt(V1,V7)),'x_ist-Information'(V7,x_numberOfValidationRounds(V1,V8)),x_evaluate(V9,x_PlusFn(2,V8)),x_withBackchainingDepth(V9,x_enumerateFromToBy(1,V8,1,V10)),x_evaluate(V11,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V12,V13),x_unifies(V13,x_ValidationRoundFn(V1,V12)))),V10)),'x_ist-Information'(V7,x_evaluate(V14,x_RemoveIfFn(V11,x_experimentFinished,x_IdentityFn))),x_evaluate(V15,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V13,V12),x_unifies(V13,x_ValidationRoundFn(V1,V12)))),V14)),x_newUniqueTask(x_prepareForValidationTest,V16),x_newUniqueTask(x_wrapUpValidationTest,V17),x_evaluate(V18,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V12,V19),x_and(x_newUniqueTask(x_RunExperimentRound,V20),x_unifies(V19,x_TheList(V12,V20))))),V15)),x_evaluate(V21,x_MapFunctionOverList(x_SecondInListFn,V18))),x_methodForAction(x_runValidationTest(V1),x_actionSequence(x_TheList(x_doAnnounce("~%Running validation test ~a",[V1]),x_doTell('x_ist-Information'(V2,x_subTasks(V5,V16))),x_doTell('x_ist-Information'(V2,x_assignedTo(V16,V3))),x_doTell('x_ist-Information'(V2,x_taskImportance(V16,3))),x_ifThen(x_and(x_sessionContext(V22),x_holdsOnRemoteAgent(V4,'x_ist-Information'(V22,x_numVacantMachines(0))),x_implicitSequenceConstraints(V21,V23)),x_doForEach(V24,V23,x_doTell('x_ist-Information'(V2,V24)))),x_doForEach(V20,V21,x_actionSequence(x_TheList(x_doTell('x_ist-Information'(V2,x_startsAfterEndingOf(V20,V16))),x_doTell('x_ist-Information'(V2,x_startsAfterEndingOf(V17,V20))),x_doTell('x_ist-Information'(V2,x_subTasks(V5,V20))),x_doTell('x_ist-Information'(V2,x_taskImportance(V20,3))),x_doTell('x_ist-Information'(V2,x_assignedTo(V20,V4)))))),x_doTell('x_ist-Information'(V2,x_subTasks(V5,V17))),x_doTell('x_ist-Information'(V2,x_taskImportance(V17,3))),x_doTell('x_ist-Information'(V2,x_assignedTo(V17,V3))),x_doEnqueue(V3,V16,x_prepareForValidationTest(V1)),x_doForEach(x_TheList(V12,V20),V18,x_doEnqueue(V4,V20,x_delegateToNextAvailableWorker(x_runValidationTestRound(V1,V12),3))),x_doEnqueue(V3,V17,x_wrapUpValidationTest(V1)))))) :- x_cid(a65b1404f34818,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18,V19,V20,V21,V22,V23,V24).
xc_microtheory(a65b1404f34818,x_CompanionsMt).
xc_source_file(a65b1404f34818,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34818,335).
xc_kb_names(a65b1404f34818,["?test","?mt","?sr","?ex","?test-task","?setup-mt","?book-mt","?total-folds","?depth","?all-round-numbers","?all-rounds","?round-number","?round","?rounds","?round-numbers","?prep-task","?wrap-up-task","?round-task-pairs","?pair","?round-task","?round-tasks","?sctx","?seq-constraints","?seq-constraint"]).
xc_mapping_rows(a65b1404f34818,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 379, column 48), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34818,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 379, column 48), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_agendaContext(V1),x_localAgent(V2),x_currentAgendaItem(V3),x_currentSessionReasoner(V4),x_numAnswers(1,x_usesSetupMt(V5,V6)),x_numAnswers(1,x_usesBookkeepingMt(V5,V7)),x_unifies(V8,x_ValidationRoundFn(V5,V9)),x_numAnswers(1,x_usesSetupMt(V8,V10)),x_numAnswers(1,x_usesBookkeepingMt(V8,V11)),x_numAnswers(1,x_usesCaseLibrary(V5,V12)),x_numAnswers(1,x_usesCaseLibrary(V8,V13)),x_newUniqueTask(x_PrepareForRound,V14),x_newUniqueTask(x_TrainForRound,V15),x_newUniqueTask(x_TestForRound,V16),x_newUniqueTask(x_WrapUpRound,V17)),x_methodForAction(x_runValidationTestRound(V5,V9),x_actionSequence(x_TheList(x_doAnnounce("~%Running cross validation experiment round ~a for ~a",[V9,V5]),x_planSynchronouslyOnAgent(V4,x_copyKBSetupGenlMtsToAgent(V6,V2)),x_planSynchronouslyOnAgent(V4,x_copyKBBookkeepingSpecMtsToAgent(V7,V2)),x_doRecord('x_ist-Information'(x_BaseKB,x_genlMt(V10,V6))),x_doRecord('x_ist-Information'(x_BaseKB,x_genlMt(V7,V11))),x_doRecord('x_ist-Information'(x_BaseKB,x_genlMt(V11,V10))),x_doRecord('x_ist-Information'(x_BaseKB,x_genlMt(V11,x_CompanionsMt))),x_doRecord('x_ist-Information'(x_BaseKB,x_subCaseLibrary(V13,V12))),x_doRecord('x_ist-Information'(V10,x_isa(V8,x_CrossValidationTestRound))),x_doTell('x_ist-Information'(V1,x_startsAfterEndingOf(V15,V14))),x_doTell('x_ist-Information'(V1,x_startsAfterEndingOf(V16,V15))),x_doTell('x_ist-Information'(V1,x_startsAfterEndingOf(V17,V16))),x_doTell('x_ist-Information'(V1,x_subTasks(V3,V14))),x_doTell('x_ist-Information'(V1,x_subTasks(V3,V15))),x_doTell('x_ist-Information'(V1,x_subTasks(V3,V16))),x_doTell('x_ist-Information'(V1,x_subTasks(V3,V17))),x_doTell('x_ist-Information'(V1,x_assignedTo(V14,V2))),x_doTell('x_ist-Information'(V1,x_assignedTo(V15,V2))),x_doTell('x_ist-Information'(V1,x_assignedTo(V16,V2))),x_doTell('x_ist-Information'(V1,x_assignedTo(V17,V2))),x_doEnqueue(V2,V14,x_prepareForValidationTestRound(V5,V9)),x_doEnqueue(V2,V15,x_trainForValidationTestRound(V5,V9)),x_doEnqueue(V2,V16,x_testForValidationTestRound(V5,V9)),x_doEnqueue(V2,V17,x_wrapUpValidationTestRound(V5,V9)))))) :- x_cid(a65b1404f34819,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17).
xc_microtheory(a65b1404f34819,x_CompanionsMt).
xc_source_file(a65b1404f34819,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34819,418).
xc_kb_names(a65b1404f34819,["?mt","?local-agent","?round-task","?sr","?test","?test-setup-mt","?test-book-mt","?round","?round-number","?round-setup-mt","?round-book-mt","?test-lib","?round-lib","?round-prep-task","?round-training-task","?round-testing-task","?round-wrap-up-task"]).
xc_mapping_rows(a65b1404f34819,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 438, column 73), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34819,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 438, column 73), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_uninferredSentence(x_currentSessionReasoner(V1)),x_methodForAction(x_runValidationTestRound(V2,V3),x_actionSequence(x_TheList(x_doAnnounce("~%Failed to run cross validation experiment round ~a for ~a",[V3,V2]))))) :- x_cid(a65b1404f3481a,V1,V2,V3).
xc_microtheory(a65b1404f3481a,x_CompanionsMt).
xc_source_file(a65b1404f3481a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3481a,472).
xc_kb_names(a65b1404f3481a,["?sr","?test","?round-number"]).
xc_mapping_rows(a65b1404f3481a,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 479, column 83), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f3481a,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 479, column 83), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_unifies(V1,x_ValidationRoundFn(V2,V3)),x_numAnswers(1,x_usesBookkeepingMt(V1,V4)),x_numAnswers(1,x_usesBookkeepingMt(V2,V5)),'x_ist-Information'(V5,x_isa(V2,x_CrossValidationTest)),x_uninferredSentence('x_ist-Information'(V4,x_trainedOn(V2))),x_agendaContext(V6),x_currentSessionReasoner(V7),x_localAgent(V8),x_currentAgendaItem(V9),'x_ist-Information'(V4,x_trainingFoldsForCVTestRound(V2,V3,V10)),x_evaluate(V11,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V12,V13),x_and(x_newUniqueTask(x_TrainOnFold,V14),x_evaluate(V15,x_PositionInListFn(V12,V10)),x_evaluate(V16,x_PlusFn(V15,-1)),x_unifies(V13,x_TheList(V12,V14,V15,V16))))),V10)),x_evaluate(V17,x_MapFunctionOverList(x_SecondInListFn,V11)),x_evaluate(V18,x_ListToSetFn(V17)),x_evaluate(V19,x_CardinalityFn(V18)),x_implicitSequenceConstraints(V17,V20),x_newUniqueTask(x_ExitLastState,V21),x_currentDate(V22),x_currentTime(V23)),x_methodForAction(x_trainForValidationTestRound(V2,V3),x_actionSequence(x_TheList(x_doEnterState("training",[]),x_doAnnounce("~%Training on experiment round ~a for ~a",[V3,V2]),x_doRecord('x_ist-Information'(V4,x_startingDate(x_TrainingPhaseFn(V1),V22))),x_doRecord('x_ist-Information'(V4,x_startingTime(x_TrainingPhaseFn(V1),V23))),x_doForEach(V24,V20,x_doTell('x_ist-Information'(V6,V24))),x_doForEach(V14,V17,x_actionSequence(x_TheList(x_doTell('x_ist-Information'(V6,x_subTasks(V9,V14))),x_doTell('x_ist-Information'(V6,x_assignedTo(V14,V8))),x_doTell('x_ist-Information'(V6,x_taskImportance(V14,4))),x_doTell('x_ist-Information'(V6,x_startsAfterEndingOf(V21,V14)))))),x_doTell('x_ist-Information'(V6,x_subTasks(V9,V21))),x_doTell('x_ist-Information'(V6,x_assignedTo(V21,V8))),x_doTell('x_ist-Information'(V6,x_taskImportance(V21,4))),x_doForEach(x_TheList(V25,V14,V15,V16),V11,x_doEnqueue(V8,V14,x_actionSequence(x_TheList(x_ifThen(x_different(V15,1),x_doExitState("f~A",[V16])),x_doEnterState("f~A",[V15]),x_trainOnCVTestFold(V2,V3,V25))))),x_doEnqueue(V8,V21,x_doExitState("f~A",[V19])),x_enqueueImmediateSuccessorTask(x_doRecord('x_ist-Information'(V4,x_trainedOn(V1)))))))) :- x_cid(a65b1404f3481b,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18,V19,V20,V21,V22,V23,V24,V25).
xc_microtheory(a65b1404f3481b,x_CompanionsMt).
xc_source_file(a65b1404f3481b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3481b,485).
xc_kb_names(a65b1404f3481b,["?round","?test","?round-number","?round-book-mt","?test-book-mt","?mt","?sr","?local-agent","?round-training-task","?training-folds","?fold-task-number-tuples","?training-fold","?tuple","?training-task","?num","?num-1","?training-tasks","?training-task-set","?n-folds","?seq-constraints","?exit-task","?start-date","?start-time","?seq-constraint","?fold"]).
xc_mapping_rows(a65b1404f3481b,[note("doEnterState argument 2 is preserved as recursive list data (descriptor at source line 521, column 30), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 522, column 60), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doExitState argument 2 is preserved as recursive list data (descriptor at source line 543, column 75), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doEnterState argument 2 is preserved as recursive list data (descriptor at source line 544, column 49), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doExitState argument 2 is preserved as recursive list data (descriptor at source line 547, column 35), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f3481b,["doEnterState argument 2 is preserved as recursive list data (descriptor at source line 521, column 30), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 522, column 60), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doExitState argument 2 is preserved as recursive list data (descriptor at source line 543, column 75), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doEnterState argument 2 is preserved as recursive list data (descriptor at source line 544, column 49), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doExitState argument 2 is preserved as recursive list data (descriptor at source line 547, column 35), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_unifies(V1,x_ValidationRoundFn(V2,V3)),x_numAnswers(1,x_usesBookkeepingMt(V1,V4)),x_numAnswers(1,x_usesBookkeepingMt(V2,V5)),'x_ist-Information'(V5,x_isa(V2,x_PartitionedValidationTest)),x_uninferredSentence('x_ist-Information'(V4,x_trainedOn(V2))),x_agendaContext(V6),x_localAgent(V7),x_currentAgendaItem(V8),x_numAnswers(1,'x_ist-Information'(V4,x_examplesInTrainingSet(V2,V3,V9))),'x_ist-Information'(V4,x_evaluate(V10,x_RemoveIfFn(V9,x_trainedOn,x_IdentityFn))),x_evaluate(V11,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V12,V13),x_and(x_newUniqueTask(x_TrainOnExample,V14),x_unifies(V13,x_TheList(V12,V14))))),V10)),x_evaluate(V15,x_MapFunctionOverList(x_SecondInListFn,V11)),x_evaluate(V16,x_ListToSetFn(V15)),x_implicitSequenceConstraints(V15,V17),x_currentDate(V18),x_currentTime(V19)),x_methodForAction(x_trainForValidationTestRound(V2,V3),x_actionSequence(x_TheList(x_doEnterState("training",[]),x_doAnnounce("~%Training on experiment round ~a for ~a",[V3,V2]),x_doRecord('x_ist-Information'(V4,x_startingDate(x_TrainingPhaseFn(V1),V18))),x_doRecord('x_ist-Information'(V4,x_startingTime(x_TrainingPhaseFn(V1),V19))),x_doForEach(V20,V17,x_doTell('x_ist-Information'(V6,V20))),x_doForEach(V21,V15,x_actionSequence(x_TheList(x_doTell('x_ist-Information'(V6,x_subTasks(V8,V21))),x_doTell('x_ist-Information'(V6,x_assignedTo(V21,V7))),x_doTell('x_ist-Information'(V6,x_taskImportance(V21,4)))))),x_doForEach(x_TheList(V12,V21),V11,x_doEnqueue(V7,V21,x_doAgentPlan(x_trainOnExample(V1,V12)))),x_enqueueImmediateSuccessorTask(x_doRecord('x_ist-Information'(V4,x_trainedOn(V1)))))))) :- x_cid(a65b1404f3481c,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18,V19,V20,V21).
xc_microtheory(a65b1404f3481c,x_CompanionsMt).
xc_source_file(a65b1404f3481c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3481c,555).
xc_kb_names(a65b1404f3481c,["?round","?test","?round-number","?round-book-mt","?test-book-mt","?mt","?local-agent","?round-training-task","?examples","?remaining-examples","?example-task-pairs","?example","?pair","?learning-task","?training-tasks","?training-task-set","?seq-constraints","?start-date","?start-time","?seq-constraint","?training-task"]).
xc_mapping_rows(a65b1404f3481c,[note("doEnterState argument 2 is preserved as recursive list data (descriptor at source line 593, column 30), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 594, column 60), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f3481c,["doEnterState argument 2 is preserved as recursive list data (descriptor at source line 593, column 30), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 594, column 60), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_unifies(V1,x_ValidationRoundFn(V2,V3)),x_numAnswers(1,x_usesBookkeepingMt(V1,V4)),x_numAnswers(1,x_usesBookkeepingMt(V2,V5)),'x_ist-Information'(V5,x_isa(V2,x_PartitionedValidationTest)),x_uninferredSentence('x_ist-Information'(V4,x_trainedOn(V2))),x_agendaContext(V6),x_localAgent(V7),x_currentAgendaItem(V8),x_uninferredSentence('x_ist-Information'(V4,x_examplesInTrainingSet(V2,V3,V9))),'x_ist-Information'(V4,x_examplesPerConceptInExperiment(V10))),x_methodForAction(x_trainForValidationTestRound(V2,V3),x_actionSequence(x_TheList(x_doAnnounce("trainForValidationTestRound FAILED:~%  Verify that ~A training examples exist of each label",[V10]))))) :- x_cid(a65b1404f3481d,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b1404f3481d,x_CompanionsMt).
xc_source_file(a65b1404f3481d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3481d,614).
xc_kb_names(a65b1404f3481d,["?round","?test","?round-number","?round-book-mt","?test-book-mt","?mt","?local-agent","?round-training-task","?examples","?num-examples"]).
xc_mapping_rows(a65b1404f3481d,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 634, column 111), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f3481d,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 634, column 111), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_unifies(V1,x_ValidationRoundFn(V2,V3)),x_numAnswers(1,x_usesBookkeepingMt(V1,V4)),x_numAnswers(1,x_usesBookkeepingMt(V2,V5)),'x_ist-Information'(V5,x_isa(V2,x_CrossValidationTest)),x_agendaContext(V6),x_currentSessionReasoner(V7),x_localAgent(V8),x_currentAgendaItem(V9),x_unifies(V1,x_ValidationRoundFn(V2,V3)),'x_ist-Information'(V4,x_testingFoldsForCVTestRound(V2,V3,V10)),x_evaluate(V11,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V12,V13),x_and(x_newUniqueTask(x_TestOnFold,V14),x_unifies(V13,x_TheList(V12,V14))))),V10)),x_evaluate(V15,x_MapFunctionOverList(x_SecondInListFn,V11)),x_evaluate(V16,x_ListToSetFn(V15)),x_implicitSequenceConstraints(V15,V17),'x_ist-Information'(V4,x_startingDate(x_TrainingPhaseFn(V1),V18)),'x_ist-Information'(V4,x_startingTime(x_TrainingPhaseFn(V1),V19)),x_currentDate(V20),x_currentTime(V21),'x_intervalDuration-Minutes'(V18,V19,V20,V21,V22),x_unifies(V22,x_MinutesDuration(V23))),x_methodForAction(x_testForValidationTestRound(V2,V3),x_actionSequence(x_TheList(x_doExitState("training",[]),x_doEnterState("testing",[]),x_doAnnounce("~%Testing on experiment round ~a for ~a",[V3,V2]),x_doRecord('x_ist-Information'(V4,x_endingDate(x_TrainingPhaseFn(V1),V20))),x_doRecord('x_ist-Information'(V4,x_endingTime(x_TrainingPhaseFn(V1),V21))),x_doRecord('x_ist-Information'(V4,'x_duration-Minutes'(x_TrainingPhaseFn(V1),V23))),x_doRecord('x_ist-Information'(V5,'x_duration-Minutes'(x_TrainingPhaseFn(V1),V23))),x_doRecord('x_ist-Information'(V4,x_startingDate(x_TestingPhaseFn(V1),V20))),x_doRecord('x_ist-Information'(V4,x_startingTime(x_TestingPhaseFn(V1),V21))),x_doForEach(V24,V17,x_doTell('x_ist-Information'(V6,V24))),x_doForEach(V14,V15,x_actionSequence(x_TheList(x_doTell('x_ist-Information'(V6,x_subTasks(V9,V14))),x_doTell('x_ist-Information'(V6,x_taskImportance(V14,4.5))),x_doTell('x_ist-Information'(V6,x_assignedTo(V14,V8)))))),x_doForEach(x_TheList(V25,V14),V11,x_doEnqueue(V8,V14,x_testOnCVTestFold(V2,V3,V25))),x_enqueueImmediateSuccessorTask(x_doRecord('x_ist-Information'(V4,x_testedOn(V1)))))))) :- x_cid(a65b1404f3481e,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18,V19,V20,V21,V22,V23,V24,V25).
xc_microtheory(a65b1404f3481e,x_CompanionsMt).
xc_source_file(a65b1404f3481e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3481e,640).
xc_kb_names(a65b1404f3481e,["?round","?test","?round-number","?round-book-mt","?test-book-mt","?mt","?sr","?local-agent","?round-testing-task","?testing-folds","?fold-task-pairs","?testing-fold","?pair","?testing-task","?testing-tasks","?testing-task-set","?seq-constraints","?train-start-date","?train-start-time","?cur-date","?cur-time","?elapsed","?elapsed-min","?seq-constraint","?fold"]).
xc_mapping_rows(a65b1404f3481e,[note("doExitState argument 2 is preserved as recursive list data (descriptor at source line 676, column 29), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doEnterState argument 2 is preserved as recursive list data (descriptor at source line 677, column 29), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 678, column 59), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f3481e,["doExitState argument 2 is preserved as recursive list data (descriptor at source line 676, column 29), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doEnterState argument 2 is preserved as recursive list data (descriptor at source line 677, column 29), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 678, column 59), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_unifies(V1,x_ValidationRoundFn(V2,V3)),x_numAnswers(1,x_usesBookkeepingMt(V1,V4)),x_numAnswers(1,x_usesBookkeepingMt(V2,V5)),'x_ist-Information'(V5,x_isa(V2,x_PartitionedValidationTest)),x_agendaContext(V6),x_localAgent(V7),x_currentAgendaItem(V8),x_uninferredSentence('x_ist-Information'(V4,x_testedOn(V1))),'x_ist-Information'(V4,x_numAnswers(1,x_examplesInTestingSet(V2,V9))),'x_ist-Information'(V4,x_evaluate(V10,x_RemoveIfFn(V9,x_testedOn,x_IdentityFn))),x_evaluate(V11,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V12,V13),x_and(x_newUniqueTask(x_TestOnExample,V14),x_unifies(V13,x_TheList(V12,V14))))),V10)),x_evaluate(V15,x_MapFunctionOverList(x_SecondInListFn,V11)),x_evaluate(V16,x_ListToSetFn(V15)),x_implicitSequenceConstraints(V15,V17),'x_ist-Information'(V4,x_startingDate(x_TrainingPhaseFn(V1),V18)),'x_ist-Information'(V4,x_startingTime(x_TrainingPhaseFn(V1),V19)),x_currentDate(V20),x_currentTime(V21),'x_intervalDuration-Minutes'(V18,V19,V20,V21,V22),x_unifies(V22,x_MinutesDuration(V23))),x_methodForAction(x_testForValidationTestRound(V2,V3),x_actionSequence(x_TheList(x_doExitState("training",[]),x_doEnterState("testing",[]),x_doAnnounce("~%Testing on experiment round ~a for ~a",[V3,V2]),x_doRecord('x_ist-Information'(V4,x_endingDate(x_TrainingPhaseFn(V1),V20))),x_doRecord('x_ist-Information'(V4,x_endingTime(x_TrainingPhaseFn(V1),V21))),x_doRecord('x_ist-Information'(V4,'x_duration-Minutes'(x_TrainingPhaseFn(V1),V23))),x_doRecord('x_ist-Information'(V5,'x_duration-Minutes'(x_TrainingPhaseFn(V1),V23))),x_doRecord('x_ist-Information'(V4,x_startingDate(x_TestingPhaseFn(V1),V20))),x_doRecord('x_ist-Information'(V4,x_startingTime(x_TestingPhaseFn(V1),V21))),x_doForEach(V24,V17,x_doTell('x_ist-Information'(V6,V24))),x_doForEach(V25,V15,x_actionSequence(x_TheList(x_doTell('x_ist-Information'(V6,x_subTasks(V8,V25))),x_doTell('x_ist-Information'(V6,x_taskImportance(V25,4.5))),x_doTell('x_ist-Information'(V6,x_assignedTo(V25,V7)))))),x_doForEach(x_TheList(V12,V25),V11,x_doEnqueue(V7,V25,x_testOnExample(V1,V12))),x_enqueueImmediateSuccessorTask(x_doRecord('x_ist-Information'(V4,x_testedOn(V2)))))))) :- x_cid(a65b1404f3481f,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18,V19,V20,V21,V22,V23,V24,V25).
xc_microtheory(a65b1404f3481f,x_CompanionsMt).
xc_source_file(a65b1404f3481f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3481f,708).
xc_kb_names(a65b1404f3481f,["?round","?test","?round-number","?round-book-mt","?test-book-mt","?mt","?local-agent","?parent-task","?examples","?remaining-examples","?example-task-pairs","?example","?pair","?learning-task","?testing-tasks","?testing-task-set","?seq-constraints","?train-start-date","?train-start-time","?cur-date","?cur-time","?elapsed","?elapsed-min","?seq-constraint","?testing-task"]).
xc_mapping_rows(a65b1404f3481f,[note("doExitState argument 2 is preserved as recursive list data (descriptor at source line 750, column 29), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doEnterState argument 2 is preserved as recursive list data (descriptor at source line 751, column 29), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 752, column 59), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f3481f,["doExitState argument 2 is preserved as recursive list data (descriptor at source line 750, column 29), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doEnterState argument 2 is preserved as recursive list data (descriptor at source line 751, column 29), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 752, column 59), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_numAnswers(1,x_usesBookkeepingMt(V1,V2)),x_unifies(V3,x_ValidationRoundFn(V1,V4)),x_numAnswers(1,x_usesBookkeepingMt(V3,V5)),x_agendaContext(V6),x_currentSessionReasoner(V7),x_localAgent(V8),x_currentAgendaItem(V9),x_uninferredSentence('x_ist-Information'(V5,x_trainedOn(V10))),'x_ist-Information'(V2,x_numAnswers(1,x_examplesInCVTestFold(V1,V10,V11))),'x_ist-Information'(V5,x_evaluate(V12,x_RemoveIfFn(V11,x_trainedOn,x_IdentityFn))),x_evaluate(V13,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V14,V15),x_and(x_newUniqueTask(x_TrainOnExample,V16),x_unifies(V15,x_TheList(V14,V16))))),V12)),x_evaluate(V17,x_MapFunctionOverList(x_SecondInListFn,V13)),x_evaluate(V18,x_ListToSetFn(V17)),x_implicitSequenceConstraints(V17,V19)),x_methodForAction(x_trainOnCVTestFold(V1,V4,V10),x_actionSequence(x_TheList(x_doAnnounce("Training on experiment fold ~a for ~a",[V10,V1]),x_doForEach(V20,V19,x_doTell('x_ist-Information'(V6,V20))),x_doForEach(V21,V17,x_actionSequence(x_TheList(x_doTell('x_ist-Information'(V6,x_subTasks(V9,V21))),x_doTell('x_ist-Information'(V6,x_taskImportance(V21,4.5))),x_doTell('x_ist-Information'(V6,x_assignedTo(V21,V8)))))),x_doForEach(x_TheList(V14,V21),V13,x_doEnqueue(V8,V21,x_doAgentPlan(x_trainOnExample(V3,V14)))),x_enqueueImmediateSuccessorTask(x_doRecord('x_ist-Information'(V5,x_trainedOn(V10)))))))) :- x_cid(a65b1404f34820,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18,V19,V20,V21).
xc_microtheory(a65b1404f34820,x_CompanionsMt).
xc_source_file(a65b1404f34820,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34820,782).
xc_kb_names(a65b1404f34820,["?test","?book-mt","?round","?round-number","?round-book-mt","?mt","?sr","?local-agent","?fold-task","?fold","?examples","?remaining-examples","?example-task-pairs","?example","?pair","?learning-task","?training-tasks","?training-task-set","?seq-constraints","?seq-constraint","?training-task"]).
xc_mapping_rows(a65b1404f34820,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 817, column 57), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34820,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 817, column 57), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_unifies(V1,x_ValidationRoundFn(V2,V3)),x_numAnswers(1,x_usesBookkeepingMt(V1,V4)),'x_ist-Information'(V4,x_trainedOn(V5))),x_methodForAction(x_trainOnCVTestFold(V2,V3,V5),x_actionSequence(x_TheList(x_doAnnounce("Already trained on fold ~a.",[V5]))))) :- x_cid(a65b1404f34821,V1,V2,V3,V4,V5).
xc_microtheory(a65b1404f34821,x_CompanionsMt).
xc_source_file(a65b1404f34821,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34821,834).
xc_kb_names(a65b1404f34821,["?round","?test","?round-number","?round-book-mt","?fold"]).
xc_mapping_rows(a65b1404f34821,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 843, column 50), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34821,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 843, column 50), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
'x_<=='(x_preferInContext(x_trainOnCVTestFold(V1,V2,V3),V4,V5),x_equals(V4,x_actionSequence(x_TheList(x_doAnnounce("Already trained on fold ~a.",[V3]))))) :- x_cid(a65b1404f34822,V1,V2,V3,V4,V5).
xc_microtheory(a65b1404f34822,x_CompanionsMt).
xc_source_file(a65b1404f34822,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34822,845).
xc_kb_names(a65b1404f34822,["?test","?round-number","?fold","?seq1","?seq2"]).
xc_mapping_rows(a65b1404f34822,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 848, column 64), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34822,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 848, column 64), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_agendaContext(V1),x_currentSessionReasoner(V2),x_localAgent(V3),x_currentAgendaItem(V4),x_numAnswers(1,x_usesBookkeepingMt(V5,V6)),x_unifies(V7,x_ValidationRoundFn(V5,V8)),x_numAnswers(1,x_usesBookkeepingMt(V7,V9)),x_uninferredSentence('x_ist-Information'(V9,x_testedOn(V10))),'x_ist-Information'(V6,x_numAnswers(1,x_examplesInCVTestFold(V5,V10,V11))),'x_ist-Information'(V9,x_evaluate(V12,x_RemoveIfFn(V11,x_testedOn,x_IdentityFn))),x_evaluate(V13,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V14,V15),x_and(x_newUniqueTask(x_TestOnExample,V16),x_unifies(V15,x_TheList(V14,V16))))),V12)),x_evaluate(V17,x_MapFunctionOverList(x_SecondInListFn,V13)),x_evaluate(V18,x_ListToSetFn(V17)),x_implicitSequenceConstraints(V17,V19)),x_methodForAction(x_testOnCVTestFold(V5,V8,V10),x_actionSequence(x_TheList(x_doAnnounce("Testing on experiment fold ~a for ~a",[V10,V5]),x_doForEach(V20,V19,x_doTell('x_ist-Information'(V1,V20))),x_doForEach(V21,V17,x_actionSequence(x_TheList(x_doTell('x_ist-Information'(V1,x_subTasks(V4,V21))),x_doTell('x_ist-Information'(V1,x_taskImportance(V21,4.5))),x_doTell('x_ist-Information'(V1,x_assignedTo(V21,V3)))))),x_doForEach(x_TheList(V14,V21),V13,x_doEnqueue(V3,V21,x_testOnExample(V7,V14))),x_enqueueImmediateSuccessorTask(x_doRecord('x_ist-Information'(V9,x_testedOn(V10)))))))) :- x_cid(a65b1404f34823,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18,V19,V20,V21).
xc_microtheory(a65b1404f34823,x_CompanionsMt).
xc_source_file(a65b1404f34823,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34823,854).
xc_kb_names(a65b1404f34823,["?mt","?sr","?local-agent","?fold-task","?test","?book-mt","?round","?round-number","?round-book-mt","?fold","?examples","?remaining-examples","?example-task-pairs","?example","?pair","?learning-task","?testing-tasks","?testing-task-set","?seq-constraints","?seq-constraint","?testing-task"]).
xc_mapping_rows(a65b1404f34823,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 888, column 56), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34823,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 888, column 56), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_unifies(V1,x_ValidationRoundFn(V2,V3)),x_numAnswers(1,x_usesBookkeepingMt(V1,V4)),'x_ist-Information'(V4,x_testedOn(V5))),x_methodForAction(x_testOnCVTestFold(V2,V3,V5),x_actionSequence(x_TheList(x_doAnnounce("Already tested on fold ~a.",[V5]))))) :- x_cid(a65b1404f34824,V1,V2,V3,V4,V5).
xc_microtheory(a65b1404f34824,x_CompanionsMt).
xc_source_file(a65b1404f34824,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34824,904).
xc_kb_names(a65b1404f34824,["?round","?test","?round-number","?round-book-mt","?fold"]).
xc_mapping_rows(a65b1404f34824,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 913, column 49), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34824,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 913, column 49), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
'x_<=='(x_preferInContext(x_testOnCVTestFold(V1,V2,V3),V4,V5),x_equals(V4,x_actionSequence(x_TheList(x_doAnnounce("Already tested on fold ~a.",[V3]))))) :- x_cid(a65b1404f34825,V1,V2,V3,V4,V5).
xc_microtheory(a65b1404f34825,x_CompanionsMt).
xc_source_file(a65b1404f34825,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34825,915).
xc_kb_names(a65b1404f34825,["?test","?round-number","?fold","?seq1","?seq2"]).
xc_mapping_rows(a65b1404f34825,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 918, column 63), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34825,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 918, column 63), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_prepareForValidationTest(V1),x_actionSequence(x_TheList(x_doAnnounce("Default stub for prepareForValidationTest. There is no acceptable method defined.",[]))))) :- x_cid(a65b1404f34826,V1).
xc_microtheory(a65b1404f34826,x_CompanionsMt).
xc_source_file(a65b1404f34826,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34826,932).
xc_kb_names(a65b1404f34826,["?test"]).
xc_mapping_rows(a65b1404f34826,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 938, column 101), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34826,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 938, column 101), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_numAnswers(1,x_usesBookkeepingMt(V1,V2)),'x_ist-Information'(V2,x_preparedFor(V1))),x_methodForAction(x_prepareForValidationTest(V1),x_actionSequence(x_TheList(x_doAnnounce("Already prepared for ~a.",[V1]))))) :- x_cid(a65b1404f34827,V1,V2).
xc_microtheory(a65b1404f34827,x_CompanionsMt).
xc_source_file(a65b1404f34827,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34827,940).
xc_kb_names(a65b1404f34827,["?test","?book-mt"]).
xc_mapping_rows(a65b1404f34827,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 947, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34827,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 947, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
'x_<=='(x_preferInContext(x_prepareForValidationTest(V1),V2,V3),x_equals(V3,x_actionSequence(x_TheList(x_doAnnounce("Default stub for prepareForValidationTest. There is no acceptable method defined.",[]))))) :- x_cid(a65b1404f34828,V1,V2,V3).
xc_microtheory(a65b1404f34828,x_CompanionsMt).
xc_source_file(a65b1404f34828,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34828,949).
xc_kb_names(a65b1404f34828,["?test","?seq1","?seq2"]).
xc_mapping_rows(a65b1404f34828,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 952, column 118), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34828,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 952, column 118), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
'x_<=='(x_preferInContext(x_prepareForValidationTest(V1),V2,V3),x_equals(V2,x_actionSequence(x_TheList(x_doAnnounce("Already prepared for ~a.",[V1]))))) :- x_cid(a65b1404f34829,V1,V2,V3).
xc_microtheory(a65b1404f34829,x_CompanionsMt).
xc_source_file(a65b1404f34829,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34829,954).
xc_kb_names(a65b1404f34829,["?test","?seq1","?seq2"]).
xc_mapping_rows(a65b1404f34829,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 957, column 61), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34829,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 957, column 61), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_prepareForValidationTestRound(V1,V2),x_actionSequence(x_TheList(x_doAnnounce("Default stub for prepareForValidationTestRound. There is no acceptable method defined.",[]))))) :- x_cid(a65b1404f3482a,V1,V2).
xc_microtheory(a65b1404f3482a,x_CompanionsMt).
xc_source_file(a65b1404f3482a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3482a,963).
xc_kb_names(a65b1404f3482a,["?test","?round-number"]).
xc_mapping_rows(a65b1404f3482a,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 969, column 106), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f3482a,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 969, column 106), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_unifies(V1,x_ValidationRoundFn(V2,V3)),x_numAnswers(1,x_usesBookkeepingMt(V1,V4)),'x_ist-Information'(V4,x_preparedFor(V1))),x_methodForAction(x_prepareForValidationTestRound(V2,V3),x_actionSequence(x_TheList(x_doAnnounce("Already prepared for ~a.",[V1]))))) :- x_cid(a65b1404f3482b,V1,V2,V3,V4).
xc_microtheory(a65b1404f3482b,x_CompanionsMt).
xc_source_file(a65b1404f3482b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3482b,971).
xc_kb_names(a65b1404f3482b,["?round","?test","?round-number","?book-mt"]).
xc_mapping_rows(a65b1404f3482b,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 979, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f3482b,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 979, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
'x_<=='(x_preferInContext(x_prepareForValidationTestRound(V1,V2),V3,V4),x_equals(V4,x_actionSequence(x_TheList(x_doAnnounce("Default stub for prepareForValidationTestRound. There is no acceptable method defined.",[]))))) :- x_cid(a65b1404f3482c,V1,V2,V3,V4).
xc_microtheory(a65b1404f3482c,x_CompanionsMt).
xc_source_file(a65b1404f3482c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3482c,981).
xc_kb_names(a65b1404f3482c,["?test","?round-number","?seq1","?seq2"]).
xc_mapping_rows(a65b1404f3482c,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 984, column 123), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f3482c,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 984, column 123), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
'x_<=='(x_preferInContext(x_prepareForValidationTestRound(V1,V2),V3,V4),x_equals(V3,x_actionSequence(x_TheList(x_doAnnounce("Already prepared for ~a.",[V5]))))) :- x_cid(a65b1404f3482d,V1,V2,V3,V4,V5).
xc_microtheory(a65b1404f3482d,x_CompanionsMt).
xc_source_file(a65b1404f3482d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3482d,986).
xc_kb_names(a65b1404f3482d,["?test","?round-number","?seq1","?seq2","?round"]).
xc_mapping_rows(a65b1404f3482d,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 989, column 61), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f3482d,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 989, column 61), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_trainOnExample(V1,V2),x_actionSequence(x_TheList(x_doAnnounce("Default stub for trainOnExample. There is no acceptable method defined.",[]))))) :- x_cid(a65b1404f3482e,V1,V2).
xc_microtheory(a65b1404f3482e,x_CompanionsMt).
xc_source_file(a65b1404f3482e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3482e,994).
xc_kb_names(a65b1404f3482e,["?round","?example"]).
xc_mapping_rows(a65b1404f3482e,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 1000, column 91), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f3482e,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 1000, column 91), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_unifies(V1,x_ValidationRoundFn(V2,V3)),x_numAnswers(1,x_usesBookkeepingMt(V1,V4)),'x_ist-Information'(V4,x_trainedOn(V5))),x_methodForAction(x_trainOnExample(V1,V5),x_actionSequence(x_TheList(x_doAnnounce("Already trained on example ~a.",[V5]))))) :- x_cid(a65b1404f3482f,V1,V2,V3,V4,V5).
xc_microtheory(a65b1404f3482f,x_CompanionsMt).
xc_source_file(a65b1404f3482f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3482f,1002).
xc_kb_names(a65b1404f3482f,["?round","?test","?round-number","?round-book-mt","?example"]).
xc_mapping_rows(a65b1404f3482f,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 1010, column 53), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f3482f,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 1010, column 53), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
'x_<=='(x_preferInContext(x_trainOnExample(V1,V2),V3,V4),x_equals(V4,x_actionSequence(x_TheList(x_doAnnounce("Default stub for trainOnExample. There is no acceptable method defined.",[]))))) :- x_cid(a65b1404f34830,V1,V2,V3,V4).
xc_microtheory(a65b1404f34830,x_CompanionsMt).
xc_source_file(a65b1404f34830,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34830,1012).
xc_kb_names(a65b1404f34830,["?round","?example","?seq1","?seq2"]).
xc_mapping_rows(a65b1404f34830,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 1015, column 108), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34830,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 1015, column 108), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
'x_<=='(x_preferInContext(x_trainOnExample(V1,V2),V3,V4),x_equals(V3,x_actionSequence(x_TheList(x_doAnnounce("Already trained on example ~a.",[V2]))))) :- x_cid(a65b1404f34831,V1,V2,V3,V4).
xc_microtheory(a65b1404f34831,x_CompanionsMt).
xc_source_file(a65b1404f34831,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34831,1017).
xc_kb_names(a65b1404f34831,["?round","?example","?seq1","?seq2"]).
xc_mapping_rows(a65b1404f34831,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 1020, column 67), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34831,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 1020, column 67), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_testOnExample(V1,V2),x_actionSequence(x_TheList(x_doAnnounce("Default stub for testOnExample. There is no acceptable method defined.",[]))))) :- x_cid(a65b1404f34832,V1,V2).
xc_microtheory(a65b1404f34832,x_CompanionsMt).
xc_source_file(a65b1404f34832,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34832,1026).
xc_kb_names(a65b1404f34832,["?round","?example"]).
xc_mapping_rows(a65b1404f34832,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 1032, column 90), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34832,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 1032, column 90), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_unifies(V1,x_ValidationRoundFn(V2,V3)),x_numAnswers(1,x_usesBookkeepingMt(V1,V4)),'x_ist-Information'(V4,x_testedOn(V5))),x_methodForAction(x_testOnExample(V1,V5),x_actionSequence(x_TheList(x_doAnnounce("Already tested on example ~a.",[V5]))))) :- x_cid(a65b1404f34833,V1,V2,V3,V4,V5).
xc_microtheory(a65b1404f34833,x_CompanionsMt).
xc_source_file(a65b1404f34833,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34833,1034).
xc_kb_names(a65b1404f34833,["?round","?test","?round-number","?round-book-mt","?example"]).
xc_mapping_rows(a65b1404f34833,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 1042, column 49), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34833,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 1042, column 49), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
'x_<=='(x_preferInContext(x_testOnExample(V1,V2),V3,V4),x_equals(V4,x_actionSequence(x_TheList(x_doAnnounce("Default stub for testOnExample. There is no acceptable method defined.",[]))))) :- x_cid(a65b1404f34834,V1,V2,V3,V4).
xc_microtheory(a65b1404f34834,x_CompanionsMt).
xc_source_file(a65b1404f34834,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34834,1044).
xc_kb_names(a65b1404f34834,["?round","?example","?seq1","?seq2"]).
xc_mapping_rows(a65b1404f34834,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 1047, column 107), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34834,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 1047, column 107), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
'x_<=='(x_preferInContext(x_testOnExample(V1,V2),V3,V4),x_equals(V3,x_actionSequence(x_TheList(x_doAnnounce("Already tested on example ~a.",[V2]))))) :- x_cid(a65b1404f34835,V1,V2,V3,V4).
xc_microtheory(a65b1404f34835,x_CompanionsMt).
xc_source_file(a65b1404f34835,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34835,1049).
xc_kb_names(a65b1404f34835,["?round","?example","?seq1","?seq2"]).
xc_mapping_rows(a65b1404f34835,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 1052, column 66), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1404f34835,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 1052, column 66), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_currentSessionReasoner(V1),x_methodForAction(x_wrapUpValidationTestRound(V2,V3),x_actionSequence(x_TheList))) :- x_cid(a65b1404f34836,V1,V2,V3).
xc_microtheory(a65b1404f34836,x_CompanionsMt).
xc_source_file(a65b1404f34836,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34836,1058).
xc_kb_names(a65b1404f34836,["?sr","?test","?round-number"]).
xc_mapping_rows(a65b1404f34836,[]).
'x_<=='(x_preferInContext(x_wrapUpValidationTestRound(V1,V2),V3,V4),x_equals(V4,x_actionSequence(x_TheList))) :- x_cid(a65b1404f34837,V1,V2,V3,V4).
xc_microtheory(a65b1404f34837,x_CompanionsMt).
xc_source_file(a65b1404f34837,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34837,1065).
xc_kb_names(a65b1404f34837,["?test","?round-number","?seq1","?seq2"]).
xc_mapping_rows(a65b1404f34837,[]).
x_preconditionForMethod(x_and(x_currentSessionReasoner(V1),x_currentExecutive(V2),x_numAnswers(1,x_usesBookkeepingMt(V3,V4)),'x_ist-Information'(V4,x_startingDate(V3,V5)),'x_ist-Information'(V4,x_startingTime(V3,V6)),x_currentDate(V7),x_currentTime(V8),'x_intervalDuration-Minutes'(V5,V6,V7,V8,V9),x_unifies(V9,x_MinutesDuration(V10))),x_methodForAction(x_wrapUpValidationTest(V3),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V4,x_endingDate(V3,V7))),x_doRecord('x_ist-Information'(V4,x_endingTime(V3,V8))),x_doRecord('x_ist-Information'(V4,'x_duration-Minutes'(V3,V10))))))) :- x_cid(a65b1404f34838,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b1404f34838,x_CompanionsMt).
xc_source_file(a65b1404f34838,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34838,1072).
xc_kb_names(a65b1404f34838,["?sr","?ex","?test","?book-mt","?start-date","?start-time","?cur-date","?cur-time","?elapsed","?elapsed-min"]).
xc_mapping_rows(a65b1404f34838,[]).
'x_<=='(x_usesSetupMt(V1,V2),x_groundExpression(V2),'x_ist-Information'(V2,x_isa(V1,x_CrossValidationTestRound)),x_unifies(V1,x_ValidationRoundFn(V3,V4)),x_isa(V3,x_ExperimentalCondition),x_experimentalConditionSymbol(V3,V5),x_evaluate(V6,x_SymbolConcatenateFn(x_TheList(V5,'x_-',V4))),x_unifies(V2,x_SetupFn(V6))) :- x_cid(a65b1404f34839,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1404f34839,x_CompanionsMt).
xc_source_file(a65b1404f34839,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34839,1101).
xc_kb_names(a65b1404f34839,["?event","?setup-mt","?test","?num","?symbol","?r-symbol"]).
xc_mapping_rows(a65b1404f34839,[]).
'x_<=='(x_usesSetupMt(V1,V2),x_groundExpression(V1),x_isa(V1,x_CrossValidationTestRound),x_unifies(V1,x_ValidationRoundFn(V3,V4)),x_isa(V3,x_ExperimentalCondition),x_experimentalConditionSymbol(V3,V5),x_evaluate(V6,x_SymbolConcatenateFn(x_TheList(V5,'x_-',V4))),x_unifies(V2,x_SetupFn(V6))) :- x_cid(a65b1404f3483a,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1404f3483a,x_CompanionsMt).
xc_source_file(a65b1404f3483a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3483a,1112).
xc_kb_names(a65b1404f3483a,["?event","?setup-mt","?test","?num","?symbol","?r-symbol"]).
xc_mapping_rows(a65b1404f3483a,[]).
'x_<=='(x_usesBookkeepingMt(V1,V2),x_groundExpression(V2),'x_ist-Information'(V2,x_isa(V1,x_CrossValidationTestRound)),x_unifies(V1,x_ValidationRoundFn(V3,V4)),x_isa(V3,x_ExperimentalCondition),x_experimentalConditionSymbol(V3,V5),x_evaluate(V6,x_SymbolConcatenateFn(x_TheList(V5,'x_-',V4))),x_unifies(V2,x_BookkeepingFn(V6))) :- x_cid(a65b1404f3483b,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1404f3483b,x_CompanionsMt).
xc_source_file(a65b1404f3483b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3483b,1122).
xc_kb_names(a65b1404f3483b,["?event","?bookkeeping","?test","?num","?symbol","?r-symbol"]).
xc_mapping_rows(a65b1404f3483b,[]).
'x_<=='(x_usesBookkeepingMt(V1,V2),x_groundExpression(V1),x_isa(V1,x_CrossValidationTestRound),x_unifies(V1,x_ValidationRoundFn(V3,V4)),x_isa(V3,x_ExperimentalCondition),x_experimentalConditionSymbol(V3,V5),x_evaluate(V6,x_SymbolConcatenateFn(x_TheList(V5,'x_-',V4))),x_unifies(V2,x_BookkeepingFn(V6))) :- x_cid(a65b1404f3483c,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1404f3483c,x_CompanionsMt).
xc_source_file(a65b1404f3483c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3483c,1133).
xc_kb_names(a65b1404f3483c,["?event","?bookkeeping","?test","?num","?symbol","?r-symbol"]).
xc_mapping_rows(a65b1404f3483c,[]).
'x_<=='(x_usesCaseLibrary(V1,V2),x_groundExpression(V1),x_isa(V1,x_CrossValidationTestRound),x_unifies(V1,x_ValidationRoundFn(V3,V4)),x_isa(V3,x_ExperimentalCondition),x_experimentalConditionSymbol(V3,V5),x_evaluate(V6,x_SymbolConcatenateFn(x_TheList(V5,'x_-',V4))),x_unifies(V2,x_CaseLibraryFn(V6))) :- x_cid(a65b1404f3483d,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1404f3483d,x_CompanionsMt).
xc_source_file(a65b1404f3483d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3483d,1143).
xc_kb_names(a65b1404f3483d,["?event","?lib","?test","?num","?symbol","?r-symbol"]).
xc_mapping_rows(a65b1404f3483d,[]).
'x_<=='(x_experimentLog(V1,V2),x_numAnswers(1,x_roundForValidationTest(V3,V1)),x_experimentLog(V3,V2)) :- x_cid(a65b1404f3483e,V1,V2,V3).
xc_microtheory(a65b1404f3483e,x_CompanionsMt).
xc_source_file(a65b1404f3483e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3483e,1153).
xc_kb_names(a65b1404f3483e,["?round","?log","?test"]).
xc_mapping_rows(a65b1404f3483e,[]).
'x_<=='(x_numberOfValidationRounds(V1,V2),x_numAnswers(1,x_experimentalCondition(V3,V1)),x_numAnswers(1,x_numberOfValidationRounds(V3,V2))) :- x_cid(a65b1404f3483f,V1,V2,V3).
xc_microtheory(a65b1404f3483f,x_CompanionsMt).
xc_source_file(a65b1404f3483f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3483f,1157).
xc_kb_names(a65b1404f3483f,["?condition","?n","?experiment"]).
xc_mapping_rows(a65b1404f3483f,[]).
'x_<=='(x_evaluationPlanForExperiment(V1,x_runValidationTest),x_numAnswers(1,x_usesSetupMt(V1,V2)),'x_ist-Information'(V2,x_evaluationTypeInExperiment(V1,x_CrossValidationTest))) :- x_cid(a65b1404f34840,V1,V2).
xc_microtheory(a65b1404f34840,x_CompanionsMt).
xc_source_file(a65b1404f34840,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34840,1161).
xc_kb_names(a65b1404f34840,["?experiment","?exp-setup-mt"]).
xc_mapping_rows(a65b1404f34840,[]).
'x_<=='(x_evaluationPlanForExperiment(V1,x_runValidationTest),x_numAnswers(1,x_usesSetupMt(V1,V2)),'x_ist-Information'(V2,x_evaluationTypeInExperiment(V1,x_PartitionedValidationTest))) :- x_cid(a65b1404f34841,V1,V2).
xc_microtheory(a65b1404f34841,x_CompanionsMt).
xc_source_file(a65b1404f34841,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34841,1166).
xc_kb_names(a65b1404f34841,["?experiment","?exp-setup-mt"]).
xc_mapping_rows(a65b1404f34841,[]).
'x_<=='(x_exampleOfConceptInExperiment(V1,V2,V3),x_lookupOnly(x_kbOnly(x_examplesOfConceptInExperiment(V1,V2,V4))),x_groundExpression(x_examplesOfConceptInExperiment(V1,V2,V4)),x_memberOfList(V3,V4)) :- x_cid(a65b1404f34842,V1,V2,V3,V4).
xc_microtheory(a65b1404f34842,x_CompanionsMt).
xc_source_file(a65b1404f34842,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34842,1172).
xc_kb_names(a65b1404f34842,["?experiment","?concept","?example","?examples"]).
xc_mapping_rows(a65b1404f34842,[]).
'x_<=='(x_exampleOfConceptInExperiment(V1,V2,V3),'x_exampleOfConceptInExperiment-Training'(V1,V2,V3)) :- x_cid(a65b1404f34843,V1,V2,V3).
xc_microtheory(a65b1404f34843,x_CompanionsMt).
xc_source_file(a65b1404f34843,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34843,1179).
xc_kb_names(a65b1404f34843,["?experiment","?concept","?example"]).
xc_mapping_rows(a65b1404f34843,[]).
'x_<=='(x_exampleOfConceptInExperiment(V1,V2,V3),'x_exampleOfConceptInExperiment-Testing'(V1,V2,V3)) :- x_cid(a65b1404f34844,V1,V2,V3).
xc_microtheory(a65b1404f34844,x_CompanionsMt).
xc_source_file(a65b1404f34844,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34844,1182).
xc_kb_names(a65b1404f34844,["?experiment","?concept","?example"]).
xc_mapping_rows(a65b1404f34844,[]).
'x_<=='(x_negativeExampleOfConceptInExperiment(V1,V2,V3),x_exampleOfConceptInExperiment(V1,V2,V4),x_uninferredSentence(x_exampleOfConceptInExperiment(V1,V2,V3))) :- x_cid(a65b1404f34845,V1,V2,V3,V4).
xc_microtheory(a65b1404f34845,x_CompanionsMt).
xc_source_file(a65b1404f34845,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34845,1185).
xc_kb_names(a65b1404f34845,["?experiment","?concept","?example","?some-other-example"]).
xc_mapping_rows(a65b1404f34845,[]).
'x_<=='(x_shuffleExamples(V1,V2,V3),x_exampleShuffleSeed(V4),x_equals(V4,':random'),x_evaluate(V3,x_RandomizedListFn(V1))) :- x_cid(a65b1404f34846,V1,V2,V3,V4).
xc_microtheory(a65b1404f34846,x_CompanionsMt).
xc_source_file(a65b1404f34846,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34846,1190).
xc_kb_names(a65b1404f34846,["?unmixed-examples","?seed-mod","?examples","?seed"]).
xc_mapping_rows(a65b1404f34846,[]).
'x_<=='(x_shuffleExamples(V1,V2,V1),x_uninferredSentence(x_exampleShuffleSeed(V3)),x_groundExpression(V2),x_pseudoRandomShuffle(V4,V2,V1)) :- x_cid(a65b1404f34847,V1,V2,V3,V4).
xc_microtheory(a65b1404f34847,x_CompanionsMt).
xc_source_file(a65b1404f34847,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34847,1196).
xc_kb_names(a65b1404f34847,["?examples","?seed-mod","?seed","?unmixed-examples"]).
xc_mapping_rows(a65b1404f34847,[]).
'x_<=='(x_shuffleExamples(V1,V2,V1),x_uninferredSentence(x_exampleShuffleSeed(V3)),x_variableExpression(V2)) :- x_cid(a65b1404f34848,V1,V2,V3).
xc_microtheory(a65b1404f34848,x_CompanionsMt).
xc_source_file(a65b1404f34848,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34848,1201).
xc_kb_names(a65b1404f34848,["?examples","?seed-mod","?seed"]).
xc_mapping_rows(a65b1404f34848,[]).
'x_<=='(x_shuffleExamples(V1,V2,V3),x_exampleShuffleSeed(V4),x_groundExpression(V4),x_groundExpression(V2),x_different(V4,':random'),x_evaluate(V5,x_PlusFn(V4,V2)),x_pseudoRandomShuffle(V1,V5,V3)) :- x_cid(a65b1404f34849,V1,V2,V3,V4,V5).
xc_microtheory(a65b1404f34849,x_CompanionsMt).
xc_source_file(a65b1404f34849,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f34849,1205).
xc_kb_names(a65b1404f34849,["?unmixed-examples","?seed-mod","?examples","?seed","?updated-seed"]).
xc_mapping_rows(a65b1404f34849,[]).
'x_<=='(x_shuffleExamples(V1,V2,V3),x_exampleShuffleSeed(V4),x_groundExpression(V4),x_variableExpression(V2),x_different(V4,':random'),x_pseudoRandomShuffle(V1,V4,V3)) :- x_cid(a65b1404f3484a,V1,V2,V3,V4).
xc_microtheory(a65b1404f3484a,x_CompanionsMt).
xc_source_file(a65b1404f3484a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3484a,1213).
xc_kb_names(a65b1404f3484a,["?unmixed-examples","?seed-mod","?examples","?seed"]).
xc_mapping_rows(a65b1404f3484a,[]).
'x_<=='(x_trainingFoldsForCVTestRound(V1,V2,V3),x_numberOfValidationRounds(V1,V4),x_evaluate(V5,x_PlusFn(V4,2)),x_withBackchainingDepth(V5,x_enumerateFromToBy(1,V4,1,V6)),x_testingFoldsForCVTestRound(V1,V2,V7),x_evaluate(V8,x_LastInListFn(V7)),x_evaluate(V9,x_PositionInListFn(V8,V6)),x_rotatedList(V6,V9,V10),x_evaluate(V3,x_SetToListFn(x_SetDifferenceFn(x_ListToSetFn(V10),x_ListToSetFn(V7))))) :- x_cid(a65b1404f3484b,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b1404f3484b,x_CompanionsMt).
xc_source_file(a65b1404f3484b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3484b,1221).
xc_kb_names(a65b1404f3484b,["?experiment","?round","?training-folds","?total-folds","?depth","?all-folds","?testing-folds","?last-test-fold","?rot-pos","?rotated-folds"]).
xc_mapping_rows(a65b1404f3484b,[]).
'x_<=='(x_testingFoldsForCVTestRound(V1,V2,x_TheList(V2)),x_isa(V1,'x_CrossValidationTest-LeaveOneOut')) :- x_cid(a65b1404f3484c,V1,V2).
xc_microtheory(a65b1404f3484c,x_CompanionsMt).
xc_source_file(a65b1404f3484c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3484c,1237).
xc_kb_names(a65b1404f3484c,["?experiment","?round"]).
xc_mapping_rows(a65b1404f3484c,[]).
'x_<=='(x_roundForValidationTest(V1,V2),x_groundExpression(V1),x_numberOfValidationRounds(V1,V3),x_evaluate(V4,x_PlusFn(2,V3)),x_withBackchainingDepth(V4,x_enumerateFromToBy(1,V3,1,V5)),x_memberOfList(V6,V5),x_unifies(V2,x_ValidationRoundFn(V1,V6))) :- x_cid(a65b1404f3484d,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1404f3484d,x_CompanionsMt).
xc_source_file(a65b1404f3484d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3484d,1241).
xc_kb_names(a65b1404f3484d,["?experiment","?round","?folds","?depth","?round-numbers","?round-number"]).
xc_mapping_rows(a65b1404f3484d,[]).
'x_<=='(x_roundForValidationTest(V1,V2),x_groundExpression(V2),x_unifies(V2,x_ValidationRoundFn(V1,V3))) :- x_cid(a65b1404f3484e,V1,V2,V3).
xc_microtheory(a65b1404f3484e,x_CompanionsMt).
xc_source_file(a65b1404f3484e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/validation.krf').
xc_source_line(a65b1404f3484e,1250).
xc_kb_names(a65b1404f3484e,["?experiment","?round","?round-number"]).
xc_mapping_rows(a65b1404f3484e,[]).
kb_cache_footer(footer{count:204,digest:af03744dde12a945e94f5660e04fb1a184e49ab7d5bcf5ad43b025866d4ed4cc,headerDigest:'2c05a2f72fc7e7012bea2ae2dc9bf0709eb80d0b69e443a06f3fb0eb205e7dd8'}).
