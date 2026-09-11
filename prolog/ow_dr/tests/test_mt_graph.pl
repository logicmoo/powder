:- begin_tests(mt_graph).
:- use_module('../kb_mt_graph').
:- use_module('../kb_store',[]).
:- use_module('../kb_runtime',[]).
:- use_module('../kb_cache',[write_cache/4,file_digest/2,converter_version/1]).
:- use_module('../kb_paths').
:- use_module(library(filesex)).
:- use_module(library(http/json)).
:- use_module(library(uuid)).

row(N,Semantic,Context,loaded(Id,Semantic,Context,Evidence)) :-
    format(atom(Id),'a~16r',[N]),
    Evidence=evidence{source:'KBs/current.krf',originalSource:'KBs/original.krf',line:N}.
rows(Terms,Rows) :- rows(Terms,1,Rows).
rows([],_,[]).
rows([Semantic|Terms],N,[Row|Rows]) :-
    row(N,Semantic,x_ContextMt,Row),Next is N+1,rows(Terms,Next,Rows).
graph(Terms,Graph) :-
    rows(Terms,Rows),analyze_inheritance(7,Rows,Graph),assertion(ground(Graph)),
    with_output_to(string(_),json_write_dict(current_output,Graph)).
node(Graph,Key,Node) :- member(Node,Graph.nodes),Node.key==Key,!.
edge(Graph,Child,Parent,Edge) :- member(Edge,Graph.edges),Edge.child==Child,Edge.parent==Parent,!.
keys(Graph,Keys) :- findall(Key,(member(N,Graph.nodes),Key=N.key),Keys).

test(direction_is_child_inherits_from_parent) :-
    graph([x_genlMt(x_Child,x_Parent)],G),
    edge(G,x_Child,x_Parent,E),
    assertion(E.relation==inheritsFrom),assertion(E.inverseRelation==inheritedBy),
    node(G,x_Child,C),assertion(C.inheritsFrom==[x_Parent]),assertion(C.inheritedBy==[]),
    node(G,x_Parent,P),assertion(P.inheritedBy==[x_Child]),assertion(P.inheritsFrom==[]),
    assertion(G.roots==[x_ContextMt,x_Parent]).
test(multiple_parents_and_duplicate_occurrence_evidence_are_preserved) :-
    graph([x_genlMt(x_Child,x_A),x_genlMt(x_Child,x_B),x_genlMt(x_Child,x_A)],G),
    node(G,x_Child,C),assertion(C.inheritsFrom==[x_A,x_B]),
    edge(G,x_Child,x_A,E),assertion(E.evidenceCount==2),
    assertion(E.assertionIds==[a1,a3]),assertion(G.counts.edges==2),
    assertion(G.counts.positiveInheritanceAssertions==3).
test(isolated_actual_context_is_included_without_filename_fallback) :-
    row(1,x_p(x_OnlyMentionedMt),x_IsolatedMt,R),
    analyze_inheritance(3,[R],G),keys(G,[x_IsolatedMt]),
    node(G,x_IsolatedMt,N),assertion(N.hasContent==true),assertion(N.referenced==false),
    assertion(N.assertionCount==1),assertion(N.sourceCount==1),
    assertion(G.roots==[x_IsolatedMt]),assertion(G.entrypoints==[x_IsolatedMt]),
    assertion(G.counts.isolatedNodes==1).
test(referenced_ancestors_and_children_do_not_gain_content_counts) :-
    graph([x_genlMt(x_Child,x_Ancestor)],G),
    node(G,x_Ancestor,A),node(G,x_Child,C),
    forall(member(N,[A,C]),(assertion(N.hasContent==false),assertion(N.referencedOnly==true),
                           assertion(N.assertionCount==0),assertion(N.sourceCount==0))),
    assertion(A.referenceAssertionCount==1),assertion(A.referenceSourceCount==1),
    assertion(A.referenceFileRefs\==[]),assertion(G.counts.referencedOnlyNodes==2).
test(content_and_relation_reference_flags_can_both_be_true) :-
    row(1,x_genlMt(x_Child,x_Parent),x_Child,R),
    analyze_inheritance(1,[R],G),node(G,x_Child,N),
    assertion(N.hasContent==true),assertion(N.referenced==true),
    assertion(N.referencedOnly==false),assertion(N.assertionCount==1).
test(compound_context_keys_labels_and_shared_renderer_ast_are_preserved) :-
    Child=x_MtFn(x_Project,x_DateFn(2026)),Parent=x_ParentFn("A \"quoted\" context"),
    row(1,x_genlMt(Child,Parent),Child,R),analyze_inheritance(8,[R],G),
    kb_terms:context_key(Child,CKey),kb_terms:context_key(Parent,PKey),
    edge(G,CKey,PKey,_),node(G,CKey,C),node(G,PKey,P),
    assertion(C.label=="(MtFn Project (DateFn 2026))"),
    assertion(C.expression.type==application),
    assertion(C.expression.head.value==x_MtFn),
    assertion(P.expression.args=[json{type:string,value:"A \"quoted\" context"}]),
    assertion(ground(G)).
test(higher_order_compound_context_label_hides_the_structural_application_wrapper) :-
    Context=t(x_MtConstructor(x_A),x_B),
    row(1,x_p,Context,R),analyze_inheritance(1,[R],G),G.nodes=[Node],
    assertion(Node.label=="((MtConstructor A) B)"),
    assertion(Node.expression.head.type==application),
    assertion(Node.expression.head.head.value==x_MtConstructor).
test(negative_quoted_implications_rules_and_mentions_never_create_edges) :-
    Terms=[x_not(x_genlMt(x_Negative,x_NegParent)),
           x_quote(x_genlMt(x_Quoted,x_QuoteParent)),
           x_implies(x_p,x_genlMt(x_Consequent,x_ConclusionParent)),
           'x_=>'(x_genlMt(x_Antecedent,x_AntecedentParent),x_q),
           x_equiv(x_genlMt(x_Equivalent,x_Other),x_p),
           (x_genlMt(x_RuleHead,x_RuleParent):-and(throw(must_never_run))),
           x_p(x_genlMt(x_Nested,x_NestedParent)),
           x_comment(x_CommentMt,"(genlMt TextMt OtherMt)"),
           x_and(x_genlMt(x_Grouped,x_GroupParent),x_p),
           x_forAll(X,x_genlMt(X,x_Quantified)),
           metta_exec(x_genlMt(x_Inert,x_Parent))],
    graph(Terms,G),assertion(G.edges==[]),keys(G,[x_ContextMt]),
    assertion(G.coverage.status==complete),assertion(var(X)),
    assertion(G.counts.excluded.otherAssertions==11).
test(negative_counterassertion_does_not_erase_positive_asserted_evidence) :-
    graph([x_genlMt(x_A,x_B),x_not(x_genlMt(x_A,x_B))],G),
    edge(G,x_A,x_B,E),assertion(E.assertionIds==[a1]),assertion(E.evidenceCount==1),
    E.evidence=[Evidence],assertion(Evidence.assertingMicrotheory==x_ContextMt).
test(nonground_inheritance_is_not_instantiated_or_used) :-
    graph([x_genlMt(X,x_Parent),x_genlMt(x_Child,x_ContextFn(Y))],G),
    assertion(var(X)),assertion(var(Y)),assertion(G.edges==[]),
    assertion(G.counts.excluded.nongroundInheritance==2),
    assertion(G.coverage.status==complete).
test(rootless_cycle_has_an_entrypoint_and_all_edges) :-
    graph([x_genlMt(x_A,x_B),x_genlMt(x_B,x_A),x_genlMt(x_Leaf,x_A)],G),
    assertion(G.roots==[x_ContextMt]),assertion(G.entrypoints==[x_A,x_ContextMt]),
    node(G,x_A,A),node(G,x_B,B),assertion(A.component==B.component),
    assertion(G.counts.cyclicComponents==1),assertion(G.counts.edges==3),
    assert_all_reachable(G).
test(cycle_sharing_a_descendant_with_an_ordinary_root_is_not_hidden) :-
    graph([x_genlMt(x_A,x_B),x_genlMt(x_B,x_A),
           x_genlMt(x_Shared,x_A),x_genlMt(x_Shared,x_RealRoot)],G),
    assertion(G.roots==[x_ContextMt,x_RealRoot]),
    assertion(G.entrypoints==[x_A,x_ContextMt,x_RealRoot]),assert_all_reachable(G).
test(cycle_below_a_root_is_retained_without_a_redundant_top_entrypoint) :-
    graph([x_genlMt(x_A,x_B),x_genlMt(x_B,x_A),x_genlMt(x_A,x_Root)],G),
    assertion(G.entrypoints==[x_ContextMt,x_Root]),
    assertion(G.counts.cyclicComponents==1),assert_all_reachable(G).
test(self_inheritance_is_a_representable_rootless_singleton_cycle) :-
    graph([x_genlMt(x_Loop,x_Loop)],G),
    assertion(G.roots==[x_ContextMt]),assertion(G.entrypoints==[x_ContextMt,x_Loop]),
    assertion(G.counts.cyclicComponents==1),node(G,x_Loop,N),
    assertion(N.inheritsFrom==[x_Loop]),assertion(N.inheritedBy==[x_Loop]).
test(order_is_deterministic_independent_of_assertion_enumeration) :-
    rows([x_genlMt(x_C,x_A),x_genlMt(x_C,x_B),x_genlMt(x_A,x_B)],Rows),
    reverse(Rows,Reversed),analyze_inheritance(5,Rows,A),analyze_inheritance(5,Reversed,B),
    assertion(A==B).
test(edge_provenance_keeps_assertion_id_original_source_active_path_and_line) :-
    graph([x_genlMt(x_A,x_B)],G),G.edges=[E],E.evidence=[Proof],
    assertion(Proof.assertionId==a1),assertion(Proof.source=='KBs/current.krf'),
    assertion(Proof.originalSource=='KBs/original.krf'),assertion(Proof.line==1),
    assertion(Proof.fileRefs=[file_ref{source:'KBs/current.krf',line:1,kind:active,assertionId:a1},
                              file_ref{source:'KBs/original.krf',line:1,kind:original,assertionId:a1}]).
test(invalid_ground_endpoint_reports_partial_coverage_not_an_invented_node) :-
    graph([x_genlMt(x_Child,3)],G),assertion(G.edges==[]),
    assertion(G.coverage.status==partial),assertion(G.coverage.issues=[_]),
    assertion(G.counts.excluded.invalidInheritance==1).
test(unavailable_native_semantic_keeps_context_and_reports_partial) :-
    R=unavailable(a1,x_LoadedContext,evidence{source:'KBs/a.krf',originalSource:'KBs/a.krf',line:1},
                  reason{code:native_clause_count_mismatch,count:0}),
    analyze_inheritance(12,[R],G),keys(G,[x_LoadedContext]),
    assertion(G.coverage.status==partial),assertion(G.counts.excluded.unavailableAssertions==1),
    assertion(G.generation==12).
test(empty_generation_is_a_complete_empty_graph_not_a_guessed_context) :-
    analyze_inheritance(0,[],G),assertion(ground(G)),
    assertion(G.nodes==[]),assertion(G.edges==[]),assertion(G.entrypoints==[]),
    assertion(G.coverage.status==complete).
test(duplicate_assertion_ids_are_rejected,
     [throws(error(domain_error(duplicate_loaded_assertion_ids,_),_))]) :-
    row(1,x_p,x_A,R),analyze_inheritance(0,[R,R],_).
test(loaded_scale_chain_preserves_all_nodes_without_transitive_expansion) :-
    findall(Row,(between(1,9016,N),Next is N+1,
      atom_concat(x_Mt,N,Child),atom_concat(x_Mt,Next,Parent),
      row(N,x_genlMt(Child,Parent),x_BaseKB,Row)),Rows),
    analyze_inheritance(50,Rows,G),
    assertion(G.counts.edges==9016),assertion(G.counts.nodes==9018),
    assertion(G.counts.components==9018),assertion(G.counts.entrypoints==2),
    assertion(G.coverage.transitiveClosure==false).

assert_all_reachable(Graph) :-
    walk_down(Graph.entrypoints,Graph,[],Seen),sort(Seen,Actual),keys(Graph,Expected),
    assertion(Actual==Expected).
walk_down([],_,Seen,Seen).
walk_down([Key|Keys],Graph,S0,S) :-
    (memberchk(Key,S0)->S1=S0
    ;node(Graph,Key,N),walk_down(N.inheritedBy,Graph,[Key|S0],S1)),
    walk_down(Keys,Graph,S1,S).

fixture(State) :-
    (kb_store:source_info(_,_)->throw(error(nonempty_test_store,_));true),
    app_dir(OldApp),source_file(plunit_mt_graph:fixture(_),Here),file_directory_name(Here,Tests),
    directory_file_path(Tests,artifacts,Artifacts),make_directory_path(Artifacts),uuid(Uuid),
    directory_file_path(Artifacts,Uuid,Root),directory_file_path(Root,prolog,Prolog),
    directory_file_path(Prolog,ow_dr,App),make_directory_path(App),
    retractall(kb_paths:app_directory(_)),assertz(kb_paths:app_directory(App)),
    State=state(Root,OldApp).
cleanup(state(Root,OldApp)) :-
    findall(Source,kb_store:source_info(Source,_),Sources),
    forall(member(Source,Sources),(kb_store:generation(G),kb_store:unload_source(Source,G,_))),
    retractall(kb_paths:app_directory(_)),assertz(kb_paths:app_directory(OldApp)),
    delete_directory_and_contents(Root).
write_text(File,Text) :-
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),format(S,'~s',[Text]),close(S)).
fixture_cache(Name,Rows,Source,Cache) :-
    repo_root(Root),directory_file_path(Root,Name,Given),
    write_text(Given,"Deliberately not parsed as source ((("),absolute_file_name(Given,Source,[access(read)]),
    cache_paths(Source,Cache,_),file_digest(Source,Hash),size_file(Source,Size),
    converter_version(Converter),maplist(cache_record,Rows,Records),
    Header=cache{source:Source,sourceHash:Hash,implementationHash:Hash,dialect:krf,
      mappingHash:none,options:[],converter:Converter,mtPolicy:filename_v1,
      sizeBytes:Size,lineCount:1,warnings:[]},
    write_cache(Cache,Header,Records,_).
cache_record(loaded(Id,Semantic,Context,Evidence),record(Id,Semantic,Metadata)) :-
    term_variables(Semantic,Vars),length(Vars,N),
    findall(Name,(between(1,N,K),format(string(Name),'?V~d',[K])),Names),
    Metadata=[xc_microtheory(Id,Context),xc_source_file(Id,Evidence.originalSource),
              xc_source_line(Id,Evidence.line),xc_kb_names(Id,Names)].
load_fixture(Source,Cache,Status) :-
    file_digest(Source,SourceHash),file_digest(Cache,OutputHash),
    kb_store:add_cached_sources([snapshot{source:Source,sourceHash:SourceHash,outputHash:OutputHash}],any,Status).

test(real_native_snapshot_has_evidence_and_does_not_execute_or_mutate,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    rows([x_genlMt(x_Child,x_Parent),
          (x_genlMt(x_NotAnEdge,x_FakeParent):-and(throw(must_never_execute))),
          x_not(x_genlMt(x_Negative,x_Fake)),
          x_quote(x_genlMt(x_Quoted,x_Fake))],Rows),
    fixture_cache('MisleadingFilenameMt.krf',Rows,Source,Cache),load_fixture(Source,Cache,Loaded),
    kb_store:source_module(Source,Module,Native),
    findall(Id-Ref,kb_runtime:module_assertion(Module,Id,_,Ref),Before),
    file_digest(Source,SourceHash),file_digest(Cache,CacheHash),
    loaded_inheritance(G),loaded_inheritance(Again),
    assertion(G==Again),assertion(G.generation==Loaded.generation),
    assertion(G.counts.assertions==4),assertion(G.counts.edges==1),
    assertion(G.counts.loadedFiles==1),assertion(G.coverage.status==complete),
    edge(G,x_Child,x_Parent,E),E.evidence=[Proof],
    assertion(Proof.originalSource=='KBs/original.krf'),assertion(Proof.assertionId==a1),
    keys(G,[x_Child,x_ContextMt,x_Parent]),
    findall(Id-Ref,kb_runtime:module_assertion(Module,Id,_,Ref),After),
    assertion(Before==After),kb_store:source_module(Source,Module,Native),
    file_digest(Source,SourceHash),file_digest(Cache,CacheHash).
test(native_assertions_outside_the_active_store_are_not_included,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    row(1,x_p,x_ActiveMt,Active),
    fixture_cache('active.krf',[Active],Source,Cache),load_fixture(Source,Cache,_),
    row(2,x_genlMt(x_Uncommitted,x_Parent),x_InactiveMt,Inactive),
    fixture_cache('inactive.krf',[Inactive],_,Other),
    uuid(Uuid),atom_concat(mt_graph_inactive_,Uuid,Module),
    setup_call_cleanup(kb_runtime:native_load(Other,Module),
      (loaded_inheritance(G),keys(G,[x_ActiveMt]),assertion(G.edges==[])),
      kb_runtime:native_unload(Other)).
test(missing_native_handle_is_not_silently_reported_as_complete,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    row(1,x_genlMt(x_A,x_B),x_ContextMt,R),
    fixture_cache('fixture.krf',[R],Source,Cache),load_fixture(Source,Cache,_),
    kb_store:source_module(Source,_,Native),kb_runtime:native_unload(Native),
    loaded_inheritance(G),assertion(G.coverage.status==partial),
    assertion(G.counts.excluded.unavailableAssertions==1),keys(G,[x_ContextMt]).

:- end_tests(mt_graph).
