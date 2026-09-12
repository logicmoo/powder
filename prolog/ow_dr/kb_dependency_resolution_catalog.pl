:- module(kb_dependency_resolution_catalog,
          [catalog_identity/1,catalog_evidence/5,read_locator/4,source_terms/5,root_usage/5]).
:- use_module(kb_catalog_directory,[]).
:- use_module(kb_catalog_query,[]).
:- use_module(kb_catalog_index,[]).
:- use_module(kb_catalog,[authorize_sources/2]).
:- use_module(kb_cache,[]).
:- use_module(kb_runtime,[]).
:- use_module(kb_paths,[public_path/2,repo_root/1]).
:- use_module(library(assoc)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(solution_sequences)).

/** Narrow data-only adapter over existing directory/posting/cache readers.
The AST presentation is deliberately NOT parsed back into clauses: original
variable spellings alone cannot reconstruct distinct lexical variable slots. */

catalog_identity(Identity) :-
    kb_catalog_directory:directory_status(Status),
    (Status.available==true->
      Identity=identity{available:true,revision:Status.revision,taxonomy:Status.taxonomy,
        providerCoverage:Status.providerCoverage,coverage:Status.coverage}
    ;Identity=identity{available:false,revision:null,taxonomy:null,
        providerCoverage:unknown,coverage:json{complete:false},reason:Status.state}).

catalog_evidence(Key,Expected,Limit,Rows,Coverage) :-
    must_be(atom,Key),must_be(between(1,500),Limit),
    kb_catalog_directory:lookup_term(Key,Model,_),same_identity(Expected,Model),
    get_assoc(Key,Model.postings,AllPosts),
    include(bounded_posting,AllPosts,Posts),length(AllPosts,AllCount),length(Posts,ReadCount),
    Skipped is AllCount-ReadCount,Take is Limit+1,
    once(findnsols(Take,File-Locator,
      (member(p(Source,Offset,_,_,_,_),Posts),
       kb_catalog_directory:lookup_source(Model,Source,File),
       kb_catalog_query:read_posting(File,Offset,Key,Locators),
       member(Locator,Locators)),Selected0)),
    length(Selected0,N),
    (N>Limit->length(Selected,Limit),append(Selected,_,Selected0),State=partial;
       Selected=Selected0,(Skipped=:=0->State=complete;State=partial)),
    findall(File,member(File-_,Selected),Files0),sort(Files0,Files),
    maplist(verify_file,Files),
    maplist(resource_guard,Files,Before),
    maplist(locator_row,Selected,Rows),
    maplist(resource_guard,Files,AfterResources),
    (Before==AfterResources->true;throw(error(dependency_source_changed,_))),
    catalog_identity(After),same_identity(Expected,After),
    length(Rows,Returned),
    Coverage=coverage{rows:State,returned:Returned,inspectedLocators:N,limit:Limit,
      skippedLargePostings:Skipped,
      revision:Model.revision,taxonomy:Model.taxonomy,
      sourceFreshness:selected_pages_verified,globalFreshness:unknown}.
bounded_posting(p(_,_,Sentences,Occurrences,Definitions,Contexts)) :-
    Sentences=<2000,Occurrences=<10000,Definitions=<2000,Contexts=<2000.
root_usage(Key,Mt,Roots,Expected,Usage) :-
    kb_catalog_directory:lookup_term(Key,Model,_),same_identity(Expected,Model),
    get_assoc(Key,Model.postings,Posts),
    (once((member(Post,Posts),Post=p(Source,Offset,_,_,_,_),bounded_posting(Post),
           member(Root,Roots),same_source(Root,Source),
           kb_catalog_directory:lookup_source(Model,Source,File),verify_file(File),
           resource_guard(File,Before),
           kb_catalog_query:read_posting(File,Offset,Key,Rows),
           member(r(_,Id,Line,Context,_,_,Hits,_),Rows),Context==Mt,
           member(h(_,_,semantic),Hits)))->
       resource_guard(File,After),
       (Before==After->true;throw(error(dependency_source_changed,_))),
       Usage=usage{state:selected_catalog_evidence,source:Source,id:Id,line:Line,mt:Mt,
         resourceGuard:After}
    ;Usage=usage{state:not_established_in_selected_roots,coverage:bounded}).
same_source(A,B) :- downcase_atom(A,Lower),downcase_atom(B,Lower).
same_identity(Expected,Actual) :-
    (Actual.revision==Expected.revision,Actual.taxonomy==Expected.taxonomy->true;
       throw(error(dependency_catalog_changed,_))).
verify_file(File) :-
    authorize_sources([File.path],_),kb_catalog_index:current_source(File).
locator_row(File-Locator,Row) :- read_locator(File,Locator,false,Row).

read_locator(File,r(_,Id,Line,Mt,Names,Offset,_,_),Loaded,row(Semantic,Evidence)) :-
    setup_call_cleanup(open(File.normalized,read,S,[encoding(utf8),newline(posix)]),
      (seek(S,Offset,bof,_),kb_cache:read_line_term(S,Clause,_),
       (kb_catalog_index:clause_identity(Clause,Id)->true;
          throw(error(dependency_catalog_clause_identity(Id),_))),
       (kb_catalog_query:read_assertion_metadata(S,Id,Metadata)->true;
          throw(error(dependency_catalog_metadata_read_failed(Id),_)))),close(S)),
    Clause=(Head:-Guard),kb_runtime:valid_guarded_clause(Head,Guard),
    kb_runtime:guard_semantic(Guard,Id,Head,Semantic),
    (memberchk(xc_source_file(Id,Original),Metadata)->true;Original=null),
    dialect(File.path,Dialect),resource_guard(File,GuardIdentity),
    Evidence=evidence{id:Id,source:File.path,originalSource:Original,line:Line,
      mt:Mt,loaded:Loaded,dialect:Dialect,names:Names,origin:validated_catalog,
      resourceGuard:GuardIdentity}.
resource_guard(File,Guard) :-
    repo_root(Root),
    (is_absolute_file_name(File.path)->Source=File.path;directory_file_path(Root,File.path,Source)),
    (exists_file(Source)->
       size_file(Source,SourceSize),time_file(Source,SourceTime),
       size_file(File.normalized,DataSize),time_file(File.normalized,DataTime),
       Guard=json{sourceSize:SourceSize,sourceModified:SourceTime,
                  dataSize:DataSize,dataModified:DataTime}
    ;throw(error(dependency_source_missing(File.path),_))).
dialect(Path,Dialect) :-
    file_name_extension(_,Ext,Path),downcase_atom(Ext,Dialect),
    (memberchk(Dialect,[kif,krf,meld,metta])->true;domain_error(report_source_dialect,Path)).

source_terms(Source,Mt,Expected,Limit,Result) :-
    must_be(between(1,501),Limit),authorize_sources([Source],Absolute),
    Absolute=[Path],public_path(Path,Public),
    kb_catalog_directory:lookup_term(x_BaseKB,Model,_),same_identity(Expected,Model),
    kb_catalog_directory:lookup_source(Model,Public,File),verify_file(File),
    setup_call_cleanup(open(File.postings,read,Stream,[encoding(utf8),newline(posix)]),
      scan_source_terms(Stream,File.identity,File.postingsDigest,Mt,Limit,Keys,State),close(Stream)),
    Result=json{source:Public,terms:Keys,coverage:State,
      selection:positive_semantic_occurrence_in_explicit_mt}.
scan_source_terms(Stream,Identity,Digest,Mt,Limit,Keys,State) :-
    (kb_catalog_index:safe_term(Stream,postings_header(1,Identity))->
       scan_terms(Stream,Mt,Limit,0,[],Digest,Keys,State);
       throw(error(invalid_dependency_postings_header,_))).
scan_terms(Stream,Mt,Left,Count,Digests,Expected,Keys,State) :-
    stream_property(Stream,position(Position)),stream_position_data(byte_count,Position,Bytes),
    (Left=:=0->Keys=[],State=bounded
    ;(Bytes>=4194304;Count>=5000)->Keys=[],State=bounded
    ;kb_catalog_index:safe_term(Stream,Term),
     (Term=postings_footer(Footer)->
        (Footer==Expected,kb_cache:terms_digest(Digests,Footer),
         kb_catalog_index:safe_term(Stream,end_of_file)->Keys=[],State=complete;
           throw(error(invalid_dependency_postings_footer,_)))
     ;Term=posting(Key,Rows,Digest),kb_cache:terms_digest([posting(Key,Rows)],Digest)->
        (once((member(r(_,_,_,RowMt,_,_,Hits,_),Rows),RowMt==Mt,
               member(h(_,_,semantic),Hits)))->
           Keys=[Key|Rest],Next is Left-1;Keys=Rest,Next=Left),
        More is Count+1,scan_terms(Stream,Mt,Next,More,[Digest|Digests],Expected,Rest,State)
     ;throw(error(invalid_dependency_source_posting,_)))).
