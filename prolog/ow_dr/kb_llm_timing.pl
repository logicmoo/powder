:- module(kb_llm_timing,
          [begin_run/2,with_run/2,phase/1,phase/2,instant/1,bind_turn/2,
           queue_entered/3,queue_link/3,queue_started/1,queue_cancelled/2,queue_elapsed/3,
           checkpoint/4,finish/1,fail_run/3,conversation_timing/2,latest_terminal/2,supported/1]).
:- use_module(library(shlib)).
:- use_module(library(lists)).
:- dynamic observation/3,queued_clock/4,clock_directory/1.
:- volatile observation/3,queued_clock/4.
:- thread_local active_run/1.
:- meta_predicate with_run(+,0),observe(0).
:- prolog_load_context(directory,Directory),retractall(clock_directory(_)),assertz(clock_directory(Directory)).
:- initialization(load_clock).

load_clock :- current_predicate(monotonic_milliseconds/1),!.
load_clock :-
    clock_directory(Directory),current_prolog_flag(shared_object_extension,Extension),
    file_name_extension(kb_llm_clock,Extension,Name),directory_file_path(Directory,Name,File),
    (exists_file(File)->catch(load_foreign_library(File),_,true);true).
supported(true) :- current_predicate(monotonic_milliseconds/1),!.
supported(false).
wall_stamp(Wall) :- get_time(Wall).
stamp(Mono,Wall) :- monotonic_milliseconds(Mono),wall_stamp(Wall).
text(Value,Text) :- (string(Value)->Text=Value;atom(Value),atom_string(Value,Text)).
observe(Goal) :-
    (supported(true)->catch((once(Goal)->true;true),Error,observation_error(Error));true).
observation_error(llm_cancelled) :- !,throw(llm_cancelled).
observation_error(time_limit_exceeded) :- !,throw(time_limit_exceeded).
observation_error(unwind(Reason)) :- !,throw(unwind(Reason)).
observation_error(_).
with_run(Run,Goal) :-
    setup_call_cleanup(asserta(active_run(Run),Ref),Goal,erase(Ref)).
begin_run(Conversation,Run) :-
    observe((text(Conversation,Id),text(Run,Key),stamp(Mono,Wall),
      with_mutex(powder_llm_timing,
        (observation(Id,Key,_)->true;
         State=timing_state{runId:Key,conversationId:Id,turn:null,queueCallId:null,
           queueEnteredAt:null,queueWaitMs:null,startedAt:Wall,runStartedAt:Wall,
           startMono:Mono,runMono:Mono,finishedAt:null,endMono:null,observedAt:Wall,
           status:"running",terminalStatus:null,result:null,steps:[],nextIndex:1,truncated:false,
           current:timing_step{index:0,operation:"admission",startedAt:Wall,startMono:Mono}},
         assertz(observation(Id,Key,State)))))).
phase(Operation) :- (active_run(Run)->phase(Run,Operation);true).
phase(Run,Operation) :-
    observe((operation(Operation),text(Run,Key),stamp(Mono,Wall),
      with_mutex(powder_llm_timing,transaction(
        (observation(Id,Key,Before),Before.status=="running",
         close_step(Before,Mono,Wall,Closed),text(Operation,Name),
         Next is Closed.nextIndex+1,
         After=Closed.put(_{current:timing_step{index:Closed.nextIndex,operation:Name,
           startedAt:Wall,startMono:Mono},nextIndex:Next,observedAt:Wall}),
         replace(Id,Key,After)))))).
instant(Operation) :-
    (active_run(Run)->
      observe((operation(Operation),text(Run,Key),stamp(Mono,Wall),
        with_mutex(powder_llm_timing,transaction(
          (observation(Id,Key,Before),Before.status=="running",
           close_step(Before,Mono,Wall,Closed),text(Operation,Name),
           Point=timing_step{index:Closed.nextIndex,operation:Name,startedAt:Wall,
                            finishedAt:Wall,durationMs:0,kind:"instant"},
           add_step(Closed,Point,Added),Next is Closed.nextIndex+1,
           replace(Id,Key,Added.put(_{nextIndex:Next,current:null,observedAt:Wall})))))));true).
operation(Name) :-
    memberchk(Name,[admission,disclosure_validation,request_preparation,admission_persistence,
      worker_wait,context_preparation,outgoing_validation,request_encoding,http_dispatch,
      endpoint_wait,response_read,response_decode,reply_validation,reply_persistence,
      tool_validation,tool_reservation,tool_execution,tool_receipt_persistence,tool_history_persistence,
      terminal_persistence,context_cleanup,cancellation]).
close_step(S,Mono,Wall,After) :-
    (S.current==null->After=S;
     Step=S.current,Duration is max(0,Mono-Step.startMono),
     Closed=timing_step{index:Step.index,operation:Step.operation,startedAt:Step.startedAt,
                       finishedAt:Wall,durationMs:Duration,kind:"interval"},
     add_step(S,Closed,WithStep),After=WithStep.put(current,null)).
add_step(S,Step,After) :-
    length(S.steps,N),
    (N<512->append(S.steps,[Step],Steps),After=S.put(steps,Steps);After=S.put(truncated,true)).
replace(Id,Run,State) :-
    ground(State),retractall(observation(Id,Run,_)),assertz(observation(Id,Run,State)).
bind_turn(Run,Turn) :-
    observe((integer(Turn),text(Run,Key),with_mutex(powder_llm_timing,transaction(
      (observation(Id,Key,S),replace(Id,Key,S.put(turn,Turn))))))).
queue_entered(Conversation,CallId,_CreatedAt) :-
    observe((text(Conversation,Id),text(CallId,Key),stamp(Mono,Wall),
      with_mutex(powder_llm_timing,
        (queued_clock(Id,Key,_,_)->true;
         assertz(queued_clock(Id,Key,Mono,Wall)),prune_queues)))).
prune_queues :-
    findall(Id-Key,queued_clock(Id,Key,_,_),Entries),
    (length(Entries,N),N>512,Entries=[Id-Key|_]->retractall(queued_clock(Id,Key,_,_));true).
queue_link(Run,CallId,EnteredAt) :-
    observe((text(Run,Key),text(CallId,Call),
      with_mutex(powder_llm_timing,transaction(
        (observation(Id,Key,S),S.queueCallId==null,
         (queued_clock(Id,Call,Mono,Wall)->
            Wait is max(0,S.runMono-Mono),
            Step=timing_step{index:0,operation:"queue_wait",startedAt:Wall,
                            finishedAt:S.runStartedAt,durationMs:Wait,kind:"interval"},
            maplist(shift_index,S.steps,Shifted),Steps=[Step|Shifted],
            (S.current==null->Current=null;shift_index(S.current,Current)),
            Index is S.nextIndex+1,
            Linked=S.put(_{queueCallId:Call,queueEnteredAt:EnteredAt,queueWaitMs:Wait,
              startMono:Mono,startedAt:Wall,steps:Steps,current:Current,nextIndex:Index});
          Linked=S.put(_{queueCallId:Call,queueEnteredAt:EnteredAt})),
         replace(Id,Key,Linked)))))).
shift_index(S,After) :- Index is S.index+1,After=S.put(index,Index).
queue_started(Run) :-
    observe((text(Run,Key),with_mutex(powder_llm_timing,
      (observation(Id,Key,S),retractall(queued_clock(Id,S.queueCallId,_,_)))))).
queue_cancelled(Conversation,CallId) :-
    observe((text(Conversation,Id),text(CallId,Key),
      with_mutex(powder_llm_timing,retractall(queued_clock(Id,Key,_,_))))).
queue_elapsed(Conversation,CallId,Elapsed) :-
    (supported(true),text(Conversation,Id),text(CallId,Key),
     with_mutex(powder_llm_timing,queued_clock(Id,Key,Start,_))->
       monotonic_milliseconds(Now),Elapsed is max(0,Now-Start);Elapsed=null).

checkpoint(Run,Status,Result,Snapshot) :-
    catch((checkpoint_observed(Run,Status,Result,Observed)->Snapshot=Observed;Snapshot=null),
      Error,(observation_error(Error),Snapshot=null)).
checkpoint_observed(Run,Status,Result,Snapshot) :-
    text(Run,Key),text(Status,StatusText),text(Result,ResultText),
    (supported(true),
     with_mutex(powder_llm_timing,transaction(
       (observation(Id,Key,Before),Before.status=="running",
        After=Before.put(_{terminalStatus:StatusText,result:ResultText}),
        replace(Id,Key,After))))->
       snapshot(After,Live),
       Snapshot=Live.put(_{status:StatusText,source:"checkpoint",live:false,complete:false});
     Snapshot=null).
fail_run(Run,Status,Result) :-
    observe(checkpoint(Run,Status,Result,_)),finish(Run).
finish(Run) :-
    observe((text(Run,Key),stamp(Mono,Wall),
      with_mutex(powder_llm_timing,transaction(
        (observation(Id,Key,Before),Before.status=="running",
         close_step(Before,Mono,Wall,Closed),
         (Before.terminalStatus==null->Status="outcome_unknown";Status=Before.terminalStatus),
         After=Closed.put(_{status:Status,finishedAt:Wall,endMono:Mono,observedAt:Wall}),
         replace(Id,Key,After),prune_finished))))).
prune_finished :-
    findall(End-(Id-Run),(observation(Id,Run,S),S.status\=="running",End=S.endMono),Entries),
    keysort(Entries,Sorted),length(Sorted,N),Drop is max(0,N-64),
    forall((nth0(I,Sorted,_-(Id-Run)),I<Drop),retractall(observation(Id,Run,_))).
snapshot(S,Trace) :-
    (S.status=="running"->stamp(Mono,Wall),Live=true,Complete=false;
     Mono=S.endMono,Wall=S.observedAt,Live=false,Complete=true),
    Elapsed is max(0,Mono-S.startMono),RunElapsed is max(0,Mono-S.runMono),
    (S.current==null->Current=null;
     Step=S.current,StepElapsed is max(0,Mono-Step.startMono),
     Current=timing_step{index:Step.index,operation:Step.operation,startedAt:Step.startedAt,
                        elapsedMs:StepElapsed}),
    Trace=timing{runId:S.runId,turn:S.turn,queueCallId:S.queueCallId,
      queueEnteredAt:S.queueEnteredAt,queueWaitMs:S.queueWaitMs,
      status:S.status,result:S.result,startedAt:S.startedAt,runStartedAt:S.runStartedAt,
      finishedAt:S.finishedAt,observedAt:Wall,elapsedMs:Elapsed,runElapsedMs:RunElapsed,
      currentStep:Current,steps:S.steps,truncated:S.truncated,complete:Complete,live:Live,source:"memory"}.
latest_terminal(Conversation,Trace) :-
    text(Conversation,Id),
    with_mutex(powder_llm_timing,
      (findall(End-S,(observation(Id,_,S),S.status\=="running",End=S.endMono),Pairs),
       keysort(Pairs,Sorted),last(Sorted,_-State))),
    snapshot(State,Trace).
conversation_timing(D,Timing) :-
    catch(conversation_timing_observed(D,Timing),Error,
      (observation_error(Error),
       Timing=timing{supported:false,clock:null,current:null,last:null,queued:[]})).
conversation_timing_observed(D,Timing) :-
    supported(Supported),text(D.id,Id),
    with_mutex(powder_llm_timing,
      findall(M-S,(observation(Id,_,S),S.status=="running",M=S.runMono),Pairs)),
    (current_state(D,Pairs,State)->snapshot(State,Current);Current=null),
    (latest_terminal(Id,Terminal)->Last=Terminal;
     get_dict(lastTiming,D,Saved),Saved\==null,
     different_current(Current,Saved)->
       (Saved.complete==true->Source="persisted";Source="checkpoint"),
       Last=Saved.put(_{source:Source,live:false});
     Last=null),
    (get_dict(queue,D,Q)->
       findall(timing_queue{callId:CallId,elapsedMs:Elapsed},
         (member(Item,Q.items),Item.status=="queued",CallId=Item.callId,
          queue_elapsed(Id,CallId,Elapsed)),Queued);Queued=[]),
    (Supported==true->Clock="native_monotonic_milliseconds";Clock=null),
    Timing=timing{supported:Supported,clock:Clock,
                  current:Current,last:Last,queued:Queued}.
current_state(D,Pairs,State) :-
    (D.activeTurn\==null->member(_-State,Pairs),State.runId==D.activeTurn;
     Pairs\=[],keysort(Pairs,Sorted),last(Sorted,_-State)).
different_current(null,_) :- !.
different_current(Current,Saved) :-
    get_dict(runId,Current,CurrentRun),get_dict(runId,Saved,SavedRun),CurrentRun\==SavedRun.
