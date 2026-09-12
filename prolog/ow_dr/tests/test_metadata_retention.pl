:- begin_tests(metadata_retention).
:- use_module('../kb_metadata_policy').
:- use_module('../kb_reader',[]).
:- use_module('../kb_compile',[]).
:- use_module('../kb_cache',[]).
:- use_module('../kb_runtime',[]).
:- use_module('../kb_store',[]).
:- use_module('../kb_terms',[]).
:- use_module(library(filesex)).
:- use_module(library(uuid)).
:- use_module(library(readutil)).

test_directory(D) :-
    source_file(plunit_metadata_retention:test_directory(_),Here),
    file_directory_name(Here,Tests),directory_file_path(Tests,artifacts,Root),
    make_directory_path(Root),uuid(U),directory_file_path(Root,U,D),make_directory_path(D).
clean(D) :- delete_directory_and_contents(D).
fixture(D,Name,Text,File) :-
    directory_file_path(D,Name,File),
    setup_call_cleanup(open(File,write,S,[encoding(utf8),newline(posix)]),
      format(S,'~s',[Text]),close(S)).

sample_text("(:original-formula (isa ?X Dog) :original-el-formula \"original EL\" :original-cnf ((isa ?X Dog)) :original-prolog \"do_not_execute(this)\" :original-source-expression \"(isa ?X Dog)\" :truth :TRUE :direction :FORWARD :creator Alice :creation-date 2020 :source-record 17 :original-id 77 :reified t :kif (isa ?X Dog))\n").
heavy_property(P) :- redundant_property(P).
has_heavy(M) :- member(T,M),compound_name_arguments(T,N,_),heavy_property(N).
has_heavy_pair(Pairs) :- member(K-_,Pairs),heavy_property(K).
has_heavy_json(Properties) :- member(P,Properties),redundant_property(P.name).

test(exact_aliases_not_blanket_original_stripping) :-
    forall(member(K,['cyc::original-formula','xc_cyc::ORIGINAL-EL-FORMULA',
                     original_cnf,originalProlog,source_expression,'raw-prolog']),
           assertion(redundant_property(K))),
    forall(member(K,[source_file,source_line,'cyc::original-id',source_record,
                     original_type,truth,monotonicity,'cyc::type',reification,
                     cnf,'cyc::cnf',xc_cnf,canonical_cnf]),
           assertion(\+redundant_property(K))).

test(krf_reader_drops_before_properties_preserves_sharing) :-
    sample_text(Text),
    kb_reader:parse_text(Text,krf,[sumo_mappings(true),diagnostics(false)],
      [assertion(x_isa(X,x_Dog),["?X"],_,1,Props,Key)]),
    assertion(var(X)),assertion(atom(Key)),assertion(\+has_heavy_pair(Props)),
    assertion(memberchk('cyc::truth'-':TRUE',Props)),
    assertion(memberchk('cyc::source-record'-17,Props)),
    assertion(memberchk('cyc::original-id'-77,Props)),
    assertion(memberchk(creator-'Alice',Props)),
    assertion(memberchk(creation_date-2020,Props)).

test(sumo_reader_preserves_originals) :-
    sample_text(Text),
    kb_reader:parse_text(Text,kif,[sumo_mappings(true),diagnostics(false)],
      [assertion(_,_,_,_,Props,_)]),
    assertion(memberchk('cyc::original-formula'-sexpr(_),Props)),
    assertion(memberchk('cyc::original-prolog'-"do_not_execute(this)",Props)).

test(global_mapping_not_sumo_origin) :-
    Text="(:original-formula \"heavy\" :kif (=> (p a) (q a)))",
    kb_reader:parse_text(Text,kif,[diagnostics(false)],
      [assertion(x_implies(x_p(x_a),x_q(x_a)),_,_,_,Props,_)]),
    assertion(memberchk(mapping_rows-['implication-implies'],Props)),
    assertion(\+has_heavy_pair(Props)).

test(representation_names_in_semantic_data_are_untouched) :-
    kb_reader:parse_text("(original-formula a b)",krf,[],
      [assertion('x_original-formula'(x_a,x_b),[],_,_,_,_)]),
    kb_reader:parse_text("(: original-formula \"raw data\")",metta,[],
      [assertion('x_:'('x_original-formula',"raw data"),[],_,_,_,_)]).

test(origin_policy,[setup(test_directory(D)),cleanup(clean(D))]) :-
    fixture(D,'custom.kif',";; logos: sumo-mappings\n(p a)\n",Kif),
    fixture(D,'passthrough.kif',"(=> (p a) (q a))\n",Pass),
    fixture(D,'sumo.krf',";; logos: sumo-mappings\n(p a)\n",Krf),
    fixture(D,'source.meld',"(p a)\n",Meld),
    fixture(D,'source.metta',"!(p a)\n",Metta),
    source_origin(Kif,[],sumo),source_origin(Pass,[],non_sumo),
    source_origin(Krf,[sumo_mappings(true)],non_sumo),
    source_origin(Meld,[sumo_mappings(true)],non_sumo),
    source_origin(Metta,[sumo_mappings(true)],non_sumo),
    origin_context(_{source:Krf,sourceOrigin:sumo},non_sumo),
    origin_context(_{},unknown),
    filter_properties(unknown,[original_formula-"blob",creator-alice],Kept),
    assertion(Kept==[creator-alice]).

base_metadata(Id,File,[
    xc_microtheory(Id,x_TestMt),xc_source_file(Id,File),xc_source_line(Id,1),
    xc_kb_names(Id,["?X"]),'xc_cyc::original-formula'(Id,"large original formula"),
    'xc_cyc::original-el-formula'(Id,"large EL formula"),
    'xc_cyc::original-cnf'(Id,sexpr([one,two,three])),
    'xc_cyc::original-prolog'(Id,"dangerous(call(_))"),
    xc_cnf(Id,cnf([positive(p,a)])),
    'xc_cyc::source-record'(Id,77),xc_creator(Id,alice),xc_direction(Id,':FORWARD')]).
legacy_cache(File,Source,Origin,Id,Header) :-
    base_metadata(Id,Source,Metadata),
    kb_cache:terms_digest([fixture],Hash),
    kb_cache:records_terms([record(Id,x_p(X,X),Metadata)],Terms),
    kb_cache:terms_digest(Terms,Digest),
    Header=cache{schema:logos_cache_v1,converter:logos_compiler_v2,source:Source,
      sourceHash:Hash,implementationHash:Hash,mtPolicy:filename_v1,dialect:kif,
      mappingHash:none,options:[sumo_mappings(Origin)],
      count:1,lineCount:1,sizeBytes:1,warnings:[],normalizedDigest:Digest},
    kb_cache:terms_digest([Header],HD),kb_cache:helper_path(Helper),
    setup_call_cleanup(open(File,write,S,[encoding(utf8),newline(posix)]),
      (kb_cache:write_one_line(S,(:-use_module(Helper),kb_tail_loader:load_remaining)),
       kb_cache:write_one_line(S,kb_cache_header(Header)),
       maplist(kb_cache:write_one_line(S),Terms),
       kb_cache:write_one_line(S,kb_cache_footer(footer{count:1,digest:Digest,headerDigest:HD}))),
      close(S)).

test(old_cache_integrity_before_filter,[setup(test_directory(D)),cleanup(clean(D))]) :-
    directory_file_path(D,'old.pl',File),
    legacy_cache(File,'source.krf',true,a901,OriginalHeader),
    kb_cache:read_cache(File,ReadHeader,[record(a901,x_p(X,Y),Metadata)]),
    assertion(ReadHeader==OriginalHeader),assertion(X==Y),assertion(var(X)),
    assertion(\+has_heavy(Metadata)),
    assertion(memberchk(xc_cnf(a901,cnf([positive(p,a)])),Metadata)),
    assertion(memberchk('xc_cyc::source-record'(a901,77),Metadata)),
    read_file_to_string(File,Raw,[]),
    split_string(Raw,"\n","",Lines),
    maplist(tamper_original,Lines,Tampered),atomics_to_string(Tampered,"\n",Changed),
    fixture(D,'old.pl',Changed,File),
    catch(kb_cache:read_cache(File,_,_),Error,true),
    assertion(nonvar(Error)),
    catch(kb_runtime:native_load(File,retention_invalid),NativeError,true),
    assertion(nonvar(NativeError)),
    assertion(\+kb_runtime:module_assertion(retention_invalid,_,_,_)).
tamper_original(Line,Changed) :-
    (sub_string(Line,Before,_,After,"large original formula")->
      sub_string(Line,0,Before,_,Prefix),sub_string(Line,_,After,0,Suffix),
      atomics_to_string([Prefix,"other original formula",Suffix],Changed)
    ;Changed=Line).

test(old_sumo_cache_preserved,[setup(test_directory(D)),cleanup(clean(D))]) :-
    directory_file_path(D,'old.pl',File),
    legacy_cache(File,'custom.kif',true,a902,_),
    kb_cache:read_cache(File,_,[record(a902,_,Metadata)]),
    assertion(has_heavy(Metadata)),
    setup_call_cleanup(kb_runtime:native_load(File,retention_sumo),
      (kb_runtime:module_metadata_terms(retention_sumo,a902,Native),assertion(has_heavy(Native))),
      kb_runtime:native_unload(File)).

test(native_headerless_include_and_tail,[setup(test_directory(D)),cleanup(clean(D))]) :-
    forall(member(Kind,[include,tail]),
      (atom_concat(Kind,'.pl',Base),directory_file_path(D,Base,File),
       kb_cache:helper_path(TailHelper),file_directory_name(TailHelper,App),
       directory_file_path(App,'kb_dynamic_assert.pl',IncludeHelper),
       base_metadata(a906,'archive.krf',Metadata),
       setup_call_cleanup(open(File,write,S,[encoding(utf8),newline(posix)]),
         ((Kind==include->Directive=(:-include(IncludeHelper));
             Directive=(:-use_module(TailHelper),kb_tail_loader:load_remaining)),
          kb_cache:write_one_line(S,Directive),
          kb_cache:write_one_line(S,(x_p(X,X):-x_cid(a906,X))),
          maplist(kb_cache:write_one_line(S),Metadata)),close(S)),
       setup_call_cleanup(kb_runtime:native_load(File,retention_headerless),
         (kb_runtime:module_metadata_terms(retention_headerless,a906,Kept),
          assertion(\+has_heavy(Kept)),
          kb_runtime:module_assertion(retention_headerless,a906,_,Ref),
          clause_property(Ref,line_count(2))),
         kb_runtime:native_unload(File)))).

test(representation_markers_are_not_raw_originals) :-
    Marker=term_representation{schema:'powder.term-representation.v1',
                              identity:'nat:x_Function(x_a)',representation:nart},
    filter_metadata(non_sumo,
      [xc_original_cnf(a907,"raw large CNF"),xc_term_representation(a907,Marker),
       'xc_cyc::type'(a907,nart),'xc_cyc::reified'(a907,true)],Kept),
    assertion(Kept==[xc_term_representation(a907,Marker),
      'xc_cyc::type'(a907,nart),'xc_cyc::reified'(a907,true)]).

test(saved_headerless_native_keeps_verified_origin,[setup(test_directory(D)),cleanup(clean(D))]) :-
    directory_file_path(D,'snapshot.data',File),
    base_metadata(a908,'unavailable-custom.kif',Metadata),kb_cache:helper_path(Helper),
    setup_call_cleanup(open(File,write,S,[encoding(utf8),newline(posix)]),
      (kb_cache:write_one_line(S,(:-use_module(Helper),kb_tail_loader:load_remaining)),
       kb_cache:write_one_line(S,(x_p(X,X):-x_cid(a908,X))),
       maplist(kb_cache:write_one_line(S),Metadata)),close(S)),
    Context=_{source:'unavailable-custom.kif',sourceOrigin:sumo},
    setup_call_cleanup(kb_runtime:native_load(File,retention_snapshot,[metadata_context(Context)]),
      (kb_runtime:module_metadata_terms(retention_snapshot,a908,Loaded),
       assertion(has_heavy(Loaded))),
      kb_runtime:native_unload(File)).

test(native_old_cache_retention_and_query,[setup(test_directory(D)),cleanup(clean(D))]) :-
    directory_file_path(D,'native.pl',File),
    legacy_cache(File,'source.krf',false,a903,_),
    setup_call_cleanup(kb_runtime:native_load(File,retention_native),
      (kb_runtime:module_metadata_terms(retention_native,a903,Metadata),
       assertion(\+has_heavy(Metadata)),
       assertion(memberchk(xc_cnf(a903,cnf([positive(p,a)])),Metadata)),
       kb_runtime:module_assertion(retention_native,a903,x_p(X,Y),Ref),
       assertion(X==Y),clause_property(Ref,file(File)),clause_property(Ref,line_count(3)),
       kb_runtime:query_modules([retention_native],x_p(x_a,Z),x_TestMt,2,2,
         [solution(x_TestMt,[x_a],[step(a903,fact,[x_a],1,1)])]),
       assertion(var(Z))),
      kb_runtime:native_unload(File)).

test(canonical_cnf_does_not_restore_other_raw_properties,
     [setup(test_directory(D)),cleanup(clean(D))]) :-
    Text="(:cnf ((p a)) :original-cnf ((p a)) :original-formula \"raw formula\" :original-el-formula \"raw EL\" :original-prolog \"raw Prolog\" :kif (p a))\n",
    fixture(D,'canonical.krf',Text,File),directory_file_path(D,state,State),
    kb_compile:compile_source(File,[state_dir(State),progress(none),diagnostics(false)],Result),
    kb_cache:read_cache(Result.normalized,_,[record(Id,x_p(x_a),Metadata)]),
    assertion(memberchk('xc_cyc::cnf'(Id,sexpr([sexpr([p,a])])),Metadata)),
    assertion(\+has_heavy(Metadata)),
    kb_terms:metadata_json(Metadata,Properties),
    filter_json_properties(non_sumo,Properties,Kept),
    assertion(Kept==Properties),
    assertion(memberchk(_{name:'cyc::cnf',value:_},Kept)),
    cleanup_cache(Result).

test(fresh_compile_and_stable_forced_ids,[setup(test_directory(D)),cleanup(clean(D))]) :-
    sample_text(Text),fixture(D,'fixture.krf',Text,File),
    directory_file_path(D,state,State),
    Options=[state_dir(State),diagnostics(false),progress(none)],
    kb_compile:compile_source(File,Options,First),
    kb_cache:read_cache(First.normalized,H,[record(Id,S,M)]),
    assertion(H.schema==logos_cache_v2),assertion(H.converter==logos_compiler_v3),
    assertion(H.retentionPolicy==non_sumo_originals_v1),assertion(H.sourceOrigin==non_sumo),
    assertion(\+has_heavy(M)),
    kb_compile:compile_source(File,[force(true)|Options],Again),
    kb_cache:read_cache(Again.normalized,_,[record(Id,Other,M2)]),
    assertion(S=@=Other),assertion(M==M2),
    read_file_to_string(File,Unchanged,[]),assertion(Unchanged==Text),
    kb_store:prepare_source(Again,prepared(_,Info,Records)),
    assertion(Info.sourceOrigin==non_sumo),
    Records=[record(Id,_,M3)],assertion(\+has_heavy(M3)),
    cleanup_cache(First).
cleanup_cache(Result) :-
    kb_compile:source_artifacts(Result.source,Artifacts),
    forall(member(F,[Result.normalized,Result.index|Artifacts]),
      kb_cache:remove_if_exists(F)).

test(store_materialization_and_guarded_cleanup,[setup(test_directory(D)),cleanup(clean(D))]) :-
    directory_file_path(D,'native.pl',File),
    legacy_cache(File,'source.krf',false,a904,_),
    setup_call_cleanup(
      (kb_runtime:native_load(File,retention_store),
       Info=_{source:'source.krf',sourceOrigin:non_sumo,count:1,warnings:[],
              lineCount:1,sizeBytes:1,status:cache_hit,elapsed:0},
       assertz(kb_store:source_info('source.krf',Info)),
       assertz(kb_store:source_module('source.krf',retention_store,File))),
      store_cleanup_test,
      (retractall(kb_store:assertion(a904,_)),retractall(kb_store:source_info('source.krf',_)),
       retractall(kb_store:source_module('source.krf',_,_)),
       retractall(kb_store:constant_locator(_,a904)),retractall(kb_store:mt_locator(_,a904)),
       kb_runtime:native_unload(File))).
store_cleanup_test :-
    base_metadata(a904,'source.krf',Raw),
    kb_store:activate_record('source.krf',retention_store,record(a904,x_p(X,X),Raw)),
    kb_store:assertion(a904,Data),
    assertion(\+has_heavy_json(Data.properties)),
    assertion(memberchk(_{name:cnf,value:_},Data.properties)),
    % Emulate already-loaded pre-policy state without touching the corpus.
    assertz(retention_store:'xc_cyc::original-formula'(a904,"old native payload")),
    retract(kb_store:assertion(a904,Old)),
    assertz(kb_store:assertion(a904,
      Old.put(properties,[_{name:'cyc::original-formula',value:"old JSON payload"}|Old.properties]))),
    kb_store:generation(G),kb_store:metadata_retention_stats(Before),
    catch(kb_store:apply_metadata_retention_locked(_),GuardError,true),assertion(nonvar(GuardError)),
    with_mutex(openworld_code_reload,with_mutex(openworld_store,
      kb_store:apply_metadata_retention_locked(Report))),
    assertion(Report.before.identity==Before.identity),
    assertion(Report.removed.nativeProperties==1),
    assertion(Report.removed.jsonProperties==1),
    kb_store:generation(G),
    kb_runtime:module_metadata_terms(retention_store,a904,After),assertion(\+has_heavy(After)),
    kb_store:assertion(a904,New),assertion(New.expression=@=Data.expression),
    assertion(\+has_heavy_json(New.properties)),
    assertion(memberchk(_{name:cnf,value:_},New.properties)),
    kb_runtime:query_modules([retention_store],x_p(x_a,_),x_TestMt,1,2,[_]).

test(metadata_byte_reduction) :-
    length(Codes,10000),maplist(=(0'x),Codes),string_codes(Blob,Codes),
    Metadata=['xc_cyc::original-formula'(a905,Blob),
              'xc_cyc::original-cnf'(a905,Blob),
              xc_source_file(a905,'fixture.krf'),xc_source_line(a905,7),
              xc_creator(a905,alice),xc_microtheory(a905,x_Mt),xc_kb_names(a905,[])],
    metadata_stats(non_sumo,Metadata,Stats),
    assertion(Stats.droppedPropertyCount==2),
    assertion(Stats.retainedPropertyCount==5),
    assertion(Stats.removedMetadataBytes>20000),
    metadata_stats(sumo,Metadata,Sumo),assertion(Sumo.removedMetadataBytes==0),
    format('~nRetention fixture: ~d -> ~d serialized UTF-8 bytes; ~d -> ~d properties.~n',
      [Stats.metadataBytes,Stats.retainedMetadataBytes,Stats.propertyCount,Stats.retainedPropertyCount]).

test(cleanup_refuses_pinned_native_query,
     [setup(assertz(kb_store:native_query_refs(retention_fixture,1),Ref)),
      cleanup(erase(Ref)),throws(error(metadata_retention_busy(native_snapshots),_))]) :-
    with_mutex(openworld_code_reload,with_mutex(openworld_store,
      kb_store:apply_metadata_retention_locked(_))).

:- end_tests(metadata_retention).
