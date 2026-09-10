:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:6,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:178,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:c3e1c7233ea9b647d29770c40773092ad21449fd069ba3f468fb75a11854c4fc,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/design-coach/design-buddy-rules.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:7185,source:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/design-coach/design-buddy-rules.krf',sourceHash:d00c79e9a84fa746584edcab6b137cf992d5358f6cad6d69b7af3ce1a9bf164e,warnings:[]}).
x_isa(x_SKEADBRulesMt,x_Microtheory) :- x_cid(a65b125c810430).
xc_microtheory(a65b125c810430,x_SKEADBFactsMt).
xc_source_file(a65b125c810430,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/design-coach/design-buddy-rules.krf').
xc_source_line(a65b125c810430,15).
xc_kb_names(a65b125c810430,[]).
xc_mapping_rows(a65b125c810430,[]).
xc_exclude_globals(a65b125c810430,true).
x_genlMt(x_SKEADBRulesMt,x_SKEADBFactsMt) :- x_cid(a65b125c810431).
xc_microtheory(a65b125c810431,x_SKEADBFactsMt).
xc_source_file(a65b125c810431,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/design-coach/design-buddy-rules.krf').
xc_source_line(a65b125c810431,16).
xc_kb_names(a65b125c810431,[]).
xc_mapping_rows(a65b125c810431,[]).
xc_exclude_globals(a65b125c810431,true).
x_comment(x_SKEADBRulesMt,"Holds the rules for Design Buddy.") :- x_cid(a65b125c810432).
xc_microtheory(a65b125c810432,x_SKEADBFactsMt).
xc_source_file(a65b125c810432,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/design-coach/design-buddy-rules.krf').
xc_source_line(a65b125c810432,17).
xc_kb_names(a65b125c810432,[]).
xc_mapping_rows(a65b125c810432,[]).
xc_exclude_globals(a65b125c810432,true).
x_genlMt(x_SKEAReasoningCollectorMt,x_SKEADBRulesMt) :- x_cid(a65b125c810433).
xc_microtheory(a65b125c810433,x_SKEAMt).
xc_source_file(a65b125c810433,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/design-coach/design-buddy-rules.krf').
xc_source_line(a65b125c810433,21).
xc_kb_names(a65b125c810433,[]).
xc_mapping_rows(a65b125c810433,[]).
'x_<=='(x_stateTransitionRequires(V1,V2,x_transMotion(V3,V4)),x_different(V1,V2),x_wmOnly(x_genlMt(V1,V5)),x_wmOnly(x_genlMt(V2,V6)),x_lookupOnly('x_causes-SitSit'(V5,V6)),'x_ist-Information'(V1,x_isa(V7,x_FixedObject)),'x_ist-Information'(V2,x_isa(V7,x_FixedObject)),'x_ist-Information'(V1,x_isa(V3,x_RigidOb)),x_uninferredSentence('x_ist-Information'(V1,x_isa(V3,x_FixedObject))),x_different(V3,V7),'x_ist-Information'(V2,x_isa(V3,x_RigidOb)),x_uninferredSentence('x_ist-Information'(V2,x_isa(V3,x_FixedObject))),x_uninferredSentence(x_stateTransitionRequires(V1,V2,x_rotMotion(V8,V4))),x_relativePositionChange(V5,V6,V3,V7,V4),'x_ist-Information'(V5,x_inkLastModifiedTime(x_GlyphFn(V3,V9),V10)),'x_ist-Information'(V6,x_inkLastModifiedTime(x_GlyphFn(V3,V11),V12))) :- x_cid(a65b125c810434,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b125c810434,x_SKEADBRulesMt).
xc_source_file(a65b125c810434,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/design-coach/design-buddy-rules.krf').
xc_source_line(a65b125c810434,30).
xc_kb_names(a65b125c810434,["?b1-dbmt","?b2-dbmt","?obj1","?dir","?b1","?b2","?obj2","?obj","?layer1","?time1","?layer2","?time2"]).
xc_mapping_rows(a65b125c810434,[]).
xc_exclude_globals(a65b125c810434,true).
'x_<=='(x_stateTransitionRequires(V1,V2,x_rotMotion(V3,V4)),x_different(V1,V2),x_wmOnly(x_genlMt(V1,V5)),x_wmOnly(x_genlMt(V2,V6)),x_lookupOnly('x_causes-SitSit'(V5,V6)),'x_ist-Information'(V1,x_isa(V3,x_RigidOb)),x_uninferredSentence('x_ist-Information'(V1,x_isa(V3,x_FixedObject))),'x_ist-Information'(V2,x_isa(V3,x_RigidOb)),x_uninferredSentence('x_ist-Information'(V2,x_isa(V3,x_FixedObject))),x_shortestRotationDir(V5,V6,V3,V4),x_different(V4,x_ZeroRot),'x_ist-Information'(V5,x_inkLastModifiedTime(x_GlyphFn(V3,V7),V8)),'x_ist-Information'(V6,x_inkLastModifiedTime(x_GlyphFn(V3,V9),V10))) :- x_cid(a65b125c810435,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125c810435,x_SKEADBRulesMt).
xc_source_file(a65b125c810435,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/design-coach/design-buddy-rules.krf').
xc_source_line(a65b125c810435,55).
xc_kb_names(a65b125c810435,["?b1-dbmt","?b2-dbmt","?obj","?rotDir","?b1","?b2","?layer1","?time1","?layer2","?time2"]).
xc_mapping_rows(a65b125c810435,[]).
xc_exclude_globals(a65b125c810435,true).
kb_cache_footer(footer{count:6,digest:c3e1c7233ea9b647d29770c40773092ad21449fd069ba3f468fb75a11854c4fc,headerDigest:'04c9ee6a0243b942b5a868cea4f8b36f6a426394a141850850d5c43c56525900'}).
