:- module(kb_inventory_rules,[rule_classification/2,project_retained_forms/2]).
:- use_module(kb_cache,[term_line/2]).
:- use_module(kb_symbols,[encoded_symbol/1]).
:- use_module(library(http/json)).
:- use_module(library(error)).

% These are inventory syntax classes, never translations into executable rules.
rule_classification(Term,Info) :-
    (rule_shape(Term,Kind,Executable,Conclusions)->
      findall(Head,(member(Role-Conclusion,Conclusions),conclusion_head(Conclusion,Role,positive,Head)),Heads),
      Info=_{semanticRule:true,executableRule:Executable,kind:Kind,heads:Heads}
    ;Info=_{semanticRule:false,executableRule:false,kind:non_rule,heads:[]}).

rule_shape(Term,Kind,Executable,Conclusions) :-
    nonvar(Term),
    (Term=(Head:-Body),nonvar(Body),functor(Body,and,_)->
      Kind=executable,Executable=true,Conclusions=[head-Head]
    ;universal_body(Term,Formula),compound(Formula),Formula=..[Name|Arguments],
     formula_rule(Name,Arguments,Kind,Conclusions),Executable=false).

formula_rule(Name,[_,Consequent],implication,[consequent-Consequent]) :-
    memberchk(Name,[x_implies,'x_=>']),formula_value(Consequent).
formula_rule(Name,[Left,Right],biconditional,[left-Left,right-Right]) :-
    memberchk(Name,[x_equiv,'x_<=>']),formula_value(Left),formula_value(Right).
formula_rule('x_<==',[Head|Body],two_equals_operator_data,[head-Head]) :-
    formula_value(Head),maplist(formula_value,Body).

formula_value(Term) :- var(Term),!.
formula_value(Term) :- atom(Term),formula_symbol(Term),!.
formula_value(Term) :-
    compound(Term),\+is_list(Term),\+is_dict(Term),
    functor(Term,Name,_),(formula_symbol(Name);Name==t).
formula_symbol(Name) :-
    encoded_symbol(Name),\+memberchk(Name,['NIL',nil,':',':-','?-',x_cid,x_cid_io]).

universal_body(Term,Body) :-
    nonvar(Term),Term=..[Name,Binder,Inner],
    memberchk(Name,[x_forAll,x_forall]),valid_binder(Binder),!,
    universal_body(Inner,Body).
universal_body(Term,Term).
valid_binder(Binder) :- var(Binder),!.
valid_binder(Binder) :- is_list(Binder),Binder\=[],maplist(var,Binder),!.
valid_binder(Binder) :- nonvar(Binder),Binder=..[t|Vars],Vars\=[],maplist(var,Vars).

conclusion_head(Term,Role,Polarity,Head) :-
    atom(Term),formula_symbol(Term),!,
    Head=_{predicate:Term,arity:0,role:Role,polarity:Polarity}.
conclusion_head(Term,Role,Polarity,Head) :-
    nonvar(Term),compound(Term),Term=..[Name|Args],
    (memberchk(Name,[x_and,x_or])->member(Child,Args),conclusion_head(Child,Role,Polarity,Head)
    ;Name==x_not,Args=[Child]->opposite(Polarity,Next),conclusion_head(Child,Role,Next,Head)
    ;memberchk(Name,[x_forAll,x_forall,x_thereExists,x_exists]),Args=[Binder,Child],valid_binder(Binder)->
      conclusion_head(Child,Role,Polarity,Head)
    ;memberchk(Name,[x_implies,'x_=>']),Args=[_,Child]->
      conclusion_head(Child,Role,Polarity,Head)
    ;Name==t,Args=[Predicate|Rest]->
      length(Rest,Arity),predicate_reference(Predicate,Reference),
      Head=Reference.put(_{arity:Arity,role:Role,polarity:Polarity})
    ;formula_symbol(Name),length(Args,Arity),
     Head=_{predicate:Name,arity:Arity,role:Role,polarity:Polarity}).
opposite(positive,negative).
opposite(negative,positive).
predicate_reference(Predicate,Reference) :-
    (atom(Predicate)->Reference=_{predicate:Predicate}
    ;term_line(Predicate,Canonical),Reference=_{predicate:null,canonical:Canonical}).

project_retained_forms(Input,Output) :-
    setup_call_cleanup(open(Input,read,In,[encoding(utf8)]),
      setup_call_cleanup(open(Output,write,Out,[encoding(utf8),newline(posix)]),
        project_forms(In,Out),close(Out)),close(In)).
project_forms(In,Out) :-
    read_term(In,Term,[syntax_errors(error),quasi_quotations(Quotes)]),
    (Quotes==[]->true;domain_error(retained_form,Term)),
    (Term==end_of_file->true
    ;Term=inventory_form(Id,Semantic),integer(Id)->
      rule_classification(Semantic,Info),
      json_write_dict(Out,Info.put(formId,Id),[width(0)]),nl(Out),
      project_forms(In,Out)
    ;domain_error(retained_form,Term)).
