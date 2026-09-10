:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:32,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:50,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'11f848d60234aaaf9a4e13621ca11432c3f813fc6809cd40813a991b0b5de357',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:10358,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf',sourceHash:'9b6ecab2cc173516c397832bb7f4f04337e8a700ad5ba5d6a9b9d9fbbabe4956',warnings:[]}).
x_isa(x_HavingPropositionalAttitudeFn(x_beliefs),x_ExampleScriptedEventTypeForDomain) :- x_cid(a65b127398d75f).
xc_microtheory(a65b127398d75f,x_FolkPsychologyMt).
xc_source_file(a65b127398d75f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d75f,3).
xc_kb_names(a65b127398d75f,[]).
xc_mapping_rows(a65b127398d75f,[]).
x_comment(x_regrets,"A #$PropositionalAttitudeSlot and a specialization of #$hasFactiveEmotion and #$negativeInterest-Prop.  <code>(#$regrets AGT PROP)</code> means that <code>AGT</code> regrets that <code>PROP</code> is true.  In particular, it entails that <code>AGT</code> knows that <code>PROP</code> is true, and that <code>AGT</code> wishes (#$desires) that <code>PROP</code> were not true.  For example,\n<pre>\n(#$regrets Alice (#$not (#$was (#$maritalStatus Alice #$Married))))\n</pre>\nmeans that Alice regrets that she has never been married.  It entails that Alice knows that she has never been married, and that she wishes she had been married.") :- x_cid(a65b127398d760).
xc_microtheory(a65b127398d760,x_FolkPsychologyMt).
xc_source_file(a65b127398d760,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d760,4).
xc_kb_names(a65b127398d760,[]).
xc_mapping_rows(a65b127398d760,[]).
x_comment(x_suspects,"A #$PropositionalAttitudeSlot and specialization of #$hasOpinionAsToTruthOf.  (#$suspects AGT PROP) means that AGT suspects that PROP is true.  For example, (#$suspects Alice (#$isa Bob #$Spy)) means that Alice suspects that Bob is a spy.") :- x_cid(a65b127398d761).
xc_microtheory(a65b127398d761,x_FolkPsychologyMt).
xc_source_file(a65b127398d761,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d761,9).
xc_kb_names(a65b127398d761,[]).
xc_mapping_rows(a65b127398d761,[]).
x_comment(x_doubts,"(#$doubts  AGT PROP) means that the agent AGT doubts the proposition PROP (represented by a #$CycLSentence-Assertible) is true.") :- x_cid(a65b127398d762).
xc_microtheory(a65b127398d762,x_FolkPsychologyMt).
xc_source_file(a65b127398d762,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d762,10).
xc_kb_names(a65b127398d762,[]).
xc_mapping_rows(a65b127398d762,[]).
x_comment(x_fears,"A #$PropositionalAttitudeSlot and specialization of #$worries.  (#$fears AGT PROP) means that that the #$IntelligentAgent AGT fears that the proposition (#$CycLSentence-Assertible) PROP is true.") :- x_cid(a65b127398d763).
xc_microtheory(a65b127398d763,x_FolkPsychologyMt).
xc_source_file(a65b127398d763,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d763,11).
xc_kb_names(a65b127398d763,[]).
xc_mapping_rows(a65b127398d763,[]).
x_comment(x_hopes,"A #$PropositionalAttitudeSlot and specialization of #$hasEpistemicEmotion.  (#$hopes AGT PROP) means that that the #$IntelligentAgent AGT hopes that the proposition (#$CycLSentence-Assertible) PROP is true.") :- x_cid(a65b127398d764).
xc_microtheory(a65b127398d764,x_FolkPsychologyMt).
xc_source_file(a65b127398d764,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d764,12).
xc_kb_names(a65b127398d764,[]).
xc_mapping_rows(a65b127398d764,[]).
x_comment(x_worries,"A #$PropositionalAttitudeSlot and specialization of #$hasEpistemicEmotion.  (#$worries AGT PROP) means that that the #$IntelligentAgent AGT is worried that the proposition (#$CycLSentence-Assertible) PROP is true.") :- x_cid(a65b127398d765).
xc_microtheory(a65b127398d765,x_FolkPsychologyMt).
xc_source_file(a65b127398d765,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d765,13).
xc_kb_names(a65b127398d765,[]).
xc_mapping_rows(a65b127398d765,[]).
x_comment(x_DoubtingSomething,"A #$TemporalStuffType and specialization of #$IntentionalMentalState.  Each instance of #$DoubtingSomething is a #$MentalSituation in which an agent #$doubts that a certain #$Proposition is true, or otherwise experiences a feeling of #$Doubt.") :- x_cid(a65b127398d766).
xc_microtheory(a65b127398d766,x_FolkPsychologyMt).
xc_source_file(a65b127398d766,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d766,14).
xc_kb_names(a65b127398d766,[]).
xc_mapping_rows(a65b127398d766,[]).
x_comment(x_AssumingSomethingToBeTrue,"A specialization of #$IntentionalMentalState.  Each instance of #$AssumingSomethingToBeTrue is a situation in which some #$IntelligentAgent treats some #$Proposition as true without attempting to provide substantive epistemic support for it.  The agent may really believe the proposition in question, or may simply be assuming that the proposition is true \"for the sake of argument.\"") :- x_cid(a65b127398d767).
xc_microtheory(a65b127398d767,x_FolkPsychologyMt).
xc_source_file(a65b127398d767,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d767,15).
xc_kb_names(a65b127398d767,[]).
xc_mapping_rows(a65b127398d767,[]).
x_comment('x_Wishing-MentalState',"A #$TemporalStuffType and specialization of #$IntentionalMentalState.  Each instance of #$Wishing-MentalState is a #$MentalSituation in which an agent wishes that a certain #$Proposition is, or will become, true.") :- x_cid(a65b127398d768).
xc_microtheory(a65b127398d768,x_FolkPsychologyMt).
xc_source_file(a65b127398d768,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d768,16).
xc_kb_names(a65b127398d768,[]).
xc_mapping_rows(a65b127398d768,[]).
x_comment(x_UnderstandingSomething,"A #$TemporalStuffType and specialization of #$IntentionalMentalState.  Each instance of #$UnderstandingSomething is a #$Situation in which an #$IntelligentAgent understands (i.e. mentally grasps or comprehends) something.") :- x_cid(a65b127398d769).
xc_microtheory(a65b127398d769,x_FolkPsychologyMt).
xc_source_file(a65b127398d769,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d769,17).
xc_kb_names(a65b127398d769,[]).
xc_mapping_rows(a65b127398d769,[]).
x_comment(x_BelievingThat,"A #$TemporalStuffType and specialization of #$IntentionalMentalState.  Each instance of #$BelievingThat is a #$MentalSituation in which an agent believes (see #$beliefs) that a certain #$Proposition is true.") :- x_cid(a65b127398d76a).
xc_microtheory(a65b127398d76a,x_FolkPsychologyMt).
xc_source_file(a65b127398d76a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d76a,18).
xc_kb_names(a65b127398d76a,[]).
xc_mapping_rows(a65b127398d76a,[]).
x_comment(x_LosingTrackOfSomething,"A #$FirstOrderCollection.  Each instance of #$LosingTrackOfSomething is an #$Event in which an agent who formally knew the location of a particular thing comes to no longer know the location of that thing.") :- x_cid(a65b127398d76b).
xc_microtheory(a65b127398d76b,x_FolkPsychologyMt).
xc_source_file(a65b127398d76b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d76b,19).
xc_kb_names(a65b127398d76b,[]).
xc_mapping_rows(a65b127398d76b,[]).
x_comment(x_HavingPropositionalAttitudeFn,"A unary, reifiable #$CollectionDenotingFunction that takes a #$PropositionalAttitudeSlot PRED and returns the collection of #$IntentionalMentalStates in which an #$IntelligentAgent bears PRED to some proposition.  For example, (#$HavingPropositionalAttitudeFn #$beliefs) is the collection of situations in which someone believes something.") :- x_cid(a65b127398d76c).
xc_microtheory(a65b127398d76c,x_FolkPsychologyMt).
xc_source_file(a65b127398d76c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d76c,20).
xc_kb_names(a65b127398d76c,[]).
xc_mapping_rows(a65b127398d76c,[]).
x_comment(x_havingPropositionalAttitude,"The predicate corresponding to #$HavingPropositionalAttitudeFn (q.v.).") :- x_cid(a65b127398d76d).
xc_microtheory(a65b127398d76d,x_FolkPsychologyMt).
xc_source_file(a65b127398d76d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d76d,21).
xc_kb_names(a65b127398d76d,[]).
xc_mapping_rows(a65b127398d76d,[]).
x_comment(x_EmotionalQuantityType,"The collection of all specializations of #$EmotionalQuantity (currently named '#$FeelingAttribute').") :- x_cid(a65b127398d76e).
xc_microtheory(a65b127398d76e,x_FolkPsychologyMt).
xc_source_file(a65b127398d76e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d76e,22).
xc_kb_names(a65b127398d76e,[]).
xc_mapping_rows(a65b127398d76e,[]).
x_comment('x_expressingEmotion-Pred',"The predicate corresponding to #$ExpressingEmotionFn (q.v.).") :- x_cid(a65b127398d76f).
xc_microtheory(a65b127398d76f,x_FolkPsychologyMt).
xc_source_file(a65b127398d76f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d76f,23).
xc_kb_names(a65b127398d76f,[]).
xc_mapping_rows(a65b127398d76f,[]).
x_comment(x_FeelingAttribute,"A specialization of #$ScalarQuantity (q.v.). #$FeelingAttribute consists of all the varying degrees of such things as #$Happiness, #$Sadness and other types of emotions. Each instance is a scalar interval that consists of a number and emotional dimension. Rarely, if ever, are these things assigned specific values or ranges of values. But if certain emotional scales came to be used and it proved useful to represent them we could easily assign numeric values to these quantities. Generally, the instances of this collection will be denoted by terms formed by applying the #$GenericValueFunctions to specializations of this collection: e.g. (#$HighAmountFn #$Anger).") :- x_cid(a65b127398d770).
xc_microtheory(a65b127398d770,x_FolkPsychologyMt).
xc_source_file(a65b127398d770,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d770,24).
xc_kb_names(a65b127398d770,[]).
xc_mapping_rows(a65b127398d770,[]).
x_comment(x_ExpressingEmotionFn,"A unary, reifiable #$CollectionDenotingFunction that takes an #$EmotionalQuantityType EMOTION-TYPE and returns the collection of #$Actions in which an #$Agent-PartiallyTangible expresses (an instance of) EMOTION-TYPE.  For example, (#$ExpressingEmotionFn #$Anger) is the collection of actions in which an agent expresses anger.") :- x_cid(a65b127398d771).
xc_microtheory(a65b127398d771,x_FolkPsychologyMt).
xc_source_file(a65b127398d771,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d771,25).
xc_kb_names(a65b127398d771,[]).
xc_mapping_rows(a65b127398d771,[]).
x_comment(x_Rage,"A #$EmotionalQuantityType.  Each instance of #$Rage is an extreme instance of #$Anger.") :- x_cid(a65b127398d772).
xc_microtheory(a65b127398d772,x_FolkPsychologyMt).
xc_source_file(a65b127398d772,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d772,26).
xc_kb_names(a65b127398d772,[]).
xc_mapping_rows(a65b127398d772,[]).
x_comment(x_Like,"An instance of #$EmotionalQuantityType and specialization of #$Approval.  Each instance of #$Like is some agent's feeling of affection or affinity for an agent, event, or thing.  Instances of #$Like vary depending on the intensity of the feeling, the subject experiencing the feeling, and/or the object of liking.  Specializations of #$Like include #$Affection, #$Admiration, and #$Enjoyment.") :- x_cid(a65b127398d773).
xc_microtheory(a65b127398d773,x_FolkPsychologyMt).
xc_source_file(a65b127398d773,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d773,27).
xc_kb_names(a65b127398d773,[]).
xc_mapping_rows(a65b127398d773,[]).
x_comment(x_AccidentallyLeavingSomethingSomewhere,"A #$FirstOrderCollection and specialization of #$Accident and #$Forgetting-Generic.  Each instance of #$AccidentallyLeavingSomethingSomewhere is an #$Event in which an #$Agent-PartiallyTangible accidentally leaves something somewhere, e.g. Bob's accidentally leaving his hat at a restaurant.") :- x_cid(a65b127398d774).
xc_microtheory(a65b127398d774,x_FolkPsychologyMt).
xc_source_file(a65b127398d774,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d774,28).
xc_kb_names(a65b127398d774,[]).
xc_mapping_rows(a65b127398d774,[]).
x_comment(x_ForgettingHowToDoSomething,"A #$FirstOrderCollection and specialization of #$Forgetting-Generic.  Each instance of #$ForgettingHowToDoSomething is an #$Event in which an #$Agent-PartiallyTangible forgets how to do something, e.g. Alice's forgetting how to log on to her email account.") :- x_cid(a65b127398d775).
xc_microtheory(a65b127398d775,x_FolkPsychologyMt).
xc_source_file(a65b127398d775,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d775,29).
xc_kb_names(a65b127398d775,[]).
xc_mapping_rows(a65b127398d775,[]).
x_comment(x_ForgettingToDoSomething,"A #$FirstOrderCollection and specialization of #$Forgetting-Generic.  Each instance of #$ForgettingToDoSomething is an #$Event in which an #$Agent-PartiallyTangible forgets to do something, e.g. Bob's forgetting to turn off the stove after cooking dinner.") :- x_cid(a65b127398d776).
xc_microtheory(a65b127398d776,x_FolkPsychologyMt).
xc_source_file(a65b127398d776,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d776,30).
xc_kb_names(a65b127398d776,[]).
xc_mapping_rows(a65b127398d776,[]).
x_comment(x_ForgettingThat,"A #$FirstOrderCollection and specialization of #$Forgetting-Generic.  Each instance of #$ForgettingThat is an #$Event in which an #$Agent-PartiallyTangible forgets that a certain proposition is true, e.g. Alice's forgetting that Lima is the capital of Peru.") :- x_cid(a65b127398d777).
xc_microtheory(a65b127398d777,x_FolkPsychologyMt).
xc_source_file(a65b127398d777,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d777,31).
xc_kb_names(a65b127398d777,[]).
xc_mapping_rows(a65b127398d777,[]).
x_comment('x_Forgetting-Generic',"A #$FirstOrderCollection.  Each instance of #$Forgetting-Generic is an #$Event in which an #$Agent-PartiallyTangible forgets something, in some sense.  Specializations include #$ForgettingThat, #$ForgettingToDoSomething, #$ForgettingHowToDoSomething, and #$AccidentallyLeavingSomethingSomewhere.") :- x_cid(a65b127398d778).
xc_microtheory(a65b127398d778,x_FolkPsychologyMt).
xc_source_file(a65b127398d778,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d778,32).
xc_kb_names(a65b127398d778,[]).
xc_mapping_rows(a65b127398d778,[]).
x_comment(x_Lust,"A feeling of sexual #$Desire.  This is a collection; for an explanation of a typical #$EmotionalQuantityType, see #$Happiness.") :- x_cid(a65b127398d779).
xc_microtheory(a65b127398d779,x_FolkPsychologyMt).
xc_source_file(a65b127398d779,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d779,33).
xc_kb_names(a65b127398d779,[]).
xc_mapping_rows(a65b127398d779,[]).
x_comment(x_Desire,"A feeling of desire for something (wealth, sexual gratification, spiritual enlightenment, a piece of chocolate cake, etc.).  This is a collection; for an explanation of a typical #$EmotionalQuantityType, see #$Happiness.") :- x_cid(a65b127398d77a).
xc_microtheory(a65b127398d77a,x_FolkPsychologyMt).
xc_source_file(a65b127398d77a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d77a,34).
xc_kb_names(a65b127398d77a,[]).
xc_mapping_rows(a65b127398d77a,[]).
x_comment(x_agentExperiencesFeelingType,"A #$BinaryPredicate that relates a #$PerceptualAgent to a #$EmotionalQuantityType.  (#$agentExperiencesFeelingType AGENT FEELING-TYPE) means that AGENT is (currently) experiencing a positive amount of FEELING-TYPE).  For example, (#$agentExperiencesFeelingType #$GeorgeWBush #$Boredom) means that, at the present moment, George W. Bush is (at least somewhat) bored.") :- x_cid(a65b127398d77b).
xc_microtheory(a65b127398d77b,x_FolkPsychologyMt).
xc_source_file(a65b127398d77b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d77b,35).
xc_kb_names(a65b127398d77b,[]).
xc_mapping_rows(a65b127398d77b,[]).
x_comment(x_ExperiencingSomething,"A #$TemporalStuffType and specialization of #$AtLeastPartiallyMentalEvent.  Each instance of #$ExperiencingSomething is an event in which an #$Agent-PartiallyTangible (which may be an #$IndividualAgent or a #$MultiIndividualAgent) experiences or undergoes some mental or physical phenomenon.  Some examples:\n<p>\nA person experiencing a pain in his or her left foot.<br>\nA baseball team experiencing the thrill of victory (or the agony of defeat).<br>\nA dog experiencing hunger.<br>\nA village (qua organization) experiencing an earthquake.<br>\nA corporation experiencing a drop in sales.\n<p>\nAn important feature of #$ExperiencingSomething is that instances of this collection are not performed deliberately (though they may be caused by other deliberate/purposeful actions); rather, they are <i>undergone</i>.  Accordingly, #$ExperiencingSomething is disjoint with (#$disjointWith) #$PurposefulAction.  Thus, e.g., no instance of #$WatchingTelevision is an instance of #$ExperiencingSomething, though of course any instance of the former will have numerous instances of the latter (e.g. experiencing certain visual images and sounds) as proper subevents.") :- x_cid(a65b127398d77c).
xc_microtheory(a65b127398d77c,x_FolkPsychologyMt).
xc_source_file(a65b127398d77c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d77c,36).
xc_kb_names(a65b127398d77c,[]).
xc_mapping_rows(a65b127398d77c,[]).
x_comment(x_desires,"(#$desires AGT PROP) means that the #$Agent-PartiallyTangible AGT desires that the world be as the proposition PROP (represented by a #$CycLSentence-Assertible) describes it to be.  #$desires is implied by #$goals, but is weaker:  PROP might be some desirable state of affairs that the agent is not actively working, or planning, to make/keep true; e.g., world peace.\n<p>\nThe main difference between #$desires and its specialization #$hopes, is that one can desire something that one knows to be true.  For example, a thin person can desire to be (i.e. remain) thin.  In contrast, one can hope only for what one is uncertain about.  Thus #$hopes is a specialization of #$hasEpistemicEmotion while #$desires is not.\n<p>\nSee also #$goals and #$intends.") :- x_cid(a65b127398d77d).
xc_microtheory(a65b127398d77d,x_FolkPsychologyMt).
xc_source_file(a65b127398d77d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d77d,45).
xc_kb_names(a65b127398d77d,[]).
xc_mapping_rows(a65b127398d77d,[]).
x_comment(x_PrideOfAccomplishment,"A #$EmotionalQuantityType.  To experience a feeling of #$PrideOfAccomplishment is to experience a feeling of #$Pride as the result of something one has accomplished.") :- x_cid(a65b127398d77e).
xc_microtheory(a65b127398d77e,x_FolkPsychologyMt).
xc_source_file(a65b127398d77e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/FolkPsychologyMt.krf').
xc_source_line(a65b127398d77e,50).
xc_kb_names(a65b127398d77e,[]).
xc_mapping_rows(a65b127398d77e,[]).
kb_cache_footer(footer{count:32,digest:'11f848d60234aaaf9a4e13621ca11432c3f813fc6809cd40813a991b0b5de357',headerDigest:a6c52f6570fb4c5776abe45f2b95b440d58b248b3459ec43777076b11025b7b3}).
