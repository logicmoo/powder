:- module(kb_runtime,
          [native_load/2, native_load/3, import_cache/2, native_unload/1, valid_guarded_clause/2, install_guard/2,
           xc_src/2, xc_clause_handle/2, xc_plvars/2, xc_indexed_constant/2,
           xc_notices/2, xc_warnings/2, xc_errors/2,
           metadata/3, module_metadata/4, query/5, query_modules/6,
           fact_guard/3, rule_guard/5, dispatch/2, module_assertion/4,
           native_modules/1, register_native/2, cache_warnings/1,
           shared_fact_guard/2, shared_rule_guard/4, same_form/2,
           xc_form_handle/2, xc_same_form/2, xc_source_id/2,
           assertion_contributions/3, activate_native/1]).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(time)).
:- use_module(library(solution_sequences)).
:- use_module(library(option)).
:- use_module(library(assoc)).
:- use_module(kb_index, []).
:- use_module(kb_symbols).
:- use_module(kb_limits).
:- use_module(kb_forms, []).
:- dynamic native_file/2.
:- dynamic native_handle/4.
:- dynamic native_signature/4.
:- dynamic staged_file/1.
:- thread_local capturing_load/1, native_load_error/2.
:- thread_local native_load_options/2.
:- multifile user:message_hook/3.

user:message_hook(Term,error,_) :-
    kb_runtime:capturing_load(Key),
    assertz(kb_runtime:native_load_error(Key,Term)),fail.

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
    functor(Probe,Name,Arity),
    ( current_predicate(Module:Name/Arity),
      predicate_property(Module:Probe,implementation_module(Module)) -> true
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
    native_load(File,Module,[]).
import_cache(File,Module) :-
    (current_predicate(kb_jobs:pools_started/0),kb_jobs:pools_started,\+kb_jobs:in_loader->
      kb_jobs:submit_native(import_cache(File,Module),Job),kb_jobs:await_result(Job.jobId,_)
    ;import_cache_direct(File,Module)).
import_cache_direct(File,Module) :-
    kb_cache:read_cache(File,_,_),
    native_load(File,Module).
native_load(File, Module, Options) :-
    (current_predicate(kb_jobs:pools_started/0),kb_jobs:pools_started,\+kb_jobs:in_loader->
      kb_jobs:submit_native(native_load(File,Module,Options),Job),kb_jobs:await_result(Job.jobId,_)
    ;native_load_direct(File,Module,Options)).
native_load_direct(File, Module, Options) :-
    must_be(atom, Module),
    must_be(list,Options),
    flag(ow_native_load,Key,Key+1),
    setup_call_cleanup(
      (asserta(capturing_load(Key),Capture),asserta(native_load_options(Key,Options),OptionRef)),
      catch(((load_files(Module:File,[if(true),silent(true),module(Module)]) -> true
             ; throw(error(native_load_failed(File),_))),
             findall(E,native_load_error(Key,E),Errors),
             (Errors=[]->true;throw(error(native_compilation(File,Errors),_)))),
            Error,(native_unload(File),throw(Error))),
      (erase(Capture),erase(OptionRef),retractall(native_load_error(Key,_)))),
    absolute_file_name(File,Absolute),
    (native_file(Absolute,Module)->true;register_native(File,Module)).

cache_warnings(Header) :-
    (is_dict(Header),get_dict(warnings,Header,Warnings)->true;Warnings=[]),
    (capturing_load(Key),native_load_options(Key,Options)->true;Options=[]),
    option(diagnostics(Show),Options,true),
    (Show==false->true;empty_assoc(Counts),foldl(cached_warning,Warnings,Counts,_)).
cached_warning(warning(File,Line,Column,Message),Before,After) :-
    ground(warning(File,Line,Column,Message)),
    atom(File),integer(Line),integer(Column),atomic(Message), !,
    (get_assoc(Message,Before,N0)->true;N0=0),N is N0+1,
    put_assoc(Message,Before,N,After),
    (N=<5->format(user_error,'WARNING ~w:~d:~d: ~w~n',[File,Line,Column,Message])
    ;N=:=6->format(user_error,'WARNING ~w: additional identical warnings suppressed.~n',[File])
    ;true),
    flush_output(user_error).
cached_warning(Warning,_,_) :- throw(error(domain_error(cache_warning,Warning),_)).

register_native(File, Module) :-
    absolute_file_name(File, Absolute),
    findall(native_record(Id,Semantic,Metadata,Ref),
      (current_predicate(Module:xc_native_clause/3),
       clause(Module:xc_native_clause(Id,Head,Guard),true,Ref),
       clause_property(Ref,source(Absolute)),
       guard_semantic(Guard,Id,Head,Semantic),
       source_metadata(Module,Absolute,Id,Metadata)),Records),
    (capturing_load(Key),native_load_options(Key,Options),
     memberchk(generation_snapshot(true),Options)->Versions=true;Versions=false),
    kb_forms:replace_owner(Module,Absolute,Records,Versions),
    retractall(native_file(Absolute, Module)),
    assertz(native_file(Absolute, Module)),
    retractall(native_handle(Module, Absolute, _, _)),
    retractall(native_signature(Module, Absolute, _, _)),
    (Versions==true->(staged_file(Absolute)->true;assertz(staged_file(Absolute)));true),
    forall((kb_forms:contribution(Module,Absolute,_,Id,_,Ref),
            kb_forms:form_record(Id,Semantic,_,_),
            (Semantic=(Head:-_)->true;Head=Semantic),functor(Head,Name,Arity)),
           (
            assertz(native_handle(Module, Absolute, Id, Ref)),
            (native_signature(Module,Absolute,Name,Arity)->true;
             assertz(native_signature(Module,Absolute,Name,Arity))))).

source_metadata(Module,File,Id,Metadata) :-
    findall(Term,
      (current_predicate(Module:Name/2),atom_concat(xc_,_,Name),
       Term=..[Name,Id,_],\+predicate_property(Module:Term,imported_from(_)),
       clause(Module:Term,true,Ref),clause_property(Ref,source(File))),Metadata).

activate_native(File) :- retractall(staged_file(File)).

native_unload(File) :-
    absolute_file_name(File, Absolute),
    (current_predicate(kb_tail_loader:release_source/2)->
      kb_tail_loader:release_source(Absolute,_);true),
    forall(native_file(Absolute,Module),kb_forms:remove_owner(Module,Absolute)),
    unload_file(Absolute), retractall(native_file(Absolute, _)),
    retractall(native_handle(_, Absolute, _, _)),
    retractall(native_signature(_,Absolute,_,_)),retractall(staged_file(Absolute)).

native_modules(Modules) :-
    (nb_current(logos_query,context(Selected,_,_,_))->Modules=Selected
    ;visible_native_modules(Modules)).
visible_native_modules(Modules) :-
    findall(M, (native_file(File, M),\+retired_file(File),\+staged_file(File),
                once(module_metadata(M, microtheory, _, _))), Ms),
    sort(Ms, Modules).
retired_file(File) :-
    current_predicate(kb_store:retired_native/1),kb_store:retired_native(File).

module_metadata(Module, Property, Id, Value) :-
    kb_forms:resolve_id([Module],Id,Primary),
    kb_forms:record_metadata([Module],Primary,Property,Value).

metadata(Id, Property, Value) :-
    native_modules(Modules),kb_forms:resolve_id(Modules,Id,Primary),
    kb_forms:record_metadata(Modules,Primary,Property,Value).
xc_notices(Id,Messages) :- metadata(Id,notices,Messages).
xc_warnings(Id,Messages) :- metadata(Id,warnings,Messages).
xc_errors(Id,Messages) :- metadata(Id,errors,Messages).

module_assertion(Module, Id, Semantic, Ref) :-
    kb_forms:resolve_id([Module],Id,Primary),
    kb_forms:form_record(Primary,Semantic,_,_),
    kb_forms:assertion_source_ref([Module],Primary,Ref).

semantic_functor(Name) :-
    ( encoded_symbol(Name),\+memberchk(Name,[x_cid,x_cid_io,':',':-','?-'])
    ; memberchk(Name, [t, metta_value, metta_exec, metta_expression])
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
    native_modules(Modules),kb_forms:resolve_id(Modules,Id,Primary),
    kb_forms:assertion_source_ref(Modules,Primary,Ref),
    \+ clause_property(Ref, erased).
xc_src(Id, Semantic) :-
    native_modules(Modules),kb_forms:resolve_id(Modules,Id,Primary),
    kb_forms:form_record(Primary,Semantic,_,_).
xc_form_handle(Id,Ref) :-
    native_modules(Modules),kb_forms:resolve_id(Modules,Id,Primary),
    kb_forms:form_record(Primary,_,_,Ref).
same_form(Id,Other) :- native_modules(Modules),kb_forms:same_form(Modules,Id,Other).
xc_same_form(Id,Other) :- same_form(Id,Other).
xc_source_id(Id,Occurrence) :-
    native_modules(Modules),kb_forms:resolve_id(Modules,Id,Primary),
    setof(A,(M^F^P^R^(member(M,Modules),kb_forms:contribution(M,F,A,Primary,P,R))),Aliases),
    member(Occurrence,Aliases).
assertion_contributions(Modules,Id,Contributions) :-
    kb_forms:resolve_id(Modules,Id,Primary),
    findall(contribution(Module,File,Occurrence,Metadata,Ref),
      (member(Module,Modules),kb_forms:contribution(Module,File,Occurrence,Primary,Metadata,Ref)),Contributions).

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
    validate_result_limit(queryLimit,Limit),
    must_be(number, Seconds), Seconds > 0, Seconds =< 30,
    must_be(list, Modules), maplist(must_be(atom), Modules),
    term_variables(Goal, Variables),
    findall(Context, (member(M, Modules), module_metadata(M, microtheory, _, Context)), MTs0),
    sort(MTs0, MTs),
    ( var(MT) -> Contexts = MTs
    ; must_be(ground, MT), Contexts = [MT]
    ),
    capture_context(Previous),
    setup_call_cleanup(
        true,
        call_with_time_limit(Seconds,
          findnsols(Limit, solution(Context, Variables, Proof),
            ( member(Context, Contexts),
              nb_setval(logos_query, context(Modules, Context, [], [])),
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

shared_fact_guard(Key,Slots) :-
    shared_context(Key,Id,State),
    bound_count(Slots,N),proof_step(State,step(Id,fact,Slots,N,N)).
shared_rule_guard(Key,Body,Inputs,Locals) :-
    shared_context(Key,Id,State),
    Inputs=..[vs|HeadSlots],Locals=..[vs|LocalSlots],append(HeadSlots,LocalSlots,Slots),
    bound_count(Slots,Before),
    arg(4,State,Active),setarg(4,State,[Id|Active]),
    arg(1,State,Modules),dispatch(Modules,Body),
    setarg(4,State,Active),bound_count(Slots,After),
    proof_step(State,step(Id,rule,Slots,Before,After)).
shared_context(Key,Id,State) :-
    (nb_current(logos_query,State)->true;
      throw(error(permission_error(call,kb_clause_without_query_context,Key),_))),
    arg(1,State,Modules),arg(2,State,Mt),
    kb_forms:eligible_records(Key,Modules,Mt,Ids),member(Id,Ids).
rule_guard(Module, Id, Body, Inputs, Locals) :-
    checked_context(Module, Id, State),
    Inputs =.. [vs|HeadSlots], Locals =.. [vs|LocalSlots],
    append(HeadSlots, LocalSlots, Slots),
    bound_count(Slots, Before),
    arg(4,State,Active),setarg(4,State,[Id|Active]),
    arg(1, State, Modules),
    dispatch(Modules, Body),
    setarg(4,State,Active),
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
    findall(M, (member(M, Modules),once(native_signature(M,_,Name,Arity))), Owners),
    ( Owners == [] ->
        throw(error(existence_error(kb_predicate, Name/Arity), _))
    ; kb_forms:shared_clause(Name,Arity,_,Goal,Guard),
      call(Guard)
    ).
dispatch(_, Goal) :-
    throw(error(domain_error(executable_kb_goal,Goal),_)).

invoke_guard(Module,Id,_:Guard) :- !,invoke_guard(Module,Id,Guard).
invoke_guard(Module,Id,Guard) :-
    (Guard=..[x_cid,Id|Slots] -> fact_guard(Module,Id,Slots)
    ; Guard=x_cid_io(Id,Body,Inputs,Locals) -> rule_guard(Module,Id,Body,Inputs,Locals)
    ; throw(error(domain_error(registered_kb_guard,Guard),_))).
