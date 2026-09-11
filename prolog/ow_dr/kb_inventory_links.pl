:- module(kb_inventory_links, [extend_inventory/2]).
:- use_module(kb_inventory, []).
:- use_module(kb_reader, []).
:- use_module(kb_mappings, []).
:- use_module(kb_compile,[discover_sources/2]).
:- use_module(kb_paths,[cache_paths/3]).
:- use_module(kb_cache,[write_one_line/2,file_digest/2]).
:- use_module(kb_terms,[context_key/2]).
:- use_module(library(http/json)).
:- use_module(library(filesex)).
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- dynamic signature/4, subtype/3, subrelation/3, mt_type/2, mt_argument/3.
:- dynamic link/4, source_projection/3, endpoint/3.
:- thread_local identity_stream/1.

extend_inventory(RootInput,ReportDirectory) :-
    absolute_file_name(RootInput,Root,[file_type(directory),access(read)]),
    discover_sources([Root],Sources),
    retractall(signature(_,_,_,_)),retractall(subtype(_,_,_)),retractall(subrelation(_,_,_)),
    retractall(mt_type(_,_)),retractall(mt_argument(_,_,_)),retractall(link(_,_,_,_)),
    retractall(source_projection(_,_,_)),retractall(endpoint(_,_,_)),
    directory_file_path(ReportDirectory,'relation-candidates.pl',Candidates),
    directory_file_path(ReportDirectory,'assertion-identities.ndjson',Identities),
    setup_call_cleanup(open(Identities,write,IdentityOut,[encoding(utf8),newline(posix)]),
      setup_call_cleanup(asserta(identity_stream(IdentityOut),IdentityRef),
        setup_call_cleanup(open(Candidates,write,S,[encoding(utf8),newline(posix)]),
          forall(member(File,Sources),
            catch(project_source(File,S),Error,
              (message_to_string(Error,Message),assertz(source_projection(File,unreadable,[Message]))))),close(S)),
        erase(IdentityRef)),close(IdentityOut)),
    exclude_unstable_schema,
    discover_mt_signatures(Relations,Unresolved),
    setup_call_cleanup(open(Candidates,read,CandidateStream,[encoding(utf8)]),
                       collect_links(CandidateStream,Relations),close(CandidateStream)),
    retractall(kb_inventory:rollup(_,_,_,_,_)),
    maplist(update_sidecar, Sources,FileResults),
    include_endpoints,
    directory_file_path(Root,microtheory,Directory),
    kb_inventory:write_mt_catalog(Directory,Catalog,Outputs),
    maplist(extend_mt_file(Directory,Catalog),Catalog,MTResults),
    kb_inventory:write_rollups(ReportDirectory,FileResults,Catalog),
    relation_catalog(Relations,Schemas),kb_inventory:schema(Schema),
    directory_file_path(Directory,'_relations.json',RelationFile),
    write_graph_json(RelationFile,_{schema:Schema,type:mt_relation_catalog,
      relations:Schemas,unresolvedSignatures:Unresolved,
      policy:"Both argument positions require corpus schema evidence. Only positive ground endpoint facts create edges; no runtime inheritance is enabled."}),
    findall(Support,link(_,_,_,Support),Supports),length(Supports,SupportCount),
    findall(P-A-B,link(P,A,B,_),Edges0),sort(Edges0,Edges),length(Edges,EdgeCount),
    length(Relations,RelationCount),length(Catalog,MtCount),
    findall(_{source:F,status:Status,issues:I},source_projection(F,Status,I),Projection),
    directory_file_path(ReportDirectory,'projection-status.json',ProjectionFile),
    kb_inventory:write_json_new(ProjectionFile,_{sources:Projection,identityStream:Identities}),
    directory_file_path(ReportDirectory,'hierarchy-summary.json',SummaryFile),
    kb_inventory:write_json_new(SummaryFile,_{schema:Schema,relationCount:RelationCount,
      logicalEdgeCount:EdgeCount,supportOccurrenceCount:SupportCount,microtheoryCount:MtCount,identityStream:Identities,
      relations:Schemas,unresolvedSignatures:Unresolved,sourceProjection:Projection,
      sourceOutputs:FileResults,microtheoryOutputs:MTResults,catalogOutputs:Outputs}),
    format('MT_LINKS relations=~d edges=~d supports=~d microtheories=~d report=~w~n',
      [RelationCount,EdgeCount,SupportCount,MtCount,SummaryFile]).

exclude_unstable_schema :-
    forall((signature(P,N,T,E),source_projection(E.source,Status,_),memberchk(Status,[unstable,unreadable])),
      retract(signature(P,N,T,E))),
    forall((subtype(A,B,E),source_projection(E.source,Status,_),memberchk(Status,[unstable,unreadable])),
      retract(subtype(A,B,E))),
    forall((subrelation(A,B,E),source_projection(E.source,Status,_),memberchk(Status,[unstable,unreadable])),
      retract(subrelation(A,B,E))).

project_source(File,Out) :-
    cache_paths(File,Compiled,_),State=projection(0,[]),
    (exists_file(Compiled)->
      file_digest(Compiled,Before),
      catch(setup_call_cleanup(open(Compiled,read,S,[encoding(utf8)]),
        compiled_forms(S,File,Compiled,none,Out,State),close(S)),Error,projection_issue(State,Error)),
      file_digest(Compiled,After),
      (Before\==After->Status=unstable;arg(2,State,[])->Status=complete;Status=partial)
    ;Status=missing_companion,projection_issue(State,error(existence_error(companion,Compiled),_))),
    arg(2,State,Issues0),reverse(Issues0,Issues),
    assertz(source_projection(File,Status,Issues)),
    format('PROJECT ~w ~w~n',[Status,File]),flush_output.

compiled_forms(S,Source,Compiled,Pending,Out,State) :-
    read_term(S,Term,[syntax_errors(error),quasi_quotations(Quotes),term_position(Position)]),
    (Quotes=[]->true;throw(error(quasi_quotation_in_companion(Compiled),_))),
    (Term==end_of_file->flush_record(Pending,Source,Compiled,Out,State)
    ;compiled_semantic(Term,Id,Semantic)->
      flush_record(Pending,Source,Compiled,Out,State),
      stream_position_data(line_count,Position,Line),
      compiled_forms(S,Source,Compiled,record(Id,Semantic,Line,[]),Out,State)
    ;compound(Term),functor(Term,Name,2),atom_concat(xc_,_,Name),ground(Term),
     Pending=record(Id,Semantic,Line,Metadata),arg(1,Term,Id)->
      compiled_forms(S,Source,Compiled,record(Id,Semantic,Line,[Term|Metadata]),Out,State)
    ;compiled_forms(S,Source,Compiled,Pending,Out,State)).
compiled_semantic((Head:-Guard),Id,Semantic) :-
    nonvar(Guard),
    (Guard=x_cid_io(Id,Body,_,_)->Semantic=(Head:-Body)
    ;Guard=..[x_cid,Id|_]->Semantic=Head),!.
compiled_semantic(Term,unknown,Term) :-
    nonvar(Term),callable(Term),functor(Term,Name,_),atom_concat(x_,_,Name),
    \+memberchk(Name,[x_cid,x_cid_io]).
flush_record(none,_,_,_,_) :- !.
flush_record(record(Id,Semantic,GeneratedLine,Metadata),Source,Compiled,Out,State) :-
    (memberchk(xc_microtheory(Id,Mt),Metadata),ground(Mt)->
      (memberchk(xc_source_line(Id,Line),Metadata)->true;Line=GeneratedLine),
      arg(1,State,Previous),Ordinal is Previous+1,nb_setarg(1,State,Ordinal),
      write_identity(Source,assertion(Semantic,[],Mt,Line,[],unused)),
      project_assertion(Source,native(Compiled,GeneratedLine),Ordinal,assertion(Semantic,[],Mt,Line,[],unused),Out)
    ;projection_issue(State,error(missing_compiled_microtheory(Compiled,GeneratedLine,Id),_))).
project_original(File,Out,State) :-
    kb_reader:source_dialect(File,Dialect),kb_reader:source_encoding(Dialect,[],Encoding),
    setup_call_cleanup(open(File,read,S,[encoding(Encoding)]),
      (kb_reader:leading_trivia(S,File,Leading),
       kb_reader:source_mapping_mode(File,Dialect,Leading,[],Mode),
       kb_mappings:mapping_context(Mode,Map,_),
       kb_reader:default_microtheory(File,Mt),
       project_forms(S,ctx(File,Dialect,[],[diagnostics(false)],Map),Mt,[],Out,State)),close(S)).
project_forms(S,Ctx,Mt,Props,Out,State) :-
    once(kb_reader:next_form(S,Ctx,Node)),
    (Node==end_of_file->true;
      Ctx=ctx(File,Dialect,_,_,_),arg(1,State,N),Ordinal is N+1,nb_setarg(1,State,Ordinal),
      (Dialect\==metta,kb_reader:microtheory_declaration(Node)->
        once(kb_reader:parse_microtheory(Node,File,Next,Options)),
        project_forms(S,Ctx,Next,Options,Out,State)
      ;catch((once(kb_reader:source_assertion(Node,Ctx,Mt,Props,A,_)),
             Node=n(_,Column,_),write_identity(File,A),project_assertion(File,Column,Ordinal,A,Out)),
             Error,projection_issue(State,Error)),
       project_forms(S,Ctx,Mt,Props,Out,State))).
projection_issue(State,Error) :-
    message_to_string(Error,Message),arg(2,State,Issues),nb_linkarg(2,State,[Message|Issues]).

write_identity(File,assertion(Semantic,_,Mt,Line,_,_)) :-
    variant_sha1(Semantic,Hash),
    kb_cache:term_line(Semantic,Canonical),
    context_key(Mt,Key),kb_inventory:classify_assertion(Semantic,Kind,_),
    identity_stream(Stream),
    json_write_dict(Stream,_{source:File,line:Line,hash:Hash,canonical:Canonical,mt:Key,kind:Kind},[width(0)]),
    nl(Stream).

project_assertion(File,Column,Ordinal,assertion(Head,_,Mt,Line,_,_),Out) :-
    nonvar(Head),compound(Head),Head\=(_:-_),ground(Head),
    Head=..[Predicate|Args],atom(Predicate),
    context_key(Mt,Context),term_string(Head,Formula,[quoted(true),numbervars(false)]),
    (Column=native(Compiled,GeneratedLine)->SourceColumn=null;SourceColumn=Column,Compiled=null,GeneratedLine=null),
    Evidence=_{source:File,line:Line,column:SourceColumn,compiled:Compiled,compiledLine:GeneratedLine,
               ordinal:Ordinal,assertingMicrotheory:Context,formula:Formula},
    collect_schema(Head,Evidence),
    (Args=[First,Second|_],ground(First),ground(Second),mt_value(First),mt_value(Second),
      \+kb_inventory:logical_head(Predicate)->
       write_one_line(Out,candidate(Predicate,First,Second,Evidence))
    ;true),!.
project_assertion(_,_,_,_,_).
mt_value(Value) :- atom(Value),!.
mt_value(Value) :- compound(Value),\+is_list(Value),\+is_dict(Value).

collect_schema(x_genls(Sub,Super),Evidence) :-
    ground(Sub-Super),atom(Sub),atom(Super),!,assertz(subtype(Sub,Super,Evidence)).
collect_schema(x_genlPreds(Sub,Super),Evidence) :-
    ground(Sub-Super),atom(Sub),atom(Super),!,assertz(subrelation(Sub,Super,Evidence)).
collect_schema(Head,Evidence) :-
    signature_fact(Head,Predicate,Position,Type),
    ground(Predicate-Position-Type),atom(Predicate),atom(Type),
    memberchk(Position,[1,2]),!,assertz(signature(Predicate,Position,Type,Evidence)).
collect_schema(_,_).
signature_fact(x_argIsa(P,N,T),P,N,T).
signature_fact(x_arg1Isa(P,T),P,1,T).
signature_fact(x_arg2Isa(P,T),P,2,T).
signature_fact(x_domain(P,N,T),P,N,T).

discover_mt_signatures(Relations,Unresolved) :-
    assertz(mt_type(x_Microtheory,[])),expand_types([x_Microtheory]),
    forall((signature(P,N,Type,E),mt_type(Type,Path)),
      assertz(mt_argument(P,N,_{declaration:E,valueType:Type,subtypeEvidence:Path,inheritance:[]}))),
    propagate_predicate_types,
    findall(P,(mt_argument(P,1,_),mt_argument(P,2,_)),Ps),sort(Ps,Relations),
    findall(_{predicate:P,position:N,valueType:T,evidence:E},
      (signature(P,N,T,E),mt_type(T,_),\+memberchk(P,Relations)),Unresolved).
expand_types([]).
expand_types([Parent|Rest]) :-
    mt_type(Parent,Path),
    findall(Sub-E,(subtype(Sub,Parent,E),\+mt_type(Sub,_)),Candidates),
    add_types(Candidates,Path,Added),append(Rest,Added,Next),expand_types(Next).
add_types([],_,[]).
add_types([Sub-E|Rest],Path,Added) :-
    (mt_type(Sub,_)->add_types(Rest,Path,Added)
    ;assertz(mt_type(Sub,[E|Path])),Added=[Sub|Tail],add_types(Rest,Path,Tail)).
propagate_predicate_types :-
    findall(Sub-N-Evidence,
      (subrelation(Sub,Super,E),mt_argument(Super,N,Parent),\+mt_argument(Sub,N,_),
       Evidence=Parent.put(inheritance,[E|Parent.inheritance])),Candidates),
    (Candidates=[]->true;
      forall(member(P-N-E,Candidates),(mt_argument(P,N,_)->true;assertz(mt_argument(P,N,E)))),
      propagate_predicate_types).

collect_links(S,Relations) :-
    read_term(S,Term,[syntax_errors(error),quasi_quotations([])]),
    (Term==end_of_file->true;
      Term=candidate(P,First,Second,E),
      (memberchk(P,Relations),source_projection(E.source,Status,_),Status\==unstable,
       catch((context_key(First,A),context_key(Second,B)),_,fail)->
        kb_inventory:source_label(First,ALabel),kb_inventory:source_label(Second,BLabel),
        term_string(First,ATerm,[quoted(true),ignore_ops(true)]),
        term_string(Second,BTerm,[quoted(true),ignore_ops(true)]),
        (endpoint(A,_,_)->true;assertz(endpoint(A,ATerm,ALabel))),
        (endpoint(B,_,_)->true;assertz(endpoint(B,BTerm,BLabel))),
        Support=E.put(_{predicate:P,arg1:A,arg2:B}),
        assertz(link(P,A,B,Support))
      ;true),
      collect_links(S,Relations)).

update_sidecar(Source,Data) :-
    catch(update_sidecar_safe(Source,Data),Error,
      (message_to_string(Error,Message),atom_concat(Source,'.inventory.json',File),
       setup_call_cleanup(open(File,read,S,[encoding(utf8)]),json_read_dict(S,Old),close(S)),
       normalize_sidecar(Old,Source,Base),
       Data=Base.put(_{status:unstable,sidecar:_{path:File,status:skipped,message:Message}}),
       retractall(source_projection(Source,_,_)),assertz(source_projection(Source,unstable,[Message])))).
update_sidecar_safe(Source,Data) :-
    atom_concat(Source,'.inventory.json',File),
    setup_call_cleanup(open(File,read,S,[encoding(utf8)]),json_read_dict(S,Old),close(S)),
    kb_inventory:schema(Schema),atom_string(Schema,Old.schema),
    (file_digest(Source,Hash),atom_string(Hash,Old.source.sha256)->true;
      throw(error(source_changed_since_inventory(Source),_))),
    findall(Support,(link(_,_,_,Support),Support.source==Source),Edges),
    source_projection(Source,Projection,Issues),
    normalize_sidecar(Old,Source,Base),
    Updated=Base.put(_{mtRelationAssertions:Edges,
      relationProjection:_{status:Projection,issues:Issues,schema:'powder.mt-links.v1'}}),
    kb_inventory:write_sidecar(File,Updated,Output),
    Data=Updated.put(sidecar,Output),
    forall(member(Context,Data.microtheories),
      assertz(kb_inventory:rollup(Context.key,Context.canonical,Context.label,Source,
                                Context.put(compiled,Data.compiled.path)))).
normalize_sidecar(Old,Source,Data) :-
    maplist(normalize_context,Old.microtheories,Contexts),
    atom_string(Status,Old.status),
    Data=Old.put(_{schema:'powder.kb-inventory.v1',source:Old.source.put(path,Source),
                  status:Status,microtheories:Contexts}).
normalize_context(Old,Context) :-
    atom_string(Key,Old.key),maplist(normalize_predicate,Old.predicates,Predicates),
    Context=Old.put(_{key:Key,predicates:Predicates}).
normalize_predicate(Old,Predicate) :-
    atom_string(Name,Old.name),
    (Old.arity== @(null)->Arity=null;Arity=Old.arity),
    Predicate=Old.put(_{name:Name,arity:Arity}).

include_endpoints :-
    forall((endpoint(Key,Canonical,Label),\+kb_inventory:rollup(Key,_,_,_,_)),
      assertz(kb_inventory:rollup(Key,Canonical,Label,'',
        _{key:Key,canonical:Canonical,label:Label,ruleCount:0,gafCount:0,otherCount:0,
          assertionCount:0,declarationLines:[],declarationOnly:false,referencedOnly:true,
          predicates:[],compiled:""}))).

extend_mt_file(Directory,Catalog,Entry,Result) :-
    directory_file_path(Directory,Entry.filename,File),
    setup_call_cleanup(open(File,read,S,[encoding(utf8)]),json_read_dict(S,Old),close(S)),
    findall(P,(link(P,Entry.key,_,_);link(P,_,Entry.key,_)),Ps0),sort(Ps0,Predicates),
    findall(Source,((link(_,Entry.key,_,Support);link(_,_,Entry.key,Support)),Source=Support.source),Referenced0),
    sort(Referenced0,ReferencedInFiles),
    maplist(relation_links(Entry.key,Catalog),Predicates,Relations),
    (member(Genl,Relations),Genl.predicate==x_genlMt->GenlMt=_{asArg1:Genl.asArg1,asArg2:Genl.asArg2}
    ;GenlMt=_{asArg1:[],asArg2:[]}),
    Data=Old.put(_{schema:'powder.kb-inventory.v1',key:Entry.key,mtRelations:Relations,genlMt:GenlMt,
                   referencedInFiles:ReferencedInFiles,
                   hierarchySchema:'powder.mt-links.v1'}),
    catch((kb_inventory:write_derived(File,Data,mt(Entry.key)),Result=_{path:File,status:written}),
      Error,(message_to_string(Error,Message),Result=_{path:File,status:skipped,message:Message})).

relation_links(Key,Catalog,Predicate,JSON) :-
    neighbors(Predicate,Key,1,Catalog,AsFirst),neighbors(Predicate,Key,2,Catalog,AsSecond),
    kb_inventory:source_label(Predicate,Label),
    JSON=_{predicate:Predicate,label:Label,asArg1:AsFirst,asArg2:AsSecond,
           signatureCatalog:"_relations.json"}.
neighbors(P,Key,Position,Catalog,Neighbors) :-
    findall(Other,(Position=:=1->link(P,Key,Other,_);link(P,Other,Key,_)),Others0),
    sort(Others0,Others),maplist(neighbor(P,Key,Position,Catalog),Others,Neighbors).
neighbor(P,Key,Position,Catalog,Other,JSON) :-
    findall(S,(Position=:=1->link(P,Key,Other,S);link(P,Other,Key,S)),Supports),
    length(Supports,Count),member(Entry,Catalog),Entry.key==Other,!,
    JSON=_{key:Other,canonical:Entry.canonical,label:Entry.label,filename:Entry.filename,
           supportCount:Count,supports:Supports}.
relation_catalog(Predicates,Relations) :- maplist(relation_schema,Predicates,Relations).
relation_schema(P,_{predicate:P,label:Label,arg1:First,arg2:Second}) :-
    kb_inventory:source_label(P,Label),
    findall(E,mt_argument(P,1,E),First),findall(E,mt_argument(P,2,E),Second).
write_graph_json(File,Data) :-
    (exists_file(File)->
      file_digest(File,Before),
      setup_call_cleanup(open(File,read,S,[encoding(utf8)]),json_read_dict(S,Old),close(S)),
      (Old.type=="mt_relation_catalog",Old.schema=="powder.kb-inventory.v1"->true;
        throw(error(inventory_filename_collision(File),_)))
    ;Before=missing),
    kb_cache:stage_path(File,Stage),
    setup_call_cleanup(true,
      (kb_inventory:write_json_new(Stage,Data),
       (Before==missing->(\+exists_file(File)->true;throw(error(inventory_changed(File),_)))
       ;file_digest(File,Before)),
       kb_cache:install_stage(Stage,File)),
                       kb_cache:remove_if_exists(Stage)).
