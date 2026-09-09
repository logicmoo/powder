:- use_module('../kb_ids').
:- use_module('../kb_cache').
:- use_module('../kb_compile').
:- use_module(library(readutil)).
:- initialization(main,main).

main([hold,Lock]) :- !,
    setup_call_cleanup(open(Lock,append,S,[lock(write),wait(false)]),
       (writeln(ready),flush_output,read_line_to_string(user_input,_)),close(S)).
main([allocate,Dir,Output,Count]) :- !,
    atom_number(Count,N),reserve_ids(Dir,N,Ids),
    setup_call_cleanup(open(Output,write,S,[encoding(utf8)]),
                       write_one_line(S,Ids),close(S)).
main([compile,Source,State]) :- !,
    compile_source(Source,[force(true),state_dir(State),progress(none)],Result),
    writeln(Result.status).
main([batch,First,Second,State]) :- !,
    compile_sources([First,Second],[force(true),state_dir(State),progress(none)],Summary),
    writeln(Summary.exitCode).
main(_) :- halt(2).
