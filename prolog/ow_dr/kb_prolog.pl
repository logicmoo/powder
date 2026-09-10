:- module(kb_prolog, [run_prolog/5, kb_bridge/1]).
:- use_module(kb_console, []).
:- use_module(kb_runtime, []).
:- use_module(kb_store, []).
:- use_module(kb_terms).
:- use_module(kb_limits).
:- use_module(kb_activity).
:- use_module(library(error)).
:- use_module(library(streams)).
:- use_module(library(time)).
:- dynamic bridge_ref/3.
:- meta_predicate capture_output(0,-,-).

run_prolog(Text,Mt,Limit,Seconds,Result) :-
    (current_predicate(kb_jobs:pools_started/0),kb_jobs:pools_started,\+kb_jobs:in_inference->
      (var(Mt)->Scope=none;Scope=context(Mt)),
      kb_jobs:submit_inference(prolog,query(Text,Scope,Limit,Seconds),Job),
      kb_jobs:await_result(Job.jobId,Result)
    ;run_prolog_direct(Text,Mt,Limit,Seconds,Result)).
run_prolog_direct(Text,Mt,Limit,Seconds,Result) :-
    must_be(string,Text),string_length(Text,Length),
    (Length=<65536->true;throw(error(domain_error(prolog_query_length,Length),_))),
    validate_result_limit(queryLimit,Limit),
    must_be(number,Seconds),
    (Seconds>0,Seconds=<30->true;throw(error(domain_error(query_timeout,Seconds),_))),
    parse_goal(Text,Goal,Names),
    with_application(kb_store:with_generation(kb_prolog:execute_query(Goal,Names,Mt,Limit,Seconds,Result))).

parse_goal(Text,Goal,Names) :-
    setup_call_cleanup(open_string(Text,Stream),
      (read_term(Stream,Term,[module(powder_console),variable_names(Names),
                             syntax_errors(error),quasi_quotations(Quotes)]),
       read_term(Stream,End,[module(powder_console),syntax_errors(error),quasi_quotations(MoreQuotes)]),
       (End==end_of_file,Quotes==[],MoreQuotes==[],Term\==end_of_file->true;
         throw(error(domain_error(single_prolog_goal,Text),_))),
       (nonvar(Term),Term=(?-Body)->Goal=Body;Goal=Term),
       must_be(callable,Goal)),close(Stream)).

execute_query(Goal,Names,Mt,Limit,Seconds,Result,Modules,Generation) :-
    with_mutex(powder_console_bridges,install_bridges(Modules)),
    State=execution(0,[],running,null),
    kb_runtime:capture_context(Previous),
    setup_call_cleanup(
      (var(Mt)->nb_delete(logos_query);nb_setval(logos_query,context(Modules,Mt,[],[]))),
      capture_output(
        catch(call_with_time_limit(Seconds,collect_solutions(Goal,Names,Limit,State)),
              Error,record_exception(State,Error)),Output,ErrorOutput),
      kb_runtime:restore_context(Previous)),
    arg(1,State,Count),arg(2,State,Reversed),reverse(Reversed,Solutions),
    arg(3,State,Status0),arg(4,State,Exception),
    (Status0==exhausted->(Count=:=0->Status=failure;Status=success);Status=Status0),
    (var(Mt)->Key=null;context_key(Mt,Key)),
    Result=_{mode:prolog,status:Status,solutions:Solutions,output:Output,errorOutput:ErrorOutput,
             exception:Exception,generation:Generation,mt:Key,consoleModule:powder_console}.

install_bridges(Modules) :-
    findall(Name/Arity,(member(M,Modules),kb_runtime:native_signature(M,_,Name,Arity)),Signatures),
    sort(Signatures,Unique),maplist(install_bridge,Unique).
install_bridge(Name/Arity) :-
    (bridge_ref(Name,Arity,Ref),\+clause_property(Ref,erased)->true;
      functor(Head,Name,Arity),
      assertz(powder_console:(Head :- kb_prolog:kb_bridge(Head)),Ref),
      retractall(bridge_ref(Name,Arity,_)),assertz(bridge_ref(Name,Arity,Ref))).

kb_bridge(Goal) :-
    (nb_current(logos_query,context(Modules,_,_,_))->kb_runtime:dispatch(Modules,Goal)
    ;throw(error(permission_error(call,kb_goal_without_microtheory,Goal),
                 context(powder_console,'Select a microtheory for KB predicates; ordinary Prolog goals can run without one')))).

collect_solutions(Goal,Names,Limit,State) :-
    (call(powder_console:Goal),
     copy_term(Names,Snapshot),maplist(binding,Snapshot,Bindings),
     arg(1,State,Count),Next is Count+1,nb_setarg(1,State,Next),
     arg(2,State,Previous),nb_linkarg(2,State,[_{bindings:Bindings}|Previous]),
     (Next>=Limit->nb_setarg(3,State,limit),!;fail)
    ;nb_setarg(3,State,exhausted)).

binding(Name=Value,_{name:Name,value:Text}) :-
    term_string(Value,Text,[quoted(true),cycles(true),numbervars(false)]).
record_exception(State,Error) :-
    term_string(Error,Term,[quoted(true),cycles(true)]),
    message_to_string(Error,Message),
    (Error==time_limit_exceeded->Status=timeout;Error=job_cancelled(_)->Status=cancelled;Status=exception),
    nb_setarg(3,State,Status),
    nb_setarg(4,State,_{term:Term,message:Message}).

capture_output(Goal,Output,Errors) :-
    stream_property(UserInput,alias(user_input)),current_input(CurrentInput),
    setup_call_cleanup(open_string("",Input),
      setup_call_cleanup((set_stream(Input,alias(user_input)),set_input(Input)),
        with_output_to(string(Output),Goal,[capture([user_output,user_error])]),
        (set_stream(UserInput,alias(user_input)),set_input(CurrentInput))),
      close(Input)),
    Errors="".
