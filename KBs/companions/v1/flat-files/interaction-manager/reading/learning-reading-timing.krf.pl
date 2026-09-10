:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:110,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:245,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:ebd0f4350fceb8bcf891b6de793e213dcd06e6e868b989245aa76b59c603a6a1,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:11325,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf',sourceHash:e3b32c9b98b8e3a9b26f0e20e58b2df89446364bbbc3ffc4d1e53947a69a6c5d,warnings:[]}).
x_preconditionForMethod(x_and(x_outsourcedOnly(x_getUniversalTime(V1))),x_methodForAction(x_recordReadingStartTime(V2,V3),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(x_lbrProcessMt,x_thisRecordingDoesIt)),x_doRecord('x_ist-Information'(x_lbrProcessMt,x_readingStartedAt(V2,V3,V1))))))) :- x_cid(a65b125d8208d3,V1,V2,V3).
xc_microtheory(a65b125d8208d3,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208d3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208d3,18).
xc_kb_names(a65b125d8208d3,["?time","?reading-name","?experiment-name"]).
xc_mapping_rows(a65b125d8208d3,[]).
x_isa(x_readingStartedAt,x_Predicate) :- x_cid(a65b125d8208d4).
xc_microtheory(a65b125d8208d4,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208d4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208d4,27).
xc_kb_names(a65b125d8208d4,[]).
xc_mapping_rows(a65b125d8208d4,[]).
x_arity(x_readingStartedAt,3) :- x_cid(a65b125d8208d5).
xc_microtheory(a65b125d8208d5,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208d5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208d5,28).
xc_kb_names(a65b125d8208d5,[]).
xc_mapping_rows(a65b125d8208d5,[]).
x_arg1Isa(x_readingStartedAt,x_AccessingAnIBT) :- x_cid(a65b125d8208d6).
xc_microtheory(a65b125d8208d6,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208d6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208d6,29).
xc_kb_names(a65b125d8208d6,[]).
xc_mapping_rows(a65b125d8208d6,[]).
x_arg2Isa(x_readingStartedAt,x_Thing) :- x_cid(a65b125d8208d7).
xc_microtheory(a65b125d8208d7,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208d7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208d7,30).
xc_kb_names(a65b125d8208d7,[]).
xc_mapping_rows(a65b125d8208d7,[]).
x_arg3Isa(x_readingStartedAt,x_TimePoint) :- x_cid(a65b125d8208d8).
xc_microtheory(a65b125d8208d8,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208d8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208d8,31).
xc_kb_names(a65b125d8208d8,[]).
xc_mapping_rows(a65b125d8208d8,[]).
x_comment(x_readingStartedAt,"(readingStartedAt ?reading-name ?experiment-name ?time) indicates that ?reading-name started at ?time.") :- x_cid(a65b125d8208d9).
xc_microtheory(a65b125d8208d9,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208d9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208d9,32).
xc_kb_names(a65b125d8208d9,[]).
xc_mapping_rows(a65b125d8208d9,[]).
x_preconditionForMethod(x_and(x_outsourcedOnly(x_getUniversalTime(V1)),'x_ist-Information'(x_lbrProcessMt,x_readingStartedAt(V2,V3,V4)),x_unifies(V4,x_UniversalTimeFn(V5)),x_unifies(V1,x_UniversalTimeFn(V6)),x_evaluate(V7,x_DifferenceFn(V6,V5))),x_methodForAction(x_recordReadingEndProcessingTime(V2,V3),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(x_lbrProcessMt,x_readingEndedProcessingAt(V2,V3,V1))),x_doRecord('x_ist-Information'(x_lbrProcessMt,x_readingProcessingDuration(V2,V3,V7))))))) :- x_cid(a65b125d8208da,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d8208da,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208da,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208da,34).
xc_kb_names(a65b125d8208da,["?end-time","?reading-name","?experiment-name","?start-time","?start-time-numerical","?end-time-numerical","?duration"]).
xc_mapping_rows(a65b125d8208da,[]).
x_isa(x_readingEndedProcessingAt,x_Predicate) :- x_cid(a65b125d8208db).
xc_microtheory(a65b125d8208db,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208db,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208db,48).
xc_kb_names(a65b125d8208db,[]).
xc_mapping_rows(a65b125d8208db,[]).
x_arity(x_readingEndedProcessingAt,3) :- x_cid(a65b125d8208dc).
xc_microtheory(a65b125d8208dc,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208dc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208dc,49).
xc_kb_names(a65b125d8208dc,[]).
xc_mapping_rows(a65b125d8208dc,[]).
x_arg1Isa(x_readingEndedProcessingAt,x_AccessingAnIBT) :- x_cid(a65b125d8208dd).
xc_microtheory(a65b125d8208dd,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208dd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208dd,50).
xc_kb_names(a65b125d8208dd,[]).
xc_mapping_rows(a65b125d8208dd,[]).
x_arg2Isa(x_readingEndedProcessingAt,x_Thing) :- x_cid(a65b125d8208de).
xc_microtheory(a65b125d8208de,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208de,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208de,51).
xc_kb_names(a65b125d8208de,[]).
xc_mapping_rows(a65b125d8208de,[]).
x_arg3Isa(x_readingEndedProcessingAt,x_TimePoint) :- x_cid(a65b125d8208df).
xc_microtheory(a65b125d8208df,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208df,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208df,52).
xc_kb_names(a65b125d8208df,[]).
xc_mapping_rows(a65b125d8208df,[]).
x_comment(x_readingEndedProcessingAt,"(readingEndedProcessingAt ?reading-name ?experiment-name ?time) indicates that ?reading-name ended processing the text at ?time.") :- x_cid(a65b125d8208e0).
xc_microtheory(a65b125d8208e0,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208e0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208e0,53).
xc_kb_names(a65b125d8208e0,[]).
xc_mapping_rows(a65b125d8208e0,[]).
x_isa(x_readingProcessingDuration,x_Predicate) :- x_cid(a65b125d8208e1).
xc_microtheory(a65b125d8208e1,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208e1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208e1,55).
xc_kb_names(a65b125d8208e1,[]).
xc_mapping_rows(a65b125d8208e1,[]).
x_arity(x_readingProcessingDuration,3) :- x_cid(a65b125d8208e2).
xc_microtheory(a65b125d8208e2,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208e2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208e2,56).
xc_kb_names(a65b125d8208e2,[]).
xc_mapping_rows(a65b125d8208e2,[]).
x_arg1Isa(x_readingProcessingDuration,x_AccessingAnIBT) :- x_cid(a65b125d8208e3).
xc_microtheory(a65b125d8208e3,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208e3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208e3,57).
xc_kb_names(a65b125d8208e3,[]).
xc_mapping_rows(a65b125d8208e3,[]).
x_arg2Isa(x_readingProcessingDuration,x_Thing) :- x_cid(a65b125d8208e4).
xc_microtheory(a65b125d8208e4,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208e4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208e4,58).
xc_kb_names(a65b125d8208e4,[]).
xc_mapping_rows(a65b125d8208e4,[]).
x_arg3Isa(x_readingProcessingDuration,x_TimePoint) :- x_cid(a65b125d8208e5).
xc_microtheory(a65b125d8208e5,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208e5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208e5,59).
xc_kb_names(a65b125d8208e5,[]).
xc_mapping_rows(a65b125d8208e5,[]).
x_comment(x_readingProcessingDuration,"(readingProcessingDuration ?reading-name ?experiment-name ?duration)\n indicates that ?reading-name took ?duration seconds for processing.") :- x_cid(a65b125d8208e6).
xc_microtheory(a65b125d8208e6,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208e6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208e6,60).
xc_kb_names(a65b125d8208e6,[]).
xc_mapping_rows(a65b125d8208e6,[]).
x_preconditionForMethod(x_and(x_outsourcedOnly(x_getUniversalTime(V1))),x_methodForAction(x_recordDisambiguationStartTime(V2,V3),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(x_lbrProcessMt,x_disambiguationBeganAt(V2,V3,V1))))))) :- x_cid(a65b125d8208e7,V1,V2,V3).
xc_microtheory(a65b125d8208e7,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208e7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208e7,66).
xc_kb_names(a65b125d8208e7,["?time","?reading-name","?experiment-name"]).
xc_mapping_rows(a65b125d8208e7,[]).
x_isa(x_disambiguationBeganAt,x_Predicate) :- x_cid(a65b125d8208e8).
xc_microtheory(a65b125d8208e8,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208e8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208e8,74).
xc_kb_names(a65b125d8208e8,[]).
xc_mapping_rows(a65b125d8208e8,[]).
x_arity(x_disambiguationBeganAt,3) :- x_cid(a65b125d8208e9).
xc_microtheory(a65b125d8208e9,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208e9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208e9,75).
xc_kb_names(a65b125d8208e9,[]).
xc_mapping_rows(a65b125d8208e9,[]).
x_arg1Isa(x_disambiguationBeganAt,x_AccessingAnIBT) :- x_cid(a65b125d8208ea).
xc_microtheory(a65b125d8208ea,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208ea,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208ea,76).
xc_kb_names(a65b125d8208ea,[]).
xc_mapping_rows(a65b125d8208ea,[]).
x_arg2Isa(x_disambiguationBeganAt,x_Thing) :- x_cid(a65b125d8208eb).
xc_microtheory(a65b125d8208eb,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208eb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208eb,77).
xc_kb_names(a65b125d8208eb,[]).
xc_mapping_rows(a65b125d8208eb,[]).
x_arg3Isa(x_disambiguationBeganAt,x_TimePoint) :- x_cid(a65b125d8208ec).
xc_microtheory(a65b125d8208ec,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208ec,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208ec,78).
xc_kb_names(a65b125d8208ec,[]).
xc_mapping_rows(a65b125d8208ec,[]).
x_comment(x_disambiguationBeganAt,"(disambiguationBeganAt ?reading-name ?experiment-name ?time) indicates that ?reading-name started disambiguating at ?time.") :- x_cid(a65b125d8208ed).
xc_microtheory(a65b125d8208ed,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208ed,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208ed,79).
xc_kb_names(a65b125d8208ed,[]).
xc_mapping_rows(a65b125d8208ed,[]).
x_preconditionForMethod(x_and(x_outsourcedOnly(x_getUniversalTime(V1)),'x_ist-Information'(x_lbrProcessMt,x_disambiguationBeganAt(V2,V3,V4)),x_unifies(V4,x_UniversalTimeFn(V5)),x_unifies(V1,x_UniversalTimeFn(V6)),x_evaluate(V7,x_DifferenceFn(V6,V5))),x_methodForAction(x_recordDisambiguationEndTime(V2,V3),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(x_lbrProcessMt,x_disambiguationEndedAt(V2,V3,V1))),x_doRecord('x_ist-Information'(x_lbrProcessMt,x_readingDisambiguationDuration(V2,V3,V7))))))) :- x_cid(a65b125d8208ee,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d8208ee,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208ee,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208ee,81).
xc_kb_names(a65b125d8208ee,["?end-time","?reading-name","?experiment-name","?start-time","?start-time-numerical","?end-time-numerical","?duration"]).
xc_mapping_rows(a65b125d8208ee,[]).
x_isa(x_disambiguationEndedAt,x_Predicate) :- x_cid(a65b125d8208ef).
xc_microtheory(a65b125d8208ef,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208ef,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208ef,95).
xc_kb_names(a65b125d8208ef,[]).
xc_mapping_rows(a65b125d8208ef,[]).
x_arity(x_disambiguationEndedAt,3) :- x_cid(a65b125d8208f0).
xc_microtheory(a65b125d8208f0,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208f0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208f0,96).
xc_kb_names(a65b125d8208f0,[]).
xc_mapping_rows(a65b125d8208f0,[]).
x_arg1Isa(x_disambiguationEndedAt,x_AccessingAnIBT) :- x_cid(a65b125d8208f1).
xc_microtheory(a65b125d8208f1,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208f1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208f1,97).
xc_kb_names(a65b125d8208f1,[]).
xc_mapping_rows(a65b125d8208f1,[]).
x_arg2Isa(x_disambiguationEndedAt,x_Thing) :- x_cid(a65b125d8208f2).
xc_microtheory(a65b125d8208f2,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208f2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208f2,98).
xc_kb_names(a65b125d8208f2,[]).
xc_mapping_rows(a65b125d8208f2,[]).
x_arg3Isa(x_disambiguationEndedAt,x_TimePoint) :- x_cid(a65b125d8208f3).
xc_microtheory(a65b125d8208f3,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208f3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208f3,99).
xc_kb_names(a65b125d8208f3,[]).
xc_mapping_rows(a65b125d8208f3,[]).
x_comment(x_disambiguationEndedAt,"(disambiguationEndedAt ?reading-name ?experiment-name ?time) indicates that ?reading-name ended disambiguation the text at ?time.") :- x_cid(a65b125d8208f4).
xc_microtheory(a65b125d8208f4,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208f4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208f4,100).
xc_kb_names(a65b125d8208f4,[]).
xc_mapping_rows(a65b125d8208f4,[]).
x_isa(x_readingDisambiguationDuration,x_Predicate) :- x_cid(a65b125d8208f5).
xc_microtheory(a65b125d8208f5,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208f5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208f5,102).
xc_kb_names(a65b125d8208f5,[]).
xc_mapping_rows(a65b125d8208f5,[]).
x_arity(x_readingDisambiguationDuration,3) :- x_cid(a65b125d8208f6).
xc_microtheory(a65b125d8208f6,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208f6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208f6,103).
xc_kb_names(a65b125d8208f6,[]).
xc_mapping_rows(a65b125d8208f6,[]).
x_arg1Isa(x_readingDisambiguationDuration,x_AccessingAnIBT) :- x_cid(a65b125d8208f7).
xc_microtheory(a65b125d8208f7,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208f7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208f7,104).
xc_kb_names(a65b125d8208f7,[]).
xc_mapping_rows(a65b125d8208f7,[]).
x_arg2Isa(x_readingDisambiguationDuration,x_Thing) :- x_cid(a65b125d8208f8).
xc_microtheory(a65b125d8208f8,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208f8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208f8,105).
xc_kb_names(a65b125d8208f8,[]).
xc_mapping_rows(a65b125d8208f8,[]).
x_arg3Isa(x_readingDisambiguationDuration,x_TimePoint) :- x_cid(a65b125d8208f9).
xc_microtheory(a65b125d8208f9,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208f9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208f9,106).
xc_kb_names(a65b125d8208f9,[]).
xc_mapping_rows(a65b125d8208f9,[]).
x_comment(x_readingDisambiguationDuration,"(readingDisambiguationDuration ?reading-name ?experiment-name ?duration)\n indicates that ?reading-name took ?duration seconds for disambiguation") :- x_cid(a65b125d8208fa).
xc_microtheory(a65b125d8208fa,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208fa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208fa,107).
xc_kb_names(a65b125d8208fa,[]).
xc_mapping_rows(a65b125d8208fa,[]).
x_isa(x_recordDisambiguationStartTime,x_ComplexActionPredicate) :- x_cid(a65b125d8208fb).
xc_microtheory(a65b125d8208fb,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208fb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208fb,110).
xc_kb_names(a65b125d8208fb,[]).
xc_mapping_rows(a65b125d8208fb,[]).
x_arity(x_recordDisambiguationStartTime,2) :- x_cid(a65b125d8208fc).
xc_microtheory(a65b125d8208fc,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208fc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208fc,111).
xc_kb_names(a65b125d8208fc,[]).
xc_mapping_rows(a65b125d8208fc,[]).
x_arg1Isa(x_recordDisambiguationStartTime,x_AccessingAnIBT) :- x_cid(a65b125d8208fd).
xc_microtheory(a65b125d8208fd,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208fd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208fd,112).
xc_kb_names(a65b125d8208fd,[]).
xc_mapping_rows(a65b125d8208fd,[]).
x_arg1Isa(x_recordDisambiguationStartTime,x_Thing) :- x_cid(a65b125d8208fe).
xc_microtheory(a65b125d8208fe,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208fe,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208fe,113).
xc_kb_names(a65b125d8208fe,[]).
xc_mapping_rows(a65b125d8208fe,[]).
x_comment(x_recordDisambiguationStartTime,"(recordDisambiguationStartTime ?reading ?experiment-name) records a disambiguation's start time.") :- x_cid(a65b125d8208ff).
xc_microtheory(a65b125d8208ff,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8208ff,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d8208ff,114).
xc_kb_names(a65b125d8208ff,[]).
xc_mapping_rows(a65b125d8208ff,[]).
x_isa(x_recordDisambiguationEndTime,x_ComplexActionPredicate) :- x_cid(a65b125d820900).
xc_microtheory(a65b125d820900,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820900,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820900,116).
xc_kb_names(a65b125d820900,[]).
xc_mapping_rows(a65b125d820900,[]).
x_arity(x_recordDisambiguationEndTime,2) :- x_cid(a65b125d820901).
xc_microtheory(a65b125d820901,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820901,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820901,117).
xc_kb_names(a65b125d820901,[]).
xc_mapping_rows(a65b125d820901,[]).
x_arg1Isa(x_recordDisambiguationEndTime,x_AccessingAnIBT) :- x_cid(a65b125d820902).
xc_microtheory(a65b125d820902,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820902,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820902,118).
xc_kb_names(a65b125d820902,[]).
xc_mapping_rows(a65b125d820902,[]).
x_arg2Isa(x_recordDisambiguationEndTime,x_Thing) :- x_cid(a65b125d820903).
xc_microtheory(a65b125d820903,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820903,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820903,119).
xc_kb_names(a65b125d820903,[]).
xc_mapping_rows(a65b125d820903,[]).
x_comment(x_recordDisambiguationEndTime,"(recordDisambiguationEndTime ?reading ?experiment-name) records the\nuniversal time at which disambiguation finished.") :- x_cid(a65b125d820904).
xc_microtheory(a65b125d820904,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820904,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820904,120).
xc_kb_names(a65b125d820904,[]).
xc_mapping_rows(a65b125d820904,[]).
x_preconditionForMethod(x_and(x_outsourcedOnly(x_getUniversalTime(V1))),x_methodForAction(x_recordCoreferenceStartTime(V2,V3),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(x_lbrProcessMt,x_coreferenceBeganAt(V2,V3,V1))))))) :- x_cid(a65b125d820905,V1,V2,V3).
xc_microtheory(a65b125d820905,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820905,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820905,125).
xc_kb_names(a65b125d820905,["?time","?reading-name","?experiment-name"]).
xc_mapping_rows(a65b125d820905,[]).
x_isa(x_coreferenceBeganAt,x_Predicate) :- x_cid(a65b125d820906).
xc_microtheory(a65b125d820906,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820906,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820906,133).
xc_kb_names(a65b125d820906,[]).
xc_mapping_rows(a65b125d820906,[]).
x_arity(x_coreferenceBeganAt,3) :- x_cid(a65b125d820907).
xc_microtheory(a65b125d820907,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820907,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820907,134).
xc_kb_names(a65b125d820907,[]).
xc_mapping_rows(a65b125d820907,[]).
x_arg1Isa(x_coreferenceBeganAt,x_AccessingAnIBT) :- x_cid(a65b125d820908).
xc_microtheory(a65b125d820908,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820908,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820908,135).
xc_kb_names(a65b125d820908,[]).
xc_mapping_rows(a65b125d820908,[]).
x_arg2Isa(x_coreferenceBeganAt,x_Thing) :- x_cid(a65b125d820909).
xc_microtheory(a65b125d820909,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820909,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820909,136).
xc_kb_names(a65b125d820909,[]).
xc_mapping_rows(a65b125d820909,[]).
x_arg3Isa(x_coreferenceBeganAt,x_TimePoint) :- x_cid(a65b125d82090a).
xc_microtheory(a65b125d82090a,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82090a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82090a,137).
xc_kb_names(a65b125d82090a,[]).
xc_mapping_rows(a65b125d82090a,[]).
x_comment(x_coreferenceBeganAt,"(coreferenceBeganAt ?reading-name ?experiment-name ?time) indicates that ?reading-name started coreference at ?time.") :- x_cid(a65b125d82090b).
xc_microtheory(a65b125d82090b,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82090b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82090b,138).
xc_kb_names(a65b125d82090b,[]).
xc_mapping_rows(a65b125d82090b,[]).
x_preconditionForMethod(x_and(x_outsourcedOnly(x_getUniversalTime(V1)),'x_ist-Information'(x_lbrProcessMt,x_coreferenceBeganAt(V2,V3,V4)),x_unifies(V4,x_UniversalTimeFn(V5)),x_unifies(V1,x_UniversalTimeFn(V6)),x_evaluate(V7,x_DifferenceFn(V6,V5))),x_methodForAction(x_recordCoreferenceEndTime(V2,V3),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(x_lbrProcessMt,x_coreferenceEndedAt(V2,V3,V1))),x_doRecord('x_ist-Information'(x_lbrProcessMt,x_readingCoreferenceDuration(V2,V3,V7))))))) :- x_cid(a65b125d82090c,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d82090c,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82090c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82090c,140).
xc_kb_names(a65b125d82090c,["?end-time","?reading-name","?experiment-name","?start-time","?start-time-numerical","?end-time-numerical","?duration"]).
xc_mapping_rows(a65b125d82090c,[]).
x_isa(x_readingCoreferenceDuration,x_Predicate) :- x_cid(a65b125d82090d).
xc_microtheory(a65b125d82090d,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82090d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82090d,154).
xc_kb_names(a65b125d82090d,[]).
xc_mapping_rows(a65b125d82090d,[]).
x_arity(x_readingCoreferenceDuration,3) :- x_cid(a65b125d82090e).
xc_microtheory(a65b125d82090e,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82090e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82090e,155).
xc_kb_names(a65b125d82090e,[]).
xc_mapping_rows(a65b125d82090e,[]).
x_arg1Isa(x_readingCoreferenceDuration,x_AccessingAnIBT) :- x_cid(a65b125d82090f).
xc_microtheory(a65b125d82090f,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82090f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82090f,156).
xc_kb_names(a65b125d82090f,[]).
xc_mapping_rows(a65b125d82090f,[]).
x_arg2Isa(x_readingCoreferenceDuration,x_Thing) :- x_cid(a65b125d820910).
xc_microtheory(a65b125d820910,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820910,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820910,157).
xc_kb_names(a65b125d820910,[]).
xc_mapping_rows(a65b125d820910,[]).
x_arg3Isa(x_readingCoreferenceDuration,x_TimePoint) :- x_cid(a65b125d820911).
xc_microtheory(a65b125d820911,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820911,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820911,158).
xc_kb_names(a65b125d820911,[]).
xc_mapping_rows(a65b125d820911,[]).
x_comment(x_readingCoreferenceDuration,"(readingCoreferenceDuration ?reading-name ?experiment-name ?duration)\n indicates that ?reading-name took ?duration seconds for coreference.") :- x_cid(a65b125d820912).
xc_microtheory(a65b125d820912,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820912,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820912,159).
xc_kb_names(a65b125d820912,[]).
xc_mapping_rows(a65b125d820912,[]).
x_isa(x_coreferenceEndedAt,x_Predicate) :- x_cid(a65b125d820913).
xc_microtheory(a65b125d820913,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820913,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820913,162).
xc_kb_names(a65b125d820913,[]).
xc_mapping_rows(a65b125d820913,[]).
x_arity(x_coreferenceEndedAt,3) :- x_cid(a65b125d820914).
xc_microtheory(a65b125d820914,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820914,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820914,163).
xc_kb_names(a65b125d820914,[]).
xc_mapping_rows(a65b125d820914,[]).
x_arg1Isa(x_coreferenceEndedAt,x_AccessingAnIBT) :- x_cid(a65b125d820915).
xc_microtheory(a65b125d820915,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820915,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820915,164).
xc_kb_names(a65b125d820915,[]).
xc_mapping_rows(a65b125d820915,[]).
x_arg2Isa(x_coreferenceEndedAt,x_Thing) :- x_cid(a65b125d820916).
xc_microtheory(a65b125d820916,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820916,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820916,165).
xc_kb_names(a65b125d820916,[]).
xc_mapping_rows(a65b125d820916,[]).
x_arg3Isa(x_coreferenceEndedAt,x_TimePoint) :- x_cid(a65b125d820917).
xc_microtheory(a65b125d820917,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820917,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820917,166).
xc_kb_names(a65b125d820917,[]).
xc_mapping_rows(a65b125d820917,[]).
x_comment(x_coreferenceEndedAt,"(coreferenceEndedAt ?reading-name ?experiment-name ?time) indicates that ?reading-name ended coreference over the text at ?time.") :- x_cid(a65b125d820918).
xc_microtheory(a65b125d820918,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820918,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820918,167).
xc_kb_names(a65b125d820918,[]).
xc_mapping_rows(a65b125d820918,[]).
x_isa(x_recordCoreferenceStartTime,x_ComplexActionPredicate) :- x_cid(a65b125d820919).
xc_microtheory(a65b125d820919,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820919,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820919,169).
xc_kb_names(a65b125d820919,[]).
xc_mapping_rows(a65b125d820919,[]).
x_arity(x_recordCoreferenceStartTime,2) :- x_cid(a65b125d82091a).
xc_microtheory(a65b125d82091a,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82091a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82091a,170).
xc_kb_names(a65b125d82091a,[]).
xc_mapping_rows(a65b125d82091a,[]).
x_arg1Isa(x_recordCoreferenceStartTime,x_AccessingAnIBT) :- x_cid(a65b125d82091b).
xc_microtheory(a65b125d82091b,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82091b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82091b,171).
xc_kb_names(a65b125d82091b,[]).
xc_mapping_rows(a65b125d82091b,[]).
x_arg1Isa(x_recordCoreferenceStartTime,x_Thing) :- x_cid(a65b125d82091c).
xc_microtheory(a65b125d82091c,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82091c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82091c,172).
xc_kb_names(a65b125d82091c,[]).
xc_mapping_rows(a65b125d82091c,[]).
x_comment(x_recordCoreferenceStartTime,"(recordCoreferenceStartTime ?reading ?experiment-name) records a coreference's start time.") :- x_cid(a65b125d82091d).
xc_microtheory(a65b125d82091d,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82091d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82091d,173).
xc_kb_names(a65b125d82091d,[]).
xc_mapping_rows(a65b125d82091d,[]).
x_isa(x_recordCoreferenceEndTime,x_ComplexActionPredicate) :- x_cid(a65b125d82091e).
xc_microtheory(a65b125d82091e,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82091e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82091e,175).
xc_kb_names(a65b125d82091e,[]).
xc_mapping_rows(a65b125d82091e,[]).
x_arity(x_recordCoreferenceEndTime,2) :- x_cid(a65b125d82091f).
xc_microtheory(a65b125d82091f,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82091f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82091f,176).
xc_kb_names(a65b125d82091f,[]).
xc_mapping_rows(a65b125d82091f,[]).
x_arg1Isa(x_recordCoreferenceEndTime,x_AccessingAnIBT) :- x_cid(a65b125d820920).
xc_microtheory(a65b125d820920,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820920,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820920,177).
xc_kb_names(a65b125d820920,[]).
xc_mapping_rows(a65b125d820920,[]).
x_arg2Isa(x_recordCoreferenceEndTime,x_Thing) :- x_cid(a65b125d820921).
xc_microtheory(a65b125d820921,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820921,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820921,178).
xc_kb_names(a65b125d820921,[]).
xc_mapping_rows(a65b125d820921,[]).
x_comment(x_recordCoreferenceEndTime,"(recordCoreferenceEndTime ?reading ?experiment-name) records a coreference's end time.") :- x_cid(a65b125d820922).
xc_microtheory(a65b125d820922,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820922,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820922,179).
xc_kb_names(a65b125d820922,[]).
xc_mapping_rows(a65b125d820922,[]).
x_preconditionForMethod(x_and(x_outsourcedOnly(x_getUniversalTime(V1))),x_methodForAction(x_recordADAStartTime(V2,V3),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(x_lbrProcessMt,x_ADABeganAt(V2,V3,V1))))))) :- x_cid(a65b125d820923,V1,V2,V3).
xc_microtheory(a65b125d820923,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820923,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820923,183).
xc_kb_names(a65b125d820923,["?time","?reading-name","?experiment-name"]).
xc_mapping_rows(a65b125d820923,[]).
x_isa(x_ADABeganAt,x_Predicate) :- x_cid(a65b125d820924).
xc_microtheory(a65b125d820924,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820924,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820924,191).
xc_kb_names(a65b125d820924,[]).
xc_mapping_rows(a65b125d820924,[]).
x_arity(x_ADABeganAt,3) :- x_cid(a65b125d820925).
xc_microtheory(a65b125d820925,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820925,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820925,192).
xc_kb_names(a65b125d820925,[]).
xc_mapping_rows(a65b125d820925,[]).
x_arg1Isa(x_ADABeganAt,x_AccessingAnIBT) :- x_cid(a65b125d820926).
xc_microtheory(a65b125d820926,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820926,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820926,193).
xc_kb_names(a65b125d820926,[]).
xc_mapping_rows(a65b125d820926,[]).
x_arg2Isa(x_ADABeganAt,x_Thing) :- x_cid(a65b125d820927).
xc_microtheory(a65b125d820927,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820927,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820927,194).
xc_kb_names(a65b125d820927,[]).
xc_mapping_rows(a65b125d820927,[]).
x_arg3Isa(x_ADABeganAt,x_TimePoint) :- x_cid(a65b125d820928).
xc_microtheory(a65b125d820928,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820928,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820928,195).
xc_kb_names(a65b125d820928,[]).
xc_mapping_rows(a65b125d820928,[]).
x_comment(x_ADABeganAt,"(ADABeganAt ?reading-name ?experiment-name ?time) indicates that ?reading-name started ADA\nprocessing at ?time.") :- x_cid(a65b125d820929).
xc_microtheory(a65b125d820929,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820929,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820929,196).
xc_kb_names(a65b125d820929,[]).
xc_mapping_rows(a65b125d820929,[]).
x_preconditionForMethod(x_and(x_outsourcedOnly(x_getUniversalTime(V1)),'x_ist-Information'(x_lbrProcessMt,x_ADABeganAt(V2,V3,V4)),x_unifies(V4,x_UniversalTimeFn(V5)),x_unifies(V1,x_UniversalTimeFn(V6)),x_evaluate(V7,x_DifferenceFn(V6,V5))),x_methodForAction(x_recordADAEndTime(V2,V3),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(x_lbrProcessMt,x_ADAEndedAt(V2,V3,V1))),x_doRecord('x_ist-Information'(x_lbrProcessMt,x_readingADADuration(V2,V3,V7))))))) :- x_cid(a65b125d82092a,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d82092a,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82092a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82092a,199).
xc_kb_names(a65b125d82092a,["?end-time","?reading-name","?experiment-name","?start-time","?start-time-numerical","?end-time-numerical","?duration"]).
xc_mapping_rows(a65b125d82092a,[]).
x_isa(x_ADAEndedAt,x_Predicate) :- x_cid(a65b125d82092b).
xc_microtheory(a65b125d82092b,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82092b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82092b,213).
xc_kb_names(a65b125d82092b,[]).
xc_mapping_rows(a65b125d82092b,[]).
x_arity(x_ADAEndedAt,3) :- x_cid(a65b125d82092c).
xc_microtheory(a65b125d82092c,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82092c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82092c,214).
xc_kb_names(a65b125d82092c,[]).
xc_mapping_rows(a65b125d82092c,[]).
x_arg1Isa(x_ADAEndedAt,x_AccessingAnIBT) :- x_cid(a65b125d82092d).
xc_microtheory(a65b125d82092d,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82092d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82092d,215).
xc_kb_names(a65b125d82092d,[]).
xc_mapping_rows(a65b125d82092d,[]).
x_arg2Isa(x_ADAEndedAt,x_Thing) :- x_cid(a65b125d82092e).
xc_microtheory(a65b125d82092e,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82092e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82092e,216).
xc_kb_names(a65b125d82092e,[]).
xc_mapping_rows(a65b125d82092e,[]).
x_arg3Isa(x_ADAEndedAt,x_TimePoint) :- x_cid(a65b125d82092f).
xc_microtheory(a65b125d82092f,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82092f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82092f,217).
xc_kb_names(a65b125d82092f,[]).
xc_mapping_rows(a65b125d82092f,[]).
x_comment(x_ADAEndedAt,"(ADAEndedAt ?reading-name ?experiment-name ?time) indicates that ?reading-name ended \nADA processing of the text at ?time.") :- x_cid(a65b125d820930).
xc_microtheory(a65b125d820930,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820930,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820930,218).
xc_kb_names(a65b125d820930,[]).
xc_mapping_rows(a65b125d820930,[]).
x_isa(x_readingADADuration,x_Predicate) :- x_cid(a65b125d820931).
xc_microtheory(a65b125d820931,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820931,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820931,221).
xc_kb_names(a65b125d820931,[]).
xc_mapping_rows(a65b125d820931,[]).
x_arity(x_readingADADuration,3) :- x_cid(a65b125d820932).
xc_microtheory(a65b125d820932,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820932,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820932,222).
xc_kb_names(a65b125d820932,[]).
xc_mapping_rows(a65b125d820932,[]).
x_arg1Isa(x_readingADADuration,x_AccessingAnIBT) :- x_cid(a65b125d820933).
xc_microtheory(a65b125d820933,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820933,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820933,223).
xc_kb_names(a65b125d820933,[]).
xc_mapping_rows(a65b125d820933,[]).
x_arg2Isa(x_readingADADuration,x_Thing) :- x_cid(a65b125d820934).
xc_microtheory(a65b125d820934,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820934,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820934,224).
xc_kb_names(a65b125d820934,[]).
xc_mapping_rows(a65b125d820934,[]).
x_arg3Isa(x_readingADADuration,x_TimePoint) :- x_cid(a65b125d820935).
xc_microtheory(a65b125d820935,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820935,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820935,225).
xc_kb_names(a65b125d820935,[]).
xc_mapping_rows(a65b125d820935,[]).
x_comment(x_readingADADuration,"(readingADADuration ?reading-name ?experiment-name ?duration)\n indicates that ?reading-name took ?duration seconds for ADA processing.") :- x_cid(a65b125d820936).
xc_microtheory(a65b125d820936,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820936,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820936,226).
xc_kb_names(a65b125d820936,[]).
xc_mapping_rows(a65b125d820936,[]).
x_isa(x_recordADAStartTime,x_ComplexActionPredicate) :- x_cid(a65b125d820937).
xc_microtheory(a65b125d820937,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820937,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820937,229).
xc_kb_names(a65b125d820937,[]).
xc_mapping_rows(a65b125d820937,[]).
x_arity(x_recordADAStartTime,2) :- x_cid(a65b125d820938).
xc_microtheory(a65b125d820938,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820938,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820938,230).
xc_kb_names(a65b125d820938,[]).
xc_mapping_rows(a65b125d820938,[]).
x_arg1Isa(x_recordADAStartTime,x_AccessingAnIBT) :- x_cid(a65b125d820939).
xc_microtheory(a65b125d820939,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820939,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820939,231).
xc_kb_names(a65b125d820939,[]).
xc_mapping_rows(a65b125d820939,[]).
x_arg1Isa(x_recordADAStartTime,x_Thing) :- x_cid(a65b125d82093a).
xc_microtheory(a65b125d82093a,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82093a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82093a,232).
xc_kb_names(a65b125d82093a,[]).
xc_mapping_rows(a65b125d82093a,[]).
x_comment(x_recordADAStartTime,"(recordADAStartTime ?reading ?experiment-name) records a \nADA processing run's start time.") :- x_cid(a65b125d82093b).
xc_microtheory(a65b125d82093b,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82093b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82093b,233).
xc_kb_names(a65b125d82093b,[]).
xc_mapping_rows(a65b125d82093b,[]).
x_isa(x_recordADAEndTime,x_ComplexActionPredicate) :- x_cid(a65b125d82093c).
xc_microtheory(a65b125d82093c,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82093c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82093c,236).
xc_kb_names(a65b125d82093c,[]).
xc_mapping_rows(a65b125d82093c,[]).
x_arity(x_recordADAEndTime,2) :- x_cid(a65b125d82093d).
xc_microtheory(a65b125d82093d,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82093d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82093d,237).
xc_kb_names(a65b125d82093d,[]).
xc_mapping_rows(a65b125d82093d,[]).
x_arg1Isa(x_recordADAEndTime,x_AccessingAnIBT) :- x_cid(a65b125d82093e).
xc_microtheory(a65b125d82093e,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82093e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82093e,238).
xc_kb_names(a65b125d82093e,[]).
xc_mapping_rows(a65b125d82093e,[]).
x_arg2Isa(x_recordADAEndTime,x_Thing) :- x_cid(a65b125d82093f).
xc_microtheory(a65b125d82093f,'x_Interaction-ManagerMt').
xc_source_file(a65b125d82093f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d82093f,239).
xc_kb_names(a65b125d82093f,[]).
xc_mapping_rows(a65b125d82093f,[]).
x_comment(x_recordADAEndTime,"(recordADAEndTime ?reading ?experiment-name) records the\nuniversal time at which ADA processing finished.") :- x_cid(a65b125d820940).
xc_microtheory(a65b125d820940,'x_Interaction-ManagerMt').
xc_source_file(a65b125d820940,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/learning-reading-timing.krf').
xc_source_line(a65b125d820940,240).
xc_kb_names(a65b125d820940,[]).
xc_mapping_rows(a65b125d820940,[]).
kb_cache_footer(footer{count:110,digest:ebd0f4350fceb8bcf891b6de793e213dcd06e6e868b989245aa76b59c603a6a1,headerDigest:'85fca7599ab3dfd9baede273a5ca9b44baf56b45aa43c25f7454a27c6785e087'}).
