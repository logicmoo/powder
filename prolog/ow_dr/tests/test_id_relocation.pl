:- begin_tests(id_relocation).
:- use_module('../kb_ids').
:- use_module(library(filesex)).

fixture(D,Old,New) :-
    tmp_file(powder_id_relocation,D),make_directory(D),
    directory_file_path(D,'old.kif',Old),directory_file_path(D,'new.kif',New).

test(relocation_preserves_occurrence_ids_and_duplicate_order,
     [setup(fixture(D,Old,New)),cleanup(delete_directory_and_contents(D))]) :-
    Assertions=[assertion(x_p,[],x_M,1,[],key),assertion(x_p,[],x_M,2,[],key)],
    assign_ids(Old,Assertions,[state_dir(D)],Ids),
    relocate_source_ids(Old,New,[state_dir(D)],relocated(2)),
    assign_ids(New,Assertions,[state_dir(D)],Ids),
    assign_ids(Old,Assertions,[state_dir(D)],Ids),
    relocate_source_ids(Old,New,[state_dir(D)],existing),
    Ids=[First,Second],assertion(First\==Second).

test(conflicting_destination_is_not_overwritten,
     [setup(fixture(D,Old,New)),cleanup(delete_directory_and_contents(D))]) :-
    A=[assertion(x_p,[],x_M,1,[],key)],
    assign_ids(Old,A,[state_dir(D)],Original),
    assign_ids(New,A,[state_dir(D)],Destination),
    assertion(Original\==Destination),
    catch(relocate_source_ids(Old,New,[state_dir(D)],_),Error,true),
    assertion(Error=error(conflicting_relocation_ledger(_,_),_)),
    assign_ids(Old,A,[state_dir(D)],Original),
    assign_ids(New,A,[state_dir(D)],Destination).

test(missing_ledger_is_explicit,
     [setup(fixture(D,Old,New)),cleanup(delete_directory_and_contents(D))]) :-
    relocate_source_ids(Old,New,[state_dir(D)],absent).

:- end_tests(id_relocation).
