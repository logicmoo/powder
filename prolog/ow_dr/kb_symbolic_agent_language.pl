:- module(kb_symbolic_agent_language,
          [compile_language/3,interpret/4,generate/4,generate_category/5,tokenize/3]).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(option)).
:- use_module(library(solution_sequences)).
:- use_module(library(time)).

/** <module> Bounded, bidirectional interpretation of declarative text grammar

Records are kb(AssertionId,Microtheory,CanonicalSemanticTerm). No record is
consulted or called. The two interpreted predicates are new powder vocabulary,
not implementations of the corpus's declarative textInterpretation/sentenceForm.
*/

compile_language(Records,Profile,Language) :-
    must_be(list,Records),length(Records,Count),bounded(Count,0,8192,knowledge_records),
    must_be(dict,Profile),
    must_be(ground,Profile.lexiconMt),must_be(ground,Profile.grammarMt),
    must_be(ground,Profile.startCategory),category(Profile.startCategory),
    (get_dict(caseMode,Profile,Case)->true;Case=sensitive),
    must_be(oneof([sensitive,insensitive]),Case),
    maplist(record_shape,Records),
    findall(Entry,lexical_record(Records,Profile.lexiconMt,Case,Entry),Lexicon),
    findall(Entry,grammar_record(Records,Profile.grammarMt,Case,Entry),Grammar),
    Language=language{start:Profile.startCategory,caseMode:Case,
      lexicon:Lexicon,grammar:Grammar}.

record_shape(kb(Id,Mt,Term)) :-
    must_be(atom,Id),must_be(ground,Mt),must_be(nonvar,Term),
    (acyclic_term(Term)->true;domain_error(acyclic_knowledge,Id)),
    term_size(Term,Cells),bounded(Cells,0,4096,knowledge_term_cells).

lexical_record(Records,Mt,Case,lex(Id,Category,Tokens,Meaning)) :-
    member(kb(Id,Actual,Term),Records),Actual==Mt,
    Term=x_symbolicLexeme(Category,Sequence,Meaning),
    category(Category),must_be(ground,Meaning),
    cyc_list(Sequence,Words),length(Words,N),bounded(N,1,32,lexical_tokens),
    maplist(normalized_token(Case),Words,Tokens).

grammar_record(Records,Mt,Case,production(Id,Category,Slots,Meaning)) :-
    member(kb(Id,Actual,Term),Records),Actual==Mt,
    Term=x_symbolicProduction(Category,Sequence,Meaning),
    category(Category),cyc_list(Sequence,RawSlots),
    length(RawSlots,N),bounded(N,0,32,production_slots),
    maplist(grammar_slot(Case),RawSlots,Slots).

cyc_list(x_TheList,[]) :- !.
cyc_list(Term,Items) :-
    nonvar(Term),compound(Term),Term=..[x_TheList|Items],!.
cyc_list(Term,_) :- domain_error(symbolic_TheList,Term).

category(Category) :-
    must_be(nonvar,Category),
    (atom(Category)->Name=Category;
      compound_name_arity(Category,Name,Arity),bounded(Arity,1,8,category_arity)),
    (atom_concat(x_,_,Name)->true;domain_error(symbolic_category,Category)),
    term_size(Category,N),bounded(N,0,64,category_cells).

grammar_slot(Case,x_symbolicLiteral(Text),literal(Token)) :- !,
    normalized_token(Case,Text,Token).
grammar_slot(_,x_symbolicNonterminal(Category,Meaning),nonterminal(Category,Meaning)) :- !,
    category(Category).
grammar_slot(_,Slot,_) :- domain_error(symbolic_grammar_slot,Slot).

normalized_token(Case,Text,Token) :-
    must_be(string,Text),string_length(Text,N),bounded(N,1,128,token_characters),
    string_codes(Text,Codes),
    (member(C,Codes),code_type(C,space)->domain_error(single_symbolic_token,Text);true),
    (Case==insensitive->string_lower(Text,Token);Token=Text).

tokenize(Text,Case,Tokens) :-
    must_be(string,Text),must_be(oneof([sensitive,insensitive]),Case),
    string_length(Text,N),bounded(N,0,4096,input_characters),
    string_codes(Text,Codes),phrase(tokens(Words),Codes),
    length(Words,Count),bounded(Count,0,256,input_tokens),
    maplist(normalized_token(Case),Words,Tokens).

tokens(Tokens) --> [C],{code_type(C,space)},!,tokens(Tokens).
tokens([Text|Rest]) --> [C],{punctuation(C),string_codes(Text,[C])},!,tokens(Rest).
tokens([Text|Rest]) --> word(Codes),{Codes\=[],string_codes(Text,Codes)},!,tokens(Rest).
tokens([]) --> [].
word([C|Cs]) --> [C],{\+code_type(C,space),\+punctuation(C)},!,word(Cs).
word([]) --> [].
punctuation(C) :- memberchk(C,[33,44,46,58,59,63]).

interpret(Language,Text,Options,Result) :-
    tokenize(Text,Language.caseMode,Tokens),
    search(Language,Language.start,interpret(Tokens),Options,Result).
generate(Language,Meaning,Options,Result) :-
    generate_category(Language,Language.start,Meaning,Options,Result).
generate_category(Language,Category,Meaning,Options,Result) :-
    must_be(ground,Category),category(Category),
    (acyclic_term(Meaning)->true;domain_error(acyclic_meaning,Meaning)),
    search(Language,Category,generate(Meaning),Options,Result).

search(Language,Category,Mode,Options,Result) :-
    limits(Options,Limits),Counter=counter(0,false),Max is Limits.results+1,
    catch(
      (catch(call_with_time_limit(Limits.seconds,
          once(findnsols(Max,Candidate,
            candidate(Language,Category,Mode,Limits,Counter,Candidate),Found))),
        time_limit_exceeded,throw(symbolic_budget(seconds))),
       finish_result(Mode,Found,Counter,Limits,Result)),
      symbolic_budget(Reason),
      budget_result(Reason,Counter,Result)),!.
search(_,_,_,_,_) :- throw(error(symbolic_language_search_failed,_)).

limits(Options,limits{depth:Depth,steps:Steps,results:Results,seconds:Seconds}) :-
    must_be(list,Options),
    option(depth(Depth),Options,16),bounded(Depth,1,64,grammar_depth),
    option(steps(Steps),Options,20000),bounded(Steps,1,200000,grammar_steps),
    option(results(Results),Options,8),bounded(Results,1,32,grammar_results),
    option(seconds(Seconds),Options,1),must_be(number,Seconds),
    (Seconds>=0.01,Seconds=<5->true;domain_error(grammar_seconds,Seconds)),
    forall(member(Option,Options),
      (nonvar(Option),(Option=depth(_);Option=steps(_);Option=results(_);Option=seconds(_))->true;
        domain_error(symbolic_language_option,Option))).
bounded(Value,Low,High,Kind) :-
    must_be(integer,Value),
    (between(Low,High,Value)->true;domain_error(Kind,Value)).

candidate(Language,Category,interpret(Tokens),Limits,Counter,candidate(Meaning,Proof)) :-
    derive(Language,Category,Meaning,Tokens,[],Limits.depth,Limits.steps,Counter,Proof).
candidate(Language,Category,generate(Input),Limits,Counter,candidate(Tokens,Proof)) :-
    copy_term(Input,Meaning),
    derive(Language,Category,Meaning,Tokens,[],Limits.depth,Limits.steps,Counter,Proof),
    length(Tokens,N),N=<256.

tick(Counter,Maximum) :-
    arg(1,Counter,N),Next is N+1,
    (Next=<Maximum->nb_setarg(1,Counter,Next);throw(symbolic_budget(steps))).
derive(_,_,_,_,_,0,_,Counter,_) :- !,nb_setarg(2,Counter,true),fail.
derive(Language,Category,Meaning,Input,Rest,Depth,Maximum,Counter,Proof) :-
    tick(Counter,Maximum),
    (member(Entry,Language.lexicon),tick(Counter,Maximum),
     copy_term(Entry,lex(Id,LexCategory,Tokens,LexMeaning)),
     unify_with_occurs_check(Category-Meaning,LexCategory-LexMeaning),
     append(Tokens,Rest,Input),Proof=[Id]
    ;member(Entry,Language.grammar),tick(Counter,Maximum),
     copy_term(Entry,production(Id,RuleCategory,Slots,RuleMeaning)),
     unify_with_occurs_check(Category-Meaning,RuleCategory-RuleMeaning),
     Next is Depth-1,
     derive_slots(Slots,Language,Input,Rest,Next,Maximum,Counter,ChildProof),
     Proof=[Id|ChildProof]).

derive_slots([],_,Rest,Rest,_,_,_,[]).
derive_slots([literal(Token)|Slots],Language,[Token|Input],Rest,Depth,Max,Counter,Proof) :-
    tick(Counter,Max),derive_slots(Slots,Language,Input,Rest,Depth,Max,Counter,Proof).
derive_slots([nonterminal(Category,Meaning)|Slots],Language,Input,Rest,Depth,Max,Counter,Proof) :-
    derive(Language,Category,Meaning,Input,Next,Depth,Max,Counter,Here),
    derive_slots(Slots,Language,Next,Rest,Depth,Max,Counter,More),append(Here,More,Proof).

finish_result(Mode,Found,Counter,Limits,Result) :-
    length(Found,N),
    (N>Limits.results->length(Shown,Limits.results),append(Shown,_,Found),Cut=true;
      Shown=Found,arg(2,Counter,Cut)),
    distinct_candidates(Shown,Unique),maplist(candidate_dict(Mode),Unique,Items),
    length(Items,Count),arg(1,Counter,Steps),
    result_status(Mode,Count,Cut,Status),
    (Cut==true->Complete=false;Complete=true),
    Result=language_result{status:Status,complete:Complete,candidates:Items,steps:Steps}.

distinct_candidates([],[]).
distinct_candidates([candidate(Value,Proof)|Rest],[candidate(Value,Proof)|Unique]) :-
    exclude(same_candidate(Value),Rest,Other),distinct_candidates(Other,Unique).
same_candidate(Value,candidate(Other,_)) :- Value=@=Other.
candidate_dict(interpret(_),candidate(Term,Proof),interpretation{term:Term,proof:Proof}).
candidate_dict(generate(_),candidate(Tokens,Proof),realization{text:Text,tokens:Tokens,proof:Proof}) :-
    atomics_to_string(Tokens," ",Text).
result_status(interpret(_),N,_,ambiguous) :- N>1,!.
result_status(_,_,true,resource_limit) :- !.
result_status(_,0,false,no_applicable_rule) :- !.
result_status(interpret(_),1,false,interpreted).
result_status(generate(_),_,false,generated).
budget_result(Reason,Counter,language_result{status:resource_limit,reason:Reason,
              complete:false,candidates:[],steps:Steps}) :- arg(1,Counter,Steps).
