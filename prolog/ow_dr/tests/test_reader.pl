:- begin_tests(logos_reader).

:- use_module('../kb_reader').
:- use_module('../kb_mappings').
:- use_module(library(crypto)).
:- use_module(library(memfile)).
:- use_module(library(readutil)).

:- prolog_load_context(directory,Dir), asserta(test_directory(Dir)).

one(Text,Dialect,Options,Semantic,Names,Mt,Properties,Key) :-
    parse_text(Text,Dialect,[diagnostics(false)|Options],
               [assertion(Semantic,Names,Mt,_,Properties,Key)]).

fixture_path(Extension,Path) :-
    test_directory(Dir),
    flag(reader_fixture_number,N,N+1),
    current_prolog_flag(pid,Pid),
    format(atom(Name),'.reader-fixture-~d-~d.~w',[Pid,N,Extension]),
    directory_file_path(Dir,Name,Path).

with_source(Text,Extension,Encoding,Goal) :-
    fixture_path(Extension,Path),
    setup_call_cleanup(
        setup_call_cleanup(open(Path,write,S,[encoding(Encoding)]),
                           format(S,'~s',[Text]), close(S)),
        call(Goal,Path),
        delete_file(Path)).

test(canonical_table) :-
    mapping_rows(Rows), length(Rows,74), ground(Rows),
    once((member(Row,Rows), Row.id=='backward-rule-operator')),
    Row.conversion=="global(rename('<==',any))",
    mapping_identity(Hash), atom_length(Hash,64),
    mapping_hash(Hash).

test(ground_fact_and_empty_names) :-
    one("(isa Fido Dog)",kif,[],x_isa(x_Fido,x_Dog),[],_,Props,Key),
    Props==[mapping_rows-[]], ground(Key).

test(leading_dot_decimal_numbers_are_not_semantic_symbols) :-
    Text="(p .5 .01 .001 .000001 -.5 +.5 .5e2 -.5E-2)",
    forall(member(Dialect,[kif,krf,metta]),
           one(Text,Dialect,[],
               x_p(0.5,0.01,0.001,0.000001,-0.5,0.5,50.0,-0.005),[],_,_,_)).

test(leading_dot_metta_standalone_is_numeric_data) :-
    one(".5",metta,[],metta_value(0.5),[],_,_,_).

test(leading_dot_decimal_fix_preserves_occurrence_identity) :-
    one("(p .5)",kif,[],x_p(0.5),[],Mt,_,Key),
    Original=list([sym(p),sym('.5')]),
    term_string(occurrence(kif,Mt,[],Original),Before,
                [quoted(true),ignore_ops(true)]),
    crypto_data_hash(Before,PreviousKey,[algorithm(sha256),encoding(utf8)]),
    Key==PreviousKey.

test(real_variables_and_sharing) :-
    one("(rel ?X ?? ??Foo-Bar ?X ??)",kif,[],Term,Names,_,_,_),
    Term=x_rel(X,R,F,X2,R2),
    X==X2, R==R2, X\==R, F\==X,
    term_variables(Term,Vars), Vars==[X,R,F],
    Names==["?X","??","??Foo-Bar"],
    maplist(var,Vars).

test(row_variable_identity_without_expansion) :-
    one("(rel @ROW ?ROW @ROW)",kif,[],x_rel(R,X,R2),["@ROW","?ROW"],_,_,_),
    R==R2, R\==X, var(R).

test(real_variable_write_read_roundtrip) :-
    one("(<=== (grandparent ?X ?Y) (parent ?X ?Z) (parent ?Z ?Y))",kif,[],
        Term,["?X","?Y","?Z"],_,_,_),
    Term=(x_grandparent(X,Y):-and(x_parent(X2,Z),x_parent(Z2,Y2))),
    X==X2,Y==Y2,Z==Z2,
    term_string(Term,Text,[quoted(true),ignore_ops(true),numbervars(false)]),
    term_string(Read,Text), Read =@= Term,
    term_variables(Read,Vars), length(Vars,3), maplist(var,Vars),
    \+ sub_term('$VAR'(_),Text).

test(exact_three_equals_rule) :-
    one("(<=== (done ?X))",krf,[],(x_done(X):-and),["?X"],_,_,_),var(X).

test(two_equals_preserved) :-
    one("(<== (p ?X) (q ?X))",kif,[],Term,["?X"],_,Props,_),
    Term='x_<=='(x_p(X),x_q(Y)), X==Y,
    memberchk(mapping_rows-['backward-rule-operator'],Props).

test(ordinary_implication_formula) :-
    one("(=> (isa ?X Dog) (isa ?X Animal))",kif,[],
        x_implies(x_isa(X,x_Dog),x_isa(Y,x_Animal)),["?X"],_,_,_),
    X==Y.

test(krf_never_mapped_even_opt_in) :-
    Text=";; logos: sumo-mappings\n(=> (instance ?X Class) (exists (IndexicalFn currentRole)))",
    one(Text,krf,[sumo_mappings(true),strict_mappings(true)],Term,["?X"],_,Props,_),
    Term='x_=>'(x_instance(_,x_Class),x_exists(x_IndexicalFn(x_currentRole))),
    Props==[mapping_rows-[]].

test(krf_feature_default_and_executable) :-
    Text="#-:rc4 (p old) #+:rc4 (p new) #-:executable (q kept)",
    parse_text(Text,krf,[],[assertion(x_p(x_old),[],_,_,_,_),
                           assertion(x_q(x_kept),[],_,_,_,_)]).

test(krf_configured_feature) :-
    parse_text("#-:rc4 (p old) #+:rc4 (p new)",krf,[features([':RC4'])],
               [assertion(x_p(x_new),[],_,_,_,_)]).

test(krf_nested_feature_consumes_entire_form) :-
    one("(p #+:absent (not (kept a)) #-:absent (kept b))",krf,[],
        x_p(x_kept(x_b)),[],_,_,_).

test(krf_escaped_marker_is_an_ordinary_symbol) :-
    one("(p \\#-:rc4 a)",krf,[],x_p('x_#-:rc4',x_a),[],_,_,_).

test(krf_dangling_feature,[throws(error(source_error('<text>',2,1,_),_))]) :-
    parse_text("\n#-:rc4",krf,[],_).

test(krf_malformed_feature,[throws(error(source_error('<text>',1,1,_),_))]) :-
    parse_text("#- (p a)",krf,[],_).

test(microtheory_options_and_overrides) :-
    Text="(in-microtheory FamilyMt :exclude-globals nil)\n(isa Fido Dog)\n\c
          (:MICROTHEORY OtherMt :KIF (isa Rex Dog))\n(isa Lassie Dog)",
    parse_text(Text,kif,[],[A,B,C]),
    A=assertion(x_isa(x_Fido,x_Dog),[],x_FamilyMt,2,Props,_),
    memberchk(exclude_globals-false,Props),
    B=assertion(_,[],x_OtherMt,3,_,_),
    C=assertion(_,[],x_FamilyMt,4,_,_).

test(default_microtheory_suffix_policy) :-
    forall(member(File-Mt,['Foo.kif'-x_FooMt,'FooPSC.kif'-x_FooPSC,
                           'FooMt.krf'-x_FooMt,'FooMicrotheory.kif'-x_FooMicrotheory,
                           'FooKB.kif'-x_FooKB,'FoOkB.kif'-x_FoOkB]),
           kb_reader:default_microtheory(File,Mt)).

test(compound_microtheory_scopes_following_assertions_without_warning) :-
    Text="(in-microtheory (CommonsenseMicrostoryMtFn ViolentImpact-Harm))\n(p a)\n(p b)",
    forall(member(Dialect,[kif,krf]),
           with_source(Text,Dialect,iso_latin_1,check_compound_microtheory)).
check_compound_microtheory(Path) :-
    State=warnings([]),
    read_source(Path,[diagnostics(false),strict_mappings(true),sumo_mappings(true),
                     warning_observer(plunit_logos_reader:remember_warning(State))],
                [assertion(x_p(x_a),[],Mt,2,_,_),
                 assertion(x_p(x_b),[],Same,3,_,_)],Info),
    Mt==x_CommonsenseMicrostoryMtFn('x_ViolentImpact-Harm'),Same==Mt,
    ground(Mt),Info.warnings==[],arg(1,State,[]).

test(compound_microtheory_wrapper_overrides_only_its_assertion) :-
    Text="(in-microtheory (BaseMtFn Root) :exclude-globals t)\n(p a)\n\c
          (:MICROTHEORY (OtherMtFn Leaf) :KIF (p b))\n(p c)",
    parse_text(Text,kif,[diagnostics(false)],
               [assertion(x_p(x_a),[],x_BaseMtFn(x_Root),2,Props,_),
                assertion(x_p(x_b),[],x_OtherMtFn(x_Leaf),3,_,_),
                assertion(x_p(x_c),[],x_BaseMtFn(x_Root),4,_,_)]),
    memberchk(exclude_globals-true,Props).

test(compound_microtheory_nested_terms_escape_and_do_not_remap_or_double_prefix) :-
    Text="(in-microtheory (x_MtFn (#$InnerFn x_Class) \"line\\nname\" |A B|))\n(instance Fido Class)",
    one_compound_mt_source(Text).
one_compound_mt_source(Text) :-
    parse_text(Text,kif,[diagnostics(false),sumo_mappings(true),strict_mappings(true)],
               [assertion(x_isa(x_Fido,x_Collection),[],
                          x_MtFn(x_InnerFn(x_Class),"line\nname",'x_A B'),_,Props,_)]),
    Props==[mapping_rows-['instance-isa','class-collection']].

test(compound_microtheory_does_not_apply_formatting_list_interpretation) :-
    forall(member(Text-Mt,
                  ["(in-microtheory (genFormat relation \"fmt\" (a b)))\n(p a)"-
                   x_genFormat(x_relation,"fmt",x_a(x_b)),
                   "(in-microtheory (doAnnounce message (a b)))\n(p a)"-
                   x_doAnnounce(x_message,x_a(x_b))]),
           ( State=warnings([]),
             parse_text(Text,krf,[diagnostics(false),
                                 warning_observer(plunit_logos_reader:remember_warning(State))],
                        [assertion(x_p(x_a),[],Actual,2,_,_)]),
             Actual==Mt,arg(1,State,[]) )).

test(compound_microtheory_rejects_live_variables,
     [throws(error(source_error('<text>',1,_,_),_))]) :-
    parse_text("(in-microtheory (MtFn ?X))\n(p a)",kif,[],_).

test(microtheory_rejects_scalar_values,
     [throws(error(source_error('<text>',1,_,_),_))]) :-
    parse_text("(in-microtheory 42)\n(p a)",krf,[],_).

test(microtheory_bad_option,[throws(error(source_error('<text>',1,_,_),_))]) :-
    parse_text("(in-microtheory Mt :exclude-globals perhaps)",kif,[],_).

test(microtheory_duplicate_option,[throws(error(source_error('<text>',1,_,_),_))]) :-
    parse_text("(in-microtheory Mt :exclude-globals t :exclude-globals nil)",kif,[],_).

test(microtheory_missing_option_value,[throws(error(source_error('<text>',1,_,_),_))]) :-
    parse_text("(in-microtheory Mt :exclude-globals)",kif,[],_).

test(cyc_wrapper_nil_omission_is_specific) :-
    Text="(:DIRECTION :FORWARD :MONOTONICITY :DEFAULT :CREATOR NIL \c
          :CREATION-DATE nil :SOMETHING NIL :MICROTHEORY BaseKB :KIF \c
          (prettyName Region \"Step'anavani Shrjan\"))",
    one(Text,kif,[],x_prettyName(x_Region,"Step'anavani Shrjan"),[],x_BaseKB,Props,_),
    memberchk(direction-':FORWARD',Props),
    memberchk(monotonicity-':DEFAULT',Props),
    memberchk('cyc::SOMETHING'-'NIL',Props),
    \+ memberchk(creator-_,Props), \+memberchk(creation_date-_,Props).

test(cyc_wrapper_unknown_metadata_inert_and_ground) :-
    one("(:CREATOR Alice :CREATION-DATE \"2025-01-01\" :EXTRA (shell ?X \"bad\") :KIF (p a))",
        kif,[],_,[],_,Props,_),
    memberchk(creator-'Alice',Props),
    memberchk(creation_date-"2025-01-01",Props),
    memberchk('cyc::EXTRA'-sexpr([shell,variable("?X",ordinary),"bad"]),Props),
    ground(Props).

test(cyc_duplicate_property,[throws(error(source_error('<text>',1,_,_),_))]) :-
    parse_text("(:KIF (p a) :kif (q b))",kif,[],_).

test(quantifier_scope_and_first_semantic_occurrence) :-
    Text="(and (p ?X) (forall (?X ?Y) (q ?X ?Y)) (r ?X))",
    one(Text,kif,[],Term,Names,_,_,_),
    Term=x_and(x_p(Outer),x_forAll(Inner,x_forAll(Y,x_q(Inner2,Y2))),x_r(Outer2)),
    Outer==Outer2, Inner==Inner2, Y==Y2, Outer\==Inner, Y\==Inner,
    Names==["?X","?X","?Y"], term_variables(Term,Vs),length(Vs,3).

test(krf_quantifier_scopes_without_mapping) :-
    one("(and (p ?X) (forall (?X) (q ?X)) (r ?X))",krf,[],Term,Names,_,Props,_),
    Term=x_and(x_p(X),x_forall(t(Y),x_q(Z)),x_r(X2)),
    X==X2,Y==Z,X\==Y,Names==["?X","?X"],Props==[mapping_rows-[]].

test(mapping_permutation_and_names_follow_semantic_order) :-
    one("(part ?PART ?WHOLE)",kif,[sumo_mappings(true)],
        x_parts(W,P),["?WHOLE","?PART"],_,_,_), W\==P.

test(mapping_recursive_order_and_multiplicity) :-
    one("(and (instance a Entity) (instance b Entity))",kif,[sumo_mappings(true)],
        x_and(x_isa(x_a,x_Thing),x_isa(x_b,x_Thing)),[],_,Props,_),
    Props==[mapping_rows-['and-and','instance-isa','entity-thing','instance-isa','entity-thing']].

test(mapping_explicit_cyc_symbol_bypasses) :-
    one("(#$instance #$Class Entity)",kif,[sumo_mappings(true)],
        x_instance(x_Class,x_Thing),[],_,Props,_),
    Props==[mapping_rows-['entity-thing']].

test(mapping_quoted_symbol_has_ordinary_symbol_semantics) :-
    one("(|instance| |Class| |Entity|)",kif,[sumo_mappings(true)],
        x_isa(x_Collection,x_Thing),[],_,_,_).

test(mapping_opt_in_must_be_a_leading_marker) :-
    one(";; mentions logos: sumo-mappings but is not the opt-in\n(instance a Class)",
        kif,[],x_instance(x_a,x_Class),[],_,_,_),
    one(";; preamble\n;; logos: sumo-mappings\n(instance a Class)",
        kif,[],x_isa(x_a,x_Collection),[],_,_,_).

test(mapping_holds_invalid_predicate_is_mismatch) :-
    one("(holds 7 Entity)",kif,[sumo_mappings(true)],
        x_holds(7,x_Thing),[],_,Props,_),
    Props=[mapping_rows-['entity-thing',warnings(Message)],warnings-[Message]],string(Message).

test(mapping_quantifier_invalid_formula_is_mismatch) :-
    one("(exists ?X 7)",kif,[sumo_mappings(true)],
        x_exists(X,7),["?X"],_,Props,_),var(X),
    Props=[mapping_rows-[warnings(Message)],warnings-[Message]],string(Message).

test(mapping_indexed_integer_and_variable) :-
    parse_text("(domain foo 2 Entity) (domain foo ?N Class)",kif,[sumo_mappings(true)],
        [assertion(x_arg2Isa(x_foo,x_Thing),[],_,_,_,_),
         assertion(x_argIsa(x_foo,N,x_Collection),["?N"],_,_,_,_)]),var(N).

test(mapping_holds_dispatches_predicate_conversion) :-
    one("(holds part ?PART ?WHOLE)",kif,[sumo_mappings(true)],
        x_parts(W,P),["?WHOLE","?PART"],_,Props,_), W\==P,
    Props==[mapping_rows-['holds-predicate-application','part-parts']].

test(mapping_holds_variable_predicate) :-
    one("(holds ?P ?X ?X)",kif,[sumo_mappings(true)],
        t(P,X,Y),["?P","?X"],_,_,_), var(P),X==Y.

test(mapping_compound_predicate_is_not_metta_dict) :-
    one("((a b) (c d))",kif,[],t(x_a(x_b),x_c(x_d)),[],_,_,_).

test(genformat_singleton_descriptor_is_a_list_in_kif_and_krf) :-
    forall(member(Dialect,[kif,krf]),
           one("(genFormat ist-Information \"~a\" (2))",Dialect,[],
               x_genFormat('x_ist-Information',"~a",[2]),[],_,_,_)).

test(genformat_multiple_descriptor_is_a_list_in_kif_and_krf) :-
    forall(member(Dialect,[kif,krf]),
           one("(genFormat transMotion \"~a moves ~a\" (1 2))",Dialect,[],
               x_genFormat(x_transMotion,"~a moves ~a",[1,2]),[],_,_,_)).

test(genformat_nested_descriptor_preserves_literal_markers) :-
    forall(member(Dialect,[kif,krf]),
           one("(genFormat isa \"~a is ~a\" (1 (2 A-THE-WORD)))",Dialect,[],
               x_genFormat(x_isa,"~a is ~a",[1,[2,'x_A-THE-WORD']]),[],_,_,_)).

test(genformat_physics_predicates_keep_same_descriptor_shape) :-
    forall(member(Predicate,[netForce,netTorque,forceAppliedToObj,torqueAppliedToObj]),
           ( format(string(Text),'(genFormat ~w "format" (1 (2 A-THE-WORD)))',[Predicate]),
             atom_concat(x_,Predicate,Normalized),
             one(Text,krf,[],x_genFormat(Normalized,"format",[1,[2,'x_A-THE-WORD']]),
                 [],_,_,_) )).

test(genformat_literal_descriptor_bypasses_sumo_mapping) :-
    one("(genFormat instance \"~a\" (1 (2 Class) (3 (Entity A-THE-WORD))))",
        kif,[sumo_mappings(true)],
        x_genFormat(x_isa,"~a",[1,[2,x_Class],[3,[x_Entity,'x_A-THE-WORD']]]),
        [],_,Properties,_),
    Properties=[mapping_rows-['instance-isa',note(Message)],notices-[Message]],string(Message).

test(genformat_krf_still_never_applies_mappings) :-
    one("(genFormat instance \"~a\" (1 (2 Class)))",
        krf,[sumo_mappings(true),strict_mappings(true)],
        x_genFormat(x_instance,"~a",[1,[2,x_Class]]),[],_,Properties,_),
    Properties=[mapping_rows-[note(Message)],notices-[Message]],string(Message).

test(genformat_inside_formula_retains_list_and_variable_sharing) :-
    one("(=> (p ?X) (genFormat isa \"~a\" (?X (2 A-THE-WORD))))",kif,[],
        x_implies(x_p(X),x_genFormat(x_isa,"~a",[Y,[2,'x_A-THE-WORD']])),
        ["?X"],_,_,_),X==Y,var(X).

test(genformat_query_supports_variable_and_nested_list_patterns) :-
    normalize_query("(genFormat isa ?Text ?Args)",
                    x_genFormat(x_isa,Text,Args),["?Text","?Args"]),
    var(Text),var(Args),
    normalize_query("(genFormat isa \"~a\" (1 (2 A-THE-WORD)))",
                    x_genFormat(x_isa,"~a",[1,[2,'x_A-THE-WORD']]),[]).

test(genformat_empty_list_stays_empty_list) :-
    one("(genFormat p \"literal\" ())",krf,[],x_genFormat(x_p,"literal",[]),[],_,_,_).

test(genformat_only_third_slot_gets_list_interpretation) :-
    one("(genFormat (relationFn a) \"format\" (1 (2 A-THE-WORD)))",kif,[],
        x_genFormat(x_relationFn(x_a),"format",[1,[2,'x_A-THE-WORD']]),[],_,_,_),
    one("(p (marker value))",krf,[],x_p(x_marker(x_value)),[],_,_,_).

test(numeric_predicate_outside_genformat_stays_application_data) :-
    one("(p (1 2))",krf,[],x_p(t(1,2)),[],_,_,_).

test(ordinary_numeric_application_warns_and_continues_without_list_coercion) :-
    forall(member(Dialect,[kif,krf]),
           with_source("\n(ordinary (1 2))\n(p after)",Dialect,iso_latin_1,
                       check_ordinary_numeric_application)).
check_ordinary_numeric_application(Path) :-
    read_source(Path,[diagnostics(false),strict_mappings(true),sumo_mappings(true)],
                [assertion(x_ordinary(Value),[],_,2,Properties,_),
                 assertion(x_p(x_after),[],_,3,_,_)],Info),
    Value==t(1,2),\+is_list(Value),
    Properties=[mapping_rows-[warnings(Message)],warnings-[Message]],
    Info.warnings=[warning(Path,2,11,Message)],
    once(sub_string(Message,_,_,_,"higher-order application data t(1,...)")),
    once(sub_string(Message,_,_,_,"not a list")),
    once(sub_string(Message,_,_,_,"Check the intended predicate")).

test(genformat_first_slot_numeric_form_is_not_list_data) :-
    with_source("(genFormat (1 2) \"format\" (1 (2 A-THE-WORD)))",
                krf,iso_latin_1,check_genformat_first_slot).
check_genformat_first_slot(Path) :-
    read_source(Path,[diagnostics(false),strict_mappings(true)],
                [assertion(x_genFormat(t(1,2),"format",[1,[2,'x_A-THE-WORD']]),
                           [],_,_,_,_)],Info),
    length(Info.warnings,1).

test(valid_compound_predicate_retains_t_without_warning) :-
    with_source("((a b) (c d))",krf,iso_latin_1,check_compound_predicate).
check_compound_predicate(Path) :-
    read_source(Path,[diagnostics(false)],
                [assertion(t(x_a(x_b),x_c(x_d)),[],_,_,_,_)],Info),
    Info.warnings==[].

test(ordinary_string_head_is_preserved_as_application_data) :-
    with_source("(ordinary (\"label\" x))",krf,iso_latin_1,check_string_head).
check_string_head(Path) :-
    read_source(Path,[diagnostics(false),strict_mappings(true)],
                [assertion(x_ordinary(t("label",x_x)),[],_,_,_,_)],Info),
    Info.warnings=[warning(Path,1,11,_)].

test(ordinary_scalar_arguments_are_not_reinterpreted) :-
    with_source("(ordinary 1 2)",krf,iso_latin_1,check_ordinary_scalars).
check_ordinary_scalars(Path) :-
    read_source(Path,[diagnostics(false)],
                [assertion(x_ordinary(1,2),[],_,_,_,_)],Info),
    Info.warnings==[].

test(recoverable_application_warning_does_not_hide_genuine_syntax_error) :-
    State=warnings([]),
    catch(parse_text("(ordinary (1 2))\n(unclosed",krf,
                     [diagnostics(false),strict_mappings(true),
                      warning_observer(plunit_logos_reader:remember_warning(State))],_),
          error(source_error('<text>',2,1,_),_),Caught=true),
    Caught==true,arg(1,State,[warning('<text>',1,11,_)]).

test(genformat_does_not_change_metta_application_semantics,
     [throws(error(source_error('<text>',1,25,_),_))]) :-
    parse_text("(genFormat isa \"format\" (1 2))",metta,[],_).

test(genformat_interpretation_adds_note_and_continues_following_assertions) :-
    Text="(genFormat ist-Information \"~a\" (2))\n(p after)",
    with_source(Text,kif,iso_latin_1,check_genformat_warning).
check_genformat_warning(Path) :-
    State=warnings([]),
    read_source(Path,[diagnostics(false),
                     warning_observer(plunit_logos_reader:remember_warning(State))],
                [assertion(x_genFormat('x_ist-Information',"~a",[2]),[],_,1,Props,_),
                 assertion(x_p(x_after),[],_,2,FollowingProps,_)],Info),
    Info.warnings==[],
    Props=[mapping_rows-[note(Message)],notices-[Message]],FollowingProps==[mapping_rows-[]],
    once(sub_string(Message,_,_,_,"recursive list data")),
    once(sub_string(Message,_,_,_,"normally encoded")),
    arg(1,State,[]),ground(Info).

test(genformat_nested_krf_note_is_nonfatal_in_strict_mapping_mode) :-
    Text="(genFormat isa \"~a\"\n  (1 (2 A-THE-WORD)))\n(p after)",
    with_source(Text,krf,iso_latin_1,check_strict_genformat_warning).
check_strict_genformat_warning(Path) :-
    read_source(Path,[diagnostics(false),strict_mappings(true),sumo_mappings(true)],
                [assertion(x_genFormat(x_isa,"~a",[1,[2,'x_A-THE-WORD']]),[],_,1,Props,_),
                 assertion(x_p(x_after),[],_,3,_,_)],Info),
    Props=[mapping_rows-[note(Message)],notices-[Message]],Info.mappingHash==none,
    Info.warnings==[],
    once(sub_string(Message,_,_,_,"genFormat argument 3")),
    once(sub_string(Message,_,_,_,"source line 2, column 3")).

test(genformat_note_is_metadata_not_warning_output) :-
    with_source("(genFormat isa \"~a\"\n  (1 (2 A-THE-WORD)))\n(p after)",
                krf,iso_latin_1,check_genformat_diagnostic).
check_genformat_diagnostic(Path) :-
    capture_stderr(read_source(Path,[strict_mappings(true)],Assertions,Info),Output),
    Assertions=[assertion(_,_,_,_,[mapping_rows-[note(Message)],notices-[Message]],_),_],
    Info.warnings==[],Output=="",
    once(sub_string(Message,_,_,_,"source line 2, column 3")),
    once(sub_string(Message,_,_,_,"recursive list data")).

test(genformat_scalar_is_not_silently_wrapped) :-
    with_source("(genFormat isa \"~a\" 2)",krf,iso_latin_1,check_genformat_scalar).
check_genformat_scalar(Path) :-
    read_source(Path,[diagnostics(false)],
                [assertion(x_genFormat(x_isa,"~a",2),[],_,_,_,_)],Info),
    Info.warnings==[].

test(genformat_nil_symbol_passes_through_for_any_placeholder_count) :-
    Text="(genFormat isa \"literal text\" NIL)\n(genFormat isa \"~a\" NIL)\n(genFormat isa \"~a is ~a\" NIL)",
    forall(member(Dialect,[kif,krf]),
           with_source(Text,Dialect,iso_latin_1,check_genformat_nil)).
check_genformat_nil(Path) :-
    State=warnings([]),
    read_source(Path,[diagnostics(false),strict_mappings(true),
                     warning_observer(plunit_logos_reader:remember_warning(State))],
                [assertion(x_genFormat(x_isa,"literal text",'NIL'),[],_,1,P1,_),
                 assertion(x_genFormat(x_isa,"~a",'NIL'),[],_,2,P2,_),
                 assertion(x_genFormat(x_isa,"~a is ~a",'NIL'),[],_,3,P3,_)],Info),
    Info.warnings==[],arg(1,State,[]),
    P1==[mapping_rows-[]],P2==[mapping_rows-[]],P3==[mapping_rows-[]].

test(genformat_nil_symbol_is_not_the_literal_string) :-
    parse_text("(genFormat isa \"~a\" NIL)\n(genFormat isa \"~a\" \"NIL\")",krf,[],
               [assertion(x_genFormat(x_isa,"~a",Symbol),[],_,_,_,_),
                assertion(x_genFormat(x_isa,"~a",String),[],_,_,_,_)]),
    Symbol=='NIL',atom(Symbol),String=="NIL",string(String),Symbol\==String,
    normalize_query("(genFormat isa \"~a\" NIL)",x_genFormat(x_isa,"~a",'NIL'),[]),
    normalize_query("(genFormat isa \"~a\" \"NIL\")",x_genFormat(x_isa,"~a","NIL"),[]).

test(explicit_descriptor_lists_with_nil_are_not_expanded) :-
    one("(genFormat isa \"~a ~a\" (NIL (1 NIL)))",krf,[],
        x_genFormat(x_isa,"~a ~a",['NIL',[1,'NIL']]),[],_,_,_).

test(doannounce_shared_nil_policy_has_no_default_list_expansion) :-
    forall(member(Dialect,[kif,krf]),
           one("(doAnnounce \"~a ~a\" NIL)",Dialect,[],
               x_doAnnounce("~a ~a",'NIL'),[],_,_,_)).

test(genformat_note_does_not_hide_later_syntax_failure) :-
    State=warnings([]),
    catch(parse_text("(genFormat isa \"~a\" (1 (2 A-THE-WORD)))\n(unclosed",krf,
                     [diagnostics(false),strict_mappings(true),
                      warning_observer(plunit_logos_reader:remember_warning(State))],_),
          error(source_error('<text>',2,1,_),_),Caught=true),
    Caught==true,arg(1,State,[]).

test(doannounce_second_slot_preserves_singleton_multiple_and_nested_lists) :-
    Text="(doAnnounce \"~a\" (2))\n(doAnnounce \"~a ~a\" (1 2))\n(doAnnounce \"~a\" (1 (2 A-THE-WORD)))",
    forall(member(Dialect,[kif,krf]),
           parse_text(Text,Dialect,[diagnostics(false),strict_mappings(true)],
                      [assertion(x_doAnnounce("~a",[2]),[],_,_,_,_),
                       assertion(x_doAnnounce("~a ~a",[1,2]),[],_,_,_,_),
                       assertion(x_doAnnounce("~a",[1,[2,'x_A-THE-WORD']]),[],_,_,_,_)])).

test(doannounce_other_arguments_keep_application_semantics) :-
    Text="(doAnnounce (ordinary (1 2)) (1 (2 A-THE-WORD)) (3 4))\n(p after)",
    with_source(Text,krf,iso_latin_1,check_doannounce_other_arguments).
check_doannounce_other_arguments(Path) :-
    read_source(Path,[diagnostics(false),strict_mappings(true)],
                [assertion(x_doAnnounce(x_ordinary(t(1,2)),t(1,t(2,'x_A-THE-WORD')),t(3,4)),
                           [],_,1,_,_),
                 assertion(x_p(x_after),[],_,2,_,_)],Info),
    length(Info.warnings,4).

test(doannounce_queries_keep_variables_and_literal_descriptor_lists) :-
    normalize_query("(doAnnounce ?Text ?Args)",x_doAnnounce(Text,Args),["?Text","?Args"]),
    var(Text),var(Args),
    normalize_query("(doAnnounce (p ?X) (?X (2 A-THE-WORD)))",
                    x_doAnnounce(x_p(X),t(Y,t(2,'x_A-THE-WORD'))),["?X"]),X==Y,var(X),
    normalize_query("(#$doAnnounce \"~a\" (2))",x_doAnnounce("~a",[2]),[]).

test(doannounce_descriptor_bypasses_mapping_without_affecting_other_slots) :-
    Source="(doAnnounce \"message\" (Class (1 A-THE-WORD)) Entity)",
    one(Source,kif,[sumo_mappings(true),strict_mappings(true)],
        x_doAnnounce("message",[x_Class,[1,'x_A-THE-WORD']],x_Thing),[],_,KifProps,_),
    KifProps=[mapping_rows-['entity-thing',note(KifMessage)],notices-[KifMessage]],string(KifMessage),
    one(Source,krf,[sumo_mappings(true),strict_mappings(true)],
        x_doAnnounce("message",[x_Class,[1,'x_A-THE-WORD']],x_Entity),[],_,KrfProps,_),
    KrfProps=[mapping_rows-[note(KrfMessage)],notices-[KrfMessage]],string(KrfMessage).

test(doannounce_note_has_context_without_warning_counts) :-
    with_source("(doAnnounce \"~a\"\n  (1 (2 A-THE-WORD)))\n(p after)",
                krf,iso_latin_1,check_doannounce_warning).
check_doannounce_warning(Path) :-
    State=warnings([]),
    read_source(Path,[diagnostics(false),strict_mappings(true),
                     warning_observer(plunit_logos_reader:remember_warning(State))],
                [assertion(x_doAnnounce("~a",[1,[2,'x_A-THE-WORD']]),[],_,1,Props,_),
                 assertion(x_p(x_after),[],_,3,_,_)],Info),
    Info.mappingHash==none,
    Info.warnings==[],Props=[mapping_rows-[note(Message)],notices-[Message]],
    once(sub_string(Message,_,_,_,"doAnnounce argument 2")),
    once(sub_string(Message,_,_,_,"recursive list data")),
    once(sub_string(Message,_,_,_,"source line 2, column 3")),
    arg(1,State,[]).

test(doannounce_inside_formulas_preserves_shared_variables) :-
    one("(=> (p ?X) (doAnnounce \"~a\" (?X (2 A-THE-WORD))))",kif,[],
        x_implies(x_p(X),x_doAnnounce("~a",[Y,[2,'x_A-THE-WORD']])),["?X"],_,_,_),
    X==Y,var(X).

test(mapping_mismatch_keeps_head_order_and_maps_children) :-
    one("(part (instance a Entity))",kif,[sumo_mappings(true)],
        x_part(x_isa(x_a,x_Thing)),[],_,Props,_),
    Props=[mapping_rows-['instance-isa','entity-thing',warnings(Message)],warnings-[Message]],string(Message).

test(mapping_mismatch_strict_is_source_error,
     [throws(error(source_error('<text>',1,1,_),_))]) :-
    parse_text("(part a)",kif,[sumo_mappings(true),strict_mappings(true)],_).

test(mapping_invalid_quantifier_preserved_with_nested_mapping) :-
    one("(exists (IndexicalFn Class))",kif,[sumo_mappings(true)],
        x_exists(x_IndexicalFn(x_Collection)),[],_,Props,_),
    Props=[mapping_rows-['class-collection',warnings(Message)],warnings-[Message]],string(Message).

test(mapping_invalid_index_preserves_all_arguments) :-
    one("(domain p 0 Entity)",kif,[sumo_mappings(true)],
        x_domain(x_p,0,x_Thing),[],_,_,_).

test(interpretation_severities_are_exact_inert_rows_on_each_owning_assertion) :-
    Text="(genFormat isa \"~a\" (2))\n(doAnnounce \"~a\" (1 (2 A-THE-WORD)))\n(ordinary (1 2))\n(p after)",
    with_source(Text,krf,iso_latin_1,check_inert_warning_rows).
check_inert_warning_rows(Path) :-
    read_source(Path,[diagnostics(false),strict_mappings(true)],
                [assertion(S1,[],_,1,P1,_),assertion(S2,[],_,2,P2,_),
                 assertion(S3,[],_,3,P3,_),assertion(x_p(x_after),[],_,4,P4,_)],Info),
    Info.warnings=[warning(Path,3,_,M3)],
    P1=[mapping_rows-[note(M1)],notices-[M1]],
    P2=[mapping_rows-[note(M2)],notices-[M2]],
    P3==[mapping_rows-[warnings(M3)],warnings-[M3]],
    P4==[mapping_rows-[]],
    maplist(string,[M1,M2,M3]),
    ground([P1,P2,P3,P4]),
    forall(member(Semantic,[S1,S2,S3]),
           \+ (sub_term(Sub,Semantic),compound(Sub),
               compound_name_arity(Sub,Kind,1),memberchk(Kind,[note,warnings,errors]))).

test(mixed_note_warning_order_is_preserved_and_only_warnings_reach_callbacks) :-
    Text="(and (genFormat isa \"~a\" (1)) (ordinary (1 2)) (doAnnounce \"~a\" (2)) (ordinary (1 2)))",
    with_source(Text,krf,iso_latin_1,check_mixed_diagnostic_rows).
check_mixed_diagnostic_rows(Path) :-
    Observer=warnings([]),Display=warnings([]),
    read_source(Path,
                [warning_observer(plunit_logos_reader:remember_warning(Observer)),
                 diagnostic_handler(plunit_logos_reader:remember_warning(Display)),
                 strict_mappings(true)],
                [assertion(_,[],_,1,Properties,_)],Info),
    Info.warnings=[warning(Path,1,_,W1),warning(Path,1,_,W2)],
    Properties=[mapping_rows-[note(N1),warnings(W1),note(N2),warnings(W2)],
                notices-[N1,N2],warnings-[W1,W2]],
    maplist(string,[N1,N2,W1,W2]),
    arg(1,Observer,Observed),reverse(Observed,Expected),Expected==Info.warnings,
    arg(1,Display,Displayed),reverse(Displayed,Shown),Shown==Info.warnings.

test(shared_diagnostic_recorder_emits_independent_properties_and_exact_markers) :-
    Events=[diagnostic(warnings,"w1"),diagnostic(notices,"n1"),diagnostic(errors,"e1"),
            diagnostic(warnings,"w1"),diagnostic(notices,"n1"),diagnostic(errors,"e2")],
    diagnostic_metadata(Events,Properties,Markers),
    Properties==[notices-["n1","n1"],warnings-["w1","w1"],errors-["e1","e2"]],
    Markers==[warnings("w1"),note("n1"),errors("e1"),warnings("w1"),note("n1"),errors("e2")],
    ground(Properties),ground(Markers).

test(shared_diagnostic_recorder_omits_empty_properties_not_empty_messages) :-
    diagnostic_metadata([],[],[]),
    diagnostic_metadata([diagnostic(notices,"")],
                        [notices-[""]],[note("")]).

test(shared_diagnostic_recorder_rejects_malformed_events,
     [throws(error(type_error(diagnostic_event,not_an_event),_))]) :-
    diagnostic_metadata([not_an_event],_,_).

test(first_class_diagnostics_remain_available_without_mapping_rows) :-
    with_source("(and (genFormat isa \"~a\" (1)) (ordinary (1 2)))",
                krf,iso_latin_1,check_independent_diagnostics).
check_independent_diagnostics(Path) :-
    read_source(Path,[diagnostics(false)],
                [assertion(_,[],_,_,Properties,_)],Info),
    selectchk(mapping_rows-Markers,Properties,Independent),
    Independent=[notices-[Notice],warnings-[Warning]],
    Markers==[note(Notice),warnings(Warning)],
    Info.warnings=[warning(Path,_,_,Warning)],
    string(Notice),string(Warning),ground(Independent).

test(mapping_ids_and_repeated_notes_preserve_order_without_warning_severity) :-
    Text="(and (genFormat instance \"~a\" (1)) (genFormat instance \"~a\" (1)))",
    with_source(Text,kif,iso_latin_1,check_repeated_note_rows).
check_repeated_note_rows(Path) :-
    read_source(Path,[diagnostics(false),sumo_mappings(true)],
                [assertion(_,[],_,_,Properties,_)],Info),
    Properties=[mapping_rows-['and-and','instance-isa','instance-isa',note(N1),note(N2)],
                notices-[N1,N2]],
    string(N1),string(N2),Info.warnings==[].

test(fatal_source_error_does_not_return_manufactured_error_assertion) :-
    catch(parse_text("(genFormat isa \"~a\" (1))\n(unclosed",krf,
                     [diagnostics(false)],Assertions),
          error(source_error('<text>',2,1,_),_),Caught=true),
    Caught==true,var(Assertions).

test(mapping_anomaly_warning_row_matches_source_diagnostic_exactly) :-
    with_source(";; logos: sumo-mappings\n(part (instance a Entity))",
                kif,iso_latin_1,check_mapping_anomaly_row).
check_mapping_anomaly_row(Path) :-
    read_source(Path,[diagnostics(false)],
                [assertion(x_part(x_isa(x_a,x_Thing)),[],_,2,Properties,_)],Info),
    Info.warnings=[warning(Path,2,1,Message)],
    Properties==[mapping_rows-['instance-isa','entity-thing',warnings(Message)],warnings-[Message]].

test(mapping_id_order_and_multiplicity_are_preserved_before_warning_rows) :-
    Text="(and (instance a Entity) (ordinary (1 2)) (instance b Entity))",
    one(Text,kif,[sumo_mappings(true)],_,[],_,Properties,_),
    Properties=[mapping_rows-['and-and','instance-isa','entity-thing',
                              'instance-isa','entity-thing',warnings(Message)],warnings-[Message]],
    string(Message).

test(repeated_warning_rows_keep_occurrence_multiplicity) :-
    one("(and (ordinary (1 2)) (ordinary (1 2)))",krf,[],_,[],_,Properties,_),
    Properties=[mapping_rows-[warnings(First),warnings(Second)],warnings-[First,Second]],
    First==Second,string(First),ground(Properties).

test(valid_nil_and_compound_microtheory_do_not_gain_warning_rows) :-
    Text="(in-microtheory (MtFn Root))\n(genFormat isa \"~a ~a\" NIL)\n(p a)",
    parse_text(Text,krf,[diagnostics(false),strict_mappings(true)],
               [assertion(x_genFormat(x_isa,"~a ~a",'NIL'),[],x_MtFn(x_Root),2,P1,_),
                assertion(x_p(x_a),[],x_MtFn(x_Root),3,P2,_)]),
    P1==[mapping_rows-[]],P2==[mapping_rows-[]].

test(metta_data_no_mapping_or_rules) :-
    one("(<=== (instance $x Class) (=> $x Entity))",metta,[sumo_mappings(true)],
        'x_<==='(x_instance(X,x_Class),'x_=>'(Y,x_Entity)),["$x"],_,Props,_),
    X==Y,Props==[mapping_rows-[]].

test(metta_inert_execution_and_unicode) :-
    one("!(danger $x \"λ 😀\\nnext\")",metta,[],
        metta_exec(x_danger(X,"λ 😀\nnext")),["$x"],_,_,_),var(X).

test(metta_lists_and_empty_lists) :-
    parse_text("([] a (b c)) ([]) (f ([] $x $x))",metta,[],
        [assertion(metta_value([x_a,x_b(x_c)]),[],_,_,_,_),
         assertion(metta_value([]),[],_,_,_,_),
         assertion(x_f([X,Y]),["$x"],_,_,_,_)]),X==Y.

test(metta_dict_and_sharing) :-
    one("((b $x) (a $x))",metta,[],
        metta_value(metta_map{x_a:X,x_b:Y}),["$x"],_,_,_),X==Y.

test(metta_explicit_list_precedes_dict) :-
    one("([] (a b) (c d))",metta,[],metta_value([x_a(x_b),x_c(x_d)]),[],_,_,_).

test(metta_duplicate_key,[throws(error(source_error('<text>',1,1,_),_))]) :-
    parse_text("((a b) (a c))",metta,[],_).

test(metta_variable_key,[throws(error(source_error('<text>',1,_,_),_))]) :-
    parse_text("(($x b) (a c))",metta,[],_).

test(metta_string_key,[throws(error(source_error('<text>',1,_,_),_))]) :-
    parse_text("((\"a\" b) (c d))",metta,[],_).

test(metta_unsupported_big_integer_key,
     [throws(error(source_error('<text>',1,1,_),_))]) :-
    parse_text("((999999999999999999999999999999999999 a) (2 b))",metta,[],_).

test(metta_standalones_type_and_equation) :-
    parse_text("42 \"text\" Atom (: f Type) (= (f $x) $x)",metta,[],
        [assertion(metta_value(42),[],_,_,_,_),
         assertion(metta_value("text"),[],_,_,_,_),
         assertion(metta_value(x_Atom),[],_,_,_,_),
         assertion('x_:'(x_f,x_Type),[],_,_,_,_),
         assertion('x_metta='(x_f(X),Y),["$x"],_,_,_,_)]),X==Y.

test(equality_is_dialect_specific_data) :-
    forall(member(Dialect,[kif,krf]),
      (one("(= ?X ?X)",Dialect,[],x_equals(X,Y),["?X"],_,[mapping_rows-[]],_),
       X==Y)),
    one("(= $x $x)",metta,[],'x_metta='(A,B),["$x"],_,[mapping_rows-[]],_),
    A==B,
    normalize_query("(= ?X ?X)",x_equals(P,Q),["?X"]),P==Q.

test(occurrence_identity_ignores_layout_comments) :-
    one("(p ?X \"a\\nb\")",kif,[],_,_,_,_,K1),
    one("; comment\n ( p\n ?X   \"a\\nb\" ) ; another",kif,[],_,_,_,_,K2),
    K1==K2.

test(duplicate_occurrences_are_not_deduplicated) :-
    parse_text("(p a) (p a)",kif,[],[assertion(_,[],_,_,_,K),assertion(_,[],_,_,_,K2)]),
    K==K2.

test(repeated_reads_have_independent_variables) :-
    one("(p ?X)",kif,[],x_p(X),_,_,_,_),
    one("(p ?X)",kif,[],x_p(Y),_,_,_,_), X\==Y.

test(query_has_no_mapping_or_execution) :-
    normalize_query("(instance ?X Class)",x_instance(X,x_Class),["?X"]),var(X),
    normalize_query("(<=== (p ?X) (q ?X))",Term,["?X"]),
    Term='x_<==='(x_p(Y),x_q(Z)),Y==Z.

test(query_rejects_multiple,[throws(error(source_error('<query>',1,_,_),_))]) :-
    normalize_query("(p a) (q b)",_,_).

test(quoted_escaped_symbols_and_strings) :-
    one("(p |a b| \\?X \"a\\\"b\\\\c\\u03bb\")",kif,[],
        x_p('x_a b','x_?X',"a\"b\\cλ"),[],_,_,_).

test(accurate_multiline_location,[throws(error(source_error('<text>',3,6,_),_))]) :-
    parse_text(";first\n(p a)\n  (q \"unterminated",kif,[],_).

test(block_comments_and_locations) :-
    parse_text("#| outer #| inner |# done |#\n(p a)",kif,[],
               [assertion(x_p(x_a),[],_,2,_,_)]).

test(unbalanced,[throws(error(source_error('<text>',1,1,_),_))]) :-
    parse_text("(p a",kif,[],_).

test(default_source_encoding_line_count_and_info) :-
    with_source("(p \"café\")\n",kif,iso_latin_1,check_latin1_source).
check_latin1_source(Path) :-
    read_source(Path,[diagnostics(false)],[assertion(x_p("café"),[],_,1,_,_)],Info),
    Info.lineCount==1,Info.dialect==kif,ground(Info).

test(explicit_utf8_source) :-
    with_source("(p \"λ\")",kif,utf8,check_utf8_source).
check_utf8_source(Path) :-
    read_source(Path,[encoding(utf8),diagnostics(false)],
                [assertion(x_p("λ"),[],_,1,_,_)],Info),Info.lineCount==1.

test(invalid_utf8_rejected_without_lossy_replacement,
     [throws(error(source_error(_,1,5,_),_))]) :-
    fixture_path(metta,Path),
    setup_call_cleanup(
        setup_call_cleanup(open(Path,write,S,[type(binary)]),
                           maplist(put_byte(S),[40,112,32,34,255,34,41]),close(S)),
        read_source(Path,[],_,_),
        delete_file(Path)).

test(utf8_overlong_and_surrogate_rejected) :-
    forall(member(Bytes,[[192,128],[237,160,128],[244,144,128,128],[226,128]]),
           invalid_utf8_bytes(Bytes)).
invalid_utf8_bytes(Bytes) :-
    fixture_path(metta,Path),
    setup_call_cleanup(
        setup_call_cleanup(open(Path,write,S,[type(binary)]),
                           maplist(put_byte(S),Bytes),close(S)),
        ( catch(read_source(Path,[],_,_),error(source_error(_,1,1,_),_),Caught=true),
          Caught==true ),
        delete_file(Path)).

test(empty_file_line_count) :-
    with_source("",krf,iso_latin_1,check_empty_source).
check_empty_source(Path) :-
    read_source(Path,[],[],Info),Info.lineCount==0,Info.mappingHash==none.

test(warnings_retained_and_source_located) :-
    with_source(";; logos: sumo-mappings\n(part a)\n(p b)",kif,iso_latin_1,check_warnings).
check_warnings(Path) :-
    read_source(Path,[diagnostics(false)],Assertions,Info),
    length(Assertions,2), Info.warnings=[warning(Path,2,1,Message)], string(Message).

test(warnings_are_immediate_and_duplicate_output_is_bounded) :-
    length(Forms,20),maplist(=("(part a)"),Forms),
    atomics_to_string([";; logos: sumo-mappings"|Forms],"\n",Text),
    with_source(Text,kif,iso_latin_1,check_warning_budget).
check_warning_budget(Path) :-
    capture_stderr(read_source(Path,[],Assertions,Info),Output),
    length(Assertions,20),length(Info.warnings,20),
    split_string(Output,"\n","\r",Lines),exclude(=(""),Lines,Nonempty),
    length(Nonempty,4),
    once(sub_string(Output,_,_,_,"Further part-parts mismatches suppressed")).

test(warning_is_visible_before_a_later_source_error) :-
    capture_stderr(
        catch(parse_text(";; logos: sumo-mappings\n(part a)\n(unclosed",kif,[],_),
              error(source_error(_,3,1,_),_),format(user_error,'LATER ERROR~n',[])),
        Output),
    once(sub_string(Output,WarningStart,_,_,"WARNING")),
    once(sub_string(Output,ErrorStart,_,_,"LATER ERROR")),
    WarningStart<ErrorStart.

test(trusted_diagnostic_handler_receives_ground_warning) :-
    State=warnings([]),
    parse_text(";; logos: sumo-mappings\n(part a)",kif,
               [diagnostic_handler(plunit_logos_reader:remember_warning(State))],_),
    arg(1,State,[Warning]),
    Warning=warning('<text>',2,1,Message),string(Message),ground(Warning).

test(disabled_diagnostics_does_not_invoke_handler) :-
    State=warnings([]),
    parse_text(";; logos: sumo-mappings\n(part a)",kif,
               [diagnostics(false),
                diagnostic_handler(plunit_logos_reader:remember_warning(State))],_),
    arg(1,State,[]).

test(warning_observer_sees_every_warning_despite_disabled_diagnostics) :-
    length(Forms,20),maplist(=("(part a)"),Forms),
    atomics_to_string([";; logos: sumo-mappings"|Forms],"\n",Text),
    State=warnings([]),
    parse_text(Text,kif,[diagnostics(false),
                        warning_observer(plunit_logos_reader:remember_warning(State))],_),
    arg(1,State,Warnings),length(Warnings,20),ground(Warnings).

test(warning_observer_preserves_count_before_later_source_failure) :-
    State=warnings([]),
    catch(parse_text(";; logos: sumo-mappings\n(part a)\n(unclosed",kif,
                     [diagnostics(false),
                      warning_observer(plunit_logos_reader:remember_warning(State))],_),
          error(source_error('<text>',3,1,_),_),Caught=true),
    Caught==true,arg(1,State,[warning('<text>',2,1,_)]).

test(warning_observer_precedes_display_handler) :-
    State=warnings([]),
    parse_text(";; logos: sumo-mappings\n(part a)",kif,
               [warning_observer(plunit_logos_reader:remember_warning_event(State,observer)),
                diagnostic_handler(plunit_logos_reader:remember_warning_event(State,display))],_),
    arg(1,State,[display-Warning,observer-Same]),Warning==Same,ground(Warning).

remember_warning_event(State,Kind,Warning) :-
    remember_warning(State,Kind-Warning).

remember_warning(State,Warning) :-
    arg(1,State,Before),nb_setarg(1,State,[Warning|Before]).

test(source_progress_callback_uses_monotonic_byte_counts) :-
    length(Forms,260),maplist(=("(p a)"),Forms),
    atomics_to_string(Forms,"\n",Text),
    with_source(Text,kif,iso_latin_1,check_progress).

check_progress(Path) :-
    State=events([]),
    read_source(Path,[diagnostics(false),
                     progress_callback(plunit_logos_reader:remember_progress(State))],
                Assertions,_),
    length(Assertions,260),
    arg(1,State,Reversed),reverse(Reversed,Events),
    size_file(Path,Total),
    Events=[0-Total|_],last(Events,Total-Total),
    length(Events,Count),Count>=3,
    forall(member(Bytes-ReportedTotal,Events),
           (ReportedTotal==Total,Bytes>=0,Bytes=<Total)),
    forall(append(_,[A-_,B-_|_],Events),A=<B).

remember_progress(State,Bytes,Total) :-
    arg(1,State,Before),
    nb_setarg(1,State,[Bytes-Total|Before]),
    ( Before==[] -> sleep(0.21) ; true ).

capture_stderr(Goal,Text) :-
    current_input(In),current_output(Out),stream_property(Err,alias(user_error)),
    setup_call_cleanup(
        new_memory_file(Memory),
        ( setup_call_cleanup(
              open_memory_file(Memory,write,Capture,[encoding(utf8)]),
              setup_call_cleanup(set_prolog_IO(In,Out,Capture),
                                 once(Goal),set_prolog_IO(In,Out,Err)),
              close(Capture)),
          memory_file_to_string(Memory,Text) ),
        free_memory_file(Memory)).

test(markdown_rejects_invalid_dsl,[throws(error(mapping_error(_),_))]) :-
    table_text(["| bad | `foo` | `#$bar` | `shell('echo bad')` | predicate | close | high | guess | Inert. |"],Text),
    validate_mapping_text(Text,_,_).

test(markdown_rejects_invalid_position,[throws(error(mapping_error(_),_))]) :-
    table_text(["| bad | `foo` | `#$bar` | `template(bar,bar,2,[arg(3)])` | predicate | close | high | guess | Inert. |"],Text),
    validate_mapping_text(Text,_,_).

test(markdown_rejects_duplicate_ids,[throws(error(mapping_error(_),_))]) :-
    table_text(["| same | `foo` | `#$bar` | `rename(bar,2)` | predicate | close | high | guess | Inert. |",
                "| same | `baz` | `#$qux` | `rename(qux,2)` | predicate | close | high | guess | Inert. |"],Text),
    validate_mapping_text(Text,_,_).

test(markdown_rejects_ambiguous_sources,[throws(error(mapping_error(_),_))]) :-
    table_text(["| one | `foo` | `#$bar` | `rename(bar,2)` | predicate | close | high | guess | Inert. |",
                "| two | `foo` | `#$qux` | `rename(qux,3)` | predicate | close | high | guess | Inert. |"],Text),
    validate_mapping_text(Text,_,_).

test(markdown_rejects_target_collisions,[throws(error(mapping_error(_),_))]) :-
    table_text(["| one | `foo` | `#$bar` | `rename(bar,2)` | predicate | close | high | guess | Inert. |",
                "| two | `baz` | `#$bar` | `rename(bar,3)` | predicate | close | high | guess | Inert. |"],Text),
    validate_mapping_text(Text,_,_).

test(markdown_rejects_conversion_chains,[throws(error(mapping_error(_),_))]) :-
    table_text(["| one | `foo` | `#$bar` | `rename(bar,2)` | predicate | close | high | guess | Inert. |",
                "| two | `bar` | `#$baz` | `rename(baz,2)` | predicate | close | high | guess | Inert. |"],Text),
    validate_mapping_text(Text,_,_).

test(markdown_typed_fixed_insertions) :-
    table_text(["| one | `foo` | `#$bar` | `template(bar,bar,1,[arg(1),fixed(atom('Thing')),fixed(number(7)),fixed(string(\"ok\"))])` | predicate | close | high | guess | Inert. |"],Text),
    validate_mapping_text(Text,_,Rules),
    AST=n(1,1,list([n(1,2,sym(foo)),n(1,6,var("?X",ordinary))])),
    transform_ast(AST,mappings(sumo,Rules),'<text>',[],Out,[one],[]),
    kb_reader:normalize_expression(Out,kif,'<text>',x_bar(X,x_Thing,7,"ok"),["?X"]),var(X).

table_text(Rows,Text) :-
    Header="| ID | SUMO | CycL | Conversion | Category | Equivalence | Confidence | Basis | Notes / provenance |",
    Separator="|---|---|---|---|---|---|---|---|---|",
    atomics_to_string([Header,Separator|Rows],"\n",Text).

test(real_original_tinykb_readonly) :-
    test_directory(Dir),
    directory_file_path(Dir,'..\\..\\..\\KBs\\tinyKB.kif',Relative),
    absolute_file_name(Relative,Path),
    crypto_file_hash(Path,Before,[algorithm(sha256)]),
    get_time(Start),
    read_source(Path,[diagnostics(false)],Assertions,Info),
    get_time(End),
    crypto_file_hash(Path,After,[algorithm(sha256)]),
    Before==After,
    length(Assertions,3662),Info.lineCount==10797,
    Info.warnings==[],ground(Info),
    Assertions=[assertion(x_isa(x_isa,x_BinaryPredicate),[],x_tinyKB,90,_,_)|_],
    Seconds is End-Start,
    format(user_error,'~nOriginal tinyKB: 3662 assertions, 10797 lines, ~3fs, SHA-256 unchanged.~n',[Seconds]).

test(real_freeciv_compound_mt_regression_all_fifteen_sources_readonly) :-
    test_directory(Directory),
    directory_file_path(Directory,'..\\..\\..\\KBs\\freecivai\\flat-files',RelativeRoot),
    absolute_file_name(RelativeRoot,Root,[file_type(directory),access(read)]),
    Targets=['fc-interpretation-queries.krf'-11,'fc-microtheories.krf'-28,
             'freeciv-semtranses.krf'-236,
             'learned-knowledge\\goal-network.krf'-500,
             'learned-knowledge\\capability-roles.krf'-271,
             'learned-knowledge\\decision-tasks.krf'-23,
             'learned-knowledge\\learned-action-model.krf'-4,
             'learned-knowledge\\learned-attack-precond.krf'-13,
             'learned-knowledge\\learned-knowledge.krf'-68,
             'learned-knowledge\\learned-terrain-improvement.krf'-9,
             'learned-knowledge\\planning-graph.krf'-382,
             'learned-knowledge\\strategic-knowledge.krf'-6,
             'learned-knowledge\\type-level-pmodel.krf'-305,
             'learned-knowledge\\type-level-qmodel.krf'-121,
             'learned-knowledge\\type-level-strategies.krf'-33],
    forall(member(Relative-Count,Targets),
           verify_original_freeciv(Root,Relative,Count)).

verify_original_freeciv(Root,Relative,Count) :-
    directory_file_path(Root,Relative,Path),
    crypto_file_hash(Path,Before,[algorithm(sha256)]),
    read_source(Path,[diagnostics(false),strict_mappings(true),sumo_mappings(true)],
                Assertions,Info),
    crypto_file_hash(Path,After,[algorithm(sha256)]),
    Before==After,length(Assertions,Count),
    Info.dialect==krf,Info.mappingHash==none,Info.warnings==[],
    once((member(assertion(_,_,Compound,_,_,_),Assertions),compound(Compound))),
    forall(member(assertion(_,_,Mt,_,Properties,_),Assertions),
           ( ground(Mt),\+is_list(Mt),\+is_dict(Mt),
             memberchk(mapping_rows-[],Properties),
             \+memberchk(notices-_,Properties),\+memberchk(warnings-_,Properties) )).

:- end_tests(logos_reader).
