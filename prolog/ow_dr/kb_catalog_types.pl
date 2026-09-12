:- module(kb_catalog_types,
    [build_type_directory/1,write_type_projection/4,type_page/5,type_status/2]).
:- use_module(kb_catalog_index,[]).
:- use_module(kb_cache,[]).
:- use_module(library(apply)).
:- use_module(library(assoc)).
:- use_module(library(filesex)).
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- use_module(library(uuid)).

/** <module> Source-located type declarations and representative taxonomy paths.

This extends the existing immutable query directory. It does not run an ontology
query, assert MT inheritance, or turn positional categories into declarations.
*/

build_type_directory(Report) :-
    kb_catalog_directory:paths(_,Manifest),
    kb_catalog_directory:acquire(Manifest,Lock),
    setup_call_cleanup(kb_catalog_directory:begin_progress(Manifest),
      catch(build_locked(Manifest,Report),Error,
        (kb_catalog_directory:failed_progress(Error),throw(Error))),
      kb_cache:release_lock(Lock)).
build_locked(Manifest,Report) :-
    statistics(walltime,[Start,_]),kb_catalog_directory:manifest(Header),
    write_type_projection(Header.directory,Header,none,Info),
    setup_call_catcher_cleanup(true,
      (kb_catalog_directory:manifest(Current),
       (Current==Header->true;throw(error(catalog_directory_stale,_))),
       kb_catalog_directory:write_record(Manifest,catalog_directory(Header.put(types,Info)))),
      Catcher,(Catcher==exit->true;delete_directory_and_contents(Info.directory))),
    statistics(walltime,[End,_]),Seconds is (End-Start)/1000,
    Report=json{revision:Header.revision,subjects:Info.subjects,claims:Info.claims,seconds:Seconds},
    kb_catalog_directory:progress(completed,Info.subjects,Info.subjects).
read_schema(Header,Schema) :-
    file_directory_name(Header.query,Parent),atom_concat(Header.revision,'.taxonomy',Name),
    directory_file_path(Parent,Name,Path),
    kb_catalog_directory:progress(reading_type_evidence,0,null),
    kb_catalog_index:read_data(Path,catalog_taxonomy(Header.revision,Schema)),
    kb_cache:terms_digest([catalog_query_v1,Schema],Hash),
    (Hash==Header.taxonomy->true;throw(error(catalog_type_taxonomy_mismatch,_))).
write_type_projection(Parent,Header,Provided,Info) :-
    (Provided=verified(Schema)->true;read_schema(Header,Schema)),
    uuid(Id),atom_concat('types-',Id,Name),directory_file_path(Parent,Name,Directory),
    make_directory(Directory),
    setup_call_catcher_cleanup(true,
      (directory_file_path(Directory,'classes.data',Classes),
       kb_catalog_directory:write_record(Classes,
         catalog_type_classes(Header.revision,Header.taxonomy,Schema.categories)),
       assoc_to_list(Schema.types,Pairs),length(Pairs,Count),
       empty_assoc(Empty),foldl(type_bucket,Pairs,Empty,Buckets),
       assoc_to_list(Buckets,Groups),length(Groups,Total),pairs_keys(Groups,BucketKeys),
       write_buckets(Groups,Directory,Header,0,Total),
       findall(N,(member(_-Types,Pairs),length(Types,N)),Counts),sum_list(Counts,Claims),
       Info=types{schema:catalog_types_v1,directory:Directory,subjects:Count,claims:Claims,
         bucketKeys:BucketKeys,
         pathPolicy:representative_shortest_paths,proofAlternativesExhaustive:false}),
      Catcher,(Catcher==exit->true;delete_directory_and_contents(Directory))).
type_bucket(Key-Types,Before,After) :-
    kb_catalog_directory:bucket_id(Key,Bucket),
    (get_assoc(Bucket,Before,Previous)->Rows=[Key-Types|Previous];Rows=[Key-Types]),
    put_assoc(Bucket,Before,Rows,After).
write_buckets([],_,_,_,_).
write_buckets([Bucket-Pairs|Rest],Directory,Header,N,Total) :-
    kb_catalog_directory:progress(type_buckets,N,Total),
    keysort(Pairs,Sorted),list_to_assoc(Sorted,Rows),
    bucket_path(Directory,Bucket,Path),
    kb_catalog_directory:write_record(Path,catalog_type_declarations(Header.revision,Header.taxonomy,Rows)),
    Next is N+1,write_buckets(Rest,Directory,Header,Next,Total).
bucket_path(Directory,Bucket,Path) :-
    atom_concat(Bucket,'.types',Name),directory_file_path(Directory,Name,Path).
type_status(Header,Status) :-
    (get_dict(types,Header,Info),exists_directory(Info.directory)->
       Status=json{available:true,subjects:Info.subjects,claims:Info.claims,
         pathPolicy:Info.pathPolicy,proofAlternativesExhaustive:false};
       Status=json{available:false,state:pending}).
type_page(Header,Key,Offset,Limit,Reply) :-
    (get_dict(types,Header,Info)->true;throw(error(catalog_types_pending,_))),
    kb_catalog_directory:bucket_id(Key,Bucket),type_rows(Header,Info,Bucket,Rows),
    (get_assoc(Key,Rows,Types)->true;Types=[]),
    kb_catalog_index:page(Types,Offset,Limit,Selected,Total),
    (Selected==[]->Items=[];
      classes(Header,Info,Classes),maplist(type_item(Classes),Selected,Items)),
    Reply=json{items:Items,total:Total,offset:Offset,limit:Limit,
      scope:catalog_taxonomy_not_mt_entailment,pathPolicy:Info.pathPolicy,
      proofAlternativesExhaustive:false}.
type_rows(Header,Info,Bucket,Rows) :-
    (exists_directory(Info.directory)->true;
      throw(error(catalog_type_directory_missing(Info.directory),_))),
    bucket_path(Info.directory,Bucket,Path),
    (get_dict(bucketKeys,Info,Keys)->
       valid_bucket_inventory(Keys),
       (memberchk(Bucket,Keys)->read_required_bucket(Header,Path,Rows);empty_assoc(Rows))
    ;exists_file(Path)->read_required_bucket(Header,Path,Rows)
    ;throw(error(catalog_type_bucket_inventory_missing(Path),_))).
valid_bucket_inventory(Keys) :-
    (ground(Keys),is_list(Keys),sort(Keys,Keys),maplist(valid_bucket_key,Keys)->true;
      throw(error(domain_error(catalog_type_bucket_inventory,Keys),_))).
valid_bucket_key(Key) :-
    atom(Key),atom_codes(Key,[A,B]),hex_code(A),hex_code(B).
hex_code(Code) :- (between(0'0,0'9,Code);between(0'a,0'f,Code)).
read_required_bucket(Header,Path,Rows) :-
    (exists_file(Path)->true;throw(error(catalog_type_bucket_missing(Path),_))),
    kb_catalog_directory:read_record(Path,
      catalog_type_declarations(Header.revision,Header.taxonomy,Rows)).
classes(Header,Info,Classes) :-
    directory_file_path(Info.directory,'classes.data',Path),
    kb_catalog_index:file_stamp(Path,Stamp),
    Identity=classes(Path,Stamp,Header.revision,Header.taxonomy),
    (nb_current(powder_catalog_type_classes,cache(Identity,Classes))->true;
      kb_catalog_directory:read_record(Path,
        catalog_type_classes(Header.revision,Header.taxonomy,Classes)),
      nb_linkval(powder_catalog_type_classes,cache(Identity,Classes))).
type_item(Classes,type(Type,Proof),Item) :-
    (get_assoc(Type,Classes,Memberships)->true;Memberships=[]),
    maplist(category_item,Memberships,Categories),proof_json(Proof,Declaration),
    Item=json{type:Type,declaration:Declaration,categories:Categories}.
category_item(membership(Group,Root,Proofs),Item) :-
    maplist(proof_json,Proofs,Steps),Item=json{group:Group,root:Root,steps:Steps}.
proof_json(e(Source,Id,Line,Mt,Path),
  json{source:Source,id:Id,line:Line,microtheory:Mt,position:Path}).
