:- module(kb_assertion_view,[compiled_assertion/3,native_clause_text/4]).
:- use_module(kb_store,[]).
:- use_module(kb_runtime,[]).
:- use_module(library(error)).

compiled_assertion(Id,Expected,Reply) :-
    must_be(atom,Id),
    with_mutex(openworld_store,
      (kb_store:generation(Generation),
       (Expected==any->true;
        must_be(integer,Expected),
        (Expected=:=Generation->true;throw(error(generation_conflict(Expected,Generation),_)))),
       (kb_store:assertion(Id,Data)->true;throw(error(existence_error(assertion,Id),_))),
       native_clause_text(Data.module,Id,Text,Location),
       Reply=_{id:Id,generation:Generation,clause:Text,origin:live_native_clause,
         nativeFile:Location.file,nativeLine:Location.line,
         persistence:"Computed on demand from the active native clause; not retained as assertion metadata."})).

native_clause_text(Module,Id,Text,Location) :-
    (kb_runtime:module_assertion(Module,Id,_,Ref)->true;
     throw(error(existence_error(native_assertion_clause,Id),_))),
    clause(Head0,Guard,Ref),strip_module(Head0,_,Head),
    term_variables((Head:-Guard),Variables),
    kb_runtime:xc_plvars(Id,Names),
    (same_length(Variables,Names)->true;
     throw(error(domain_error(assertion_variable_names,Id),_))),
    name_pairs(Names,Variables,Pairs),
    with_output_to(string(Text),
      write_term((Head:-Guard),[quoted(true),variable_names(Pairs),numbervars(false),
        character_escapes(true),fullstop(true),nl(true)])),
    (clause_property(Ref,file(File))->true;File=null),
    (clause_property(Ref,line_count(Line))->true;Line=null),
    Location=_{file:File,line:Line}.
name_pairs([],[],[]).
name_pairs([Name|Names],[Variable|Variables],[Name=Variable|Pairs]) :-
    name_pairs(Names,Variables,Pairs).
