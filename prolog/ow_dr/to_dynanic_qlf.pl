:- module(to_dynanic_qlf, [main/1]).
:- use_module(kb_qlf).
:- use_module(library(main)).
:- use_module(library(http/json)).
:- initialization(cli_entry,main).

cli_entry :-
    source_file(to_dynanic_qlf:main(_),File),
    current_prolog_flag(os_argv,[_|Arguments]),
    (script_argument(Arguments,File)->main;true).
script_argument(['--'|_],_) :- !,fail.
script_argument([Argument|Rest],File) :-
    (exists_file(Argument)->same_file(Argument,File);script_argument(Rest,File)).

main(Args) :-
    catch(run(Args,Code),Error,(print_message(error,Error),Code=2)),
    halt(Code).
run([],2) :-
    format(user_error,'Usage: swipl .\\prolog\\ow_dr\\to_dynanic_qlf.pl -- [--force] COMPILED.kif.pl [FILE_OR_DIRECTORY ...]~n',[]).
run(Args,Code) :-
    Args\=[],
    (select('--force',Args,Inputs)->Options=[force(true)];Inputs=Args,Options=[]),
    discover_companions(Inputs,Files),
    statistics(walltime,[Start,_]),
    maplist(convert_one(Options),Files,Statuses),
    count_status(generated,Statuses,Generated),count_status(cache_hit,Statuses,Reused),
    count_status(failed,Statuses,Failed),count_status(busy,Statuses,Busy),count_status(missing,Statuses,Missing),
    statistics(walltime,[End,_]),Elapsed is (End-Start)/1000,length(Files,Total),
    json_write_dict(current_output,_{type:summary,files:Total,generated:Generated,reused:Reused,
      failed:Failed,busy:Busy,missing:Missing,elapsedSeconds:Elapsed},[width(0)]),nl,
    (Failed+Missing>0->Code=1;Busy>0->Code=3;Code=0).
convert_one(Options,File,Status) :-
    statistics(walltime,[Start,_]),
    catch((exists_file(File)->convert_companion(File,Options,Result);
           Result=_{source:File,status:missing,error:"Compiled companion disappeared before conversion."}),Error,
      (print_message(error,Error),message_to_string(Error,Message),
       statistics(walltime,[End,_]),Elapsed is (End-Start)/1000,
       Result=_{source:File,status:failed,error:Message,elapsedSeconds:Elapsed})),
    Status=Result.status,json_write_dict(current_output,Result,[width(0)]),nl,flush_output.
count_status(Status,Statuses,Count) :- include(=(Status),Statuses,Matching),length(Matching,Count).
