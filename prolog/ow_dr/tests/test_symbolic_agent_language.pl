:- begin_tests(symbolic_agent_language).
:- use_module('../kb_symbolic_agent_language').
:- use_module('../kb_terms',[]).
:- use_module('../kb_compile',[]).
:- use_module('../kb_cache',[]).
:- use_module(library(filesex)).
:- use_module(library(uuid)).

profile(profile{lexiconMt:x_TestLexiconMt,grammarMt:x_TestGrammarMt,
                startCategory:x_sentence,caseMode:sensitive}).
lexicon([
  kb(a1,x_TestLexiconMt,x_symbolicLexeme(x_name,x_TheList("Ada"),x_Ada)),
  kb(a2,x_TestLexiconMt,x_symbolicLexeme(x_name,x_TheList("Boreal"),x_Boreal)),
  kb(a3,x_TestLexiconMt,x_symbolicLexeme(x_class,x_TheList("dog"),x_Dog)),
  kb(a4,x_TestLexiconMt,x_symbolicLexeme(x_class,x_TheList("cat"),x_Cat)),
  kb(a5,x_TestLexiconMt,x_symbolicLexeme(x_class,x_TheList("animal"),x_Animal)),
  kb(a6,x_TestLexiconMt,x_symbolicLexeme(x_command,x_TheList("classify"),x_Classify)),
  kb(a7,x_TestLexiconMt,x_symbolicLexeme(x_command,x_TheList("mark"),x_Classify))
]).
learned_rule(kb(a8,x_TestGrammarMt,
  x_symbolicProduction(x_sentence,
    x_TheList(x_symbolicNonterminal(x_command,x_Classify),
              x_symbolicNonterminal(x_name,Who),x_symbolicLiteral("as"),
              x_symbolicNonterminal(x_class,Class)),
    x_ClassifyTask(Who,Class)))).
language(Language) :-
    lexicon(Lexicon),learned_rule(Rule),profile(Profile),
    compile_language([Rule|Lexicon],Profile,Language).
one_meaning(Result,Meaning) :-
    assertion(Result.status==interpreted),Result.candidates=[Candidate],
    Meaning=Candidate.term.

test(knowledge_absence_is_not_a_fake_greeting) :-
    lexicon(Records),profile(P),compile_language(Records,P,L),
    interpret(L,"classify Ada as dog",[],Result),
    assertion(Result.status==no_applicable_rule),assertion(Result.candidates==[]),
    assertion(\+get_dict(text,Result,_)).

test(learned_utterance_and_unseen_combinations) :-
    language(L),
    forall(member(Text-Expected,[
      "classify Ada as dog"-x_ClassifyTask(x_Ada,x_Dog),
      "classify Boreal as cat"-x_ClassifyTask(x_Boreal,x_Cat),
      "mark Ada as cat"-x_ClassifyTask(x_Ada,x_Cat),
      "mark Boreal as dog"-x_ClassifyTask(x_Boreal,x_Dog)]),
      (interpret(L,Text,[],R),one_meaning(R,Meaning),assertion(Meaning==Expected),
       R.candidates=[C],assertion(memberchk(a8,C.proof)))).

test(bidirectional_generation_not_a_memorized_response) :-
    language(L),generate(L,x_ClassifyTask(x_Boreal,x_Animal),[],Result),
    assertion(Result.status==generated),
    findall(Text,(member(C,Result.candidates),Text=C.text),Texts),
    assertion(memberchk("classify Boreal as animal",Texts)),
    assertion(memberchk("mark Boreal as animal",Texts)),
    forall(member(Text,Texts),
      (interpret(L,Text,[],R),one_meaning(R,x_ClassifyTask(x_Boreal,x_Animal)))).

test(ambiguity_retains_full_distinct_identity) :-
    language(L0),
    Extra=lex(a9,x_name,["Ada"],x_NameFn(x_Ada,x_Elsewhere)),
    L=L0.put(lexicon,[Extra|L0.lexicon]),
    interpret(L,"classify Ada as dog",[],R),
    assertion(R.status==ambiguous),length(R.candidates,2),
    findall(T,(member(C,R.candidates),T=C.term),Terms),
    assertion(memberchk(x_ClassifyTask(x_Ada,x_Dog),Terms)),
    assertion(memberchk(x_ClassifyTask(x_NameFn(x_Ada,x_Elsewhere),x_Dog),Terms)).

test(microtheory_isolation) :-
    lexicon(Lex),learned_rule(kb(Id,_,Term)),profile(P),
    compile_language([kb(Id,x_OtherAgentsGrammarMt,Term)|Lex],P,L),
    interpret(L,"classify Ada as dog",[],R),
    assertion(R.status==no_applicable_rule).

test(case_folding_does_not_conflate_referents) :-
    profile(P0),P=P0.put(_{caseMode:insensitive,startCategory:x_name}),
    compile_language([
      kb(a1,x_TestLexiconMt,x_symbolicLexeme(x_name,x_TheList("Ada"),x_Ada)),
      kb(a2,x_TestLexiconMt,x_symbolicLexeme(x_name,x_TheList("ADA"),x_ADA))],P,L),
    interpret(L,"ada",[],R),assertion(R.status==ambiguous),length(R.candidates,2).

quantified_language(Language) :-
    lexicon(Lex),profile(P),
    Rule=kb(a9,x_TestGrammarMt,x_symbolicProduction(x_sentence,
      x_TheList(x_symbolicLiteral("every"),x_symbolicNonterminal(x_class,From),
                x_symbolicLiteral("is"),x_symbolicNonterminal(x_class,To)),
      x_forAll(X,x_implies(x_isa(X,From),x_isa(X,To))))),
    compile_language([Rule|Lex],P,Language).

test(quantifier_scope_and_real_variable_sharing) :-
    quantified_language(L),interpret(L,"every dog is animal",[],R),
    one_meaning(R,x_forAll(X,x_implies(x_isa(Y,x_Dog),x_isa(Z,x_Animal)))),
    assertion(var(X)),assertion(X==Y),assertion(Y==Z),
    term_variables(R.candidates,Variables),assertion(Variables=[X]),
    kb_terms:term_ast(x_forAll(X,x_implies(x_isa(Y,x_Dog),x_isa(Z,x_Animal))),[],AST),
    assertion(AST.head.value==x_forAll).

test(generation_does_not_bind_caller_or_number_source_variables) :-
    quantified_language(L),Meaning=x_forAll(X,x_implies(x_isa(X,x_Dog),x_isa(X,x_Cat))),
    generate(L,Meaning,[],R),assertion(R.status==generated),assertion(var(X)),
    L.grammar=[production(_,_,_,Stored)],term_variables(Stored,Vars),
    assertion(Vars\=[]),forall(member(V,Vars),assertion(var(V))).

test(fresh_interpretations_do_not_share_variables) :-
    quantified_language(L),
    interpret(L,"every dog is animal",[],A),interpret(L,"every dog is animal",[],B),
    A.candidates=[CA],B.candidates=[CB],
    term_variables(CA.term,[VA]),term_variables(CB.term,[VB]),
    assertion(VA\==VB),VA=x_TestOnly,assertion(var(VB)).

test(recursive_knowledge_is_bounded_and_not_reported_absent) :-
    profile(P),
    compile_language([kb(a1,x_TestGrammarMt,
      x_symbolicProduction(x_sentence,x_TheList(x_symbolicNonterminal(x_sentence,X)),X))],P,L),
    interpret(L,"nothing", [depth(3)],R),
    assertion(R.status==resource_limit),assertion(R.complete==false).

test(step_budget_is_enforced) :-
    language(L),interpret(L,"classify Ada as dog",[steps(1)],R),
    assertion(R.status==resource_limit),assertion(R.reason==steps).

test(truncated_search_never_claims_unique_interpretation) :-
    language(L0),L=L0.put(lexicon,[lex(a9,x_name,["Ada"],x_AnotherAda)|L0.lexicon]),
    interpret(L,"classify Ada as dog",[results(1)],R),
    assertion(R.status==resource_limit),assertion(R.complete==false).

test(unrecognized_executable_grammar_slot_is_rejected,
     [throws(error(domain_error(symbolic_grammar_slot,_),_))]) :-
    profile(P),compile_language([kb(a1,x_TestGrammarMt,
      x_symbolicProduction(x_sentence,x_TheList(x_doAgentPlan(x_GenerateComment)),x_bad))],P,_).

test(implication_and_two_equals_stay_data) :-
    profile(P),compile_language([
      kb(a1,x_TestGrammarMt,x_implies(x_true,x_symbolicProduction(x_sentence,x_TheList,x_Fake))),
      kb(a2,x_TestGrammarMt,'x_<=='(x_symbolicProduction(x_sentence,x_TheList,x_Fake),x_true))
    ],P,L),
    interpret(L,"",[],R),assertion(R.status==no_applicable_rule).

test(unicode_tokenization_and_explicit_punctuation) :-
    tokenize("  Καλημέρα Ada?  ",sensitive,Tokens),
    assertion(Tokens==["Καλημέρα","Ada","?"]).

test(input_size_limit,[throws(error(domain_error(input_characters,_),_))]) :-
    length(Cs,4097),maplist(=(97),Cs),string_codes(Text,Cs),language(L),
    interpret(L,Text,[],_).

test(arbitrary_options_are_rejected,
     [throws(error(domain_error(symbolic_language_option,_),_))]) :-
    language(L),interpret(L,"hello",[fallback(llm)],_).

test(actual_krf_compile_preserves_the_learned_production) :-
    source_file(plunit_symbolic_agent_language:language(_),Here),
    file_directory_name(Here,Tests),
    directory_file_path(Tests,'fixtures/symbolic-agent.krf',Original),
    uuid(UUID),atom_concat('.symbolic-language-',UUID,Name),
    directory_file_path(Tests,Name,Directory),
    setup_call_cleanup(make_directory(Directory),
      (directory_file_path(Directory,'fixture.krf',Source),copy_file(Original,Source),
       directory_file_path(Directory,state,State),
       setup_call_cleanup(
         kb_compile:compile_source(Source,[state_dir(State),progress(none),diagnostics(false)],Info),
         (kb_cache:read_cache(Info.normalized,_,Compiled),
          findall(kb(Id,Mt,Semantic),
            (member(record(Id,Semantic,Metadata),Compiled),memberchk(xc_microtheory(Id,Mt),Metadata)),Records),
          Profile=profile{lexiconMt:x_SymbolicTestLexiconMt,grammarMt:x_SymbolicTestGrammarMt,
            startCategory:x_sentence},
          compile_language(Records,Profile,L),
          interpret(L,"mark Boreal as cat",[],R),
          one_meaning(R,x_ClassifyTask(x_Boreal,x_Cat)),
          interpret(L,"every dog is animal",[],Q),
          one_meaning(Q,x_forAll(X,x_implies(x_isa(X,x_Dog),x_isa(X,x_Animal)))),
          assertion(var(X))),
         cleanup_compilation(Info))),
      delete_directory_and_contents(Directory)).

cleanup_compilation(Info) :-
    kb_compile:source_artifacts(Info.source,Artifacts),
    forall(member(File,[Info.normalized,Info.index|Artifacts]),kb_cache:remove_if_exists(File)).

:- end_tests(symbolic_agent_language).
