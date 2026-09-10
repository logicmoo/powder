:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:14,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:45,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:a2da3a7b33b1bb4dd6fa33f1fd56dff8fbc589d31a16751b89d38beb5ef47a8c,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/log-communication.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:1874,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/log-communication.krf',sourceHash:'6dd2ef9678c2f76b9a2ba7bafca6709476e56e2ce537b95b523e6c9984e85848',warnings:[]}).
x_isa(x_doEmailIMLogToUser,x_SimpleActionPredicate) :- x_cid(a65b125d560839).
xc_microtheory(a65b125d560839,'x_Interaction-ManagerMt').
xc_source_file(a65b125d560839,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/log-communication.krf').
xc_source_line(a65b125d560839,19).
xc_kb_names(a65b125d560839,[]).
xc_mapping_rows(a65b125d560839,[]).
x_arity(x_doEmailIMLogToUser,5) :- x_cid(a65b125d56083a).
xc_microtheory(a65b125d56083a,'x_Interaction-ManagerMt').
xc_source_file(a65b125d56083a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/log-communication.krf').
xc_source_line(a65b125d56083a,20).
xc_kb_names(a65b125d56083a,[]).
xc_mapping_rows(a65b125d56083a,[]).
x_arg1Isa(x_doEmailIMLogToUser,x_CharacterString) :- x_cid(a65b125d56083b).
xc_microtheory(a65b125d56083b,'x_Interaction-ManagerMt').
xc_source_file(a65b125d56083b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/log-communication.krf').
xc_source_line(a65b125d56083b,21).
xc_kb_names(a65b125d56083b,[]).
xc_mapping_rows(a65b125d56083b,[]).
x_arg2Isa(x_doEmailIMLogToUser,x_CharacterString) :- x_cid(a65b125d56083c).
xc_microtheory(a65b125d56083c,'x_Interaction-ManagerMt').
xc_source_file(a65b125d56083c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/log-communication.krf').
xc_source_line(a65b125d56083c,22).
xc_kb_names(a65b125d56083c,[]).
xc_mapping_rows(a65b125d56083c,[]).
x_arg3Isa(x_doEmailIMLogToUser,x_CycLTerm) :- x_cid(a65b125d56083d).
xc_microtheory(a65b125d56083d,'x_Interaction-ManagerMt').
xc_source_file(a65b125d56083d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/log-communication.krf').
xc_source_line(a65b125d56083d,23).
xc_kb_names(a65b125d56083d,[]).
xc_mapping_rows(a65b125d56083d,[]).
x_arg4Isa(x_doEmailIMLogToUser,x_CharacterString) :- x_cid(a65b125d56083e).
xc_microtheory(a65b125d56083e,'x_Interaction-ManagerMt').
xc_source_file(a65b125d56083e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/log-communication.krf').
xc_source_line(a65b125d56083e,24).
xc_kb_names(a65b125d56083e,[]).
xc_mapping_rows(a65b125d56083e,[]).
x_arg5Isa(x_doEmailIMLogToUser,x_CycLTerm) :- x_cid(a65b125d56083f).
xc_microtheory(a65b125d56083f,'x_Interaction-ManagerMt').
xc_source_file(a65b125d56083f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/log-communication.krf').
xc_source_line(a65b125d56083f,25).
xc_kb_names(a65b125d56083f,[]).
xc_mapping_rows(a65b125d56083f,[]).
x_comment(x_doEmailIMLogToUser,"(doEmailIMLogToUser <logname> \n                      <subject-format-ctrl> <subject-format-args> \n                      <message-format-ctrl> <message-format-args>) \n    emails the log to the user if that user allows email notifications and has \n    specified their email address.") :- x_cid(a65b125d560840).
xc_microtheory(a65b125d560840,'x_Interaction-ManagerMt').
xc_source_file(a65b125d560840,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/log-communication.krf').
xc_source_line(a65b125d560840,26).
xc_kb_names(a65b125d560840,[]).
xc_mapping_rows(a65b125d560840,[]).
x_isa(x_IMCommunicationsMt,x_Microtheory) :- x_cid(a65b125d560841).
xc_microtheory(a65b125d560841,'x_Interaction-ManagerMt').
xc_source_file(a65b125d560841,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/log-communication.krf').
xc_source_line(a65b125d560841,34).
xc_kb_names(a65b125d560841,[]).
xc_mapping_rows(a65b125d560841,[]).
x_comment(x_IMCommunicationsMt,"A microtheory that stores information about how IM should\ncommunication with the user, over email and the like.") :- x_cid(a65b125d560842).
xc_microtheory(a65b125d560842,'x_Interaction-ManagerMt').
xc_source_file(a65b125d560842,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/log-communication.krf').
xc_source_line(a65b125d560842,35).
xc_kb_names(a65b125d560842,[]).
xc_mapping_rows(a65b125d560842,[]).
x_isa(x_emailAddressForIMCommunication,x_Predicate) :- x_cid(a65b125d560843).
xc_microtheory(a65b125d560843,'x_Interaction-ManagerMt').
xc_source_file(a65b125d560843,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/log-communication.krf').
xc_source_line(a65b125d560843,38).
xc_kb_names(a65b125d560843,[]).
xc_mapping_rows(a65b125d560843,[]).
x_arity(x_emailAddressForIMCommunication,1) :- x_cid(a65b125d560844).
xc_microtheory(a65b125d560844,'x_Interaction-ManagerMt').
xc_source_file(a65b125d560844,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/log-communication.krf').
xc_source_line(a65b125d560844,39).
xc_kb_names(a65b125d560844,[]).
xc_mapping_rows(a65b125d560844,[]).
x_arg1Isa(x_emailAddressForIMCommunication,x_String) :- x_cid(a65b125d560845).
xc_microtheory(a65b125d560845,'x_Interaction-ManagerMt').
xc_source_file(a65b125d560845,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/log-communication.krf').
xc_source_line(a65b125d560845,40).
xc_kb_names(a65b125d560845,[]).
xc_mapping_rows(a65b125d560845,[]).
x_comment(x_emailAddressForIMCommunication,"(emailAddressForIMCommunication ?email-address)\nindicates that IM should send its emails to ?email-address.") :- x_cid(a65b125d560846).
xc_microtheory(a65b125d560846,'x_Interaction-ManagerMt').
xc_source_file(a65b125d560846,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/log-communication.krf').
xc_source_line(a65b125d560846,41).
xc_kb_names(a65b125d560846,[]).
xc_mapping_rows(a65b125d560846,[]).
kb_cache_footer(footer{count:14,digest:a2da3a7b33b1bb4dd6fa33f1fd56dff8fbc589d31a16751b89d38beb5ef47a8c,headerDigest:c06a5c5d3061dd5ee518bc34c68f8f0cc9f68f34fe346e055d7de49cbde0f6a1}).
