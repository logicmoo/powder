:- begin_tests(non_atomic).
:- use_module('../kb_non_atomic').
:- use_module('../kb_terms',[]).
:- use_module(library(http/json)).

ast(Term,Others,AST) :-
    term_schema([Term|Others],Schema),annotated_semantic_ast(Term,[],Schema,AST),
    assertion(ground(AST)),with_output_to(string(_),json_write_dict(current_output,AST)).
roundtrip(Term,Key) :-
    non_atomic_key(Term,Key),non_atomic_from_key(Key,Again),
    assertion(Again==Term),non_atomic_key(Again,Key).

test(full_identity_includes_all_arguments_and_distinguishes_constructor) :-
    roundtrip(x_Fn(x_A,2),A),roundtrip(x_Fn(x_A,3),B),
    assertion(A\==B),assertion(A\==x_Fn),assertion(atom_concat('nat:',_,A)).
test(canonical_reuses_context_encoding_and_preserves_complex_values) :-
    Term=x_Fn('x_MiXeD',"line\n\"quoted\"\\tail",x_Nested("é雪🙂"),[x_a,1,"1"]),
    roundtrip(Term,Key),kb_terms:context_key(Term,Mt),
    atom_concat('nat:',Text,Key),atom_concat('mt:',Text,Mt),
    non_atomic_context_key(Term,Mt).
test(dict_values_and_keys_are_lossless_without_dict_tags_becoming_symbols) :-
    roundtrip(x_Fn(metta_map{x_Mixed:"雪",2:x_Nested([x_a,"b"])}),Key),
    assertion(atom_concat('nat:',_,Key)).
test(higher_order_identity_includes_predicate_position) :-
    roundtrip(t(x_Fn(x_A),x_B),Key),non_atomic_from_key(Key,Again),
    assertion(Again==t(x_Fn(x_A),x_B)).
test(number_string_and_symbol_case_have_distinct_identities) :-
    maplist(non_atomic_key,[x_Fn(1),x_Fn("1"),x_Fn(x_A),x_Fn(x_a)],Keys),
    sort(Keys,Unique),assertion(length(Unique,4)).
test(noncanonical_whitespace_is_rejected,
     [throws(error(domain_error(noncanonical_non_atomic_key,_),_))]) :-
    non_atomic_from_key('nat:x_Fn( x_A )',_).
test(variables_rejected_without_binding,
     [throws(error(domain_error(ground_normalized_application,_),_))]) :-
    non_atomic_key(x_Fn(_),_).
test(cycles_are_rejected,
     [throws(error(domain_error(ground_normalized_application,_),_))]) :-
    X=x_Fn(X),non_atomic_key(X,_).
test(directives_are_data_only_and_rejected,
     [throws(error(domain_error(ground_normalized_application,_),_))]) :-
    non_atomic_from_key('nat::-(halt)',_).
test(module_qualification_is_rejected,
     [throws(error(domain_error(ground_normalized_application,_),_))]) :-
    non_atomic_from_key('nat::(user,halt)',_).
test(instrumentation_is_not_a_normalized_application,
     [throws(error(domain_error(ground_normalized_application,_),_))]) :-
    non_atomic_key(x_Fn(x_cid(a1)),_).
test(list_root_is_not_a_function_application,
     [throws(error(domain_error(ground_normalized_application,_),_))]) :-
    non_atomic_key([x_a,x_b],_).
test(no_parser_execution_even_with_halt_spelled_as_a_semantic_symbol) :-
    roundtrip(x_halt(x_process_create("must remain data")),Key),
    assertion(atom(Key)).
test(ordinary_predicate_root_is_not_nat_but_nested_argument_is) :-
    ast(x_relatedTo(x_A,x_YearFn(2026)),[],AST),
    assertion(AST.denotesNat==false),AST.args=[_,Year],
    assertion(Year.denotesNat==true),assertion(Year.head.value==x_YearFn),
    non_atomic_key(x_YearFn(2026),Year.natKey),
    assertion(Year.natKey\==Year.head.value).
test(declared_function_application_has_evidence_even_at_top_level) :-
    ast(x_DateFn(2026),[x_resultIsa(x_DateFn,x_Date)],AST),
    assertion(AST.denotesNat==true),assertion(AST.denotationEvidence==declared_function).
test(uppercase_name_and_function_suffix_do_not_type_top_level_forms) :-
    ast(x_UPPERCASE(x_A),[],Upper),ast(x_GuessFn(x_A),[],Suffix),
    assertion(Upper.denotesNat==false),assertion(Suffix.denotesNat==false).
test(logical_and_known_predicate_forms_are_not_nats) :-
    ast(x_holds(x_and(x_p(x_A),x_not(x_q(x_B)))),[x_p(x_C),x_q(x_D)],AST),
    AST.args=[And],assertion(And.denotesNat==false),
    And.args=[P,Not],assertion(P.denotesNat==false),assertion(Not.denotesNat==false),
    Not.args=[Q],assertion(Q.denotesNat==false).
test(formula_slot_schema_prevents_unknown_formula_from_becoming_nat) :-
    ast(x_holds(x_unknown(x_A)),[x_arg1Isa(x_holds,x_CycFormula)],AST),
    AST.args=[Formula],assertion(Formula.denotesNat==false).
test(quoted_data_never_denotes_nat_even_with_function_declarations) :-
    ast(x_quote(x_Fn(x_A)),[x_resultIsa(x_Fn,x_Thing)],AST),
    assertion(AST.denotesNat==false),AST.args=[Quoted],
    assertion(Quoted.denotesNat==false).
test(nested_value_wrapper_cannot_escape_a_quoted_data_position) :-
    ast(x_quote(metta_value([x_Fn(x_A)])),[x_resultIsa(x_Fn,x_Thing)],AST),
    AST.args=[Wrapped],Wrapped.value.items=[Fn],assertion(Fn.denotesNat==false).
test(inert_metta_forms_do_not_supply_semantic_callback_or_nat_positions) :-
    ast(metta_exec(x_SubLQuoteFn(x_Method)),[],Exec),
    assertion(Exec.value.denotesNat==false),
    ast('x_metta='(x_a,x_afterAdding(x_p,x_SubLQuoteFn(x_Method))),[],Equation),
    Equation.args=[_,Callback],assertion(Callback.denotesNat==false),
    Callback.args=[_,Reference],assertion(Reference.denotesNat==false).
test(list_items_require_explicit_function_evidence_and_keep_ast_paths) :-
    ast(metta_value([x_Fn(x_A),x_Unknown(x_B)]),[x_resultIsa(x_Fn,x_Thing)],AST),
    AST.value.items=[Known,Unknown],assertion(Known.denotesNat==true),
    assertion(Unknown.denotesNat==false).
test(variable_sharing_and_names_survive_annotations) :-
    Term=x_related(x_Fn(X),X),term_schema([Term],Schema),
    annotated_semantic_ast(Term,["??Foo-Bar"],Schema,AST),
    AST.args=[Fn,Variable],Fn.args=[Nested],
    assertion(Fn.denotesNat==false),assertion(Fn.natCandidate==true),
    assertion(Fn.natKey==null),assertion(Nested.value=="??Foo-Bar"),
    assertion(Variable.value=="??Foo-Bar"),assertion(var(X)),
    term_variables(Term,Variables),assertion(Variables==[X]).
test(schema_analysis_never_instantiates_variable_types_or_predicates) :-
    Terms=[x_isa(x_Fn,T),x_argIsa(x_p,1,F),x_resultIsa(P,x_Thing)],
    term_schema(Terms,Schema),assertion(var(T)),assertion(var(F)),assertion(var(P)),
    assertion(\+memberchk(x_Fn,Schema.functions)),assertion(Schema.formulaSlots==[]).
test(negative_and_rule_head_declarations_do_not_establish_function_schema) :-
    term_schema([x_not(x_resultIsa(x_Neg,x_Thing)),
                 (x_resultIsa(x_Rule,x_Thing):-and(throw(do_not_execute)))],Schema),
    assertion(\+memberchk(x_Neg,Schema.functions)),assertion(\+memberchk(x_Rule,Schema.functions)).
test(compound_context_is_denoting_and_uses_full_key) :-
    Context=x_MtFn(x_Project,x_DateFn(2026)),annotated_context_ast(Context,AST),
    non_atomic_key(Context,Key),assertion(AST.denotesNat==true),
    assertion(AST.natKey==Key),assertion(AST.head.value==x_MtFn),assertion(ground(AST)).
test(actual_compound_context_still_has_identity_when_its_functor_is_quote) :-
    annotated_context_ast(x_quote(x_A),AST),
    assertion(AST.denotesNat==true),non_atomic_key(x_quote(x_A),AST.natKey).
test(dict_function_value_paths_match_the_shared_renderer) :-
    ast(x_p(metta_map{x_a:x_Fn(1),x_b:x_Unknown(2)}),[x_resultIsa(x_Fn,x_Thing)],AST),
    AST.args=[Map],Map.entries=[First,Second],
    assertion(First.value.denotesNat==true),assertion(Second.value.denotesNat==false).
test(rule_annotation_paths_align_with_semantic_rule_ast) :-
    Term=(x_p(x_Fn(x_A)):-and(x_q(x_Fn(x_B)))),
    ast(Term,[],AST),assertion(AST.denotesNat==false),AST.args=[Head,Body],
    Head.args=[H],Body.args=[B],assertion(H.denotesNat==true),
    assertion(B.denotesNat==true),assertion(H.natKey\==B.natKey).
test(higher_order_head_gets_full_identity_separate_from_outer_predicate) :-
    ast(t(x_PredicateFn(x_A),x_B),[],AST),
    assertion(AST.denotesNat==false),assertion(AST.head.denotesNat==true),
    non_atomic_key(x_PredicateFn(x_A),AST.head.natKey).

:- end_tests(non_atomic).
