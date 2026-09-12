:- module(kb_questions, [stored_questions/1, question_prolog/3,
                         run_question/4,run_question_direct/4]).
:- use_module(kb_activity).
:- use_module(kb_store, []).
:- use_module(kb_runtime, []).
:- use_module(kb_cache, []).
:- use_module(kb_console, []).
:- use_module(kb_terms).
:- use_module(library(pairs)).
:- use_module(library(error)).

run_question(Id,Limit,Seconds,Result) :-
    current_predicate(kb_jobs:inference_pool_started/0),
    kb_jobs:inference_pool_started,\+kb_jobs:in_inference,\+kb_store:owns_store_mutex,!,
    kb_jobs:queue_question(Id,Limit,Seconds,Job),kb_jobs:await_result(Job.jobId,Result).
run_question(Id,Limit,Seconds,Result) :-
    run_question_direct(Id,Limit,Seconds,Result).

run_question_direct(Input,Limit,Seconds,Result) :-
    (string(Input)->atom_string(Id,Input);must_be(atom,Input),Id=Input),
    with_application(
      setup_call_cleanup(kb_store:acquire_query_snapshot(Snapshot),
        (stored_question_formula(Snapshot.modules,Id,Code,English,Formula,Mt,Names),
         kb_store:query_in_snapshot(Snapshot,Formula,Names,Mt,Limit,Seconds,Answer),
         Result=Answer.put(question,_{id:Id,identifier:Code,question:English})),
        kb_store:release_query_snapshot(Snapshot))).

stored_question_formula(Modules,Id,Code,English,Formula,Mt,Names) :-
    member(Module,Modules),
    kb_runtime:module_assertion(Module,Id,x_test_Qs(Code,English,Formula),_),
    string(Code),string(English),!,
    kb_runtime:module_metadata(Module,microtheory,Id,Mt),
    kb_runtime:module_metadata(Module,kb_names,Id,Names).
stored_question_formula(_,Id,_,_,_,_,_) :-
    throw(error(existence_error(stored_test_question,Id),_)).

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
