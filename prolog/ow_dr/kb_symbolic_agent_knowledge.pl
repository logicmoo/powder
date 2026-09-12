:- module(kb_symbolic_agent_knowledge,[snapshot/3,decode_snapshot/2]).
:- use_module(kb_symbolic_agent_wire,[]).
:- use_module(kb_store,[]).
:- use_module(kb_runtime,[]).
:- use_module(kb_kee_auth,[]).
:- use_module(kb_terms,[]).
:- use_module(kb_activity,[]).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(solution_sequences)).

% A compiled KEE adapter calls this with its authenticated Principal. The
% browser/agent must never supply that Principal as a tool argument.
snapshot(Principal,Args,Reply) :-
    (Principal.kind==symbolic,Principal.model==null,
     Principal.promptVersion==null,Principal.promptHash==null->true;
      throw(error(symbolic_context_required,_))),
    kb_terms:context_input(Args.agent,Agent),
    kb_terms:context_input(Args.mt,DefinitionMt),
    kb_kee_auth:authorize_mt(Principal,read,Args.mt),
    (get_dict(maxRecords,Args,Maximum)->true;Maximum=4096),
    must_be(integer,Maximum),
    (between(1,8192,Maximum)->true;domain_error(symbolic_snapshot_records,Maximum)),
    kb_activity:with_application(
      kb_symbolic_agent_knowledge:with_snapshot(Principal,Args,Agent,DefinitionMt,Maximum,Reply)).

with_snapshot(Principal,Args,Agent,DefinitionMt,Maximum,Reply) :-
    setup_call_cleanup(kb_store:acquire_query_snapshot(Pin),
      snapshot(kb_symbolic_agent_knowledge:read_snapshot(
        Principal,Args,Agent,DefinitionMt,Maximum,Pin,Reply)),
      kb_store:release_query_snapshot(Pin)).

read_snapshot(Principal,Args,Agent,DefinitionMt,Maximum,Pin,Reply) :-
    (Pin.generation=:=Args.generation,kb_store:generation(Pin.generation)->true;
      throw(error(symbolic_snapshot_generation_conflict,_))),
    selected_records([DefinitionMt],Maximum,Definitions),
    findall(Mt,
      (member(kb(_,_,x_symbolicAgentContext(Declared,_,Mt)),Definitions),
       Declared==Agent,must_be(ground,Mt)),Linked),
    sort([DefinitionMt|Linked],Mts),
    forall(member(Mt,Mts),
      (kb_terms:context_key(Mt,Key),kb_kee_auth:authorize_mt(Principal,read,Key))),
    selected_records(Mts,Maximum,Records),
    WireBudget=budget(0),maplist(bounded_public_record(WireBudget),Records,Rows),
    Reply=json{schema:'powder.symbolic-knowledge.v1',agent:Args.agent,definitionMt:Args.mt,
      generation:Pin.generation,complete:true,records:Rows}.

selected_records(Mts,Maximum,Records) :-
    Bound is Maximum+1,Budget=budget(0),
    once(findnsols(Bound,kb(Id,Mt,Semantic),
      (kb_store:source_module(_,Module,_),
       kb_runtime:module_metadata(Module,microtheory,Id,Mt),
       ground(Mt),memberchk(Mt,Mts),
       kb_runtime:module_assertion(Module,Id,Semantic,_),
       consume_cells(Budget,65536,kb(Id,Mt,Semantic))),Records)),
    length(Records,N),
    (N=<Maximum->true;throw(error(symbolic_snapshot_limit(Maximum),_))),
    findall(Id,member(kb(Id,_,_),Records),Ids),sort(Ids,Unique),
    (same_length(Ids,Unique)->true;throw(error(symbolic_snapshot_duplicate_ids,_))).

public_record(kb(Id,Mt,Semantic),json{id:Id,mt:Key,semantic:Wire}) :-
    kb_terms:context_key(Mt,Key),kb_symbolic_agent_wire:encode_term(Semantic,Wire).
bounded_public_record(Budget,Record,Row) :-
    public_record(Record,Row),consume_cells(Budget,131072,Row).
consume_cells(Budget,Maximum,Term) :-
    term_size(Term,Size),arg(1,Budget,Before),After is Before+Size,
    (After=<Maximum->nb_setarg(1,Budget,After);
      throw(error(symbolic_snapshot_cell_limit(Maximum),_))).
decode_snapshot(Snapshot,Records) :-
    (Snapshot.complete==true,
     (Snapshot.schema=='powder.symbolic-knowledge.v1';Snapshot.schema=="powder.symbolic-knowledge.v1")->true;
      throw(error(symbolic_incomplete_knowledge_snapshot,_))),
    must_be(list,Snapshot.records),maplist(decode_record,Snapshot.records,Records).
decode_record(Row,kb(Id,Mt,Semantic)) :-
    (atom(Row.id)->Id=Row.id;must_be(string,Row.id),atom_string(Id,Row.id)),
    kb_terms:context_from_key(Row.mt,Mt),kb_symbolic_agent_wire:decode_term(Row.semantic,Semantic).
