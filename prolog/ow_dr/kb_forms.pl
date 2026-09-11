:- module(kb_forms,
          [replace_owner/4, remove_owner/2, owner_record/5, form_record/4,
           contribution/6, record_metadata/4, record_metadata_terms/3,
           resolve_id/3, same_form/3, visible_records/2, eligible_records/4,
           shared_clause/5, form_count/2, assertion_source_ref/3]).
:- use_module(kb_cache, [guarded_clause/3,valid_assertion_id/1]).
:- use_module(kb_ids, [reserve_ids/3,state_directory/2]).
:- use_module(library(error)).
:- use_module(library(lists)).
:- dynamic form/6, mt_record/3, contribution/6.

% One guarded clause per structural form; one identity per (form, MT).
% Ground contribution metadata remains associated with its original source ID.
replace_owner(Module,File,Records,AllowVersions) :-
    with_mutex(powder_forms,
      transaction((retractall(contribution(Module,File,_,_,_,_)),
                   maplist(intern_record(Module,File,AllowVersions),Records),
                   prune_unsupported))).

intern_record(Module,File,AllowVersions,native_record(Occurrence,Semantic,Metadata,SourceRef)) :-
    must_be(ground,Metadata),
    (valid_assertion_id(Occurrence)->true;domain_error(assertion_id,Occurrence)),
    (memberchk(xc_microtheory(Occurrence,Mt),Metadata),ground(Mt)->true;
      domain_error(assertion_microtheory,Occurrence)),
    check_incoming_id(Module,File,Occurrence,Semantic,Metadata,AllowVersions),
    variant_sha1(Semantic,Hash),
    (form(Hash,Key,Existing,_,_,_),Existing =@= Semantic->true;
      flag(powder_form_key,N,N+1),atom_concat(form_,N,Key),
      guarded_clause(Key,Semantic,(Head:-Guard)),
      shared_guard(Guard,Trusted),
      assertz(kb_forms:(Head:-Trusted),Ref),functor(Head,Name,Arity),
      assertz(form(Hash,Key,Semantic,Ref,Name,Arity))),
    (mt_record(Key,Mt,Primary)->true;
      available_number(Occurrence,Primary),
      assertz(mt_record(Key,Mt,Primary))),
    (contribution(Module,File,Occurrence,Primary,Old,_)->
      (Old==Metadata->true;throw(error(conflicting_occurrence_properties(Occurrence),_)))
    ;assertz(contribution(Module,File,Occurrence,Primary,Metadata,SourceRef))).

shared_guard(Guard,kb_runtime:shared_fact_guard(Key,Slots)) :-
    Guard=..[x_cid,Key|Slots],!.
shared_guard(x_cid_io(Key,Body,HeadVars,BodyVars),
             kb_runtime:shared_rule_guard(Key,Body,HeadVars,BodyVars)).

check_incoming_id(Module,File,Id,Semantic,Metadata,AllowVersions) :-
    forall((contribution(OtherModule,OtherFile,Id,Primary,OtherMetadata,_),
            mt_record(Key,_,Primary),form(_,Key,Existing,_,_,_)),
      (Existing =@= Semantic->true;
        AllowVersions==true,Module\==OtherModule,
        source_identity(Metadata,Id,Source),source_identity(OtherMetadata,Id,Source)->true;
        throw(error(conflicting_assertion_id(Id),context(native_load,File-OtherFile))))).
source_identity(Metadata,Id,Source) :-
    memberchk(xc_source_file(Id,Path),Metadata),atom(Path),
    (current_prolog_flag(windows,true)->downcase_atom(Path,Source);Source=Path).

available_number(Preferred,Number) :-
    (\+mt_record(_,_,Preferred),\+contribution(_,_,Preferred,_,_,_)->Number=Preferred;
      state_directory([],Directory),reserve_ids(Directory,1,[Candidate]),
      available_number(Candidate,Number)).

remove_owner(Module,File) :-
    with_mutex(powder_forms,
      transaction((retractall(contribution(Module,File,_,_,_,_)),prune_unsupported))).
prune_unsupported :-
    forall((mt_record(Key,Mt,Id),\+contribution(_,_,_,Id,_,_)),retractall(mt_record(Key,Mt,Id))),
    forall((form(Hash,Key,_,Ref,_,_),\+mt_record(Key,_,_)),
      (erase(Ref),retractall(form(Hash,Key,_,_,_,_)))).

owner_record(Module,Occurrence,Primary,Semantic,SourceRef) :-
    contribution(Module,_,Occurrence,Primary,_,SourceRef),
    form_record(Primary,Semantic,_,_).
form_record(Id,Semantic,Mt,Ref) :-
    mt_record(Key,Mt,Id),form(_,Key,Semantic,Ref,_,_).

visible_records(Modules,Ids) :-
    findall(Id,(member(Module,Modules),contribution(Module,_,_,Id,_,_)),All),sort(All,Ids).
resolve_id(Modules,Input,Primary) :-
    (nonvar(Input),mt_record(_,_,Input),
     once((member(Module,Modules),contribution(Module,_,_,Input,_,_)))->Primary=Input
    ;nonvar(Input)->member(Module,Modules),contribution(Module,_,Input,Primary,_,_)
    ;visible_records(Modules,Ids),member(Primary,Ids),Input=Primary).

same_form(Modules,Id,Other) :-
    resolve_id(Modules,Id,Primary),mt_record(Key,_,Primary),
    mt_record(Key,_,Other),Other\==Primary,
    once((member(Module,Modules),contribution(Module,_,_,Other,_,_))).

record_metadata_terms(Modules,Id,Terms) :-
    findall(Name-Value,
      (member(Module,Modules),contribution(Module,_,_,Id,Metadata,_),
       member(Term,Metadata),Term=..[Name,_,Value]),Pairs),
    findall(Name,member(Name-_,Pairs),Names0),sort(Names0,Names),
    findall(Term,
      (member(Name,Names),findall(Value,member(Name-Value,Pairs),Values),
       joined_value(Name,Values,Joined),Term=..[Name,Id,Joined]),Terms).
record_metadata(Modules,Id,Property,Value) :-
    atom_concat(xc_,Property,Name),
    record_metadata_terms(Modules,Id,Terms),member(Term,Terms),Term=..[Name,Id,Value].
joined_value(Name,Values,Joined) :-
    memberchk(Name,[xc_notices,xc_warnings,xc_errors,xc_mapping_rows]),
    maplist(is_list,Values),!,append(Values,All),list_to_set(All,Joined).
joined_value(_,Values,Value) :- list_to_set(Values,Unique),member(Value,Unique).

eligible_records(Key,Modules,Mt,Ids) :-
    findall(Id,(mt_record(Key,Mt,Id),
      once((member(Module,Modules),contribution(Module,_,_,Id,_,_)))),Ids).
shared_clause(Name,Arity,Key,Head,Guard) :-
    form(_,Key,_,Ref,Name,Arity),clause(kb_forms:Head,Guard,Ref).
form_count(Modules,Count) :-
    visible_records(Modules,Ids),
    findall(Key,(member(Id,Ids),mt_record(Key,_,Id)),All),sort(All,Unique),length(Unique,Count).
assertion_source_ref(Modules,Id,Ref) :-
    member(Module,Modules),contribution(Module,_,_,Id,_,Ref),!.
