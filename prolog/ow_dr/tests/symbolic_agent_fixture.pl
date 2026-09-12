:- module(symbolic_agent_fixture,[fixture_records/1,fixture_program/2,todo_program/1]).
:- use_module('../kb_reader',[]).
:- use_module('../kb_symbolic_agent_program',[]).

fixture_records(Records) :-
    named_fixture('symbolic-agent.krf',20480,Records).
named_fixture(Name,Offset,Records) :-
    source_file(symbolic_agent_fixture:fixture_records(_),Here),
    file_directory_name(Here,Tests),directory_file_path(Tests,fixtures,Fixtures),
    directory_file_path(Fixtures,Name,File),
    kb_reader:read_source(File,[diagnostics(false)],Assertions,_),
    findall(kb(Id,Mt,Term),
      (nth1(N,Assertions,assertion(Term,_,Mt,_,_,_)),
       Value is Offset+N,format(atom(Id),'a~16r',[Value])),Records).
fixture_program(Extra,Program) :-
    fixture_records(Base),append(Extra,Base,Records),
    kb_symbolic_agent_program:compile_program(Records,x_SymbolicTestAgent,x_SymbolicTestAgentMt,Program).
todo_program(Program) :-
    fixture_records(Base),length(Base,N),Offset is 20480+N,
    named_fixture('symbolic-agent-todos.krf',Offset,Extra),append(Base,Extra,Records),
    kb_symbolic_agent_program:compile_program(Records,x_SymbolicTestAgent,x_SymbolicTestAgentMt,Program).
