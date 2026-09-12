:- use_module(kb_catalog_index).
:- initialization(main,main).
main(Args) :-
    (Args=[];Args=['--all'];Args=['--','--all']),!,
    catch(refresh_catalog(all,Report),Error,(print_message(error,Error),halt(1))),
    write_term(Report,[quoted(true)]),nl,
    (Report.complete==true->halt;halt(1)).
main(_) :- format(user_error,'Usage: swipl index_catalog.pl -- --all~n',[]),halt(2).
