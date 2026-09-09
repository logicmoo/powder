:- module(kb_runtime,
          [native_load/2, native_unload/1, valid_guarded_clause/2, install_guard/2,
           xc_src/2, xc_clause_handle/2, xc_plvars/2, xc_indexed_constant/2,
           metadata/3, module_metadata/4, query/5, query_modules/6,
           fact_guard/3, rule_guard/5, dispatch/2, module_assertion/4,
           native_modules/1, register_native/2]).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(time)).
:- use_module(library(solution_sequences)).
:- dynamic native_file/2.
:- dynamic native_handle/4.

valid_guarded_clause(Head, Guard) :-
    must_be(callable, Head), functor(Head, Name, _),
    semantic_functor(Name),
    ( compound(Guard), Guard =.. [x_cid, Id|_]
    ; Guard = x_cid_io(Id, Body, Inputs, Locals),
      group(and, Body), group(vs, Inputs), group(vs, Locals)
    ),
    atom(Id), atom_concat(a,Hex,Id),Hex\=='',atom_codes(Hex,Codes),
    forall(member(C,Codes),(between(0'0,0'9,C);between(0'a,0'f,C))), !.
valid_guarded_clause(Head, Guard) :-
    throw(error(domain_error(guarded_clause, (Head :- Guard)), _)).

group(Name, Term) :- nonvar(Term), functor(Term, Name, _).

install_guard(Module, Guard) :-
    functor(Guard, Name, Arity),
    ( current_predicate(Module:Name/Arity) -> true
    ; functor(Head, Name, Arity),
      ( Name == x_cid ->
          Head =.. [x_cid, Id|Slots],
          Impl = kb_runtime:fact_guard(Module, Id, Slots)
      ; Head = x_cid_io(Id, Body, Inputs, Locals),
        Impl = kb_runtime:rule_guard(Module, Id, Body, Inputs, Locals)
      ),
      assertz(Module:(Head :- Impl))
    ).

native_load(File, Module) :-
    must_be(atom, Module),
    load_files(Module:File, [if(true), silent(true), module(Module)]),
    register_native(File, Module).

register_native(File, Module) :-
    absolute_file_name(File, Absolute),
    retractall(native_file(Absolute, Module)),
    assertz(native_file(Absolute, Module)),
    retractall(native_handle(Module, Absolute, _, _)),
    forall((current_predicate(Module:Name/Arity), semantic_functor(Name),
            functor(Head, Name, Arity),
            \+ predicate_property(Module:Head, imported_from(_)),
            clause(Module:Head, Guard, Ref),
            guard_semantic(Guard, Id, Head, _),
            clause_property(Ref, source(Absolute))),
           assertz(native_handle(Module, Absolute, Id, Ref))).

native_unload(File) :-
    absolute_file_name(File, Absolute),
    unload_file(Absolute), retractall(native_file(Absolute, _)),
    retractall(native_handle(_, Absolute, _, _)).

native_modules(Modules) :-
    findall(M, (native_file(_, M), module_metadata(M, microtheory, _, _)), Ms),
    sort(Ms, Modules).

module_metadata(Module, Property, Id, Value) :-
    atom(Property), atom_concat(xc_, Property, Predicate),
    current_predicate(Module:Predicate/2),
    Goal =.. [Predicate, Id, Value], call(Module:Goal).

metadata(Id, Property, Value) :-
    native_modules(Modules), member(M, Modules),
    module_metadata(M, Property, Id, Value).

module_assertion(Module, Id, Semantic, Ref) :-
    native_handle(Module, _, Id, Ref),
    \+ clause_property(Ref, erased),
    clause(Head, Guard, Ref),
    guard_semantic(Guard, Id, Head, Semantic).

semantic_functor(Name) :-
    ( atom_concat(x_, Rest, Name), Rest \== cid, Rest \== cid_io
    ; memberchk(Name, [t, metta_value, metta_execute])
    ).

guard_semantic(Guard, Id, Head, Semantic) :-
    nonvar(Guard), Guard = _:Inner, !,
    guard_semantic(Inner, Id, Head, Semantic).
guard_semantic(Guard, Id, Head, Semantic) :-
    nonvar(Guard),
    ( Guard =.. [x_cid, Id|_] -> Semantic = Head
    ; Guard = x_cid_io(Id, Body, _, _) -> Semantic = (Head :- Body)
    ).

xc_clause_handle(Id, Ref) :-
    native_modules(Modules), member(M, Modules), module_assertion(M, Id, _, Ref),
    \+ clause_property(Ref, erased).
xc_src(Id, Semantic) :-
    xc_clause_handle(Id, Ref), clause(Head, Guard, Ref),
    ( Head = _:Actual -> true ; Actual = Head ),
    guard_semantic(Guard, Id, Actual, Semantic).

xc_plvars(Id, Names) :-
    metadata(Id, kb_names, Original),
    safe_names(Original, 0, Names).
safe_names([], _, []).
safe_names([_|Rest], N, [Name|Names]) :-
    N1 is N+1, atom_concat('V', N1, Name),
    safe_names(Rest, N1, Names).

xc_indexed_constant(Id, Constant) :-
    xc_src(Id, Semantic),
    kb_index:semantic_constants(Semantic, Constants),
    member(Constant, Constants).

query(Goal, MT, Limit, Seconds, Solutions) :-
    native_modules(Modules),
    query_modules(Modules, Goal, MT, Limit, Seconds, Solutions).

query_modules(Modules, Goal, MT, Limit, Seconds, Solutions) :-
    must_be(integer, Limit), between(1, 1000, Limit),
    must_be(number, Seconds), Seconds > 0, Seconds =< 30,
    must_be(list, Modules), maplist(must_be(atom), Modules),
    term_variables(Goal, Variables),
    findall(Context, (member(M, Modules), module_metadata(M, microtheory, _, Context)), MTs0),
    sort(MTs0, MTs),
    ( var(MT) -> Contexts = MTs
    ; must_be(atom, MT), Contexts = [MT]
    ),
    capture_context(Previous),
    setup_call_cleanup(
        true,
        call_with_time_limit(Seconds,
          findnsols(Limit, solution(Context, Variables, Proof),
            ( member(Context, Contexts),
              nb_setval(logos_query, context(Modules, Context, [])),
              dispatch(Modules, Goal),
              nb_getval(logos_query, State), arg(3, State, Reversed),
              reverse(Reversed, Proof)
            ), Solutions)),
        restore_context(Previous)), !.

capture_context(value(State)) :- nb_current(logos_query, State), !.
capture_context(none).
restore_context(value(State)) :- nb_setval(logos_query, State).
restore_context(none) :- nb_delete(logos_query).

fact_guard(Module, Id, Slots) :-
    checked_context(Module, Id, State),
    bound_count(Slots, N),
    proof_step(State, step(Id, fact, Slots, N, N)).

rule_guard(Module, Id, Body, Inputs, Locals) :-
    checked_context(Module, Id, State),
    Inputs =.. [vs|HeadSlots], Locals =.. [vs|LocalSlots],
    append(HeadSlots, LocalSlots, Slots),
    bound_count(Slots, Before),
    arg(1, State, Modules),
    dispatch(Modules, Body),
    bound_count(Slots, After),
    proof_step(State, step(Id, rule, Slots, Before, After)).

checked_context(Module, Id, State) :-
    ( nb_current(logos_query, State) -> true
    ; throw(error(permission_error(call, kb_clause_without_query_context, Id), _))
    ),
    arg(1, State, Modules), memberchk(Module, Modules),
    arg(2, State, MT), module_metadata(Module, microtheory, Id, MT).

bound_count(Slots, Count) :- include(nonvar, Slots, Bound), length(Bound, Count).
proof_step(State, Step) :-
    copy_term(Step, Copy), arg(3, State, Old),
    setarg(3, State, [Copy|Old]).

dispatch(_, Goal) :- var(Goal), !,
    throw(error(instantiation_error, context(dispatch/2, 'Unbound executable goal'))).
dispatch(Modules, and) :- !, must_be(list, Modules).
dispatch(Modules, Goal) :-
    compound(Goal), Goal =.. [and|Goals], !,
    maplist(dispatch(Modules), Goals).
dispatch(Modules, Goal) :-
    compound(Goal), Goal =.. [x_and|Goals], !,
    maplist(dispatch(Modules), Goals).
dispatch(Modules, Goal) :-
    compound(Goal), Goal =.. [x_or|Goals], !,
    member(Branch, Goals), dispatch(Modules, Branch).
dispatch(Modules, Goal) :-
    must_be(callable, Goal), functor(Goal, Name, Arity),
    semantic_functor(Name), !,
    findall(M, (member(M, Modules), current_predicate(M:Name/Arity),
                predicate_property(M:Goal, defined),
                \+ predicate_property(M:Goal, imported_from(_))), Owners),
    ( Owners == [] ->
        throw(error(existence_error(kb_predicate, Name/Arity), _))
    ; member(Owner, Owners), call(Owner:Goal)
    ).
dispatch(_, Goal) :-
    throw(error(domain_error(executable_kb_goal,Goal),_)).
