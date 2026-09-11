:- module(kb_reload, [reload_changed_files/1, remember_loaded_code/0]).
:- use_module(kb_paths).
:- use_module(library(crypto)).
:- use_module(library(lists)).
:- use_module(library(ugraphs)).
:- dynamic loaded_digest/2, failed_reload/1.
:- thread_local reloading/0, loading_file/1, reload_message/4.
:- multifile user:message_hook/3, user:term_expansion/2.

application_file(File) :-
    source_file(File),app_dir(App),atom_concat(App,'/',Prefix),
    atom_concat(Prefix,Relative,File),file_base_name(Relative,Relative),
    file_name_extension(Stem,pl,Relative),\+sub_atom(Stem,_,1,_,'.'),
    (atom_concat('kb_',_,Relative);memberchk(Relative,['app.pl','compile_kb.pl'])),
    (source_file_property(File,module(_));memberchk(Relative,['app.pl','compile_kb.pl'])).

remember_loaded_code :-
    (reloading->true;
      forall(application_file(File),
        (crypto_file_hash(File,Hash,[algorithm(sha256)]),
         retractall(loaded_digest(File,_)),assertz(loaded_digest(File,Hash))))).

changed_file(File) :-
    (failed_reload(File)->true;
      loaded_digest(File,Loaded)->
        crypto_file_hash(File,Now,[algorithm(sha256)]),Now\==Loaded
    ;source_file_property(File,modified(Loaded)),time_file(File,Now),Now=\=Loaded).

reload_changed_files(Report) :-
    (mutex_trylock(openworld_code_reload)->
      setup_call_cleanup(true,
        with_mutex(openworld_store,reload_locked(Report)),
        mutex_unlock(openworld_code_reload))
    ;throw(error(application_reload_busy,_))).

reload_locked(Report) :-
    setup_call_cleanup(asserta(reloading,Ref),
      catch(reload_files(Report),Error,
        (invalidate_compiler_identity,throw(Error))),
      (erase(Ref),retractall(loading_file(_)),retractall(reload_message(_,_,_,_)))).

reload_files(Report) :-
    findall(File,(application_file(File),changed_file(File)),Changed0),
    sort(Changed0,Changed),dependency_order(Changed,Files),
    maplist(reload_file,Files,Results),
    findall(File,member(result(File,ok,_),Results),Loaded),
    findall(Issue,(member(result(File,error,Messages),Results),member(Message,Messages),
      Issue=_{source:File,status:failed,message:Message}),Issues),
    findall(_{source:File,message:Message},(member(result(File,ok,Messages),Results),member(Message,Messages)),Warnings),
    (Issues\=[]->
      length(Loaded,Count),
      format(string(Message),'Application reload failed after ~d file(s) reloaded. Applied code changes cannot be rolled back; fix the reported files and retry or restart. KB sources were not recompiled.',[Count]),
      throw(error(application_reload_failed(_{message:Message,issues:Issues,reloaded:Loaded}),_))
    ;true),
    (Files=[]->true;ensure_no_pending_changes,kb_compile:initialize_implementation_identity),
    kb_store:generation(Generation),length(Loaded,Count),
    (Count=:=0->Message="No changed Prolog application files."
    ;format(string(Message),'Reloaded ~d changed Prolog application file(s). KB generation and sources are unchanged.',[Count])),
    Report=_{reloaded:Loaded,count:Count,warnings:Warnings,generation:Generation,message:Message}.

dependency_order(Files,Ordered) :-
    findall(Dependency-Owner,
      (member(Dependency,Files),source_file_property(Dependency,load_context(Module,_,_)),
       member(Owner,Files),Owner\==Dependency,source_file_property(Owner,module(Module))),Edges),
    vertices_edges_to_ugraph(Files,Edges,Graph),
    (top_sort(Graph,Ordered)->true;Ordered=Files).

reload_file(File,result(File,Status,Messages)) :-
    retractall(reload_message(File,_,_,_)),
    catch(setup_call_cleanup(
      (crypto_file_hash(File,Expected,[algorithm(sha256)]),asserta(loading_file(File),Ref)),
      (load_application_file(File),crypto_file_hash(File,Actual,[algorithm(sha256)]),
       (Actual==Expected->true;throw(error(application_file_changed_during_reload(File),_)))),
      erase(Ref)),
      Error,(message_to_string(Error,Message),assertz(reload_message(File,error,Error,Message)))),
    findall(Text,reload_message(File,error,_,Text),Errors),
    (Errors=[]->
      Status=ok,retractall(failed_reload(File)),
      retractall(loaded_digest(File,_)),assertz(loaded_digest(File,Expected)),
      findall(Text,reload_message(File,warning,_,Text),Messages)
    ;Status=error,Messages=Errors,
     (failed_reload(File)->true;assertz(failed_reload(File)))).

load_application_file(File) :-
    (source_file_property(File,module(Module))->true;Module=user),
    (load_files(Module:File,[if(true),silent(true),register(false)])->true;
      throw(error(application_reload_failed(File),_))).

ensure_no_pending_changes :-
    (application_file(File),changed_file(File)->
      throw(error(application_file_changed_during_reload(File),_));true).

invalidate_compiler_identity :-
    (current_predicate(kb_compile:loaded_implementation_identity/1)->
      retractall(kb_compile:loaded_implementation_identity(_));true).

user:message_hook(Term,Kind,_) :-
    kb_reload:reloading,kb_reload:loading_file(File),memberchk(Kind,[error,warning]),
    message_to_string(Term,Text),assertz(kb_reload:reload_message(File,Kind,Term,Text)),fail.

user:term_expansion((:- initialization(_,main)),[]) :-
    kb_reload:reloading,kb_reload:loading_file(File),
    prolog_load_context(file,File).
