:- module(kb_symbolic_agent_profiles,[catalog/1,compile_profile/3]).
:- use_module(kb_reader,[]).
:- use_module(kb_symbolic_agent_program,[]).
:- use_module(kb_store,[]).
:- use_module(kb_terms,[]).
:- use_module(library(crypto)).
:- use_module(library(lists)).
:- use_module(library(time)).

% This file is an immutable application input, never a live-KB source or a
% browser-selected path. The vocabulary and every dialogue/plan live in KRF.
profile('cyc-starter-v1','cyc-starter.krf',x_PowderCycStarter,x_PowderCycStarterMt).
catalog([json{id:"cyc-starter-v1",label:"Cyc starter — limited app-owned profile",
    origin:"app_owned_profile",examples:["hello","help","capabilities","new todo"],
    description:"Finite declarative dialogue and typed open-TODO creation. No general English, corpus queries, source loads, model or operator access."}]).

compile_profile(Input,Program,Snapshot) :-
    (string(Input)->atom_string(Id,Input);Id=Input),
    (profile(Id,Name,Agent,Definition)->true;throw(error(symbolic_unknown_profile,_))),
    source_file(kb_symbolic_agent_profiles:catalog(_),Here),
    file_directory_name(Here,App),directory_file_path(App,profiles,Directory),
    directory_file_path(Directory,Name,File),
    (exists_file(File),size_file(File,Bytes),Bytes=<65536->true;
      throw(error(symbolic_profile_unavailable,_))),
    call_with_time_limit(2,read_profile(File,Id,Agent,Definition,Program,Snapshot)).
read_profile(File,Id,Agent,Definition,Program,Snapshot) :-
    crypto_file_hash(File,Hash,[algorithm(sha256)]),
    kb_reader:read_source(File,[diagnostics(false)],Assertions,_),
    crypto_file_hash(File,After,[algorithm(sha256)]),
    (Hash==After->true;throw(error(symbolic_profile_changed_during_read,_))),
    length(Assertions,Count),
    (between(1,512,Count)->true;throw(error(symbolic_profile_record_limit,_))),
    findall(row(N,A),nth1(N,Assertions,A),Rows),
    maplist(profile_record(Id,Hash),Rows,Records,Locations),
    kb_symbolic_agent_program:compile_program(Records,Agent,Definition,Program),
    findall(Mt,(member(kb(_,Mt,_),Records);
      get_dict(_,Program.mts,Mt);member(Mt,Program.knowledgeMts)),Mts0),
    sort([Definition|Mts0],Mts),maplist(mt_text,Mts,Selected),
    maplist(coverage(Records),Mts,Coverage),
    kb_store:generation(G),atom_string(Hash,HashText),
    Snapshot=json{generation:G,snapshotHash:HashText,selectedMts:Selected,
      recordCount:Count,microtheories:Coverage,origin:"app_owned_profile",
      profileSource:json{path:"profiles/cyc-starter.krf",sha256:HashText,
        completeness:"app_owned_program_only",occurrences:Locations}}.
profile_record(Profile,Hash,row(N,assertion(Term,_,Mt,Line,_,_)),kb(Id,Mt,Term),json{id:Text,line:Line}) :-
    % These are explicitly namespaced application-program locators, not native
    % assertion IDs. File hash + occurrence ordinal preserves duplicate forms.
    format(atom(Id),'app-profile:~w:~w:~d',[Profile,Hash,N]),atom_string(Id,Text).
mt_text(Mt,Text) :- kb_terms:context_key(Mt,Key),atom_string(Key,Text).
coverage(Records,Mt,json{mt:Text,recordCount:Count,status:"app_owned_program"}) :-
    mt_text(Mt,Text),findall(Id,member(kb(Id,Mt,_),Records),Ids),length(Ids,Count).
