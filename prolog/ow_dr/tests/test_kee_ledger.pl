:- ensure_loaded(test_kee).
:- begin_tests(kee_ledger).
:- use_module('../kb_kee_ledger',[]).
:- use_module('../kb_kee_todos',[]).
:- use_module('../kb_kee_todo_schema',[]).
:- use_module('../kb_kee_schema',[]).
:- use_module('../kb_kee_auth',[]).
:- use_module('../kb_cache',[]).
:- use_module(library(filesex)).
:- use_module(library(uuid)).
:- use_module(library(prolog_wrap)).
:- use_module(library(process)).
:- use_module(library(readutil)).
:- use_module(library(http/json)).
:- use_module(library(time)).

fixture(fixture(Root,Previous,T)) :-
    kb_paths:app_dir(App),directory_file_path(App,'tests/artifacts',Artifacts),
    uuid(Id),directory_file_path(Artifacts,Id,Root),make_directory_path(Root),
    (getenv('POWDER_KEE_STATE_DIR',Old)->Previous=some(Old);Previous=none),
    setenv('POWDER_KEE_STATE_DIR',Root),plunit_kee:host(H),kb_kee_auth:open_context(H,T).
cleanup(fixture(Root,Previous,T)) :-
    kb_kee_auth:close_context(T),
    (Previous=some(Old)->setenv('POWDER_KEE_STATE_DIR',Old);unsetenv('POWDER_KEE_STATE_DIR')),
    delete_directory_and_contents(Root).
data(json{title:"Example task",description:"Untrusted text; never a command",status:"open",priority:0,
    dependencies:[],evidence:[],acceptance:[],
    links:json{conversation:null,agent:null,changesets:[],assertions:[]}}).
revision(Text) :- kb_kee_ledger:snapshot(S),atom_string(S.revision,Text).
command(T,Operation,CallId,Input,Reply) :-
    kb_kee_todo_schema:input_spec(Operation,Spec),kb_kee_schema:validate(Spec,Input,Args),
    kb_kee_auth:principal(T,P),tool_name(Operation,Name),
    Request=json{tool:Name,schemaVersion:1,callId:CallId,arguments:Args},
    kb_kee_todos:run(Operation,T,P,Request,Args,Reply).
tool_name(todo_create,"kee_todo_create").
tool_name(todo_update,"kee_todo_update").
tool_name(todo_delete,"kee_todo_delete").
tool_name(todo_list,"kee_todo_list").
tool_name(todo_get,"kee_todo_get").
tool_name(ledger_audit,"kee_audit").
tool_name(ledger_undo,"kee_undo").
tool_name(ledger_redo,"kee_redo").
create(T,CallId,Input,Reply) :-
    revision(Rev),data(D),Input=json{revision:Rev,mt:"x_PublicMt",data:D},
    command(T,todo_create,CallId,Input,Reply).
current(Id,Resource) :- kb_kee_ledger:snapshot(S),kb_kee_ledger:resource(Id,S,Resource).
update_input(Id,NewData,Input) :-
    revision(Rev),current(Id,Resource),atom_string(Resource.revision,ResourceRevision),
    Input=json{revision:Rev,id:Id,resourceRevision:ResourceRevision,mt:"x_PublicMt",data:NewData}.
job_file(Root,Name,CallId,Input,Path) :-
    directory_file_path(Root,Name,Path),
    setup_call_cleanup(open(Path,write,S,[encoding(utf8)]),
      kb_cache:write_one_line(S,job(CallId,Input)),close(S)).
start_worker(Mode,Job,worker(Pid,In,Out,Err)) :-
    kb_paths:app_dir(App),directory_file_path(App,'tests/kee_ledger_worker.pl',Worker),
    current_prolog_flag(executable,Exe),
    process_create(Exe,['-q','-s',Worker,'--',Mode,Job],
      [process(Pid),stdin(pipe(In)),stdout(pipe(Out)),stderr(pipe(Err))]).
finish_worker(worker(Pid,In,Out,Err),Text) :-
    close(In),call_with_time_limit(15,read_string(Out,_,Text)),read_string(Err,_,Errors),
    close(Out),close(Err),process_wait(Pid,Status,[timeout(10)]),
    assertion(Errors==""),assertion(Status==exit(0)).

test(cold_read_creates_nothing,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(Root,_,_),kb_kee_ledger:snapshot(S),assertion(S.sequence==0),
    directory_files(Root,Names),assertion(Names==['.','..']).
test(automatic_commit_atomic_history_and_no_source_write,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(Root,_,T),directory_file_path(Root,'authored.krf',Source),
    plunit_catalog_index:write_text(Source,"(source original)\n"),kb_cache:file_digest(Source,Before),
    create(T,"c1",_,R),assertion(R.committed==true),assertion(R.replayed==false),
    current(R.result.id,Resource),assertion(Resource.data.priority==0),
    assertion(Resource.mt==x_PublicMt),kb_kee_ledger:snapshot(S),S.events=[Event],
    assertion(Event.actor.actor=="fixture-user"),assertion(Event.entries=[_]),
    Event.entries=[Entry],assertion(Entry.before==null),assertion(Entry.after==Resource),
    kb_cache:file_digest(Source,After),assertion(After==Before).
test(replay_before_stale_revision_and_changed_call_rejected,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(_,_,T),create(T,"same",Input,First),create(T,"other",_,_),
    command(T,todo_create,"same",Input,Replay),
    assertion(Replay.replayed==true),assertion(Replay.changeset==First.changeset),
    assertion(Replay.revision==First.revision),assertion(Replay.currentRevision\==First.revision),
    Changed=Input.put(mt,"x_OtherMt"),
    catch(command(T,todo_create,"same",Changed,_),error(kee(idempotency_conflict,_),_),Rejected=true),
    assertion(Rejected==true),kb_kee_ledger:snapshot(S),assertion(S.sequence==2).
test(stale_revision_leaves_all_state_unchanged,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(_,_,T),create(T,"first",Input,_),kb_kee_ledger:snapshot(Before),
    catch(command(T,todo_create,"stale",Input,_),error(kee(ledger_conflict,_),_),Conflict=true),
    assertion(Conflict==true),kb_kee_ledger:snapshot(After),assertion(Before==After).
test(negative_mt_scope_does_not_commit,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(_,_,T),revision(Rev),data(D),
    catch(command(T,todo_create,"denied",json{revision:Rev,mt:"x_PrivateMt",data:D},_),
      error(kee(mt_scope_denied,_),_),Denied=true),assertion(Denied==true),
    kb_kee_ledger:snapshot(S),assertion(S.sequence==0).
test(undo_redo_restore_data_with_fresh_versions,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(_,_,T),create(T,"create",_,Created),current(Created.result.id,Original),revision(R1),
    command(T,ledger_undo,"undo",json{revision:R1,changeset:Created.changeset},Undo),
    current(Created.result.id,Deleted),assertion(Deleted.deleted==true),revision(R2),
    command(T,ledger_redo,"redo",json{revision:R2,changeset:Undo.changeset},_),
    current(Created.result.id,Restored),assertion(Restored.data==Original.data),
    assertion(Restored.revision\==Original.revision),assertion(Restored.deleted==false).
test(undo_conflicts_with_intervening_edits,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(_,_,T),create(T,"create",_,Created),data(D),update_input(Created.result.id,D.put(title,"Changed"),Input),
    command(T,todo_update,"update",Input,_),revision(Rev),kb_kee_ledger:snapshot(Before),
    catch(command(T,ledger_undo,"undo",json{revision:Rev,changeset:Created.changeset},_),
      error(kee(undo_conflict,_),_),Conflict=true),assertion(Conflict==true),
    kb_kee_ledger:snapshot(After),assertion(After==Before).
test(install_failure_preserves_final_and_cleans_owned_stage,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(Root,_,T),create(T,"good",_,_),kb_kee_ledger:snapshot(Before),
    setup_call_cleanup(
      wrap_predicate(kb_kee_ledger:publish(_,_),kee_fail,_Wrapped,throw(error(fixture_install_failure,_))),
      catch(create(T,"failed",_,_),error(fixture_install_failure,_),Failed=true),
      unwrap_predicate(kb_kee_ledger:publish(_,_),kee_fail)),
    assertion(Failed==true),kb_kee_ledger:snapshot(After),assertion(After==Before),
    directory_files(Root,Names),assertion(\+ (member(Name,Names),sub_atom(Name,_,_,_,'.stage.'))).
test(llm_prose_cannot_complete_task,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(_,_,_),plunit_kee:host(H),
    LLM=H.put(json{kind:"llm",model:"fixture-model",promptVersion:"v1",promptHash:"fixture-hash"}),
    setup_call_cleanup(kb_kee_auth:open_context(LLM,T),
      (revision(Rev),data(D),Completed=D.put(json{status:"done",
        evidence:[json{kind:"reference",reference:"I claim it passed",note:"model prose"}],
        acceptance:[json{given:"a claim",when:"the model says so",then:"done"}]}),
       catch(command(T,todo_create,"fake-done",json{revision:Rev,mt:"x_PublicMt",data:Completed},_),
         error(kee(completion_requires_user_attestation,_),_),Denied=true),assertion(Denied==true)),
      kb_kee_auth:close_context(T)),
    kb_kee_ledger:snapshot(S),assertion(S.sequence==0).
test(explicit_user_completion_is_labelled_attestation,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(_,_,T),revision(Rev),data(D),Completed=D.put(json{status:"done",
      evidence:[json{kind:"reference",reference:"manual-inspection-1",note:"User checked"}],
      acceptance:[json{given:"fixture",when:"inspected",then:"expected result"}]}),
    command(T,todo_create,"done",json{revision:Rev,mt:"x_PublicMt",data:Completed},R),
    current(R.result.id,Resource),assertion(Resource.data.completion.kind==user_attestation).
test(dependencies_cycle_and_delete_are_conflict_safe,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(_,_,T),create(T,"a",_,A),create(T,"b",_,B),data(D),
    update_input(B.result.id,D.put(dependencies,[A.result.id]),BInput),
    command(T,todo_update,"b-dep",BInput,_),
    update_input(A.result.id,D.put(dependencies,[B.result.id]),AInput),
    catch(command(T,todo_update,"cycle",AInput,_),error(kee(todo_dependency_cycle,_),_),Cycle=true),
    assertion(Cycle==true),revision(Rev),current(A.result.id,AR),atom_string(AR.revision,RRev),
    catch(command(T,todo_delete,"delete",json{revision:Rev,id:A.result.id,resourceRevision:RRev},_),
      error(kee(todo_dependency_missing,_),_),Conflict=true),assertion(Conflict==true).
test(native_process_lock_is_nonblocking,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(Root,_,T),start_worker(hold,Root,W),W=worker(_,_,Out,_),
    setup_call_cleanup(true,
      (call_with_time_limit(10,read_line_to_string(Out,"locked")),
       catch(create(T,"busy",_,_),error(kee(ledger_busy,_),_),Busy=true),
       assertion(Busy==true),kb_kee_ledger:snapshot(S),assertion(S.sequence==0)),
      finish_worker(W,_)).
test(restart_replays_durable_receipt_without_new_effect,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(Root,_,T),create(T,"durable",Input,First),kb_kee_ledger:snapshot(Before),
    job_file(Root,'replay-job.pl',"durable",Input,Job),start_worker(commit,Job,W),
    finish_worker(W,Text),atom_json_dict(Text,Reply,[]),
    assertion(Reply.replayed==true),atom_string(First.revision,Revision),assertion(Reply.revision==Revision),
    kb_kee_ledger:snapshot(After),assertion(Before==After).
test(two_processes_cannot_both_commit_same_expected_revision,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(Root,_,_),revision(Rev),data(D),Input=json{revision:Rev,mt:"x_PublicMt",data:D},
    job_file(Root,'race-a.pl',"a",Input,A),job_file(Root,'race-b.pl',"b",Input,B),
    start_worker(commit,A,W1),start_worker(commit,B,W2),finish_worker(W1,T1),finish_worker(W2,T2),
    atom_json_dict(T1,R1,[]),atom_json_dict(T2,R2,[]),
    findall(R,(member(R,[R1,R2]),R.committed==true),Winners),assertion(Winners=[_]),
    kb_kee_ledger:snapshot(S),assertion(S.sequence==1).
test(provenance_text_is_inert_and_corruption_is_not_empty_state,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(Root,_,_),directory_file_path(Root,'ledger.pl',Path),
    setup_call_cleanup(open(Path,write,S,[encoding(utf8)]),
      format(S,':- throw(should_never_execute).~n',[]),close(S)),
    catch(kb_kee_ledger:snapshot(_),error(kee(ledger_corrupt,_),_),Corrupt=true),assertion(Corrupt==true).
test(public_facade_requires_grants_and_commits_without_approval,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(_,_,DeniedToken),revision(Rev),data(D),Args=json{revision:Rev,mt:"x_PublicMt",data:D},
    plunit_kee:request("kee_todo_create",Args,Request),
    catch(kb_kee:invoke(DeniedToken,Request,_),error(kee(permission_denied,_),_),Denied=true),assertion(Denied==true),
    plunit_kee:host(H),Granted=H.put(json{permissions:["todo.read","todo.write","changeset.read","changeset.undo"],
      effects:["application_read","application_write"]}),
    setup_call_cleanup(kb_kee:open_context(Granted,T),
      (kb_kee:invoke(T,Request,R),assertion(R.result.committed==true),
       Id=R.result.result.id,
       plunit_kee:invoke_tool(T,"kee_todo_get",json{id:Id},Detail),
       assertion(Detail.result.resource.data.priority==0),
       plunit_kee:invoke_tool(T,"kee_todo_list",json{mt:"x_PublicMt",limit:1},List),
       assertion(List.result.total==1),
       plunit_kee:invoke_tool(T,"kee_audit",json{mt:"x_PublicMt"},Audit),
       assertion(Audit.result.total==1),
       kb_kee:invoke(T,Request,Replay),assertion(Replay.result.replayed==true)),
      kb_kee:close_context(T)).
test(undo_permission_does_not_imply_domain_write,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(_,_,T),create(T,"create",_,R),revision(Rev),plunit_kee:host(H),
    Limited=H.put(json{permissions:["changeset.undo"],effects:["application_write"]}),
    setup_call_cleanup(kb_kee:open_context(Limited,Other),
      (catch(plunit_kee:invoke_tool(Other,"kee_undo",json{revision:Rev,changeset:R.changeset},_),
         error(kee(permission_denied,_),_),Denied=true),assertion(Denied==true)),
      kb_kee:close_context(Other)),
    kb_kee_ledger:snapshot(S),assertion(S.sequence==1).
test(revocation_before_publication_preserves_state,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(_,_,T),create(T,"first",_,_),kb_kee_ledger:snapshot(Before),
    setup_call_cleanup(
      wrap_predicate(kb_kee_ledger:stage_commit(Token,_,_,_),kee_revoke,Wrapped,
        (kb_kee_auth:close_context(Token),Wrapped)),
      catch(create(T,"revoked",_,_),error(kee(invalid_context,_),_),Revoked=true),
      unwrap_predicate(kb_kee_ledger:stage_commit(_,_,_,_),kee_revoke)),
    assertion(Revoked==true),kb_kee_ledger:snapshot(After),assertion(After==Before).
test(replay_does_not_consume_mutation_budget,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(_,_,T),create(T,"repeat",Input,_),plunit_kee:host(H),Budgets=H.budgets.put(mutations,0),
    setup_call_cleanup(kb_kee_auth:open_context(H.put(budgets,Budgets),Retry),
      (command(Retry,todo_create,"repeat",Input,Replay),assertion(Replay.replayed==true),
       revision(Rev),catch(command(Retry,todo_create,"new",Input.put(revision,Rev),_),
         error(kee(mutation_budget,_),_),Denied=true),assertion(Denied==true)),
      kb_kee_auth:close_context(Retry)).
test(abandoned_stages_never_become_committed_changes,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(Root,_,T),directory_file_path(Root,'ledger.pl',Final),kb_cache:stage_path(Final,Stage),
    plunit_catalog_index:write_text(Stage,"interrupted payload"),
    directory_file_path(Root,'user-notes.tmp',Unrelated),plunit_catalog_index:write_text(Unrelated,"keep"),
    kb_kee_ledger:snapshot(Empty),assertion(Empty.sequence==0),assertion(exists_file(Stage)),
    create(T,"fresh",_,_),assertion(\+exists_file(Stage)),assertion(exists_file(Unrelated)).
test(public_list_and_audit_do_not_leak_other_mts,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(_,_,T),create(T,"public",_,_),plunit_kee:host(H),
    PrivateHost=H.put(json{readMts:["x_PrivateMt"],writeMts:["x_PrivateMt"]}),
    setup_call_cleanup(kb_kee_auth:open_context(PrivateHost,Private),
      (revision(Rev),data(D),
       command(Private,todo_create,"private",json{revision:Rev,mt:"x_PrivateMt",data:D.put(title,"fixture secret")},Created)),
      kb_kee_auth:close_context(Private)),
    ReaderHost=H.put(json{permissions:["todo.read","changeset.read"],effects:["application_read"]}),
    setup_call_cleanup(kb_kee:open_context(ReaderHost,Reader),
      (plunit_kee:invoke_tool(Reader,"kee_todo_list",json{mt:"x_PublicMt"},List),
       assertion(List.result.total==1),
       plunit_kee:invoke_tool(Reader,"kee_audit",json{mt:"x_PublicMt"},Audit),
       assertion(Audit.result.total==1),atom_json_dict(Text,Audit,[]),
       assertion(\+sub_atom(Text,_,_,_,'fixture secret')),
       catch(plunit_kee:invoke_tool(Reader,"kee_todo_get",json{id:Created.result.id},_),
         error(kee(mt_scope_denied,_),_),Denied=true),assertion(Denied==true)),
      kb_kee:close_context(Reader)).

:- end_tests(kee_ledger).
