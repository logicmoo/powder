:- module(compile_kb,[main/1,parse_arguments/3]).
:- use_module(kb_compile).
:- use_module(library(main)).
:- initialization(cli_entry,main).

cli_entry :-
    source_file(compile_kb:main(_),File),
    current_prolog_flag(os_argv,[_|Arguments]),
    (script_argument(Arguments,File)->main;true).

script_argument(['--'|_],_) :- !,fail.
script_argument([Argument|Rest],File) :-
    (exists_file(Argument)->same_file(Argument,File)
    ;script_argument(Rest,File)).

main(Argv) :-
    catch(run_cli(Argv,Code),Error,
       (print_message(error,Error),flush_output(user_error),Code=2)),
    halt(Code).

run_cli(Argv,Code) :-
    parse_arguments(Argv,Options,Paths0),
    (memberchk(help(true),Options)
    ->usage,Code=0
    ;(Paths0=[]->default_paths(Paths);Paths=Paths0),
     (memberchk(recovery(_),Options)
     ->recover_sources(Paths,Options,Summary)
     ;compile_sources(Paths,Options,Summary)),
     format(user_error,
       'Summary: generated=~d cache-hit=~d busy=~d warnings=~d failures=~d~n',
       [Summary.generated,Summary.cacheHits,Summary.busy,Summary.warnings,Summary.failures]),
     flush_output(user_error),Code=Summary.exitCode).

default_paths([File]) :-
    (current_predicate(kb_paths:default_source/1)->kb_paths:default_source(File)
    ;source_file(compile_kb:main(_),Here),file_directory_name(Here,App),
     file_directory_name(App,Prolog),file_directory_name(Prolog,Root),
     directory_file_path(Root,'KBs',KBs),directory_file_path(KBs,sumo,Sumo),
     directory_file_path(Sumo,'tinyKB.kif',File)).

parse_arguments([],[],[]).
parse_arguments(['--'|Args],[],Args) :- !.
parse_arguments([Arg|Args],Options,Paths) :-
    (cli_option(Arg,Option)
    ->Options=[Option|Rest],parse_arguments(Args,Rest,Paths)
    ;atom_concat('--',_,Arg)
    ->throw(error(domain_error(compiler_option,Arg),_))
    ;Paths=[Arg|RestPaths],parse_arguments(Args,Options,RestPaths)).

cli_option('--force',force(true)).
cli_option('--edit',edit(true)).
cli_option('--no-progress',progress(none)).
cli_option('--progress=plain',progress(plain)).
cli_option('--strict-mappings',strict_mappings(true)).
cli_option('--recover-tmp',recovery(normal)).
cli_option('--force-recover',recovery(force)).
cli_option('--help',help(true)).
cli_option('-h',help(true)).
cli_option(Arg,editor(Editor)) :-atom_concat('--editor=',Editor,Arg),Editor\==''.
cli_option(Arg,state_dir(Dir)) :-atom_concat('--state-dir=',Dir,Arg),Dir\==''.
cli_option('--encoding=utf8',encoding(utf8)).
cli_option(Arg,features(Features)) :-
    atom_concat('--features=',Value,Arg),
    (Value==''->Features=[];atomic_list_concat(Features,',',Value)).

usage :-
    format('powder - Paraconsistent Open World Defeasible Epistemic Reasoner~nOffline compiler~n  swipl compile_kb.pl -- [OPTIONS] FILE_OR_DIRECTORY ...~n~n',[]),
    format('  --force --edit --editor=COMMAND --no-progress --progress=plain~n',[]),
    format('  --strict-mappings --recover-tmp --force-recover~n',[]),
    format('  --state-dir=PATH --encoding=utf8 --features=feature1,feature2~n',[]),
    format('Explicit files without a recognized extension use KIF; directories discover .kif, .krf, .meld and .metta only.~n',[]),
    format('Exit: 0 success; 1 source failure; 2 usage/setup error; 3 busy/deferred.~n',[]).
