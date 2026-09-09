:- module(kb_editor,
          [repair_action/5,parse_repair_response/2,editor_command/4,
           print_diagnostic/2,monotonic_seconds/1]).

:- use_module(library(option)).
:- use_module(library(readutil)).
:- use_module(library(process)).
:- use_module(library(lists)).
:- use_module(kb_cache).

monotonic_seconds(Seconds) :-
    statistics(walltime,[Millis,_]), Seconds is Millis/1000.

print_diagnostic(File, Error) :-
    format(user_error,'~nERROR: ~w: ',[File]),
    print_message(error,Error),
    diagnostic_location(Error,Line,Column),
    (integer(Line),integer(Column)->
      format(user_error,'Source: ~w:~d:~d~n',[File,Line,Column]),
      catch(source_excerpt(File,Line),ExcerptError,print_message(warning,ExcerptError))
    ;format(user_error,'File: ~w (no source location; compiler/runtime failure).~n',[File])),
    flush_output(user_error).

diagnostic_location(error(_,context(source(_,L,C),_)),L,C) :- integer(L),integer(C),!.
diagnostic_location(error(source_error(_,L,C,_),_),L,C) :- integer(L),integer(C),!.
diagnostic_location(error(_,source(_,L,C)),L,C) :- integer(L),integer(C),!.
diagnostic_location(error(_,file(_,L,C,_)),L,C) :- integer(L),integer(C),!.
diagnostic_location(warning(_,L,C,_),L,C) :- !.
diagnostic_location(_,null,null).

source_excerpt(File,Line) :-
    setup_call_cleanup(open(File,read,S,[encoding(iso_latin_1)]),
                       excerpt_line(S,1,Line),close(S)).
excerpt_line(S,N,Target) :-
    read_line_to_string(S,Text),
    ( Text==end_of_file -> true
    ; N==Target -> string_length(Text,Length),
      Take is min(Length,160),sub_string(Text,0,Take,_,Short),
      format(user_error,'  ~d | ~s~n',[N,Short])
    ; N1 is N+1,excerpt_line(S,N1,Target)).

parse_repair_response(end_of_file,abort) :- !.
parse_repair_response(Text,Action) :-
    string(Text),normalize_space(string(Trimmed),Text),
    ( Trimmed=="" -> Action=edit
    ; Trimmed=="s" -> Action=skip
    ; Trimmed=="S" -> Action=suppress
    ; memberchk(Trimmed,["q","quit"]) -> Action=abort
    ; Action=invalid).

repair_action(File,Error,Options,Action,Elapsed) :-
    monotonic_seconds(Start),
    ( stream_property(user_input,tty(true))
    -> prompt_action(File,Error,Options,Action)
    ; format(user_error,'Repair skipped: standard input is redirected (no editor launched).~n',[]),
      flush_output(user_error),Action=skip
    ),
    monotonic_seconds(End),Elapsed is max(0,End-Start).

prompt_action(File,Error,Options,Action) :-
    format(user_error,'Enter: edit and retry; s: skip; S: stop repair prompts; q/quit: abort > ',[]),
    flush_output(user_error),
    read_line_to_string(user_input,Text),
    parse_repair_response(Text,Choice),
    ( Choice==invalid
    -> format(user_error,'Use Enter, s, S, q, or quit.~n',[]),
       prompt_action(File,Error,Options,Action)
    ; Choice==edit
    -> diagnostic_location(Error,Line,Column),
       (integer(Line)->EditorLine=Line;EditorLine=1),
       (integer(Column)->EditorColumn=Column;EditorColumn=1),
       catch(launch_editor(File,EditorLine,EditorColumn,Options,Outcome),
             E,(print_message(error,E),Outcome=unchanged)),
       (Outcome==changed -> Action=retry
       ; format(user_error,'Editor did not produce a saved change; choose an action again.~n',[]),
         flush_output(user_error),prompt_action(File,Error,Options,Action))
    ; Action=Choice).

launch_editor(File,Line,Column,Options,Outcome) :-
    editor_command(Options,Executable,Prefix,Kind),
    file_digest(File,Before),
    location_args(Kind,File,Line,Column,Position),
    append(Prefix,Position,Args),
    format(user_error,'Opening ~w for ~w:~d:~d (save and close to retry).~n',
           [Executable,File,Line,Column]),
    flush_output(user_error),
    ( Kind==console
    -> process_create(Executable,Args,
           [stdin(std),stdout(std),stderr(std),window(true),process(Pid)]),
       process_wait(Pid,Status),
       (Status==exit(0)->changed_file(File,Before,Outcome)
       ;throw(error(editor_exit(Status),_)))
    ; process_create(Executable,Args,
           [stdin(std),stdout(std),stderr(std),window(false),process(Pid)]),
      format(user_error,'Waiting for a stable save; press Enter to return to the repair prompt.~n',[]),
      flush_output(user_error),
      monotonic_seconds(Now),Deadline is Now+30,
      wait_saved(File,Before,Pid,Deadline,Outcome)
    ).

changed_file(File,Before,Outcome) :-
    file_digest(File,After),(After\==Before->Outcome=changed;Outcome=unchanged).

wait_saved(File,Before,Pid,Deadline,Outcome) :-
    sleep(0.25),
    ( editor_failed(Pid)
    -> Outcome=unchanged
    ; wait_for_input([user_input],Ready,0),Ready\=[]
    -> read_line_to_string(user_input,_),Outcome=unchanged,
       reap_if_exited(Pid)
    ; catch(file_digest(File,Now),_,fail),Now\==Before
    -> sleep(0.4),
       (catch(file_digest(File,Stable),_,fail),Stable==Now
       ->Outcome=changed,reap_if_exited(Pid)
       ;wait_saved(File,Before,Pid,Deadline,Outcome))
    ; monotonic_seconds(Time),Time>=Deadline
    -> format(user_error,'No saved change after 30 seconds; returning to the prompt.~n',[]),
       Outcome=unchanged,reap_if_exited(Pid)
    ; wait_saved(File,Before,Pid,Deadline,Outcome)
    ).

editor_failed(Pid) :-
    catch(process_wait(Pid,Status,[timeout(0)]),_,Status=exit(0)),
    Status\==timeout,Status\==exit(0),
    format(user_error,'Editor exited unsuccessfully: ~w.~n',[Status]),
    flush_output(user_error).

reap_if_exited(Pid) :-
    catch(process_wait(Pid,_,[timeout(0)]),_,true).

location_args(console,File,L,C,[Location]) :-
    format(atom(Location),'~w:~d:~d',[File,L,C]).
location_args(code,File,L,C,['--goto',Location]) :-
    format(atom(Location),'~w:~d:~d',[File,L,C]).
location_args(gui,File,_,_,[File]).

editor_command(Options,Executable,Args,Kind) :-
    (option(editor(Spec),Options)->true
    ;getenv('VISUAL',Spec),Spec\==''->true
    ;getenv('EDITOR',Spec),Spec\==''->true
    ;discover_editor(Spec)),
    command_words(Spec,[Command|Args]),
    resolve_editor(Command,Resolved),
    file_base_name(Command,Base0),downcase_atom(Base0,Base),
    (memberchk(Base,[edit,'edit.exe'])->Kind=console
    ;memberchk(Base,[code,'code.exe','code.cmd'])->Kind=code
    ;Kind=gui),
    native_editor(Kind,Resolved,Executable).

native_editor(code,Resolved,Executable) :-
    current_prolog_flag(windows,true),
    file_directory_name(Resolved,Bin),
    file_directory_name(Bin,Install),
    directory_file_path(Install,'Code.exe',App),
    exists_file(App),!,
    absolute_file_name(App,Executable,[access(execute)]).
native_editor(_,Executable,Executable).

discover_editor(Editor) :-
    member(Editor,[edit,code]),
    catch(resolve_editor(Editor,_),_,fail),!.
discover_editor(_) :-
    throw(error(existence_error(editor,'Set --editor, VISUAL, or EDITOR'),_)).

resolve_editor(Command,Executable) :-
    ( exists_file(Command)
    -> absolute_file_name(Command,Executable,[access(execute)])
    ; absolute_file_name(path(Command),Executable,
             [access(execute),file_errors(fail)])
    -> true
    ; current_prolog_flag(windows,true),
      atom_concat(Command,'.exe',Exe),
      absolute_file_name(path(Exe),Executable,[access(execute),file_errors(fail)])
    -> true
    ; throw(error(existence_error(editor,Command),_))
    ).

command_words(Spec,Words) :-
    (string(Spec)->atom_string(Atom,Spec);Atom=Spec),
    (exists_file(Atom)->Words=[Atom]
    ;atom_codes(Atom,Codes),phrase(words(Words),Codes),Words\=[]->true
    ;throw(error(domain_error(editor_command,Spec),_))).

words(Ws) --> blanks, words_more(Ws).
words_more([]) --> [].
words_more([W|Ws]) --> word(Cs),{Cs\=[],atom_codes(W,Cs)},blanks,words_more(Ws).
word(Cs) --> "\"", quoted_codes(Cs), "\"", !.
word([C|Cs]) --> [C],{\+code_type(C,space),C=\=0'"},unquoted(Cs).
unquoted([C|Cs]) --> [C],{\+code_type(C,space)},!,unquoted(Cs).
unquoted([]) --> [].
quoted_codes([C|Cs]) --> [C],{C=\=0'"},!,quoted_codes(Cs).
quoted_codes([]) --> [].
blanks --> [C],{code_type(C,space)},!,blanks.
blanks --> [].
