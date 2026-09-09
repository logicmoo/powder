:- begin_tests(ow_messages).
:- use_module('../kb_messages').
:- use_module('../kb_server',[]).

failed_result(N,Result) :-
    format(atom(Source),'KBs/failure-~d.krf',[N]),
    term_string(error(source_error(Source,N,17,'Microtheory must be a symbol'),context(kb_reader,ignored)),Error),
    Result=result{source:Source,status:failed,error:Error,warnings:[]}.
summary(Summary) :-
    numlist(1,15,Ns),maplist(failed_result,Ns,Failures),
    length(Hits,42),maplist(=(result{status:cache_hit,source:'never-show-this-cache-hit.krf'}),Hits),
    append(Hits,Failures,Results),
    Summary=summary{failures:15,busy:0,cacheHits:42,generated:0,results:Results}.

test(report_omits_all_successes_and_has_locations) :-
    summary(S),compile_report(S,R),
    assertion(R.message=="15 source(s) failed to compile."),
    assertion(length(R.issues,15)),
    R.issues=[First|_],
    assertion(First.source=='KBs/failure-1.krf'),
    assertion(First.line=:=1),assertion(First.column=:=17),
    assertion(First.message=="Microtheory must be a symbol"),
    assertion(First.errors==["Microtheory must be a symbol"]),
    assertion(First.mappingRows=[_{type:errors,message:"Microtheory must be a symbol"}]).

test(exception_message_never_dumps_summary) :-
    summary(S),message_to_string(error(compile_incomplete(S),_),Message),
    assertion(\+sub_string(Message,_,_,_,"Unknown error term")),
    assertion(\+sub_string(Message,_,_,_,"never-show-this-cache-hit")),
    assertion(sub_string(Message,_,_,_,"KBs/failure-15.krf:15:17")),
    string_length(Message,N),assertion(N<2000).

test(plain_error_string_does_not_instantiate_fake_source) :-
    R=result{status:failed,source:'KBs/a.krf',error:"Failure",warnings:[]},
    S=summary{failures:1,busy:0,cacheHits:0,generated:0,results:[R]},
    compile_report(S,Report),Report.issues=[I],
    assertion(I.message=="Failure"),assertion(I.line==null).

test(source_failures_take_precedence_over_busy) :-
    S=summary{failures:1,busy:1},
    kb_server:error_response(error(compile_incomplete(S),_),422,compile_failed).

test(generation_conflict_is_actionable) :-
    message_to_string(error(generation_conflict(1,2),_),Text),
    assertion(sub_string(Text,_,_,_,"Refresh and retry")),
    assertion(\+sub_string(Text,_,_,_,"Unknown error term")).

test(resource_fault_is_not_a_source_assertion_error) :-
    term_string(error(resource_error(stack),context(compiler,retained_state)),Error),
    R=result{status:failed,source:'KBs/file.kif',error:Error,warnings:[]},
    S=summary{failures:1,busy:0,cacheHits:0,generated:0,results:[R]},
    compile_report(S,Report),Report.issues=[Issue],
    assertion(Issue.kind==resource_limit),assertion(Issue.line==null),
    assertion(Issue.column==null),assertion(Issue.errors==[]),assertion(Issue.mappingRows==[]).
:- end_tests(ow_messages).
