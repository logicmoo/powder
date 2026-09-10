:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:15,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:116,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'3c60796784e6d78a719c087f04afc6060e648396dd2aa5556d871b2c9fde1a6b',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/nusketch-hookup/common-nusketch-hookup-plans.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:5268,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/nusketch-hookup/common-nusketch-hookup-plans.krf',sourceHash:'406a68124136d9edf787ac5d2efd1e6efb228d036d8554e823801fd031c6dce2',warnings:[]}).
x_genlMt('x_Cogsketch-AgentMt',x_CompanionsMt) :- x_cid(a65b125dc0a8b6).
xc_microtheory(a65b125dc0a8b6,'x_Cogsketch-AgentMt').
xc_source_file(a65b125dc0a8b6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/nusketch-hookup/common-nusketch-hookup-plans.krf').
xc_source_line(a65b125dc0a8b6,15).
xc_kb_names(a65b125dc0a8b6,[]).
xc_mapping_rows(a65b125dc0a8b6,[]).
x_isa(x_colorizePerceptualElementsFromCorrespondences,x_ComplexActionPredicate) :- x_cid(a65b125dc0a8b7).
xc_microtheory(a65b125dc0a8b7,'x_Cogsketch-AgentMt').
xc_source_file(a65b125dc0a8b7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/nusketch-hookup/common-nusketch-hookup-plans.krf').
xc_source_line(a65b125dc0a8b7,19).
xc_kb_names(a65b125dc0a8b7,[]).
xc_mapping_rows(a65b125dc0a8b7,[]).
x_arity(x_colorizePerceptualElementsFromCorrespondences,3) :- x_cid(a65b125dc0a8b8).
xc_microtheory(a65b125dc0a8b8,'x_Cogsketch-AgentMt').
xc_source_file(a65b125dc0a8b8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/nusketch-hookup/common-nusketch-hookup-plans.krf').
xc_source_line(a65b125dc0a8b8,20).
xc_kb_names(a65b125dc0a8b8,[]).
xc_mapping_rows(a65b125dc0a8b8,[]).
x_arg1Isa(x_colorizePerceptualElementsFromCorrespondences,x_NuSketchSketch) :- x_cid(a65b125dc0a8b9).
xc_microtheory(a65b125dc0a8b9,'x_Cogsketch-AgentMt').
xc_source_file(a65b125dc0a8b9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/nusketch-hookup/common-nusketch-hookup-plans.krf').
xc_source_line(a65b125dc0a8b9,21).
xc_kb_names(a65b125dc0a8b9,[]).
xc_mapping_rows(a65b125dc0a8b9,[]).
x_arg2Isa(x_colorizePerceptualElementsFromCorrespondences,x_NuSketchSketch) :- x_cid(a65b125dc0a8ba).
xc_microtheory(a65b125dc0a8ba,'x_Cogsketch-AgentMt').
xc_source_file(a65b125dc0a8ba,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/nusketch-hookup/common-nusketch-hookup-plans.krf').
xc_source_line(a65b125dc0a8ba,22).
xc_kb_names(a65b125dc0a8ba,[]).
xc_mapping_rows(a65b125dc0a8ba,[]).
x_arg3Isa(x_colorizePerceptualElementsFromCorrespondences,'x_Set-Extensional') :- x_cid(a65b125dc0a8bb).
xc_microtheory(a65b125dc0a8bb,'x_Cogsketch-AgentMt').
xc_source_file(a65b125dc0a8bb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/nusketch-hookup/common-nusketch-hookup-plans.krf').
xc_source_line(a65b125dc0a8bb,23).
xc_kb_names(a65b125dc0a8bb,[]).
xc_mapping_rows(a65b125dc0a8bb,[]).
x_comment(x_colorizePerceptualElementsFromCorrespondences,"(colorizePerceptualElementsFromCorrespondences <sketch-A> <sketch-B> <correspondence-list>)\n   In the provided sketch(es), this colorizes the perceptual elements that show up in the correspondence list\n   according to those correspondences, i.e. matching items should be assigned matching colors.\n   Note that the two sketches can be the same.  Also note that perceptual elements includes decomposition\n   entities like edges, edge-cycles, and ECOs, but does not include glyphs.  It seems aggressive to be changing glyph\n   colors here, since those colors are chosen by the user and as of now we don't have a way to revert this colorization.") :- x_cid(a65b125dc0a8bc).
xc_microtheory(a65b125dc0a8bc,'x_Cogsketch-AgentMt').
xc_source_file(a65b125dc0a8bc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/nusketch-hookup/common-nusketch-hookup-plans.krf').
xc_source_line(a65b125dc0a8bc,24).
xc_kb_names(a65b125dc0a8bc,[]).
xc_mapping_rows(a65b125dc0a8bc,[]).
x_isa(x_openSketch,x_ComplexActionPredicate) :- x_cid(a65b125dc0a8bd).
xc_microtheory(a65b125dc0a8bd,'x_Cogsketch-AgentMt').
xc_source_file(a65b125dc0a8bd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/nusketch-hookup/common-nusketch-hookup-plans.krf').
xc_source_line(a65b125dc0a8bd,32).
xc_kb_names(a65b125dc0a8bd,[]).
xc_mapping_rows(a65b125dc0a8bd,[]).
x_arity(x_openSketch,1) :- x_cid(a65b125dc0a8be).
xc_microtheory(a65b125dc0a8be,'x_Cogsketch-AgentMt').
xc_source_file(a65b125dc0a8be,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/nusketch-hookup/common-nusketch-hookup-plans.krf').
xc_source_line(a65b125dc0a8be,33).
xc_kb_names(a65b125dc0a8be,[]).
xc_mapping_rows(a65b125dc0a8be,[]).
x_arg1Isa(x_openSketch,x_NuSketchSketch) :- x_cid(a65b125dc0a8bf).
xc_microtheory(a65b125dc0a8bf,'x_Cogsketch-AgentMt').
xc_source_file(a65b125dc0a8bf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/nusketch-hookup/common-nusketch-hookup-plans.krf').
xc_source_line(a65b125dc0a8bf,34).
xc_kb_names(a65b125dc0a8bf,[]).
xc_mapping_rows(a65b125dc0a8bf,[]).
x_comment(x_openSketch,"(openSketch ?sketch) opens the sketch by looking up its address in the sketch rolodex.") :- x_cid(a65b125dc0a8c0).
xc_microtheory(a65b125dc0a8c0,'x_Cogsketch-AgentMt').
xc_source_file(a65b125dc0a8c0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/nusketch-hookup/common-nusketch-hookup-plans.krf').
xc_source_line(a65b125dc0a8c0,35).
xc_kb_names(a65b125dc0a8c0,[]).
xc_mapping_rows(a65b125dc0a8c0,[]).
x_preconditionForMethod(x_and(x_uninferredSentence(x_wmOnly('x_ist-Information'(x_EverythingPSC,x_agentForOpenSketch(V1,V2)))),'x_ist-Information'(x_CompanionsSketchRolodexMt,x_nuSketchFileURL(V1,V3))),x_methodForAction(x_openSketch(V1),x_actionSequence(x_TheList(x_doAnnounce("~% Opening sketch ~A~%   @URL: ~s",[V1,V3]),x_doOpenSketchFile(V3))))) :- x_cid(a65b125dc0a8c1,V1,V2,V3).
xc_microtheory(a65b125dc0a8c1,'x_Cogsketch-AgentMt').
xc_source_file(a65b125dc0a8c1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/nusketch-hookup/common-nusketch-hookup-plans.krf').
xc_source_line(a65b125dc0a8c1,40).
xc_kb_names(a65b125dc0a8c1,["?sketch","?agent","?url"]).
xc_mapping_rows(a65b125dc0a8c1,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 51, column 53), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125dc0a8c1,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 51, column 53), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_wmOnly('x_ist-Information'(x_EverythingPSC,x_agentForOpenSketch(V1,V2))),x_methodForAction(x_openSketch(V1),x_actionSequence(x_TheList(x_doAnnounce("~% openSketch: Sketch ~A is already open.",[V1]))))) :- x_cid(a65b125dc0a8c2,V1,V2).
xc_microtheory(a65b125dc0a8c2,'x_Cogsketch-AgentMt').
xc_source_file(a65b125dc0a8c2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/nusketch-hookup/common-nusketch-hookup-plans.krf').
xc_source_line(a65b125dc0a8c2,54).
xc_kb_names(a65b125dc0a8c2,["?sketch","?agent"]).
xc_mapping_rows(a65b125dc0a8c2,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 62, column 61), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125dc0a8c2,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 62, column 61), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_uninferredSentence('x_ist-Information'(x_CompanionsSketchRolodexMt,x_nuSketchFileURL(V1,V2))),x_methodForAction(x_openSketch(V1),x_actionSequence(x_TheList(x_doAnnounce("~% openSketch: Can't find url for sketch ~A in sketch rolodex",[V1]))))) :- x_cid(a65b125dc0a8c3,V1,V2).
xc_microtheory(a65b125dc0a8c3,'x_Cogsketch-AgentMt').
xc_source_file(a65b125dc0a8c3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/nusketch-hookup/common-nusketch-hookup-plans.krf').
xc_source_line(a65b125dc0a8c3,64).
xc_kb_names(a65b125dc0a8c3,["?sketch","?url"]).
xc_mapping_rows(a65b125dc0a8c3,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 72, column 81), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125dc0a8c3,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 72, column 81), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_agentForOpenSketch(V1,V2),x_agentForOpenSketch(V3,V4),x_evaluate(V5,x_SetToListFn(V6)),x_evaluate(V7,x_SetToListFn(x_TheClosedRetrievalSetOf(V8,'x_ist-Information'(x_NuSketchMt,x_isa(V8,x_MappingDisplayColor))))),x_evaluate(V9,x_TheClosedRetrievalSetOf(V10,x_holdsOnRemoteAgent(V2,'x_ist-Information'(x_EverythingPSC,x_isa(V10,x_PerceptualElement))))),x_evaluate(V11,x_TheClosedRetrievalSetOf(V10,x_holdsOnRemoteAgent(V4,'x_ist-Information'(x_EverythingPSC,x_isa(V10,x_PerceptualElement))))),x_evaluate(V12,x_TheClosedRetrievalSetOf(t(V13,V14,V8),x_and(x_elementOf(V15,V6),x_unifies(V15,x_TheList(V13,V14)),x_elementOf(V13,V9),x_elementOf(V14,V11),x_evaluate(V16,x_PositionInListFn(V15,V5)),x_evaluate(V17,x_PlusFn(1,x_ModuloFn(V16,x_LengthOfListFn(V7)))),x_evaluate(V8,x_NthInListFn(V17,V7)))))),x_methodForAction(x_colorizePerceptualElementsFromCorrespondences(V1,V3,V6),x_actionSequence(x_TheList(x_doForEach(t(V13,V14,V8),V12,x_actionSequence(x_TheList(x_doSynchronousRemotePlan(V2,x_doSetInkColor(V13,V8)),x_doSynchronousRemotePlan(V4,x_doSetInkColor(V14,V8))))),x_doAnnounce("~% Colorized correspondences:~%  ~a",[V12]))))) :- x_cid(a65b125dc0a8c4,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17).
xc_microtheory(a65b125dc0a8c4,'x_Cogsketch-AgentMt').
xc_source_file(a65b125dc0a8c4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/nusketch-hookup/common-nusketch-hookup-plans.krf').
xc_source_line(a65b125dc0a8c4,74).
xc_kb_names(a65b125dc0a8c4,["?sketch-base","?agent-base","?sketch-target","?agent-target","?corr-list","?correspondences","?colors","?color","?base-perceptual-elements","?thing","?target-perceptual-elements","?item-color-tuples","?item-base","?item-target","?correspondence","?pos","?color-pos"]).
xc_mapping_rows(a65b125dc0a8c4,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 112, column 55), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125dc0a8c4,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 112, column 55), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
kb_cache_footer(footer{count:15,digest:'3c60796784e6d78a719c087f04afc6060e648396dd2aa5556d871b2c9fde1a6b',headerDigest:f6f687730a8d4d5c6e16846c23e5ac9fbb08d6114956fac044c8a4ee9e57aee5}).
