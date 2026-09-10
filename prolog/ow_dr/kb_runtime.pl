:- module(kb_runtime,
          [native_load/2, native_load/3, import_cache/2, native_unload/1, valid_guarded_clause/2, install_guard/2,
           xc_src/2, xc_clause_handle/2, xc_plvars/2, xc_indexed_constant/2,
           xc_notices/2, xc_warnings/2, xc_errors/2,
           metadata/3, module_metadata/4, query/5, query_modules/6,
           fact_guard/3, rule_guard/5, dispatch/2, module_assertion/4,
           native_modules/1, register_native/2, cache_warnings/1,
           shared_fact_guard/2, shared_rule_guard/4, same_form/2,
           xc_form_handle/2, xc_same_form/2, xc_source_id/2,
           assertion_contributions/3, activate_native/1, native_load_format/2,
           select_compiled/2, native_load_snapshot/5, native_records/3, native_header/2]).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(time)).
:- use_module(library(solution_sequences)).
:- use_module(library(option)).
:- use_module(library(filesex)).
:- use_module(kb_index, []).
:- use_module(kb_symbols).
:- use_module(kb_limits).
:- use_module(kb_forms, []).
:- use_module(kb_qlf, []).
:- use_module(kb_load_policy).
:- dynamic native_file/2.
:- dynamic native_handle/4.
:- dynamic native_signature/4.
:- dynamic staged_file/1.
:- dynamic native_qlf/3, native_format/2.
:- dynamic native_header/2.
:- thread_local capturing_load/1, native_load_error/2.
:- thread_local native_load_options/2.
:- thread_local loaded_header/2.
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
    with_runtime_load(
      (select_compiled(File,Selection),
       (Selection.format==pl->kb_cache:read_cache(File,_,_);true),
       native_load(File,Module,[compiled_selection(Selection)]))).
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
      with_runtime_load(load_selected(File,Module,Options,Key)),
      (erase(Capture),erase(OptionRef),retractall(native_load_error(Key,_)),
       retractall(loaded_header(Key,_)))).

select_compiled(Origin,Selection) :-
    absolute_file_name(Origin,Absolute,[access(none)]),
    kb_qlf:runtime_prebuilt_status(Absolute,Status),
    select_compiled_format(Absolute,Status,Selection).

select_compiled_format(Origin,Status,Selection) :-
    (Status.state==current->
      Selection=_{format:qlf,origin:Origin,qlfStatus:Status,outputHash:Status.metadata.binaryHash}
    ;exists_file(Origin)->
      kb_cache:file_digest(Origin,Hash),
      Selection=_{format:pl,origin:Origin,qlfStatus:Status,outputHash:Hash}
    ;throw(error(existence_error(compiled_kb,Origin),
                context(native_load,'No usable QLF or PL companion. Run compile_kb.pl explicitly first.')))).

native_load_snapshot(Selection,File,Module,Header,Records) :-
    with_runtime_load(
      ((Selection.format==pl->
         copy_file(Selection.origin,File),kb_cache:file_digest(File,Actual),
         (Actual==Selection.outputHash->true;throw(error(snapshot_mismatch(Selection.origin),_))),
         kb_cache:read_cache(File,Header,Records)
       ;true),
       native_load(File,Module,[compiled_selection(Selection),generation_snapshot(true)]),
       (Selection.format==qlf->native_header(File,Header),native_records(File,Module,Records);true))).

native_records(File,Module,Records) :-
    findall(record(Occurrence,Semantic,Metadata),
      (kb_forms:contribution(Module,File,Occurrence,Id,Metadata,_),
       kb_forms:form_record(Id,Semantic,_,_)),Records).

load_selected(File,Module,Options,Key) :-
    absolute_file_name(File,Absolute),
    (option(compiled_selection(Selection),Options)->true;
      native_selection(Absolute,Options,Selection)),
    Origin=Selection.origin,QLFStatus=Selection.qlfStatus,
    (Selection.format==qlf->
      (kb_qlf:load_prebuilt_status(QLFStatus,Staging,Header,Records)->true;
       throw(error(prebuilt_qlf_load_failed(Origin),_))),
      catch((check_load_errors(Key,File),
           cache_warnings(Header),
           register_native_records(Absolute,Module,Records)),
        Error,(kb_qlf:release_staging(Staging),throw(Error))),
      release_native_qlf(Absolute,Module),
      assertz(native_qlf(Absolute,Module,Staging)),
      Format=_{format:qlf,origin:Origin,construction:offline,outputHash:Selection.outputHash}
    ;native_load_pl(File,Module,Key),
     release_native_qlf(Absolute,Module),
     Format=_{format:pl,origin:Origin,qlfState:QLFStatus.state,outputHash:Selection.outputHash,
              reason:"No enabled compatible prebuilt QLF was available."}),
    retractall(native_format(Absolute,_)),assertz(native_format(Absolute,Format)),
    retractall(native_header(Absolute,_)),
    (loaded_header(Key,StoredHeader)->assertz(native_header(Absolute,StoredHeader));true).

native_selection(File,Options,Selection) :-
    option(qlf_origin(OriginInput),Options,File),
    absolute_file_name(OriginInput,Origin,[access(none)]),
    option(prebuilt_qlf(UseQLF),Options,true),
    (UseQLF==true->kb_qlf:runtime_prebuilt_status(Origin,Status);Status=_{state:disabled}),
    (Status.state==current,File\==Origin,exists_file(File),
     kb_cache:file_digest(File,Hash),Hash\==Status.metadata.sourceHash->
      QLFStatus=_{state:stale};QLFStatus=Status),
    select_compiled_format(Origin,QLFStatus,Selection).

native_load_format(File,Format) :-
    absolute_file_name(File,Absolute,[access(none)]),native_format(Absolute,Format).

native_load_pl(File,Module,Key) :-
    catch(((load_files(Module:File,[if(true),silent(true),module(Module)]) -> true
             ; throw(error(native_load_failed(File),_))),
             check_load_errors(Key,File)),
            Error,(native_unload(File),throw(Error))),
    absolute_file_name(File,Absolute),
    (native_file(Absolute,Module)->true;register_native(File,Module)).

check_load_errors(Key,File) :-
    findall(E,native_load_error(Key,E),Errors),
    (Errors=[]->true;throw(error(native_compilation(File,Errors),_))).

release_native_qlf(File,Module) :-
    forall(retract(native_qlf(File,Module,Staging)),kb_qlf:release_staging(Staging)).

cache_warnings(Header) :-
    (is_dict(Header),get_dict(warnings,Header,Warnings)->true;Warnings=[]),
    must_be(list,Warnings),maplist(stored_warning,Warnings),
    (capturing_load(Key)->retractall(loaded_header(Key,_)),assertz(loaded_header(Key,Header))
    ;prolog_load_context(source,File)->
      retractall(native_header(File,_)),assertz(native_header(File,Header))
    ;true).
stored_warning(Warning) :-
    (ground(Warning),kb_cache:valid_warning(Warning)->true;
      throw(error(domain_error(cache_warning,Warning),_))).

register_native(File, Module) :-
    absolute_file_name(File, Absolute),
    findall(native_record(Id,Semantic,Metadata,Ref),
      (current_predicate(Module:xc_native_clause/3),
       clause(Module:xc_native_clause(Id,Head,Guard),true,Ref),
       clause_property(Ref,source(Absolute)),
       guard_semantic(Guard,Id,Head,Semantic),
       source_metadata(Module,Absolute,Id,Metadata)),Records),
    register_native_records(Absolute,Module,Records).

register_native_records(Absolute,Module,Records) :-
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
             assertz(native_signature(Module,Absolute,Name,Arity))),
            import_shared_predicate(Module,Name,Arity))).

import_shared_predicate(Module,Name,Arity) :-
    kb_forms:export(Name/Arity),
    (current_predicate(Module:Name/Arity)->true;Module:import(kb_forms:Name/Arity)).

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
    release_native_qlf(Absolute,_),
    unload_file(Absolute), retractall(native_file(Absolute, _)),
    retractall(native_handle(_, Absolute, _, _)),
    retractall(native_signature(_,Absolute,_,_)),retractall(staged_file(Absolute)),
    retractall(native_format(Absolute,_)),retractall(native_header(Absolute,_)).

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
