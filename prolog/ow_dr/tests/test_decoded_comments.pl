:- begin_tests(decoded_comments).
:- use_module('../kb_terms').
:- use_module(library(http/json)).

test(comments_keep_locations_and_raw_text) :-
    Text=";  actual\tcolumns\n#| block\r\n continuation |# \u001b[31mred\u001b[0m literal\\n\\t",
    metadata_json([xc_comments(a1,[comment(7,3,Text)])],[Property]),
    assertion(Property.name==comments),
    Property.value=[Comment],
    assertion(Comment.line==7),assertion(Comment.column==3),assertion(Comment.text==Text),
    atom_json_dict(JSON,Property,[]),atom_json_dict(JSON,Roundtrip,[]),
    Roundtrip.value=[Saved],assertion(Saved.text==Text).

test(empty_comment_lists_are_retained) :-
    metadata_json([xc_comments(a1,[])],[Property]),
    assertion(Property.name==comments),assertion(Property.value==[]).

test(unknown_comment_entries_keep_existing_serialization) :-
    Raw=unknown_comment(7,3,"literal\\n"),
    json_value(Raw,Expected),
    metadata_json([xc_comments(a1,[Raw])],[Property]),
    assertion(Property.value==[Expected]).

test(malformed_locations_and_nontext_comments_are_not_guessed) :-
    forall(member(Raw,[comment(-1,3,"text"),comment(7,0,"text"),
                       comment(7,3,nested("text")),comment(7,3),comment("7",3,"text")]),
      (json_value(Raw,Expected),metadata_json([xc_comments(a1,[Raw])],[Property]),
       assertion(Property.value==[Expected]))).

test(unrelated_metadata_is_unchanged) :-
    Raw=comment(7,3,"literal\\n"),
    json_value(Raw,Expected),
    metadata_json([xc_custom(a1,Raw)],[Property]),
    assertion(Property.name==custom),assertion(Property.value==Expected).

:- end_tests(decoded_comments).
