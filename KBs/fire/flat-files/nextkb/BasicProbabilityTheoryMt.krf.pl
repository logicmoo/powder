:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:42,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:186,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'87d312ce12febcbf68182c766167256c993446ab6a2373d0c46b9cd56fa6ad74',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:21131,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf',sourceHash:f38ba9e87d0913435dd267a6979ef5933f098e5cb40653e2fa9b10e33ee47050,warnings:[]}).
x_isa(x_BayesTheorem,'x_Theorem-Proposition') :- x_cid(a65b126f1ce740).
xc_microtheory(a65b126f1ce740,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce740,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce740,3).
xc_kb_names(a65b126f1ce740,[]).
xc_mapping_rows(a65b126f1ce740,[]).
x_isa(x_probabilisticallyCertain,'x_ModalScheme-K-DualContrap') :- x_cid(a65b126f1ce741).
xc_microtheory(a65b126f1ce741,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce741,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce741,4).
xc_kb_names(a65b126f1ce741,[]).
xc_mapping_rows(a65b126f1ce741,[]).
x_isa(x_probabilisticallyCertain,'x_ModalScheme-K') :- x_cid(a65b126f1ce742).
xc_microtheory(a65b126f1ce742,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce742,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce742,5).
xc_kb_names(a65b126f1ce742,[]).
xc_mapping_rows(a65b126f1ce742,[]).
x_comment('x_CycLProbabilityConstant-Deprecated',"The collection of #$CycLProbabilityConstants that are intended to be phased out, and eventually killed.  Please avoid using these constants in new assertions.") :- x_cid(a65b126f1ce743).
xc_microtheory(a65b126f1ce743,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce743,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce743,6).
xc_kb_names(a65b126f1ce743,[]).
xc_mapping_rows(a65b126f1ce743,[]).
x_comment(x_moreLikelyThan,"An asymmetric #$TransitiveBinaryPredicate and specialization of #$atLeastAsLikelyAs that relates two quoted instances of #$CycLPropositionalSentence.  <code>(#$moreLikelyThan PROP1 PROP2)</code> means that <code>PROP1</code> is more likely (to be true) than <code>PROP2</code>.  For example,\n<pre>\n(#$moreLikelyThan\n  (#$likesAsFriend #$GeorgeWBush #$TonyBlair)\n  (#$likesAsFriend #$JacquesChirac #$TonyBlair))\n</pre>\nmeans that it is more likely that Bush likes Blair than it is that Chirac likes Blair.") :- x_cid(a65b126f1ce744).
xc_microtheory(a65b126f1ce744,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce744,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce744,7).
xc_kb_names(a65b126f1ce744,[]).
xc_mapping_rows(a65b126f1ce744,[]).
x_comment(x_atLeastAsLikelyAs,"A reflexive #$TransitiveBinaryPredicate that relates two quoted instances of #$CycLPropositionalSentence.  <code>(#$atLeastAsLikelyAs PROP1 PROP2)</code> means that <code>PROP1</code> is at least as likely (to be true) as <code>PROP2</code>.  For example,\n<pre>\n(#$atLeastAsLikelyAs\n  (#$likesAsFriend #$GeorgeWBush #$TonyBlair)\n  (#$likesAsFriend #$JacquesChirac #$TonyBlair))\n</pre>\nmeans that it is at least as likely that Bush likes Blair as it is that Chirac likes Blair.\n<p>\nA notable specialization of this predicate is #$moreLikelyThan (q.v.).") :- x_cid(a65b126f1ce745).
xc_microtheory(a65b126f1ce745,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce745,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce745,14).
xc_kb_names(a65b126f1ce745,[]).
xc_mapping_rows(a65b126f1ce745,[]).
x_comment(x_ProbabilityFn,"An unreifiable #$UnaryFunction that takes a quoted instance of #$CycLPropositionalSentence and returns a #$Real0-1.  <code>(#$ProbabilityFn PROP)</code> denotes the probability of <code>PROP</code> (in the current context).  See also this function's corresponding predicate, #$probability.") :- x_cid(a65b126f1ce746).
xc_microtheory(a65b126f1ce746,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce746,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce746,23).
xc_kb_names(a65b126f1ce746,[]).
xc_mapping_rows(a65b126f1ce746,[]).
x_comment(x_probabilityForAgent,"A #$TernaryPredicate that relates an #$Agent-Generic to a quoted instance of #$CycLPropositionalSentence to a #$Real0-1.  <code>(#$probabilityForAgent AGT PROP N)</code> means that the (subjective) probability of <code>PROP</code> for <code>AGT</code> is <code>N</code>.") :- x_cid(a65b126f1ce747).
xc_microtheory(a65b126f1ce747,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce747,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce747,24).
xc_kb_names(a65b126f1ce747,[]).
xc_mapping_rows(a65b126f1ce747,[]).
x_comment(x_conditionalProbabilityForAgent,"A #$QuaternaryPredicate that relates an #$Agent-Generic to a quoted instance of #$CycLPropositionalSentence to a quoted instance of #$CycLPropositionalSentence to an #$Real0-1.  <code>(#$conditionalProbabilityForAgent AGT EVIDENCE HYPOTHESIS N)</code> means that the (subjective) probability of <code>HYPOTHESIS</code> for <code>AGT</code>, given <i>only</i> the knowledge that <code>EVIDENCE</code> holds, is <code>N</code>.") :- x_cid(a65b126f1ce748).
xc_microtheory(a65b126f1ce748,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce748,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce748,25).
xc_kb_names(a65b126f1ce748,[]).
xc_mapping_rows(a65b126f1ce748,[]).
x_comment(x_ProbabilityOfSetFn,"An unreifiable #$ProbabilityDistributionFunction that takes a #$Set-Mathematical and returns a #$Real0-1.  (#$ProbabilityOfSetFn <b>SET</b>) denotes the probability of <b>SET</b> with respect to the #$sampleSpace of the current context.  (It is undefined in any context with no #$sampleSpace and when <b>SET</b> is not a subset of the #$sampleSpace of the current context.)\n<p>\nNote that the probability of a set is the sum of the probabilities of all its single-membered subsets.  That is,\n<pre>\n(#$probabilityOfSet ?SET\n  (#$PlusAll\n    (#$TheSetOf ?SINGLETON\n      (#$and\n        (#$cardinality ?SINGLETON 1)\n        (#$subsetOf ?SINGLETON ?SET))) #$ProbabilityOfSetFn)).</pre>") :- x_cid(a65b126f1ce749).
xc_microtheory(a65b126f1ce749,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce749,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce749,26).
xc_kb_names(a65b126f1ce749,[]).
xc_mapping_rows(a65b126f1ce749,[]).
x_comment(x_MarkovLogicNetwork,"A Markov logic network (or MLN) is a set of first-order formulas with real numbers (weights) associated with each formula.  An MLN can be thought of as a template for creating #$MarkovNetworks.") :- x_cid(a65b126f1ce74a).
xc_microtheory(a65b126f1ce74a,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce74a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce74a,36).
xc_kb_names(a65b126f1ce74a,[]).
xc_mapping_rows(a65b126f1ce74a,[]).
x_comment(x_MarkovNetwork,"A Markov network consists of an undirected graph and a set of potential functions--one for each clique in the graph.  The nodes in the graph represent random variables and the edges represent dependencies between those variables.  A potential function maps states of the corresponding clique to non-negative real numbers.  Compare #$BayesianNetwork.") :- x_cid(a65b126f1ce74b).
xc_microtheory(a65b126f1ce74b,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce74b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce74b,37).
xc_kb_names(a65b126f1ce74b,[]).
xc_mapping_rows(a65b126f1ce74b,[]).
x_comment(x_ContentOfMarkovLogicNetworkFn,"A unary #$ReifiableFunction that takes a #$MarkovLogicNetwork MLN and returns the #$Microtheory representing the content of      MLN.") :- x_cid(a65b126f1ce74c).
xc_microtheory(a65b126f1ce74c,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce74c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce74c,38).
xc_kb_names(a65b126f1ce74c,[]).
xc_mapping_rows(a65b126f1ce74c,[]).
x_comment(x_markovLogicNetworkRepresentedByMicrotheory,"A #$StrictlyFunctionalSlot that relates a #$MarkovLogicNetwork to the #$Microtheory representing its content.  This is the predicate corresponding to #$ContentOfMarkovLogicNetworkFn.") :- x_cid(a65b126f1ce74d).
xc_microtheory(a65b126f1ce74d,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce74d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce74d,39).
xc_kb_names(a65b126f1ce74d,[]).
xc_mapping_rows(a65b126f1ce74d,[]).
x_comment(x_markovLogicNetworkDataFilePathname,"A #$BinaryPredicate that relates a #$MarkovLogicNetwork to a #$Pathname.  (#$markovLogicNetworkDataFilePathname MLN PATHNAME) means that MLN was generated using the data (.db) file found at PATHNAME.") :- x_cid(a65b126f1ce74e).
xc_microtheory(a65b126f1ce74e,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce74e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce74e,40).
xc_kb_names(a65b126f1ce74e,[]).
xc_mapping_rows(a65b126f1ce74e,[]).
x_comment(x_markovLogicNetworkRuleFilePathname,"A #$BinaryPredicate that relates a #$MarkovLogicNetwork to a #$Pathname.  (#$markovLogicNetworkRuleFilePathname MLN PATHNAME) means that MLN was generated using the rule (.mln) file found at PATHNAME.") :- x_cid(a65b126f1ce74f).
xc_microtheory(a65b126f1ce74f,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce74f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce74f,41).
xc_kb_names(a65b126f1ce74f,[]).
xc_mapping_rows(a65b126f1ce74f,[]).
x_comment(x_markovLogicNetworkTypeConstantDeclarationFilePathname,"A #$BinaryPredicate that relates a #$MarkovLogicNetwork to a #$Pathname.  (#$markovLogicNetworkTypeConstantDeclarationFilePathname MLN PATHNAME) means that MLN was generated using the type/constant declaration (.mln) file found at PATHNAME.") :- x_cid(a65b126f1ce750).
xc_microtheory(a65b126f1ce750,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce750,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce750,42).
xc_kb_names(a65b126f1ce750,[]).
xc_mapping_rows(a65b126f1ce750,[]).
x_comment(x_DiscriminativeWeightLearning,"A specialization of #$MachineLearning.  Each instance of #$DiscriminativeWeightLearning is an event in which a computer program learns weights for formulas using a discriminative (as opposed to generative) algorithm.  (\"Discriminative,\" as it is being used here, is a technical term which we will not attempt to define in this comment.)  See also #$GenerativeWeightLearning.") :- x_cid(a65b126f1ce751).
xc_microtheory(a65b126f1ce751,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce751,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce751,43).
xc_kb_names(a65b126f1ce751,[]).
xc_mapping_rows(a65b126f1ce751,[]).
x_comment(x_GenerativeWeightLearning,"A specialization of #$MachineLearning.  Each instance of #$GenerativeWeightLearning is an event in which a computer program learns weights for formulas using a generative (as opposed to discriminative) algorithm.  (\"Generative,\" as it is being used here, is a technical term which we will not attempt to define in this comment.)  See also #$DiscriminativeWeightLearning.") :- x_cid(a65b126f1ce752).
xc_microtheory(a65b126f1ce752,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce752,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce752,44).
xc_kb_names(a65b126f1ce752,[]).
xc_mapping_rows(a65b126f1ce752,[]).
x_comment(x_markovLogicNetworkGeneratedUsingLearningType,"A #$BinaryPredicate that relates a #$MarkovLogicNetwork to a type of #$MachineLearning (e.g. #$GenerativeWeightLearning, #$DiscriminativeWeightLearning) that was used in its generation.") :- x_cid(a65b126f1ce753).
xc_microtheory(a65b126f1ce753,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce753,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce753,45).
xc_kb_names(a65b126f1ce753,[]).
xc_mapping_rows(a65b126f1ce753,[]).
x_comment(x_markovLogicNetworkFilePathname,"A #$BinaryPredicate that relates a #$MarkovLogicNetwork to a #$Pathname.  (#$markovLogicNetworkFilePathname MLN PATHNAME) means that the content of MLN is in the (.mln) file found at PATHNAME.  The file at PATHNAME contains first-order formulas with weights assigned to each formulas.  (It may also contain predicate declarations.)") :- x_cid(a65b126f1ce754).
xc_microtheory(a65b126f1ce754,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce754,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce754,46).
xc_kb_names(a65b126f1ce754,[]).
xc_mapping_rows(a65b126f1ce754,[]).
x_comment(x_markovLogicNetworkGeneratedUsingCommandString,"A #$BinaryPredicate that relates a #$MarkovLogicNetwork to the #$CharacterString that was entered in order to generate it.  This information may be useful for tracing back the exact parameters that were used in the generation.") :- x_cid(a65b126f1ce755).
xc_microtheory(a65b126f1ce755,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce755,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce755,47).
xc_kb_names(a65b126f1ce755,[]).
xc_mapping_rows(a65b126f1ce755,[]).
x_comment(x_BayesTheorem,"A #$Theorem-Proposition attributed to #$ReverendThomasBayes that states an important relation between conditional and marginal probability distributions of random variables.  It is formalized in CycL as:\n<pre>\n(#$implies\n  (#$and\n    (#$probability ?EVIDENCE ?E)\n    (#$probability ?HYPOTHESIS ?H)\n    (#$conditionalProbability ?HYPOTHESIS ?EVIDENCE ?E-GIVEN-H)\n    (#$conditionalProbability ?EVIDENCE ?HYPOTHESIS ?H-GIVEN-E))\n  (#$mathEquals ?H-GIVEN-E\n    (#$QuotientFn\n      (#$TimesFn ?E-GIVEN-H ?H) ?E))).</pre>") :- x_cid(a65b126f1ce756).
xc_microtheory(a65b126f1ce756,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce756,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce756,48).
xc_kb_names(a65b126f1ce756,[]).
xc_mapping_rows(a65b126f1ce756,[]).
x_comment(x_moreLikelyThanGivenThat,"A #$TernaryPredicate that relates three quoted instances of #$CycLPropositionalSentence.  <code>(#$moreLikelyThanGivenThat MORE LESS CONDITION)</code> means that <code>MORE</code> is more likely to be true than <code>LESS</code>, given <i>only</i> the information that <code>CONDITION</code> holds.  See also the unconditional version of this predicate, #$moreLikelyThan.") :- x_cid(a65b126f1ce757).
xc_microtheory(a65b126f1ce757,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce757,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce757,59).
xc_kb_names(a65b126f1ce757,[]).
xc_mapping_rows(a65b126f1ce757,[]).
x_comment(x_ConditionalProbabilityFn,"An unreifiable, binary #$TermMacroFunction that takes two quoted instances of #$CycLPropositionalSentence and returns a #$Real0-1.  Intuitively, <code>(#$ConditionalProbabilityFn HYPOTHESIS EVIDENCE)</code> denotes the probability (in the current context) that <code>HYPOTHESIS</code> holds, given <i>only</i> the information that <code>EVIDENCE</code> holds.  Formally, it is shorthand for:\n<pre>\n(#$QuotientFn\n  (#$ProbabilityFn\n    (#$and HYPOTHESIS EVIDENCE))\n  (#$ProbabilityFn EVIDENCE)).\n</pre>\nNote that this is undefined when <code>(#$ProbabilityFn EVIDENCE)</code> = 0.  \n<p>\nConsider, e.g., the following #$CycLNonAtomicTerm:\n<pre>\n(#$ConditionalProbabilityFn\n  (#$fanOf #$GeorgeWBush #$WillieNelson)\n  (#$originallyFromRegion #$GeorgeWBush #$Texas-State)).\n</pre>\nIntuitively, this denotes the probability that Bush is a Willie Nelson fan, given <i>only</i> the information that he (Bush) is originally from Texas.  Formally, it is shorthand for:\n<pre>\n(#$QuotientFn\n  (#$ProbabilityFn\n    (#$and\n      (#$fanOf #$GeorgeWBush #$WillieNelson)\n      (#$originallyFromRegion #$GeorgeWBush #$Texas-State)))\n  (#$ProbabilityFn\n    (#$originallyFromRegion #$GeorgeWBush #$Texas-State))).\n</pre>\n\nSee also this function's corresponding predicate, #$conditionalProbability.") :- x_cid(a65b126f1ce758).
xc_microtheory(a65b126f1ce758,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce758,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce758,60).
xc_kb_names(a65b126f1ce758,[]).
xc_mapping_rows(a65b126f1ce758,[]).
x_comment(x_probabilisticallyCertain,"A #$CommonUnaryModalOperator that applies to a quoted instance of #$CycLSentence-Assertible.  <code>(#$probabilisticallyCertain PROP)</code> means that <code>PROP</code> holds in every element of the sample space (see #$sampleSpace) that is relevant in the current context. Loosely speaking, <code>(#$probabilisticallyCertain PROP)</code> means that <code>PROP</code> is assumed to be true no matter how things turn out, i.e. no matter which of the specific scenarios considered relevant (in the current context) is ultimately realized.") :- x_cid(a65b126f1ce759).
xc_microtheory(a65b126f1ce759,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce759,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce759,87).
xc_kb_names(a65b126f1ce759,[]).
xc_mapping_rows(a65b126f1ce759,[]).
x_comment(x_sampleSpace,"A #$UnaryPredicate that applies to a #$Set-Mathematical.  <code>(#$sampleSpace SET)</code> means that, for the purposes of probabilistic reasoning, <code>SET</code> is the relevant sample space in the current context.  Intuitively, <code>SET</code> is the set of possible worlds (or completely specified outcomes -- see #$PossibleWorld-Specification) that are considered possible with respect to the current context.\n<p>\nSuppose, for example, that we want to reason about a single roll of a die.  We would want to consider just six possible worlds, corresponding to the six possible outcomes.  Thus our sample space might be <code>(#$TheSet 1 2 3 4 5 6)</code>, with 1 representing the world in which 1 is rolled, etc.\n<p>\nSee also #$mtSampleSpace.") :- x_cid(a65b126f1ce75a).
xc_microtheory(a65b126f1ce75a,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce75a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce75a,88).
xc_kb_names(a65b126f1ce75a,[]).
xc_mapping_rows(a65b126f1ce75a,[]).
x_comment(x_mtSampleSpace,"A #$StrictlyFunctionalSlot that relates a #$Microtheory to a #$Set-Mathematical.  <code>(#$mtSampleSpace MT SET)</code> means that the relevant sample space (see #$sampleSpace) for <code>MT</code> is <code>SET</code>.  This predicate is intended to facilitate probabilistic reasoning with #$probabilityOfSet and related vocabulary.") :- x_cid(a65b126f1ce75b).
xc_microtheory(a65b126f1ce75b,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce75b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce75b,93).
xc_kb_names(a65b126f1ce75b,[]).
xc_mapping_rows(a65b126f1ce75b,[]).
x_comment(x_probabilityOfSetGivenSet,"A #$TernaryPredicate that relates a #$Set-Mathematical to a #$Set-Mathematical to a #$Real0-1.  <code>(#$probabilityOfSetGivenSet SET1 SET2 N)</code> means that the probability of <code>SET1</code> given only the information that <code>SET2</code> is <code>N</code>.  <code>SET1</code> and <code>SET2</code> are subsets of the relevant sample space (see #$sampleSpace).  \n<p>\nSuppose, for example, that the sample space is <code>(#$TheSet 1 2 3 4 5 6)</code>, representing the possible outcomes of rolling a die.  Then <code>(#$TheSet 1)</code> would correspond to the event or proposition that a 1 is rolled, <code>(#$TheSet 2 4 6)</code> would correspond to the event or proposition that an even number is rolled, etc.  Thus, e.g., in this context\n<pre>\n(#$probabilityOfSetGivenSet (#$TheSet 2) (#$TheSet 2 4 6) (#$QuotientFn 1 3))\n</pre>\nsays that the probability of a 2 being rolled given only the information that an even number is rolled is 1/3.\n<p>\nNote that the conditional probability of H given E, usually written P(H|E), is by definition, the (unconditional) probability of the intersection of H and E divided by the (unconditional) probability of E.  Note also that this is undefined when the (unconditional) probability of E is 0.\n<p>\nSee also #$conditionalProbability, which relates CycL sentences instead of sets.") :- x_cid(a65b126f1ce75c).
xc_microtheory(a65b126f1ce75c,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce75c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce75c,94).
xc_kb_names(a65b126f1ce75c,[]).
xc_mapping_rows(a65b126f1ce75c,[]).
x_comment(x_eventSet,"A #$UnaryPredicate that applies to a #$Set-Mathematical.  <code>(#$sampleSpace SET)</code> means that, for the purposes of probabilistic reasoning, <code>SET</code> is the set of subsets of the sample space (see #$sampleSpace) that are being reasoned with.  Intuitively, the elements of the event set are the \"events\" or \"propositions\" that are assigned probabilities.\n<p>\nSuppose, for example, that we want to reason about a single roll of a die.  We would want to consider just six possible worlds, corresponding to the six possible outcomes.  Thus our sample space might be <code>(#$TheSet 1 2 3 4 5 6)</code>, with 1 representing the world in which 1 is rolled, etc.  Our event set, then, might simply be the powerset of <code>(#$TheSet 1 2 3 4 5 6)</code>.  Thus we would assert:\n<pre>\n(#$eventSet (#$PowerSetFn (#$TheSet 1 2 3 4 5 6))).\n</pre>\nThe event set, F, is required to be an algebra over the sample space, W; that is, F must be a set of subsets of W that contains W itself and is closed under union and complementation.") :- x_cid(a65b126f1ce75d).
xc_microtheory(a65b126f1ce75d,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce75d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce75d,105).
xc_kb_names(a65b126f1ce75d,[]).
xc_mapping_rows(a65b126f1ce75d,[]).
x_comment(x_conditionallyIndependentSentences,"A #$TernaryPredicate that relates three #$CycLSentences.  <code>(#$conditionallyIndependentSentences SENT1 SENT2 CONDITION)</code> means that given the information that <code>CONDITION</code> holds, <code>SENT1</code> is independent of <code>SENT2</code> (in the sense of #$independentSentences, q.v.).") :- x_cid(a65b126f1ce75e).
xc_microtheory(a65b126f1ce75e,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce75e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce75e,112).
xc_kb_names(a65b126f1ce75e,[]).
xc_mapping_rows(a65b126f1ce75e,[]).
x_comment(x_NumericLikelihoodFn,"A unary #$ScalarDenotingFunction that maps a given numeric interval between 0 and 1 inclusive (see #$ProbabilityInterval) to the corresponding instance of #$Likelihood-QuantityType (q.v.).  For example, (#$NumericLikelihoodFn 0) is the likelihood of a statement that is <i>certainly false</i>, (#$NumericLikelihoodFn 1) the likelihood of a statement that is <i>certainly true</i>, and (#$NumericLikelihoodFn 0.5) the likelihood of a statement that is as likely to be true as it is to be false.") :- x_cid(a65b126f1ce75f).
xc_microtheory(a65b126f1ce75f,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce75f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce75f,113).
xc_kb_names(a65b126f1ce75f,[]).
xc_mapping_rows(a65b126f1ce75f,[]).
x_comment(x_conditionalProbability,"A #$TernaryPredicate and #$MacroRelation that relates two quoted instances of #$CycLPropositionalSentence to a #$Real0-1. Intuitively, <code>(#$conditionalProbability HYPOTHESIS EVIDENCE N)</code> means that the probability (in the current context) that <code>HYPOTHESIS</code> holds given <i>only</i> the information that <code>EVIDENCE</code> holds is <code>N</code>.  Formally, it is shorthand for:\n<pre>\n(#$equals N\n  (#$QuotientFn\n    (#$ProbabilityFn (#$and HYPOTHESIS EVIDENCE))\n    (#$ProbabilityFn EVIDENCE)))\n</pre>\nFor example,\n<pre>\n(#$conditionalProbability\n  (#$fanOf #$GeorgeWBush #$WillieNelson)\n  (#$originallyFromRegion #$GeorgeWBush #$Texas-State)\n  0.7215)\n</pre>\nmeans that the probability that George W. Bush is a fan of Willie Nelson, given only the information that he (Bush) is originally from Texas, is 0.7215, or 72.15%.  Formally, it is shorthand for:\n<pre>\n(#$equals 0.7215\n  (#$QuotientFn\n    (#$ProbabilityFn\n      (#$and \n        (#$fanOf #$GeorgeWBush #$WillieNelson)\n        (#$originallyFromRegion #$GeorgeWBush #$Texas-State)))\n    (#$ProbabilityFn\n      (#$originallyFromRegion #$GeorgeWBush #$Texas-State))))\n</pre>\nThis is the predicate corresponding to #$ConditionalProbabilityFn.  See also #$conditionalLikelihood.") :- x_cid(a65b126f1ce760).
xc_microtheory(a65b126f1ce760,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce760,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce760,114).
xc_kb_names(a65b126f1ce760,[]).
xc_mapping_rows(a65b126f1ce760,[]).
x_comment('x_Likelihood-QuantityType',"A specialization of #$ScalarQuantity. Each instance of #$Likelihood-QuantityType is a degree (or range) of likelihood(s) that can be attributed to a statement with respect to the likelihood of its being or becoming true.  Although not #$MeasurableQuantity(ies) (q.v.) in the strict sense of that term, probabilities are often characterized and compared numerically, along a scale from 0 to 1.  (#$NumericLikelihoodFn 0) is <i>certain falsity</i> and (#$NumericLikelihoodFn 1) is <i>certain truth</i>.\n<p>\nSee also #$ProbabilityInterval, the collection of all real number intervals between 0 and 1 inclusive, and thus of all possible arguments for #$NumericLikelihoodFn.") :- x_cid(a65b126f1ce761).
xc_microtheory(a65b126f1ce761,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce761,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce761,140).
xc_kb_names(a65b126f1ce761,[]).
xc_mapping_rows(a65b126f1ce761,[]).
x_comment(x_conditionalLikelihood,"A #$TernaryPredicate that relates two quoted instances of #$CycLPropositionalSentence to an instance of #$Likelihood-QuantityType. <code>(#$conditionalLikelihood HYPOTHESIS EVIDENCE LIKELIHOOD)</code> means that the likelihood (in the current context) that <code>HYPOTHESIS</code> holds given <i>only</i> the information that <code>EVIDENCE</code> holds is <code>LIKELIHOOD</code>.\n<p>\nFor example,\n<pre>\n(#$conditionalLikelihood\n  (#$fanOf #$GeorgeWBush #$WillieNelson)\n  (#$originallyFromRegion #$GeorgeWBush #$Texas-State)\n  (#$MediumToVeryHighAmountFn #$Likelihood-QuantityType))\n</pre>\nmeans that the likelihood that George W. Bush is a fan of Willie Nelson, given only the information that he (Bush) is originally from Texas, is medium to very high,\n<p>\nThis predicate is good for expressing vague or \"generic\" probabilities (though precise probabilities <i>can</i> be expressed with it, using #$NumericLikelihoodFn).  To express precise (numeric) probabilities, it is better to use #$conditionalProbability.") :- x_cid(a65b126f1ce762).
xc_microtheory(a65b126f1ce762,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce762,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce762,143).
xc_kb_names(a65b126f1ce762,[]).
xc_mapping_rows(a65b126f1ce762,[]).
x_comment(x_probability,"A strictly functional #$NumericIntervalSlot and specialization of #$probability-Generic that relates a quoted instance of #$CycLPropositionalSentence to a #$Real0-1. <code>(#$probability PROP N)</code> means that the probability of <code>PROP</code> (with respect to the current context) is <code>N</code>.  The closer <code>N</code> is to 1 (0), the more probable it is that <code>PROP</code> is true (false).  If <code>N = 1</code>, <code>PROP</code> is certainly true; if <code>N = 0</code>, <code>PROP</code> is certainly false.\n<p>\n#$probability is the predicate corresponding to #$ProbabilityFn.  See also #$likelihood and #$conditionalProbability.") :- x_cid(a65b126f1ce763).
xc_microtheory(a65b126f1ce763,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce763,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce763,155).
xc_kb_names(a65b126f1ce763,[]).
xc_mapping_rows(a65b126f1ce763,[]).
x_comment(x_independentSentences,"A #$SymmetricBinaryPredicate and #$MacroRelation that relates two #$CycLPropositionalSentences. Intuitively, <code>(#$independentSentences A B)</code> means that (1) neither <code>A</code> nor <code>B</code> is completely improbable; and (2) <code>A</code>'s being true makes it no more or less likely that <code>B</code> is true (and vice versa).  Formally, it is shorthand for:\n<pre>\n(#$equals\n  (#$ProbabilityFn A)\n  (#$ConditionalProbabilityFn A B))\n</pre>\nConsider, e.g., the following #$CycLSentence:\n<pre>\n(#$independentSentences\n  (#$likesAsFriend #$GeorgeWBush #$JohnKerry)\n  (#$physicalBuild #$JohnKerry #$TallPhysicalBuild)).\n</pre>\nIntuitively, this means that (1) Bush's liking Kerry and Kerry's being tall each have non-zero probability; and (2) Bush's liking Kerry makes it no more or less likely that Kerry is tall (and vice versa).  Formally, it is shorthand for:\n<pre>\n(#$equals\n  (#$ProbabilityFn (#$likesAsFriend #$GeorgeWBush #$JohnKerry))\n  (#$ConditionalProbabilityFn\n    (#$likesAsFriend #$GeorgeWBush #$JohnKerry)\n    (#$physicalBuild #$JohnKerry #$TallPhysicalBuild))).\n</pre>\n") :- x_cid(a65b126f1ce764).
xc_microtheory(a65b126f1ce764,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce764,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce764,158).
xc_kb_names(a65b126f1ce764,[]).
xc_mapping_rows(a65b126f1ce764,[]).
x_comment('x_probability-Generic',"A #$ScalarIntervalSlot that relates a quoted instance of #$CycLPropositionalSentence to a #$ScalarInterval (either a #$Real0-1 or a #$Likelihood-QuantityType) that represents its probability (in the current context).  Two important specializations are #$probability and #$probability-Quantitative (currently called #$likelihood).") :- x_cid(a65b126f1ce765).
xc_microtheory(a65b126f1ce765,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce765,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce765,179).
xc_kb_names(a65b126f1ce765,[]).
xc_mapping_rows(a65b126f1ce765,[]).
x_comment(x_probabilityOfInsBeingIns,"A #$TernaryPredicate that relates a #$SetOrCollection to a #$SetOrCollection to a #$Real0-1.  (#$probabilityOfInsBeingIns SOC1 SOC2 N) means that the probability that something is an instance of SOC2, given <i>only</i> the information that it is an instance of SOC1, is N.  See also #$likelihoodOfInsBeingIns.") :- x_cid(a65b126f1ce766).
xc_microtheory(a65b126f1ce766,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce766,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce766,180).
xc_kb_names(a65b126f1ce766,[]).
xc_mapping_rows(a65b126f1ce766,[]).
x_comment(x_likelihoodOfInsBeingIns,"A #$TernaryPredicate that relates a #$SetOrCollection to a #$SetOrCollection to a #$Likelihood-QuantityType.  (#$probabilityOfInsBeingIns SOC1 SOC2 QUANT) means that the probability that something is an instance of SOC2, given <i>only</i> the information that it is an instance of SOC1, is QUANT.  See also #$probabilityOfInsBeingIns.") :- x_cid(a65b126f1ce767).
xc_microtheory(a65b126f1ce767,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce767,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce767,181).
xc_kb_names(a65b126f1ce767,[]).
xc_mapping_rows(a65b126f1ce767,[]).
x_comment('x_moreLikelyThanNot-Conditional',"A #$BinaryPredicate and #$MacroRelation that relates two quoted instances of #$CycLPropositionalSentence.  (#$moreLikelyThanNot-Conditional EVIDENCE HYPOTHESIS), means that given only the information that EVIDENCE holds, HYPOTHESIS is more likely to be true than its negation, (#$not HYPOTHESIS).  In other words, (#$moreLikelyThanNot-Conditional EVIDENCE HYPOTHESIS) is shorthand for\n<pre>\n(#$moreLikelyThanGivenThat EVIDENCE HYPOTHESIS (#$not HYPOTHESIS)).\n</pre>") :- x_cid(a65b126f1ce768).
xc_microtheory(a65b126f1ce768,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce768,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce768,182).
xc_kb_names(a65b126f1ce768,[]).
xc_mapping_rows(a65b126f1ce768,[]).
x_comment(x_likelihood,"A #$QuantitySlot and specialization of #$probability-Generic that relates a (\"quoted\") instance of #$CycLSentence-Assertible to a #$Likelihood-QuantityType.  <code>(#$likelihood PROP QUANT)</code> means that the probability of <code>PROP</code> (in the current context) is <code>QUANT</code>.  See also #$probability and #$conditionalLikelihood.") :- x_cid(a65b126f1ce769).
xc_microtheory(a65b126f1ce769,x_BasicProbabilityTheoryMt).
xc_source_file(a65b126f1ce769,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/BasicProbabilityTheoryMt.krf').
xc_source_line(a65b126f1ce769,186).
xc_kb_names(a65b126f1ce769,[]).
xc_mapping_rows(a65b126f1ce769,[]).
kb_cache_footer(footer{count:42,digest:'87d312ce12febcbf68182c766167256c993446ab6a2373d0c46b9cd56fa6ad74',headerDigest:'8fdb09c611ada40f6ae9a05df01b021ab8838c0516a78b33d5ffbff08c8a5bd2'}).
