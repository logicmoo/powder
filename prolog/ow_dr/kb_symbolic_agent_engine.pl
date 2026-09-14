:- module(kb_symbolic_agent_engine,[step/5,form_field/4,form_values/3]).
:- use_module(kb_symbolic_agent_program,[]).
:- use_module(kb_symbolic_agent_language,[]).
:- use_module(kb_symbolic_agent_wire,[]).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(option)).
:- use_module(library(solution_sequences)).
:- use_module(library(time)).

step(Program,Before,Input,Options,Result) :-
    must_be(dict,Before),must_be(nonvar,Input),
    (Before.program==Program.version,Before.agent==Program.agent->true;
      throw(error(symbolic_program_conflict,_))),
    limits(Options,Limits),copy_term(Before-Input,State-Event),
    catch(
      call_with_time_limit(Limits.seconds,
        advance(Program,State,Event,Limits,After,Effects,Events)),
      Error,step_error(Error,Before,After,Effects,Events)),
    Result=step_result{state:After,effects:Effects,events:Events}.

limits(Options,limits{steps:Steps,actions:Actions,seconds:Seconds}) :-
    must_be(list,Options),option(steps(Steps),Options,128),
    option(actions(Actions),Options,16),option(seconds(Seconds),Options,2),
    bounded(Steps,1,1024,steps),bounded(Actions,0,64,actions),must_be(number,Seconds),
    (Seconds>=0.01,Seconds=<10->true;domain_error(symbolic_run_seconds,Seconds)),
    forall(member(O,Options),
      (nonvar(O),(O=steps(_);O=actions(_);O=seconds(_))->true;domain_error(symbolic_run_option,O))).
bounded(N,Min,Max,Kind) :-
    must_be(integer,N),(between(Min,Max,N)->true;domain_error(symbolic_run_limit,Kind-N)).

advance(_,State,stop,_,After,[],[control(stopped)]) :- !,
    After=State.put(phase,stopped).
advance(_,State,interrupt,_,After,[],[control(interrupted)]) :- !,
    After=State.put(phase,interrupted).
advance(Program,State,resume,Limits,After,Effects,Events) :- !,
    (State.phase==interrupted,State.pending==none->
      execute(Program,State.put(phase,running),Limits,After,Effects,Events);
      State.phase==interrupted,State.pending=form(_,_,_)->
        After=State.put(phase,awaiting_form),Effects=[],Events=[control(resumed)];
      State.phase==interrupted,State.pending=approval(_,_,_)->
        After=State.put(phase,awaiting_approval),Effects=[],Events=[control(resumed)];
      throw(error(symbolic_resume_requires_resolved_action,_))).
advance(_,State,form(Form,Values),_,After,[],[form_completed(Form)]) :- !,
    (State.phase==awaiting_form,State.pending=form(Expected,Fields,Pattern),Form==Expected->true;
      throw(error(symbolic_form_invalid(unexpected_form),_))),
    form_values(Fields,Values,Bound),
    (unify_with_occurs_check(Pattern,Bound)->true;
      throw(error(symbolic_form_invalid(binding_shape),_))),
    After=State.put(_{pending:none,phase:running}).
% This input is exclusively for a trusted host that has verified a real human
% approval receipt. Text/event input never becomes this control message.
advance(_,State,host_approval(Key,Choice,Receipt),_,After,[],[approval_received(Key,Choice,Receipt)]) :- !,
    (State.phase==awaiting_approval,State.pending=approval(Expected,Choices,Pattern),Key==Expected,
     string(Receipt),string_length(Receipt,N),N>0,ground(Choice),memberchk(Choice,Choices)->true;
      throw(error(symbolic_approval_mismatch,_))),
    (unify_with_occurs_check(Pattern,Choice)->true;throw(error(symbolic_approval_mismatch,_))),
    After=State.put(_{pending:none,phase:running}).
advance(_,State,action_result(Id,Outcome),_,After,[],Events) :- !,
    must_be(ground,Id-Outcome),
    (memberchk(State.phase,[awaiting_action,stopped,interrupted]),State.pending=call(Id,Pattern)->true;
      throw(error(symbolic_action_result_mismatch(Id),_))),
    action_result(Outcome,Pattern,State,Completed,Events),
    (memberchk(State.phase,[stopped,interrupted])->After=Completed.put(phase,State.phase);After=Completed).
advance(Program,State,continue,Limits,After,Effects,Events) :- !,
    (memberchk(State.phase,[running,compensating])->true;throw(error(symbolic_not_running,_))),
    execute(Program,State,Limits,After,Effects,Events).
advance(Program,State,text(Text),Limits,After,Effects,Events) :- !,
    input_ready(State),
    kb_symbolic_agent_language:interpret(Program.language,Text,[],Language),
    language_event(Language,Text,Event,LanguageEvidence),
    dispatch(Program,State,Event,Limits,After,Effects,Tail),
    Events=[language(Language.status,LanguageEvidence)|Tail].
advance(Program,State,event(Event),Limits,After,Effects,Events) :- !,
    input_ready(State),must_be(ground,Event),
    dispatch(Program,State,x_symbolicInput(Event),Limits,After,Effects,Events).
advance(_,_,Input,_,_,_,_) :- domain_error(symbolic_agent_input,Input).

input_ready(State) :-
    (memberchk(State.phase,[awaiting_input,gap])->true;throw(error(symbolic_not_awaiting_input,_))).
language_event(Language,_,Event,Proof) :-
    Language.status==interpreted,Language.complete==true,Language.candidates=[Candidate],!,
    Event=x_symbolicUtterance(Candidate.term),Proof=Candidate.proof.
language_event(Language,_,x_symbolicAmbiguous(Meanings),[]) :-
    Language.status==ambiguous,!,
    findall(M,(member(C,Language.candidates),M=C.term),Values),Meanings=..[x_TheList|Values].
language_event(Language,Text,x_symbolicLanguageGap(Language.status,Text),[]).

dispatch(Program,State,Event,Limits,After,Effects,Events) :-
    once(findnsols(17,choice(Plan,[Id|Proof]),
      (kb_symbolic_agent_program:fact(Program,Program.mts.dialogueMt,
         x_symbolicDialogueRule(Fsm,Pattern,Condition,Plan),Id),
       unify_with_occurs_check(Fsm-Pattern,State.fsm-Event),
       kb_symbolic_agent_program:condition(Program,Condition,true,Proof)),Choices)),
    choose(Choices,Choice),
    (Choice=selected(Plan,Proof)->
      execute(Program,State.put(_{phase:running,queue:[Plan],pending:none}),Limits,After,Effects,Tail),
      Events=[dialogue_proof(Proof)|Tail]
    ;After=State.put(phase,gap),Effects=[],Events=[gap(Choice,Event)]).
choose([],no_applicable_rule).
choose([choice(Plan,Proof)],selected(Plan,Proof)) :- !.
choose([_,_|_],ambiguous_plan).

execute(_,State,_,After,[],[]) :-
    State.queue==[],!,
    (State.phase==failed->Phase=failed;
      State.compensating==true->Phase=failed;Phase=awaiting_input),
    After=State.put(_{phase:Phase,pending:none,compensations:[]}).
execute(Program,State,Limits,After,Effects,Events) :-
    (State.steps<Limits.steps->true;throw(error(symbolic_budget(steps),_))),
    State.queue=[Instruction|Rest],NextSteps is State.steps+1,
    Current=State.put(_{queue:Rest,steps:NextSteps}),
    instruction(Instruction,Program,Current,Limits,Next,Effects0,Events0),
    (memberchk(Next.phase,[awaiting_action,awaiting_approval,awaiting_form,gap,failed,stopped,interrupted])->
      After=Next,Effects=Effects0,Events=Events0
    ;execute(Program,Next,Limits,After,Effects1,Events1),
      append(Effects0,Effects1,Effects),append(Events0,Events1,Events)).

instruction(Instruction,_,_,_,_,_,_) :- var(Instruction),!,instantiation_error(Instruction).
instruction(x_symbolicSequence(Sequence),_,State,_,Next,[],[]) :- !,
    kb_symbolic_agent_program:sequence(Sequence,Steps),append(Steps,State.queue,Queue),
    Next=State.put(queue,Queue).
instruction(x_symbolicSetState(Fsm),_,State,_,Next,[],[state(Fsm)]) :- !,
    must_be(ground,Fsm),Next=State.put(fsm,Fsm).
instruction(x_symbolicGoal(Goal),_,State,_,Next,[],[goal_added(Goal)]) :- !,
    must_be(ground,Goal),
    (memberchk(Goal,State.goals)->Goals=State.goals;append(State.goals,[Goal],Goals)),
    Next=State.put(goals,Goals).
instruction(x_symbolicCompleteGoal(Goal),_,State,_,Next,[],[goal_completed(Goal)]) :- !,
    must_be(ground,Goal),exclude(==(Goal),State.goals,Goals),Next=State.put(goals,Goals).
instruction(x_symbolicSay(Call),Program,State,_,State,[],Events) :- !,
    kb_symbolic_agent_program:render_template(Program,Call,[],Rendered),
    Events=[text(Rendered.text,Rendered.proof)].
instruction(x_symbolicIf(Condition,Then,Else),Program,State,_,Next,[],[condition(Truth,Proof)]) :- !,
    kb_symbolic_agent_program:condition(Program,Condition,Truth,Proof),
    (Truth==true->Branch=Then;Truth==false->Branch=Else;
      throw(error(symbolic_condition_gap(Truth),_))),
    Next=State.put(queue,[Branch|State.queue]).
instruction(x_symbolicTask(Task),Program,State,_,Next,[],[plan_proof(Proof)]) :- !,
    must_be(ground,Task),
    once(findnsols(17,choice(Plan,[Id|Evidence]),
      (kb_symbolic_agent_program:fact(Program,Program.mts.plansMt,
         x_symbolicPlan(Task,Condition,Plan),Id),
       kb_symbolic_agent_program:condition(Program,Condition,true,Evidence)),Choices)),
    choose(Choices,Chosen),
    (Chosen=selected(Plan,Proof)->Next=State.put(queue,[Plan|State.queue]);
      throw(error(symbolic_plan_gap(Chosen,Task),_))).
instruction(x_symbolicOnError(Plan),_,State,_,Next,[],[]) :- !,
    Next=State.put(compensations,[Plan|State.compensations]).
instruction(x_symbolicAwaitForm(Form,Sequence,Pattern),_,State,_,Next,[],[form_requested(Form,Fields)]) :- !,
    must_be(ground,Form),kb_symbolic_agent_program:sequence(Sequence,Fields),
    valid_fields(Fields),
    Next=State.put(_{phase:awaiting_form,pending:form(Form,Fields,Pattern)}).
instruction(x_symbolicAwaitApproval(Key,Sequence,Pattern),_,State,_,Next,[],[approval_requested(Key,Choices)]) :- !,
    must_be(ground,Key),kb_symbolic_agent_program:sequence(Sequence,Choices),
    must_be(ground,Choices),length(Choices,N),bounded(N,1,16,approval_choices),
    sort(Choices,Unique),
    (same_length(Choices,Unique)->true;domain_error(duplicate_symbolic_choices,Choices)),
    Next=State.put(_{phase:awaiting_approval,pending:approval(Key,Choices,Pattern)}).
instruction(x_symbolicInvoke(Capability,Arguments,Pattern),Program,State,Limits,Next,[Intent],[]) :- !,
    must_be(string,Capability),
    (memberchk(Capability,Program.allowedCapabilities)->true;
      throw(error(symbolic_policy_denied(Capability),_))),
    (State.actions<Limits.actions->true;throw(error(symbolic_budget(actions),_))),
    kb_symbolic_agent_wire:json_arguments(Arguments,JSON),
    validate_result_pattern(Pattern),
    Number is State.actions+1,format(atom(Id),'action-~d',[Number]),
    Intent=intent{id:Id,capability:Capability,arguments:JSON},
    Next=State.put(_{phase:awaiting_action,pending:call(Id,Pattern),actions:Number}).
instruction(Instruction,_,_,_,_,_,_) :- domain_error(symbolic_plan_instruction,Instruction).

action_result(ok(Value),Pattern,State,Next,Events) :- !,
    (bind_result(Pattern,Value)->
      Next=State.put(_{pending:none,phase:running}),Events=[action_completed(Value)]
    ;Next=State.put(_{pending:none,phase:gap,queue:[],compensations:[]}),
      Events=[action_completed(Value),gap(result_binding,mismatched_result)]).
action_result(error(Reason),_,State,Next,[action_failed(Reason)]) :- !,
    (State.compensating==false,State.compensations\=[]->
      Next=State.put(_{pending:none,phase:compensating,compensating:true,
                      queue:State.compensations,compensations:[]})
    ;Next=State.put(_{pending:none,phase:failed,queue:[]})).
action_result(Outcome,_,_,_,_) :- domain_error(symbolic_action_outcome,Outcome).

validate_result_pattern(Pattern) :- var(Pattern),!.
validate_result_pattern(x_symbolicResultFields(Sequence)) :- !,
    kb_symbolic_agent_program:sequence(Sequence,Fields),
    length(Fields,N),bounded(N,1,32,result_fields),maplist(valid_result_field,Fields).
validate_result_pattern(_).
valid_result_field(Field) :-
    (nonvar(Field),Field=x_symbolicResultField(Sequence,_)->true;
      domain_error(symbolic_result_field,Field)),
    kb_symbolic_agent_program:sequence(Sequence,Path),
    length(Path,N),bounded(N,1,16,result_path),maplist(valid_result_key,Path).
valid_result_key(Key) :-
    (string(Key)->string_length(Key,N),bounded(N,1,128,result_key);
      integer(Key)->bounded(Key,0,4095,result_index);domain_error(symbolic_result_key,Key)).
bind_result(Pattern,Value) :- var(Pattern),!,unify_with_occurs_check(Pattern,Value).
bind_result(x_symbolicResultFields(Sequence),Value) :- !,
    kb_symbolic_agent_program:sequence(Sequence,Fields),maplist(bind_result_field(Value),Fields).
bind_result(Pattern,Value) :- unify_with_occurs_check(Pattern,Value).
bind_result_field(Value,x_symbolicResultField(Sequence,Pattern)) :-
    kb_symbolic_agent_program:sequence(Sequence,Path),result_path(Path,Value,Selected),
    unify_with_occurs_check(Pattern,Selected).
result_path([],Value,Value).
result_path([Key|Rest],Object,Value) :-
    (string(Key)->is_dict(Object),atom_string(Name,Key),get_dict(Name,Object,Next);
      integer(Key),is_list(Object),nth0(Key,Object,Next)),
    result_path(Rest,Next,Value).

valid_fields(Fields) :-
    length(Fields,N),bounded(N,1,32,form_fields),
    maplist(valid_field,Fields,Names),sort(Names,Unique),
    (same_length(Names,Unique)->true;domain_error(duplicate_symbolic_form_fields,Names)).
valid_field(Field,_) :- var(Field),!,instantiation_error(Field).
valid_field(Field,Name) :- form_field(Field,Name,_,_).
form_field(Field,_,_,_) :- var(Field),!,instantiation_error(Field).
form_field(x_symbolicFormField(Name,Type),Name,Type,Limits) :- !,
    field_definition(Name,Type),default_field_limits(Type,Limits).
form_field(x_symbolicFormField(Name,Type,Constraint),Name,Type,Limits) :- !,
    field_definition(Name,Type),
    (ground(Constraint),Type==x_String,Constraint=x_symbolicStringLength(Min,Max),
     integer(Min),integer(Max),between(0,4096,Min),between(Min,4096,Max)->
       Limits=json{minLength:Min,maxLength:Max};
       domain_error(symbolic_form_constraint,Constraint)).
form_field(Field,_,_,_) :- domain_error(symbolic_form_field,Field).
field_definition(Name,Type) :-
    must_be(string,Name),string_length(Name,N),bounded(N,1,128,field_name),
    must_be(nonvar,Type),
    (memberchk(Type,[x_String,x_Number,x_Boolean,x_Term])->true;
      domain_error(symbolic_form_type,Type)).
default_field_limits(x_String,json{minLength:0,maxLength:4096}) :- !.
default_field_limits(_,json{}).
form_values(Fields,Values,Bound) :-
    (is_dict(Values),ground(Values)->true;throw(error(symbolic_form_invalid(object_required),_))),
    dict_pairs(Values,_,Pairs),findall(Key,member(Key-_,Pairs),Keys),
    findall(Key,(member(Field,Fields),form_field(Field,Name,_,_),atom_string(Key,Name)),Expected0),
    sort(Expected0,Expected),
    (Keys==Expected->true;throw(error(symbolic_form_invalid(fields),_))),
    maplist(form_value(Values),Fields,Items),Bound=..[x_TheList|Items].
form_value(Values,Field,x_symbolicFieldValue(Name,Value)) :-
    form_field(Field,Name,Type,Limits),
    atom_string(Key,Name),get_dict(Key,Values,Value),
    (field_type(Type,Value)->true;throw(error(symbolic_form_invalid(type(Name,Type)),_))),
    (Type==x_String->string_length(Value,N),
      (between(Limits.minLength,Limits.maxLength,N)->true;
        throw(error(symbolic_form_invalid(length(Name,Limits.minLength,Limits.maxLength)),_)));
      true).
field_type(x_String,Value) :- string(Value),string_length(Value,N),N=<4096.
field_type(x_Number,Value) :-
    (integer(Value);float(Value),float_class(Value,C),memberchk(C,[zero,subnormal,normal])).
field_type(x_Boolean,Value) :- (Value==true;Value==false).
field_type(x_Term,Value) :-
    ground(Value),acyclic_term(Value),term_size(Value,N),N=<4096.

step_error(time_limit_exceeded,State,After,[],[gap(resource_limit,seconds)]) :- !,
    After=State.put(phase,gap).
step_error(error(symbolic_budget(Kind),_),State,After,[],[gap(resource_limit,Kind)]) :- !,
    After=State.put(phase,gap).
step_error(error(symbolic_condition_gap(Truth),_),State,After,[],[gap(condition,Truth)]) :- !,
    After=State.put(phase,gap).
step_error(error(symbolic_form_invalid(Reason),_),State,State,[],[form_error(Reason)]) :- !.
step_error(Error,_,_,_,_) :- throw(Error).
