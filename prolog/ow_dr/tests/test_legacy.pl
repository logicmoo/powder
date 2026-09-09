:- begin_tests(legacy_metadata).

:- use_module('../kb_legacy').
:- use_module(library(readutil)).

:- prolog_load_context(directory,Directory), asserta(test_directory(Directory)).
:- dynamic executed_marker/0.

with_legacy(Text,Goal) :-
    test_directory(Directory),current_prolog_flag(pid,Pid),
    flag(legacy_fixture_number,N,N+1),
    format(atom(Name),'.legacy-fixture-~d-~d.pl',[Pid,N]),
    directory_file_path(Directory,Name,File),
    setup_call_cleanup(
        setup_call_cleanup(open(File,write,Stream,[encoding(utf8)]),
                           format(Stream,'~s',[Text]),close(Stream)),
        call(Goal,File),
        delete_file(File)).

records(Expected,File) :- read_legacy(File,Expected).
source_failure(Text,Line) :-
    with_legacy(Text,expect_source_failure(Line)).
expect_source_failure(Line,File) :-
    catch(read_legacy(File,_),error(source_error(File,Line,Column,Message),_),
          Caught=error(Column,Message)),
    nonvar(Caught),Caught=error(Column,Message),integer(Column),Column>0,
    (atom(Message)->true;string(Message)).

test(preceding_comments_attach_to_following_assertion) :-
    with_legacy("% source_line(15).\n% mapping_rows([first,second,first]).\np(a).\nq(b).",
                records([legacy_record(p(a),[source_line-15,mapping_rows-[first,second,first]]),
                         legacy_record(q(b),[])])).

test(inline_comment_after_period_applies_to_next_assertion) :-
    with_legacy("p(a). % source_line(27).\nq(b).",
                records([legacy_record(p(a),[]),legacy_record(q(b),[source_line-27])])).

test(last_clause_list_attaches_to_preceding_assertion) :-
    with_legacy("p(a).\nlast_clause([kb_file_line(8),mapping_rows([one,two])]).\nq(b).",
                records([legacy_record(p(a),[source_line-8,mapping_rows-[one,two]]),
                         legacy_record(q(b),[])])).

test(last_clause_binary_attaches_to_preceding_assertion) :-
    with_legacy("p(a).\nlast_clause(kb_file_line,19).\nq(b).\nlast_clause(mapping_rows,[]).",
                records([legacy_record(p(a),[source_line-19]),
                         legacy_record(q(b),[mapping_rows-[]])])).

test(comments_do_not_attach_to_last_clause_annotation) :-
    with_legacy("p(a).\n% source_line(30).\nlast_clause(mapping_rows,[old]).\nq(b).",
                records([legacy_record(p(a),[mapping_rows-[old]]),
                         legacy_record(q(b),[source_line-30])])).

test(real_variable_sharing_in_guarded_clause) :-
    with_legacy("% source_line(9).\nx_p(X,Y,X) :- x_cid(a60a2418202240,X,Y).\nlast_clause(mapping_rows,[]).",
                check_shared_variables).
check_shared_variables(File) :-
    read_legacy(File,[legacy_record(Clause,[source_line-9,mapping_rows-[]])]),
    Clause=(x_p(X,Y,Z):-x_cid(a60a2418202240,A,B)),
    X==Z,X==A,Y==B,X\==Y,term_variables(Clause,Vars),length(Vars,2),
    maplist(var,Vars).

test(separate_clauses_have_fresh_variables) :-
    with_legacy("p(X,X). p(X,X).",check_fresh_variables).
check_fresh_variables(File) :-
    read_legacy(File,[legacy_record(p(X,A),[]),legacy_record(p(Y,B),[])]),
    X==A,Y==B,X\==Y,var(X),var(Y).

test(empty_file) :- with_legacy("",records([])).
test(ordinary_comments_ignored) :-
    with_legacy("% Ordinary prose and p(a) example.\n/* source_line(99). */\np(a).\n% tail prose",
                records([legacy_record(p(a),[])])).
test(explicit_end_of_file_atom_is_data) :-
    with_legacy("end_of_file. p(a).",
                records([legacy_record(end_of_file,[]),legacy_record(p(a),[])])).

test(unknown_explicit_metadata_remains_ground_inert_data) :-
    with_legacy("p(a).\nlast_clause('Cyc:Extra',(shell('never-run'),[a,1,\"text\"])).",
                records([legacy_record(p(a),['Cyc:Extra'-(shell('never-run'),[a,1,"text"])])])).

test(metadata_values_cannot_execute_directives) :-
    retractall(executed_marker),
    with_legacy("p(a). last_clause(custom,(:-assertz(plunit_legacy_metadata:executed_marker))).",
                check_inert_metadata),
    \+ executed_marker.
check_inert_metadata(File) :-
    read_legacy(File,[legacy_record(p(a),[custom-(:-assertz(plunit_legacy_metadata:executed_marker))])]).

test(malicious_directives_are_returned_never_executed) :-
    retractall(executed_marker),
    Text=":- assertz(plunit_legacy_metadata:executed_marker).\n\c
          :- initialization(assertz(plunit_legacy_metadata:executed_marker)).\n\c
          :- throw(should_never_run).\np(X,X).",
    with_legacy(Text,check_directives),
    \+ executed_marker.
check_directives(File) :-
    read_legacy(File,[legacy_record((:-assertz(_)),[]),
                      legacy_record((:-initialization(_)),[]),
                      legacy_record((:-throw(should_never_run)),[]),
                      legacy_record(p(X,Y),[])]),X==Y,var(X).

test(directives_do_not_steal_assertion_metadata) :-
    Text="% source_line(9).\n:- throw(never).\np(a).\n:- throw(never).\n\c
          last_clause(mapping_rows,[one]).\nq(b).",
    with_legacy(Text,records([legacy_record((:-throw(never)),[]),
                              legacy_record(p(a),[source_line-9,mapping_rows-[one]]),
                              legacy_record((:-throw(never)),[]),
                              legacy_record(q(b),[])])).

test(orphan_preceding_comment_at_eof) :- source_failure("% source_line(8).",1).
test(orphan_comment_after_last_assertion) :- source_failure("p(a).\n% mapping_rows([]).",2).
test(orphan_annotation_at_start) :- source_failure("last_clause(kb_file_line,8).",1).
test(orphan_annotation_after_directive) :-
    source_failure(":- throw(never).\nlast_clause(kb_file_line,8).",2).
test(orphan_forward_comment_before_annotation) :-
    source_failure("p(a).\n% source_line(9).\nlast_clause(mapping_rows,[]).",2).

test(malformed_comment_syntax) :- source_failure("% source_line(.\np(a).",1).
test(malformed_comment_arity) :- source_failure("% source_line(2,3).\np(a).",1).
test(malformed_comment_trailing_term) :- source_failure("% source_line(2). end_of_file.\np(a).",1).
test(malformed_comment_nonground) :- source_failure("% source_line(N).\np(a).",1).
test(malformed_line_value) :- source_failure("p(a).\nlast_clause(kb_file_line,0).",2).
test(malformed_mapping_rows) :- source_failure("% mapping_rows(not_a_list).\np(a).",1).
test(malformed_annotation_shape) :- source_failure("p(a).\nlast_clause(foo).",2).
test(malformed_annotation_item) :- source_failure("p(a).\nlast_clause([foo]).",2).
test(malformed_annotation_property_name) :- source_failure("p(a).\nlast_clause(P,7).",2).
test(malformed_annotation_nonground_value) :- source_failure("p(a).\nlast_clause(custom,X).",2).
test(conflicting_property_values) :-
    source_failure("% source_line(4).\np(a).\nlast_clause(kb_file_line,9).",3).
test(identical_property_values_coalesce) :-
    with_legacy("% source_line(4).\np(a).\nlast_clause(kb_file_line,4).",
                records([legacy_record(p(a),[source_line-4])])).
test(metadata_inside_clause_rejected) :-
    source_failure("p(\n% source_line(4).\na).",2).

test(source_syntax_errors_have_file_context) :- source_failure("p(a).\nq(.",2).
test(quasi_quotations_not_invoked) :- source_failure("{|danger||ignored|}.",1).
test(operator_directive_is_not_installed) :-
    source_failure(":- op(500,xfy,legacy_never_operator).\np legacy_never_operator q.",2),
    \+ current_op(_,_,kb_legacy:legacy_never_operator).

test(no_leakage_between_independent_reads_after_failure) :-
    source_failure("% source_line(99).",1),
    with_legacy("p(a).",records([legacy_record(p(a),[])])).
test(no_leakage_between_successful_reads) :-
    with_legacy("% source_line(9).\np(a).",records([legacy_record(p(a),[source_line-9])])),
    with_legacy("p(a).",records([legacy_record(p(a),[])])).

test(public_comment_helper_accepts_real_swi_comment_list) :-
    Text="% source_line(17).\n% mapping_rows([one,two,one]).\np(X,X).",
    setup_call_cleanup(open_string(Text,Stream),
                       read_term(Stream,Clause,[comments(Comments)]),close(Stream)),
    parse_metadata_comments(Comments,'<native>',Properties),
    Properties==[source_line-17,mapping_rows-[one,two,one]],ground(Properties),
    Clause=p(X,Y),X==Y,var(X).

test(public_comment_helper_accepts_real_read_clause_payload) :-
    Text="% source_line(23).\n% mapping_rows([native]).\nx_p(X) :- x_cid(a60a2418202240,X).",
    setup_call_cleanup(open_string(Text,Stream),
                       read_clause(Stream,Clause,[comments(Comments)]),close(Stream)),
    parse_metadata_comments(Comments,'<native>',Properties),
    Properties==[source_line-23,mapping_rows-[native]],
    Clause=(x_p(X):-x_cid(a60a2418202240,Y)),X==Y,var(X).

test(public_comment_helper_preserves_source_error_location,
     [throws(error(source_error('<native>',2,1,_),_))]) :-
    setup_call_cleanup(open_string("\n% source_line(0).\np(a).",Stream),
                       read_term(Stream,_,[comments(Comments)]),close(Stream)),
    parse_metadata_comments(Comments,'<native>',_).

test(public_annotation_helper_normalizes_and_preserves_unknown_data) :-
    legacy_annotation(last_clause([kb_file_line(19),mapping_rows([a,a]),
                                   custom((shell(never),[1,"two"]))]),Properties),
    Properties==[source_line-19,mapping_rows-[a,a],custom-(shell(never),[1,"two"])],
    ground(Properties).

test(public_annotation_helper_ignores_other_terms,[fail]) :-
    legacy_annotation(x_fact(x_a),_).

test(public_annotation_helper_rejects_malformed_data,
     [throws(error(legacy_metadata_error(_),_))]) :-
    legacy_annotation(last_clause(mapping_rows,not_a_list),_).

test(diagnostic_rows_remain_exact_inert_terms_in_both_public_helpers) :-
    Text="% mapping_rows(['row-one',note(\"List preserved\"),warnings(\"Check the predicate\"),errors(\"Source failed\")]).\np(a).",
    setup_call_cleanup(open_string(Text,Stream),
                       read_term(Stream,_,[comments(Comments)]),close(Stream)),
    Rows=['row-one',note("List preserved"),warnings("Check the predicate"),errors("Source failed")],
    Expected=[mapping_rows-Rows],
    parse_metadata_comments(Comments,'<native>',Properties),Properties==Expected,
    legacy_annotation(last_clause(mapping_rows,Rows),AnnotationProperties),
    AnnotationProperties==Expected,ground(AnnotationProperties).

test(first_class_diagnostic_properties_are_preserved_independently) :-
    Rows=[note("n"),warnings("w"),errors("e")],
    legacy_annotation(last_clause([notices(["n"]),warnings(["w"]),errors(["e"]),
                                   mapping_rows(Rows)]),Properties),
    Properties==[notices-["n"],warnings-["w"],errors-["e"],mapping_rows-Rows],
    selectchk(mapping_rows-_,Properties,Independent),
    Independent==[notices-["n"],warnings-["w"],errors-["e"]].

:- end_tests(legacy_metadata).
