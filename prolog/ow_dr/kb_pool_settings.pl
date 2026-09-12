:- module(kb_pool_settings,
    [pool_settings/1,save_pool_settings/3,apply_pool_settings/2,
     task_list/2,task_details/3,cancel_task/2]).
:- use_module(kb_jobs,[]).
:- use_module(kb_config,[]).
:- use_module(kb_activity).
:- use_module(kb_cache,[]).
:- use_module(library(error)).
:- use_module(library(filesex)).
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- meta_predicate settings_locked(0).

pool_settings(Reply) :-
    kb_config:server_settings(Settings),kb_jobs:pool_profiles(Live),
    maplist(managed_profile(Settings,Live),[file,inference],Managed),
    http_profile(Settings,HTTP),append(Managed,[HTTP],Items),
    Reply=_{revision:Settings.revision,items:Items,
      limits:_{workers:_{min:1,max:128},queueCapacity:_{min:1,max:1000}},
      savePolicy:"Save changes desired profiles only. Apply live changes running file/inference pools; HTTP requires listener restart."}.

config_key(file,loader).
config_key(inference,inference).
desired_profile(Settings,Type,Desired) :-
    config_key(Type,Key),get_dict(Key,Settings.pools,P),
    kb_config:pool_profile(Key,P,Checked),
    (get_dict(queueCapacity,Checked,_)->Desired=Checked;Desired=Checked.put(queueCapacity,100)).
managed_profile(Settings,Live,Type,Item) :-
    desired_profile(Settings,Type,Desired),config_key(Type,Key),
    (member(Stats,Live),Stats.pool==Type->
      Effective=Stats.profile,Running=true,
      (Desired==Effective->NeedsApply=false;NeedsApply=true),
      ((Stats.total>Effective.max;Stats.total<Effective.start;Stats.retiring>0;
        Stats.inFlight>Effective.max)->Settling=true;Settling=false),
      (NeedsApply==true->State=pending_apply;Settling==true->State=settling;State=running),
      Workers=Stats
    ;Effective=null,Running=false,NeedsApply=false,State=stopped,Workers=null),
    Item=_{pool:Type,configKey:Key,desired:Desired,effective:Effective,
      state:State,running:Running,needsApply:NeedsApply,restartRequired:false,
      liveApplySupported:true,workers:Workers,nextStart:Desired}.

http_profile(Settings,Item) :-
    Desired=Settings.pools.http,
    kb_jobs:jobs_locked(findall(_{port:Port,profile:Profile},
      kb_jobs:http_pool(Port,Profile),Listeners)),
    (Listeners=[]->State=untracked,Restart=false;
     (member(L,Listeners),\+same_http_profile(L.profile,Desired))->State=restart_required,Restart=true;
     State=tracked,Restart=false),
    Item=_{pool:http,configKey:http,desired:Desired,effective:Listeners,state:State,
      restartRequired:Restart,liveApplySupported:false,
      evidence:host_listener_attachment,nextStart:Desired}.
same_http_profile(A,B) :- A.start=:=B.start,A.max=:=B.max,A.spare=:=B.spare.

save_pool_settings(Updates,Expected,Reply) :-
    with_application(
      (must_be(dict,Updates),dict_pairs(Updates,_,Pairs),
       (Pairs\=[]->true;domain_error(pool_updates,Updates)),
       maplist(update_key,Pairs,Keys),sort(Keys,Unique),
       (same_length(Keys,Unique)->true;domain_error(duplicate_pool_updates,Updates)),
       kb_config:server_settings(Current),check_revision(Expected,Current.revision),
       foldl(update_profile,Pairs,Current.pools,Pools),
       kb_config:save_server_settings(Current.put(pools,Pools),Expected,_))),
    pool_settings(Reply).
update_key(file-_,loader) :- !.
update_key(Key-_,Key) :-
    (memberchk(Key,[loader,inference,http])->true;domain_error(pool_name,Key)).
update_profile(Pair,Before,After) :-
    Pair=_-Patch,update_key(Pair,Key),must_be(dict,Patch),
    known_keys(Patch,[start,max,spare,queueCapacity]),
    get_dict(Key,Before,Old),put_dict(Patch,Old,Input),
    kb_config:pool_profile(Key,Input,Profile),put_dict(Key,Before,Profile,After).
check_revision(Input,Actual) :-
    text_atom(Input,Expected),
    (Expected==Actual->true;throw(error(server_settings_conflict,_))).

apply_pool_settings(Expected,Reply) :-
    with_application(settings_locked(
      (kb_config:server_settings(Settings),check_revision(Expected,Settings.revision),
       kb_jobs:configure_pools(Settings)))),
    pool_settings(Reply).
settings_locked(Goal) :-
    kb_config:settings_file(File),file_directory_name(File,Directory),
    make_directory_path(Directory),atom_concat(File,'.lock',Path),
    kb_cache:try_lock(Path,Lock),
    (Lock==busy->throw(error(server_settings_busy,_));
     setup_call_cleanup(true,Goal,kb_cache:release_lock(Lock))).

task_list(Options,Reply) :-
    must_be(dict,Options),known_keys(Options,[pool,state,offset,limit]),
    option_value(Options,pool,all,Pool0),text_atom(Pool0,Pool),valid_pool_filter(Pool),
    option_value(Options,state,active,State0),text_atom(State0,State),
    (memberchk(State,[all,active,queued,running,completed])->true;domain_error(task_state,State)),
    paging(Options,Offset,Limit),
    kb_jobs:jobs_locked(kb_pool_settings:
      (findall(Sequence-Id,
         (kb_jobs:job(Id,M,_,_),matches_job(M,Pool,State),Sequence=M.sequence),Pairs),
       keysort(Pairs,Sorted),reverse(Sorted,Recent),pairs_values(Recent,Ids),
       page(Ids,Offset,Limit,Selected,Total),maplist(task_summary,Selected,Items))),
    Reply=_{items:Items,total:Total,offset:Offset,limit:Limit,pool:Pool,state:State}.
valid_pool_filter(Pool) :-
    (memberchk(Pool,[all,file,inference])->true;domain_error(task_pool,Pool)).
matches_job(M,Pool,State) :-
    (Pool==all->true;M.pool==Pool),
    (State==all->true;
     State==active->memberchk(M.state,[queued,running]);
     State==completed->memberchk(M.state,[succeeded,failed,cancelled]);
     M.state==State).
task_summary(Id,Summary) :-
    (kb_jobs:job(Id,M,Op,_)->true;throw(error(existence_error(task,Id),_))),
    length(M.files,FileCount),
    request_kind(Op,Kind),
    (kb_jobs:cancel_requested(Id)->Cancelling=true;Cancelling=false),
    project(M.progress,[phase,completedFiles,totalFiles,completedTasks],Progress),
    Summary=_{id:Id,pool:M.pool,kind:Kind,label:M.label,state:M.state,
      createdAt:M.createdAt,startedAt:M.startedAt,finishedAt:M.finishedAt,
      generationAtAcceptance:M.generationAtAcceptance,cancelable:M.cancelable,
      cancellationRequested:Cancelling,fileCount:FileCount,progress:Progress}.
request_kind(index(_,_),index).
request_kind(replace(_,_),load).
request_kind(cached(_),cached_load).
request_kind(unload(_),unload).
request_kind(infer(query(_,_,_,_)),query).
request_kind(infer(question(_,_,_)),question).

task_details(Input,Options,Reply) :-
    text_atom(Input,Id),must_be(dict,Options),
    known_keys(Options,[section,offset,limit]),
    option_value(Options,section,files,Section0),text_atom(Section0,Section),
    (memberchk(Section,[files,progress,results])->true;domain_error(task_section,Section)),
    paging(Options,Offset,Limit),
    kb_jobs:jobs_locked(kb_pool_settings:
      ((kb_jobs:job(Id,M,Op,Outcome)->true;throw(error(existence_error(task,Id),_))),
       task_summary(Id,Task),request_summary(Op,Request),
       detail_rows(Section,Id,M,Outcome,Rows),
       page(Rows,Offset,Limit,Selected,Total),
       maplist(detail_item(Section),Selected,Items),
       outcome_summary(Outcome,Result))),
    Reply=_{task:Task,request:Request,outcome:Result,section:Section,
      items:Items,total:Total,offset:Offset,limit:Limit,
      scope:"Bounded task management metadata. Query bindings, proofs and full utility reports remain query-console results."}.
request_summary(infer(query(Text,_,Limit,Seconds)),
                _{kind:query,preview:Preview,limit:Limit,timeout:Seconds}) :- !,
    clip_text(Text,512,Preview).
request_summary(infer(question(Id,Limit,Seconds)),
                _{kind:question,id:Id,limit:Limit,timeout:Seconds}) :- !.
request_summary(Op,_{kind:Kind}) :- request_kind(Op,Kind).
detail_rows(files,_,M,_,M.files).
detail_rows(progress,Id,_,_,Rows) :- findall(P,kb_jobs:unit_progress(Id,_,P),Rows).
detail_rows(results,_,_,result(Result),Rows) :- !,
    (get_dict(results,Result,Rows)->true;get_dict(files,Result,Rows)->true;Rows=[]).
detail_rows(results,_,_,_,[]).
detail_item(files,Path,_{path:Path}).
detail_item(progress,Input,Output) :-
    project(Input,[phase,source,fraction,line,bytes],Output).
detail_item(results,Input,Output) :-
    project(Input,[source,path,status,cache,count,elapsed,lineCount,sizeBytes,compileSeconds],Base),
    (get_dict(warnings,Input,Warnings)->length(Warnings,N);N=0),
    (get_dict(error,Input,Error)->
      (string(Error)->clip_text(Error,1024,Message),Issue=_{message:Message};safe_error(Error,Issue));
     Issue=null),
    Output=Base.put(_{warningCount:N,error:Issue}).
outcome_summary(pending,_{state:pending}).
outcome_summary(result(Result),Summary) :-
    project(Result,[generation,generated,cacheHits,busy,failures,exitCode,counts],Base),
    (get_dict(solutions,Result,Solutions)->length(Solutions,N);N=null),
    (get_dict(warnings,Result,Warnings)->
      (is_list(Warnings)->length(Warnings,WarningCount);WarningCount=Warnings);
     WarningCount=0),
    Summary=Base.put(_{state:succeeded,resultCount:N,warningCount:WarningCount}).
outcome_summary(failed(Error),_{state:failed,error:Safe}) :- safe_error(Error,Safe).
safe_error(job_cancelled(_),_{kind:cancelled,message:"Task cancelled."}) :- !.
safe_error(time_limit_exceeded,_{kind:timeout,message:"Query time limit exceeded."}) :- !.
safe_error(error(generation_conflict(E,C),_),
           _{kind:generation_conflict,expected:E,current:C}) :- !.
safe_error(error(compile_incomplete(S),_),Summary) :- !,
    project(S,[generated,cacheHits,busy,failures,warnings,exitCode],Counts),
    Summary=Counts.put(kind,compilation).
safe_error(_,_{kind:execution,message:"Task failed; inspect compiler diagnostics or the query console."}).

cancel_task(Input,Reply) :-
    text_atom(Input,Id),kb_jobs:cancel_job(Id),
    kb_jobs:jobs_locked(kb_pool_settings:task_summary(Id,Reply)).
project(Input,Keys,Output) :-
    findall(Key-Value,(member(Key,Keys),get_dict(Key,Input,Value)),Pairs),
    dict_pairs(Output,_,Pairs).
clip_text(Text,Maximum,Preview) :-
    string_length(Text,N),Count is min(N,Maximum),sub_string(Text,0,Count,_,Preview).
text_atom(Text,Atom) :-
    (atom(Text)->Atom=Text;string(Text)->atom_string(Atom,Text);type_error(text,Text)).
known_keys(Dict,Allowed) :-
    dict_pairs(Dict,_,Pairs),
    forall(member(Key-_,Pairs),
      (memberchk(Key,Allowed)->true;domain_error(settings_field,Key))).
option_value(Dict,Key,Default,Value) :-
    (get_dict(Key,Dict,Value)->true;Value=Default).
paging(Options,Offset,Limit) :-
    option_value(Options,offset,0,Offset),option_value(Options,limit,25,Limit),
    must_be(integer,Offset),must_be(integer,Limit),
    (between(0,1000000,Offset),between(1,100,Limit)->true;
     domain_error(task_page,Offset-Limit)).
page(Rows,Offset,Limit,Items,Total) :-
    length(Rows,Total),Skip is min(Offset,Total),length(Prefix,Skip),
    append(Prefix,Tail,Rows),Left is Total-Skip,Count is min(Limit,Left),
    length(Items,Count),append(Items,_,Tail).

/** <module> Revisioned desired profiles and bounded task-management data.

Saving never starts, stops or reconfigures a live worker. Explicit application
changes only existing file/inference pools; HTTP attachments are observational
evidence supplied by the host, not proof of live HTTP worker enforcement.
*/
