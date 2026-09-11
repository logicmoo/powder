:- ensure_loaded(test_statistics).
:- begin_tests(ow_selected_statistics).
:- use_module('../kb_statistics').
:- use_module('../kb_paths').

setup_selected :- plunit_ow_statistics:setup_statistics.
cleanup_selected :- plunit_ow_statistics:cleanup_statistics.
source(Name,File,Data) :-
    plunit_ow_statistics:source(Name,File),plunit_ow_statistics:snapshot(File,Base),
    file_name_extension(_,Extension,Name),atom_string(Extension,Dialect),
    Data=Base.put(source,Base.source.put(dialect,Dialect)),
    plunit_ow_statistics:save_snapshot(File,Data).

test(empty_selection_is_known_zero_and_scope_is_not_a_path,
     [setup(setup_selected),cleanup(cleanup_selected)]) :-
    kb_store:generation(Before),
    selected_statistics([],'not/a/real/path:../local-files','',Reply),
    assertion(Reply.kind==selected_files),assertion(Reply.path==null),
    assertion(Reply.scope=='not/a/real/path:../local-files'),
    assertion(Reply.state==snapshot),assertion(Reply.done==true),
    assertion(Reply.coverage.totalFiles==0),assertion(Reply.coverage.processedFiles==0),
    assertion(Reply.counts.assertions==0),assertion(Reply.counts.contentMTs==0),
    assertion(Reply.counts.referencedMTs==0),assertion(Reply.counts.predicateFunctions==0),
    atom_length(Reply.revision,64),atom_length(Reply.selectionRevision,64),
    selected_statistics([],'not/a/real/path:../local-files',Reply.token,Cached),
    assertion(Cached.token==Reply.token),assertion(Cached.revision==Reply.revision),
    kb_store:generation(After),assertion(After==Before).

test(selected_totals_deduplicate_files_and_union_symbols_and_mts,
     [setup(setup_selected),cleanup(cleanup_selected)]) :-
    source('group/a.kif',A,_),source('group/b.krf',_,_),
    source('group/unchecked.kif',Other,Base),
    Changed=Base.put(microtheories,[_{key:"x_UnselectedMt",assertionCount:3,predicates:[
      _{name:"x_unselected",arity:2,headOccurrenceCount:3,declarationReferenceCount:0}]}]),
    plunit_ow_statistics:save_snapshot(Other,Changed),
    atom_concat(A,'.inventory.json',Inventory),read_file_to_string(Inventory,Before,[]),
    selected_statistics(["KBs/group/b.krf","KBs/group/a.kif","KBs/group/a.kif"],'KBs/group','',Selected),
    assertion(Selected.path==null),assertion(Selected.coverage.totalFiles==2),
    assertion(Selected.counts.assertions==6),assertion(Selected.counts.contentMTs==1),
    assertion(Selected.counts.referencedMTs==2),assertion(Selected.counts.predicateFunctions==2),
    selected_statistics(['KBs/group/a.kif','KBs/group/b.krf'],'KBs/group','',Warm),
    assertion(Warm.selectionRevision==Selected.selectionRevision),assertion(Warm.token==Selected.token),
    directory_statistics('KBs/group','',All),
    assertion(All.counts.assertions==9),assertion(All.counts.contentMTs==2),
    assertion(All.counts.predicateFunctions==3),
    read_file_to_string(Inventory,After,[]),assertion(After==Before).

test(selected_missing_and_stale_coverage_is_not_zero_or_fresh,
     [setup(setup_selected),cleanup(cleanup_selected)]) :-
    plunit_ow_statistics:source('missing.krf',_),
    selected_statistics(['KBs/missing.krf'],local,'',Missing),
    assertion(Missing.state==partial),assertion(Missing.counts.assertions==null),
    assertion(Missing.counts.contentMTs==null),assertion(Missing.coverage.missingFiles==1),
    source('stale.kif',Stale,Data),
    plunit_ow_statistics:save_snapshot(Stale,Data.put(_{stale:true,staleReason:"Context changed."})),
    selected_statistics(['KBs/stale.kif','KBs/missing.krf'],local,'',Mixed),
    assertion(Mixed.state==partial),assertion(Mixed.coverage.staleFiles==1),
    assertion(Mixed.coverage.missingFiles==1),assertion(Mixed.counts.assertions==3).

test(cursors_are_bound_to_the_scope_and_exact_selected_set,
     [setup(setup_selected),cleanup(cleanup_selected)]) :-
    source('group/a.kif',_,_),
    selected_statistics(['KBs/group/a.kif'],local,'',Reply),
    catch(selected_statistics(['KBs/group/a.kif'],subdirectories,Reply.token,_),WrongScope,true),
    assertion(nonvar(WrongScope)),
    assertion(WrongScope=error(domain_error(selected_statistics_cursor,_),_)),
    catch(selected_statistics([],local,Reply.token,_),WrongSet,true),
    assertion(nonvar(WrongSet)),
    assertion(WrongSet=error(domain_error(selected_statistics_cursor,_),_)),
    catch(directory_statistics('KBs/group',Reply.token,_),WrongKind,true),
    assertion(nonvar(WrongKind)),
    assertion(WrongKind=error(domain_error(directory_statistics_cursor,_),_)).

test(selected_batches_recheck_only_selected_identities_and_keep_revisions,
     [setup(setup_selected),cleanup(cleanup_selected)]) :-
    findall(Path,(between(1,17,N),format(atom(Name),'batch/f~|~`0t~d~2+.kif',[N]),
      source(Name,_,_),atom_concat('KBs/',Name,Path)),Paths),
    selected_statistics(Paths,local,'',First),
    assertion(First.done==false),assertion(First.coverage.processedFiles==16),
    selected_statistics(Paths,local,First.token,Final),
    assertion(Final.done==true),assertion(Final.state==snapshot),
    assertion(Final.counts.assertions==51),assertion(Final.counts.contentMTs==1),
    assertion(Final.counts.predicateFunctions==2),assertion(Final.revision==First.revision),
    source('batch/not-selected.kif',_,_),
    selected_statistics(Paths,local,'',Reused),assertion(Reused.token==Final.token),
    selected_statistics(Paths,other_group,'',InProgress),
    kb_root(Root),directory_file_path(Root,'batch/f01.kif',Changed),
    plunit_ow_statistics:write_text(Changed,"(fixture changed after its selected batch was read)\n"),
    selected_statistics(Paths,other_group,InProgress.token,Interrupted),
    assertion(Interrupted.done==true),assertion(Interrupted.coverage.manifestChanged==true),
    assertion(Interrupted.state==partial),assertion(Interrupted.revision==InProgress.revision),
    selected_statistics(Paths,local,'',Updated),
    assertion(Updated.selectionRevision==Final.selectionRevision),assertion(Updated.revision\==Final.revision).

test(selected_file_paths_reject_metadata_directories_traversal_and_virtual_keys) :-
    forall(member(Path,['KBs','KBs/group','KBs/../private.krf','KBs/group/a.kif.inventory.json',
      'source-group:local-files:KBs%2Fgroup']),
      (catch(selected_statistics([Path],scope,'',_),Error,true),
       assertion(nonvar(Error)),
       assertion(Error=error(permission_error(access,selected_source,_),_)))).

test(selected_request_size_is_bounded_before_authorization,
     [throws(error(domain_error(selected_statistics_limit(4096),4097),_))]) :-
    length(Paths,4097),maplist(=('KBs/not-opened.kif'),Paths),
    selected_statistics(Paths,scope,'',_).

:- end_tests(ow_selected_statistics).
