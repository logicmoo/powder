:- module(kb_symbolic_agent_program,
          [compile_program/4,initial_state/2,fact/4,condition/4,sequence/2,render_template/4]).
:- use_module(kb_symbolic_agent_language,[]).
:- use_module(library(crypto)).
:- use_module(library(error)).
:- use_module(library(lists)).

compile_program(Input,Agent,DefinitionMt,Program) :-
    must_be(ground,Agent),must_be(ground,DefinitionMt),must_be(list,Input),
    length(Input,N),(N=<8192->true;domain_error(symbolic_program_records,N)),
    maplist(kb_symbolic_agent_language:record_shape,Input),
    findall(Id,member(kb(Id,_,_),Input),Ids),sort(Ids,UniqueIds),
    (same_length(Ids,UniqueIds)->true;throw(error(symbolic_duplicate_assertion_ids,_))),
    findall(Id-kb(Id,Mt,Term),member(kb(Id,Mt,Term),Input),RecordPairs),
    keysort(RecordPairs,Ordered),pairs_values(Ordered,Records),
    (member(kb(_,IdentityMt,x_isa(Who,x_SymbolicTextAgent)),Records),
     IdentityMt==DefinitionMt,Who==Agent->true;
      throw(error(symbolic_configuration_missing(symbolic_identity),_))),
    (member(kb(_,NegativeMt,x_not(x_isa(Negated,x_SymbolicTextAgent))),Records),
     NegativeMt==DefinitionMt,Negated==Agent->
       throw(error(symbolic_identity_inconsistent,_));true),
    findall(Role-Mt,
      (member(kb(_,StoredMt,x_symbolicAgentContext(Declared,Role,Mt)),Records),
       StoredMt==DefinitionMt,Declared==Agent,must_be(ground,Role-Mt)),Contexts),
    forall(member(Role-_,Contexts),
      (role_key(Role,_)->true;domain_error(symbolic_context_role,Role))),
    findall(Key-Mt,
      (role_key(Role,Key),Role\==x_Knowledge,
       findall(Value,member(Role-Value,Contexts),Values),one_value(Key,Values,Mt)),Pairs),
    dict_pairs(Mts,mts,Pairs),
    findall(Mt,member(x_Knowledge-Mt,Contexts),Knowledge0),sort(Knowledge0,Knowledge),
    configured_value(Records,DefinitionMt,x_symbolicStartCategory,Agent,Start),
    configured_value(Records,DefinitionMt,x_symbolicInitialState,Agent,Initial),
    configured_value(Records,Mts.policyMt,x_symbolicCaseMode,Agent,Mode),
    (Mode==x_Sensitive->Case=sensitive;Mode==x_Insensitive->Case=insensitive;
      domain_error(symbolic_case_mode,Mode)),
    findall(Goal,(member(kb(_,GM,x_symbolicInitialGoal(A,Goal)),Records),
      GM==Mts.goalsMt,A==Agent,must_be(ground,Goal)),Goals),
    findall(Cap,(member(kb(_,PM,x_symbolicAllowedCapability(A,Cap)),Records),
      PM==Mts.policyMt,A==Agent,must_be(string,Cap)),Allowed0),sort(Allowed0,Allowed),
    kb_symbolic_agent_language:compile_language(Records,
      profile{lexiconMt:Mts.lexiconMt,grammarMt:Mts.grammarMt,startCategory:Start,caseMode:Case},Language),
    copy_term(Records,Copy),numbervars(Copy,0,_),
    with_output_to(string(Text),write_canonical(Agent-DefinitionMt-Copy)),
    crypto_data_hash(Text,Version,[algorithm(sha256),encoding(utf8)]),
    Program=program{agent:Agent,definitionMt:DefinitionMt,mts:Mts,knowledgeMts:Knowledge,
      language:Language,records:Records,initial:Initial,goals:Goals,
      allowedCapabilities:Allowed,version:Version}.
pairs_values([],[]).
pairs_values([_-Value|Rest],[Value|Values]) :- pairs_values(Rest,Values).

role_key(x_Lexicon,lexiconMt).
role_key(x_Grammar,grammarMt).
role_key(x_Dialogue,dialogueMt).
role_key(x_Templates,templatesMt).
role_key(x_Plans,plansMt).
role_key(x_Goals,goalsMt).
role_key(x_Policy,policyMt).
role_key(x_State,stateMt).
role_key(x_Knowledge,knowledgeMts).
one_value(Key,Values,Value) :-
    sort(Values,Unique),
    (Unique=[Value]->true;Unique=[]->throw(error(symbolic_configuration_missing(Key),_));
      throw(error(symbolic_configuration_ambiguous(Key),_))).
configured_value(Records,Mt,Name,Agent,Value) :-
    findall(V,(member(kb(_,M,Term),Records),M==Mt,
      Term=..[Name,A,V],A==Agent,must_be(ground,V)),Values),
    one_value(Name,Values,Value).

initial_state(Program,state{agent:Program.agent,program:Program.version,
  phase:awaiting_input,fsm:Program.initial,goals:Program.goals,queue:[],
  pending:none,compensations:[],compensating:false,steps:0,actions:0}).

fact(Program,Mt,Pattern,Id) :-
    member(kb(Id,Actual,Stored),Program.records),Actual==Mt,
    copy_term(Stored,Copy),unify_with_occurs_check(Pattern,Copy).
sequence(Term,_) :- var(Term),!,instantiation_error(Term).
sequence(x_TheList,[]) :- !.
sequence(Term,Items) :- compound(Term),Term=..[x_TheList|Items],!.
sequence(Term,_) :- domain_error(symbolic_TheList,Term).

condition(_,Condition,_,_) :- var(Condition),!,instantiation_error(Condition).
condition(_,x_symbolicTrue,true,[]) :- !.
condition(_,x_symbolicFalse,false,[]) :- !.
condition(_,x_symbolicSame(A,B),Truth,[]) :- !,
    must_be(ground,A-B),(A==B->Truth=true;Truth=false).
condition(Program,x_symbolicKnown(Mt,Formula),Truth,Proof) :- !,
    must_be(ground,Mt-Formula),
    (memberchk(Mt,Program.knowledgeMts)->true;throw(error(symbolic_read_scope_denied(Mt),_))),
    findall(Id,fact(Program,Mt,Formula,Id),Positive),
    findall(Id,fact(Program,Mt,x_not(Formula),Id),Negative),
    known_truth(Positive,Negative,Truth),append(Positive,Negative,Proof).
condition(Program,x_symbolicAll(Sequence),Truth,Proof) :- !,
    sequence(Sequence,Conditions),maplist(condition_result(Program),Conditions,Results),
    findall(T,member(T-_,Results),Truths),
    (memberchk(inconsistent,Truths)->Truth=inconsistent;
      memberchk(false,Truths)->Truth=false;memberchk(unknown,Truths)->Truth=unknown;Truth=true),
    findall(Id,(member(_-Ids,Results),member(Id,Ids)),Proof).
condition(_,Condition,_,_) :- domain_error(symbolic_condition,Condition).
condition_result(Program,Condition,Truth-Proof) :- condition(Program,Condition,Truth,Proof).
known_truth([],[],unknown).
known_truth([_|_],[],true).
known_truth([],[_|_],false).
known_truth([_|_],[_|_],inconsistent).

render_template(Program,Call,Options,Result) :-
    must_be(ground,Call),
    findall(Id-Parts,fact(Program,Program.mts.templatesMt,x_symbolicTemplate(Call,Parts),Id),Found),
    (Found=[Id-Sequence]->
      sequence(Sequence,Parts),maplist(template_part(Program,Options),Parts,Pieces),
      findall(Text,member(piece(Text,_),Pieces),Texts),atomics_to_string(Texts," ",Text),
      string_length(Text,N),(N=<16384->true;domain_error(symbolic_output_characters,N)),
      findall(P,(member(piece(_,Ids),Pieces),member(P,Ids)),Proof),
      Result=rendered{text:Text,proof:[Id|Proof]}
    ;Found=[]->throw(error(symbolic_template_missing(Call),_));
      throw(error(symbolic_template_ambiguous(Call),_))).
template_part(_,_,x_symbolicText(Text),piece(Text,[])) :- !,must_be(string,Text).
template_part(Program,Options,x_symbolicRealize(Category,Meaning),piece(Text,Proof)) :- !,
    kb_symbolic_agent_language:generate_category(Program.language,Category,Meaning,Options,Generated),
    (Generated.status==generated,Generated.complete==true,Generated.candidates=[Only]->
      Text=Only.text,Proof=Only.proof;
      throw(error(symbolic_realization_gap(Generated.status),_))).
template_part(_,_,Part,_) :- domain_error(symbolic_template_part,Part).
