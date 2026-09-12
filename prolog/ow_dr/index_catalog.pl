:- use_module(kb_catalog_index).
:- use_module(kb_catalog_query).
:- use_module(kb_catalog_directory).
:- use_module(kb_catalog_search).
:- initialization(main,main).
main(['--'|Args]) :- !,main(Args).
main(['--search-directory']) :- !,
    catch((build_search_directory(Report)->true;throw(error(catalog_search_failed,_))),
      Error,(print_message(error,Error),halt(1))),
    write_term(Report,[quoted(true)]),nl,halt.
main(['--update'|Args]) :- !,
    (Args=['--defer-providers'|Paths]->Providers=false;Providers=true,Paths=Args),
    catch((maintain_query_catalog(Paths,Providers,Report)->true;
             throw(error(catalog_maintenance_failed,_))),
      Error,(print_message(error,Error),halt(1))),
    write_term(Report,[quoted(true)]),nl,
    (Report.query.coverage.complete==true->halt;halt(1)).
main(Args) :-
    (Args=['--directory'];Args=['--','--directory']),!,
    catch((build_catalog_directory(Report)->true;throw(error(catalog_directory_failed,_))),
      Error,(print_message(error,Error),halt(1))),
    write_term(Report,[quoted(true)]),nl,halt.
main(Args) :-
    (Args=['--query','--defer-providers'];Args=['--','--query','--defer-providers']),!,
    catch((build_query_catalog(false,Report)->true;throw(error(catalog_projection_failed,_))),
      Error,(print_message(error,Error),halt(1))),
    write_term(Report,[quoted(true)]),nl,
    (Report.coverage.complete==true->halt;halt(1)).
main(Args) :-
    (Args=['--summary'];Args=['--','--summary']),!,
    catch((rebuild_catalog_summary(Report)->true;throw(error(catalog_summary_failed,_))),
      Error,(print_message(error,Error),halt(1))),
    write_term(Report,[quoted(true)]),nl,halt.
main(Args) :-
    Args=['--worker',Input,Output,Progress],!,
    catch((catalog_worker(Input,Output,Progress)->true;throw(error(catalog_worker_failed,_))),
      Error,(print_message(error,Error),halt(1))),halt.
main(Args) :-
    (Args=['--query'];Args=['--','--query']),!,
    catch((build_query_catalog(Report)->true;throw(error(catalog_projection_failed,_))),
      Error,(print_message(error,Error),halt(1))),
    write_term(Report,[quoted(true)]),nl,
    (Report.coverage.complete==true->halt;halt(1)).
main(Args) :-
    (Args=[];Args=['--all'];Args=['--','--all']),!,
    catch((refresh_catalog(all,Report)->true;throw(error(catalog_refresh_failed,_))),
      Error,(print_message(error,Error),halt(1))),
    write_term(Report,[quoted(true)]),nl,
    (Report.complete==true->halt;halt(1)).
main(_) :- format(user_error,'Usage: swipl index_catalog.pl -- --all | --query [--defer-providers] | --update [--defer-providers] [FILES...] | --summary | --directory | --search-directory~n',[]),halt(2).
