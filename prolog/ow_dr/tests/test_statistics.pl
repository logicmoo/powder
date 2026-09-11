:- begin_tests(ow_statistics).
:- use_module('../kb_statistics').
:- use_module('../kb_server', []).
:- use_module('../kb_paths').
:- use_module('../kb_urls').
:- use_module(library(filesex)).
:- use_module(library(http/json)).
:- use_module(library(http/http_client)).
:- use_module(library(http/http_open)).
:- use_module(library(socket)).
:- dynamic fixture/2.
:- dynamic configuration_environment/1.

setup_statistics :-
    app_dir(App),current_prolog_flag(pid,PID),
    format(atom(Name),'tests/.statistics-fixture-~d',[PID]),
    directory_file_path(App,Name,Root),
    (exists_directory(Root)->throw(error(fixture_exists(Root),_));true),
    directory_file_path(Root,'prolog/ow_dr',FakeApp),make_directory_path(FakeApp),
    directory_file_path(App,'windows_catalog.ps1',Script),
    directory_file_path(FakeApp,'windows_catalog.ps1',Copy),copy_file(Script,Copy),
    directory_file_path(Root,'KBs',KBs),make_directory_path(KBs),
    assertz(fixture(Root,App)),
    retractall(kb_paths:app_directory(_)),assertz(kb_paths:app_directory(FakeApp)).
cleanup_statistics :-
    retract(fixture(Root,App)),
    retractall(kb_paths:app_directory(_)),assertz(kb_paths:app_directory(App)),
    retractall(kb_statistics:summary_cache(_,_,_,_)),
    retractall(kb_statistics:mt_catalog_cache(_,_,_)),retractall(kb_statistics:mt_snapshot_cache(_,_,_,_,_)),
    retractall(kb_statistics:membership_cache(_,_,_,_,_)),retractall(kb_statistics:directory_job(_,_,_,_,_,_,_,_)),
    retractall(kb_catalog:diagnostic_index(_,_)),retractall(kb_catalog:initial_sources(_)),
    kb_file_dependencies:clear_dependency_cache,
    (retract(configuration_environment(previous(Value)))->setenv('POWDER_SERVER_SETTINGS',Value);
     retract(configuration_environment(absent))->unsetenv('POWDER_SERVER_SETTINGS');true),
    delete_directory_and_contents(Root).
fixture_configuration(Paths) :-
    (configuration_environment(_)->true;
      getenv('POWDER_SERVER_SETTINGS',Old)->assertz(configuration_environment(previous(Old)));
      assertz(configuration_environment(absent))),
    app_dir(App),directory_file_path(App,'.logos-state',Directory),make_directory_path(Directory),
    directory_file_path(Directory,'server-settings.json',File),setenv('POWDER_SERVER_SETTINGS',File),
    Profile=_{start:1,max:2,spare:0},
    Config=_{startupConfigured:true,startupFiles:Paths,pools:_{loader:Profile,inference:Profile,http:Profile}},
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),json_write_dict(S,Config,[width(0)]),close(S)).
write_text(File,Text) :-
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),format(S,'~s',[Text]),close(S)).
source(Name,File) :-
    kb_root(KBs),directory_file_path(KBs,Name,File),
    file_directory_name(File,Parent),make_directory_path(Parent),write_text(File,"(test fixture)\n").
snapshot(File,Data) :-
    size_file(File,Size),time_file(File,Time),
    Data=_{schema:"powder.kb-inventory.v1",generatedAt:1700000000,status:"complete",
      source:_{dialect:"kif",sizeBytes:Size,modified:Time},issues:[],
      counts:_{semanticAssertionCount:3},
      microtheories:[
        _{key:"x_TestMt",label:"TestMt",assertionCount:3,predicates:[
          _{name:"x_isa",label:"isa",arity:2,headOccurrenceCount:3,declarationReferenceCount:0},
          _{name:"x_aFn",label:"aFn",arity:null,headOccurrenceCount:0,declarationReferenceCount:1}]},
        _{key:"x_EmptyMt",assertionCount:0,predicates:[]}],
      relationProjection:_{schema:"powder.mt-links.v1",status:"complete",issues:[]},
      mtRelationAssertions:[_{arg1:"x_TestMt",arg2:"x_OtherMt",predicate:"x_genlMt"}]}.
save_snapshot(File,Data) :-
    atom_concat(File,'.inventory.json',Sidecar),
    setup_call_cleanup(open(Sidecar,write,S,[encoding(utf8)]),json_write_dict(S,Data,[width(0)]),close(S)).
save_mt(Name,Data) :-
    kb_root(KBs),directory_file_path(KBs,microtheory,Directory),make_directory_path(Directory),
    directory_file_path(Directory,Name,File),
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),json_write_dict(S,Data,[width(0)]),close(S)).
mt_fixture(Compound,Data) :-
    Compound="mt:x_ContextFn(x_A)",
    source('content.kif',Content),source('reference.krf',Reference),
    Catalog=_{schema:"powder.kb-inventory.v1",type:"microtheory_catalog",entries:[
      _{key:"x_A",label:"A",filename:"A.json",assertionCount:3},
      _{key:"x_B",label:"B",filename:"B.json",assertionCount:3},
      _{key:Compound,label:"(ContextFn A)",filename:"opaque-7.json",assertionCount:3}]},
    save_mt('_catalog.json',Catalog),
    Parent=_{key:"x_B",supportCount:1,supports:[_{source:Reference,line:2}]},
    Child=_{key:Compound,supportCount:1,supports:[]},
    Data=_{schema:"powder.kb-inventory.v1",key:"x_A",assertionCount:3,
      hierarchySchema:"powder.mt-links.v1",genlMt:_{asArg1:[Parent],asArg2:[Child]},
      files:[_{source:Content,assertionCount:3,declarationLines:[1]}],
      predicates:[_{name:"x_isa",arity:2,headOccurrenceCount:3,declarationReferenceCount:0},
                  _{name:"x_fn",arity:null,headOccurrenceCount:0,declarationReferenceCount:1}],
      referencedInFiles:[Content,Reference],
      mtRelations:[_{predicate:"x_genlMt",asArg1:[Parent],asArg2:[Child]}]},
    save_mt('A.json',Data),
    Back=_{key:"x_A",supportCount:1,supports:[]},
    save_mt('B.json',Data.put(_{key:"x_B",genlMt:_{asArg1:[],asArg2:[Back]}})),
    save_mt('opaque-7.json',Data.put(_{key:Compound,genlMt:_{asArg1:[Back],asArg2:[]}})).

test(summary_and_paginated_translated_details,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    source('facts.kif',File),snapshot(File,Data),save_snapshot(File,Data),
    kb_server:action(statistics,[search([paths='["KBs/facts.kif","KBs/facts.kif"]'])],Reply),
    Reply.items=[S],assertion(S.state==snapshot),
    assertion(S.counts.assertions==3),assertion(S.counts.contentMTs==1),
    assertion(S.counts.referencedMTs==2),assertion(S.counts.predicateFunctions==2),
    assertion(S.coverage.references==relation_endpoints),
    source_statistics_detail('KBs/facts.kif',predicates,'x_TestMt',1,1,Detail),
    assertion(Detail.total==2),Detail.items=[P],
    assertion(P.name=="x_isa"),assertion(P.arity==2),
    source_statistics_detail('KBs/facts.kif',content,'',0,1,Content),
    assertion(Content.total==1),Content.items=[Mt],assertion(Mt.key=="x_TestMt").

test(explicit_source_staleness_overrides_matching_identity_and_directory_coverage,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    source('flagged/facts.kif',File),snapshot(File,Base),
    Data=Base.put(_{stale:true,staleReason:"Source context changed to MergeMt.",
      sourceContextChange:_{from:"x_tinyKB",to:"x_MergeMt"}}),
    save_snapshot(File,Data),atom_concat(File,'.inventory.json',Inventory),
    read_file_to_string(Inventory,Before,[]),
    kb_server:action(statistics,[search([paths='["KBs/flagged/facts.kif"]'])],Reply),
    Reply.items=[Summary],assertion(Summary.state==stale),assertion(Summary.freshness==stale),
    assertion(Summary.counts.assertions==3),
    assertion((member(Message,Summary.messages),sub_string(Message,_,_,_,"Source context changed to MergeMt."))),
    assertion(\+ (member(Mismatch,Summary.messages),sub_string(Mismatch,_,_,_,"Source size or modification time differs"))),
    source_statistics(['KBs/flagged/facts.kif'],Warm),Warm.items=[Cached],assertion(Cached.state==stale),
    directory_statistics('KBs/flagged','',Directory),
    assertion(Directory.state==partial),assertion(Directory.coverage.staleFiles==1),
    assertion(Directory.coverage.snapshotFiles==0),assertion(Directory.counts.assertions==3),
    kb_statistics:snapshot_summary(File,'KBs/flagged/facts.kif',Base.put(stale,false),NotMarked),
    assertion(NotMarked.state==snapshot),
    read_file_to_string(Inventory,After,[]),assertion(Before==After).

test(explicit_mt_staleness_preserves_historical_tree_and_reason,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    mt_fixture(_,Base),
    save_mt('A.json',Base.put(_{stale:true,staleReason:"Source context changed to MergeMt.",
      sourceContextChange:_{from:"x_tinyKB",to:"x_MergeMt"}})),
    microtheory_statistics(x_A,overview,0,25,Reply),
    assertion(Reply.summary.state==stale),assertion(Reply.summary.freshness==stale),
    assertion(Reply.summary.counts.assertions==3),
    assertion(Reply.parents.total==1),assertion(Reply.children.total==1),
    assertion((member(Message,Reply.summary.messages),sub_string(Message,_,_,_,"Source context changed to MergeMt."))).

test(directory_projection_version_rejects_earlier_staleness_blind_results) :-
    assertion(\+kb_statistics:symbol_directory_result(_{predicateGrouping:symbol})),
    kb_statistics:projection_version(Version),
    assertion(kb_statistics:symbol_directory_result(_{predicateGrouping:symbol,projectionVersion:Version})).

variable_arity_rows([
    _{name:"x_<==",arity:2,headOccurrenceCount:1,declarationReferenceCount:0},
    _{name:"x_<==",arity:3,headOccurrenceCount:2,declarationReferenceCount:0},
    _{name:"x_<==",arity:null,headOccurrenceCount:0,declarationReferenceCount:1}]).

test(symbol_counts_group_all_arities_across_mts_and_directory_files,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    source('variable/a.kif',File),snapshot(File,Base),variable_arity_rows(Rows),
    Context=_{key:"x_TestMt",assertionCount:3,predicates:Rows},
    OtherContext=_{key:"x_OtherMt",assertionCount:4,predicates:[
      _{name:"x_<==",arity:2,headOccurrenceCount:4,declarationReferenceCount:0}]},
    Data=Base.put(_{counts:_{semanticAssertionCount:7},microtheories:[Context,OtherContext]}),
    save_snapshot(File,Data),atom_concat(File,'.inventory.json',Inventory),
    read_file_to_string(Inventory,Before,[]),
    source_statistics(['KBs/variable/a.kif'],Summary),Summary.items=[S],
    assertion(S.counts.predicateFunctions==1),
    source_statistics_detail('KBs/variable/a.kif',content,'',0,10,Content),
    forall(member(M,Content.items),assertion(M.predicateFunctions==1)),
    source_statistics_detail('KBs/variable/a.kif',predicates,'',0,10,Detail),
    assertion(Detail.total==1),Detail.items=[P],
    assertion(P.name=="x_<=="),assertion(P.arities==[2,3,null]),
    assertion(P.headOccurrenceCount==7),assertion(P.declarationReferenceCount==1),
    assertion(P.arityBreakdownTotal==4),assertion(\+get_dict(arityBreakdown,P,_)),
    source_predicate_arities('KBs/variable/a.kif','x_<==','',2,2,Breakdown),
    assertion(Breakdown.total==4),Breakdown.items=[Three,Unknown],
    assertion(Three.arity==3),assertion(Three.headOccurrenceCount==2),
    assertion(Unknown.arity==null),assertion(Unknown.declarationReferenceCount==1),
    source_predicate_arities('KBs/variable/a.kif','x_<==',x_TestMt,0,10,Scoped),
    assertion(Scoped.total==3),
    source('variable/nested/b.krf',Other),snapshot(Other,OtherBase),
    save_snapshot(Other,OtherBase.put(_{source:OtherBase.source.put(dialect,"krf"),
      microtheories:[OtherContext.put(_{assertionCount:3,predicates:[
        _{name:"x_<==",arity:4,headOccurrenceCount:3,declarationReferenceCount:0}]})]})),
    directory_statistics('KBs/variable','',Directory),
    assertion(Directory.counts.predicateFunctions==1),assertion(Directory.counts.assertions==10),
    assertion(Directory.coverage.totalFiles==2),
    read_file_to_string(Inventory,After,[]),assertion(Before==After).

test(mt_symbol_groups_retain_paginated_arity_occurrences,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    mt_fixture(_,Base),variable_arity_rows(Rows),
    append(Rows,[_{name:"x_fn",arity:1,headOccurrenceCount:0,declarationReferenceCount:1},
                 _{name:"x_fn",arity:null,headOccurrenceCount:0,declarationReferenceCount:2}],Predicates),
    save_mt('A.json',Base.put(predicates,Predicates)),
    microtheory_statistics(x_A,overview,0,10,Overview),
    assertion(Overview.summary.counts.predicateFunctions==2),
    microtheory_statistics(x_A,predicates,0,1,Detail),
    assertion(Detail.total==2),Detail.items=[P],assertion(P.name=="x_<=="),
    assertion(P.headOccurrenceCount==3),assertion(P.arityBreakdownTotal==3),
    microtheory_predicate_arities(x_A,'x_<==',1,1,Breakdown),
    assertion(Breakdown.total==3),Breakdown.items=[Row],
    assertion(Row.arity==3),assertion(Row.headOccurrenceCount==2),
    microtheory_predicate_arities(x_A,x_fn,0,10,Declarations),
    assertion(Declarations.total==2).

test(arity_breakdowns_are_bounded_and_unknown_counts_remain_unknown) :-
    findall(_{name:"x_<==",arity:N,headOccurrenceCount:1,declarationReferenceCount:0},
      between(1,120,N),Rows),
    kb_statistics:predicate_groups(Rows,Groups),
    kb_statistics:public_statistics_rows(predicates,Groups,[Public]),
    assertion(Public.arityCount==120),assertion(Public.arityBreakdownTotal==120),
    assertion(Public.arities==[1,2,3,4,5,6,7,8]),assertion(\+get_dict(arityBreakdown,Public,_)),
    assertion(\+get_dict(arity,Public,_)),
    Snapshot=_{summary:_{coverage:_{predicates:complete}},predicates:Groups},
    kb_statistics:mt_section_page(Snapshot,arities('x_<=='),100,10,Page),
    assertion(Page.total==120),length(Page.items,10),
    kb_statistics:predicate_groups([_{name:"x_p",arity:1,headOccurrenceCount:null,declarationReferenceCount:0},
      _{name:"x_p",arity:2,headOccurrenceCount:2,declarationReferenceCount:0}],[Unknown]),
    assertion(Unknown.headOccurrenceCount==null).

test(arity_detail_bounds,[throws(error(domain_error(statistics_pagination,_),_))]) :-
    source_predicate_arities('KBs/example.kif','x_<==','',0,101,_).
test(arity_symbol_required,[throws(error(domain_error(statistics_symbol,''),_))]) :-
    microtheory_predicate_arities(x_A,'',0,10,_).

catalog_file_node(Nodes,Path,File) :-
    member(Node,Nodes),
    (memberchk(Node.type,[file,"file"])->Node.path==Path,File=Node;
      catalog_file_node(Node.children,Path,File)).
artifact_fixture(File,Kind) :-
    cache_paths(File,Data,Index),(Kind==cached->Path=Data;Path=Index),
    file_directory_name(Path,Parent),make_directory_path(Parent),
    write_text(Path,":- throw(artifact_presence_must_not_execute_or_validate_this).\n").

test(catalog_file_states_are_independent_and_directory_coverage_counts_all_files,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    source('states/cached.kif',Cached),artifact_fixture(Cached,cached),
    source('states/indexed.krf',Indexed),artifact_fixture(Indexed,indexed),
    source('states/loaded.metta',Loaded),
    source('states/nested/both.meld',Both),artifact_fixture(Both,cached),artifact_fixture(Both,indexed),
    source('states/unknown.kif',Unknown),cache_paths(Unknown,NotRegular,_),make_directory(NotRegular),
    snapshot(Cached,Saved),save_snapshot(Cached,Saved),write_text(Cached,"(changed original fixture)\n"),
    setup_call_cleanup(
      (assertz(kb_store:source_info(Loaded,_{}),LoadedRef),assertz(kb_store:source_info(Both,_{}),BothRef)),
      (kb_store:generation(Before),kb_catalog:catalog(Catalog),
       assertion(Catalog.fileStates.cacheValidity==unchecked),
       assertion(Catalog.fileStates.indexValidity==unchecked),
       Catalog.nodes=[Directory],Coverage=Directory.stateCoverage,
       assertion(Coverage.total==5),assertion(Coverage.cached==2),
       assertion(Coverage.indexed==2),assertion(Coverage.loaded==2),
       assertion(Coverage.cachedUnknown==1),assertion(Coverage.indexedUnknown==0),
       once(catalog_file_node(Catalog.nodes,'KBs/states/cached.kif',C)),
       assertion(C.states.cached==true),assertion(C.states.indexed==false),assertion(C.states.loaded==false),
       once(catalog_file_node(Catalog.nodes,'KBs/states/indexed.krf',I)),
       assertion(I.states.cached==false),assertion(I.states.indexed==true),assertion(I.states.loaded==false),
       once(catalog_file_node(Catalog.nodes,'KBs/states/loaded.metta',L)),
       assertion(L.states.cached==false),assertion(L.states.indexed==false),assertion(L.states.loaded==true),
       once(catalog_file_node(Catalog.nodes,'KBs/states/nested/both.meld',B)),
       assertion(B.states.cached==true),assertion(B.states.indexed==true),assertion(B.states.loaded==true),
       source_statistics(['KBs/states/cached.kif'],Statistics),Statistics.items=[Stale],
       assertion(Stale.state==stale),assertion(C.states.cached==true),
       cache_paths(Loaded,MissingData,MissingIndex),
       assertion(\+exists_file(MissingData)),assertion(\+exists_file(MissingIndex)),
       kb_store:generation(After),assertion(Before==After)),
      (erase(LoadedRef),erase(BothRef))).

test(missing_partial_stale_and_cache_invalidation,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    source('facts.kif',File),
    source_statistics(['KBs/facts.kif'],Missing),Missing.items=[M],
    assertion(M.state==missing),assertion(M.counts.referencedMTs==null),
    snapshot(File,Data),del_dict(relationProjection,Data,_,Partial),save_snapshot(File,Partial),
    source_statistics(['KBs/facts.kif'],PartialReply),PartialReply.items=[P],
    assertion(P.state==partial),assertion(P.counts.referencedMTs==null),
    source_statistics_detail('KBs/facts.kif',references,'',0,10,Unavailable),
    assertion(Unavailable.total==null),
    save_snapshot(File,Data),source_statistics(['KBs/facts.kif'],Complete),Complete.items=[C],
    assertion(C.counts.referencedMTs==2),
    write_text(File,"(test fixture changed)\n"),
    source_statistics(['KBs/facts.kif'],Stale),Stale.items=[S],
    assertion(S.state==stale),assertion(S.counts.assertions==3).

test(dialect_is_recorded_not_remapped,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    source('facts.meld',File),snapshot(File,Base),
    C=_{key:"x_TestMt",assertionCount:3,predicates:[
      _{name:"x_instance",arity:2,headOccurrenceCount:3,declarationReferenceCount:0}]},
    Data=Base.put(_{source:Base.source.put(dialect,"krf"),microtheories:[C]}),
    save_snapshot(File,Data),
    source_statistics_detail('KBs/facts.meld',predicates,'',0,10,Reply),
    assertion(Reply.summary.dialect==meld),Reply.items=[P],assertion(P.name=="x_instance"),
    source('data.metta',Metta),snapshot(Metta,MBase),
    MC=C.put(predicates,[_{name:"x_=",arity:2}]),
    MData=MBase.put(_{source:MBase.source.put(dialect,"metta"),microtheories:[MC]}),
    save_snapshot(Metta,MData),source_statistics_detail('KBs/data.metta',predicates,'',0,10,MR),
    MR.items=[MP],assertion(MP.name=="x_="),
    assertion(\+current_predicate(kb_statistics:'x_='/2)).

test(malformed_and_wrong_schema_do_not_report_zero,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    source('facts.kif',File),atom_concat(File,'.inventory.json',Sidecar),
    write_text(Sidecar,"{\"schema\":\"powder.kb-inventory.v1\",\"compiled\":{\"bad\":[1,]},\"counts\":{}}"),
    source_statistics(['KBs/facts.kif'],Reply),Reply.items=[S],
    assertion(S.state==unavailable),assertion(S.counts.assertions==null),
    write_text(Sidecar,"{\"schema\":\"not-an-inventory\"}"),
    source_statistics(['KBs/facts.kif'],Other),Other.items=[O],assertion(O.state==unavailable).

test(unneeded_payload_is_skipped_and_not_retained,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    source('facts.kif',File),snapshot(File,Base),
    save_snapshot(File,Base.put(compiled,_{warnings:["text with } and \"quotes\""],body:"not Prolog code"})),
    kb_statistics:read_inventory(File,Read),
    assertion(\+get_dict(compiled,Read,_)),
    source_statistics(['KBs/facts.kif'],_),source_statistics(['KBs/facts.kif'],_),
    findall(S,kb_statistics:summary_cache(_,_,S,_),Cached),
    Cached=[Saved],assertion(\+get_dict(microtheories,Saved,_)).

test(statistics_do_not_check_semantic_shapes_or_replay_historical_warnings,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    source('unparsed.kif',File),
    write_text(File,"(deliberately unfinished source: statistics must not parse it\n"),
    snapshot(File,Base),artifact_fixture(File,cached),
    findall(_{kind:"normalized_semantic_shape",message:"historical-shape-warning"},
      between(1,1500,_),Warnings),
    Predicates=[_{name:"x_not",arity:3,headOccurrenceCount:1,declarationReferenceCount:0},
                _{name:"x_equals",arity:1,headOccurrenceCount:1,declarationReferenceCount:0},
                _{name:"x_and",arity:0,headOccurrenceCount:1,declarationReferenceCount:0}],
    Data=Base.put(_{microtheories:[_{key:"x_TestMt",assertionCount:3,predicates:Predicates}],
      compiled:_{warnings:Warnings},warnings:Warnings}),
    save_snapshot(File,Data),atom_concat(File,'.inventory.json',Inventory),
    read_file_to_string(File,BeforeSource,[]),read_file_to_string(Inventory,BeforeInventory,[]),
    kb_store:generation(Before),
    forall(between(1,2,_),
      (source_statistics(['KBs/unparsed.kif'],Reply),Reply.items=[Summary],
       assertion(Summary.state==snapshot),assertion(Summary.counts.predicateFunctions==3),
       length(Summary.messages,N),assertion(N<12),
       forall(member(Message,Summary.messages),assertion(\+sub_string(Message,_,_,_,"historical-shape-warning"))))),
    source_statistics_detail('KBs/unparsed.kif',predicates,'',0,10,Detail),
    findall(Name-Arity,(member(P,Detail.items),Name=P.name,Arity=P.arity),Shapes),
    assertion(Shapes==["x_and"-0,"x_equals"-1,"x_not"-3]),
    assertion(\+current_predicate(kb_statistics:x_not/3)),
    kb_store:generation(After),assertion(Before==After),
    read_file_to_string(File,AfterSource,[]),read_file_to_string(Inventory,AfterInventory,[]),
    assertion(BeforeSource==AfterSource),assertion(BeforeInventory==AfterInventory).

test(incomplete_contexts_are_lower_bounds,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    source('facts.kif',File),snapshot(File,Base),
    save_snapshot(File,Base.put(microtheories,[])),
    source_statistics(['KBs/facts.kif'],Reply),Reply.items=[Summary],
    assertion(Summary.state==partial),assertion(Summary.coverage.content==partial).
test(summary_retention_is_bounded,
     [cleanup(retractall(kb_statistics:summary_cache(_,_,_,_)))]) :-
    forall(between(1,257,N),
      (format(atom(Path),'fixture-~d',[N]),kb_statistics:remember_summary(Path,N,_{state:snapshot}))),
    aggregate_all(count,kb_statistics:summary_cache(_,_,_,_),Count),
    assertion(Count==256).

test(batch_limit,[throws(error(domain_error(statistics_batch_limit(16),17),_))]) :-
    length(Paths,17),maplist(=('KBs/facts.kif'),Paths),source_statistics(Paths,_).
test(reject_json_path,[throws(error(permission_error(access,kb_source,_),_))]) :-
    source_statistics(['KBs/facts.kif.inventory.json'],_).
test(reject_traversal,[throws(error(permission_error(access,kb_source,_),_))]) :-
    source_statistics(['KBs/../private.kif'],_).
test(detail_bounds,[throws(error(domain_error(statistics_pagination,_),_))]) :-
    source_statistics_detail('KBs/facts.kif',content,'',0,101,_).
test(unknown_section,[throws(error(domain_error(statistics_section,execute),_))]) :-
    source_statistics_detail('KBs/facts.kif',execute,'',0,10,_).

test(mt_hierarchy_uses_catalog_keys_and_separates_reference_files,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    mt_fixture(Compound,_),
    microtheory_statistics(x_A,overview,0,1,R),
    assertion(R.summary.state==snapshot),assertion(R.summary.counts.contentFiles==1),
    assertion(R.summary.counts.referencedOnlyFiles==1),assertion(R.summary.counts.predicateFunctions==2),
    assertion(R.summary.generatedAt==null),assertion(R.summary.freshness==unverified),
    R.parents.items=[Parent],assertion(Parent.mt==x_B),
    R.children.items=[Child],atom_string(Child.mt,Compound),
    microtheory_statistics(x_A,files,0,25,Files),
    Files.items=[Content,Reference],assertion(Content.role==content),assertion(Reference.role==referenced_only),
    assertion(Reference.path=='KBs/reference.krf'),
    kb_server:action(mt_statistics,[search([mt=Compound,section=predicates,offset='1',limit='1'])],Detail),
    assertion(Detail.total==2),assertion(Detail.items=[_]),
    assertion(Detail.summary.mtExpression.type==application),
    microtheory_statistics(x_B,overview,0,10,Cycle),
    Cycle.children.items=[Back],assertion(Back.mt==x_A).

test(mt_missing_partial_and_refresh_are_honest,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    microtheory_statistics(x_A,overview,0,25,Missing),
    assertion(Missing.summary.state==missing),assertion(Missing.parents.total==null),
    mt_fixture(_,Data),
    del_dict(referencedInFiles,Data,_,Partial),save_mt('A.json',Partial),
    microtheory_statistics(x_A,overview,0,25,First),
    assertion(First.summary.state==partial),assertion(First.summary.counts.referencedOnlyFiles==null),
    save_mt('A.json',Data),
    microtheory_statistics(x_A,overview,0,25,After),assertion(After.summary.state==snapshot),
    save_mt('A.json',Data.put(status,"partial")),
    microtheory_statistics(x_A,overview,0,25,RecordedPartial),assertion(RecordedPartial.summary.state==partial),
    save_mt('A.json',Data.put(key,"x_NotA")),
    microtheory_statistics(x_A,overview,0,25,Wrong),assertion(Wrong.summary.state==unavailable).

test(mt_catalog_does_not_allow_arbitrary_json_paths,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    save_mt('_catalog.json',_{schema:"powder.kb-inventory.v1",type:"microtheory_catalog",
      entries:[_{key:"x_A",filename:"../private.json",label:"A",assertionCount:0}]}),
    microtheory_statistics(x_A,overview,0,10,R),assertion(R.summary.state==unavailable),
    assertion(R.summary.counts.assertions==null).
test(mt_detail_limit,[throws(error(domain_error(statistics_pagination,_),_))]) :-
    microtheory_statistics(x_A,files,0,101,_).
test(mt_invalid_section,[throws(error(domain_error(mt_statistics_section,execute),_))]) :-
    microtheory_statistics(x_A,execute,0,10,_).

test(directory_unions_all_descendants_without_counting_nested_files_twice,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    source('group/a.kif',A),snapshot(A,AD),save_snapshot(A,AD),
    source('group/nested/b.krf',B),snapshot(B,BD),
    BD.microtheories=[Context,Empty],
    append(Context.predicates,[_{name:"x_otherFn",arity:1},
      _{name:"x_isa",arity:3},_{name:"x_aFn",arity:1}],Predicates),
    append(BD.mtRelationAssertions,[_{arg1:"x_OtherMt",arg2:"x_ExtraMt",predicate:"x_genlMt"}],References),
    save_snapshot(B,BD.put(_{source:BD.source.put(dialect,"krf"),
      microtheories:[Context.put(predicates,Predicates),Empty],mtRelationAssertions:References})),
    source('group/nested/missing.metta',_),
    directory_statistics('KBs/group','',R),
    assertion(R.done==true),assertion(R.state==partial),
    assertion(R.coverage.totalFiles==3),assertion(R.coverage.processedFiles==3),
    assertion(R.coverage.missingFiles==1),assertion(R.coverage.assertionFiles==2),
    assertion(R.counts.assertions==6),assertion(R.counts.contentMTs==1),
    assertion(R.counts.referencedMTs==3),assertion(R.counts.predicateFunctions==3),
    directory_statistics('KBs/group/nested','',Child),
    assertion(Child.coverage.totalFiles==2),assertion(Child.counts.assertions==3),
    write_text(A,"(source changed since snapshot)\n"),
    save_snapshot(B,BD.put(_{source:BD.source.put(dialect,"krf"),status:"partial"})),
    directory_statistics('KBs/group','',Historical),
    assertion(Historical.coverage.staleFiles==1),assertion(Historical.coverage.partialFiles==1),
    assertion(Historical.coverage.missingFiles==1),assertion(Historical.state==partial).

test(directory_batches_resume_once_and_recheck_the_manifest,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    forall(between(1,17,N),(format(atom(Name),'batch/f~|~`0t~d~2+.kif',[N]),
      source(Name,File),snapshot(File,Data),save_snapshot(File,Data))),
    directory_statistics('KBs/batch','',First),
    assertion(First.done==false),assertion(First.coverage.processedFiles==16),
    assertion(First.counts.assertions==48),
    directory_statistics('KBs/batch',First.token,Final),
    assertion(Final.done==true),assertion(Final.state==snapshot),
    assertion(Final.coverage.processedFiles==17),assertion(Final.counts.assertions==51),
    assertion(Final.counts.contentMTs==1),assertion(Final.counts.predicateFunctions==2),
    directory_statistics('KBs/batch','',Cached),assertion(Cached.token==Final.token),
    source('batch/new.kif',New),snapshot(New,NewData),save_snapshot(New,NewData),
    directory_statistics('KBs/batch','',Changed),assertion(Changed.token\==Final.token),
    kb_root(Root),directory_file_path(Root,'batch/f01.kif',Old),write_text(Old,"(changed fixture)\n"),
    directory_statistics('KBs/batch',Changed.token,Interrupted),
    assertion(Interrupted.done==true),assertion(Interrupted.coverage.manifestChanged==true),
    assertion(Interrupted.state==partial).

test(directory_unknown_coverage_and_empty_directory_are_distinct,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    source('missing/file.kif',_),
    directory_statistics('KBs/missing','',Missing),
    assertion(Missing.counts.assertions==null),assertion(Missing.counts.referencedMTs==null),
    kb_root(Root),directory_file_path(Root,empty,Empty),make_directory(Empty),
    directory_statistics('KBs/empty','',Zero),
    assertion(Zero.state==snapshot),assertion(Zero.coverage.totalFiles==0),assertion(Zero.counts.assertions==0).
test(directory_traversal_rejected,[throws(error(permission_error(access,kb_directory,_),_))]) :-
    directory_statistics('KBs/../prolog','',_).
test(directory_cursor_is_bound_to_path,
     [setup(setup_statistics),cleanup(cleanup_statistics),
      throws(error(domain_error(directory_statistics_cursor,_),_))]) :-
    source('group/file.kif',_),directory_statistics('KBs/group','',R),
    directory_statistics('KBs/other',R.token,_).

statistics_url(Port,Relative,URL) :-
    api_path(Relative,Path),mount_url(Port,Path,URL).
mount_url(Port,Path,URL) :- format(atom(URL),'http://127.0.0.1:~d~w',[Port,Path]).
copy_mount_assets :-
    fixture(_,Original),app_dir(App),
    directory_file_path(Original,web,OldWeb),directory_file_path(App,web,Web),make_directory_path(Web),
    directory_files(OldWeb,Names),
    forall((member(Name,Names),kb_server:web_name(Name)),
      (directory_file_path(OldWeb,Name,Old),directory_file_path(Web,Name,Copy),copy_file(Old,Copy))),
    directory_file_path(App,docs,Docs),make_directory_path(Docs),
    directory_file_path(Original,'docs/sumo-cycl-mapping.md',Mapping),
    directory_file_path(Docs,'sumo-cycl-mapping.md',MappingCopy),copy_file(Mapping,MappingCopy).
mount_response(Port,Path,Code,Type,Cache,Location,Text) :-
    mount_url(Port,Path,URL),
    setup_call_cleanup(http_open(URL,S,[redirect(false),status_code(Code),header(content_type,Type),
      header(cache_control,Cache),header(location,Location)]),read_string(S,_,Text),close(S)).
outside_mount(_) :- format('Content-type: text/plain~n~noutside app mount').
mount_smoke(Port) :-
    app_base(Base),app_mount(Mount),assertion(Base=='/swish/openworld_dr/'),
    mount_response(Port,Mount,Redirect,_,_,Location,_),
    assertion(redirect(Mount,Redirect)==redirect(Mount,301)),assertion(Location==Base),
    mount_response(Port,'/',RootRedirect,_,_,RootLocation,_),
    assertion(redirect('/',RootRedirect)==redirect('/',301)),assertion(RootLocation==Base),
    mount_response(Port,Base,HomeStatus,HomeType,HomeCache,_,HTML),
    assertion(HomeStatus==200),assertion(sub_atom(HomeType,_,_,_,'text/html')),
    assertion(sub_atom(HomeCache,_,_,_,'no-store')),
    assertion(sub_string(HTML,_,_,_,'href="style.css"')),
    assertion(sub_string(HTML,_,_,_,'src="app.js"')),
    forall(member(Name-Mime,['style.css'-'text/css','app.js'-'application/javascript',
      'render.js'-'application/javascript','source-files.js'-'application/javascript','paths.js'-'application/javascript',
      'paths.json'-'application/json','settings.json'-'application/json']),
      (app_path(Name,Path),mount_response(Port,Path,Code,Type,Cache,_,Body),
       assertion(Code==200),assertion(sub_atom(Type,_,_,_,Mime)),
       assertion(sub_atom(Cache,_,_,_,'no-store')),assertion(Body\==""))),
    forall(member(Outside,['/swish','/swish/','/api/status','/style.css',
      '/swish/powder/','/swish/not-this-app/api/status','/swish/openworld_dr-other/']),
      (mount_response(Port,Outside,Missing,_,_,_,_),assertion(Missing==404))),
    setup_call_cleanup(
      kb_server:register_legacy_entry('/swish/powder-test-legacy/',ow_mount_test_legacy),
      (mount_response(Port,'/swish/powder-test-legacy/',OldStatus,_,_,OldLocation,_),
       assertion(OldStatus==301),assertion(OldLocation==Base)),
      ignore(http_dispatch:http_delete_handler(id(ow_mount_test_legacy)))),
    forall(member(Relative,[api,'api/','api/missing','api/status/no-such-route']),
      (app_path(Relative,MissingAPI),mount_response(Port,MissingAPI,NotFound,ErrorType,_,ErrorLocation,ErrorBody),
       assertion(NotFound==404),assertion(sub_atom(ErrorType,_,_,_,'application/json')),
       assertion(ErrorLocation\==Base),atom_json_dict(ErrorBody,Error,[]),
       assertion(Error.error.code=="not_found"))),
    forall(member(Asset,['missing.css','missing.js','nested/missing.js']),
      (app_path(Asset,MissingAsset),mount_response(Port,MissingAsset,AssetStatus,_,_,AssetLocation,AssetBody),
       assertion(AssetStatus==404),assertion(AssetLocation\==Base),
       assertion(\+sub_string(AssetBody,_,_,_,'class="app-shell"')))),
    setup_call_cleanup(
      (http_dispatch:http_handler('/',plunit_ow_statistics:outside_mount,[prefix,id(ow_mount_test_root)]),
       http_dispatch:http_handler('/swish/',plunit_ow_statistics:outside_mount,[prefix,id(ow_mount_test_swish)]),
       http_dispatch:http_handler('/swish/sibling/',plunit_ow_statistics:outside_mount,[id(ow_mount_test_sibling)])),
      (forall(member(Other,['/','/swish/','/swish/sibling/']),
         (mount_response(Port,Other,OK,_,_,_,Text),assertion(OK==200),assertion(Text=="outside app mount"))),
       kb_server:register_mount_redirect,
       mount_response(Port,'/',ExistingRootStatus,_,_,_,ExistingRoot),
       assertion(ExistingRootStatus==200),assertion(ExistingRoot=="outside app mount"),
       app_path('style.css',Style),mount_response(Port,Style,StyleOK,_,_,_,_),assertion(StyleOK==200)),
      (forall(member(Id,[ow_mount_test_root,ow_mount_test_swish,ow_mount_test_sibling]),
         ignore(http_dispatch:http_delete_handler(id(Id)))),
       kb_server:register_mount_redirect)),
    mount_response(Port,'/',RestoredRedirect,_,_,RestoredLocation,_),
    assertion(redirect(restored_root,RestoredRedirect)==redirect(restored_root,301)),assertion(RestoredLocation==Base).

test(mount_reload_uses_shared_config_without_reloading_the_kb,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    copy_mount_assets,app_dir(App),directory_file_path(App,'web/paths.json',Config),
    read_file_to_string(Config,Original,[]),kb_store:generation(Before),
    setup_call_cleanup(tcp_socket(Socket),tcp_bind(Socket,Port),tcp_close_socket(Socket)),
    setup_call_cleanup(kb_server:start_server(Port),
      (write_text(Config,"{\"appBase\":\"/swish/powder-mount-test/\"}"),kb_server:register_mount_redirect,
       mount_response(Port,'/swish/powder-mount-test/',OldOK,_,_,_,_),assertion(OldOK==200),
       mount_response(Port,'/swish/powder-mount-test/api/status',OldAPI,_,_,_,_),assertion(OldAPI==200),
       write_text(Config,Original),kb_server:register_mount_redirect,
       app_base(Base),api_path(status,StatusPath),
       assertion(Base=='/swish/openworld_dr/'),
       mount_response(Port,Base,NewOK,_,_,_,_),assertion(NewOK==200),
       mount_response(Port,StatusPath,NewAPI,_,_,_,JSON),assertion(NewAPI==200),
       atom_json_dict(JSON,Status,[]),assertion(Status.generation==Before),
       mount_response(Port,'/swish/powder-mount-test/api/status',Gone,_,_,_,_),assertion(Gone==404),
       mount_response(Port,'/swish/powder-mount-test/',Removed,_,_,_,_),assertion(Removed==404),
       kb_store:generation(After),assertion(After==Before)),
      (write_text(Config,Original),kb_server:register_mount_redirect,kb_server:stop_server)).

test(real_http_routes_read_snapshots_without_loading_sources,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    source('facts.kif',File),snapshot(File,Data),save_snapshot(File,Data),mt_fixture(_,_),copy_mount_assets,
    setup_call_cleanup(tcp_socket(Socket),tcp_bind(Socket,Port),tcp_close_socket(Socket)),
    kb_store:generation(Before),
    setup_call_cleanup(kb_server:start_server(Port),
      (mount_smoke(Port),
       statistics_url(Port,'kb/statistics?paths=%5B%22KBs%2Ffacts.kif%22%5D',URL),
       http_get(URL,Reply,[json_object(dict)]),
       Reply.items=[Summary],assertion(Summary.counts.contentMTs==1),
       statistics_url(Port,'kb/catalog',CatalogURL),
       http_get(CatalogURL,Catalog,[json_object(dict)]),
       assertion(Catalog.fileStates.cacheValidity=="unchecked"),
       once(catalog_file_node(Catalog.nodes,"KBs/facts.kif",CatalogFile)),
       assertion(CatalogFile.states.cached==false),assertion(CatalogFile.states.indexed==false),
       statistics_url(Port,'kb/statistics/detail?path=KBs%2Ffacts.kif&section=predicates&limit=1',DetailURL),
       http_get(DetailURL,Detail,[json_object(dict)]),
       assertion(Detail.total==2),assertion(Detail.items=[_]),
       statistics_url(Port,'kb/statistics/arities?path=KBs%2Ffacts.kif&symbol=x_isa&limit=1',ArityURL),
       http_get(ArityURL,ArityDetail,[json_object(dict)]),
       assertion(ArityDetail.total==1),ArityDetail.items=[Arity],assertion(Arity.arity==2),
       statistics_url(Port,'microtheory/statistics?mt=x_A',MtURL),
       http_get(MtURL,MT,[json_object(dict)]),assertion(MT.summary.counts.contentFiles==1),
       statistics_url(Port,'microtheory/statistics/arities?mt=x_A&symbol=x_isa&limit=1',MtArityURL),
       http_get(MtArityURL,MTArity,[json_object(dict)]),assertion(MTArity.total==1),
       statistics_url(Port,'kb/statistics/directory?path=KBs',DirectoryURL),
       http_get(DirectoryURL,Directory,[json_object(dict)]),assertion(Directory.coverage.totalFiles==3),
       statistics_url(Port,'source?path=KBs%2Ffacts.kif&line=1',SourceURL),
       http_get(SourceURL,Excerpt,[json_object(dict)]),assertion(Excerpt.line==1),assertion(Excerpt.lines\==[]),
       statistics_url(Port,status,StatusURL),http_get(StatusURL,Status,[json_object(dict)]),
       assertion(Status.generation==Before),
       statistics_url(Port,version,VersionURL),http_get(VersionURL,Version,[json_object(dict)]),
       assertion(string_length(Version.version,64)),
       kb_store:generation(After),assertion(Before==After)),
      kb_server:stop_server).
dependency_fixture(Source,Cache) :-
    source('Expected.kif',Source),write_text(Source,"NOT VALID SOURCE SYNTAX ((("),
    cache_paths(Source,Cache,_),file_directory_name(Cache,Directory),make_directory_path(Directory),
    kb_cache:file_digest(Source,Hash),size_file(Source,Size),kb_cache:converter_version(Version),
    Header=cache{source:Source,sourceHash:Hash,dialect:kif,mappingHash:none,options:[],
      converter:Version,mtPolicy:filename_v1,implementationHash:Hash,lineCount:1,sizeBytes:Size,warnings:[]},
    Terms=[x_implies(x_antecedent(X),x_defined(X)),x_arg2Isa(x_declared,x_Thing),
           x_ordinary(x_value),x_genlMt(x_ExpectedMt,x_ExternalMt)],
    findall(record(Id,Term,Metadata),
      (nth1(N,Terms,Term),format(atom(Id),'a~16r',[N]),term_variables(Term,Variables),
       (Variables=[]->Names=[];Names=["?X"]),
       Metadata=[xc_microtheory(Id,x_ExpectedMt),xc_source_file(Id,Source),
                 xc_source_line(Id,N),xc_kb_names(Id,Names)]),Records),
    kb_cache:write_cache(Cache,Header,Records,_).

test(dependency_api_reads_data_only_with_separate_providers_and_paging,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    dependency_fixture(Source,Cache),
    kb_cache:file_digest(Source,Before),kb_cache:file_digest(Cache,CacheBefore),kb_store:generation(G),
    kb_server:action(dependencies,[search([path='KBs/Expected.kif',section=summary])],Overview),
    assertion(Overview.summary.status==partial),
    assertion(Overview.summary.counts.defined==1),assertion(Overview.summary.counts.declared==1),
    assertion(Overview.summary.counts.provided_mts==1),assertion(Overview.summary.counts.outbound_mts==1),
    assertion(Overview.summary.impliedMT.status==present),
    assertion(Overview.summary.impliedMT.contentAssertions==4),
    source_dependencies('KBs/Expected.kif',defined,0,1,Definitions),
    Definitions.items=[Defined],assertion(Defined.symbol==x_defined),assertion(Defined.arities==[1]),
    Defined.evidence=[Evidence],assertion(Evidence.variableNames==["?X"]),
    source_dependencies('KBs/Expected.kif',declared,0,1,Declarations),
    Declarations.items=[Declared],assertion(Declared.symbol==x_declared),
    source_dependencies('KBs/Expected.kif',outbound_predicates,0,100,Outbound),
    assertion((member(Fact,Outbound.items),get_dict(symbol,Fact,x_ordinary))),
    assertion(\+ (member(Local,Outbound.items),get_dict(symbol,Local,x_defined))),
    source_dependencies('KBs/Expected.kif',defined,1,1,Next),assertion(Next.items==[]),assertion(Next.total==1),
    kb_cache:file_digest(Source,After),kb_cache:file_digest(Cache,CacheAfter),
    assertion(After==Before),assertion(CacheAfter==CacheBefore),kb_store:generation(AfterG),assertion(AfterG==G),
    cache_paths(Source,_,Index),assertion(\+exists_file(Index)),assertion(\+kb_store:source_info(Source,_)).
test(dependency_api_missing_invalid_and_unsafe_are_unknown_not_empty,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    source('absent.krf',Source),
    source_dependencies('KBs/absent.krf',defined,0,25,Missing),
    assertion(Missing.total==null),assertion(Missing.summary.counts.defined==null),
    cache_paths(Source,Cache,_),file_directory_name(Cache,Directory),make_directory_path(Directory),
    make_directory(Cache),
    source_dependencies('KBs/absent.krf',declared,0,25,Unsafe),
    assertion(Unsafe.summary.status==unavailable),assertion(Unsafe.total==null),
    delete_directory(Cache),write_text(Cache,":- throw(never_execute).\n"),
    source_dependencies('KBs/absent.krf',defined,0,25,Invalid),
    assertion(Invalid.summary.status==unavailable),assertion(Invalid.total==null).
test(dependency_api_bounds,[throws(error(domain_error(statistics_pagination,_),_))]) :-
    source_dependencies('KBs/a.kif',defined,0,101,_).
test(dependency_api_rejects_cache_paths,[throws(error(permission_error(access,kb_source,_),_))]) :-
    source_dependencies('KBs/a.kif.data',defined,0,25,_).
test(file_information_is_bounded,[throws(error(domain_error(file_information_batch,_),_))]) :-
    length(Paths,17),maplist(=('KBs/file.kif'),Paths),kb_catalog:file_information(Paths,_).
test(file_information_rejects_json,[throws(error(permission_error(access,kb_source,_),_))]) :-
    kb_catalog:file_information(['KBs/microtheory/_catalog.json'],_).
test(startup_configuration_and_initial_manifest_remain_independent,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    source('initial.kif',Initial),source('later.metta',Later),
    fixture_configuration([Later]),
    artifact_fixture(Initial,cached),artifact_fixture(Later,indexed),
    atom_concat(Initial,'.inventory.json',Inventory),write_text(Inventory,"Not JSON; badges must not read or repair this."),
    setup_call_cleanup(
      (assertz(kb_store:source_info(Initial,_{count:2,warnings:[recorded_warning]}),Ref),
       assertz(kb_store:assertion(state_fixture,_{source:'KBs/initial.kif',line:1,notices:[],
         warnings:["old warning"],errors:["old error"]}),ARef),
       assertz(kb_store:assertion(state_fixture_2,_{source:"KBs/initial.kif",line:2,notices:["not a warning"],
         warnings:[],errors:[],comments:[comment(2,1,"not a diagnostic")]}),ARef2)),
      (kb_catalog:remember_startup_sources,
       kb_catalog:file_information(['KBs/initial.kif','KBs/later.metta','KBs/initial.kif'],Reply),
       Reply.items=[First,Second],assertion(First.states.startup==false),assertion(First.states.loaded==true),
       assertion(Reply.startup.initial.paths==['KBs/initial.kif']),
       assertion(First.states.cached==true),assertion(First.states.indexed==false),
       assertion(First.diagnostics.warnings==2),assertion(First.diagnostics.errors==1),
       size_file(Initial,Bytes),assertion(First.sizeBytes==Bytes),
       assertion(Second.states.startup==true),assertion(Second.states.loaded==false),
       assertion(Second.states.cached==false),assertion(Second.states.indexed==true),
       assertion(Second.diagnostics.warnings==null),assertion(Second.diagnostics.errors==null),
       erase(Ref),
       setup_call_cleanup(assertz(kb_store:source_info(Later,_{count:0,warnings:[]}),LaterRef),
         (kb_catalog:remember_startup_sources,
          kb_catalog:file_information(['KBs/initial.kif','KBs/later.metta'],Changed),
          Changed.items=[Old,New],assertion(Old.states.startup==false),assertion(Old.states.loaded==false),
          assertion(New.states.startup==true),assertion(New.states.loaded==true),
          assertion(Changed.startup.initial.paths==['KBs/initial.kif'])),
         erase(LaterRef)),
       read_file_to_string(Inventory,Untouched,[]),assertion(Untouched=="Not JSON; badges must not read or repair this.")),
      (ignore(catch(erase(Ref),_,true)),erase(ARef),erase(ARef2))).
test(all_owned_ports_accept_only_exact_loopback_origins,
     [setup(setup_statistics),cleanup(cleanup_statistics)]) :-
    source('http.kif',Source),write_text(Source,"Not source syntax ("),
    artifact_fixture(Source,indexed),
    setup_call_cleanup(tcp_socket(A),tcp_bind(A,First),tcp_close_socket(A)),
    setup_call_cleanup(tcp_socket(B),tcp_bind(B,Second),tcp_close_socket(B)),
    assertion(First=\=Second),
    setup_call_cleanup((kb_server:start_server(First),kb_server:start_server(Second)),
      (statistics_url(Second,'kb/file-info?paths=%5B%22KBs%2Fhttp.kif%22%5D',InformationURL),
       http_get(InformationURL,Information,[json_object(dict)]),Information.items=[File],
       assertion(File.states.cached==false),assertion(File.states.indexed==true),
       assertion(File.states.loaded==false),
       (Information.startup.known==true->assertion(File.states.startup==false);assertion(File.states.startup==null)),
       assertion(File.diagnostics.errors==null),size_file(Source,Bytes),assertion(File.sizeBytes==Bytes),
       statistics_url(Second,'kb/dependencies?path=KBs%2Fhttp.kif',DependenciesURL),
       http_get(DependenciesURL,Dependencies,[json_object(dict)]),
       assertion(Dependencies.summary.status=="unavailable"),
       assertion(Dependencies.summary.counts.defined==null),
       forall((member(Port,[First,Second]),member(Host,[localhost,'127.0.0.1'])),
         (format(atom(Origin),'http://~w:~d',[Host,Port]),
          statistics_url(Port,status,URL),http_get(URL,Reply,[json_object(dict),status_code(Code),request_header('Origin'=Origin)]),
          assertion(Code==200),
          assertion(is_dict(Reply)),assertion(\+get_dict(error,Reply,_)))),
       forall(member(Origin,['http://localhost:1','http://localhost.evil:3050','https://localhost:3050',
                             'null','http://127.0.0.1:3050@evil.test']),
         (statistics_url(Second,status,URL),
          http_get(URL,Reply,[json_object(dict),status_code(Code),request_header('Origin'=Origin)]),
          assertion(Code==403),assertion(Reply.error.code=="forbidden")))),
      kb_server:stop_server).
:- end_tests(ow_statistics).
