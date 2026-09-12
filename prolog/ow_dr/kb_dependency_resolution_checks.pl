:- module(kb_dependency_resolution_checks,
          [analyze_report/6,report_page/3,canonical_term/3]).
:- use_module(kb_dependency_resolution_policy).
:- use_module(kb_inventory,[declaration_target/4]).
:- use_module(kb_inventory_rules,[rule_classification/2,logical_operator/1]).
:- use_module(kb_catalog_schema,[build_catalog_schema/2,term_classification/4,definition_slots/3]).
:- use_module(kb_file_dependencies,[]).
:- use_module(kb_non_atomic).
:- use_module(kb_term_resolver,[term_input/3]).
:- use_module(kb_terms,[context_key/2,context_from_key/2,term_ast/3]).
:- use_module(library(assoc)).
:- use_module(library(apply)).
:- use_module(library(error)).
:- use_module(library(lists)).

/** Read-only evidence checks, NOT a KB evaluator or SourcePack cascade planner.

Rows are row(Semantic,Evidence). Evidence is ground JSON:
{id,source,originalSource,line,mt,loaded,dialect}. Semantic variables stay fresh
and untouched. Positive facts use the shared semantic-position implementation.
Coverage is explicit per check; incomplete input never proves an absence.
*/

analyze_report(Scope,Inputs,Rows,Coverage0,Policy,Report) :-
    must_be(dict,Scope),context_from_key(Scope.mt,_),must_be(list,Rows),
    length(Rows,Count),(Count=<50000->true;domain_error(report_row_budget,Count)),
    maplist(valid_row,Rows),must_be(list,Inputs),
    conservative_coverage(Rows,Scope.mt,Coverage0,Coverage),
    maplist(input_key,Inputs,Keys0),sort(Keys0,Keys),
    scoped_schema(Rows,Scope.mt,Schema),scoped_schema(Rows,x_BaseKB,BaseSchema),
    Context=context(Scope,Schema,BaseSchema),
    findall(F,(member(Key,Keys),finding(Context,Rows,Coverage,Key,F)),Findings),
    maplist(conflict_status(Coverage),Findings,Checked),
    maplist(apply_policy(Policy),Checked,Items),
    length(Keys,Terms),length(Items,N),
    Report=report{schema:'powder.dependency-resolution.v1',scope:Scope,
      coverage:Coverage,policyRevision:Policy.revision,terms:Terms,total:N,items:Items,
      semantics:json{readOnly:true,executesRules:false,inheritsMicrotheories:false,
        sourcePackPlanner:existing_only,assertionSubsetLoad:false},
      limitations:[conditional_return_constraints_not_generally_evaluated,
        catalog_taxonomy_is_not_mt_entailment,native_implementation_not_verified]}.
conflict_status(C,Before,After) :-
    (get_dict(issues,C,Issues),member(I,Issues),
     memberchk(I.code,[loaded_catalog_conflict,catalog_stale,dependency_catalog_changed,
                       dependency_source_changed,dependency_source_missing])->
       After=Before.put(json{status:indeterminate,scope:unresolved,
         observedStatus:Before.status,why:why{reason:conflicting_source_revisions,observed:Before.why}})
    ;After=Before).
conservative_coverage(Rows,Mt,Before,After) :-
    (member(row(_,E),Rows),E.dialect==metta->
       One=Before.put(definitions,partial);One=Before),
    (ontology_row(Rows,S,E1),E1.mt==Mt,rule_classification(S,C),
     member(H,C.heads),H.predicate==null->
       Two=One.put(definitions,partial);Two=One),
    (ontology_row(Rows,R,E2),E2.mt==Mt,rule_classification(R,RC),
     member(RH,RC.heads),RH.predicate==x_resultIsa,
     \+supported_return_schema(R)->
       After=Two.put(returnInference,partial);After=Two).
supported_return_schema(Rule) :-
    between(1,64,N),result_arg_schema(Rule,N),!.
valid_row(row(Semantic,E)) :-
    (acyclic_term(Semantic)->true;domain_error(acyclic_report_semantic,Semantic)),
    must_be(dict,E),must_be(ground,E),must_be(atom,E.id),
    must_be(boolean,E.loaded),context_from_key(E.mt,_),
    must_be(text,E.source),(E.originalSource==null->true;must_be(text,E.originalSource)),
    (E.line==null->true;must_be(positive_integer,E.line)),
    (memberchk(E.dialect,[kif,krf,meld,metta])->true;domain_error(report_dialect,E.dialect)).
input_key(Input,Key) :- canonical_term(Input,Key,_).
canonical_term(Input,Key,Term) :-
    term_input(Input,Found,_),
    (atom_concat('mt:',_,Found)->context_from_key(Found,Term),term_key(Term,Key)
    ;atom_concat('nat:',_,Found)->non_atomic_from_key(Found,Term),Key=Found
    ;Term=Found,Key=Found).
term_key(Term,Key) :-
    ground(Term),(atom(Term)->Key=Term;non_atomic_key(Term,Key)).
ontology_row(Rows,S,E) :- member(row(S,E),Rows),E.dialect\==metta.
fact(Rows,Name,Args,E) :-
    ontology_row(Rows,Semantic,Origin),positive_fact(Semantic,Fact,Path),
    Fact=..[Name|Args],E=Origin.put(position,Path).
visible(Mt,E) :- E.mt==Mt.
same_term(Key,Term) :- ground(Term),term_key(Term,Actual),Actual==Key.
typed(Rows,Mt,Key,Type,E) :-
    fact(Rows,x_isa,[Term,Type],E),visible(Mt,E),same_term(Key,Term),ground(Type).
types(Rows,Mt,Key,Types) :-
    findall(K,(typed(Rows,Mt,Key,Type,_),term_key(Type,K)),Raw),sort(Raw,Types).
evidence_ast(Term,AST) :-
    (compound(Term)->annotated_context_ast(Term,AST0);term_ast(Term,[],AST0)),
    ground_dicts(AST0,AST).
ground_dicts(Term,Out) :-
    (is_dict(Term)->dict_pairs(Term,_,Pairs),maplist(ground_pair,Pairs,Ground),
       dict_pairs(Out,json,Ground)
    ;is_list(Term)->maplist(ground_dicts,Term,Out)
    ;Out=Term).
ground_pair(K-V,K-Out) :- ground_dicts(V,Out).

base_finding(Scope,Rows,Key,Kind,Status,Why,Evidence,Finding) :-
    canonical_term(Key,_,Term),evidence_ast(Term,Expression),
    types(Rows,Scope.mt,Key,Types),
    context_from_key(Scope.mt,Context),evidence_ast(Context,MtExpression),
    length(Evidence,Count),first_evidence(Evidence,32,Selected),
    maplist(present_evidence,Selected,Presented),
    (Count>32->Truncated=true;Truncated=false),
    (Status==loaded_available->AvailabilityScope=loaded;
       Status==exists_unloaded_source->AvailabilityScope=unloaded;AvailabilityScope=unresolved),
    Finding=finding{term:Key,expression:Expression,mt:Scope.mt,types:Types,
      mtExpression:MtExpression,scope:AvailabilityScope,
      kind:Kind,status:Status,why:Why,evidence:Presented,
      evidenceCount:Count,evidenceTruncated:Truncated,
      implementation:unknown,executableAvailability:not_claimed}.
first_evidence(_,0,[]) :- !.
first_evidence([],_,[]).
first_evidence([E|Es],N,[E|Out]) :- Next is N-1,first_evidence(Es,Next,Out).
present_evidence(E,Out) :-
    context_from_key(E.mt,Context),evidence_ast(Context,Expression),
    (get_dict(support,E,Support)->maplist(present_evidence,Support,Presented);
       Presented=[]),
    Out=E.put(json{mtExpression:Expression,support:Presented}).

finding(context(Scope,Schema,_),Rows,C,Key,F) :-
    once((callable_use(Rows,Scope.mt,Key);typed_provider(Schema,Key,_);
          schema_slot_provider(Rows,Scope.mt,Schema,Key,_))),
    findall(E,(provider(Rows,Key,E);typed_provider(Schema,Key,E);
               schema_slot_provider(Rows,Scope.mt,Schema,Key,E)),RawProviders),
    sort(RawProviders,Providers),
    evidence_status(Scope.mt,Providers,C,definitions,Status,Evidence,Why),
    base_finding(Scope,Rows,Key,definition,Status,Why,Evidence,F).
finding(context(Scope,Schema,_),Rows,C,Key,F) :-
    once((function_check(Rows,Scope.mt,Key);typed_group(Schema,Key,functions,_))),
    findall(E,return_constraint(Rows,Key,E),Constraints),
    evidence_status(Scope.mt,Constraints,C,returnInference,Status,Evidence,Why0),
    findall(E,other_return_constraint(Rows,Key,E),Other),
    Why=why{availability:Why0,separateConstraints:Other,
      policy:direct_result_isa_or_same_mt_evidenced_result_isa_arg_schema,
      doesNotInferFrom: [genls_on_function_name,genlPreds_on_function_name]},
    base_finding(Scope,Rows,Key,function_result_isa,Status,Why,Evidence,F).
finding(context(Scope,Schema,_),Rows,C,Key,F) :-
    once((collection_check(Rows,Scope.mt,Key);typed_group(Schema,Key,collections,_))),
    (Key==x_Thing->Status=exempt,Evidence=[],Why=thing_is_root
    ;genls_edges(Rows,Scope.mt,Edges),
     include(loaded_edge,Edges,LoadedEdges),
     (graph_path(LoadedEdges,Key,x_Thing,Evidence)->Status=loaded_available,Why=positive_genls_path
     ;graph_path(Edges,Key,x_Thing,Evidence)->Status=exists_unloaded_source,Why=positive_genls_path
     ;Evidence=[],missing_status(C,relations,Status),
      Why=why{reason:no_positive_genls_path_in_explicit_mt,
        ignores:[negative_edges,isa_collection_as_path,cross_mt_edges],
        graph:cycle_safe_positive_asserted_edges})),
    base_finding(Scope,Rows,Key,collection_root,Status,Why,Evidence,F).
finding(context(Scope,_,BaseSchema),Rows,C,Key,F) :-
    used_context(Rows,Key),
    findall(E,(mt_definition(Rows,BaseSchema,Key,E);typed_group(BaseSchema,Key,microtheories,E)),Raw),
    sort(Raw,Definitions),
    evidence_status(x_BaseKB,Definitions,C,mtDeclarations,Status,Evidence,Why0),
    Why=why{availability:Why0,declarationContext:x_BaseKB,
      contextMeans:assertion_metadata_not_filename},
    base_finding(Scope,Rows,Key,microtheory_declaration,Status,Why,Evidence,F).
finding(context(Scope,_,_),Rows,C,Key,F) :-
    used_context(Rows,Key),
    findall(E,mt_edge(Rows,Scope.mt,Key,E),Edges),
    findall(E,explicit_ist(Rows,Scope.mt,Key,E),References),
    (Edges\=[]->Status=loaded_or_catalog_evidence,Why=explicit_genlMt_edge,Evidence=Edges
    ;References\=[]->Status=standalone_reference,Why=explicit_cross_context_reference,Evidence=References
    ;missing_status(C,relations,Missing),Evidence=[],
     (Missing==missing_complete_catalog->Status=detached;Status=indeterminate),
     Why=no_visible_inheritance_edge_standalone_may_be_intentional),
    base_finding(Scope,Rows,Key,microtheory_attachment,Status,Why,Evidence,F).
finding(context(Scope,_,_),Rows,C,Key,F) :-
    findall(E,(fact(Rows,x_comment,[Term,Text],E),same_term(Key,Term),string(Text)),Comments),
    evidence_status(Scope.mt,Comments,C,rows,Status,Evidence,Why),
    base_finding(Scope,Rows,Key,comment,Status,Why,Evidence,F).
finding(context(Scope,Schema,_),Rows,_,Key,F) :-
    once(typed_group(Schema,Key,external_symbols,E)),
    base_finding(Scope,Rows,Key,definition,external_implementation_required,
      explicit_external_symbol_type_host_implementation_not_verified,[E],F).
finding(context(Scope,Schema,_),Rows,_,Key,F) :-
    \+ typed_group(Schema,Key,external_symbols,_),
    findall(Out,
      (ontology_row(Rows,S,E),visible(Scope.mt,E),term_schema([S],Local),
       semantic_position(S,Local,Node,Position),function_reference(Node,Symbol,Kind),
       Symbol==Key,
       Out=E.put(json{kind:foreign_function_reference,referenceKind:Kind,position:Position.path})),References),
    References\=[],
    base_finding(Scope,Rows,Key,definition,external_implementation_required,
      explicit_foreign_reference_not_an_implemented_call,References,F).

provider(Rows,Key,Out) :-
    ontology_row(Rows,S,E),rule_classification(S,Class),member(Head,Class.heads),
    Head.predicate==Key,
    Out=E.put(json{kind:static_rule_head,polarity:Head.polarity,
      semanticRuleKind:Class.kind,executableSyntax:Class.executableRule}).
provider(Rows,Key,Out) :-
    ontology_row(Rows,S,E),positive_fact(S,Fact,Path),
    declaration_target(Fact,Target,Arity,Operator),Target==Key,
    Out=E.put(json{kind:declaration_subject,arity:Arity,operator:Operator,position:Path}).
scoped_schema(Rows,Mt,Schema) :-
    findall(Claim,
      (ontology_row(Rows,S,E),visible(Mt,E),positive_fact(S,Fact,Path),
       schema_claim(Fact,E.put(position,Path),Claim)),Claims),
    build_catalog_schema(Claims,Schema).
schema_claim(Fact,E,claim(Kind,A,B,E)) :-
    Fact=..[Name,Subject,Value],memberchk(Name-Kind,[x_isa-isa,x_genls-genls,x_genlPreds-genlPreds]),
    term_key(Subject,A),term_key(Value,B).
schema_claim(Fact,E,claim(target_slot,Subject,slot(Slot,Type),E)) :-
    kb_file_dependencies:typed_position(Fact,Subject,Slot,Type),
    atom(Subject),integer(Slot),atom(Type).
typed_group(Schema,Key,Group,E) :-
    term_classification(Key,[],Schema,Class),
    member(Group-type_evidence(Type,Local,Root,Chain),Class.evidence),
    all_loaded([Local|Chain],Loaded),
    E=Local.put(json{kind:typed_declaration,type:Type,categoryRoot:Root,
      support:Chain,loaded:Loaded,classificationScope:explicit_mt}).
typed_provider(Schema,Key,E) :-
    typed_group(Schema,Key,Group,E),memberchk(Group,[predicates,functions]).
schema_slot_provider(Rows,Mt,Schema,Key,Out) :-
    fact(Rows,Name,Args,E),visible(Mt,E),
    definition_slots(Name,Schema,Slots),member(Slot,Slots),
    nth1(Slot,Args,Subject),Subject==Key,
    Out=E.put(json{kind:ontology_schema_subject,operator:Name,slot:Slot,
      schemaEvidenceScope:explicit_mt,implementation:unknown}).
callable_use(Rows,Mt,Key) :-
    atom(Key),\+logical_operator(Key),
    (once((provider(Rows,Key,E),visible(Mt,E)))
    ;once((ontology_row(Rows,S,E),visible(Mt,E),
           term_schema([S],Schema),semantic_position(S,Schema,Term,Position),
           Term==Key,memberchk(Position.kind,[predicate_symbol,constructor_symbol])))),!.
function_check(Rows,Mt,Key) :-
    atom(Key),
    (atom_concat(_, 'Fn',Key)
    ;typed(Rows,Mt,Key,Type,_),function_type(Type)
    ;fact(Rows,Name,[Function,_],E),visible(Mt,E),
     memberchk(Name,[x_resultIsa,x_resultGenl]),Function==Key),!.
collection_check(_,_,x_Thing) :- !.
collection_check(Rows,Mt,Key) :-
    (typed(Rows,Mt,Key,x_Collection,_)
    ;fact(Rows,x_genls,[Term,_],E),visible(Mt,E),same_term(Key,Term)),!.

return_constraint(Rows,Key,Out) :-
    fact(Rows,x_resultIsa,[Function,Type],E),same_term(Key,Function),ground(Type),
    evidence_ast(Type,Expression),Out=E.put(json{kind:resultIsa,resultType:Expression}).
return_constraint(Rows,Key,Out) :-
    fact(Rows,x_resultIsaArg,[Function,N],First),same_term(Key,Function),
    integer(N),N>0,format(atom(Operator),'x_arg~dGenl',[N]),
    fact(Rows,Operator,[F2,Type],Second),same_term(Key,F2),ground(Type),
    First.mt==Second.mt,
    ontology_row(Rows,Rule,Schema),Schema.mt==First.mt,
    result_arg_schema(Rule,N),evidence_ast(Type,Expression),
    all_loaded([First,Second,Schema],Loaded),
    Out=First.put(json{kind:schema_supported_resultIsa,loaded:Loaded,
      resultType:Expression,support:[First,Second,Schema],
      interpretation:static_constraint_not_runtime_execution}).

% Corpus witness: tinykb.krf a65b38ed883eff (BaseKB), and
% a65b38ed885ba8 (UniversalVocabularyMt). Require an actual same-MT witness;
% its presence in another context does not grant runtime inheritance.
result_arg_schema(Term,N) :-
    nonvar(Term),Term=..[Implies,Ante,Consequent],memberchk(Implies,[x_implies,'x_=>']),
    nonvar(Ante),Ante=..[x_and,Arg,Genl],nonvar(Arg),nonvar(Genl),nonvar(Consequent),
    Arg=..[x_resultIsaArg,F,Position],Position==N,
    format(atom(Name),'x_arg~dGenl',[N]),Genl=..[Name,F2,C],
    Consequent=..[x_resultIsa,F3,C2],
    var(F),var(C),F==F2,F==F3,C==C2,F\==C.
other_return_constraint(Rows,Key,Out) :-
    fact(Rows,Name,[Function|_],E),same_term(Key,Function),
    memberchk(Name,[x_resultGenl,x_interArgResultIsa,x_interArgResultGenl,
                    x_resultIsaArgIsa,x_resultIsaArg,x_resultGenlArg]),
    Out=E.put(json{kind:Name,effectiveResultIsa:not_assumed}).
all_loaded(Evidence,Loaded) :-
    (forall(member(E,Evidence),E.loaded==true)->Loaded=true;Loaded=false).

used_context(Rows,Key) :-
    once((member(row(_,E),Rows),context_from_key(E.mt,Term),same_term(Key,Term))).
mt_definition(Rows,Schema,Key,Out) :-
    canonical_term(Key,_,Term),compound(Term),functor(Term,Function,_),
    fact(Rows,x_resultIsa,[F,Type],E),F==Function,E.mt==x_BaseKB,atom(Type),
    get_assoc(Type,Schema.categories,Memberships),
    member(membership(microtheories,_,Chain),Memberships),
    all_loaded([E|Chain],Loaded),
    Out=E.put(json{kind:constructor_result_type,constructor:Function,
      loaded:Loaded,support:Chain,interpretation:resultIsa_constructor_typing_not_execution}).
mt_edge(Rows,Mt,Key,E) :-
    fact(Rows,x_genlMt,[Child,Parent],E),visible(Mt,E),ground(Child-Parent),
    (same_term(Key,Child);same_term(Key,Parent)).
explicit_ist(Rows,Mt,Key,Out) :-
    fact(Rows,Name,[Context,_],E),visible(Mt,E),
    memberchk(Name,[x_ist,'x_ist-Information']),same_term(Key,Context),
    Out=E.put(kind,Name).
genls_edges(Rows,Mt,Edges) :-
    findall(edge(Child,Parent,E),
      (fact(Rows,x_genls,[A,B],E),visible(Mt,E),
       term_key(A,Child),term_key(B,Parent)),Edges).
loaded_edge(edge(_,_,E)) :- E.loaded==true.
graph_path(Edges,Start,Goal,Proof) :-
    empty_assoc(Empty),put_assoc(Start,Empty,root,Visited),
    walk([Start],Edges,Goal,Visited,Parents),proof(Goal,Parents,[],Proof).
walk([Goal|_],_,Goal,Parents,Parents) :- !.
walk([Node|Queue],Edges,Goal,Before,Parents) :-
    findall(Next-E,member(edge(Node,Next,E),Edges),Nexts),
    add_unseen(Nexts,Node,Before,After,Added),
    append(Queue,Added,Pending),walk(Pending,Edges,Goal,After,Parents).
add_unseen([],_,Parents,Parents,[]).
add_unseen([Node-E|Rest],From,Before,After,Added) :-
    (get_assoc(Node,Before,_)->Middle=Before,Added=Tail;
       put_assoc(Node,Before,via(From,E),Middle),Added=[Node|Tail]),
    add_unseen(Rest,From,Middle,After,Tail).
proof(Node,Parents,Before,Proof) :-
    get_assoc(Node,Parents,Parent),
    (Parent==root->Proof=Before;
       Parent=via(From,E),proof(From,Parents,[E|Before],Proof)).

evidence_status(Mt,All,C,Check,Status,Evidence,Why) :-
    include(visible(Mt),All,Visible),
    include(loaded_evidence,Visible,Loaded),
    (Loaded\=[]->Status=loaded_available,Evidence=Loaded,Why=positive_visible_evidence
    ;Visible\=[]->Status=exists_unloaded_source,Evidence=Visible,Why=positive_visible_evidence
    ;All\=[]->Status=indeterminate,Evidence=All,Why=evidence_only_in_other_microtheories
    ;missing_status(C,Check,Status),Evidence=[],Why=no_evidence_in_bounded_analysis).
loaded_evidence(E) :- E.loaded==true.
missing_status(C,Check,Status) :-
    (get_dict(catalogComplete,C,true),get_dict(freshness,C,complete),
     get_dict(rows,C,complete),get_dict(Check,C,complete),
     get_dict(issues,C,[])->Status=missing_complete_catalog;Status=indeterminate).

report_page(Report,Options,Reply) :-
    must_be(dict,Options),dict_pairs(Options,_,Pairs),
    forall(member(Key-_,Pairs),
      (memberchk(Key,[offset,limit,kind,severity,status,disposition,scope])->true;
         domain_error(report_filter,Key))),
    option(Options,offset,0,Offset),option(Options,limit,25,Limit),
    must_be(nonneg,Offset),must_be(positive_integer,Limit),
    (Limit=<100->true;domain_error(report_page_limit,Limit)),
    forall(member(Key,[kind,severity,status,disposition,scope]),
      (option(Options,Key,all,V),must_be(atom,V),
       (filter_value(Key,V)->true;domain_error(report_filter_value,Key-V)))),
    include(matches(Options),Report.items,Filtered),length(Filtered,Total),
    findall(Item,(nth0(N,Filtered,Item),N>=Offset,N<Offset+Limit),Items),
    Reply=Report.put(json{items:Items,total:Total,offset:Offset,limit:Limit}).
matches(Options,Finding) :-
    forall(member(Key,[kind,severity,status,disposition,scope]),
      (option(Options,Key,all,Value),(Value==all;get_dict(Key,Finding,Value)))).
filter_value(_,all) :- !.
filter_value(kind,Kind) :- kb_dependency_resolution_policy:kind(Kind,_).
filter_value(severity,Value) :- memberchk(Value,[info,warning,error]).
filter_value(disposition,Value) :- memberchk(Value,[active,suppressed]).
filter_value(scope,Value) :- memberchk(Value,[loaded,unloaded,unresolved]).
filter_value(status,Value) :-
    memberchk(Value,[loaded_available,exists_unloaded_source,missing_complete_catalog,
      external_implementation_required,indeterminate,standalone_reference,
      loaded_or_catalog_evidence,detached,exempt]).
option(Dict,Key,Default,Value) :- (get_dict(Key,Dict,Value)->true;Value=Default).
