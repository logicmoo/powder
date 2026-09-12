:- module(kb_catalog_directory,
    [build_catalog_directory/1,build_from_model/3,directory_status/1,
     lookup_term/3,lookup_source/3,request_cancel/2]).
:- use_module(kb_catalog_index,[]).
:- use_module(kb_paths).
:- use_module(kb_cache,[]).
:- use_module(library(assoc)).
:- use_module(library(apply)).
:- use_module(library(crypto)).
:- use_module(library(error)).
:- use_module(library(filesex)).
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- use_module(library(uuid)).

/** <module> Key-addressable view of the existing immutable query projection.

Exact lookup reads one hash bucket and only requested source descriptors.
Postings, assertion identities and taxonomy are reused, not recompiled or copied
as sentences. The small manifest is the sole publication boundary.
*/

paths(Query,Manifest) :-
    kb_catalog_index:catalog_paths(Catalog,_),file_directory_name(Catalog,Dir),
    directory_file_path(Dir,'query.data',Query),
    directory_file_path(Dir,'query.directory',Manifest).
build_catalog_directory(Report) :-
    paths(Query,Manifest),acquire(Manifest,Lock),
    setup_call_cleanup(begin_progress(Manifest),
      catch((progress(reading_projection,0,null),
             kb_catalog_index:read_data(Query,catalog_query(Model)),
             build_locked(Query,Manifest,Model,Report)),
        Error,(failed_progress(Error),throw(Error))),
      kb_cache:release_lock(Lock)).
build_from_model(Query,Model,Report) :-
    paths(Query,Manifest),acquire(Manifest,Lock),
    setup_call_cleanup(begin_progress(Manifest),
      catch(build_locked(Query,Manifest,Model,Report),Error,
        (failed_progress(Error),throw(Error))),
      kb_cache:release_lock(Lock)).
acquire(Manifest,Lock) :-
    atom_concat(Manifest,'.lock',LockPath),
    kb_cache:try_lock(LockPath,Lock),
    (Lock==busy->throw(error(catalog_directory_busy,_));true).
begin_progress(Manifest) :-
    uuid(Run),current_prolog_flag(pid,Pid),get_time(Now),
    atom_concat(Manifest,'.progress',Path),
    nb_setval(powder_key_directory_progress,Path-json{ownerPid:Pid,runId:Run,
      startedAt:Now,execution:external,state:running}),
    flag(powder_directory_terms,_,0).
progress(Phase,Completed,Total) :-
    nb_getval(powder_key_directory_progress,Path-Meta),get_time(Now),
    (Phase==completed->true;check_cancel(Path,Meta)),
    (Phase==completed->State=succeeded;State=running),
    Data=Meta.put(json{phase:Phase,state:State,completed:Completed,total:Total,heartbeat:Now}),
    kb_catalog_index:atomic_data(Path,catalog_progress(Data)).
failed_progress(Error) :-
    nb_getval(powder_key_directory_progress,Path-Meta),get_time(Now),
    message_to_string(Error,Message),
    (Error=error(catalog_directory_cancelled,_)->State=cancelled;State=failed),
    kb_catalog_index:atomic_data(Path,catalog_progress(
      Meta.put(json{state:State,phase:State,heartbeat:Now,error:json{message:Message}}))).
check_cancel(Progress,Meta) :-
    atom_concat(Progress,'.cancel',Path),
    (exists_file(Path),kb_catalog_index:read_data(Path,catalog_cancellation(Run)),Run==Meta.runId->
       throw(error(catalog_directory_cancelled,_));true).
request_cancel(Input,Reply) :-
    (atom(Input)->Run=Input;string(Input)->atom_string(Run,Input);type_error(text,Input)),
    paths(_,Manifest),atom_concat(Manifest,'.progress',Progress),
    kb_catalog_index:external_job_status(Manifest,Progress,Job),
    (Job.cancelable==true,Job.runId==Run->true;throw(error(catalog_not_running(Run),_))),
    atom_concat(Progress,'.cancel',Cancel),
    kb_catalog_index:atomic_data(Cancel,catalog_cancellation(Run)),
    Reply=json{state:cancellation_requested,phase:directory,runId:Run}.
build_locked(Query,Manifest,Model,Report) :-
    statistics(walltime,[Start,_]),kb_catalog_index:file_stamp(Query,Stamp),
    crypto_file_hash(Query,InputHash,[algorithm(sha256),encoding(octet)]),
    file_directory_name(Manifest,Parent),uuid(Run),atom_concat('lookup-',Run,Name),
    directory_file_path(Parent,Name,Directory),make_directory_path(Directory),
    Published=publication(false),
    setup_call_catcher_cleanup(true,
      (length(Model.ranked,Total),nb_setval(powder_directory_total,Total),
       progress(partitioning_terms,0,Total),empty_assoc(Empty),
       foldl(bucket_entry(Model),Model.ranked,Empty,Buckets),
       assoc_to_list(Buckets,Groups),
       flag(powder_directory_buckets,_,0),
       progress(writing_buckets,0,256),maplist(write_bucket(Directory,Model),Groups),
       assoc_to_values(Model.files,Files),
       maplist(write_source(Directory,Model),Files),
       kb_catalog_index:file_stamp(Query,After),
       (After==Stamp->true;throw(error(catalog_changed_during_directory,_))),
       crypto_file_hash(Query,AfterHash,[algorithm(sha256),encoding(octet)]),
       (AfterHash==InputHash->true;throw(error(catalog_changed_during_directory,_))),
       length(Model.ranked,Count),length(Files,FileCount),length(Groups,BucketCount),
       (get_dict(providerCoverage,Model,Provider)->true;Provider=unknown),
       Data=directory{schema:catalog_directory_v1,query:Query,inputStamp:Stamp,inputHash:InputHash,
         directory:Directory,revision:Model.revision,taxonomy:Model.taxonomy,
         coverage:Model.coverage,verifiedAt:Model.verifiedAt,providerCoverage:Provider,
         termCount:Count,fileCount:FileCount,buckets:BucketCount},
       progress(publishing,Count,Count),
       write_record(Manifest,catalog_directory(Data)),
       nb_setarg(1,Published,true),
       statistics(walltime,[End,_]),Seconds is (End-Start)/1000,
       Report=json{terms:Count,files:FileCount,buckets:BucketCount,seconds:Seconds,
         revision:Model.revision,coverage:Model.coverage},
       progress(completed,Count,Count)),
      Catcher,
      ((Catcher==exit;arg(1,Published,true))->true;delete_directory_and_contents(Directory))).
bucket_entry(Model,Key,Before,After) :-
    flag(powder_directory_terms,N,N+1),
    (N mod 10000=:=0->nb_getval(powder_directory_total,Total),progress(partitioning_terms,N,Total);true),
    bucket_id(Key,Bucket),get_assoc(Key,Model.terms,Entry),get_assoc(Key,Model.postings,Posts),
    (get_assoc(Bucket,Before,Entries)->Next=[Key-row(Entry,Posts)|Entries];
      Next=[Key-row(Entry,Posts)]),
    put_assoc(Bucket,Before,Next,After).
bucket_id(Key,Bucket) :-
    crypto_data_hash(Key,Hash,[algorithm(sha256),encoding(utf8)]),
    sub_atom(Hash,0,2,_,Bucket).
bucket_path(Directory,Bucket,Path) :-
    atom_concat(Bucket,'.terms',Name),directory_file_path(Directory,Name,Path).
write_bucket(Directory,Model,Bucket-Entries) :-
    keysort(Entries,Sorted),list_to_assoc(Sorted,Lookup),
    bucket_path(Directory,Bucket,Path),
    write_record(Path,catalog_bucket(Model.revision,Model.taxonomy,Lookup)),
    flag(powder_directory_buckets,N,N+1),Done is N+1,
    progress(writing_buckets,Done,256).
source_path(Directory,Source,Path) :-
    source_key(Source,Key),
    crypto_data_hash(Key,Hash,[algorithm(sha256),encoding(utf8)]),
    atom_concat(Hash,'.source',Name),directory_file_path(Directory,Name,Path).
source_key(Source,Key) :- (current_prolog_flag(windows,true)->downcase_atom(Source,Key);Key=Source).
write_source(Directory,Model,File) :-
    source_path(Directory,File.path,Path),
    findall(Key-Value,
      (member(Key,[path,normalized,identity,rawSourceHash,termSchema,sizeBytes,modified,normalizedStamp,
                   postings,postingsDigest]),get_dict(Key,File,Value)),Pairs),
    dict_pairs(Compact,source,Pairs),
    write_record(Path,catalog_source_descriptor(Model.revision,Model.taxonomy,Compact)).

write_record(File,Record) :-
    (ground(Record),acyclic_term(Record)->true;type_error(ground_directory_record,Record)),
    kb_cache:stage_path(File,Stage),
    setup_call_cleanup(true,
      (kb_cache:terms_digest([Record],Digest),
       setup_call_cleanup(open(Stage,write,S,[encoding(utf8),newline(posix)]),
         (kb_cache:write_one_line(S,directory_header(1)),
          kb_cache:write_one_line(S,Record),
          kb_cache:write_one_line(S,directory_footer(Digest)),flush_output(S)),close(S)),
       read_record(Stage,Record),
       kb_catalog_index:install_catalog_stage(Stage,File,0)),
      kb_cache:remove_if_exists(Stage)).
read_record(File,Record) :-
    (setup_call_cleanup(open(File,read,S,[encoding(utf8),newline(posix)]),
      (kb_catalog_index:safe_term(S,directory_header(1)),
       kb_catalog_index:safe_term(S,Record),
       kb_catalog_index:safe_term(S,directory_footer(Digest)),
       read_term(S,end_of_file,[]),kb_cache:terms_digest([Record],Digest)),close(S))->true;
     throw(error(invalid_catalog_directory(File),_))).
manifest(Data) :-
    paths(Query,Path),
    (exists_file(Path)->read_record(Path,catalog_directory(Data));
      throw(error(catalog_directory_pending,_))),
    (Data.schema==catalog_directory_v1->true;throw(error(invalid_catalog_directory(Path),_))),
    kb_catalog_index:file_stamp(Query,Stamp),
    (Stamp==Data.inputStamp,current_catalog_revision(Data.revision)->true;
       throw(error(catalog_directory_stale,_))).
current_catalog_revision(Revision) :-
    kb_catalog_index:catalog_revision(Current),
    (Current==legacy;Current==Revision).
directory_status(Reply) :-
    paths(Query,Path),atom_concat(Path,'.progress',Progress),
    kb_catalog_index:external_job_status(Path,Progress,Job),
    (exists_file(Path)->
       read_record(Path,catalog_directory(Data)),
       (exists_file(Query),kb_catalog_index:file_stamp(Query,Stamp),Stamp==Data.inputStamp,
          current_catalog_revision(Data.revision)->
          Available=true,State=ready;Available=false,State=stale),
       Reply=json{available:Available,state:State,terms:Data.termCount,files:Data.fileCount,job:Job,
         buckets:Data.buckets,revision:Data.revision,taxonomy:Data.taxonomy,
         coverage:Data.coverage,providerCoverage:Data.providerCoverage}
    ;Reply=json{available:false,state:pending,job:Job}).
lookup_term(Key,Model,Entry) :-
    must_be(atom,Key),manifest(Header),bucket_id(Key,Bucket),
    bucket_path(Header.directory,Bucket,Path),
    (exists_file(Path)->
       read_record(Path,catalog_bucket(Header.revision,Header.taxonomy,Rows)),
       (get_assoc(Key,Rows,row(Entry,Posts))->true;Entry=none,Posts=[])
    ;Entry=none,Posts=[]),
    list_to_assoc([Key-Posts],Postings),
    (Entry==none->empty_assoc(Terms);list_to_assoc([Key-Entry],Terms)),
    Model=query_lookup{revision:Header.revision,taxonomy:Header.taxonomy,
      coverage:Header.coverage,verifiedAt:Header.verifiedAt,providerCoverage:Header.providerCoverage,
      directory:Header.directory,terms:Terms,postings:Postings}.
lookup_source(Model,Source,File) :-
    source_path(Model.directory,Source,Path),
    read_record(Path,catalog_source_descriptor(Model.revision,Model.taxonomy,File)),
    source_key(Source,Key),source_key(File.path,Actual),
    (Actual==Key->true;throw(error(invalid_catalog_source_descriptor(Source),_))).
