:- module(kb_native_annotations,
    [nars_tva/2,oc_tva/2,cyc_bayes_value/3,
     native_status/1,native_summary/3,native_batch/4,native_detail/6,
     native_update/3,upsert_native/6,clear_native/5,initialize_defaults/2,reset_global_defaults/2,
     native_settings/2,save_native_settings/4,assertion_interpretation/3,assertion_interpretations/3,
     assertion_annotation_settings/3,save_assertion_annotations/5,
     native_pair_settings/2,save_native_pair/6,
     native_entity/3,native_record_dto/2,
     export_native_state/1,import_native_state/1,persist_native_state/1,
     export_native_snapshot/1,restored_native_snapshot/1,
     reset_transient/0]).

/** <module> Independent, inert native truth-value annotations

The three exported dynamic predicates contain DATA FACTS, not executable KB
clauses. Canonical whole records are nars_truth_value(Frequency,Confidence)
and stv(Strength,Confidence). Other supported ground data is retained verbatim.
Only explicit writes initialize defaults; importing this module has no I/O.

Ordinary facade reads synchronize a validated snapshot with the durable sidecar.
Direct REPL mutations are detected by predicate generations and persisted on
the next synchronizing facade call (or explicit persist_native_state/1).
The two copy-only snapshot APIs never persist or adopt data. REPL writes must be
serialized with other writers; use native_update/3 for concurrent applications.
There is no crash-durability promise for an unflushed REPL edit.

See docs/native-tva.md for the exact DTO, conflict, restore and scope contracts.
*/
:- use_module(kb_cache,[]).
:- use_module(kb_activity,[]).
:- use_module(kb_paths,[app_dir/1]).
:- use_module(kb_terms,[context_key/2,context_from_key/2,term_ast/3]).
:- use_module(kb_non_atomic,[non_atomic_key/2,non_atomic_from_key/2]).
:- use_module(kb_term_resolver,[term_input/3]).
:- use_module(library(error)).
:- use_module(library(filesex)).
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- use_module(library(apply)).

:- dynamic nars_tva/2,oc_tva/2,cyc_bayes_value/3.
:- dynamic baseline/4.
:- dynamic snapshot_cache/3,storage_binding/1.
:- volatile snapshot_cache/3,storage_binding/1.
:- meta_predicate storage_lock(+,0),native_access(0),restore_access(0).
:- initialization(restore_annotations,restore).

native_access(Goal) :-
    kb_activity:with_application(with_mutex(powder_native_annotations,Goal)).
restore_access(Goal) :-
    (kb_activity:owns_admission_lease->with_mutex(powder_native_annotations,Goal)
    ;native_access(Goal)).
reset_transient :- restore_access(clear_transient).
clear_transient :-
    retractall(snapshot_cache(_,_,_)),retractall(storage_binding(_)).
restore_annotations :-
    restore_access((clear_transient,
      (retract(baseline(Revision,Sequence,Digest,_))->
        assertz(baseline(Revision,Sequence,Digest,imported));true))).

text_atom(Text,Atom) :-
    (atom(Text)->Atom=Text;string(Text)->atom_string(Atom,Text);type_error(text,Text)).
require(Goal,Error) :- (call(Goal)->true;throw(error(Error,kb_native_annotations))).

native_entity(Input,Term,Key) :-
    require(acyclic_term(Input),domain_error(acyclic_native_entity,Input)),
    must_be(ground,Input),
    (Input==default->Term=default,Key=default
    ;(atom(Input);string(Input)),text_atom(Input,A),
       (A==default;kb_cache:valid_assertion_id(A);atom_concat(x_,_,A))->Term=A,Key=A
    ;(compound(Input),\+string(Input)->true
     ;text_atom(Input,Text),require(
       (atom_concat(x_,_,Text);atom_concat('nat:',_,Text);atom_concat('mt:',_,Text)),
       domain_error(canonical_native_entity,Input))),
     term_input(Input,K,_),
     (atom_concat('nat:',_,K)->non_atomic_from_key(K,Term)
     ;atom_concat('mt:',_,K)->context_from_key(K,Term)
     ;Term=K),
     entity_key(Term,Key)),!.
entity_key(default,default) :- !.
entity_key(Term,Term) :- atom(Term),
    (atom_concat(x_,_,Term);kb_cache:valid_assertion_id(Term)),!.
entity_key(Term,Key) :- safe_data(Term),non_atomic_key(Term,Key).

context(Input,null,null) :- Input==null,!.
context(Input,Term,Key) :-
    native_entity(Input,Term,_),context_key(Term,Key).

property(Input,Property) :-
    text_atom(Input,Property),atom_length(Property,N),
    require((N>0,N=<1024),domain_error(native_property,Input)).
family(Input,Family) :-
    text_atom(Input,Family),
    require(memberchk(Family,[nars,opencog,cyc]),domain_error(native_family,Input)).
family_property(cyc,Input,Property) :- !,property(Input,Property).
family_property(_,Input,null) :- require(Input==null,domain_error(no_native_property,Input)).

finite_number(Value) :-
    number(Value),(float(Value)->float_class(Value,Class),memberchk(Class,[zero,subnormal,normal]);true).
unit_value(Value) :-
    require((finite_number(Value),Value>=0,Value=<1),domain_error(unit_interval,Value)).

safe_data(Value) :-
    require(acyclic_term(Value),domain_error(acyclic_native_record,Value)),
    must_be(ground,Value),data_nodes(Value,0,0,Count),
    require(Count=<100000,resource_error(native_record_nodes)),
    kb_cache:term_line(Value,Line),string_length(Line,Length),
    require(Length=<262144,resource_error(native_record_size)).
data_nodes(Term,Depth,Before,After) :-
    require(Depth=<128,resource_error(native_record_depth)),
    Next is Before+1,require(Next=<100001,resource_error(native_record_nodes)),
    (Term==[]->After=Next
    ;atom(Term)->require(atom_is_text(Term),type_error(native_text_atom,Term)),After=Next
    ;string(Term)->After=Next
    ;number(Term)->require(finite_number(Term),domain_error(finite_native_number,Term)),After=Next
    ;is_dict(Term)->dict_pairs(Term,Tag,Pairs),D is Depth+1,
       data_nodes(Tag,D,Next,Middle),foldl(data_pair(D),Pairs,Middle,After)
    ;compound(Term)->functor(Term,F,_),require(atom_is_text(F),type_error(native_functor,F)),
       compound_name_arguments(Term,_,Args),D is Depth+1,foldl(data_node(D),Args,Next,After)
    ;type_error(native_data,Term)).
atom_is_text(Atom) :- blob(Atom,text).
data_node(Depth,Term,Before,After) :- data_nodes(Term,Depth,Before,After).
data_pair(Depth,K-V,Before,After) :-
    data_nodes(K,Depth,Before,Middle),data_nodes(V,Depth,Middle,After).

validate_native_record(Family,Record) :-
    safe_data(Record),
    (Family==nars,Record=nars_truth_value(F,C)->unit_value(F),unit_value(C)
    ;Family==opencog,Record=stv(S,C)->unit_value(S),unit_value(C)
    ;true).
validate_fact(Fact) :-
    must_be(ground,Fact),
    require(acyclic_term(Fact),domain_error(acyclic_native_fact,Fact)),
    (Fact=nars_tva(Entity,Record)->Family=nars
    ;Fact=oc_tva(Entity,Record)->Family=opencog
    ;Fact=cyc_bayes_value(Entity,Prop,Record)->Family=cyc,must_be(atom,Prop),property(Prop,Prop)
    ;domain_error(native_data_fact,Fact)),
    entity_key(Entity,_),validate_native_record(Family,Record).

fact(nars,Entity,null,Record,nars_tva(Entity,Record)).
fact(opencog,Entity,null,Record,oc_tva(Entity,Record)).
fact(cyc,Entity,Property,Record,cyc_bayes_value(Entity,Property,Record)).
fact_key(Fact,Family-Entity-Prop) :- fact(Family,Entity,Prop,_,Fact).

native_generations(Generations) :-
    findall(G,(member(Head,[nars_tva(_,_),oc_tva(_,_),cyc_bayes_value(_,_,_)]),
       predicate_property(Head,last_modified_generation(G))),Generations).
local_snapshot(Facts,Digest) :-
    native_generations(Before),
    (snapshot_cache(Before,Facts,Digest)->true
    ;collect_local(Before,Facts,Digest),
     retractall(snapshot_cache(_,_,_)),assertz(snapshot_cache(Before,Facts,Digest))).
collect_local(Before,Facts,Digest) :-
     snapshot(findall(Head,
       (member(Head,[nars_tva(_,_),oc_tva(_,_),cyc_bayes_value(_,_,_)]),
        clause(Head,Body),require(Body==true,domain_error(native_data_fact,(Head:-Body)))),Raw)),
     maplist(validate_fact,Raw),length(Raw,Count),
     require(Count=<50000,resource_error(native_record_count)),
     msort(Raw,Facts),kb_cache:terms_digest(Facts,Digest),
     native_generations(After),require(Before==After,native_tva_concurrent_repl_change).

storage_file(File) :-
    configured_storage_file(File),
    (storage_binding(_)->true;assertz(storage_binding(File))).
configured_storage_file(File) :-
    (getenv('POWDER_NATIVE_TVA_FILE',Override),Override\==''->
      require(is_absolute_file_name(Override),domain_error(absolute_native_storage,Override)),
      File=Override
    ;app_dir(App),directory_file_path(App,'.logos-state',Directory),
     directory_file_path(Directory,'native-tva.pl',File)),
    (storage_binding(Bound)->require(Bound==File,native_tva_storage_changed);true).

state(Facts,Sequence,State) :-
    kb_cache:terms_digest([native_annotations_v1,Sequence|Facts],Revision),
    State=native_annotations{schema:1,revision:Revision,sequence:Sequence,records:Facts}.
empty_state(State) :- state([],0,State).
validate_state(State) :-
    must_be(dict,State),
    dict_pairs(State,Tag,Pairs),require(Tag==native_annotations,domain_error(native_state_tag,Tag)),
    pairs_keys(Pairs,Keys),
    require(Keys==[records,revision,schema,sequence],domain_error(native_state_schema,Keys)),
    require(State.schema==1,domain_error(native_state_version,State.schema)),
    must_be(nonneg,State.sequence),must_be(list,State.records),
    length(State.records,N),require(N=<50000,resource_error(native_record_count)),
    maplist(validate_fact,State.records),msort(State.records,Sorted),
    require(Sorted==State.records,domain_error(native_state_order,State.records)),
    state(Sorted,State.sequence,Checked),
    require(Checked.revision==State.revision,native_tva_invalid_revision).

read_state(File,State,Exists) :-
    require(\+exists_directory(File),domain_error(native_state_file,File)),
    (exists_file(File)->
      size_file(File,Size),require(Size=<67108864,resource_error(native_state_size)),
      setup_call_cleanup(open(File,read,S,[encoding(utf8)]),read_state_stream(S,State),close(S)),
      Exists=true
    ;empty_state(State),Exists=false).
read_data(S,Term) :-
    read_term(S,Term,[syntax_errors(error),double_quotes(string),cycles(false),quasi_quotations(Q)]),
    require(Q==[],domain_error(native_state_quasiquotation,Q)),
    require(acyclic_term(Term),domain_error(acyclic_native_state,Term)),must_be(ground,Term).
read_state_stream(S,State) :-
    read_data(S,Header),
    require(Header=native_tva_header(1,Sequence,Revision,Count),domain_error(native_state_header,Header)),
    must_be(nonneg,Count),require(Count=<50000,resource_error(native_record_count)),
    length(Facts,Count),maplist(read_data(S),Facts),read_data(S,Footer),
    require(Footer==native_tva_footer(Revision,Count),domain_error(native_state_footer,Footer)),
    read_data(S,End),require(End==end_of_file,domain_error(native_state_trailing_data,End)),
    State=native_annotations{schema:1,sequence:Sequence,revision:Revision,records:Facts},
    validate_state(State).

storage_lock(File,Goal) :-
    file_directory_name(File,Directory),make_directory_path(Directory),
    atom_concat(File,'.lock',Path),kb_cache:try_lock(Path,Lock),
    (Lock==busy->throw(error(native_tva_busy,kb_native_annotations))
    ;setup_call_cleanup(true,Goal,kb_cache:release_lock(Lock))).
write_state(File,State) :-
    validate_state(State),kb_cache:stage_path(File,Stage),
    setup_call_cleanup(true,
      (setup_call_cleanup(open(Stage,write,S,[encoding(utf8),newline(posix)]),
        (length(State.records,Count),
         kb_cache:write_one_line(S,native_tva_header(1,State.sequence,State.revision,Count)),
         maplist(kb_cache:write_one_line(S),State.records),
         kb_cache:write_one_line(S,native_tva_footer(State.revision,Count)),flush_output(S)),close(S)),
       read_state(Stage,Verified,true),require(Verified==State,native_tva_stage_validation),
       kb_cache:install_stage(Stage,File)),
      kb_cache:remove_if_exists(Stage)).

install_memory(State,Mode) :-
    kb_cache:terms_digest(State.records,Digest),
    transaction((retractall(nars_tva(_,_)),retractall(oc_tva(_,_)),
      retractall(cyc_bayes_value(_,_,_)),maplist(assertz,State.records),
      retractall(baseline(_,_,_,_)),
      assertz(baseline(State.revision,State.sequence,Digest,Mode)))),
    retractall(snapshot_cache(_,_,_)).

synchronize(State) :-
    storage_file(File),local_snapshot(Local,Digest),read_state(File,Disk,Exists),
    (baseline(Base,Seq,BaseDigest,Mode)->
      (Digest==BaseDigest->
        (Exists==false,Mode==imported->state(Local,Seq,State)
        ;Exists==false,Seq>0->throw(error(native_tva_storage_missing,kb_native_annotations))
        ;Disk.revision==Base->State=Disk
        ;install_memory(Disk,durable),State=Disk)
      ;storage_lock(File,commit_repl(File,Base,Seq,Mode,Local,State)))
    ;Local==[]->install_memory(Disk,durable),State=Disk
    ;Exists==true,Disk.records\==[]->
       throw(error(native_tva_unloaded_store_conflict,kb_native_annotations))
    ;storage_lock(File,commit_first_repl(File,Disk.revision,Local,State))).

commit_repl(File,Base,Seq,Mode,Local,State) :-
    read_state(File,Disk,Exists),
    require((Disk.revision==Base;(Exists==false,Mode==imported)),
      native_tva_persistence_conflict(Base,Disk.revision)),
    local_snapshot(Now,_),require(Now==Local,native_tva_concurrent_repl_change),
    Next is Seq+1,state(Local,Next,State),write_state(File,State),
    kb_cache:terms_digest(Local,Digest),
    retractall(baseline(_,_,_,_)),assertz(baseline(State.revision,Next,Digest,durable)).
commit_first_repl(File,Base,Local,State) :-
    read_state(File,Disk,_),
    require(Disk.revision==Base,native_tva_persistence_conflict(Base,Disk.revision)),
    Next is Disk.sequence+1,state(Local,Next,State),write_state(File,State),
    kb_cache:terms_digest(Local,Digest),
    assertz(baseline(State.revision,Next,Digest,durable)).

check_revision(Expected,Actual) :-
    text_atom(Expected,Revision),
    require(Revision==Actual,native_tva_revision_conflict(Revision,Actual)).

native_status(Reply) :-
    native_access((synchronize(State),state_status(State,Reply))).
state_status(State,Reply) :-
    length(State.records,Count),maplist(fact_key,State.records,Keys0),msort(Keys0,Keys),
    group_pairs_by_key_pairs(Keys,Groups),length(Groups,KeyCount),
    include(ambiguous_group,Groups,Conflicts),length(Conflicts,ConflictCount),
    storage_file(File),
    (exists_file(File)->Persistence=durable
    ;baseline(_,_,_,imported)->Persistence=snapshot_only
    ;Persistence=absent),
    Reply=_{revision:State.revision,sequence:State.sequence,schema:1,recordCount:Count,
      keyCount:KeyCount,conflictCount:ConflictCount,persistence:Persistence}.
group_pairs_by_key_pairs(Keys,Groups) :-
    maplist(key_pair,Keys,Pairs),group_pairs_by_key(Pairs,Groups).
key_pair(Key,Key-true).
ambiguous_group(_-[_,_|_]).

upsert_native(Family,Entity,Property,Record,Expected,Reply) :-
    native_update([put(Family,Entity,Property,Record)],Expected,Reply).
clear_native(Family,Entity,Property,Expected,Reply) :-
    native_update([remove(Family,Entity,Property)],Expected,Reply).
native_update(Changes,Expected,Reply) :-
    must_be(list,Changes),length(Changes,N),require(N=<500,resource_error(native_update_count)),
    must_be(ground,Changes),
    maplist(normalize_change,Changes,Normalized),
    native_access(
      (synchronize(Before),check_revision(Expected,Before.revision),
       foldl(apply_change,Normalized,Before.records,Raw),msort(Raw,Records),
       commit_update(Before,Records,After),state_status(After,Reply))).
normalize_change(put(F0,E0,P0,Record),put(F,E,P,Record)) :- !,
    family(F0,F),family_property(F,P0,P),native_entity(E0,E,_),validate_native_record(F,Record).
normalize_change(remove(F0,E0,P0),remove(F,E,P)) :- !,
    family(F0,F),family_property(F,P0,P),native_entity(E0,E,_).
normalize_change(Change,_) :- domain_error(native_change,Change).
matches_key(F,E,P,Fact) :- fact_key(Fact,K),K==F-E-P.
apply_change(put(F,E,P,R),Before,[Fact|Without]) :-
    exclude(matches_key(F,E,P),Before,Without),fact(F,E,P,R,Fact).
apply_change(remove(F,E,P),Before,After) :- exclude(matches_key(F,E,P),Before,After).
commit_update(Before,Records,After) :-
    storage_file(File),
    storage_lock(File,
      (read_state(File,Disk,Exists),
       require((Disk.revision==Before.revision;
         (Exists==false,baseline(Before.revision,_,_,imported))),
         native_tva_revision_conflict(Before.revision,Disk.revision)),
       local_snapshot(Local,_),require(Local==Before.records,native_tva_concurrent_repl_change),
       (Records==Before.records->After=Before
       ;Next is Before.sequence+1,state(Records,Next,After),write_state(File,After),
        install_memory(After,durable)))).

initialize_defaults(Expected,Reply) :-
    native_access(
      (synchronize(Before),check_revision(Expected,Before.revision),
       foldl(apply_change,[put(nars,default,null,nars_truth_value(0.5,0.0)),
         put(opencog,default,null,stv(0.5,0.0)),put(cyc,default,utility,0.5)],
         Before.records,Base),
       foldl(initial_setting,[monotonic_strength-1.0,default_strength-0.7,
         asserted_positive_truth-1.0,asserted_monotonic_confidence-0.97,
         asserted_default_confidence-0.66,missing_assertion_strength-':DEFAULT',direction-':BACKWARD'],Base,Raw),
       msort(Raw,Records),commit_update(Before,Records,After),state_status(After,Reply))).
initial_setting(P-V,Before,After) :-
    (member(Fact,Before),matches_key(cyc,default,P,Fact)->After=Before
    ;After=[cyc_bayes_value(default,P,V)|Before]).

reset_global_defaults(Expected,Reply) :-
    native_access(
      (synchronize(Before),check_revision(Expected,Before.revision),
       findall(put(cyc,default,P,V),
         member(P-V,[utility-0.5,monotonic_strength-1.0,default_strength-0.7,
           asserted_positive_truth-1.0,asserted_monotonic_confidence-0.97,
           asserted_default_confidence-0.66,missing_assertion_strength-':DEFAULT',direction-':BACKWARD']),Cyc),
       append([put(nars,default,null,nars_truth_value(0.5,0.0)),
               put(opencog,default,null,stv(0.5,0.0))],Cyc,Changes),
       foldl(apply_change,Changes,Before.records,Raw),msort(Raw,Records),
       commit_update(Before,Records,After),settings_reply(After,default,null,Reply))).

keys(Entity,Context,Keys) :-
    (Context==null->Candidates=[atom-Entity,default-default]
    ;Candidates=[atom-Entity,mt-Context,default-default]),
    unique_keys(Candidates,[],Keys).
unique_keys([],_,[]).
unique_keys([Origin-Key|Rest],Seen,Keys) :-
    (memberchk(Key,Seen)->unique_keys(Rest,Seen,Keys)
    ;Keys=[Origin-Key|Tail],unique_keys(Rest,[Key|Seen],Tail)).
select_record(_,[],_,_,none,[]) :- !.
select_record(Facts,[Origin-Key|Rest],Family,Prop,Selection,Records) :-
    findall(R,(member(Fact,Facts),fact(Family,E,Prop0,R,Fact),E==Key,Prop0==Prop),Here),
    (Here==[]->select_record(Facts,Rest,Family,Prop,Selection,Records)
    ;Selection=Origin-Key,Records=Here).

effective(Facts,Entity,Context,Family,Prop,Effective,Records) :-
    keys(Entity,Context,Keys),select_record(Facts,Keys,Family,Prop,Selection,Records),
    kb_cache:terms_digest([selection(Family,Prop,Entity,Context,Selection,Records)],Revision),
    (Selection==none->Status=uninitialized,Origin=null,Supplier=null,SupplierExpression=null,
       Summary=null,Count=0
    ;Selection=Origin-Key,entity_key(Key,Supplier),term_ast(Key,[],SupplierExpression),
     length(Records,Count),
     (Records=[Record]->Status=initialized,record_summary(Family,Record,Summary)
     ;Status=conflict,Summary=null)),
    Effective=_{status:Status,origin:Origin,supplier:Supplier,recordRevision:Revision,
      supplierExpression:SupplierExpression,summary:Summary,recordCount:Count}.

native_summary(Entity0,Context0,Reply) :-
    native_entity(Entity0,Entity,Key),context(Context0,Context,ContextKey),
    native_access(
      (synchronize(State),summary(State,Entity,Key,Context,ContextKey,Reply))).
summary(State,Entity,Key,Context,ContextKey,Reply) :-
    term_ast(Entity,[],EntityExpression),context_expression(Context,ContextExpression),
    effective(State.records,Entity,Context,nars,null,Nars,_),
    effective(State.records,Entity,Context,opencog,null,OC,_),
    keys(Entity,Context,Keys),
    findall(P,(member(cyc_bayes_value(E,P,_),State.records),member(_-K,Keys),E==K),Props0),
    sort(Props0,Props),maplist(property_summary(State.records,Entity,Context),Props,Properties),
    Reply=_{revision:State.revision,entity:Key,context:ContextKey,
      entityExpression:EntityExpression,contextExpression:ContextExpression,
      families:_{nars:_{family:nars,effective:Nars},opencog:_{family:opencog,effective:OC},
                 cyc:_{family:cyc,properties:Properties}}}.
property_summary(Facts,Entity,Context,Property,_{property:Name,effective:Effective}) :-
    atom_string(Property,Name),
    effective(Facts,Entity,Context,cyc,Property,Effective,_).
context_expression(Context,Expression) :-
    (Context==null->Expression=null;term_ast(Context,[],Expression)).

record_summary(nars,nars_truth_value(F,C),Summary) :- json_number(F),json_number(C),!,
    Summary=_{renderer:nars_truth_value,frequency:F,confidence:C}.
record_summary(opencog,stv(S,C),Summary) :- json_number(S),json_number(C),!,
    Summary=_{renderer:opencog_stv,strength:S,confidence:C}.
record_summary(_,Record,Summary) :- shape_summary(Record,Shape),
    Summary=Shape.put(renderer,native_data).
json_number(Value) :-
    (integer(Value)->Value>= -9007199254740991,Value=<9007199254740991;float(Value)).
shape_summary(Value,_{kind:number,value:Value}) :-
    json_number(Value),!.
shape_summary(Value,_{kind:number,representation:integer}) :- integer(Value),!.
shape_summary(Value,_{kind:number,representation:rational}) :- number(Value),!.
shape_summary(Value,_{kind:boolean,value:Value}) :- memberchk(Value,[true,false]),!.
shape_summary(Value,Summary) :- atom(Value),!,atom_length(Value,N),
    (N=<128->atom_string(Value,Text),Summary=_{kind:atom,value:Text};Summary=_{kind:atom,length:N}).
shape_summary(Value,Summary) :- string(Value),!,string_length(Value,N),
    (N=<128->Summary=_{kind:string,value:Value};Summary=_{kind:string,length:N}).
shape_summary(Value,_{kind:list,length:N}) :- is_list(Value),!,length(Value,N).
shape_summary(Value,_{kind:dict,size:N}) :- is_dict(Value),!,dict_pairs(Value,_,P),length(P,N).
shape_summary(Value,Summary) :-
    functor(Value,Functor,Arity),atom_length(Functor,Length),
    (Length=<128->atom_string(Functor,Text),Summary=_{kind:compound,functor:Text,arity:Arity}
    ;sub_atom(Functor,0,128,_,Short),
     atom_string(Short,Text),
     Summary=_{kind:compound,functor:Text,functorLength:Length,functorTruncated:true,arity:Arity}).

native_detail(Entity0,Context0,Family0,Property0,Expected,Reply) :-
    native_entity(Entity0,Entity,Key),context(Context0,Context,ContextKey),
    family(Family0,Family),family_property(Family,Property0,Prop),
    native_access(
      (synchronize(State),effective(State.records,Entity,Context,Family,Prop,E,Records),
       check_record_revision(Expected,E.recordRevision),maplist(record_detail,Records,Details),
       (Family==cyc->atom_string(Prop,PropertyName);PropertyName=null),
       term_ast(Entity,[],EntityExpression),context_expression(Context,ContextExpression),
       Reply=_{revision:State.revision,entity:Key,context:ContextKey,family:Family,
         entityExpression:EntityExpression,contextExpression:ContextExpression,
         property:PropertyName,effective:E,records:Details})).
check_record_revision(Expected,Actual) :-
    text_atom(Expected,R),require(R==Actual,native_tva_record_revision_conflict(R,Actual)).
record_detail(Record,_{data:DTO,text:Text}) :-
    native_record_dto(Record,DTO),kb_cache:term_line(Record,Text).
native_record_dto(Record,DTO) :- safe_data(Record),data_dto(Record,DTO).
data_dto(Value,_{type:atom,value:Text}) :- atom(Value),!,atom_string(Value,Text).
data_dto(Value,_{type:string,value:Value}) :- string(Value),!.
data_dto(Value,_{type:number,value:Value}) :- json_number(Value),!.
data_dto(Value,_{type:integer,text:Text}) :- integer(Value),!,term_string(Value,Text).
data_dto(Value,_{type:rational,text:Text}) :- number(Value),!,term_string(Value,Text).
data_dto(Value,_{type:list,items:Items}) :- is_list(Value),!,maplist(data_dto,Value,Items).
data_dto(Value,_{type:dict,tag:TagDTO,entries:Entries}) :- is_dict(Value),!,
    dict_pairs(Value,Tag,Pairs),data_dto(Tag,TagDTO),maplist(pair_dto,Pairs,Entries).
data_dto(Value,_{type:compound,functor:Name,args:Args}) :-
    compound_name_arguments(Value,Functor,Values),atom_string(Functor,Name),
    maplist(data_dto,Values,Args).
pair_dto(K-V,_{key:Key,value:Value}) :- data_dto(K,Key),data_dto(V,Value).

native_batch(Inputs,Context0,Options,Reply) :-
    must_be(list,Inputs),length(Inputs,N),require(N=<200,resource_error(native_batch_limit)),
    must_be(dict,Options),known_options(Options,[family,property,status,origin,sort,order,min,max,offset,limit]),
    context(Context0,Context,ContextKey),maplist(entity_pair,Inputs,Entities0),
    context_expression(Context,ContextExpression),
    list_to_set(Entities0,Entities),batch_options(Options,Config),
    native_access(
      (synchronize(State),maplist(batch_summary(State,Context,ContextKey,Config),Entities,Rows),
       findall(SortKey-Row,(member(Row,Rows),batch_match(Config,Row,SortKey)),Pairs),
       keysort(Pairs,Sorted0),
       (Config.order==desc->reverse(Sorted0,Sorted);Sorted=Sorted0),pairs_values(Sorted,All),
       length(All,Total),page(All,Config.offset,Config.limit,Items),
       Reply=_{revision:State.revision,context:ContextKey,items:Items,total:Total,
          contextExpression:ContextExpression,
          offset:Config.offset,limit:Config.limit})).
entity_pair(Input,Term-Key) :- native_entity(Input,Term,Key).
batch_summary(State,Context,ContextKey,Config,Entity-Key,Row) :-
    summary(State,Entity,Key,Context,ContextKey,Base),
    (Config.propertyRequested==true->
      atom_string(Config.property,Name),Properties=Base.families.cyc.properties,
      (member(Item,Properties),Item.property==Name->Row=Base
      ;property_summary(State.records,Entity,Context,Config.property,Requested),
       findall(P-I,(member(I,[Requested|Properties]),P=I.property),Pairs),
       keysort(Pairs,Sorted),pairs_values(Sorted,Complete),
       Cyc=Base.families.cyc.put(properties,Complete),
       Families=Base.families.put(cyc,Cyc),Row=Base.put(families,Families))
    ;Row=Base).
known_options(Dict,Allowed) :-
    dict_pairs(Dict,_,Pairs),
    forall(member(K-_,Pairs),require(memberchk(K,Allowed),domain_error(native_option,K))).
option(Options,Key,Default,Value) :- (get_dict(Key,Options,Value)->true;Value=Default).
batch_options(O,C) :-
    option(O,family,null,F0),(F0==null->F=null;family(F0,F)),
    option(O,property,null,P0),(P0==null->P=null;property(P0,P)),
    (P0==null->PropertyRequested=false
    ;require(memberchk(F,[null,cyc]),domain_error(native_property_family,F)),PropertyRequested=true),
    option(O,sort,entity,S0),text_atom(S0,Sort),
    require(memberchk(Sort,[entity,origin,frequency,confidence,strength,value]),domain_error(native_sort,Sort)),
    option(O,order,asc,Order0),text_atom(Order0,Order),
    require(memberchk(Order,[asc,desc]),domain_error(native_order,Order)),
    option(O,status,all,Status0),text_atom(Status0,Status),
    require(memberchk(Status,[all,initialized,uninitialized,conflict]),domain_error(native_status_filter,Status)),
    option(O,origin,all,Origin0),text_atom(Origin0,Origin),
    require(memberchk(Origin,[all,atom,mt,default]),domain_error(native_origin_filter,Origin)),
    ((Sort\==entity;Status\==all;Origin\==all)->
      require((F\==null,(F==cyc->P0\==null;true)),domain_error(native_filter_family,F-P));true),
    option(O,min,null,Min),option(O,max,null,Max),
    forall((member(B,[Min,Max]),B\==null),
      require(finite_number(B),domain_error(native_numeric_bound,B))),
    ((Min\==null,Max\==null)->require(Min=<Max,domain_error(native_numeric_range,Min-Max));true),
    ((Min\==null;Max\==null)->
      require(memberchk(Sort,[frequency,confidence,strength,value]),domain_error(native_numeric_sort,Sort));true),
    option(O,offset,0,Offset),must_be(nonneg,Offset),
    option(O,limit,200,Limit),must_be(between(1,200),Limit),
    C=_{family:F,property:P,sort:Sort,order:Order,status:Status,origin:Origin,
        propertyRequested:PropertyRequested,min:Min,max:Max,offset:Offset,limit:Limit}.
batch_match(C,Row,Key-Entity) :-
    Entity=Row.entity,
    (C.family==null->E=null;row_effective(Row,C.family,C.property,E)),
    (C.status==all->true;E.status==C.status),(C.origin==all->true;E.origin==C.origin),
    (C.sort==entity->Key=Entity
    ;C.sort==origin->E.origin\==null,Key=E.origin
    ;E.status==initialized,get_dict(C.sort,E.summary,Key),finite_number(Key)),
    (C.min==null->true;Key>=C.min),(C.max==null->true;Key=<C.max).
row_effective(Row,cyc,Prop,E) :- !,
    atom_string(Prop,Name),
    (member(Item,Row.families.cyc.properties),Item.property==Name->E=Item.effective
    ;E=_{status:uninitialized,origin:null,summary:null}).
row_effective(Row,Family,_,E) :- get_dict(Family,Row.families,Data),E=Data.effective.
page(All,Offset,Limit,Page) :-
    (Offset>0->(All=[_|Rest]->N is Offset-1,page(Rest,N,Limit,Page);Page=[])
    ;Limit>0,All=[H|Rest]->Page=[H|Tail],N is Limit-1,page(Rest,0,N,Tail)
    ;Page=[]).

settings_context(Input,default,null) :- (Input==null;Input==default;Input=="default"),!.
settings_context(Input,Term,Key) :- context(Input,Term,Key).
setting_key(utility).
setting_key(monotonic_strength).
setting_key(default_strength).
setting_key(direction).
setting_key(asserted_positive_truth).
setting_key(asserted_monotonic_confidence).
setting_key(asserted_default_confidence).
setting_key(missing_assertion_strength).
setting_value(missing_assertion_strength,Value) :- !,
    require(memberchk(Value,[':DEFAULT',':MONOTONIC']),domain_error(assertion_strength_category,Value)).
setting_value(direction,Value) :- !,
    require(memberchk(Value,[':FORWARD',':BACKWARD']),domain_error(native_direction,Value)).
setting_value(_,Value) :- unit_value(Value).
valid_setting_effective(Prop,E,Records,Out) :-
    (E.status==initialized,Records=[Value],\+catch(setting_value(Prop,Value),error(_,_),fail)->
      Out=E.put(_{status:invalid,reason:invalid_setting_value})
    ;Out=E).

native_settings(Context0,Reply) :-
    settings_context(Context0,Entity,ContextKey),
    native_access(
      (synchronize(State),settings_reply(State,Entity,ContextKey,Reply))).
settings_reply(State,Entity,ContextKey,Reply) :-
    findall(P,(setting_key(P)),Props),
    maplist(setting_pair(State.records,default),Props,GlobalPairs),
    maplist(setting_pair(State.records,Entity),Props,EffectivePairs),
    maplist(override_pair(State.records,Entity),Props,OverridePairs),
    dict_pairs(Global,settings,GlobalPairs),dict_pairs(Effective,settings,EffectivePairs),
    dict_pairs(Overrides,settings,OverridePairs),
    (ContextKey==null->ContextExpression=null;term_ast(Entity,[],ContextExpression)),
    Reply=_{revision:State.revision,context:ContextKey,contextExpression:ContextExpression,
      global:Global,effective:Effective,overrides:Overrides}.
setting_pair(Facts,Entity,Prop,Prop-Effective) :-
    Prop==missing_assertion_strength,Entity\==default, !,
    setting_pair(Facts,default,Prop,Prop-Effective).
setting_pair(Facts,Entity,Prop,Prop-Effective) :-
    effective(Facts,Entity,null,cyc,Prop,E,Records),valid_setting_effective(Prop,E,Records,Checked),
    (Entity\==default,Checked.origin==atom->Effective=Checked.put(origin,mt)
    ;Entity==default,Checked.origin==atom->Effective=Checked.put(origin,default)
    ;Effective=Checked).
override_pair(_Facts,Entity,Prop,Prop-Present) :-
    Prop==missing_assertion_strength,Entity\==default, !,Present=false.
override_pair(Facts,Entity,Prop,Prop-Present) :-
    (member(Fact,Facts),matches_key(cyc,Entity,Prop,Fact)->Present=true;Present=false).
save_native_settings(Context0,Patch,Expected,Reply) :-
    settings_context(Context0,Entity,ContextKey),must_be(dict,Patch),
    dict_pairs(Patch,_,GroundPairs),must_be(ground,GroundPairs),
    findall(Key,setting_key(Key),Allowed),known_options(Patch,Allowed),
    dict_pairs(Patch,_,Pairs),maplist(setting_change(Entity),Pairs,Changes),
    native_access(
      (synchronize(Before),check_revision(Expected,Before.revision),
       foldl(apply_change,Changes,Before.records,Raw),msort(Raw,Records),
       commit_update(Before,Records,State),settings_reply(State,Entity,ContextKey,Reply))).
setting_change(Entity,Prop-null,remove(cyc,Entity,Prop)) :- !,
    (Prop==missing_assertion_strength->require(Entity==default,domain_error(global_only_setting,Prop));true).
setting_change(Entity,Prop-Value0,put(cyc,Entity,Prop,Value)) :-
    (Prop==missing_assertion_strength->require(Entity==default,domain_error(global_only_setting,Prop));true),
    (memberchk(Prop,[direction,missing_assertion_strength])->text_atom(Value0,Value);Value=Value0),setting_value(Prop,Value).

native_pair_settings(Context0,Reply) :-
    settings_context(Context0,Entity,ContextKey),
    native_access(
      (synchronize(State),pair_settings_reply(State,Entity,ContextKey,Reply))).
pair_settings_reply(State,Entity,ContextKey,Reply) :-
    pair_setting(State.records,Entity,nars,Nars),pair_setting(State.records,Entity,opencog,OC),
    (ContextKey==null->ContextExpression=null;term_ast(Entity,[],ContextExpression)),
    Reply=_{revision:State.revision,context:ContextKey,contextExpression:ContextExpression,
      families:_{nars:Nars,opencog:OC}}.
exact_effective(Facts,Entity,Family,Property,E,Records) :-
    include(matches_key(Family,Entity,Property),Facts,Exact),
    effective(Exact,Entity,null,Family,Property,E,Records).
scope_origin(Entity,E,Scoped) :-
    (E.origin==atom->(Entity==default->Origin=default;Origin=mt),Scoped=E.put(origin,Origin);Scoped=E).
pair_setting(Facts,Entity,Family,Item) :-
    exact_effective(Facts,Entity,Family,null,Exact0,ExactRecords),
    effective(Facts,Entity,null,Family,null,Effective0,_),
    scope_origin(Entity,Exact0,Exact),scope_origin(Entity,Effective0,Effective),
    ((ExactRecords==[];ExactRecords=[Record],canonical_pair(Family,Record))->
      pair_setting_item(Entity,Family,Exact,Effective,false,Item)
    ;pair_setting_item(Entity,Family,Exact,Effective,true,Item)).
pair_setting_item(Entity,Family,Exact,Effective,Replace,Item) :-
    entity_key(Entity,Key),
    (Replace==true->Editable=false;Editable=true),
    Item=_{family:Family,exact:Exact,effective:Effective,editable:Editable,replacementRequired:Replace,
      detail:_{entity:Key,context:null,family:Family,property:null,recordRevision:Effective.recordRevision}}.
canonical_pair(nars,nars_truth_value(F,C)) :- json_number(F),json_number(C),unit_value(F),unit_value(C).
canonical_pair(opencog,stv(S,C)) :- json_number(S),json_number(C),unit_value(S),unit_value(C).
typed_pair(nars,Pair,nars_truth_value(F,C)) :-
    pair_fields(Pair,[confidence,frequency]),F=Pair.frequency,C=Pair.confidence,unit_value(F),unit_value(C).
typed_pair(opencog,Pair,stv(S,C)) :-
    pair_fields(Pair,[confidence,strength]),S=Pair.strength,C=Pair.confidence,unit_value(S),unit_value(C).
pair_fields(Pair,Keys) :-
    must_be(dict,Pair),dict_pairs(Pair,_,Pairs),must_be(ground,Pairs),pairs_keys(Pairs,Actual),
    require(Actual==Keys,domain_error(native_pair_fields,Actual)).
save_native_pair(Context0,Family0,Pair,Expected,Replace,Reply) :-
    settings_context(Context0,Entity,ContextKey),family(Family0,Family),
    require(memberchk(Family,[nars,opencog]),domain_error(native_pair_family,Family)),
    must_be(boolean,Replace),
    (Pair==null->Change=remove(Family,Entity,null)
    ;typed_pair(Family,Pair,Record),Change=put(Family,Entity,null,Record)),
    native_access(
      (synchronize(Before),check_revision(Expected,Before.revision),
       pair_setting(Before.records,Entity,Family,Existing),
       require((Existing.replacementRequired==false;Replace==true),
         native_pair_replacement_required(Family,Entity)),
       apply_change(Change,Before.records,Raw),msort(Raw,Records),
       commit_update(Before,Records,After),pair_settings_reply(After,Entity,ContextKey,Reply))).

assertion_annotation_settings(Entity0,Context0,Reply) :-
    assertion_editor_entity(Entity0,Entity),context(Context0,Context,ContextKey),
    with_mutex(openworld_store,
      (source_generation(Generation),editor_source(Entity,SourceData,Identity))),
    native_access(
      (synchronize(State),assertion_editor_reply(State,Entity,Context,ContextKey,
        Generation,SourceData,Identity,Reply))).
assertion_editor_entity(Input,Entity) :-
    native_entity(Input,Entity,_),
    require(kb_cache:valid_assertion_id(Entity),domain_error(assertion_id,Input)).
editor_source(Entity,SourceData,Identity) :-
    require(current_predicate(kb_store:assertion/2),existence_error(assertion,Entity)),
    findall(Row,kb_store:assertion(Entity,Row),Rows),
    (Rows=[]->throw(error(existence_error(assertion,Entity),kb_native_annotations))
    ;Rows=[Row]->true;throw(error(native_tva_source_conflict(Entity),kb_native_annotations))),
    source_record(Entity,Row,SourceData),
    kb_cache:terms_digest([assertion_identity(Entity,Row.expression,Row.properties,Row.source,Row.line)],Identity).
assertion_editor_reply(State,Entity,Context,ContextKey,Generation,SourceData,Identity,Reply) :-
    interpretation(State,Context,ContextKey,Generation,Entity-Entity-SourceData,Interpretation),
    SourceData=source(_,Directions,Labels,_),
    exact_effective(State.records,Entity,cyc,monotonicity,Strength0,StrengthRecords),
    valid_setting_effective(missing_assertion_strength,Strength0,StrengthRecords,Strength),
    exact_effective(State.records,Entity,cyc,direction,Direction0,DirectionRecords),
    valid_setting_effective(direction,Direction0,DirectionRecords,Direction),
    editor_layer(State.records,Context,Mt),editor_layer(State.records,default,Global0),
    exact_effective(State.records,default,cyc,missing_assertion_strength,Missing0,MissingRecords),
    valid_setting_effective(missing_assertion_strength,Missing0,MissingRecords,Missing1),
    scope_origin(default,Missing1,Missing),Global=Global0.put(missing_assertion_strength,Missing),
    Reply=_{revision:State.revision,generation:Generation,identity:Identity,entity:Entity,
      context:ContextKey,recorded:_{monotonicity:Labels,direction:Directions},
      overrides:_{monotonicity:Strength,direction:Direction},
      effective:_{monotonicity:Interpretation.strengthCategory,direction:Interpretation.direction},
      layers:_{mt:Mt,global:Global},
      interpretation:Interpretation}.
editor_layer(_,null,null) :- !.
editor_layer(Facts,Entity,_{monotonicity:Strength,direction:Direction}) :-
    exact_effective(Facts,Entity,cyc,monotonicity,S0,SR),
    valid_setting_effective(missing_assertion_strength,S0,SR,S1),scope_origin(Entity,S1,Strength),
    exact_effective(Facts,Entity,cyc,direction,D0,DR),
    valid_setting_effective(direction,D0,DR,D1),scope_origin(Entity,D1,Direction).
assertion_change(Entity,Property-Value0,Change) :-
    require(memberchk(Property,[monotonicity,direction]),domain_error(assertion_annotation_property,Property)),
    (Value0==null->Change=remove(cyc,Entity,Property)
    ;text_atom(Value0,Value),
     (Property==monotonicity->setting_value(missing_assertion_strength,Value);setting_value(direction,Value)),
     Change=put(cyc,Entity,Property,Value)).
save_assertion_annotations(Entity0,Context0,Patch,Expected,Reply) :-
    assertion_editor_entity(Entity0,Entity),context(Context0,Context,ContextKey),
    must_be(dict,Patch),dict_pairs(Patch,_,Pairs),must_be(ground,Pairs),
    maplist(assertion_change(Entity),Pairs,Changes),
    must_be(dict,Expected),dict_pairs(Expected,_,EPairs),must_be(ground,EPairs),
    pairs_keys(EPairs,EKeys),require(EKeys==[generation,identity,revision],domain_error(assertion_preconditions,EKeys)),
    must_be(nonneg,Expected.generation),text_atom(Expected.identity,ExpectedIdentity),
    with_mutex(openworld_store,
      (source_generation(Generation),
       require(Generation==Expected.generation,generation_conflict(Expected.generation,Generation)),
       editor_source(Entity,SourceData,Identity),
       require(Identity==ExpectedIdentity,native_assertion_identity_conflict),
       native_access(
         (synchronize(Before),check_revision(Expected.revision,Before.revision),
          foldl(apply_change,Changes,Before.records,Raw),msort(Raw,Records),
          commit_update(Before,Records,After),
          assertion_editor_reply(After,Entity,Context,ContextKey,Generation,SourceData,Identity,Reply))))).

assertion_interpretation(Entity0,Context0,Reply) :-
    native_entity(Entity0,Entity,Key),context(Context0,Context,ContextKey),
    single_source_snapshot(Entity,SourceData,Generation),
    native_access(
      (synchronize(State),
       interpretation(State,Context,ContextKey,Generation,Entity-Key-SourceData,Reply))).

assertion_interpretations(Inputs,Context0,Reply) :-
    must_be(list,Inputs),length(Inputs,N),
    require(N=<200,resource_error(native_interpretations_limit)),
    context(Context0,Context,ContextKey),
    maplist(entity_pair,Inputs,Entities0),list_to_set(Entities0,Entities),
    with_mutex(openworld_store,
      (source_generation(Generation),maplist(capture_source,Entities,Sources))),
    native_access(
      (synchronize(State),
       maplist(interpretation(State,Context,ContextKey,Generation),Sources,Items),
       Reply=_{revision:State.revision,generation:Generation,context:ContextKey,items:Items})).

interpretation(State,Context,ContextKey,Generation,
               Entity-Key-source(Source,Directions,Labels,Polarity),Reply) :-
    effective(State.records,Entity,Context,cyc,direction,E,Records),
    valid_setting_effective(direction,E,Records,NativeDirection),
    source_direction(Directions,Source,NativeDirection,Records,Direction),
    strength_category(State.records,Entity,Context,Source,Labels,Category),
    (Category.status==initialized->text_atom(Category.summary.value,Label),EffectiveLabels=[Label];EffectiveLabels=[]),
    mapped_strength(State.records,Context,EffectiveLabels,Strength0),
    (Category.status==initialized->Strength=Strength0;Strength=Category.put(interpretation,display_only)),
    assertion_prior(State.records,Context,Source,Polarity,EffectiveLabels,Prior0),
    (Category.status\==initialized,memberchk(Polarity,[positive,negative]),Source\==null->
      Prior1=Prior0.put(_{status:Category.status,reason:Category.reason});Prior1=Prior0),
    prior_families(State.records,Context,Prior1,Families),
    Prior=Prior1.put(_{sourceMonotonicity:Labels,effectiveMonotonicity:EffectiveLabels,
                     strengthCategory:Category,families:Families}),
    term_ast(Entity,[],EntityExpression),context_expression(Context,ContextExpression),
    Reply=_{revision:State.revision,generation:Generation,entity:Key,context:ContextKey,
      entityExpression:EntityExpression,contextExpression:ContextExpression,
      source:Source,monotonicity:Labels,effectiveMonotonicity:EffectiveLabels,strengthCategory:Category,direction:Direction,mappedStrength:Strength,
      assertionPrior:Prior}.

single_source_snapshot(Entity,SourceData,Generation) :-
    (source_lookup_available(Entity)->
      with_mutex(openworld_store,(source_generation(Generation),capture_source_data(Entity,SourceData)))
    ;SourceData=source(null,[],[],unknown),Generation=null).
source_lookup_available(Entity) :-
    atom(Entity),kb_cache:valid_assertion_id(Entity),current_predicate(kb_store:assertion/2).
source_generation(Generation) :-
    (current_predicate(kb_store:generation/1)->
      findall(G,kb_store:generation(G),Generations),
      require(Generations=[Generation],native_tva_source_generation_conflict),
      must_be(nonneg,Generation)
    ;Generation=null).
capture_source(Entity-Key,Entity-Key-SourceData) :-
    capture_source_data(Entity,SourceData).
capture_source_data(Entity,SourceData) :-
    (source_lookup_available(Entity)->
      findall(source(Source,Directions,Labels,Polarity),
        (kb_store:assertion(Entity,Row),
         source_record(Entity,Row,source(Source,Directions,Labels,Polarity))),Rows),
      (Rows=[]->SourceData=source(null,[],[],unknown)
      ;Rows=[Only]->SourceData=Only
      ;throw(error(native_tva_source_conflict(Entity),kb_native_annotations)))
    ;SourceData=source(null,[],[],unknown)).
source_record(Entity,Row,source(Source,Directions,Labels,Polarity)) :-
    source_values(Row.properties,direction,Directions),
    source_strength_values(Row.properties,Labels),
    Source=_{assertionId:Entity,file:Row.source,line:Row.line},source_polarity(Row,Polarity).
source_polarity(Row,Polarity) :-
    (get_dict(expression,Row,Expression),is_dict(Expression),
     get_dict(type,Expression,application),get_dict(head,Expression,Head),is_dict(Head),
     get_dict(type,Head,symbol),get_dict(value,Head,Raw),
     text_atom(Raw,Name),atom_concat(x_,_,Name),
     get_dict(args,Expression,Args),is_list(Args)->
      (Name==x_not->(Args=[_],\+metta_source(Row)->Polarity=negative;Polarity=unknown)
      ;source_false_marker(Row.properties)->Polarity=source_false
      ;Polarity=positive)
    ;Polarity=unknown).
metta_source(Row) :-
    (get_dict(dialect,Row,Dialect),memberchk(Dialect,[metta,"metta"])
    ;get_dict(source,Row,Source),text_atom(Source,Path),
     file_name_extension(_,Extension,Path),downcase_atom(Extension,metta)).
source_false_marker(Properties) :-
    source_truth_labels(Properties,['cyc::original-tv','original-tv',original_tv],Original),
    source_truth_labels(Properties,[truth,truth_value,truthValue],Truth),
    ((memberchk('FALSE-DEF',Original),\+memberchk('TRUE-DEF',Original))
    ;(memberchk('FALSE',Truth),\+memberchk('TRUE',Truth))).
source_truth_labels(Properties,Names,Labels) :-
    findall(Label,
      (member(P,Properties),memberchk(P.name,Names),
      (atom(P.value);string(P.value)),text_atom(P.value,Text),
      (atom_concat(':',Bare,Text)->true;Bare=Text),upcase_atom(Bare,Label)),Labels).
source_values(Properties,Name,Values) :-
    must_be(list,Properties),
    findall(Value,(member(Item,Properties),must_be(dict,Item),
      Item.name==Name,
      ((atom(Item.value);string(Item.value))->text_atom(Item.value,Value);Value=Item.value)),Values).
source_strength_values(Properties,Values) :-
    findall(Value,(member(Item,Properties),memberchk(Item.name,[monotonicity,strength]),
      ((atom(Item.value);string(Item.value))->text_atom(Item.value,Value);Value=Item.value)),Values).

strength_category(_,_,_,null,_,_{status:unsupported,reason:not_loaded_assertion}) :- !.
strength_category(Facts,Entity,Context,Source,Labels,Category) :-
    effective(Facts,Entity,Context,cyc,monotonicity,Native,Records),
    (Native.origin==atom->
       valid_setting_effective(missing_assertion_strength,Native,Records,Checked),
       Category=Checked.put(reason,explicit_native_strength)
    ;Labels\=[]->
      kb_cache:terms_digest([source_strength(Labels,Source)],Revision),
      (Labels=[Value],memberchk(Value,[':DEFAULT',':MONOTONIC'])->
        Status=initialized,atom_string(Value,Text),Summary=_{renderer:native_data,kind:atom,value:Text},Reason=explicit_source
      ;Labels=[_]->Status=invalid,Summary=null,Reason=invalid_source_strength
      ;Status=conflict,Summary=null,Reason=ambiguous_source_strength),
      term_ast(Entity,[],AST),
      Category=_{status:Status,origin:source,supplier:Entity,supplierExpression:AST,
        summary:Summary,reason:Reason,recordRevision:Revision}
    ;Native.status\==uninitialized->
      valid_setting_effective(missing_assertion_strength,Native,Records,Checked),
      Category=Checked.put(reason,inherited_native_strength)
    ;setting_pair(Facts,default,missing_assertion_strength,missing_assertion_strength-Global),
     Category=Global.put(_{property:missing_assertion_strength,reason:global_missing_strength,recorded:false})).
source_direction(_,_,Native,_,Native) :- Native.origin==atom,!.
source_direction([],_,Native,_,Native) :- !.
source_direction(Values,Source,Native,_,Direction) :-
    kb_cache:terms_digest([source_direction(Values,Source,Native.recordRevision)],Revision),
    (Values=[Value],catch(setting_value(direction,Value),error(_,_),fail)->
      Status=initialized,atom_string(Value,Text),
       Summary=_{renderer:native_data,kind:atom,value:Text},Reason=explicit_source
    ;Values=[_]->Status=invalid,Summary=null,Reason=invalid_source_direction
    ;Status=conflict,Summary=null,Reason=ambiguous_source_direction),
    term_ast(Source.assertionId,[],SupplierExpression),
    Direction=_{status:Status,origin:source,supplier:Source.assertionId,supplierExpression:SupplierExpression,
      recordRevision:Revision,summary:Summary,reason:Reason,source:Source}.
mapped_strength(Facts,Context,Labels,Strength) :-
    (Labels=[Label],label_property(Label,Prop)->
      (Context==null->Entity=default;Entity=Context),
      setting_pair(Facts,Entity,Prop,Prop-E),
      Strength=E.put(_{property:Prop,interpretation:display_only,sourceMonotonicity:Label})
    ;Labels=[]->Strength=_{status:uninitialized,reason:no_source_monotonicity}
    ;Labels=[_]->Strength=_{status:unsupported,reason:unknown_source_monotonicity}
    ;Strength=_{status:conflict,reason:ambiguous_source_monotonicity}).
label_property(':MONOTONIC',monotonic_strength).
label_property(':DEFAULT',default_strength).

assertion_prior(Facts,Context,Source,Polarity,Labels,Prior) :-
    Base=_{kind:configured_assertion_prior,scope:asserted_formula,polarity:Polarity,source:Source,
      sourceMonotonicity:Labels,observed:false,affectsNativeTVA:false,materialized:false},
    (Source==null->
      Prior=Base.put(_{status:unsupported,reason:not_loaded_assertion,truth:null,confidence:null})
    ;Polarity==source_false->
      Prior=Base.put(_{status:unsupported,reason:source_false_without_canonical_negation,
        truth:null,confidence:null})
    ;\+memberchk(Polarity,[positive,negative])->
      Prior=Base.put(_{status:unsupported,reason:unknown_assertion_polarity,truth:null,confidence:null})
    ;Labels=[Label],prior_confidence_property(Label,Property)->
      (Context==null->SettingsKey=default;SettingsKey=Context),
      setting_pair(Facts,SettingsKey,asserted_positive_truth,asserted_positive_truth-Truth),
      setting_pair(Facts,SettingsKey,Property,Property-Confidence),
      prior_status(Truth,Confidence,Status),
      Prior=Base.put(_{status:Status,reason:configured_asserted_formula,
        truth:Truth.put(property,asserted_positive_truth),
        confidence:Confidence.put(property,Property)})
    ;Labels=[_,_|_]->
      Prior=Base.put(_{status:conflict,reason:ambiguous_source_monotonicity,truth:null,confidence:null})
    ;Prior=Base.put(_{status:unsupported,reason:unsupported_source_monotonicity,truth:null,confidence:null})).
prior_confidence_property(':MONOTONIC',asserted_monotonic_confidence).
prior_confidence_property(':DEFAULT',asserted_default_confidence).
prior_status(Truth,Confidence,Status) :-
    (member(Status,[conflict,invalid,uninitialized]),
      (Truth.status==Status;Confidence.status==Status)->true
    ;Status=initialized).

prior_families(Facts,Context,Prior,_{nars:Nars,opencog:OC}) :-
    (Prior.status==initialized->
       (Context==null->Key=default;Key=Context),
       effective(Facts,Key,null,cyc,asserted_positive_truth,_,[Truth]),
       effective(Facts,Key,null,cyc,Prior.confidence.property,_,[Confidence]),
       prior_family(nars,nars_truth_value(Truth,Confidence),Truth,Confidence,Nars),
       prior_family(opencog,stv(Truth,Confidence),Truth,Confidence,OC)
    ;unavailable_prior_family(nars,Prior.status,Nars),
     unavailable_prior_family(opencog,Prior.status,OC)).
prior_family(Family,Record,Truth,Confidence,Result) :-
    record_summary(Family,Record,Summary),native_record_dto(Record,Data),
    (json_number(Truth),json_number(Confidence)->
       (Family==nars->Format=nars,format(string(Notation),'%~w;~w%',[Truth,Confidence])
       ;Format=opencog_stv,format(string(Notation),'(stv ~w ~w)',[Truth,Confidence]))
    ;Format=prolog_data,term_string(Record,Notation,[quoted(true),ignore_ops(true),numbervars(false)])),
    Result=_{family:Family,kind:configured_assertion_prior,scope:asserted_formula,
      derived:true,stored:false,status:initialized,summary:Summary,data:Data,
      notation:Notation,notationFormat:Format}.
unavailable_prior_family(Family,Status,
    _{family:Family,kind:configured_assertion_prior,scope:asserted_formula,
      derived:true,stored:false,status:Status,summary:null,data:null,
      notation:null,notationFormat:null}).

export_native_state(State) :-
    native_access(synchronize(State)),validate_state(State).

% Copy-only readers deliberately bypass admission: they are safe under a lease.
export_native_snapshot(State) :-
    with_mutex(powder_native_annotations,
      (native_generations(Before),memory_snapshot(Local,Digest,Bases,Memory),
       configured_storage_file(File),read_snapshot_disk(File,Disk,Exists),
       select_snapshot(Bases,Local,Digest,Memory,Disk,Exists,State),
       validate_state(State),native_generations(After),
       require(Before==After,native_tva_concurrent_repl_change))).
restored_native_snapshot(State) :-
    with_mutex(powder_native_annotations,
      (memory_snapshot(_,_,_,State),validate_state(State))).
memory_snapshot(Local,Digest,Bases,Memory) :-
    native_generations(Before),collect_local(Before,Local,Digest),
    findall(baseline(R,S,D,M),baseline(R,S,D,M),Bases),
    must_be(ground,Bases),
    (Bases=[]->(Local==[]->Seq=0;Seq=1),state(Local,Seq,Memory)
    ;Bases=[baseline(Revision,Sequence,BaseDigest,Mode)]->
       must_be(nonneg,Sequence),must_be(atom,Revision),must_be(atom,BaseDigest),
       require(memberchk(Mode,[durable,imported]),domain_error(native_baseline_mode,Mode)),
       (Digest==BaseDigest->
         state(Local,Sequence,Memory),require(Memory.revision==Revision,native_tva_invalid_revision)
       ;Next is Sequence+1,state(Local,Next,Memory))
    ;throw(error(native_tva_baseline_conflict,kb_native_annotations))),
    native_generations(After),require(Before==After,native_tva_concurrent_repl_change).
read_snapshot_disk(File,State,Exists) :-
    atom_concat(File,'.lock',LockFile),
    (exists_file(LockFile)->
       catch(open(LockFile,read,Lock,[type(binary),lock(read),wait(false),close_on_abort(true)]),
         error(permission_error(lock,source_sink,_),_),throw(error(native_tva_busy,kb_native_annotations))),
       setup_call_cleanup(true,read_state(File,State,Exists),close(Lock))
    ;read_state(File,State,Exists),
     require(\+exists_file(LockFile),native_tva_snapshot_race)).
select_snapshot([],Local,_,Memory,Disk,Exists,State) :-
    (Local==[]->State=Disk
    ;Exists==true,Disk.records\==[]->
       throw(error(native_tva_unloaded_store_conflict,kb_native_annotations))
    ;Next is Disk.sequence+1,state(Memory.records,Next,State)).
select_snapshot([baseline(Base,Seq,BaseDigest,Mode)],_,Digest,Memory,Disk,Exists,State) :-
    (Digest==BaseDigest->
       (Exists==false,Mode==imported->State=Memory
       ;Exists==false,Seq>0->throw(error(native_tva_storage_missing,kb_native_annotations))
       ;State=Disk)
    ;require((Disk.revision==Base;(Exists==false,Mode==imported)),
       native_tva_persistence_conflict(Base,Disk.revision)),
     State=Memory).

import_native_state(State) :-
    validate_state(State),
    restore_access((install_memory(State,imported),clear_transient)).
persist_native_state(Reply) :-
    native_access(
      (synchronize(State),storage_file(File),
       storage_lock(File,
         (read_state(File,Disk,Exists),
          require((Disk.revision==State.revision;
            (Exists==false,baseline(State.revision,_,_,imported))),
            native_tva_revision_conflict(State.revision,Disk.revision)),
          (Exists==true->true;write_state(File,State)),
          kb_cache:terms_digest(State.records,Digest),
          retractall(baseline(_,_,_,_)),
          assertz(baseline(State.revision,State.sequence,Digest,durable)))),
       state_status(State,Reply))).
