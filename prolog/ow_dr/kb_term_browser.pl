:- module(kb_term_browser,[resolve_compound/3,browse_compound/5,term_information/2,annotate_page/2,microtheory_catalog/1]).
:- use_module(kb_non_atomic,[]).
:- use_module(kb_term_roles,[]).
:- use_module(kb_term_navigation).
:- use_module(kb_terms).
:- use_module(kb_nat_browser,[]).
:- use_module(kb_store,[]).
:- use_module(library(error)).
:- use_module(library(pairs)).
:- use_module(library(assoc)).

resolve_compound(Input,Term,Key) :-
    (atom_concat('nat:',_,Input)->kb_non_atomic:non_atomic_from_key(Input,Term)
    ;sub_atom(Input,0,2,_,'x_')->atom_concat('mt:',Input,ContextKey),context_from_key(ContextKey,Term)
    ;context_input(Input,Term)),
    kb_non_atomic:non_atomic_key(Term,Key).

browse_compound(Input,Offset,Limit,Filters,Reply) :-
    resolve_compound(Input,Term,Key),kb_term_roles:loaded_term_index(Index),
    catch(kb_term_roles:index_term(Index,Key,Info),
      error(existence_error(loaded_term_identity,_),_),Info=unknown),
    (Info==unknown->
      term_ast(Term,[],Expression),
      Reply=_{term:Key,expression:Expression,known:false,items:[],total:0,
        offset:Offset,limit:Limit,generation:Index.generation,
        message:"This ground application has no indexed denotation evidence in the loaded KB. It has not been created or classified from its spelling."}
    ;all_occurrences(Index,Key,semantic,All),
     term_navigation(Key,All,Navigation),filter_term_assertions(Key,All,Filters,Filtered),
     page(Filtered,Offset,Limit,Items),length(Filtered,Total),
     Base=_{term:Key,expression:Info.term.expression,termInfo:Info,known:true,
       items:Items,total:Total,offset:Offset,limit:Limit,navigation:Navigation,
       generation:Index.generation},
     (Info.nat\==null,member(Category,Info.nat.categories),
      memberchk(Category.key,[compound_microtheory,'type:x_Microtheory']),
      kb_non_atomic:non_atomic_context_key(Term,Mt)->
        Reply=Base.put(microtheory,Mt);Reply=Base)).

term_information(Input,Reply) :-
    (compound_input(Input)->resolve_compound(Input,_,Key);Key=Input),
    kb_term_roles:loaded_term_index(Index),kb_term_roles:index_term(Index,Key,Info),
    all_occurrences(Index,Key,semantic,All),occurrence_summary(All,Occurrences),
    findall(_{term:Type,available:Available},
      (member(Type,[x_CycLNonAtomicTerm,x_CycLNonAtomicReifiedTerm]),
       (get_assoc(Type,Index.terms,_)->Available=true;Available=false)),Vocabulary),
    Reply=Info.put(_{occurrences:Occurrences,representationVocabulary:Vocabulary}).

compound_input(Input) :-
    (sub_atom(Input,0,1,_,'(');sub_atom(Input,0,4,_,'nat:');sub_atom(Input,0,3,_,'mt:');
     sub_atom(Input,0,2,_,'x_'),sub_atom(Input,_,1,_,'(')), !.

all_occurrences(Index,Key,Facet,Items) :-
    occurrence_pages(Index,Key,Facet,0,All),
    findall(SortKey-Item,(member(Item,All),SortKey=Item.source-Item.line-Item.id),Pairs),
    keysort(Pairs,Sorted),pairs_values(Sorted,Items).
occurrence_pages(Index,Key,Facet,Offset,Items) :-
    kb_term_roles:index_occurrences(Index,Key,Facet,Offset,100,Page),
    Next is Offset+100,
    (Next>=Page.total->Items=Page.items;
     occurrence_pages(Index,Key,Facet,Next,Rest),append(Page.items,Rest,Items)).

annotate_page(Ids,Reply) :-
    must_be(list,Ids),length(Ids,Count),
    (Count=<400->true;throw(error(domain_error(annotation_page_size,Count),_))),
    kb_term_roles:loaded_term_index(Index),annotation_batches(Index,Ids,Items),
    Reply=_{generation:Index.generation,items:Items,coverage:Index.coverage}.
annotation_batches(_,[],[]) :- !.
annotation_batches(Index,Ids,Items) :-
    (length(Front,100),append(Front,Rest,Ids)->true;Front=Ids,Rest=[]),
    kb_term_roles:index_assertions(Index,Front,Part),annotation_batches(Index,Rest,Tail),
    append(Part.items,Tail,Items).

microtheory_catalog(Reply) :-
    kb_term_roles:loaded_term_index(Index),
    with_mutex(openworld_store,
      (kb_store:generation(Generation),
       (Generation=:=Index.generation->kb_store:microtheories(Loaded);
        throw(error(term_role_generation_changed,_))))),
    findall(Entry,(member(Item,Loaded),
      Entry=_{mt:Item.mt,mtExpression:Item.mtExpression,count:Item.count,basis:loaded_context}),Active),
    findall(Entry,(member(Node,Index.mtGraph.nodes),
      Entry=_{mt:Node.key,mtExpression:Node.expression,count:Node.assertionCount,basis:loaded_context_or_genlMt}),Graph),
    nat_category_pages(Index.natCatalog,'type:x_Microtheory',0,Typed),
    nat_category_pages(Index.natCatalog,compound_microtheory,0,Referenced),
    append(Typed,Referenced,Nats),
    findall(Candidate,(member(Nat,Nats),kb_non_atomic:non_atomic_from_key(Nat.identity,Term),
      kb_non_atomic:non_atomic_context_key(Term,Key),
      Candidate=_{mt:Key,mtExpression:Nat.expression,count:0,basis:nat_type_or_context_evidence}),NatContexts),
    append([Active,Graph,NatContexts],Candidates),
    findall(Key-Item,(member(Item,Candidates),Key=Item.mt),Pairs),
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),maplist(context_catalog_group,Groups,Items),
    length(Items,Total),
    Reply=_{generation:Generation,items:Items,total:Total,
      coverage:"Loaded assertion contexts, positive genlMt evidence, and indexed compound MT type/context evidence. No inheritance or source loading is performed."}.
nat_category_pages(Catalog,Category,Offset,Items) :-
    kb_nat_browser:nat_page(Catalog,_{category:Category},Offset,100,Page),
    Next is Offset+100,
    (Next>=Page.total->Items=Page.items;
     nat_category_pages(Catalog,Category,Next,Rest),append(Page.items,Rest,Items)).
context_catalog_group(Key-Rows,Item) :-
    findall(N,(member(R,Rows),N=R.count),Counts),max_list(Counts,Count),
    findall(B,(member(R,Rows),B=R.basis),Bases0),sort(Bases0,Bases),
    (member(Annotated,Rows),get_dict(denotesNat,Annotated.mtExpression,true)->
      Expression=Annotated.mtExpression;Rows=[First|_],Expression=First.mtExpression),
    (Count=:=0->ReferenceOnly=true;ReferenceOnly=false),
    Item=_{mt:Key,mtExpression:Expression,count:Count,referencedOnly:ReferenceOnly,evidence:Bases}.

page(Items,Offset,Limit,Page) :-
    (length(Prefix,Offset),append(Prefix,Rest,Items)->
      (length(Page,Limit),append(Page,_,Rest)->true;Page=Rest)
    ;Page=[]).
