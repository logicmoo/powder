:- begin_tests(rule_utility).
:- use_module('../kb_runtime').
:- use_module('../kb_rule_utility').
:- use_module('../kb_paths').
:- use_module(library(filesex)).
:- use_module(library(uuid)).
:- use_module(library(http/json)).
:- use_module(library(process)).

fixture(Directory,File) :-
    source_file(plunit_rule_utility:fixture(_,_),Here),file_directory_name(Here,Tests),
    uuid(U),atom_concat('.rule-utility-',U,Name),directory_file_path(Tests,Name,Directory),
    make_directory(Directory),directory_file_path(Directory,'rules.pl',File),
    app_dir(App),directory_file_path(App,'kb_tail_loader.pl',Helper),
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),
      (format(S,':- use_module(~q), kb_tail_loader:load_remaining.~n',[Helper]),
       forall(fixture_clause(Id,Head,Body,Names,MT),write_clause(S,Id,Head,Body,Names,MT))),
      close(S)),
    reset_telemetry,native_load(File,ow_rule_utility_test).
dispose(Directory,File) :-
    native_unload(File),reset_telemetry,reset_transient,
    delete_directory_and_contents(Directory).
write_clause(S,Id,Head,fact,Names,MT) :- !,
    term_variables(Head,Slots),Guard=..[x_cid,Id|Slots],
    write_native(S,(Head:-Guard)),write_metadata(S,Id,Names,MT).
write_clause(S,Id,Head,Body,Names,MT) :-
    term_variables(Head,Inputs),term_variables(Head-Body,All),
    exclude(same_slot(Inputs),All,Locals),In=..[vs|Inputs],Out=..[vs|Locals],
    write_native(S,(Head:-x_cid_io(Id,Body,In,Out))),write_metadata(S,Id,Names,MT).
same_slot(Slots,X) :- member(V,Slots),V==X,!.
write_native(S,Term) :-
    write_term(S,Term,[quoted(true),numbervars(false),fullstop(true),nl(true)]).
write_metadata(S,Id,Names,MT) :-
    maplist(write_native(S),[xc_microtheory(Id,MT),xc_kb_names(Id,Names)]).

fixture_clause(a1,x_choice(x_a),fact,[],x_TestMt).
fixture_clause(a2,x_choice(x_b),fact,[],x_TestMt).
fixture_clause(a3,x_good(x_b),fact,[],x_TestMt).
fixture_clause(a4,x_choice(x_a),fact,[],x_TestMt).
fixture_clause(a10,x_pick(X),and(x_choice(X)),["?X"],x_TestMt).
fixture_clause(a11,x_pick(X),and(x_choice(X)),["?X"],x_TestMt).
fixture_clause(a12,x_work(X),and(x_pick(X),x_good(X)),["?X"],x_TestMt).
fixture_clause(a13,x_dead,and(x_good(x_a)),[],x_TestMt).
fixture_clause(a14,x_boom,and(x_unknown),[],x_TestMt).
fixture_clause(a15,x_loop(X),and(x_loop(X)),["?X"],x_TestMt).
fixture_clause(a16,x_twice(X),and(x_pick(X),x_pick(X)),["?X"],x_TestMt).
fixture_clause(a17,x_edge(x_ann,x_bob),fact,[],x_TestMt).
fixture_clause(a18,x_edge(x_bob,x_cal),fact,[],x_TestMt).
fixture_clause(a20,x_path(X,Y),and(x_edge(X,Y)),["?X","?Y"],x_TestMt).
fixture_clause(a21,x_path(X,Y),and(x_edge(X,Z),x_path(Z,Y)),["?X","?Y","?Z"],x_TestMt).
fixture_clause(a30,x_fixed(x_a),and,[],x_TestMt).
fixture_clause(a31,x_implies(x_p(X),x_q(X)),fact,["?X"],x_TestMt).
fixture_clause(a32,x_pick(x_other),and,[],x_OtherMt).

run(Goal,Limit,Solutions,Report) :-
    query_modules_report([ow_rule_utility_test],Goal,x_TestMt,Limit,3,
      [generation(7)],Solutions,Report).
row(Report,Id,Row) :- member(Row,Report.rules),Row.id==Id,!.

test(native_answers_proofs_unchanged,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    query_modules_report([ow_rule_utility_test],x_work(_),x_TestMt,50,3,
      [generation(7),telemetry(false)],Baseline,Disabled),
    run(x_work(_),50,Observed,Report),
    assertion(Baseline=@=Observed),assertion(Disabled.coverage==disabled),
    assertion(Report.outcome==exhausted),assertion(ground(Report)),
    row(Report,a10,A),row(Report,a11,B),row(Report,a12,Outer),
    assertion(A.calls=:=1),assertion(A.results=:=3),assertion(A.answersHelped=:=1),
    assertion(A.proofOccurrences=:=1),assertion(A.resultsPerCall=:=3),
    assertion(B.calls=:=1),assertion(B.results=:=3),assertion(B.proofOccurrences=:=1),
    assertion(Outer.results=:=2),assertion(Outer.answersHelped=:=1),
    assertion(Outer.proofOccurrences=:=2),assertion(Report.returnedAnswers=:=2),
    assertion(Report.uniqueReturnedAnswers=:=1),
    assertion(A.applicationEvidence.positiveApplications=:=1),
    assertion(A.applicationEvidence.trials=:=1),
    assertion(Outer.applicationEvidence.positiveApplications=:=1),
    assertion(\+nb_current(logos_query,_)),assertion(\+nb_current(powder_rule_query,_)).

test(deadend_and_head_match_not_candidates,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    run(x_dead,50,[],Report),row(Report,a13,R),
    assertion(R.calls=:=1),assertion(R.results=:=0),assertion(R.exhaustedCalls=:=1),
    assertion(R.zeroResultExhaustedCalls=:=1),assertion(R.answersHelped=:=0),
    assertion(R.applicationEvidence.negativeApplications=:=1),
    run(x_fixed(x_wrong),50,[],NoMatch),assertion(NoMatch.rules==[]),
    rule_detail(a30,7,[ow_rule_utility_test],Detail),Detail.items=[Unobserved],
    assertion(Unobserved.calls==null),assertion(Unobserved.coverage==unobserved),
    rule_detail(a31,7,[ow_rule_utility_test],Static),assertion(Static.items==[]).

test(multianswer_and_repeated_provenance,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    run(x_twice(_),100,Solutions,Report),
    assertion(length(Solutions,20)),assertion(Report.uniqueReturnedAnswers=:=2),
    row(Report,a16,Outer),assertion(Outer.answersHelped=:=2),
    assertion(Outer.proofOccurrences=:=20),
    row(Report,a10,A),row(Report,a11,B),
    assertion(A.answersHelped=:=2),assertion(B.answersHelped=:=2),
    assertion(A.proofOccurrences=:=20),assertion(B.proofOccurrences=:=20).

test(repeated_proof_steps_credit_unique_applications_not_unique_answers,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    run(x_twice(_),100,_,Report),row(Report,a10,A),row(Report,a16,Outer),
    assertion(A.applicationEvidence.positiveApplications=:=7),
    assertion(A.applicationEvidence.trials=:=7),
    assertion(A.applicationEvidence.unknownApplications=:=0),
    assertion(A.answersHelped=:=2),assertion(A.proofOccurrences=:=20),
    assertion(Outer.applicationEvidence.positiveApplications=:=1),
    assertion(Outer.applicationEvidence.trials=:=1).

test(recursive_proofs,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    run(x_path(x_ann,_),50,Solutions,Report),
    assertion(length(Solutions,2)),row(Report,a20,Base),row(Report,a21,Recursive),
    assertion(Base.calls=:=3),assertion(Recursive.calls=:=3),
    assertion(Base.results=:=2),assertion(Recursive.results=:=1),
    assertion(Base.answersHelped=:=2),assertion(Base.proofOccurrences=:=2),
    assertion(Recursive.answersHelped=:=1),assertion(Recursive.proofOccurrences=:=1),
    assertion(Base.applicationEvidence.positiveApplications=:=2),
    assertion(Base.applicationEvidence.negativeApplications=:=1),
    assertion(Base.applicationEvidence.trials=:=3),
    assertion(Recursive.applicationEvidence.positiveApplications=:=1),
    assertion(Recursive.applicationEvidence.negativeApplications=:=2),
    export_telemetry(BeforeView),opencog_utility(Base,[],View),
    export_telemetry(AfterView),assertion(BeforeView==AfterView),
    assertion(View.available==true),assertion(View.k=:=800),
    assertion(abs(View.strength-2/3)<1.0e-12),
    assertion(abs(View.confidence-3/803)<1.0e-12).

test(mt_isolation,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    run(x_pick(_),50,Solutions,Report),assertion(length(Solutions,6)),
    assertion(\+row(Report,a32,_)),
    query_modules_report([ow_rule_utility_test],x_pick(_),x_OtherMt,50,3,
      [generation(7)],Other,OtherReport),
    assertion(Other=[solution(x_OtherMt,[x_other],_)]),
    row(OtherReport,a32,R),assertion(R.calls=:=1).

test(limit_counts_only_delivered_prefix,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    run(x_pick(_),1,Solutions,Report),assertion(length(Solutions,1)),
    assertion(Report.outcome==limit),assertion(Report.coverage==partial),
    row(Report,a10,R),assertion(R.calls=:=1),assertion(R.results=:=1),
    assertion(R.cutCalls=:=1),assertion(R.exhaustedCalls=:=0),
    assertion(R.answersHelped=:=1),assertion(\+row(Report,a11,_)),
    last_query_report(Saved),assertion(Saved==Report),
    rule_detail(a10,7,[ow_rule_utility_test],Detail),Detail.items=[C],
    assertion(C.partialQueries=:=1),assertion(C.queriesObserved=:=1).

test(partial_query_does_not_turn_completed_deadends_into_negatives,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    run(x_or(x_dead,x_pick(_)),1,[_],Report),
    row(Report,a13,Dead),row(Report,a10,Positive),
    assertion(Dead.exhaustedCalls=:=1),
    assertion(Dead.applicationEvidence.negativeApplications=:=0),
    assertion(Dead.applicationEvidence.unknownApplications=:=1),
    assertion(Positive.cutCalls=:=1),
    assertion(Positive.applicationEvidence.positiveApplications=:=1),
    assertion(Positive.applicationEvidence.trials=:=1),
    opencog_utility(Dead,[],View),
    assertion(View.available==false),assertion(View.strength==null),
    assertion(View.confidence==null).

test(local_results_without_returned_answers_are_negative_only_when_exhausted,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    run(and(x_pick(_),x_good(x_a)),50,[],Report),row(Report,a10,R),
    assertion(R.results=:=3),assertion(R.applicationEvidence.positiveApplications=:=0),
    assertion(R.applicationEvidence.negativeApplications=:=1),
    assertion(R.applicationEvidence.trials=:=1),opencog_utility(R,[],View),
    assertion(View.available==true),assertion(View.strength=:=0),
    assertion(abs(View.confidence-1/801)<1.0e-12).

test(only_selected_collector_chunk_credits_application_evidence,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    Expected=[solution(x_TestMt,[x_b],
      [step(a2,fact,[],0,0),step(a11,rule,[x_b],0,1)])],
    query_modules_report([ow_rule_utility_test],x_pick(_),x_TestMt,1,3,
      [generation(7)],Expected,Report),
    row(Report,a10,Skipped),row(Report,a11,Selected),
    assertion(Skipped.applicationEvidence.positiveApplications=:=0),
    assertion(Skipped.applicationEvidence.unknownApplications=:=1),
    assertion(Selected.applicationEvidence.positiveApplications=:=1).

test(native_consumer_cut_excludes_suspended_consumer_cost,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    setup_call_catcher_cleanup(
      (begin_query([ow_rule_utility_test],[generation(7)],Session),
       nb_setval(logos_query,context([ow_rule_utility_test],x_TestMt,[],[]))),
      (once((dispatch([ow_rule_utility_test],x_pick(X)),sleep(0.10))),
       nb_getval(logos_query,State),arg(3,State,Reversed),reverse(Reversed,Proof),
       Delivered=[solution(x_TestMt,[X],Proof)]),
      Catcher,
      (nb_delete(logos_query),finish_query(Session,Catcher,consumer_cut,Delivered,Report))),
    row(Report,a10,R),assertion(R.calls=:=1),assertion(R.results=:=1),
    assertion(R.cutCalls=:=1),assertion(R.answersHelped=:=1),
    assertion(Report.queryCost.wallSeconds>=0.09),
    assertion(R.inclusiveCost.wallSeconds<Report.queryCost.wallSeconds-0.08).

test(partial_consumer_can_supply_private_attribution_without_changing_proofs,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    setup_call_catcher_cleanup(
      (begin_query([ow_rule_utility_test],[generation(7)],Session),
       nb_setval(logos_query,context([ow_rule_utility_test],x_TestMt,[],[]))),
      (once(dispatch([ow_rule_utility_test],x_pick(X))),
       nb_getval(logos_query,State),arg(3,State,Reversed),reverse(Reversed,Proof),
       answer_applications(Applications),returned_applications(Session,[Applications]),
       Delivered=[solution(x_TestMt,[X],Proof)]),
      Catcher,
      (nb_delete(logos_query),finish_query(Session,Catcher,consumer_cut,Delivered,Report))),
    row(Report,a10,R),assertion(R.applicationEvidence.positiveApplications=:=1),
    assertion(R.applicationEvidence.trials=:=1),
    assertion(Delivered=[solution(x_TestMt,[x_a],[step(a1,fact,[],0,0),step(a10,rule,[x_a],0,1)])]).

test(facts_and_static_formula_are_not_executable_rules,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    run(x_implies(_,_),50,Solutions,Report),assertion(length(Solutions,1)),
    assertion(Report.rules==[]),export_telemetry(Snapshot),
    assertion(Snapshot.rows==[]).

test(deterministic_empty_body_is_not_reported_as_interrupted,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    run(x_fixed(x_a),1,[_],Report),row(Report,a30,R),
    assertion(R.calls=:=1),assertion(R.results=:=1),
    assertion(R.exhaustedCalls=:=1),assertion(R.cutCalls=:=0),
    assertion(R.interruptedCalls=:=0).

test(exception_discards_collected_answers_not_execution,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    catch(run(x_or(x_pick(_),x_boom),50,_,_),Error,true),
    assertion(Error=error(existence_error(kb_predicate,x_unknown/0),_)),
    last_query_report(Report),assertion(Report.outcome==exception),
    assertion(Report.returnedAnswers=:=0),row(Report,a10,A),
    assertion(A.results=:=3),assertion(A.answersHelped=:=0),
    assertion(A.proofOccurrences=:=0),row(Report,a14,B),
    assertion(B.interruptedCalls=:=1),assertion(B.results=:=0),
    assertion(A.applicationEvidence.positiveApplications=:=0),
    assertion(A.applicationEvidence.negativeApplications=:=0),
    assertion(A.applicationEvidence.unknownApplications=:=A.calls),
    assertion(\+nb_current(logos_query,_)),assertion(\+nb_current(powder_rule_query,_)).

test(timeout_cleans_every_attempt,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    catch(query_modules_report([ow_rule_utility_test],x_loop(_),x_TestMt,50,0.02,
      [generation(7)],_,_),Error,true),assertion(Error==time_limit_exceeded),
    last_query_report(Report),assertion(Report.outcome==timeout),
    row(Report,a15,R),assertion(R.calls>0),
    assertion(R.calls=:=R.interruptedCalls),assertion(R.proofOccurrences=:=0),
    assertion(R.applicationEvidence.trials=:=0),
    assertion(R.applicationEvidence.unknownApplications=:=R.calls),
    assertion(\+nb_current(powder_rule_query,_)),
    export_telemetry(Snapshot),assertion(ground(Snapshot)),
    assertion(Snapshot.rows=[_]).

test(cancellation_thread_cleanup,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    message_queue_create(Queue),
    setup_call_cleanup(
      thread_create(
        (thread_send_message(Queue,started),
         catch(query_modules_report([ow_rule_utility_test],x_loop(_),x_TestMt,50,30,
           [generation(7)],_,_),cancelled,true),
         last_query_report(Report),
         (nb_current(powder_rule_query,_)->Clean=false;Clean=true),
         thread_send_message(Queue,finished(Clean,Report))),Worker,[]),
      (thread_get_message(Queue,started),sleep(0.02),
       thread_signal(Worker,throw(cancelled)),
       thread_get_message(Queue,finished(true,Report),[timeout(10)]),
       assertion(Report.outcome==cancelled),row(Report,a15,R),
       assertion(R.calls=:=R.interruptedCalls),assertion(R.answersHelped=:=0),
       assertion(R.applicationEvidence.unknownApplications=:=R.calls)),
      (thread_join(Worker,true),message_queue_destroy(Queue))).

test(pool_cancellation_keeps_original_exception_and_unknown_evidence,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    message_queue_create(Queue),
    setup_call_cleanup(
      thread_create(
        (thread_send_message(Queue,started),
         catch(query_modules_report([ow_rule_utility_test],x_loop(_),x_TestMt,50,30,
           [generation(7)],_,_),Error,true),
         last_query_report(Report),thread_send_message(Queue,finished(Error,Report))),Worker,[]),
      (thread_get_message(Queue,started),sleep(0.02),
       thread_signal(Worker,throw(job_cancelled(utility_fixture))),
       thread_get_message(Queue,finished(Error,Report),[timeout(10)]),
       assertion(Error==job_cancelled(utility_fixture)),assertion(Report.outcome==cancelled),
       row(Report,a15,R),assertion(R.applicationEvidence.unknownApplications=:=R.calls)),
      (thread_join(Worker,true),message_queue_destroy(Queue))).

test(concurrent_aggregation_once,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    findall(Thread,(between(1,4,_),
      thread_create(forall(between(1,10,_),run(x_work(_),50,_,_)),Thread,[])),Threads),
    maplist(join_ok,Threads),
    rule_detail(a10,7,[ow_rule_utility_test],Detail),Detail.items=[R],
    assertion(R.calls=:=40),assertion(R.results=:=120),
    assertion(R.answersHelped=:=40),assertion(R.proofOccurrences=:=40),
    assertion(R.applicationEvidence.positiveApplications=:=40),
    assertion(R.applicationEvidence.trials=:=40),
    assertion(Detail.lifetime.completedQueries=:=40),assertion(ground(Detail)).
join_ok(Thread) :- thread_join(Thread,true).

test(generation_content_occurrence_and_reset,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    run(x_pick(_),50,_,Report),row(Report,a10,A),row(Report,a11,B),
    assertion(A.contentHash==B.contentHash),assertion(A.id\==B.id),
    rule_detail(a10,8,[ow_rule_utility_test],DifferentGeneration),
    assertion(length(DifferentGeneration.items,2)),
    assertion(has_identity_state(DifferentGeneration,prior_generation)),
    native_unload(F),
    % Reload a real edited occurrence under its original stable ID.
    app_dir(App),directory_file_path(App,'kb_tail_loader.pl',Helper),
    setup_call_cleanup(open(F,write,S),
      (format(S,':- use_module(~q), kb_tail_loader:load_remaining.~n',[Helper]),
       write_clause(S,a10,x_pick(x_edited),and,[],x_TestMt)),close(S)),
    native_load(F,ow_rule_utility_test),
    run(x_pick(_),50,_,Edited),row(Edited,a10,E),assertion(E.contentHash\==A.contentHash),
    rule_detail(a10,7,[ow_rule_utility_test],Detail),assertion(length(Detail.items,2)),
    assertion(has_identity_state(Detail,stale)),
    export_telemetry(Snapshot),reset_telemetry,
    run(x_pick(_),50,Before,_),reset_telemetry,import_telemetry(Snapshot),
    export_telemetry(Restored),assertion(Restored==Snapshot),
    run(x_pick(_),50,After,_),assertion(Before=@=After).
has_identity_state(Detail,State) :- member(Row,Detail.items),Row.identityState==State.

test(reset_during_query_discards_old_epoch_only,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    begin_query([ow_rule_utility_test],[generation(7)],Session),
    rule_enter(ow_rule_utility_test,a10,Token),rule_result(Token),rule_leave(Token,!),
    reset_telemetry,finish_query(Session,exit,limit,[],Report),
    assertion(Report.aggregation==discarded_after_reset),
    export_telemetry(Snapshot),assertion(Snapshot.rows==[]),
    assertion(Snapshot.completedQueries=:=0),
    run(x_pick(_),50,Solutions,_),assertion(length(Solutions,6)).

test(pagination_and_json_ground,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    run(x_work(_),50,_,_),
    rule_list(7,[ow_rule_utility_test],[sort(answersHelped),limit(2)],First),
    rule_list(7,[ow_rule_utility_test],[sort(answersHelped),offset(2),limit(2)],Next),
    assertion(length(First.items,2)),assertion(length(Next.items,2)),
    assertion(First.items\==Next.items),assertion(ground(First)),
    with_output_to(string(JSON),json_write_dict(current_output,First)),
    assertion(string(JSON)).

test(application_budget_is_explicit_and_never_changes_answers,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    run(x_twice(_),100,Baseline,_),
    query_modules_report([ow_rule_utility_test],x_twice(_),x_TestMt,100,3,
      [generation(7),application_limit(1)],Limited,Report),
    assertion(Baseline=@=Limited),assertion(Report.coverage==capacity_limited),
    assertion(Report.untrackedApplications>0),
    row(Report,a10,R),assertion(R.calls=:=7),
    assertion(R.applicationEvidence.unknownApplications=:=7),
    assertion(R.applicationEvidence.trials=:=0),
    opencog_utility(R,[],View),assertion(View.available==false).

test(legacy_aggregate_evidence_is_unavailable_and_not_reconstructed,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    run(x_pick(_),50,_,_),export_telemetry(Snapshot),
    maplist(strip_application_evidence,Snapshot.rows,LegacyRows),
    Legacy=Snapshot.put(rows,LegacyRows),import_telemetry(Legacy),
    export_telemetry(Exact),assertion(Exact==Legacy),
    rule_detail(a10,7,[ow_rule_utility_test],Before),Before.items=[Old],
    opencog_utility(Old,[],Unavailable),assertion(Unavailable.available==false),
    assertion(Unavailable.evidence.unknownApplications=:=Old.calls),
    run(x_pick(_),50,_,_),rule_detail(a10,7,[ow_rule_utility_test],After),After.items=[New],
    opencog_utility(New,[k(10)],Partial),
    assertion(Partial.available==true),assertion(Partial.evidence.coverage==partial),
    assertion(Partial.evidence.unknownApplications=:=1),
    assertion(Partial.evidence.trials=:=1),assertion(abs(Partial.confidence-1/11)<1.0e-12).
strip_application_evidence(Row,Legacy) :- del_dict(applicationEvidence,Row,_,Legacy).

test(invalid_confidence_constant,[throws(error(domain_error(positive_finite_confidence_constant,0),_))]) :-
    opencog_utility(telemetry{calls:1},[k(0)],_).

test(real_saved_image_keeps_completed_aggregates_only,
     [setup(fixture(D,F)),cleanup(dispose(D,F))]) :-
    run(x_work(_),50,_,_),export_telemetry(Expected),
    directory_file_path(D,'telemetry.state',Image),
    directory_file_path(D,'restored.pl',Output),
    directory_file_path(D,'builder.pl',Builder),
    source_file(plunit_rule_utility:fixture(_,_),Tests),
    setup_call_cleanup(open(Builder,write,S,[encoding(utf8)]),
      (write_native(S,(:-ensure_loaded(Tests))),
       write_native(S,(:-initialization(build,main))),
       write_native(S,(build:-
         (kb_rule_utility:import_telemetry(Expected),
          kb_rule_utility:begin_query([],[generation(7)],_),
          qsave_program(Image,[class(development),
            goal(plunit_rule_utility:verify_saved_telemetry(Output)),
            toplevel(halt),stand_alone(false),autoload(false)]),halt)))),close(S)),
    current_prolog_flag(executable,SWI),
    child_ok(SWI,['-q','-s',Builder]),
    child_ok(SWI,['-q','-x',Image]),
    setup_call_cleanup(open(Output,read,Input),read_term(Input,Actual,[]),close(Input)),
    assertion(Actual==Expected).

child_ok(SWI,Arguments) :-
    process_create(SWI,Arguments,[process(PID),stdout(null)]),
    process_wait(PID,Exit,[timeout(20)]),
    (Exit==timeout->process_kill(PID,term),process_wait(PID,_);true),
    assertion(Exit==exit(0)).

verify_saved_telemetry(Output) :-
    \+nb_current(powder_rule_query,_),\+last_query_report(_),
    export_telemetry(Snapshot),ground(Snapshot),
    setup_call_cleanup(open(Output,write,S,[encoding(utf8)]),
      write_term(S,Snapshot,[quoted(true),fullstop(true),nl(true)]),close(S)),
    halt(0).

benchmark :-
    setup_call_cleanup(fixture(D,F),
      (benchmark_run(false,100,_),benchmark_run(true,100,_),
       benchmark_run(false,500,Baseline),benchmark_run(true,500,Observed),
       format('RULE TELEMETRY BENCHMARK ~q~n',
         [benchmark{queries:500,goal:x_twice,answersPerQuery:20,
           disabled:Baseline,enabled:Observed}])),
      dispose(D,F)).
benchmark_run(Enabled,Count,Measurement) :-
    statistics(cputime,C0),statistics(walltime,[W0,_]),statistics(inferences,I0),
    forall(between(1,Count,_),
      query_modules_report([ow_rule_utility_test],x_twice(_),x_TestMt,100,3,
        [generation(7),telemetry(Enabled)],Solutions,_)),
    statistics(inferences,I1),statistics(walltime,[W1,_]),statistics(cputime,C1),
    % forall/2 leaves the output variable unbound; it must never leak a solution.
    var(Solutions),
    CPU is C1-C0,Wall is (W1-W0)/1000,Steps is I1-I0,
    Measurement=measurement{cpuSeconds:CPU,wallSeconds:Wall,inferences:Steps}.

:- end_tests(rule_utility).
