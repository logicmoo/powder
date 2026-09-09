:- module(kb_messages, [compile_report/2]).
:- use_module(kb_paths).
:- use_module(kb_terms).
:- use_module(library(lists)).
:- multifile prolog:message//1.

compile_report(Summary,Report) :-
    Failed=Summary.failures,Busy=Summary.busy,
    (Busy=:=0 -> format(string(Message),'~d source(s) failed to compile.',[Failed])
    ;Failed=:=0 -> format(string(Message),'~d source(s) are busy; retry after the active compiler finishes.',[Busy])
    ;format(string(Message),'~d source(s) failed to compile; ~d are busy.',[Failed,Busy])),
    include(problem_result,Summary.results,Problems),
    maplist(problem_issue,Problems,Issues),
    Report=_{message:Message,issues:Issues,
             counts:_{failed:Failed,busy:Busy,generated:Summary.generated,cacheHits:Summary.cacheHits}}.

problem_result(Result) :- memberchk(Result.status,[failed,busy]).
problem_issue(Result,Issue) :-
    (Result.status==busy ->
      raw_location(Result.source,null,null,'Another compiler owns this source.',Source,Line,Column,Message),
      Errors=[],Warnings=[Message],Notices=[],Rows=[_{type:warnings,message:Message}],Kind=busy
    ; failure_kind(Result,Kind),
      (Kind==resource_limit->
        raw_location(Result.source,null,null,
          'The compiler exhausted its stack or memory. This is a compiler/runtime failure, not a source-syntax error.',
          Source,Line,Column,Message)
      ;failure_location(Result,Source,Line,Column,Message)),
      (Kind==source->property_messages(Result,errors,[Message],Errors);Errors=[]),
      property_messages(Result,warnings,[],Warnings),
      property_messages(Result,notices,[],Notices),
      (get_dict(mapping_rows,Result,NativeRows)->mapping_rows_json(NativeRows,Rows)
      ;get_dict(mappingRows,Result,NativeRows)->mapping_rows_json(NativeRows,Rows)
      ;maplist(error_row,Errors,Rows))
    ),
    Issue=_{source:Source,line:Line,column:Column,message:Message,status:Result.status,kind:Kind,
            errors:Errors,warnings:Warnings,notices:Notices,mappingRows:Rows}.

failure_kind(Result,Kind) :-
    get_dict(error,Result,Raw),stored_error(Raw,Error),nonvar(Error),
    Error=error(Formal,_),nonvar(Formal),
    (Formal=resource_error(_)->Kind=resource_limit;
     Formal=source_error(_,_,_,_)->Kind=source), !.
failure_kind(_,compiler).

failure_location(Result,Source,Line,Column,Message) :-
    (get_dict(errorDetail,Result,D),is_dict(D)->
      raw_location(Result.source,D.line,D.column,D.message,Source,Line,Column,Message)
    ;get_dict(error,Result,Raw),stored_error(Raw,Error),nonvar(Error),
     Error=error(Detail,_),nonvar(Detail),Detail=source_error(File,L,C,M),
     atom(File),integer(L),integer(C),nonvar(M)->
      raw_location(File,L,C,M,Source,Line,Column,Message)
    ;get_dict(error,Result,Raw)->
      raw_location(Result.source,null,null,Raw,Source,Line,Column,Message)
    ;raw_location(Result.source,null,null,'Source compilation failed.',Source,Line,Column,Message)
    ).

stored_error(Raw,Raw) :- compound(Raw), !.
stored_error(Raw,Error) :-
    (atom(Raw);string(Raw)),
    catch(read_term_from_atom(Raw,Error,
      [module(kb_messages),syntax_errors(error),quasi_quotations(Quotes),cycles(false)]),
      error(syntax_error(_),_),fail),
    Quotes=[].

raw_location(File,L,C,Raw,Source,L,C,Message) :-
    (current_prolog_flag(windows,true)->downcase_atom(File,Identity);Identity=File),
    public_path(Identity,Public),
    (atom_concat('kbs/',Rest,Public)->atom_concat('KBs/',Rest,Source);Source=Public),
    message_text(Raw,Message).
message_text(warning(File,Line,Column,Raw),Message) :- !,
    format(string(Message),'~w:~d:~d: ~w',[File,Line,Column,Raw]).
message_text(Raw,Message) :- string(Raw), !,Message=Raw.
message_text(Raw,Message) :- format(string(Message),'~w',[Raw]).

property_messages(Result,Name,Default,Messages) :-
    (get_dict(properties,Result,Properties),is_list(Properties),
      memberchk(Name-Values,Properties)->true
    ;get_dict(Name,Result,Values)->true
    ;Values=Default),
    (is_list(Values)->maplist(message_text,Values,Messages);message_text(Values,Text),Messages=[Text]).
error_row(Message,_{type:errors,message:Message}).

prolog:message(error(compile_incomplete(Summary),_)) -->
    {compile_report(Summary,Report)},
    ['~w'-[Report.message]],issue_lines(Report.issues).
prolog:message(error(generation_conflict(Expected,Current),_)) -->
    ['The active KB changed (expected generation ~w, now ~w). Refresh and retry.'-[Expected,Current]].
prolog:message(error(conflicting_assertion_id(Id),_)) -->
    ['Assertion ID ~w occurs in more than one selected source.'-[Id]].

issue_lines([]) --> [].
issue_lines([Issue|Rest]) -->
    {issue_location(Issue,Location)},
    [nl,'~w: ~w'-[Location,Issue.message]],issue_lines(Rest).
issue_location(Issue,Location) :-
    (integer(Issue.line),integer(Issue.column)->
      format(string(Location),'~w:~d:~d',[Issue.source,Issue.line,Issue.column])
    ;atom_string(Issue.source,Location)).
