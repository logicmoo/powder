:- module(kb_mt_graph,[loaded_inheritance/1,analyze_inheritance/3]).

/** <module> Positive inheritance evidence in the active native generation

loaded_inheritance(-Graph) copies the active store generation and semantic
clauses under openworld_store's mutex, then analyzes that private snapshot.
It never reads a source/cache file, invokes a compiler, or executes a KB body.

analyze_inheritance(+Generation,+Rows,-Graph) is filesystem-free. Rows are
loaded(Id,Semantic,Context,Evidence), where Evidence is a JSON dictionary with
source (current source), originalSource and line fields. A snapshot failure is
unavailable(Id,Context,Evidence,Reason), retaining context content but explicitly
making coverage partial. Semantic variables are never bound by this analysis.

Schema powder.loaded-mt-inheritance.v1:
  generation, nodes, edges, roots, entrypoints, components, counts, coverage.
  Node: key, label, expression (shared renderer AST), hasContent, referenced,
        referencedOnly, assertionCount, sourceCount, fileRefs, inheritsFrom,
        inheritedBy, component, referenceFileRefs, referenceSourceCount,
        referenceAssertionCount. fileRefs aggregate content files; separate
        referenceFileRefs retain relation assertion IDs and source locations.
  Edge: child, parent, relation=inheritsFrom, inverseRelation=inheritedBy,
        evidenceCount, evidence, assertionIds, fileRefs.
  Evidence: assertionId, source, originalSource, line, fileRefs,
            assertingMicrotheory.

Only a complete semantic clause exactly x_genlMt(Child,Parent), positive and
ground, supplies an edge. Wrappers, implications, executable rule heads, quoted
data, comments and other references never supply edges. This does not extend
runtime inheritance semantics. Contexts come exclusively from loaded assertion
metadata; declaration-only contexts discarded at compilation are not guessed.

Display parents above children. roots are nodes with no asserted parent.
entrypoints are representatives of the parent-most strongly connected
components: roots plus entries for rootless cycles. Every node is reachable
downward from an entrypoint, including cycles connected to ordinary roots only
through shared descendants. Components/edges retain all cycles and parents.
Keys, adjacency, components and provenance arrays have deterministic ordering.
*/

:- use_module(kb_store,[]).
:- use_module(kb_runtime,[]).
:- use_module(kb_terms,[context_key/2,context_from_key/2,term_ast/3]).
:- use_module(kb_paths,[public_path/2]).
:- use_module(library(apply)).
:- use_module(library(assoc)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(pairs)).

loaded_inheritance(Graph) :-
    with_mutex(openworld_store,
      (kb_store:generation(Generation),
       findall(Row,(kb_store:assertion(Id,Data),snapshot_row(Id,Data,Row)),Rows),
       findall(P,(kb_store:source_info(Source,_),public_path(Source,P)),Files0))),
    sort(Files0,Files),length(Files,FileCount),
    analyze_inheritance(Generation,Rows,Base),
    Graph=Base.put(graph{files:Files,counts:Base.counts.put(loadedFiles,FileCount)}).

snapshot_row(Id,Data,Row) :-
    context_from_key(Data.mt,Context),
    (member(Property,Data.properties),Property.name==source_file->
       Original=Property.value
    ;Original=Data.source),
    Evidence=evidence{source:Data.source,originalSource:Original,line:Data.line},
    catch(findall(Semantic,kb_runtime:module_assertion(Data.module,Id,Semantic,_),Found),
          Error,Found=error(Error)),
    (Found=[Term]->Row=loaded(Id,Term,Context,Evidence)
    ;Found=error(Exception)->message_to_string(Exception,Message),
       Row=unavailable(Id,Context,Evidence,
         reason{code:native_clause_read_failed,message:Message})
    ;length(Found,Count),
     Row=unavailable(Id,Context,Evidence,
       reason{code:native_clause_count_mismatch,count:Count})).

analyze_inheritance(Generation,Rows,Graph) :-
    must_be(nonneg,Generation),must_be(list,Rows),
    maplist(row_parts,Rows,Parts),
    findall(Id,member(row(Id,_,_,_,_),Parts),Ids),sort(Ids,UniqueIds),
    (same_length(Ids,UniqueIds)->true;domain_error(duplicate_loaded_assertion_ids,Ids)),
    maplist(classify_row,Parts,Classified),
    findall(Context-Evidence,
      (member(classified(Context,_,Evidence,_,_),Classified),Context\==none),Content),
    findall(Child-Parent-Evidence,
      member(classified(_,edge(Child,Parent),Evidence,_,_),Classified),Relations),
    findall(Issue,(member(classified(_,_,_,Issues,_),Classified),member(Issue,Issues)),Issues0),
    sort(Issues0,Issues),
    graph_terms(Content,Relations,Terms),
    group_edges(Relations,Edges),
    adjacency(Terms,Edges,Parents,Children),
    component_graph(Terms,Parents,Children,Components,Membership,Entrypoints),
    content_index(Content,ContentIndex),reference_index(Edges,ReferenceIndex),
    maplist(node_json(ContentIndex,ReferenceIndex,Parents,Children,Membership),Terms,Nodes),
    findall(Key,(member(Node,Nodes),Node.inheritsFrom==[],Key=Node.key),Roots),
    graph_counts(Rows,Classified,Nodes,Edges,Components,Entrypoints,Roots,Counts),
    (Issues==[]->State=complete;State=partial),
    Graph=graph{schema:'powder.loaded-mt-inheritance.v1',generation:Generation,
      nodes:Nodes,edges:Edges,roots:Roots,entrypoints:Entrypoints,components:Components,
      files:null,counts:Counts,
      coverage:coverage{status:State,scope:active_generation,
        relation:x_genlMt,policy:positive_ground_top_level_facts,
        inheritanceExecution:false,transitiveClosure:false,
        contextPolicy:assertion_metadata_only,issues:Issues}}.

row_parts(loaded(Id,Semantic,Context,Evidence0),row(Id,known(Semantic),Context,Evidence,none)) :- !,
    must_be(atom,Id),
    (acyclic_term(Semantic)->true;domain_error(acyclic_semantic,Id)),
    normalize_evidence(Id,Evidence0,Evidence).
row_parts(unavailable(Id,Context,Evidence0,Reason0),row(Id,unknown,Context,Evidence,Reason)) :- !,
    must_be(atom,Id),normalize_evidence(Id,Evidence0,Evidence),ground_json(Reason0,Reason).
row_parts(Row,_) :- domain_error(loaded_inheritance_row,Row).

normalize_evidence(Id,Input,Evidence) :-
    must_be(dict,Input),must_be(text,Input.source),must_be(text,Input.originalSource),
    (Input.line==null->true;must_be(positive_integer,Input.line)),
    Active=file_ref{source:Input.source,line:Input.line,kind:active,assertionId:Id},
    Original=file_ref{source:Input.originalSource,line:Input.line,kind:original,assertionId:Id},
    (Input.source==Input.originalSource->Refs=[Active];Refs=[Active,Original]),
    Evidence=evidence{assertionId:Id,source:Input.source,originalSource:Input.originalSource,
                      line:Input.line,fileRefs:Refs}.

classify_row(row(Id,State,Context,Evidence0,Unavailable),
             classified(ContextInfo,Edge,Evidence,Issues,Kind)) :-
    context_info(Context,ContextInfo,ContextError),
    (ContextInfo==none->ContextKey=null;ContextKey=ContextInfo.key),
    Evidence=Evidence0.put(assertingMicrotheory,ContextKey),
    (ContextError==none->ContextIssues=[];
     ContextIssues=[issue{assertionId:Id,code:invalid_loaded_context,detail:ContextError}]),
    (State=unknown->
       Edge=none,Kind=unavailable,
       Issues=[issue{assertionId:Id,code:unavailable_semantic_clause,detail:Unavailable}|ContextIssues]
    ;State=known(Semantic),semantic_edge(Semantic,Edge,Kind,Error),
     (Error==none->Issues=ContextIssues;
      Issues=[issue{assertionId:Id,code:invalid_inheritance_endpoint,detail:Error}|ContextIssues])).

context_info(Context,Info,Error) :-
    (ground(Context),acyclic_term(Context)->
      catch((context_key(Context,Key),term_ast(Context,[],RawAST),
             ground_json(RawAST,Expression),context_label(Context,Label),
             Info=context{key:Key,expression:Expression,label:Label},Error=none),
            Exception,(Info=none,message_to_string(Exception,Error)))
    ;Info=none,Error="Context is not a ground, acyclic microtheory term.").

semantic_edge(Semantic,Edge,Kind,Error) :-
    (nonvar(Semantic),compound(Semantic),Semantic=x_genlMt(Child,Parent)->
      (ground(Semantic)->
        context_info(Child,C,CE),context_info(Parent,P,PE),
        (CE==none,PE==none->Edge=edge(C,P),Kind=inheritance,Error=none;
         Edge=none,Kind=invalid,Error=endpoint_errors{child:CE,parent:PE})
      ;Edge=none,Kind=nonground,Error=none)
    ;Edge=none,Kind=other,Error=none).

graph_terms(Content,Relations,Terms) :-
    findall(Key-Context,
      ((member(Context-_,Content);
        member(Context-_-_,Relations);
        member(_-Context-_,Relations)),Key=Context.key),Pairs),
    sort(Pairs,Terms).

group_edges(Relations,Edges) :-
    findall(Key-Evidence,
      (member(Child-Parent-Evidence,Relations),Key=Child.key-Parent.key),Pairs),
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),maplist(edge_json,Groups,Edges).
edge_json((Child-Parent)-Evidence0,Edge) :-
    sort(Evidence0,Evidence),length(Evidence,Count),
    findall(Id,(member(E,Evidence),Id=E.assertionId),Ids),
    findall(Ref,(member(E,Evidence),member(Ref,E.fileRefs)),Refs0),sort(Refs0,Refs),
    Edge=edge{child:Child,parent:Parent,relation:inheritsFrom,inverseRelation:inheritedBy,
              evidenceCount:Count,evidence:Evidence,assertionIds:Ids,fileRefs:Refs}.

adjacency(Terms,Edges,Parents,Children) :-
    pairs_keys(Terms,Keys),empty_assoc(Empty),
    foldl(empty_neighbors,Keys,Empty,Blank),
    foldl(add_parent,Edges,Blank,RawParents),foldl(add_child,Edges,Blank,RawChildren),
    map_assoc(sort,RawParents,Parents),map_assoc(sort,RawChildren,Children).
empty_neighbors(Key,Before,After) :- put_assoc(Key,Before,[],After).
add_parent(Edge,Before,After) :- add_neighbor(Edge.child,Edge.parent,Before,After).
add_child(Edge,Before,After) :- add_neighbor(Edge.parent,Edge.child,Before,After).
add_neighbor(Key,Neighbor,Before,After) :-
    get_assoc(Key,Before,Old),put_assoc(Key,Before,[Neighbor|Old],After).

content_index(Content,Index) :-
    findall(Key-E,(member(C-E,Content),Key=C.key),Pairs),group_index(Pairs,Index).
reference_index(Edges,Index) :-
    findall(Key-Ref,(member(Edge,Edges),sort([Edge.child,Edge.parent],Keys),
                     member(Key,Keys),member(Ref,Edge.fileRefs)),Pairs),
    group_index(Pairs,Index).
group_index(Pairs,Index) :-
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),list_to_assoc(Groups,Index).
indexed_values(Key,Index,Values) :- (get_assoc(Key,Index,Values)->true;Values=[]).

node_json(Content,References,Parents,Children,Membership,Key-Context,Node) :-
    indexed_values(Key,Content,Evidence),
    length(Evidence,Count),(Count>0->HasContent=true;HasContent=false),
    node_file_refs(Evidence,FileRefs),length(FileRefs,SourceCount),
    get_assoc(Key,Parents,InheritsFrom),get_assoc(Key,Children,InheritedBy),
    ((InheritsFrom\=[];InheritedBy\=[])->Referenced=true;Referenced=false),
    (HasContent==false,Referenced==true->Only=true;Only=false),
    indexed_values(Key,References,ReferenceRefs0),sort(ReferenceRefs0,ReferenceRefs),
    findall(S,(member(F,ReferenceRefs),F.kind==active,S=F.source),Sources0),
    sort(Sources0,Sources),length(Sources,ReferenceSources),
    findall(Id,(member(F,ReferenceRefs),Id=F.assertionId),RefIds0),
    sort(RefIds0,RefIds),length(RefIds,ReferenceAssertions),
    get_assoc(Key,Membership,Component),
    Node=node{key:Key,label:Context.label,expression:Context.expression,
      hasContent:HasContent,referenced:Referenced,referencedOnly:Only,
      assertionCount:Count,sourceCount:SourceCount,fileRefs:FileRefs,
      referenceFileRefs:ReferenceRefs,referenceSourceCount:ReferenceSources,
      referenceAssertionCount:ReferenceAssertions,
      inheritsFrom:InheritsFrom,inheritedBy:InheritedBy,component:Component}.
node_file_refs(Evidence,Files) :-
    findall(Source-E,(member(E,Evidence),Source=E.source),Pairs),
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),
    maplist(node_file_ref,Groups,Files).
node_file_ref(Source-Evidence,Ref) :-
    length(Evidence,Count),
    findall(N,(member(E,Evidence),N=E.line,integer(N)),Lines),
    (Lines==[]->First=null,Last=null;min_list(Lines,First),max_list(Lines,Last)),
    findall(O,(member(E,Evidence),O=E.originalSource),Originals0),sort(Originals0,Originals),
    Ref=content_file{source:Source,originalSources:Originals,assertionCount:Count,
                     firstLine:First,lastLine:Last}.

% Kosaraju's two passes operate on ground-key adjacency assocs. Component
% entrypoints come from the condensed graph, not from a lossy spanning tree.
component_graph(Terms,Parents,Children,Components,Membership,Entrypoints) :-
    pairs_keys(Terms,Keys),empty_assoc(Empty),
    finish_vertices(Keys,Parents,Empty,_,[],Order),
    collect_components(Order,Children,Empty,_,Groups0),
    maplist(component_pair,Groups0,Pairs),keysort(Pairs,Groups),
    foldl(component_membership,Groups,Empty,Membership),
    maplist(component_json(Parents,Children,Membership),Groups,Components),
    findall(Key,(member(C,Components),C.topLevel==true,Key=C.entrypoint),Entrypoints).
finish_vertices([],_,Seen,Seen,Order,Order).
finish_vertices([Key|Keys],Graph,S0,S,O0,O) :-
    (get_assoc(Key,S0,_)->S1=S0,O1=O0
    ;put_assoc(Key,S0,true,Marked),get_assoc(Key,Graph,Neighbors),
     finish_vertices(Neighbors,Graph,Marked,S1,O0,Finished),O1=[Key|Finished]),
    finish_vertices(Keys,Graph,S1,S,O1,O).
collect_components([],_,Seen,Seen,[]).
collect_components([Key|Keys],Graph,S0,S,Groups) :-
    (get_assoc(Key,S0,_)->S1=S0,Groups=Rest
    ;collect_reachable([Key],Graph,S0,S1,[],Members),sort(Members,Sorted),Groups=[Sorted|Rest]),
    collect_components(Keys,Graph,S1,S,Rest).
collect_reachable([],_,Seen,Seen,Members,Members).
collect_reachable([Key|Keys],Graph,S0,S,M0,M) :-
    (get_assoc(Key,S0,_)->S1=S0,M1=M0
    ;put_assoc(Key,S0,true,Marked),get_assoc(Key,Graph,Neighbors),
     collect_reachable(Neighbors,Graph,Marked,S1,[Key|M0],M1)),
    collect_reachable(Keys,Graph,S1,S,M1,M).
component_pair([Key|Keys],Key-[Key|Keys]).
component_membership(Id-Keys,Before,After) :- foldl(assign_component(Id),Keys,Before,After).
assign_component(Id,Key,Before,After) :- put_assoc(Key,Before,Id,After).
component_json(Parents,Children,Membership,Id-Keys,Component) :-
    component_neighbors(Keys,Parents,Membership,Id,ParentIds),
    component_neighbors(Keys,Children,Membership,Id,ChildIds),
    (ParentIds==[]->Top=true;Top=false),
    (Keys=[Only]->get_assoc(Only,Parents,Ps),(memberchk(Only,Ps)->Cyclic=true;Cyclic=false)
    ;Cyclic=true),
    Component=component{id:Id,nodes:Keys,cyclic:Cyclic,topLevel:Top,
                         entrypoint:Id,parents:ParentIds,children:ChildIds}.
component_neighbors(Keys,Graph,Membership,Own,Components) :-
    findall(C,(member(Key,Keys),get_assoc(Key,Graph,Ns),member(N,Ns),
               get_assoc(N,Membership,C),C\==Own),All),sort(All,Components).

graph_counts(Rows,Classified,Nodes,Edges,Components,Entrypoints,Roots,Counts) :-
    length(Rows,Assertions),length(Nodes,NodeCount),length(Edges,EdgeCount),
    length(Components,ComponentCount),length(Entrypoints,EntryCount),length(Roots,RootCount),
    count_class(inheritance,Classified,Positive),count_class(nonground,Classified,Nonground),
    count_class(other,Classified,Other),count_class(invalid,Classified,Invalid),
    count_class(unavailable,Classified,Unavailable),
    include(content_node,Nodes,Content),length(Content,ContentCount),
    ReferencedOnly is NodeCount-ContentCount,
    include(isolated_node,Nodes,Isolated),length(Isolated,IsolatedCount),
    include(cyclic_component,Components,Cycles),length(Cycles,CycleCount),
    Counts=counts{assertions:Assertions,positiveInheritanceAssertions:Positive,
      edges:EdgeCount,nodes:NodeCount,contentNodes:ContentCount,referencedOnlyNodes:ReferencedOnly,
      isolatedNodes:IsolatedCount,components:ComponentCount,cyclicComponents:CycleCount,
      roots:RootCount,entrypoints:EntryCount,loadedFiles:null,
      excluded:excluded{otherAssertions:Other,nongroundInheritance:Nonground,
                        invalidInheritance:Invalid,unavailableAssertions:Unavailable}}.
count_class(Kind,Rows,Count) :-
    include(has_class(Kind),Rows,Selected),length(Selected,Count).
has_class(Kind,classified(_,_,_,_,Kind)).
content_node(Node) :- Node.hasContent==true.
isolated_node(Node) :- Node.inheritsFrom==[],Node.inheritedBy==[].
cyclic_component(Component) :- Component.cyclic==true.

ground_json(Value,Ground) :-
    (is_dict(Value)->dict_pairs(Value,_,Pairs),maplist(ground_json_pair,Pairs,New),dict_pairs(Ground,json,New)
    ;is_list(Value)->maplist(ground_json,Value,Ground)
    ;atomic(Value)->Ground=Value
    ;type_error(ground_json,Value)).
ground_json_pair(Key-Value,Key-Ground) :- ground_json(Value,Ground).

context_label(Context,Label) :- with_output_to(string(Label),write_context_label(Context)).
write_context_label(Value) :-
    atom(Value),!,(atom_concat(x_,Visible,Value)->write(Visible);write(Value)).
write_context_label(Value) :-
    (number(Value);string(Value)),!,write_term(Value,[quoted(true),character_escapes(true)]).
write_context_label(Value) :-
    is_list(Value),!,write('['),write_context_values(Value),write(']').
write_context_label(Value) :-
    Value=..[Name|Values],
    (Name==t,Values=[Predicate|Args]->true;Predicate=Name,Args=Values),
    write('('),write_context_label(Predicate),
    forall(member(A,Args),(write(' '),write_context_label(A))),write(')').
write_context_values([]).
write_context_values([First|Rest]) :-
    write_context_label(First),forall(member(V,Rest),(write(' '),write_context_label(V))).
