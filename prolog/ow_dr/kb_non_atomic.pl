:- module(kb_non_atomic,
          [non_atomic_key/2,non_atomic_from_key/2,non_atomic_context_key/2,
           term_schema/2,semantic_position/4,context_position/3,context_position/4,
           denoting_position/4,annotated_semantic_ast/4,annotated_context_ast/2,
           non_atomic_ast/3,function_reference/3,function_type/1,positive_fact/3,ast_label/2]).

/** <module> Inert full-term identities and evidenced denoting positions

non_atomic_key(Term,Key) / non_atomic_from_key(Key,Term) encode a ground,
normalized application as nat:<canonical Prolog data>. They validate shape,
not ontology membership. A parsed key alone NEVER proves a denoting term
exists. Consumers must look it up in the loaded term-role index.

Compatible terms reuse kb_terms' mt: canonical serializer/parser. The guarded
fallback extends their data values to metta_map dicts; no term is called,
expanded or normalized from source. Variables, cycles, directives, native
instrumentation and noncanonical spellings are rejected. Strings/case/types
are preserved. non_atomic_context_key/2 gives the corresponding mt: key when
the term is valid context data, without asserting that it is a microtheory.

term_schema(Semantics,Schema) records positive explicit function-result/type
declarations, formula-argument signatures, and unambiguous predicate positions.
semantic_position/4 enumerates source/AST positions without binding variables.
Nested argument applications can denote terms; formula positions require
explicit function evidence. Logical operators and opaque quotation are not NATs.
Explicit compound context positions establish denotation. Unknown formula-
valued argument schemas remain a limitation of this syntactic analysis.

Annotated application ASTs expose denotesNat, natCandidate and natKey. Only
evidenced ground applications have denotesNat=true/a key. Their opening
parenthesis should navigate natKey; their head symbol remains a separate link.
Nonground denoting positions are candidates, never globally numbered terms.
*/

:- use_module(kb_terms,[context_key/2,context_from_key/2,term_ast/3,semantic_ast/3]).
:- use_module(kb_symbols,[encoded_symbol/1,list_data_slot/3]).
:- use_module(kb_inventory_rules,[logical_operator/1,quantifier/1,valid_binder/1]).
:- use_module(library(apply)).
:- use_module(library(assoc)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(pairs)).

non_atomic_key(Term,Key) :-
    (normalized_application(Term)->true;domain_error(ground_normalized_application,Term)),
    (catch(context_key(Term,ContextKey),error(_,_),fail),
     atom_concat('mt:',Text,ContextKey)->true;
     term_string(Term,String,[quoted(true),ignore_ops(true),numbervars(false),cycles(false)]),
     atom_string(Text,String)),
    atom_concat('nat:',Text,Key),atom_length(Key,Length),
    (Length=<262144->true;domain_error(non_atomic_key_size,Length)).
non_atomic_from_key(Input,Term) :-
    text_atom(Input,Key),atom_length(Key,Length),
    (Length=<262144,atom_concat('nat:',Text,Key),Text\==''->true;
     domain_error(non_atomic_key,Input)),
    atom_concat('mt:',Text,ContextKey),
    (catch(context_from_key(ContextKey,Parsed),error(_,_),fail)->true;
     read_term_from_atom(Text,Parsed,[syntax_errors(error),double_quotes(string),
                                     cycles(false),quasi_quotations(Quotes)]),
     (Quotes==[]->true;domain_error(non_atomic_key,Key))),
    non_atomic_key(Parsed,Canonical),
    (Canonical==Key->Term=Parsed;domain_error(noncanonical_non_atomic_key,Key)).
non_atomic_context_key(Term,Key) :-
    normalized_application(Term),context_key(Term,Key).
text_atom(Value,Atom) :-
    (atom(Value)->Atom=Value;string(Value)->atom_string(Atom,Value);type_error(text,Value)).

normalized_application(Term) :-
    ground(Term),acyclic_term(Term),compound(Term),\+is_list(Term),\+is_dict(Term),
    normalized_value(Term).
normalized_value(Value) :- atomic(Value),!.
normalized_value(Value) :- is_list(Value),!,maplist(normalized_value,Value).
normalized_value(Value) :-
    is_dict(Value,metta_map),!,dict_pairs(Value,metta_map,Pairs),maplist(normalized_pair,Pairs).
normalized_value(Value) :-
    compound(Value),Value=..[Name|Args],
    (Name==t->Args=[_|_];safe_functor(Name)),
    maplist(normalized_value,Args).
normalized_pair(Key-Value) :- (atom(Key);integer(Key)),normalized_value(Value).
safe_functor(Name) :-
    encoded_symbol(Name),
    \+memberchk(Name,[':',':-','?-',',',';',x_cid,x_cid_io,x_cid_in,x_cid_out,x_aid]),
    \+atom_concat(xc_,_,Name).

function_reference(Term,Symbol,subl_quote) :-
    nonvar(Term),Term=x_SubLQuoteFn(Symbol),atom(Symbol),safe_functor(Symbol),!.
function_reference(Term,Symbol,lisp_function_reference) :-
    nonvar(Term),Term=x_function(Symbol),atom(Symbol),safe_functor(Symbol).

term_schema(Semantics,Schema) :-
    must_be(list,Semantics),
    findall(Function,(member(S,Semantics),positive_fact(S,Fact),function_declaration(Fact,Function)),Fs),
    sort([x_SubLQuoteFn,x_function|Fs],Functions),
    findall(P-N,(member(S,Semantics),positive_fact(S,Fact),formula_signature(Fact,P,N)),Slots0),
    sort(Slots0,Slots),
    Base=schema{functions:Functions,predicates:[],formulaSlots:Slots},
    findall(P,(member(S,Semantics),semantic_position(S,Base,P,Position),
               Position.kind==predicate_symbol,atom(P)),Preds),
    sort(Preds,Predicates),Schema=Base.put(predicates,Predicates).
positive_fact(Term,Fact) :- positive_fact(Term,Fact,_).
positive_fact(Term,Fact,Path) :- positive_fact_at(Term,[],Fact,Path).
positive_fact_at(Term,Before,Fact,Path) :-
    nonvar(Term),
    (Term=..[x_and|Args]->
      nth0(N,Args,Child),append(Before,[args,N],Next),positive_fact_at(Child,Next,Fact,Path)
    ;compound(Term),functor(Term,Name,_),\+logical_operator(Name),Name\==(:-),
     Fact=Term,Path=Before).
function_declaration(Fact,Function) :-
    compound(Fact),Fact=..[Name,Function|Args],atom(Function),
    (memberchk(Name,[x_resultIsa,x_resultGenl,x_range,x_rangeSubclass]),Args=[_]
    ;Name==x_isa,Args=[Type],function_type(Type)).
function_type(Type) :-
    atom(Type),memberchk(Type,[x_Function,'x_Function-Denotational',x_UnaryFunction,
                              x_BinaryFunction,x_TernaryFunction,x_QuaternaryFunction]).
formula_signature(Fact,Predicate,Position) :-
    compound(Fact),Fact=..[Name,Predicate|Args],atom(Predicate),
    (memberchk(Name,[x_argIsa,x_domain]),Args=[Position,Type]
    ;atom_concat(x_arg,Tail,Name),atom_concat(Digits,'Isa',Tail),Args=[Type],
     atom_codes(Digits,Codes),Codes\=[],maplist(decimal_digit,Codes),atom_number(Digits,Position)),
    integer(Position),Position>0,atom(Type),memberchk(Type,[x_CycFormula,x_Formula,x_Sentence]).
decimal_digit(C) :- between(0'0,0'9,C).

semantic_position(Semantic,Schema,Term,Position) :-
    position(Semantic,formula,assertion,positive,[],Schema,Term,Position).
context_position(Context,Term,Position) :-
    context_position(Context,schema{functions:[],predicates:[],formulaSlots:[]},Term,Position).
context_position(Context,Schema,Term,Position) :-
    position(Context,context,microtheory_context,positive,[],Schema,Term,Position).
position(Term,Kind,Role,Polarity,Path,_,Term,
         position{kind:Kind,role:Role,polarity:Polarity,path:Path}).
position(Term,Kind,Role,Polarity,Path,Schema,Node,Position) :-
    nonvar(Term),
    child(Term,Kind,Role,Polarity,Path,Schema,Child,K,R,P,ChildPath),
    position(Child,K,R,P,ChildPath,Schema,Node,Position).

child((Head:-Body),Kind,_,Polarity,Path,_,Child,formula,Role,Polarity,ChildPath) :-
    Kind\==data,!,
    (Child=Head,Index=0,Role=head;
     nonvar(Body),Body=..[and|Goals],nth0(N,Goals,Child),Index is N+1,Role=antecedent),
    append(Path,[args,Index],ChildPath).
child(Term,ParentKind,Role,P,Path,_,Child,Kind,Role,P,ChildPath) :-
    compound(Term),Term=..[Name,Child],memberchk(Name,[metta_value,metta_exec]),!,
    ((ParentKind==data;Name==metta_exec)->Kind=data;Kind=collection_value),
    append(Path,[value],ChildPath).
child(Term,Kind,Role,P,Path,_,Child,Next,Role,P,ChildPath) :-
    is_list(Term),!,nth0(N,Term,Child),append(Path,[items,N],ChildPath),
    (Kind==data->Next=data;Next=collection_value).
child(Term,Kind,Role,P,Path,_,Child,Next,Role,P,ChildPath) :-
    is_dict(Term),!,dict_pairs(Term,_,Pairs),nth0(N,Pairs,Key-Value),
    (Child=Key,Field=key;Child=Value,Field=value),append(Path,[entries,N,Field],ChildPath),
    (Kind==data->Next=data;Next=collection_value).
child(Term,Kind,Role,P,Path,Schema,Child,Next,R,NP,ChildPath) :-
    compound(Term),Term=..[Name|Values],
    (Name==t->Values=[Head|Args];Head=Name,Args=Values),
    (Child=Head,append(Path,[head],ChildPath),R=Role,NP=P,
       head_kind(Kind,Head,Next)
    ;nth1(N,Args,Child),Index is N-1,append(Path,[args,Index],ChildPath),
     argument_kind(Name,Args,N,Child,Kind,Role,P,Schema,Next,R,NP)).
head_kind(data,_,data) :- !.
head_kind(_,Head,value) :- compound(Head),!.
head_kind(formula,Head,Kind) :- !,(compound(Head)->Kind=value;Kind=predicate_symbol).
head_kind(_,_,constructor_symbol).

argument_kind(_,_,_,_,data,R,P,_,data,R,P) :- !.
argument_kind(Name,_,_,_,_,R,P,_,data,R,P) :-
    memberchk(Name,[x_quote,metta_exec,metta_expression,'x_metta=','x_<===']),!.
argument_kind(Name,Args,N,_,_,R,P,_,data,R,P) :-
    list_data_slot(Name,Args,N),!.
argument_kind(Name,_,N,_,_,_,P,_,formula,Role,P) :-
    memberchk(Name,[x_implies,'x_=>']),!,
    (N=:=1->Role=antecedent;Role=consequent).
argument_kind(Name,_,N,_,_,_,P,_,formula,Role,P) :-
    memberchk(Name,[x_equiv,'x_<=>']),!,(N=:=1->Role=left;Role=right).
argument_kind(Name,_,_,_,_,R,P,_,formula,R,P) :- memberchk(Name,[x_and,x_or]),!.
argument_kind(x_not,_,_,_,_,R,P,_,formula,R,Opposite) :- !,opposite(P,Opposite).
argument_kind(Name,Args,N,_,_,R,P,_,Kind,R,P) :-
    quantifier(Name),Args=[Binder,_],valid_binder(Binder),!,
    (N=:=1->Kind=data;Kind=formula).
argument_kind('x_<==',_,N,_,_,_,P,_,formula,R,P) :- !,
    (N=:=1->R=head;R=antecedent).
argument_kind(x_ist,_,1,_,_,R,P,_,context,R,P) :- !.
argument_kind(x_ist,_,2,_,_,R,P,_,formula,R,P) :- !.
argument_kind(x_genlMt,_,N,_,_,R,P,_,context,R,P) :- memberchk(N,[1,2]),!.
argument_kind(x_isa,[_,Type],1,_,_,R,P,_,Kind,R,P) :-
    ground(Type),(atom(Type),safe_functor(Type);normalized_application(Type)),!,
    (memberchk(Type,[x_CycFormula,x_Formula,x_Sentence])->Kind=formula;Kind=typed_value).
argument_kind(x_isa,[_,_],2,_,_,R,P,_,collection_type,R,P) :- !.
argument_kind(x_genls,[_,_],_,_,_,R,P,_,collection_type,R,P) :- !.
argument_kind(Name,_,N,_,_,R,P,Schema,formula,R,P) :-
    memberchk(Name-N,Schema.formulaSlots),!.
argument_kind(_,_,_,Child,_,R,P,Schema,Kind,R,P) :-
    (compound(Child),\+is_list(Child),\+is_dict(Child),functor(Child,F,_),
     (logical_operator(F);memberchk(F,Schema.predicates),\+memberchk(F,Schema.functions))
    ->Kind=formula
    ;Kind=value).
opposite(positive,negative).
opposite(negative,positive).

denoting_position(Term,Position,Schema,Reason) :-
    nonvar(Term),compound(Term),\+is_list(Term),\+is_dict(Term),
    functor(Term,Name,_),(Name==t;safe_functor(Name)),
    (Position.kind==context->Reason=compound_context
    ;\+memberchk(Name,[x_quote,metta_exec,metta_value,metta_expression]),
     \+logical_operator(Name),
     (Position.kind==collection_type->Reason=collection_argument_position
     ;Position.kind==typed_value->Reason=whole_term_type_position
     ;Position.kind==formula,memberchk(Name,Schema.functions)->Reason=declared_function
     ;Position.kind==value->
       (memberchk(Name,Schema.functions)->Reason=declared_function;Reason=nested_term_argument)
     ;Position.kind==collection_value,memberchk(Name,Schema.functions)->Reason=declared_function)).

annotated_semantic_ast(Semantic,Names,Schema,AST) :-
    semantic_ast(Semantic,Names,Raw),
    findall(Path-Mark,
      (semantic_position(Semantic,Schema,Term,Pos),denoting_position(Term,Pos,Schema,Reason),
       Path=Pos.path,denotation_mark(Term,Reason,Mark)),Marks),
    annotate(Raw,Marks,AST).
annotated_context_ast(Context,AST) :-
    non_atomic_ast(Context,schema{functions:[],predicates:[],formulaSlots:[]},AST).
non_atomic_ast(Context,Schema,AST) :-
    term_ast(Context,[],Raw),
    findall(Path-Mark,
      (context_position(Context,Schema,Term,Pos),
       denoting_position(Term,Pos,Schema,Reason),
       Path=Pos.path,denotation_mark(Term,Reason,Mark)),Marks),
    annotate(Raw,Marks,AST).
denotation_mark(Term,Reason,Mark) :-
    (ground(Term),catch(non_atomic_key(Term,Key),error(_,_),fail)->
       Mark=mark{denotesNat:true,natCandidate:true,natKey:Key,denotationEvidence:Reason}
    ;Mark=mark{denotesNat:false,natCandidate:true,natKey:null,denotationEvidence:Reason}).
annotate(Raw,Marks,AST) :-
    sort(Marks,Sorted),list_to_assoc(Sorted,Map),annotate_value(Raw,[],Map,AST).
annotate_value(Raw,Path,Map,AST) :-
    is_dict(Raw),!,dict_pairs(Raw,_,Pairs),
    maplist(annotate_pair(Path,Map),Pairs,NewPairs),dict_pairs(Base,json,NewPairs),
    (get_dict(type,Base,application)->
       (get_assoc(Path,Map,Mark)->AST=Base.put(Mark);
        AST=Base.put(annotation{denotesNat:false,natCandidate:false,natKey:null}))
    ;AST=Base).
annotate_value(Raw,Path,Map,AST) :-
    is_list(Raw),!,annotate_list(Raw,0,Path,Map,AST).
annotate_value(Raw,_,_,Raw) :- atomic(Raw),!.
annotate_value(Raw,_,_,_) :- type_error(json_ast,Raw).
annotate_pair(Path,Map,Key-Value,Key-Out) :-
    append(Path,[Key],Next),annotate_value(Value,Next,Map,Out).
annotate_list([],_,_,_,[]).
annotate_list([V|Vs],N,Path,Map,[O|Os]) :-
    append(Path,[N],Next),annotate_value(V,Next,Map,O),
    N1 is N+1,annotate_list(Vs,N1,Path,Map,Os).

ast_label(AST,Label) :- with_output_to(string(Label),write_ast_label(AST)).
write_ast_label(AST) :-
    (AST.type==symbol->(atom_concat(x_,N,AST.value)->write(N);write(AST.value))
    ;AST.type==string->write_term(AST.value,[quoted(true),character_escapes(true)])
    ;AST.type==number->write(AST.value)
    ;AST.type==application->write('('),write_ast_label(AST.head),
       forall(member(A,AST.args),(write(' '),write_ast_label(A))),write(')')
    ;AST.type==list->write('['),forall(member(A,AST.items),(write_ast_label(A),write(' '))),write(']')
    ;AST.type==map->write('{'),forall(member(E,AST.entries),
       (write_ast_label(E.key),write(': '),write_ast_label(E.value),write(' '))),write('}')
    ;write('?')).
