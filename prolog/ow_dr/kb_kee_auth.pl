:- module(kb_kee_auth,[open_context/2,close_context/1,admit/3,principal/2,
    authorize/2,authorize_mt/3,canonical_mt/2,commit_guard/3,reserve_mutation/1]).
:- use_module(kb_kee_schema).
:- use_module(kb_kee_registry,[]).
:- use_module(kb_terms,[context_from_key/2,context_key/2]).
:- use_module(library(uuid)).
:- use_module(library(lists)).
:- dynamic context/4.
:- volatile context/4.
:- meta_predicate commit_guard(+,+,0).

principal_spec(obj([req(authenticated,boolean),req(actor,str(1,256)),req(kind,enum([user,llm,symbolic])),
    req(agent,str(1,256)),req(conversation,str(1,256)),req(policyVersion,str(1,256)),
    req(model,nullable(str(1,256))),req(promptVersion,nullable(str(1,256))),
    req(promptHash,nullable(str(1,256))),req(permissions,list(str(1,128),100)),
    req(readMts,choice([enum([all]),list(str(1,4096),200)])),
    req(writeMts,list(str(1,4096),200)),req(effects,list(str(1,128),100)),
    req(expiresAt,num(0,1.0e15)),
    req(budgets,obj([req(calls,int(1,10000)),req(mutations,int(0,10000)),
      req(resultBytes,int(1024,1048576)),req(seconds,num(0.01,30))]))])).
open_context(Input,Token) :-
    principal_spec(Spec),validate(Spec,Input,Checked),
    (Checked.authenticated==true->true;reject(unauthenticated,json{})),
    (Checked.kind==llm,(Checked.model==null;Checked.promptVersion==null;Checked.promptHash==null)->
       reject(invalid_principal,json{reason:llm_snapshot_required});true),
    (Checked.readMts==all->Read=all;maplist(canonical_mt,Checked.readMts,Read0),sort(Read0,Read)),
    maplist(canonical_mt,Checked.writeMts,Write0),sort(Write0,Write),
    maplist(atom_string,Permissions,Checked.permissions),maplist(atom_string,Effects,Checked.effects),
    Principal=Checked.put(json{readMts:Read,writeMts:Write,permissions:Permissions,effects:Effects}),
    live(Principal),uuid(Token,[version(4)]),
    with_mutex(powder_kee_contexts,assertz(context(Token,Principal,0,0))).
close_context(Token) :-
    (atom(Token)->true;reject(invalid_context,json{})),
    with_mutex(powder_kee_contexts,retractall(context(Token,_,_,_))).
principal(Token,Principal) :-
    with_mutex(powder_kee_contexts,current_principal(Token,Principal)).
current_principal(Token,Principal) :-
    (atom(Token),context(Token,Principal,_,_)->live(Principal);reject(invalid_context,json{})).
live(Principal) :- get_time(Now),(Now<Principal.expiresAt->true;reject(context_expired,json{})).
admit(Token,Capability,Principal) :-
    with_mutex(powder_kee_contexts,admit_locked(Token,Capability,Principal)).
admit_locked(Token,Capability,Principal) :-
    current_principal(Token,Principal),authorize(Principal,Capability),
    context(Token,Principal,Calls,Mutations),
    (Calls<Principal.budgets.calls->true;reject(call_budget,json{})),
    retract(context(Token,Principal,Calls,Mutations)),Next is Calls+1,
    assertz(context(Token,Principal,Next,Mutations)).
authorize(Principal,C) :-
    (Principal.kind==llm,C.domain==agent_control,C.mutation==true->
      reject(agent_control_host_only,json{});true),
    forall(member(Permission,C.permissions),
      (memberchk(Permission,Principal.permissions)->true;reject(permission_denied,json{permission:Permission}))),
    kb_kee_registry:effect_closure(C.name,Effects),
    forall(member(Effect,Effects),
      (memberchk(Effect,Principal.effects)->true;reject(effect_denied,json{effect:Effect}))),
    (Principal.kind==symbolic,
     (C.symbolic\==true;member(E,Effects),memberchk(E,[llm,network,proxy,generate_comment,agent_delegation]))->
       reject(symbolic_effect_denied,json{tool:C.name});true),
    (C.scope==all_read_mts,Principal.readMts\==all->reject(mt_scope_denied,json{reason:all_read_mts_required});true).
canonical_mt(Input,Key) :-
    (string(Input)->atom_string(Text,Input);atom(Input)->Text=Input;reject(invalid_mt,json{})),
    catch(context_from_key(Text,Term),_,reject(invalid_mt,json{})),
    (ground(Term),acyclic_term(Term)->true;reject(invalid_mt,json{})),context_key(Term,Key).
authorize_mt(Principal,Mode,Input) :-
    (memberchk(Mode,[read,write])->true;reject(invalid_scope_mode,json{})),
    (Input==null->true
    ;canonical_mt(Input,Key),
      (Mode==write->Allowed=Principal.writeMts;Allowed=Principal.readMts),
      ((Allowed==all;memberchk(Key,Allowed))->true;reject(mt_scope_denied,json{mode:Mode}))).
reserve_mutation(Token) :-
    with_mutex(powder_kee_contexts,reserve_locked(Token)).
reserve_locked(Token) :-
    current_principal(Token,P),context(Token,P,C,M),
    (M<P.budgets.mutations->true;reject(mutation_budget,json{})),
    retract(context(Token,P,C,M)),Next is M+1,assertz(context(Token,P,C,Next)).
commit_guard(Token,Principal,Goal) :-
    with_mutex(powder_kee_contexts,commit_authorized(Token,Principal,Goal)).
commit_authorized(Token,Expected,Goal) :-
    current_principal(Token,Current),
    (Current==Expected->call(Goal);reject(context_changed,json{})).
