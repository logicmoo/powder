:- module(kb_questions, [stored_questions/1, question_prolog/3]).
:- use_module(kb_store, []).
:- use_module(kb_runtime, []).
:- use_module(kb_cache, []).
:- use_module(kb_console, []).
:- use_module(kb_terms).
:- use_module(library(pairs)).

stored_questions(Questions) :-
    kb_store:term_assertions(x_test_Qs,Candidates),
    findall(Key-Question,
      (member(Data,Candidates),Data.predicate.term==x_test_Qs,Data.predicate.arity=:=3,
       kb_runtime:module_assertion(Data.module,Data.id,x_test_Qs(Code,English,Formula),_),
       string(Code),string(English),
       question_prolog(Formula,Prolog,Bindings),
       semantic_ast(Formula,Data.names,Expression),
       source_variable_names(Bindings,Data.names,Variables),
       Key=Code-Data.source-Data.line-Data.id,
       Question=_{id:Data.id,identifier:Code,question:English,prolog:Prolog,expression:Expression,
                  mt:Data.mt,mtExpression:Data.mtExpression,source:Data.source,line:Data.line,
                  variables:Variables,predicate:x_test_Qs}),
      Pairs),
    keysort(Pairs,Sorted),pairs_values(Sorted,Questions).

question_prolog(Formula,Text,Names) :-
    kb_cache:safe_variable_names(Formula,Names),
    formula_goal(Formula,Goal),
    term_string(Goal,Body,[quoted(true),variable_names(Names),numbervars(false),module(powder_console)]),
    string_concat(Body,".",Text).

formula_goal(Formula,Goal) :-
    nonvar(Formula),compound(Formula),Formula=..[Head|Args],
    memberchk(Head,[x_and,and,x_or]),!,
    maplist(formula_goal,Args,Goals),
    (Head==x_or->join_goals(Goals,or,Goal);join_goals(Goals,and,Goal)).
formula_goal(Formula,Formula).
join_goals([],and,true).
join_goals([],or,fail).
join_goals([Goal],_,Goal) :- !.
join_goals([First|Rest],Kind,Goal) :-
    join_goals(Rest,Kind,Tail),
    (Kind==and->Goal=(First,Tail);Goal=(First;Tail)).

source_variable_names([],_,[]).
source_variable_names([Name=_|Rest],[Original|Originals],[_{prolog:Name,source:Original}|Names]) :-
    source_variable_names(Rest,Originals,Names).
