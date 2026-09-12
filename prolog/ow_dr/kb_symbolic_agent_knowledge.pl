:- module(kb_symbolic_agent_knowledge,[read_snapshot/3,snapshot/3,decode_snapshot/2]).
:- use_module(kb_symbolic_agent_knowledge_schema,[]).
:- use_module(kb_symbolic_agent_wire,[]).
:- use_module(kb_store,[]).
:- use_module(kb_runtime,[]).
:- use_module(kb_kee_auth,[]).
:- use_module(kb_kee_schema,[]).
:- use_module(kb_terms,[]).
:- use_module(kb_activity,[]).
:- use_module(library(crypto)).
:- use_module(library(aggregate)).
:- use_module(library(error)).
:- use_module(library(http/json)).
:- use_module(library(lists)).
:- use_module(library(memfile)).
:- use_module(library(solution_sequences)).
:- use_module(library(time)).

% Principal is supplied by the fixed KEE adapter, never by tool arguments.
read_snapshot(Principal,Input,Reply) :-
    kb_symbolic_agent_knowledge_schema:input_spec(Spec),
    kb_kee_schema:validate(Spec,Input,Args),
    (Principal.kind==symbolic,Principal.model==null,
     Principal.promptVersion==null,Principal.promptHash==null->true;
      throw(error(symbolic_context_required,_))),
    (get_dict(seconds,Args,Requested)->true;Requested=2),
    Seconds is min(Requested,Principal.budgets.seconds),
    call_with_time_limit(Seconds,
      kb_symbolic_agent_knowledge:read_bounded(Principal,Args,Reply)).

snapshot(Principal,Args,Reply) :- read_snapshot(Principal,Args,Reply).

read_bounded(Principal,Args,Reply) :-
    canonical_key(Args.agent,Agent),
    maplist(canonical_key,[Args.mt|Args.linkedMts],Selected0),sort(Selected0,Selected),
    canonical_key(Args.mt,DefinitionMt),
    forall(member(Mt,Selected),
      (kb_terms:context_key(Mt,Key),kb_kee_auth:authorize_mt(Principal,read,Key))),
    kb_activity:with_application(
      kb_symbolic_agent_knowledge:with_snapshot(Args,Agent,DefinitionMt,Selected,Reply)).

canonical_key(Text,Term) :-
    kb_terms:context_from_key(Text,Term),
    supported_data(Term,0).

with_snapshot(Args,Agent,DefinitionMt,Selected,Reply) :-
    setup_call_cleanup(kb_store:acquire_query_snapshot(Pin),
      system:snapshot(kb_symbolic_agent_knowledge:read_pinned(
        Pin,Args,Agent,DefinitionMt,Selected,Reply)),
      kb_store:release_query_snapshot(Pin)).

read_pinned(Pin,Args,Agent,DefinitionMt,Selected,Reply) :-
    (Pin.generation=:=Args.generation->true;
      throw(error(symbolic_snapshot_generation_conflict,_))),
    selected_records(Pin.modules,Selected,Args.maxRecords,Args.maxBytes,Rows),
    verify_definition(Rows,Agent,DefinitionMt,Selected),
    maplist(public_key,Selected,Keys),
    maplist(mt_coverage(Rows),Keys,Coverage),
    length(Rows,Count),
    Base=json{schema:"powder.symbolic-knowledge.v2",agent:Args.agent,definitionMt:Args.mt,
      generation:Pin.generation,complete:true,completeness:"selected_loaded_assertions",
      programValidated:false,selectedMts:Keys,microtheories:Coverage,recordCount:Count,records:Rows},
    json_text(Base,Text),
    crypto_data_hash(Text,Digest,[algorithm(sha256),encoding(utf8)]),atom_string(Digest,Hash),
    Reply=Base.put(snapshotHash,Hash),
    json_bytes(Reply,Bytes),
    (Bytes=<Args.maxBytes->true;throw(error(symbolic_snapshot_byte_limit(Args.maxBytes),_))).

selected_records(Modules,Mts,Maximum,MaximumBytes,Rows) :-
    Bound is Maximum+1,Budget=budget(0,0),
    once(findnsols(Bound,Row,
      (member(Module,Modules),
       native_property(Module,microtheory,Id,Mt),
       ground(Mt),memberchk(Mt,Mts),
       required_property(Module,Id,microtheory,Mt),
       (kb_runtime:module_assertion(Module,Id,Semantic,_)->true;
         throw(error(symbolic_snapshot_missing_assertion(Id),_))),
       consume_cells(Budget,Semantic),
       public_record(Module,Id,Mt,Semantic,Row),
       bounded_text(Row,MaximumBytes),
       json_bytes(Row,Bytes),
       arg(2,Budget,Before),After is Before+Bytes,
       (After=<MaximumBytes->nb_setarg(2,Budget,After);
         throw(error(symbolic_snapshot_byte_limit(MaximumBytes),_)))),Rows)),
    length(Rows,N),
    (N=<Maximum->true;throw(error(symbolic_snapshot_limit(Maximum),_))),
    findall(Id,(member(Row,Rows),Id=Row.id),Ids),sort(Ids,Unique),
    (same_length(Ids,Unique)->true;throw(error(symbolic_snapshot_duplicate_ids,_))).

% Read metadata clauses as data too; no metadata or semantic body is called.
native_property(Module,Property,Id,Value) :-
    atom_concat(xc_,Property,Name),current_predicate(Module:Name/2),
    Goal=..[Name,Id,Value],
    \+predicate_property(Module:Goal,imported_from(_)),
    clause(Module:Goal,Body),
    (Body==true,ground(Id-Value)->true;
      throw(error(symbolic_snapshot_invalid_metadata(Property),_))).

required_property(Module,Id,Property,Value) :-
    once(findnsols(2,Found,native_property(Module,Property,Id,Found),Values)),
    (Values=[Value]->true;
      throw(error(symbolic_snapshot_metadata_cardinality(Id,Property),_))).

public_record(Module,Id,Mt,Semantic,Row) :-
    supported_data(Semantic,0),
    required_property(Module,Id,kb_names,Names),
    (is_list(Names),maplist(string,Names)->true;
      throw(error(symbolic_snapshot_variable_names(Id),_))),
    term_variables(Semantic,Variables),
    (same_length(Variables,Names)->true;
      throw(error(symbolic_snapshot_variable_names(Id),_))),
    required_property(Module,Id,source_file,Source),
    required_property(Module,Id,source_line,Line),
    source_text(Source,Path),
    (integer(Line),Line>=1->true;throw(error(symbolic_snapshot_source_line(Id),_))),
    atom_string(Id,TextId),public_key(Mt,Key),
    kb_symbolic_agent_wire:encode_term(Semantic,Wire),
    Row=json{id:TextId,mt:Key,semantic:Wire,kbNames:Names,
      provenance:json{occurrenceId:TextId,sourceFile:Path,sourceLine:Line,
        verification:"pinned_native_metadata"}}.

source_text(Source,Text) :-
    (string(Source)->Text=Source;atom(Source),blob(Source,text)->atom_string(Source,Text);
      throw(error(symbolic_snapshot_source_reference,_))),
    string_length(Text,N),
    (between(1,4096,N)->true;throw(error(symbolic_snapshot_source_reference,_))).
public_key(Mt,Text) :- kb_terms:context_key(Mt,Key),atom_string(Key,Text).

verify_definition(Rows,Agent,DefinitionMt,Selected) :-
    public_key(DefinitionMt,Key),
    findall(Semantic,(member(Row,Rows),Row.mt==Key,
      kb_symbolic_agent_wire:decode_term(Row.semantic,Semantic)),Definitions),
    (member(Identity,Definitions),Identity=x_isa(Who,Class),Who==Agent,Class==x_SymbolicTextAgent->true;
      throw(error(symbolic_snapshot_definition_unavailable,_))),
    forall((member(Declaration,Definitions),
      Declaration=x_symbolicAgentContext(Declared,Role,Mt),Declared==Agent),
      (must_be(ground,Role-Mt),public_key(Mt,MtKey),
       (memberchk(Mt,Selected)->true;throw(error(symbolic_snapshot_unselected_mt(MtKey),_))))).

mt_coverage(Rows,Key,json{mt:Key,recordCount:Count,status:Status}) :-
    aggregate_all(count,(member(Row,Rows),Row.mt==Key),Count),
    (Count=:=0->Status="no_loaded_assertions";Status="loaded_assertions").

consume_cells(Budget,Term) :-
    (acyclic_term(Term)->true;throw(error(symbolic_snapshot_cyclic_term,_))),
    term_size(Term,Size),arg(1,Budget,Before),After is Before+Size,
    (After=<65536->nb_setarg(1,Budget,After);
      throw(error(symbolic_snapshot_cell_limit(65536),_))).

bounded_text(Term,Maximum) :-
    Budget=text(0),text_size(Term,Budget,Maximum).
text_size(Term,Budget,Maximum) :-
    (string(Term)->string_length(Term,N),add_text(Budget,Maximum,N)
    ;atom(Term)->atom_length(Term,N),add_text(Budget,Maximum,N)
    ;compound(Term)->compound_name_arguments(Term,_,Args),
      maplist(text_at(Budget,Maximum),Args)
    ;true).
text_at(Budget,Maximum,Term) :- text_size(Term,Budget,Maximum).
add_text(Budget,Maximum,N) :-
    arg(1,Budget,Before),After is Before+N,
    (After=<Maximum->nb_setarg(1,Budget,After);
      throw(error(symbolic_snapshot_byte_limit(Maximum),_))).

% wchar-backed string streams cannot represent supplementary Unicode on Windows.
json_text(Value,Text) :-
    setup_call_cleanup(new_memory_file(Memory),
      (write_json_memory(Memory,Value),memory_file_to_string(Memory,Text,utf8)),
      free_memory_file(Memory)).
json_bytes(Value,Bytes) :-
    setup_call_cleanup(new_memory_file(Memory),
      (write_json_memory(Memory,Value),size_memory_file(Memory,Bytes)),
      free_memory_file(Memory)).
write_json_memory(Memory,Value) :-
    setup_call_cleanup(open_memory_file(Memory,write,Stream,[encoding(utf8)]),
      json_write_dict(Stream,Value,[width(0)]),close(Stream)).

supported_data(Term,Depth) :-
    checked_data(Term,Depth,visits(0)).
checked_data(Term,Depth,Budget) :-
    arg(1,Budget,Before),Visits is Before+1,
    (Visits=<16384->nb_setarg(1,Budget,Visits);
      throw(error(symbolic_snapshot_expansion_limit,_))),
    (Depth=<128->true;throw(error(symbolic_snapshot_depth_limit,_))),
    Next is Depth+1,
    (var(Term)->(attvar(Term)->throw(error(symbolic_snapshot_attributed_variable,_));true)
    ;string(Term)->true
    ;integer(Term)->true
    ;float(Term)->float_class(Term,Class),
      (memberchk(Class,[zero,subnormal,normal])->true;throw(error(symbolic_snapshot_nonfinite_number,_)))
    ;blob(Term,Type),Type\==text->throw(error(symbolic_snapshot_opaque_term,_))
    ;atom(Term)->(blob(Term,text)->true;throw(error(symbolic_snapshot_opaque_term,_)))
    ;is_list(Term)->maplist(supported_at(Next,Budget),Term)
    ;is_dict(Term)->dict_pairs(Term,Tag,Pairs),checked_data(Tag,Next,Budget),
      forall(member(Key-Value,Pairs),(checked_data(Key,Next,Budget),checked_data(Value,Next,Budget)))
    ;compound(Term)->compound_name_arguments(Term,Name,Args),
      checked_data(Name,Next,Budget),maplist(supported_at(Next,Budget),Args)
    ;throw(error(symbolic_snapshot_unsupported_term,_))).
supported_at(Depth,Budget,Term) :- checked_data(Term,Depth,Budget).

decode_snapshot(Snapshot,Records) :-
    (Snapshot.complete==true,Snapshot.completeness=="selected_loaded_assertions",
     Snapshot.schema=="powder.symbolic-knowledge.v2"->true;
      throw(error(symbolic_incomplete_knowledge_snapshot,_))),
    must_be(list,Snapshot.records),maplist(decode_record,Snapshot.records,Records).
decode_record(Row,kb(Id,Mt,Semantic)) :-
    must_be(string,Row.id),atom_string(Id,Row.id),
    kb_terms:context_from_key(Row.mt,Mt),kb_symbolic_agent_wire:decode_term(Row.semantic,Semantic).
