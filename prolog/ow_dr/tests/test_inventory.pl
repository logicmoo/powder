:- begin_tests(disk_inventory).
:- use_module('../kb_inventory').
:- use_module(library(filesex)).

test(rule_gaf_other_and_declaration_targets) :-
    classify_assertion((x_r(X):-and(x_p(X))),rule,x_r(X)),
    classify_assertion(x_p(x_A),gaf,_),
    classify_assertion(x_p(_),other,_),
    classify_assertion(x_implies(x_p(x_A),x_q(x_A)),other,_),
    declaration_target(x_argIsa(x_only_declared,2,x_Thing),x_only_declared,null,argIsa),
    declaration_target(x_resultIsa(x_Fn,x_Thing),x_Fn,null,resultIsa),
    declaration_target(x_arity(x_only_declared,3),x_only_declared,3,arity),
    assertion(\+declaration_target(x_argSomething(x_not_a_predicate,2),_,_,_)).

test(source_inventory_counts_lf_bytes_and_keeps_declaration_only_mt) :-
    tmp_file(powder_inventory,D),make_directory(D),
    directory_file_path(D,'example.krf',Source),kb_paths:cache_paths(Source,Compiled,_),
    setup_call_cleanup(true,
      (setup_call_cleanup(open(Source,write,S,[encoding(utf8)]),
        format(S,'(in-microtheory (DataOfFn Something))~n(p A)~n(<=== (r ?X) (p ?X))~n(argIsa missingHead 2 Thing)~n(in-microtheory EmptyMt)~n',[]),close(S)),
       setup_call_cleanup(open(Compiled,write,P,[encoding(octet),newline(posix)]),
         format(P,':- throw(never_execute).\r\nx_p(x_A) :- x_cid(a1).\nxc_microtheory(a1,x_Mt).',[]),close(P)),
       inventory_source(Source,Data),
       assertion(Data.counts.semanticAssertionCount=:=3),
       assertion(Data.counts.ruleCount=:=1),assertion(Data.counts.gafCount=:=2),
       assertion(Data.compiled.physicalLineCount=:=2),
       assertion(Data.compiled.directiveCount=:=1),
       assertion(Data.compiled.semanticClauseCount=:=1),
       member(Empty,Data.microtheories),Empty.label=="EmptyMt",assertion(Empty.declarationOnly==true),
       member(Context,Data.microtheories),Context.label=="(DataOfFn Something)",
       member(Pred,Context.predicates),Pred.name==x_missingHead,
       assertion(Pred.arity==null),assertion(Pred.declarationReferenceCount=:=1),
       assertion(Pred.headOccurrenceCount=:=0)),
      delete_directory_and_contents(D)).

test(readable_compound_filename_and_reserved_name_safety) :-
    kb_inventory:filename_base(x_DataOfFn(x_Something),'DataOfFn_Something'),
    kb_inventory:filename_base(x_CON,Reserved),assertion(Reserved\=='CON'),
    kb_inventory:filename_base(x_Fn('x_A:B'),Safe),assertion(\+sub_atom(Safe,_,_,_,':')).
:- end_tests(disk_inventory).
