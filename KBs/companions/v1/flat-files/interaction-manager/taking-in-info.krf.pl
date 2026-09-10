:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:49,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:229,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:f33ab025c67f13bed6247cf0cc83d75fde422699d8d1debaf23b16cb29f5556b,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:9045,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf',sourceHash:'94fdf46c6b61a6ef581758c6e4d14470d2859f606d7f8e3e53bb8e926eb167c3',warnings:[]}).
x_isa(x_absorbNewInformation,x_ComplexActionPredicate) :- x_cid(a65b125d8a604f).
xc_microtheory(a65b125d8a604f,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a604f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a604f,19).
xc_kb_names(a65b125d8a604f,[]).
xc_mapping_rows(a65b125d8a604f,[]).
x_arity(x_absorbNewInformation,4) :- x_cid(a65b125d8a6050).
xc_microtheory(a65b125d8a6050,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6050,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6050,20).
xc_kb_names(a65b125d8a6050,[]).
xc_mapping_rows(a65b125d8a6050,[]).
x_arg1Isa(x_absorbNewInformation,'x_CycLExpression-Assertible') :- x_cid(a65b125d8a6051).
xc_microtheory(a65b125d8a6051,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6051,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6051,21).
xc_kb_names(a65b125d8a6051,[]).
xc_mapping_rows(a65b125d8a6051,[]).
x_arg2Isa(x_absorbNewInformation,x_Microtheory) :- x_cid(a65b125d8a6052).
xc_microtheory(a65b125d8a6052,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6052,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6052,22).
xc_kb_names(a65b125d8a6052,[]).
xc_mapping_rows(a65b125d8a6052,[]).
x_arg4Isa(x_absorbNewInformation,x_Microtheory) :- x_cid(a65b125d8a6053).
xc_microtheory(a65b125d8a6053,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6053,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6053,23).
xc_kb_names(a65b125d8a6053,[]).
xc_mapping_rows(a65b125d8a6053,[]).
x_comment(x_absorbNewInformation,"(assimilateNewInformation ?info ?discourse-ctxt ?sentence-id ?context) attempts to absorb the information ?info, either by explanation or learning, with the discourse context ?discourse-ctxt as a resource, in the session reasoning ?context.") :- x_cid(a65b125d8a6054).
xc_microtheory(a65b125d8a6054,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6054,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6054,24).
xc_kb_names(a65b125d8a6054,[]).
xc_mapping_rows(a65b125d8a6054,[]).
x_preconditionForMethod(x_and(x_currentSessionReasoner(V1)),x_methodForAction(x_absorbNewInformation(V2,V3,V4,V5),x_actionSequence(x_TheList(x_doAnnounce("~% Asserting that )...~%  ~A ",[V2]),x_doTell('x_ist-Information'(x_BaseKB,V2)),x_doTell('x_ist-Information'(V5,x_processingComplete(V4))))))) :- x_cid(a65b125d8a6055,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d8a6055,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6055,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6055,28).
xc_kb_names(a65b125d8a6055,["?sr","?info","?discourse-ctxt","?sentence-id","?context"]).
xc_mapping_rows(a65b125d8a6055,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 34, column 51), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d8a6055,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 34, column 51), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_currentSessionReasoner(V1),x_sessionContext(V2),x_newReifiedUtterance(V3)),x_methodForAction(x_doSolicitInputIntoWM(V4),x_actionSequence(x_TheList(x_doRefreshStoryInputMt,x_doAgentPlan(x_actionSequence(x_TheList(x_doRecordMembers(x_TheSet('x_ist-Information'(V2,x_isa(V3,x_RequestForStory)),'x_ist-Information'(V2,x_iteIllocutionaryForce(V3,x_Query)),'x_ist-Information'(V2,x_StoreInWMOrKB(V2,x_WM)),'x_ist-Information'(V2,x_mtForStoryInput(V2,V4)))),x_doRespond(V3,"Please provide a short illustrative story.")))))))) :- x_cid(a65b125d8a6056,V1,V2,V3,V4).
xc_microtheory(a65b125d8a6056,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6056,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6056,39).
xc_kb_names(a65b125d8a6056,["?sr","?context","?system-utterance","?teachingMt"]).
xc_mapping_rows(a65b125d8a6056,[]).
x_preconditionForMethod(x_and(x_currentSessionReasoner(V1),x_sessionContext(V2),x_newReifiedUtterance(V3)),x_methodForAction(x_doSolicitInputIntoKB(V4),x_actionSequence(x_TheList(x_doRefreshStoryInputMt,x_doAgentPlan(x_actionSequence(x_TheList(x_doRecordMembers(x_TheSet('x_ist-Information'(V2,x_isa(V3,x_RequestForStory)),'x_ist-Information'(V2,x_iteIllocutionaryForce(V3,x_Query)),'x_ist-Information'(V2,x_StoreInWMOrKB(V2,x_KB)),'x_ist-Information'(V2,x_mtForStoryInput(V2,V4)))),x_doRespond(V3,"Please provide a short illustrative story.")))))))) :- x_cid(a65b125d8a6057,V1,V2,V3,V4).
xc_microtheory(a65b125d8a6057,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6057,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6057,59).
xc_kb_names(a65b125d8a6057,["?sr","?context","?system-utterance","?teachingMt"]).
xc_mapping_rows(a65b125d8a6057,[]).
x_preconditionForMethod(x_and(x_currentSessionReasoner(V1),x_sessionContext(V2),x_newReifiedUtterance(V3)),x_methodForAction(x_doSolicitInputForSAGE(V4,V5),x_actionSequence(x_TheList(x_doRefreshStoryInputMt,x_doAgentPlan(x_actionSequence(x_TheList(x_doRecordMembers(x_TheSet('x_ist-Information'(V2,x_isa(V3,x_RequestForStory)),'x_ist-Information'(V2,x_iteIllocutionaryForce(V3,x_Query)),'x_ist-Information'(V2,x_StoreInWMOrKB(V2,x_SAGE)),'x_ist-Information'(V2,x_mtForStoryInput(V2,V4)),'x_ist-Information'(V2,x_generalizeUserInputFromMt(V4,V5)))),x_doRespond(V3,"Please provide a short illustrative story.")))))))) :- x_cid(a65b125d8a6058,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d8a6058,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6058,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6058,79).
xc_kb_names(a65b125d8a6058,["?sr","?context","?system-utterance","?teachingMt","?gContext"]).
xc_mapping_rows(a65b125d8a6058,[]).
x_isa(x_doSolicitInputIntoKB,x_ComplexActionPredicate) :- x_cid(a65b125d8a6059).
xc_microtheory(a65b125d8a6059,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6059,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6059,100).
xc_kb_names(a65b125d8a6059,[]).
xc_mapping_rows(a65b125d8a6059,[]).
x_arity(x_doSolicitInputIntoKB,1) :- x_cid(a65b125d8a605a).
xc_microtheory(a65b125d8a605a,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a605a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a605a,101).
xc_kb_names(a65b125d8a605a,[]).
xc_mapping_rows(a65b125d8a605a,[]).
x_arg1Isa(x_doSolicitInputIntoKB,x_Microtheory) :- x_cid(a65b125d8a605b).
xc_microtheory(a65b125d8a605b,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a605b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a605b,102).
xc_kb_names(a65b125d8a605b,[]).
xc_mapping_rows(a65b125d8a605b,[]).
x_comment(x_doSolicitInputIntoKB,"(doSolicitInputIntoKB <microtheory>) prompts the user for input and asserts \nfacts such that the interpretation of the next user utterance will be stored in <microtheory> in the KB") :- x_cid(a65b125d8a605c).
xc_microtheory(a65b125d8a605c,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a605c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a605c,103).
xc_kb_names(a65b125d8a605c,[]).
xc_mapping_rows(a65b125d8a605c,[]).
x_isa(x_doSolicitInputIntoWM,x_ComplexActionPredicate) :- x_cid(a65b125d8a605d).
xc_microtheory(a65b125d8a605d,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a605d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a605d,107).
xc_kb_names(a65b125d8a605d,[]).
xc_mapping_rows(a65b125d8a605d,[]).
x_arity(x_doSolicitInputIntoWM,1) :- x_cid(a65b125d8a605e).
xc_microtheory(a65b125d8a605e,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a605e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a605e,108).
xc_kb_names(a65b125d8a605e,[]).
xc_mapping_rows(a65b125d8a605e,[]).
x_arg1Isa(x_doSolicitInputIntoWM,x_Microtheory) :- x_cid(a65b125d8a605f).
xc_microtheory(a65b125d8a605f,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a605f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a605f,109).
xc_kb_names(a65b125d8a605f,[]).
xc_mapping_rows(a65b125d8a605f,[]).
x_comment(x_doSolicitInputIntoWM,"(doSolicitInputIntoWM <microtheory>) prompts the user for input and asserts \nfacts such that the interpretation of the next user utterance will be stored in <microtheory> in WM.") :- x_cid(a65b125d8a6060).
xc_microtheory(a65b125d8a6060,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6060,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6060,110).
xc_kb_names(a65b125d8a6060,[]).
xc_mapping_rows(a65b125d8a6060,[]).
x_isa(x_doSolicitInputForSAGE,x_ComplexActionPredicate) :- x_cid(a65b125d8a6061).
xc_microtheory(a65b125d8a6061,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6061,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6061,114).
xc_kb_names(a65b125d8a6061,[]).
xc_mapping_rows(a65b125d8a6061,[]).
x_arity(x_doSolicitInputForSAGE,2) :- x_cid(a65b125d8a6062).
xc_microtheory(a65b125d8a6062,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6062,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6062,115).
xc_kb_names(a65b125d8a6062,[]).
xc_mapping_rows(a65b125d8a6062,[]).
x_arg1Isa(x_doSolicitInputForSAGE,x_Microtheory) :- x_cid(a65b125d8a6063).
xc_microtheory(a65b125d8a6063,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6063,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6063,116).
xc_kb_names(a65b125d8a6063,[]).
xc_mapping_rows(a65b125d8a6063,[]).
x_arg1Isa(x_doSolicitInputForSAGE,x_CaseLibrary) :- x_cid(a65b125d8a6064).
xc_microtheory(a65b125d8a6064,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6064,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6064,117).
xc_kb_names(a65b125d8a6064,[]).
xc_mapping_rows(a65b125d8a6064,[]).
x_comment(x_doSolicitInputForSAGE,"(doSolicitInputForSAGE <microtheory> <gPool>) prompts the user for input and asserts \nfacts such that the interpretation of the next user utterance will be stored in <microtheory> in the KB, which will then \nbe fed into <gPool> with SAGE.") :- x_cid(a65b125d8a6065).
xc_microtheory(a65b125d8a6065,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6065,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6065,118).
xc_kb_names(a65b125d8a6065,[]).
xc_mapping_rows(a65b125d8a6065,[]).
x_isa(x_doRefreshStoryInputMt,x_ComplexActionPredicate) :- x_cid(a65b125d8a6066).
xc_microtheory(a65b125d8a6066,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6066,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6066,123).
xc_kb_names(a65b125d8a6066,[]).
xc_mapping_rows(a65b125d8a6066,[]).
x_arity(x_doRefreshStoryInputMt,0) :- x_cid(a65b125d8a6067).
xc_microtheory(a65b125d8a6067,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6067,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6067,124).
xc_kb_names(a65b125d8a6067,[]).
xc_mapping_rows(a65b125d8a6067,[]).
x_preconditionForMethod(x_and(x_sessionContext(V1),x_or(x_StoreInWMOrKB(V1,V2),x_mtForStoryInput(V1,V3),x_generalizeUserInputFromMt(V4,V5))),x_methodForAction(x_doRefreshStoryInputMt,x_actionSequence(x_TheList(x_doForget('x_ist-Information'(V1,x_StoreInWMOrKB(V1,V2))),x_doForget('x_ist-Information'(V1,x_mtForStoryInput(V1,V3))),x_doForget('x_ist-Information'(V1,x_generalizeUserInputFromMt(V4,V5))),x_doRetract('x_ist-Information'(V1,x_StoreInWMOrKB(V1,V2))),x_doRetract('x_ist-Information'(V1,x_mtForStoryInput(V1,V3))),x_doRetract('x_ist-Information'(V1,x_generalizeUserInputFromMt(V4,V5))))))) :- x_cid(a65b125d8a6068,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d8a6068,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6068,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6068,128).
xc_kb_names(a65b125d8a6068,["?context","?where","?teachingMt","?teachingMt1","?gContext"]).
xc_mapping_rows(a65b125d8a6068,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_doRefreshStoryInputMt,x_actionSequence(x_TheList))) :- x_cid(a65b125d8a6069).
xc_microtheory(a65b125d8a6069,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a6069,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6069,146).
xc_kb_names(a65b125d8a6069,[]).
xc_mapping_rows(a65b125d8a6069,[]).
'x_<=='(x_preferInContext(x_doRefreshStoryInputMt,V1,V2),x_someArgumentHasPredicate(V1,x_doRetract)) :- x_cid(a65b125d8a606a,V1,V2).
xc_microtheory(a65b125d8a606a,'x_Interaction-ManagerMt').
xc_source_file(a65b125d8a606a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a606a,153).
xc_kb_names(a65b125d8a606a,["?seq1","?seq2"]).
xc_mapping_rows(a65b125d8a606a,[]).
x_isa(x_doSolicitInput,x_ComplexActionPredicate) :- x_cid(a65b125d8a606b).
xc_microtheory(a65b125d8a606b,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a606b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a606b,159).
xc_kb_names(a65b125d8a606b,[]).
xc_mapping_rows(a65b125d8a606b,[]).
x_arity(x_doSolicitInput,1) :- x_cid(a65b125d8a606c).
xc_microtheory(a65b125d8a606c,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a606c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a606c,160).
xc_kb_names(a65b125d8a606c,[]).
xc_mapping_rows(a65b125d8a606c,[]).
x_arg1Isa(x_doSolicitInput,x_Microtheory) :- x_cid(a65b125d8a606d).
xc_microtheory(a65b125d8a606d,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a606d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a606d,161).
xc_kb_names(a65b125d8a606d,[]).
xc_mapping_rows(a65b125d8a606d,[]).
x_comment(x_doSolicitInput,"(doSolicitInput <microtheory>) calls the IM version of the plan.") :- x_cid(a65b125d8a606e).
xc_microtheory(a65b125d8a606e,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a606e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a606e,162).
xc_kb_names(a65b125d8a606e,[]).
xc_mapping_rows(a65b125d8a606e,[]).
x_preconditionForMethod(x_and(x_currentInteractionMgr(V1)),x_methodForAction(x_doSolicitInput(V2),x_actionSequence(x_TheList(x_doRemoteAgentPlan(V1,x_actionSequence(x_TheList(x_doSolicitInput(V2)))))))) :- x_cid(a65b125d8a606f,V1,V2).
xc_microtheory(a65b125d8a606f,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a606f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a606f,165).
xc_kb_names(a65b125d8a606f,["?im","?teachingMt"]).
xc_mapping_rows(a65b125d8a606f,[]).
x_preconditionForMethod(x_currentInteractionMgr(V1),x_methodForAction(x_doSolicitInputIntoWM(V2),x_actionSequence(x_TheList(x_doRemoteAgentPlan(V1,x_doSolicitInputIntoWM(V2)))))) :- x_cid(a65b125d8a6070,V1,V2).
xc_microtheory(a65b125d8a6070,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a6070,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6070,181).
xc_kb_names(a65b125d8a6070,["?im","?teachingMt"]).
xc_mapping_rows(a65b125d8a6070,[]).
x_preconditionForMethod(x_currentInteractionMgr(V1),x_methodForAction(x_doSolicitInputIntoKB(V2),x_actionSequence(x_TheList(x_doRemoteAgentPlan(V1,x_doSolicitInputIntoKB(V2)))))) :- x_cid(a65b125d8a6071,V1,V2).
xc_microtheory(a65b125d8a6071,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a6071,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6071,189).
xc_kb_names(a65b125d8a6071,["?im","?teachingMt"]).
xc_mapping_rows(a65b125d8a6071,[]).
x_preconditionForMethod(x_currentInteractionMgr(V1),x_methodForAction(x_doSolicitInputForSAGE(V2,V3),x_actionSequence(x_TheList(x_doRemoteAgentPlan(V1,x_doSolicitInputForSAGE(V2,V3)))))) :- x_cid(a65b125d8a6072,V1,V2,V3).
xc_microtheory(a65b125d8a6072,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a6072,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6072,197).
xc_kb_names(a65b125d8a6072,["?im","?teachingMt","?gContext"]).
xc_mapping_rows(a65b125d8a6072,[]).
x_isa(x_doSolicitInputIntoKB,x_ComplexActionPredicate) :- x_cid(a65b125d8a6073).
xc_microtheory(a65b125d8a6073,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a6073,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6073,205).
xc_kb_names(a65b125d8a6073,[]).
xc_mapping_rows(a65b125d8a6073,[]).
x_arity(x_doSolicitInputIntoKB,1) :- x_cid(a65b125d8a6074).
xc_microtheory(a65b125d8a6074,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a6074,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6074,206).
xc_kb_names(a65b125d8a6074,[]).
xc_mapping_rows(a65b125d8a6074,[]).
x_arg1Isa(x_doSolicitInputIntoKB,x_Microtheory) :- x_cid(a65b125d8a6075).
xc_microtheory(a65b125d8a6075,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a6075,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6075,207).
xc_kb_names(a65b125d8a6075,[]).
xc_mapping_rows(a65b125d8a6075,[]).
x_comment(x_doSolicitInputIntoKB,"(doSolicitInputIntoKB <microtheory>) prompts the user for input and asserts \nfacts such that the interpretation of the next user utterance will be stored in <microtheory> in the KB") :- x_cid(a65b125d8a6076).
xc_microtheory(a65b125d8a6076,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a6076,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6076,208).
xc_kb_names(a65b125d8a6076,[]).
xc_mapping_rows(a65b125d8a6076,[]).
x_isa(x_doSolicitInputIntoWM,x_ComplexActionPredicate) :- x_cid(a65b125d8a6077).
xc_microtheory(a65b125d8a6077,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a6077,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6077,212).
xc_kb_names(a65b125d8a6077,[]).
xc_mapping_rows(a65b125d8a6077,[]).
x_arity(x_doSolicitInputIntoWM,1) :- x_cid(a65b125d8a6078).
xc_microtheory(a65b125d8a6078,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a6078,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6078,213).
xc_kb_names(a65b125d8a6078,[]).
xc_mapping_rows(a65b125d8a6078,[]).
x_arg1Isa(x_doSolicitInputIntoWM,x_Microtheory) :- x_cid(a65b125d8a6079).
xc_microtheory(a65b125d8a6079,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a6079,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a6079,214).
xc_kb_names(a65b125d8a6079,[]).
xc_mapping_rows(a65b125d8a6079,[]).
x_comment(x_doSolicitInputIntoWM,"(doSolicitInputIntoWM <microtheory>) prompts the user for input and asserts \nfacts such that the interpretation of the next user utterance will be stored in <microtheory> in WM.") :- x_cid(a65b125d8a607a).
xc_microtheory(a65b125d8a607a,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a607a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a607a,215).
xc_kb_names(a65b125d8a607a,[]).
xc_mapping_rows(a65b125d8a607a,[]).
x_isa(x_doSolicitInputForSAGE,x_ComplexActionPredicate) :- x_cid(a65b125d8a607b).
xc_microtheory(a65b125d8a607b,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a607b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a607b,219).
xc_kb_names(a65b125d8a607b,[]).
xc_mapping_rows(a65b125d8a607b,[]).
x_arity(x_doSolicitInputForSAGE,2) :- x_cid(a65b125d8a607c).
xc_microtheory(a65b125d8a607c,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a607c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a607c,220).
xc_kb_names(a65b125d8a607c,[]).
xc_mapping_rows(a65b125d8a607c,[]).
x_arg1Isa(x_doSolicitInputForSAGE,x_Microtheory) :- x_cid(a65b125d8a607d).
xc_microtheory(a65b125d8a607d,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a607d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a607d,221).
xc_kb_names(a65b125d8a607d,[]).
xc_mapping_rows(a65b125d8a607d,[]).
x_arg1Isa(x_doSolicitInputForSAGE,x_CaseLibrary) :- x_cid(a65b125d8a607e).
xc_microtheory(a65b125d8a607e,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a607e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a607e,222).
xc_kb_names(a65b125d8a607e,[]).
xc_mapping_rows(a65b125d8a607e,[]).
x_comment(x_doSolicitInputForSAGE,"(doSolicitInputForSAGE <microtheory> <gPool>) prompts the user for input and asserts \nfacts such that the interpretation of the next user utterance will be stored in <microtheory> in the KB, which will then \nbe fed into <gPool> with SAGE.") :- x_cid(a65b125d8a607f).
xc_microtheory(a65b125d8a607f,'x_Session-ReasonerMt').
xc_source_file(a65b125d8a607f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/taking-in-info.krf').
xc_source_line(a65b125d8a607f,223).
xc_kb_names(a65b125d8a607f,[]).
xc_mapping_rows(a65b125d8a607f,[]).
kb_cache_footer(footer{count:49,digest:f33ab025c67f13bed6247cf0cc83d75fde422699d8d1debaf23b16cb29f5556b,headerDigest:'07bafa2717e8430e5c16d8cd90f05a0cfc43facfc5d590b22b7d4b28e66dc691'}).
