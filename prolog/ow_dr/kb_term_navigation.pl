:- module(kb_term_navigation,[term_navigation/3,filter_term_assertions/4]).
:- use_module(library(lists)).
:- use_module(library(error)).

% These are browsing categories of asserted syntax, not new inference rules.
section(all,'All Asserted Knowledge').
section(assertions,'All KB Assertions').
section(gafs,'All GAFs').
section(documentation,'Documentation').
section(definition,'Definitional Info').
section(lexical,'Lexical Info').
section(relations,'Applicable Relations').

term_navigation(Term,Items,Navigation) :-
    findall(_{key:Key,label:Label,count:Count},
      (section(Key,Label),include(in_section(Key),Items,Found),length(Found,Count)),Sections),
    findall(Position,(member(Item,Items),argument_position(Term,Item,Position)),Positions0),
    sort(Positions0,Positions),maplist(argument_group(Term,Items),Positions,Arguments),
    predicate_groups(Items,Predicates),length(Items,Total),
    Navigation=_{total:Total,coverage:loaded_term_assertions,sections:Sections,
      arguments:Arguments,predicates:Predicates,
      description:"Counts cover all loaded assertions containing this term. Argument groups include nested occurrences in that argument. Browsing categories classify asserted syntax, not inferred definitions or applicability."}.

filter_term_assertions(Term,Items,Filters,Matches) :-
    must_be(dict,Filters),
    (section(Filters.section,_)->true;throw(error(domain_error(assertion_section,Filters.section),_))),
    must_be(integer,Filters.arg),
    (Filters.arg>=0->true;throw(error(domain_error(argument_position,Filters.arg),_))),
    include(matches(Term,Filters),Items,Matches).

matches(Term,F,Item) :-
    in_section(F.section,Item),
    (F.arg=:=0->true;argument_position(Term,Item,F.arg)),
    (F.predicate==''->true;predicate_name(Item,F.predicate)),
    (F.mt==''->true;Item.mt==F.mt).

in_section(all,_).
in_section(assertions,_).
in_section(gafs,Item) :- expression_head(Item.expression,Name),
    \+logical_head(Name),\+has_variable(Item.expression).
in_section(documentation,Item) :- predicate_name(Item,Name),documentation(Name).
in_section(definition,Item) :- predicate_name(Item,Name),definition(Name).
in_section(lexical,Item) :- predicate_name(Item,Name),lexical(Name).
in_section(relations,Item) :- predicate_name(Item,Name),
    \+documentation(Name),\+lexical(Name),\+logical_head(Name).

documentation(x_comment).
documentation(x_documentation).
documentation(x_genGloss).
definition(x_isa).
definition(x_instance).
definition(x_genls).
definition(x_subclass).
definition(x_genlPreds).
definition(x_arity).
definition(x_argIsa).
definition(x_argGenl).
definition(x_resultIsa).
definition(x_resultGenl).
definition(x_genlMt).
lexical(x_genPhrase).
lexical(x_genTemplate).
lexical(x_termStrings).
lexical(x_prettyString).
lexical(x_prettyName).
lexical(x_nameString).
lexical(x_synonymousExternalConcept).
lexical(x_denotation).
lexical(x_lex).

logical_head('x_<===').
logical_head('x_<==').
logical_head('x_=>').
logical_head('x_<=>').
logical_head(x_implies).
logical_head(x_equiv).
logical_head(x_and).
logical_head(x_or).
logical_head(x_not).
logical_head(x_forAll).
logical_head(x_forall).
logical_head(x_exists).
logical_head(x_thereExists).

predicate_name(Item,Name) :- expression_head(Item.expression,Name).
expression_head(AST,Name) :-
    is_dict(AST),AST.type==application,is_dict(AST.head),
    AST.head.type==symbol,Name=AST.head.value.
has_variable(AST) :- is_dict(AST),get_dict(type,AST,variable), !.
has_variable(AST) :- is_dict(AST),dict_pairs(AST,_,Pairs),
    member(_-Value,Pairs),has_variable(Value), !.
has_variable(Values) :- is_list(Values),member(Value,Values),has_variable(Value), !.

argument_position(Term,Item,Position) :-
    Item.expression.type==application,
    nth1(Position,Item.expression.args,Argument),contains_symbol(Argument,Term).
contains_symbol(AST,Term) :-
    is_dict(AST),get_dict(type,AST,symbol),AST.value==Term, !.
contains_symbol(AST,Term) :- is_dict(AST),dict_pairs(AST,_,Pairs),
    member(_-Value,Pairs),contains_symbol(Value,Term), !.
contains_symbol(Values,Term) :- is_list(Values),
    member(Value,Values),contains_symbol(Value,Term), !.

argument_group(Term,Items,Position,Group) :-
    include(in_argument(Term,Position),Items,Found),length(Found,Count),
    predicate_groups(Found,BasePredicates),
    maplist(query_predicate(Term,Position,Found),BasePredicates,Predicates),
    Group=_{position:Position,count:Count,predicates:Predicates}.
in_argument(Term,Position,Item) :- argument_position(Term,Item,Position).

predicate_groups(Items,Groups) :-
    findall(Name,(member(Item,Items),predicate_name(Item,Name)),Names0),
    sort(Names0,Names),maplist(predicate_group(Items),Names,Groups).
predicate_group(Items,Name,Group) :-
    include(has_predicate(Name),Items,Found),length(Found,Count),
    findall(Mt,(member(Item,Found),Mt=Item.mt),Mts0),sort(Mts0,Mts),
    maplist(context_group(Found),Mts,Contexts),
    Group=_{term:Name,count:Count,microtheories:Contexts}.
query_predicate(Term,Position,Items,Base,Group) :-
    include(has_predicate(Base.term),Items,Found),
    findall(Arity,(member(Item,Found),length(Item.expression.args,Arity)),Arities0),
    sort(Arities0,Arities),
    findall(_{arity:Arity,directCount:Count,contexts:Contexts},
      (member(Arity,Arities),
       include(direct_argument(Term,Position,Arity),Found,Direct),length(Direct,Count),
       findall(Mt,(member(Item,Direct),Mt=Item.mt),Mts),sort(Mts,Contexts)),Shapes),
    Group=Base.put(queryShapes,Shapes).
direct_argument(Term,Position,Arity,Item) :-
    length(Item.expression.args,Arity),nth1(Position,Item.expression.args,Argument),
    is_dict(Argument),get_dict(type,Argument,symbol),Argument.value==Term.
has_predicate(Name,Item) :- predicate_name(Item,Name).
context_group(Items,Mt,Group) :-
    include(in_context(Mt),Items,Found),length(Found,Count),
    Group0=_{mt:Mt,count:Count},
    (Found=[First|_],get_dict(mtExpression,First,Expression)->
      Group=Group0.put(mtExpression,Expression);Group=Group0).
in_context(Mt,Item) :- Item.mt==Mt.
