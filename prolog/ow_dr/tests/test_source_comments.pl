:- begin_tests(source_comments).
:- use_module('../kb_reader').
:- use_module('../kb_compile').
:- use_module('../kb_cache').
:- use_module('../kb_runtime',[]).
:- use_module(library(filesex)).

fixture(Text,Extension,D,F) :-
    tmp_file(powder_comments,D),make_directory(D),
    file_name_extension(source,Extension,Name),directory_file_path(D,Name,F),
    write_source(F,Text).
write_source(F,Text) :-
    setup_call_cleanup(open(F,write,S,[encoding(utf8)]),format(S,'~s',[Text]),close(S)).
comments(assertion(_,_,_,_,Props,_),Comments) :- memberchk(comments-Comments,Props).

test(leading_inline_and_same_line_trailing_comments_have_distinct_owners,
     [setup(fixture("; first assertion\n(p ?X\n ; inside\n ?X) ; trailing first\n; second\n(q a)\n; file footer\n",krf,D,F)),
      cleanup(delete_directory_and_contents(D))]) :-
    read_source(F,[],[First,Second],Info),
    First=assertion(x_p(X,Y),["?X"],_,2,_,_),assertion(X==Y),
    comments(First,[comment(1,1,"; first assertion"),comment(3,2,"; inside"),
                    comment(4,6,"; trailing first")]),
    First=assertion(_,_,_,_,Properties,_),
    memberchk(comment_association-proximity_guess(span(2,1,4,5)),Properties),
    comments(Second,[comment(5,1,"; second")]),
    assertion(Info.comments==[comment(7,1,"; file footer")]),
    assertion(\+kb_reader:collecting_comments(_,_)).

test(nested_block_comment_text_and_unicode_are_inert,
     [setup(fixture("#| outer\n #| inner |#\n end |#\n(= (f $x) $x) ; \u03bb\n",metta,D,F)),
      cleanup(delete_directory_and_contents(D))]) :-
    read_source(F,[],[A],_),
    A=assertion('x_metta='(x_f(X),Y),["$x"],_,4,_,_),assertion(X==Y),
    comments(A,[comment(1,1,"#| outer\n #| inner |#\n end |#"),comment(4,_,"; \u03bb")]).

test(comment_markers_in_strings_are_not_comments,
     [setup(fixture("(p \"; not a comment\" \"#| not a block |#\")\n",krf,D,F)),
      cleanup(delete_directory_and_contents(D))]) :-
    read_source(F,[],[assertion(x_p("; not a comment","#| not a block |#"),[],_,_,Props,_)],Info),
    assertion(\+memberchk(comments-_,Props)),assertion(Info.comments==[]).

test(directive_and_excluded_form_comments_do_not_leak_to_next_assertion,
     [setup(fixture("; context\n(in-microtheory TestMt)\n; excluded\n#+:absent (hidden a) ; excluded tail\n; visible\n(p a)\n",krf,D,F)),
      cleanup(delete_directory_and_contents(D))]) :-
    read_source(F,[],[A],Info),
    A=assertion(x_p(x_a),[],x_TestMt,6,_,_),
    comments(A,[comment(5,1,"; visible")]),
    assertion(length(Info.comments,3)).

test(comment_edits_preserve_ids_and_cache_metadata,
     [setup(fixture("; before\n(p ?X ?X)\n",krf,D,F)),
      cleanup((atom_concat(F,'.data',Data),kb_runtime:native_unload(Data),delete_directory_and_contents(D)))]) :-
    Options=[state_dir(D),progress(none),diagnostics(false)],
    compile_source(F,Options,Cold),read_cache(Cold.normalized,_,[record(Id,_,M1)]),
    memberchk(xc_comments(Id,[comment(1,1,"; before")]),M1),
    write_source(F,"; revised\n(p ?X ?X) ; trailing\n"),
    compile_source(F,Options,Warm),read_cache(Warm.normalized,_,[record(Id,Semantic,M2)]),
    Semantic=x_p(X,Y),assertion(X==Y),
    memberchk(xc_comments(Id,Comments),M2),
    assertion(Comments=[comment(1,1,"; revised"),comment(2,_,"; trailing")]),
    kb_runtime:native_load(Warm.normalized,comment_roundtrip),
    kb_runtime:module_metadata(comment_roundtrip,comments,Id,Comments),
    kb_runtime:native_unload(Warm.normalized).

test(error_cleanup_and_parallel_reads_are_stream_local,
     [setup(fixture("; broken\n(p",krf,D,F)),cleanup(delete_directory_and_contents(D))]) :-
    catch(read_source(F,[],_,_),error(source_error(_,_,_,_),_),true),
    assertion(\+kb_reader:collecting_comments(_,_)),
    write_source(F,"; first\n(p a)\n"),
    directory_file_path(D,'other.krf',Other),write_source(Other,"; second\n(q b)\n"),
    thread_self(Main),
    thread_create((read_source(F,[],[A],_),comments(A,C),thread_send_message(Main,first(C))),One,[]),
    thread_create((read_source(Other,[],[A],_),comments(A,C),thread_send_message(Main,second(C))),Two,[]),
    thread_join(One,true),thread_join(Two,true),
    thread_get_message(first([comment(1,1,"; first")])),
    thread_get_message(second([comment(1,1,"; second")])).

:- end_tests(source_comments).
