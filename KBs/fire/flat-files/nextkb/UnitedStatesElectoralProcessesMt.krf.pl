:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:26,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:28,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:b26594588f53aa699cc588caf23b7d9f17369efdb2be75c6db803eeb82721d7c,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3702,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf',sourceHash:'7a3ba0ca8cc4a69b69692b637575163cc8cb1692ef8ce9daafb3aea39a88b5da',warnings:[]}).
x_isa('x_BlanketPrimaryElection-US','x_PrimaryElectionType-US') :- x_cid(a65b1277b417b9).
xc_microtheory(a65b1277b417b9,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417b9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417b9,3).
xc_kb_names(a65b1277b417b9,[]).
xc_mapping_rows(a65b1277b417b9,[]).
x_isa('x_OpenPrimaryElection-US','x_PrimaryElectionType-US') :- x_cid(a65b1277b417ba).
xc_microtheory(a65b1277b417ba,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417ba,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417ba,4).
xc_kb_names(a65b1277b417ba,[]).
xc_mapping_rows(a65b1277b417ba,[]).
x_isa('x_ClosedPrimaryElection-US','x_PrimaryElectionType-US') :- x_cid(a65b1277b417bb).
xc_microtheory(a65b1277b417bb,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417bb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417bb,5).
xc_kb_names(a65b1277b417bb,[]).
xc_mapping_rows(a65b1277b417bb,[]).
x_isa('x_PrimaryElectionType-US',x_FacetingCollectionType) :- x_cid(a65b1277b417bc).
xc_microtheory(a65b1277b417bc,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417bc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417bc,6).
xc_kb_names(a65b1277b417bc,[]).
xc_mapping_rows(a65b1277b417bc,[]).
x_isa('x_PrimaryElectionType-US',x_NonAbducibleCollection) :- x_cid(a65b1277b417bd).
xc_microtheory(a65b1277b417bd,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417bd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417bd,7).
xc_kb_names(a65b1277b417bd,[]).
xc_mapping_rows(a65b1277b417bd,[]).
'x_facets-Strict'(x_USPrimaryElection,'x_PrimaryElectionType-US') :- x_cid(a65b1277b417be).
xc_microtheory(a65b1277b417be,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417be,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417be,8).
xc_kb_names(a65b1277b417be,[]).
xc_mapping_rows(a65b1277b417be,[]).
x_typeGenls('x_PrimaryElectionType-US',x_USPrimaryElection) :- x_cid(a65b1277b417bf).
xc_microtheory(a65b1277b417bf,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417bf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417bf,9).
xc_kb_names(a65b1277b417bf,[]).
xc_mapping_rows(a65b1277b417bf,[]).
x_partitionedInto(x_USPrimaryElection,x_TheSet(x_SubcollectionOfWithRelationFromFn(x_USPrimaryElection,x_primaryOfParty,'x_DemocraticParty-US'),x_SubcollectionOfWithRelationToFn(x_USPrimaryElection,x_primaryOfParty,'x_RepublicanParty-US'))) :- x_cid(a65b1277b417c0).
xc_microtheory(a65b1277b417c0,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417c0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417c0,10).
xc_kb_names(a65b1277b417c0,[]).
xc_mapping_rows(a65b1277b417c0,[]).
x_rewriteOf(x_USPrimaryElection,x_SubcollectionOfWithRelationToFn(x_PrimaryElection,x_eventOccursAt,x_UnitedStatesOfAmerica)) :- x_cid(a65b1277b417c1).
xc_microtheory(a65b1277b417c1,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417c1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417c1,11).
xc_kb_names(a65b1277b417c1,[]).
xc_mapping_rows(a65b1277b417c1,[]).
x_argSometimesIsa(x_primaryOfParty,2,x_PoliticalParty) :- x_cid(a65b1277b417c2).
xc_microtheory(a65b1277b417c2,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417c2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417c2,12).
xc_kb_names(a65b1277b417c2,[]).
xc_mapping_rows(a65b1277b417c2,[]).
x_comment(x_primaryOfParty,"(#$primaryOfParty PRIMARY PARTY) means that PRIMARY is a #$PrimaryElection sponsored by PARTY, in which a candidate who is a member of PARTY is nominated to run in the #$GeneralElection of which the primary is a #$primaryElectionOf.") :- x_cid(a65b1277b417c3).
xc_microtheory(a65b1277b417c3,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417c3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417c3,13).
xc_kb_names(a65b1277b417c3,[]).
xc_mapping_rows(a65b1277b417c3,[]).
x_comment(x_USPrimaryElection,"The collection of all #$PrimaryElections occuring in the #$UnitedStatesOfAmerica.") :- x_cid(a65b1277b417c4).
xc_microtheory(a65b1277b417c4,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417c4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417c4,14).
xc_kb_names(a65b1277b417c4,[]).
xc_mapping_rows(a65b1277b417c4,[]).
x_comment('x_PrimaryElectionType-US',"A #$SecondOrderCollection that facets #$USPrimaryElection.  Each instance is a subclass of #$USPrimaryElection distinguished by a feature of who is allowed to vote in the primary.  #$USPrimaryElections are subdivided into three types:  #$ClosedPrimaryElection-US, whose instances are such that voters are required to vote in the #$PrimaryElection of the #$PoliticalParty with which they are registered (see #$primaryOfParty), #$OpenPrimaryElection-US, whose instances are such that voters are constrained to vote only for candidates within a single #$PrimaryElection, but may vote in the primary of either party, and #$BlanketPrimaryElection-US, wherein candidates from all parties compete, using the same procedures as a #$GeneralElection.") :- x_cid(a65b1277b417c5).
xc_microtheory(a65b1277b417c5,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417c5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417c5,15).
xc_kb_names(a65b1277b417c5,[]).
xc_mapping_rows(a65b1277b417c5,[]).
x_comment(x_stateHasPrimaryOfType,"(#$stateHasPrimaryOfType STATE PRIMARY-TYPE) means that the #$State-UnitedStates STATE has a primary of type TYPE, where the indicated faceting of which TYPE is a member is that of #$PrimaryElectionType-US.") :- x_cid(a65b1277b417c6).
xc_microtheory(a65b1277b417c6,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417c6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417c6,16).
xc_kb_names(a65b1277b417c6,[]).
xc_mapping_rows(a65b1277b417c6,[]).
x_comment('x_ClosedPrimaryElection-US',"The collection of all instances of #$PrimaryElection in which persons voting (#$votesInElection) are required by law to vote for candidates in the primary for the party of which the voter is a registered member.") :- x_cid(a65b1277b417c7).
xc_microtheory(a65b1277b417c7,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417c7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417c7,17).
xc_kb_names(a65b1277b417c7,[]).
xc_mapping_rows(a65b1277b417c7,[]).
x_comment('x_OpenPrimaryElection-US',"The collection of all instances of #$PrimaryElection in which persons are permitted to vote, regardless of whether the person is a member of the party sponsoring the primary (#$primaryOfParty).  However, in ordinary instances of #$OpenPrimaryElection-US, voters are not allowed to vote for candidates in different primaries:  that is, the voter is allowed to choose which #$PrimaryElection he or she votes in, but is required to choose exactly one and stick with the choice.") :- x_cid(a65b1277b417c8).
xc_microtheory(a65b1277b417c8,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417c8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417c8,18).
xc_kb_names(a65b1277b417c8,[]).
xc_mapping_rows(a65b1277b417c8,[]).
x_comment('x_BlanketPrimaryElection-US',"The collection of all instances of #$PrimaryElection which are not sponsored by a #$PoliticalParty, but in which candidates of all parties competing in the general election run.") :- x_cid(a65b1277b417c9).
xc_microtheory(a65b1277b417c9,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417c9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417c9,19).
xc_kb_names(a65b1277b417c9,[]).
xc_mapping_rows(a65b1277b417c9,[]).
x_genlPreds(x_primaryOfParty,x_partyParticipatingInElection) :- x_cid(a65b1277b417ca).
xc_microtheory(a65b1277b417ca,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417ca,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417ca,20).
xc_kb_names(a65b1277b417ca,[]).
xc_mapping_rows(a65b1277b417ca,[]).
x_genlPreds(x_primaryOfParty,x_directingAgent) :- x_cid(a65b1277b417cb).
xc_microtheory(a65b1277b417cb,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417cb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417cb,21).
xc_kb_names(a65b1277b417cb,[]).
xc_mapping_rows(a65b1277b417cb,[]).
x_genls(x_USPrimaryElection,x_PrimaryElection) :- x_cid(a65b1277b417cc).
xc_microtheory(a65b1277b417cc,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417cc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417cc,22).
xc_kb_names(a65b1277b417cc,[]).
xc_mapping_rows(a65b1277b417cc,[]).
x_genls(x_USPrimaryElection,'x_Event-Localized') :- x_cid(a65b1277b417cd).
xc_microtheory(a65b1277b417cd,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417cd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417cd,23).
xc_kb_names(a65b1277b417cd,[]).
xc_mapping_rows(a65b1277b417cd,[]).
x_genls(x_SubcollectionOfWithRelationToFn(x_USPrimaryElection,x_primaryOfParty,'x_RepublicanParty-US'),x_PrimaryElection) :- x_cid(a65b1277b417ce).
xc_microtheory(a65b1277b417ce,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417ce,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417ce,24).
xc_kb_names(a65b1277b417ce,[]).
xc_mapping_rows(a65b1277b417ce,[]).
x_genls('x_PrimaryElectionType-US',x_FacetInstanceCollection) :- x_cid(a65b1277b417cf).
xc_microtheory(a65b1277b417cf,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417cf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417cf,25).
xc_kb_names(a65b1277b417cf,[]).
xc_mapping_rows(a65b1277b417cf,[]).
x_genls('x_ClosedPrimaryElection-US',x_USPrimaryElection) :- x_cid(a65b1277b417d0).
xc_microtheory(a65b1277b417d0,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417d0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417d0,26).
xc_kb_names(a65b1277b417d0,[]).
xc_mapping_rows(a65b1277b417d0,[]).
x_genls('x_OpenPrimaryElection-US',x_USPrimaryElection) :- x_cid(a65b1277b417d1).
xc_microtheory(a65b1277b417d1,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417d1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417d1,27).
xc_kb_names(a65b1277b417d1,[]).
xc_mapping_rows(a65b1277b417d1,[]).
x_genls('x_BlanketPrimaryElection-US',x_USPrimaryElection) :- x_cid(a65b1277b417d2).
xc_microtheory(a65b1277b417d2,x_UnitedStatesElectoralProcessesMt).
xc_source_file(a65b1277b417d2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/UnitedStatesElectoralProcessesMt.krf').
xc_source_line(a65b1277b417d2,28).
xc_kb_names(a65b1277b417d2,[]).
xc_mapping_rows(a65b1277b417d2,[]).
kb_cache_footer(footer{count:26,digest:b26594588f53aa699cc588caf23b7d9f17369efdb2be75c6db803eeb82721d7c,headerDigest:'84010e10baa11b11f17667a1d310fbf5a05eba1a3c5302a1a9c04ff165dda7e2'}).
