:- module(kb_rule_utility,
          [begin_query/3, finish_query/5, telemetry_enabled/0, rule_enter/3, rule_result/1,
           rule_resume/1, rule_leave/2, last_query_report/1,
           rule_detail/4, rule_list/4, reset_telemetry/0,
           reset_provenance/0, answer_applications/1, returned_applications/2,
           opencog_utility/3,
           export_telemetry/1, import_telemetry/1, reset_transient/0]).

/** <module> Observational executable-rule utility

The runtime's query_modules_report/8 returns this module's ground, JSON-safe
report. Pass generation(G) from the store snapshot; null explicitly means an
unknown generation for standalone native callers. telemetry(false) disables
rule observation. Exceptions retain their original shape; last_query_report/1
provides the completed exception report in that thread, not a shared history.

Only entered x_cid_io guards count. Results are local nondeterministic yields;
answersHelped counts distinct variant (MT, bindings) answers containing the
rule in a *returned* proof, while proofOccurrences counts every such step.
Cumulative answersHelped sums per-query distinct counts, not globally distinct
answers. A collector that throws returns no answers, even if it found some
before throwing. This boundary is the runtime API, not HTTP delivery/receipt.

rule_list(Generation, Modules, Options, Page) accepts offset/1, limit/1 (1..1000),
id/1 and sort/1 (calls, results, answersHelped, proofOccurrences, wallSeconds,
cpuSeconds, inferences, id). rule_detail/4 returns the same rows for one ID.
Unobserved rules have null measures. Old generations and changed/unloaded
content remain explicitly historical. Neither ranking nor telemetry changes
dispatch order, inference semantics, weights or pruning.

applicationEvidence is a separate, comparable per-application observation:
each entered application is positive at most once if a private token for that
application occurs in a returned proof. A negative requires BOTH an exhausted
application and full query exhaustion with no attributed returned proof.
Timeouts, exceptions, cancellation, limits and consumer cuts leave every other
application unknown, even an earlier local dead end. Local results alone are
never positive evidence. Private provenance is backtrackable and collected
alongside, not inside, the unchanged public solution/3 and step/5 terms.

The query-local application table holds at most 16384 compact records; the
application_limit(N) option can reduce this budget to 0..16384. Beyond it,
applications are unknown, raw metrics still work, and capacity is explicit.
Only aggregate positive/negative/unknown counts persist. Legacy schema-1 rows
without applicationEvidence remain losslessly roundtrippable, unavailable
rather than retroactively reconstructed from incompatible raw counters.

opencog_utility(Row, [k(K)], View) is a pure on-demand presentation adapter;
K defaults to 800. It uses strength=positiveApplications/trials and
confidence=trials/(trials+K), with both values null when trials=0. This borrows
the historical OpenCog SimpleTruthValue count/confidence convention, verified
at the immutable source URL in opencog_reference/1 (DEFAULT_K=800 and
count=K*confidence/(1-confidence)); that class was removed upstream in 2025.
The binary outcome is usefulness to returned answers, NOT proposition truth.
Correlated recursive applications, heterogeneous query workloads, censored
partial queries and budget limits mean this is not calibrated statistical
confidence. Counts, coverage and unknowns must be displayed with the pair.
Strength/confidence are never stored, used as rule weights, or consulted by
dispatch. All existing raw metrics remain independently available.

Costs are inclusive execution spans paused at each yield and resumed on redo.
Nested/recursive spans overlap, so their sums are NOT total query time.
Query cost excludes final report/aggregate preparation; wall counters have
millisecond resolution and CPU resolution is platform dependent. Both costs
include some observer overhead. A result limit does not probe one extra answer:
limit means exhaustion is unknown even when the last answer happened to fit.
Tabling/cache-proof replay and network delivery are not observed.

The isolated test benchmark (Windows, SWI 10.1.7, 2026-09-12) ran 500 x_twice
queries returning 20 proofs each: disabled 0.779s wall / 0.734s CPU, enabled
1.977s wall / 1.719s CPU (about 2.5x wall time on these deliberately tiny rule bodies).
This includes report/aggregate overhead and is not a production-corpus claim.
Reproduce with plunit_rule_utility:benchmark after loading test_rule_utility.pl.

Only completed summaries are exported/saved. import_telemetry/1 is the trusted
isolated-builder handover. Restore clears transient query state. Explicit
reset_telemetry/0 resets only this module; already-running old-epoch queries
finish normally but cannot repopulate its new lifetime. Storage is bounded by
capacity/1 rule identities, not event count; dropped observation/aggregation
is reported, never silently presented as complete.
*/
:- use_module(library(assoc)).
:- use_module(library(aggregate)).
:- use_module(library(crypto)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(option)).
:- use_module(library(pairs)).
:- use_module(library(uuid)).
:- dynamic aggregate/2, lifetime/3, completed_queries/1, dropped_aggregates/1.
:- thread_local last_query_report/1.
:- volatile last_query_report/1.

% Only ground completed summaries are persistent. No native references, bindings,
% suspended attempts, proof logs, or per-answer hashes enter the aggregate store.
capacity(4096).
application_capacity(16384).
initialize :-
    (lifetime(_,_,_)->true;uuid(Epoch),get_time(Now),assertz(lifetime(Epoch,Now,0))),
    (completed_queries(_)->true;assertz(completed_queries(0))),
    (dropped_aggregates(_)->true;assertz(dropped_aggregates(0))).
:- initialization(initialize).
:- initialization(reset_transient, restore).

reset_transient :-
    (nb_current(powder_rule_query,_)->nb_delete(powder_rule_query);true),
    retractall(last_query_report(_)).

reset_telemetry :-
    with_mutex(powder_rule_utility,
      (retractall(aggregate(_,_)),retractall(lifetime(_,_,_)),
       retractall(completed_queries(_)),retractall(dropped_aggregates(_)),initialize)),
    retractall(last_query_report(_)).

begin_query(Modules, Options, session(Previous,State)) :-
    option(telemetry(Enabled),Options,true),must_be(boolean,Enabled),
    option(generation(Generation),Options,null),must_be(ground,Generation),
    valid_generation(Generation),
    application_capacity(Maximum),option(application_limit(ApplicationLimit),Options,Maximum),
    must_be(between(0,Maximum),ApplicationLimit),
    (nb_current(powder_rule_query,Old)->Previous=value(Old);Previous=none),
    with_mutex(powder_rule_utility,lifetime(Epoch,_,_)),
    empty_assoc(Entries),stamp(Start),
    empty_assoc(Applications),
    State=query(Enabled,Modules,Generation,Epoch,Entries,0,0,Start,false,
                proof([]),Applications,0,0,unavailable,ApplicationLimit),
    nb_linkval(powder_rule_query,State).
valid_generation(Generation) :-
    (Generation==null->true;must_be(nonneg,Generation)).

finish_query(session(Previous,State), Catcher, Completion, Solutions, Report) :-
    setup_call_cleanup(true,
      finish_once(State,Catcher,Completion,Solutions,Report),
      restore_query(Previous)).
restore_query(none) :- nb_delete(powder_rule_query).
restore_query(value(State)) :- nb_linkval(powder_rule_query,State).

finish_once(State,_,_,_,Report) :-
    arg(9,State,Done),Done\==false,!,Report=Done.
finish_once(State,Catcher,Completion,Solutions,Report) :-
    arg(1,State,Enabled),arg(3,State,Generation),arg(4,State,Epoch),
    arg(8,State,Start),stamp(End),elapsed(Start,End,Wall,CPU,Steps),
    completion(Catcher,Completion,Outcome,Returned),
    (Enabled==true,Returned==true->credit_solutions(State,Solutions);true),
    arg(5,State,Entries),assoc_to_values(Entries,Values),
    maplist(entry_report,Values,RawRules),
    application_evidence(State,Outcome,Returned,RawRules,Rules),
    (Returned==true->length(Solutions,AnswerCount),unique_answers(Solutions,UniqueCount)
    ;AnswerCount=0,UniqueCount=0),
    arg(7,State,Dropped),
    arg(13,State,UntrackedApplications),
    (Enabled==false->Coverage=disabled
    ;(Dropped>0;UntrackedApplications>0)->Coverage=capacity_limited
    ;Outcome==exhausted->Coverage=complete
    ;Coverage=partial),
    arg(15,State,ApplicationLimit),
    Base=telemetry{schema:1,enabled:Enabled,generation:Generation,epoch:Epoch,
      outcome:Outcome,coverage:Coverage,returnedAnswers:AnswerCount,
      uniqueReturnedAnswers:UniqueCount,untrackedCalls:Dropped,
      untrackedApplications:UntrackedApplications,applicationLimit:ApplicationLimit,
      queryCost:telemetry{wallSeconds:Wall,cpuSeconds:CPU,inferences:Steps},
      rules:Rules},
    capabilities(Capabilities),
    (Enabled==true->merge_completed(Epoch,Outcome,Rules,Merged);Merged=disabled),
    Report=Base.put(telemetry{aggregation:Merged,measurement:Capabilities}),
    nb_setarg(9,State,Report),
    retractall(last_query_report(_)),assertz(last_query_report(Report)).

completion(exit,Completion,Completion,true) :- !.
completion(!,_,cut,false) :- !.
completion(fail,_,failed,false) :- !.
completion(exception(time_limit_exceeded),_,timeout,false) :- !.
completion(exception(cancelled),_,cancelled,false) :- !.
completion(exception(error(cancelled,_)),_,cancelled,false) :- !.
completion(external_exception(_),_,cancelled,false) :- !.
completion(_,_,exception,false).

telemetry_enabled :- nb_current(powder_rule_query,State),arg(1,State,true).

reset_provenance :-
    nb_getval(powder_rule_query,State),arg(10,State,Proof),
    nb_setarg(1,Proof,[]).
answer_applications(Applications) :-
    nb_getval(powder_rule_query,State),arg(10,State,Proof),arg(1,Proof,Applications).
returned_applications(session(_,State),Witnesses) :-
    append(Witnesses,Applications),sort(Applications,Unique),
    nb_setarg(14,State,Unique).

rule_enter(Module,Id,Token) :-
    (nb_current(powder_rule_query,State),arg(1,State,true)->
      entry_for(State,Module,Id,Entry),
      (Entry==untracked->Token=disabled
      ;arg(3,Entry,Counters),increment(Counters,1,1),
       new_application(State,Entry,Application),stamp(Start),
       Token=attempt(Counters,Start,true,false,Application))
    ;Token=disabled).

entry_for(State,Module,Id,Entry) :-
    arg(5,State,Entries),Key=Module-Id,
    (get_assoc(Key,Entries,Entry)->true
    ;arg(6,State,Count),capacity(Max),
     (Count>=Max->increment(State,7,1),Entry=untracked
     ;rule_identity(Module,Id,Identity),
      arg(3,State,Generation),Entry=entry(Identity,Generation,
        counters(0,0,0,0,0,0,0,0,0,0.0,0.0,0),[]),
      put_assoc(Key,Entries,Entry,Next),
      nb_linkarg(5,State,Next),increment(State,6,1))).

new_application(State,Entry,Application) :-
    arg(12,State,Count),arg(15,State,Max),
    (Count>=Max->increment(State,13,1),Application=unavailable
    ;Number is Count+1,Application=Number-application(Entry,open),
     arg(11,State,Applications),put_assoc(Number,Applications,Application,Next),
     nb_linkarg(11,State,Next),nb_setarg(12,State,Number)).

rule_result(disabled) :- !.
rule_result(Token) :-
    stop_span(Token),arg(1,Token,C),increment(C,2,1),
    (arg(4,Token,false)->increment(C,3,1),nb_setarg(4,Token,true);true),
    arg(5,Token,Application),
    (Application==unavailable->true
    ;Application=Number-_,nb_getval(powder_rule_query,State),
     arg(10,State,Proof),arg(1,Proof,Previous),
     setarg(1,Proof,[Number|Previous])).
rule_resume(disabled) :- !.
rule_resume(Token) :- stamp(Start),nb_setarg(2,Token,Start),nb_setarg(3,Token,true).
rule_leave(disabled,_) :- !.
rule_leave(Token,Catcher) :-
    stop_span(Token),arg(1,Token,C),
    (memberchk(Catcher,[exit,fail])->
      Status=exhausted,increment(C,4,1),(arg(4,Token,false)->increment(C,7,1);true)
    ;Catcher==(!)->Status=cut,increment(C,5,1)
    ;Status=interrupted,increment(C,6,1)),
    arg(5,Token,Application),
    (Application==unavailable->true;Application=_-Observation,nb_setarg(2,Observation,Status)).

stop_span(Token) :-
    (arg(3,Token,true)->
      stamp(End),arg(2,Token,Start),elapsed(Start,End,Wall,CPU,Steps),
      arg(1,Token,C),increment(C,10,Wall),increment(C,11,CPU),increment(C,12,Steps),
      nb_setarg(3,Token,false)
    ;true).
increment(Term,Index,Delta) :- arg(Index,Term,Before),After is Before+Delta,nb_setarg(Index,Term,After).

stamp(stamp(Wall,CPU,Steps)) :-
    statistics(walltime,[Milliseconds,_]),Wall is Milliseconds/1000,
    statistics(cputime,CPU),statistics(inferences,Steps).
elapsed(stamp(W0,C0,I0),stamp(W1,C1,I1),W,C,I) :-
    W is max(0,W1-W0),C is max(0,C1-C0),I is max(0,I1-I0).

rule_identity(Module,Id,Identity) :-
    kb_runtime:module_assertion(Module,Id,Semantic,_),
    Semantic=(Head:-_),
    kb_runtime:module_metadata(Module,microtheory,Id,MT),!,
    canonical_hash(Semantic-MT,Hash),
    functor(Head,Functor,NativeArity),
    (Functor==t->
      Arity is NativeArity-1,arg(1,Head,Position),
      (atom(Position)->Predicate=Position;Predicate=t)
    ;Predicate=Functor,Arity=NativeArity),
    Identity=telemetry{id:Id,contentHash:Hash,predicate:Predicate,arity:Arity}.

canonical_hash(Term,Hash) :-
    copy_term(Term,Copy),numbervars(Copy,0,_),
    with_output_to(string(Text),write_canonical(Copy)),
    crypto_data_hash(Text,Hash,[algorithm(sha256),encoding(utf8)]).

unique_answers(Solutions,Count) :-
    findall(Hash,(member(solution(MT,Bindings,_),Solutions),
                  canonical_hash(MT-Bindings,Hash)),Hashes),
    sort(Hashes,Unique),length(Unique,Count).
credit_solutions(State,Solutions) :-
    arg(5,State,Entries),assoc_to_values(Entries,Values),
    empty_assoc(ById0),foldl(id_entry,Values,ById0,ById),
    forall(member(solution(MT,Bindings,Proof),Solutions),
      (canonical_hash(MT-Bindings,Hash),
       forall(member(step(Id,rule,_,_,_),Proof),
         (get_assoc(Id,ById,Entry)->credit_entry(Entry,Hash);true)))).
id_entry(Entry,A0,A) :- arg(1,Entry,Identity),put_assoc(Identity.id,A0,Entry,A).
credit_entry(Entry,Hash) :-
    arg(3,Entry,C),increment(C,9,1),arg(4,Entry,Seen),
    (memberchk(Hash,Seen)->true;increment(C,8,1),nb_setarg(4,Entry,[Hash|Seen])).

application_evidence(State,Outcome,Returned,Raw,Rules) :-
    arg(14,State,Witnesses),
    (Returned==true,is_list(Witnesses)->
      maplist(positive_key,Witnesses,Pairs),list_to_assoc(Pairs,Positive),
      Attributed=true
    ;empty_assoc(Positive),Attributed=false),
    arg(11,State,Applications),assoc_to_values(Applications,Observations),
    empty_assoc(Before),
    foldl(classify_application(Positive,Attributed,Outcome),Observations,Before,Counts),
    maplist(attach_evidence(Counts),Raw,Rules).
positive_key(Number,Number-true).
classify_application(Positive,Attributed,Outcome,Number-application(Entry,Status),A0,A) :-
    arg(1,Entry,Identity),Id=Identity.id,
    (get_assoc(Id,A0,P0-N0)->true;P0=0,N0=0),
    (get_assoc(Number,Positive,_)->P is P0+1,N=N0
    ;Attributed==true,Outcome==exhausted,Status==exhausted->P=P0,N is N0+1
    ;P=P0,N=N0),
    put_assoc(Id,A0,P-N,A).
attach_evidence(Counts,Row,WithEvidence) :-
    (get_assoc(Row.id,Counts,Positive-Negative)->true;Positive=0,Negative=0),
    Unknown is Row.calls-Positive-Negative,
    evidence_counts(Positive,Negative,Unknown,Evidence),
    WithEvidence=Row.put(applicationEvidence,Evidence).
evidence_counts(Positive,Negative,Unknown,Evidence) :-
    Trials is Positive+Negative,
    (Trials=:=0->Coverage=unavailable;Unknown==0->Coverage=complete;Coverage=partial),
    Evidence=telemetry{schema:1,positiveApplications:Positive,negativeApplications:Negative,
      unknownApplications:Unknown,trials:Trials,coverage:Coverage}.
row_evidence(Row,Evidence) :-
    (get_dict(applicationEvidence,Row,Evidence)->true
    ;get_dict(calls,Row,Calls)->evidence_counts(0,0,Calls,Evidence)
    ;evidence_counts(0,0,null,Evidence)).
sum_evidence(Old,Row,Evidence) :-
    row_evidence(Old,A),row_evidence(Row,B),
    P is A.positiveApplications+B.positiveApplications,
    N is A.negativeApplications+B.negativeApplications,
    U is A.unknownApplications+B.unknownApplications,
    evidence_counts(P,N,U,Evidence).

opencog_reference('https://github.com/opencog/atomspace/blob/5b6302ca33eef491ca0f7331ba7558d7777c21a3/opencog/atoms/truthvalue/SimpleTruthValue.cc').
opencog_utility(Row,Options,View) :-
    must_be(dict,Row),must_be(list,Options),option(k(K),Options,800),
    must_be(number,K),
    (K>0,(float(K)->float_class(K,Class),memberchk(Class,[normal,subnormal]);true)->true
    ;throw(error(domain_error(positive_finite_confidence_constant,K),_))),
    row_evidence(Row,Evidence),N=Evidence.trials,
    (N>0->Available=true,Strength is Evidence.positiveApplications/N,Confidence is N/(N+K)
    ;Available=false,Strength=null,Confidence=null),
    opencog_reference(Reference),
    View=telemetry{kind:opencog_style_utility,convention:classic_stv,
      label:"Classic STV-style utility (observational)",available:Available,
      strength:Strength,confidence:Confidence,k:K,evidence:Evidence,reference:Reference,
      positiveMeaning:"A distinct rule application present in at least one actually returned proof.",
      negativeMeaning:"An exhausted application absent from all returned proofs of a fully exhausted query.",
      confidenceMeaning:"Historical OpenCog count transform, not a calibrated probability or independent-sample guarantee.",
      use:"Optional observational display only; never truth, inference order, pruning, or a rule weight."}.

entry_report(entry(Identity,Generation,C,_),Row) :-
    C=counters(Calls,Results,Productive,Exhausted,Cut,Interrupted,Dead,Answers,Occurrences,W,CPU,I),
    ratio(Results,Calls,Yield),ratio(Productive,Calls,ProductiveRate),
    Row=Identity.put(telemetry{generation:Generation,observed:true,
      calls:Calls,results:Results,productiveCalls:Productive,
      exhaustedCalls:Exhausted,cutCalls:Cut,interruptedCalls:Interrupted,
      zeroResultExhaustedCalls:Dead,answersHelped:Answers,proofOccurrences:Occurrences,
      resultsPerCall:Yield,productiveCallFraction:ProductiveRate,
      inclusiveCost:telemetry{wallSeconds:W,cpuSeconds:CPU,inferences:I}}).
ratio(_,0,null) :- !.
ratio(N,D,R) :- R is N/D.

merge_completed(Epoch,Outcome,Rules,Status) :-
    with_mutex(powder_rule_utility,
      transaction((lifetime(Current,_,_),
       (Epoch==Current->
         retract(completed_queries(N)),N1 is N+1,assertz(completed_queries(N1)),
         dropped_aggregates(Before),
         get_time(Now),maplist(merge_rule(Outcome,Now),Rules),
         dropped_aggregates(After),
         (After>Before->Status=partial_capacity;Status=completed)
       ;Status=discarded_after_reset)))).
merge_rule(Outcome,Now,Row) :-
    Key=key(Row.id,Row.contentHash,Row.generation),
    (retract(aggregate(Key,Old))->
      sum_rows(Old,Row,Combined),N is Old.queriesObserved+1,
      partial_increment(Outcome,Old.partialQueries,P),
      New=Combined.put(telemetry{queriesObserved:N,partialQueries:P,lastObserved:Now}),
      assertz(aggregate(Key,New))
    ;aggregate_count(Count),capacity(Max),
     (Count<Max->
       partial_increment(Outcome,0,P),
       New=Row.put(telemetry{queriesObserved:1,partialQueries:P,firstObserved:Now,lastObserved:Now}),
       assertz(aggregate(Key,New))
     ;retract(dropped_aggregates(D)),D1 is D+1,assertz(dropped_aggregates(D1)))).
aggregate_count(Count) :- aggregate_all(count,aggregate(_,_),Count).
partial_increment(exhausted,P,P) :- !.
partial_increment(_,P,N) :- N is P+1.
sum_rows(Old,Row,Combined) :-
    foldl(sum_field(Old,Row),
      [calls,results,productiveCalls,exhaustedCalls,cutCalls,interruptedCalls,
       zeroResultExhaustedCalls,answersHelped,proofOccurrences],Old,Summed),
    foldl(sum_field(Old.inclusiveCost,Row.inclusiveCost),
      [wallSeconds,cpuSeconds,inferences],Old.inclusiveCost,Cost),
    ratio(Summed.results,Summed.calls,Yield),
    ratio(Summed.productiveCalls,Summed.calls,Productive),
    sum_evidence(Old,Row,Evidence),
    Combined=Summed.put(telemetry{inclusiveCost:Cost,resultsPerCall:Yield,
      productiveCallFraction:Productive,applicationEvidence:Evidence}).
sum_field(A,B,K,D0,D) :- get_dict(K,A,X),get_dict(K,B,Y),N is X+Y,put_dict(K,D0,N,D).

capabilities(telemetry{kind:observational,execution:"native guarded <=== rules only",
  answers:"Distinct variant (microtheory, bindings) per query; summed across queries, not global distinct answers.",
  calls:"After native head unification and MT acceptance; one call can yield multiple results.",
  rates:"Results/call is a yield, not a probability. Productive fraction is observed-prefix only.",
  cost:"Inclusive active execution spans; paused at each local result, resumed on redo. Nested/recursive costs overlap: never sum as query time.",
  precision:"SWI walltime milliseconds, thread CPU platform resolution, thread inference deltas; instrumentation and nested bookkeeping add overhead.",
  coverage:"Only completed query invocations aggregate. Limits/cuts/interruption observe prefixes; exceptions return no answers. No extra solution is probed to detect exhaustion.",
  applicationEvidence:"Per entered application, attributed through private returned-proof tokens. Positives deduplicated per application; negatives require full query and application exhaustion. Other applications are unknown; legacy rows are unavailable.",
  replay:"Tabling and cached-proof replay are unsupported, not measured as zero.",
  retention:"4096 query rule identities, 16384 transient application records, and 4096 cumulative ID/content/generation identities; excess is explicit. No event/binding log or persisted proof tokens."}).

rule_detail(Id,Generation,Modules,Detail) :-
    must_be(atom,Id),must_be(list,Modules),
    rule_list(Generation,Modules,[id(Id),limit(1000)],Page),
    Detail=telemetry{id:Id,items:Page.items,total:Page.total,lifetime:Page.lifetime,
             measurement:Page.measurement}.

rule_list(Generation,Modules,Options,Page) :-
    valid_generation(Generation),must_be(list,Modules),maplist(must_be(atom),Modules),
    option(offset(Offset),Options,0),must_be(nonneg,Offset),
    option(limit(Limit),Options,50),must_be(between(1,1000),Limit),
    option(sort(Sort),Options,calls),
    (memberchk(Sort,[calls,results,answersHelped,proofOccurrences,wallSeconds,cpuSeconds,inferences,id])->
      true;throw(error(domain_error(rule_utility_sort,Sort),_))),
    option(id(Id),Options,any),must_be(atom,Id),
    current_rules(Modules,Id,Current),
    with_mutex(powder_rule_utility,
      (findall(Row,(aggregate(_,Row),(Id==any;Row.id==Id)),Saved),
       lifetime(Epoch,Started,_),completed_queries(Queries),dropped_aggregates(Dropped))),
    maplist(classify_row(Generation,Current),Saved,Historical),
    findall(Row,(member(Identity,Current),
      \+ (member(Existing,Saved),Existing.id==Identity.id,
          Existing.contentHash==Identity.contentHash,Existing.generation==Generation),
      unobserved(Identity,Generation,Row)),Unobserved),
    append(Historical,Unobserved,Rows),
    map_list_to_pairs(rank_key(Sort),Rows,Pairs),keysort(Pairs,Sorted),
    pairs_values(Sorted,Ordered),length(Ordered,Total),slice(Ordered,Offset,Limit,Items),
    capabilities(Measurement),
    Page=telemetry{items:Items,total:Total,offset:Offset,limit:Limit,sort:Sort,
      lifetime:telemetry{epoch:Epoch,startedAt:Started,completedQueries:Queries,
                 droppedRuleAggregates:Dropped},measurement:Measurement}.

current_rules(Modules,Id,Current) :-
    findall(Identity,(member(Module,Modules),
      kb_runtime:module_assertion(Module,RuleId,(_:-_),_),
      (Id==any;RuleId==Id),rule_identity(Module,RuleId,Identity)),Identities),
    sort(Identities,Current).
classify_row(Generation,Current,Row,Classified) :-
    (member(I,Current),I.id==Row.id,I.contentHash==Row.contentHash->
      (Row.generation==Generation->IdentityState=current;IdentityState=prior_generation)
    ;IdentityState=stale),
    (Row.partialQueries>0->Coverage=partial;Coverage=observed_queries),
    Classified=Row.put(telemetry{identityState:IdentityState,coverage:Coverage}).
unobserved(Identity,Generation,Row) :-
    Row=Identity.put(telemetry{generation:Generation,identityState:current,observed:false,
      coverage:unobserved,calls:null,results:null,productiveCalls:null,
      exhaustedCalls:null,cutCalls:null,interruptedCalls:null,zeroResultExhaustedCalls:null,
      answersHelped:null,proofOccurrences:null,resultsPerCall:null,productiveCallFraction:null,
      inclusiveCost:telemetry{wallSeconds:null,cpuSeconds:null,inferences:null},
      queriesObserved:0,partialQueries:0,firstObserved:null,lastObserved:null}).
rank_key(id,Row,Row.id-Row.contentHash-Row.generation) :- !.
rank_key(Sort,Row,Key) :-
    (get_dict(Sort,Row,N)->true;get_dict(Sort,Row.inclusiveCost,N)),
    (number(N)->Missing=0,Rank is -N;Missing=1,Rank=0),
    Key=Missing-Rank-Row.id-Row.contentHash-Row.generation.
slice(_,_,0,[]) :- !.
slice([],_,_,[]) :- !.
slice([_|Rest],Offset,Limit,Items) :- Offset>0,!,Next is Offset-1,slice(Rest,Next,Limit,Items).
slice([Item|Rest],0,Limit,[Item|Items]) :- Next is Limit-1,slice(Rest,0,Next,Items).

export_telemetry(Snapshot) :-
    with_mutex(powder_rule_utility,
      (lifetime(Epoch,Started,Revision),completed_queries(Queries),dropped_aggregates(Dropped),
       findall(Row,aggregate(_,Row),Rows))),
    Snapshot=rule_telemetry{schema:1,epoch:Epoch,startedAt:Started,revision:Revision,
      completedQueries:Queries,droppedRuleAggregates:Dropped,rows:Rows}.
import_telemetry(Snapshot) :-
    must_be(ground,Snapshot),must_be(dict,Snapshot),
    Snapshot.schema==1,must_be(atom,Snapshot.epoch),must_be(number,Snapshot.startedAt),
    must_be(nonneg,Snapshot.revision),must_be(nonneg,Snapshot.completedQueries),
    must_be(nonneg,Snapshot.droppedRuleAggregates),must_be(list,Snapshot.rows),
    length(Snapshot.rows,Count),capacity(Max),
    (Count=<Max->true;throw(error(resource_error(rule_telemetry_capacity),_))),
    maplist(validate_import_row,Snapshot.rows),
    findall(Key,(member(R,Snapshot.rows),Key=key(R.id,R.contentHash,R.generation)),Keys),
    sort(Keys,Unique),
    (same_length(Keys,Unique)->true;throw(error(domain_error(unique_telemetry_identities,Keys),_))),
    with_mutex(powder_rule_utility,
      transaction((
        retractall(aggregate(_,_)),retractall(lifetime(_,_,_)),
        retractall(completed_queries(_)),retractall(dropped_aggregates(_)),
        assertz(lifetime(Snapshot.epoch,Snapshot.startedAt,Snapshot.revision)),
        assertz(completed_queries(Snapshot.completedQueries)),
        assertz(dropped_aggregates(Snapshot.droppedRuleAggregates)),
        forall(member(R,Snapshot.rows),assertz(aggregate(key(R.id,R.contentHash,R.generation),R)))
      ))).
validate_import_row(R) :-
    must_be(dict,R),must_be(atom,R.id),must_be(atom,R.contentHash),
    must_be(atom,R.predicate),must_be(nonneg,R.arity),
    valid_generation(R.generation),
    forall(member(K,[calls,results,productiveCalls,exhaustedCalls,cutCalls,interruptedCalls,
      zeroResultExhaustedCalls,answersHelped,proofOccurrences,queriesObserved,partialQueries]),
      (get_dict(K,R,N),must_be(nonneg,N))),
    forall(member(K,[wallSeconds,cpuSeconds,inferences]),
      (get_dict(K,R.inclusiveCost,N),must_be(number,N),N>=0)),
    must_be(number,R.firstObserved),must_be(number,R.lastObserved),
    % Reconstructible rates are checked, not trusted executable metadata.
    ratio(R.results,R.calls,Yield),Yield==R.resultsPerCall,
    ratio(R.productiveCalls,R.calls,Rate),Rate==R.productiveCallFraction,
    (get_dict(applicationEvidence,R,E)->
      E.schema==1,must_be(nonneg,E.positiveApplications),must_be(nonneg,E.negativeApplications),
      must_be(nonneg,E.unknownApplications),must_be(nonneg,E.trials),
      E.trials=:=E.positiveApplications+E.negativeApplications,
      R.calls=:=E.trials+E.unknownApplications,
      evidence_counts(E.positiveApplications,E.negativeApplications,E.unknownApplications,Expected),
      E==Expected
    ;true).
