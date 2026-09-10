:- module(kb_inventory, [inventory/2, inventory_source/2, classify_assertion/3,
                        declaration_target/4]).
:- use_module(kb_reader, []).
:- use_module(kb_mappings, []).
:- use_module(kb_paths).
:- use_module(kb_compile, [discover_sources/2,implementation_hash/1]).
:- use_module(kb_cache, [file_digest/2,stage_path/2,install_stage/2,remove_if_exists/1]).
:- use_module(kb_terms, [context_key/2,json_value/2]).
:- use_module(library(assoc)).
:- use_module(library(crypto)).
:- use_module(library(csv)).
:- use_module(library(error)).
:- use_module(library(filesex)).
:- use_module(library(http/json)).
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- use_module(library(readutil)).
:- dynamic rollup/5.

schema('powder.kb-inventory.v1').

inventory(RootInput,ReportDirectory) :-
    absolute_file_name(RootInput,Root,[file_type(directory),access(read)]),
    make_directory_path(ReportDirectory),discover_sources([Root],Sources),
    get_time(Start),retractall(rollup(_,_,_,_,_)),
    directory_file_path(ReportDirectory,'inventory-files.ndjson',Log),
    setup_call_cleanup(open(Log,write,S,[encoding(utf8),newline(posix)]),
      maplist(inventory_one(S),Sources,FileResults),close(S)),
    directory_file_path(Root,microtheory,MtDirectory),make_directory_path(MtDirectory),
    write_mt_catalog(MtDirectory,Catalog,MTResults),
    write_rollups(ReportDirectory,FileResults,Catalog),
    get_time(End),length(Sources,SourceCount),length(Catalog,MtCount),
    findall(P,(member(R,FileResults),R.sidecar.status==written,P=R.sidecar.path),Written),
    findall(R,(member(R,FileResults),(R.status\==complete;R.sidecar.status\==written)),Issues),
    length(Written,WrittenCount),
    schema(Schema),Summary=_{schema:Schema,startedAt:Start,finishedAt:End,sourceRoot:Root,
      sourceCount:SourceCount,microtheoryCount:MtCount,sidecarsWritten:WrittenCount,
      files:FileResults,issues:Issues,microtheoryOutputs:MTResults,catalog:Catalog},
    directory_file_path(ReportDirectory,'summary.json',SummaryFile),
    write_json_new(SummaryFile,Summary),
    format('INVENTORY sources=~d microtheories=~d sidecars=~d report=~w~n',
      [SourceCount,MtCount,WrittenCount,SummaryFile]).

inventory_one(Log,Source,Result) :-
    catch(inventory_source(Source,Data),Error,
      (message_to_string(Error,Message),schema(Schema),
       Data=_{schema:Schema,source:_{path:Source},status:error,issues:[_{message:Message}],microtheories:[]})),
    atom_concat(Source,'.inventory.json',Sidecar),
    catch(write_sidecar(Sidecar,Data,WriteStatus),Error,
      (message_to_string(Error,Message),WriteStatus=_{path:Sidecar,status:skipped,message:Message})),
    (Data.status==unstable->Contexts=[];Contexts=Data.microtheories),
    (get_dict(compiled,Data,C)->Compiled=C.path;atom_concat(Source,'.pl',Compiled)),
    forall(member(Context,Contexts),
      assertz(rollup(Context.key,Context.canonical,Context.label,Source,Context.put(compiled,Compiled)))),
    Result=Data.put(_{sidecar:WriteStatus,microtheories:Contexts}),
    json_write_dict(Log,Result,[width(0)]),nl(Log),flush_output(Log),
    format('~w ~w~n',[Data.status,Source]),flush_output.

inventory_source(Source,Data) :-
    schema(Schema),get_time(Now),snapshot(Source,Before),
    new_state(State),
    catch(read_original(Source,State),Error,record_issue(State,source_parse,Error)),
    source_state(State,Contexts,SourceCounts,SourceIssues),
    atom_concat(Source,'.pl',Compiled),atom_concat(Source,'.index.pl',Index),
    catch(inspect_companion(Compiled,Before.sha256,Companion),CompanionError,
      (message_to_string(CompanionError,CM),
       Companion=_{path:Compiled,present:true,status:unreadable,physicalLineCount:null,
                   semanticClauseCount:null,metadataFactCount:null,directiveCount:null,issues:[CM]})),
    inspect_index(Index,IndexInfo),
    snapshot(Source,After),
    (Before =@= After->Stable=true;Stable=false),
    (Stable==true,SourceIssues==[]->Status=complete;Stable==false->Status=unstable;Status=partial),
    kb_reader:source_dialect(Source,Dialect),
    Data=_{schema:Schema,generatedAt:Now,source:Before.put(_{path:Source,dialect:Dialect}),compiled:Companion,
      index:IndexInfo,status:Status,evidence:original_reader,
      counts:SourceCounts,microtheories:Contexts,issues:SourceIssues,
      classification:"On-disk occurrences, not runtime deduplication. Rule = exact executable <=== head; GAF = ground nonlogical application; all other forms counted separately."}.

snapshot(File,Info) :-
    size_file(File,Size),time_file(File,Modified),file_digest(File,Hash),
    physical_lines(File,Lines),
    Info=_{sizeBytes:Size,modified:Modified,sha256:Hash,physicalLineCount:Lines}.
physical_lines(File,Count) :-
    setup_call_cleanup(open(File,read,S,[encoding(octet)]),count_lfs(S,0,Count),close(S)).
count_lfs(S,Before,Count) :-
    read_string(S,65536,Text),
    (Text==""->Count=Before;string_codes(Text,Codes),count_lf_codes(Codes,0,N),
      Next is Before+N,count_lfs(S,Next,Count)).
count_lf_codes([],N,N).
count_lf_codes([C|Cs],N0,N) :- (C=:=10->N1 is N0+1;N1=N0),count_lf_codes(Cs,N1,N).

new_state(state(Map,0,0,0,0,0,[])) :- empty_assoc(Map).
read_original(File,State) :-
    kb_reader:source_dialect(File,Dialect),kb_reader:source_encoding(Dialect,[],Encoding),
    setup_call_cleanup(open(File,read,S,[encoding(Encoding)]),
      (kb_reader:leading_trivia(S,File,Leading),
       kb_reader:source_mapping_mode(File,Dialect,Leading,[],Mode),
       kb_mappings:mapping_context(Mode,Map,_),
       kb_reader:default_microtheory(File,Mt),
       Ctx=ctx(File,Dialect,[],[diagnostics(false)],Map),
       original_forms(S,Ctx,Mt,[],State)),close(S)).
original_forms(S,Ctx,Mt,DirectiveProps,State) :-
    once(kb_reader:next_form(S,Ctx,Node)),
    (Node==end_of_file->true;
      Ctx=ctx(File,Dialect,_,_,_),
      (Dialect\==metta,kb_reader:microtheory_declaration(Node)->
        once(kb_reader:parse_microtheory(Node,File,NextMt,Props)),
        Node=n(Line,_,_),declare_mt(State,NextMt,Line),bump(State,6),
        original_forms(S,Ctx,NextMt,Props,State)
      ;catch((once(kb_reader:source_assertion(Node,Ctx,Mt,DirectiveProps,Assertion,_))->
              add_assertion(State,Assertion);throw(error(unclassified_source_form(Node),_))),
             Error,record_issue(State,normalization,Error)),
       original_forms(S,Ctx,Mt,DirectiveProps,State))).

classify_assertion((Head:-Body),rule,Head) :-
    nonvar(Body),functor(Body,and,_),!.
classify_assertion(Head,gaf,Head) :-
    ground(Head),callable(Head),\+is_list(Head),\+is_dict(Head),
    functor(Head,Name,_),\+logical_head(Name),
    \+memberchk(Name,[metta_value,metta_exec,metta_expression]),!.
classify_assertion(Head,other,Head).
logical_head(Name) :- memberchk(Name,[x_and,x_or,x_not,x_implies,x_equiv,
  'x_=>','x_<=>','x_<==','x_<===',x_forAll,x_forall,x_exists,x_thereExists]).

add_assertion(State,assertion(Semantic,_,Mt,Line,_,_)) :-
    classify_assertion(Semantic,Kind,Head),
    bump(State,2),
    (Kind==rule->bump(State,3);Kind==gaf->bump(State,4);bump(State,5)),
    mt_key(Mt,Key,Canonical,Label),
    get_context(State,Key,Canonical,Label,Context),
    predicate_signature(Head,Name,Arity,Predicate),
    update_predicate(Context,Name,Arity,Predicate,Kind,Line,none,Next),
    increment_context(Next,Kind,Counted),
    (declaration_target(Head,Target,DeclaredArity,Declaration)->
      predicate_atom(Target,TargetName,TargetLabel),
      update_predicate(Counted,TargetName,DeclaredArity,TargetLabel,reference,Line,Declaration,Final)
    ;Final=Counted),
    put_context(State,Key,Final),
    (Head=x_isa(DeclaredMt,x_Microtheory),ground(DeclaredMt)->
      declare_mt(State,DeclaredMt,Line);true).

predicate_signature(Head,Name,Arity,Label) :-
    nonvar(Head),callable(Head),!,
    functor(Head,F,N),
    (F==t,N>0->arg(1,Head,P),Arity is N-1,
      (var(P)->Name=variable_predicate,Label="?PREDICATE";predicate_atom(P,Name,Label))
    ;Arity=N,predicate_atom(F,Name,Label)).
predicate_signature(_,unclassified,null,"Unclassified source form").
predicate_atom(Term,Name,Label) :-
    (atom(Term)->Name=Term;term_string(Term,S,[quoted(true),numbervars(true)]),atom_string(Name,S)),
    source_label(Term,Label).

declaration_target(Head,Target,Arity,Name) :-
    compound(Head),Head=..[Functor,Target|Args],ground(Target),atom(Target),
    (atom_concat(x_,Name,Functor)->true;Name=Functor),
    (memberchk(Name,[argIsa,argGenl,argFormat,argAndRestIsa,argAndRestGenl,
                    resultIsa,resultGenl,arityMin,arityMax,domain,domainSubclass,range,rangeSubclass])->
      Arity=null
    ;memberchk(Name,[arity,valence]),Args=[N],integer(N),N>=0->Arity=N
    ;indexed_declaration(Name)->Arity=null).
indexed_declaration(Name) :-
    atom_concat(arg,Rest,Name),
    member(Suffix,['Isa','Genl','Format']),atom_concat(Number,Suffix,Rest),
    atom_codes(Number,Codes),Codes\=[],maplist(decimal_digit,Codes),!.
decimal_digit(C) :- between(0'0,0'9,C).

mt_key(Mt,Key,Canonical,Label) :-
    context_key(Mt,Key),term_string(Mt,Canonical,[quoted(true),ignore_ops(true)]),source_label(Mt,Label).
source_label(Term,Label) :- with_output_to(string(Label),write_source_term(Term)).
write_source_term(Term) :- var(Term),!,write('?VAR').
write_source_term(Term) :- string(Term),!,write_term(Term,[quoted(true)]).
write_source_term(Term) :- number(Term),!,write(Term).
write_source_term(Term) :- atom(Term),!,
    (atom_concat(x_,Name,Term)->write(Name);write(Term)).
write_source_term(Term) :-
    Term=..[F|Args],write('('),write_source_term(F),
    forall(member(A,Args),(write(' '),write_source_term(A))),write(')').

get_context(State,Key,Canonical,Label,Context) :-
    arg(1,State,Map),
    (get_assoc(Key,Map,Context)->true;
      empty_assoc(Predicates),
      Context=ctx(Key,Canonical,Label,0,0,0,[],Predicates)).
put_context(State,Key,Context) :-
    arg(1,State,Map),put_assoc(Key,Map,Context,Next),nb_linkarg(1,State,Next).
declare_mt(State,Mt,Line) :-
    mt_key(Mt,Key,C,L),get_context(State,Key,C,L,ctx(Key,C,L,R,G,O,Lines,Predicates)),
    put_context(State,Key,ctx(Key,C,L,R,G,O,[Line|Lines],Predicates)).
increment_context(ctx(K,C,L,R,G,O,D,P),Kind,ctx(K,C,L,NR,NG,NO,D,P)) :-
    (Kind==rule->NR is R+1;NR=R),(Kind==gaf->NG is G+1;NG=G),(Kind==other->NO is O+1;NO=O).
update_predicate(ctx(K,C,L,R,G,O,D,Map),Name,Arity,Label,Kind,Line,Declaration,
                 ctx(K,C,L,R,G,O,D,Next)) :-
    Key=Name-Arity,
    (get_assoc(Key,Map,pred(Label,PR,PG,PO,Refs,First,Declarations))->true;
      PR=0,PG=0,PO=0,Refs=0,First=Line,Declarations=[]),
    (Kind==rule->NR is PR+1;NR=PR),(Kind==gaf->NG is PG+1;NG=PG),
    (Kind==other->NO is PO+1;NO=PO),(Kind==reference->NRefs is Refs+1;NRefs=Refs),
    (Declaration==none->Heads=Declarations;sort([Declaration|Declarations],Heads)),
    put_assoc(Key,Map,pred(Label,NR,NG,NO,NRefs,First,Heads),Next).

bump(State,Arg) :- arg(Arg,State,N),Next is N+1,nb_setarg(Arg,State,Next).
record_issue(State,Kind,Error) :-
    message_to_string(Error,Message),arg(7,State,Before),
    nb_linkarg(7,State,[_{kind:Kind,message:Message}|Before]).
source_state(state(Map,N,R,G,O,D,Issues0),Contexts,
             _{semanticAssertionCount:N,ruleCount:R,gafCount:G,otherCount:O,
               unclassifiedSourceForms:Unknown,microtheoryDeclarations:D},Issues) :-
    assoc_to_values(Map,Values),maplist(context_json,Values,Contexts),reverse(Issues0,Issues),
    include(normalization_issue,Issues,UnknownForms),length(UnknownForms,Unknown).
normalization_issue(Issue) :- Issue.kind==normalization.
context_json(ctx(Key,Canonical,Label,R,G,O,D,Map),JSON) :-
    assoc_to_list(Map,Pairs),maplist(predicate_json,Pairs,Predicates),
    Count is R+G+O,reverse(D,Declared),
    (Count=:=0->Only=true;Only=false),
    JSON=_{key:Key,canonical:Canonical,label:Label,ruleCount:R,gafCount:G,otherCount:O,
           assertionCount:Count,declarationLines:Declared,declarationOnly:Only,predicates:Predicates}.
predicate_json((Name-Arity)-pred(Label,R,G,O,D,Line,Heads),JSON) :-
    Count is R+G+O,
    JSON=_{name:Name,label:Label,arity:Arity,headOccurrenceCount:Count,ruleCount:R,gafCount:G,
           otherCount:O,declarationReferenceCount:D,firstSourceLine:Line,declarationHeads:Heads}.

inspect_companion(File,Hash,Info) :-
    (exists_file(File)->
      snapshot(File,Before),Counters=counts(0,0,0,0,0,0,0,0,0,[]),
      catch(setup_call_cleanup(open(File,read,S,[encoding(utf8)]),
             compiled_terms(S,Counters),close(S)),Error,
        (message_to_string(Error,Message),nb_setarg(10,Counters,[Message]))),
      snapshot(File,After),
      Counters=counts(N,R,G,O,M,D,H,F,Unknown,Errors),
      (\+Before =@= After->Status=unstable;Errors=[]->Status=complete;Status=partial),
      companion_header(File,Hash,Identity),
      Info=Before.put(_{path:File,present:true,status:Status,semanticClauseCount:N,
        ruleCount:R,gafCount:G,otherCount:O,metadataFactCount:M,directiveCount:D,
        headerRecordCount:H,footerRecordCount:F,unclassifiedTermCount:Unknown,issues:Errors,identity:Identity})
    ;Info=_{path:File,present:false,status:missing,physicalLineCount:null,semanticClauseCount:null,
            metadataFactCount:null,directiveCount:null}).
compiled_terms(S,Counters) :-
    read_term(S,Term,[syntax_errors(error),quasi_quotations(Quotes),cycles(false)]),
    (Quotes=[]->true;throw(error(quasi_quotation_in_companion,_))),
    (Term==end_of_file->true;
      (Term=(:-_)->bump(Counters,6)
      ;Term=kb_cache_header(_)->bump(Counters,7)
      ;Term=kb_cache_footer(_)->bump(Counters,8)
      ;compound(Term),functor(Term,Name,_),
       (atom_concat(xc_,_,Name);memberchk(Name,[cp,last_clause,source_line,mapping_rows]))->bump(Counters,5)
      ;Term=(Head:-Guard),nonvar(Guard),
       (Guard=x_cid_io(_,Body,_,_)->Semantic=(Head:-Body);
        Guard=..[x_cid|_]->Semantic=Head)->
        bump(Counters,1),classify_assertion(Semantic,Kind,_),
        (Kind==rule->bump(Counters,2);Kind==gaf->bump(Counters,3);bump(Counters,4))
      ;callable(Term),\+is_list(Term),functor(Term,Name,_),
       (atom_concat(x_,_,Name);Name==t)->
        bump(Counters,1),classify_assertion(Term,Kind,_),
        (Kind==gaf->bump(Counters,3);bump(Counters,4))
      ;bump(Counters,9)),
      compiled_terms(S,Counters)).

companion_header(File,SourceHash,Identity) :-
    catch(setup_call_cleanup(open(File,read,S,[encoding(utf8)]),
      (read_term(S,_,[quasi_quotations([])]),read_term(S,kb_cache_header(H),[quasi_quotations([])]),
       is_dict(H),ground(H)),close(S)),_,fail),!,
    (get_dict(sourceHash,H,SourceHash)->SourceCurrent=true;SourceCurrent=false),
    implementation_hash(Current),
    (get_dict(implementationHash,H,Current)->ConverterCurrent=true;ConverterCurrent=false),
    json_value(H,JSONHeader),
    Identity=_{sourceHashMatches:SourceCurrent,implementationMatches:ConverterCurrent,header:JSONHeader}.
companion_header(_,_,_{status:unrecognized_header}).
inspect_index(File,Info) :-
    (exists_file(File)->size_file(File,Size),Info=_{path:File,present:true,sizeBytes:Size,evidence:"Index not used for source or clause counts."}
    ;Info=_{path:File,present:false}).

write_sidecar(File,Data,Status) :-
    (Data.status==unstable;get_dict(compiled,Data,C),C.status==unstable),!,
    Status=_{path:File,status:skipped,message:"Source or companion changed during inspection; prior sidecar retained."}.
write_sidecar(File,Data,Status) :-
    write_derived(File,Data,source(Data.source.path)),Status=_{path:File,status:written}.
write_derived(File,Data,Identity) :-
    (exists_file(File)->
      file_digest(File,Before),
      setup_call_cleanup(open(File,read,S,[encoding(utf8)]),json_read_dict(S,Old),close(S)),
      (same_inventory(Old,Identity)->true;throw(error(inventory_filename_collision(File),_)))
    ;Before=missing),
    stage_path(File,Stage),
    setup_call_cleanup(true,
      (write_json_new(Stage,Data),
       (Before==missing->(\+exists_file(File)->true;throw(error(inventory_changed(File),_)))
       ;file_digest(File,Before)),
       install_stage(Stage,File)),remove_if_exists(Stage)).
same_inventory(Old,source(Path)) :- schema(S),atom_string(S,Old.schema),atom_string(Path,Old.source.path).
same_inventory(Old,mt(Key)) :- schema(S),atom_string(S,Old.schema),atom_string(Key,Old.key).
same_inventory(Old,catalog) :- schema(S),atom_string(S,Old.schema),Old.type=="microtheory_catalog".
write_json_new(File,Data) :-
    setup_call_cleanup(open(File,write,S,[encoding(utf8),newline(posix)]),
      (json_write_dict(S,Data,[width(0)]),nl(S),flush_output(S)),close(S)).

write_mt_catalog(Directory,Catalog,Results) :-
    findall(Key,rollup(Key,_,_,_,_),Keys0),sort(Keys0,Keys),
    findall(Lower-Key-Base,
      (member(Key,Keys),once(rollup(Key,Canonical,_,_,_)),
       read_term_from_atom(Canonical,Term,[]),filename_base(Term,Base),downcase_atom(Base,Lower)),Names),
    maplist(write_mt(Directory,Names),Keys,Catalog,Results),
    schema(S),write_derived_catalog(Directory,_{schema:S,type:microtheory_catalog,entries:Catalog},CatalogResult),
    format('CATALOG ~q~n',[CatalogResult]).

write_mt(Directory,Names,Key,Entry,Result) :-
    once(rollup(Key,Canonical,Label,_,_)),member(Lower-Key-Base,Names),
    findall(K,member(Lower-K-_,Names),SameNames),
    (SameNames=[_]->Stem=Base;crypto_data_hash(Key,Hash,[algorithm(sha256)]),sub_atom(Hash,0,12,_,Suffix),atomic_list_concat([Base,Suffix],'_',Stem)),
    atom_concat(Stem,'.json',Name),directory_file_path(Directory,Name,File),
    findall(Item,(rollup(Key,_,_,Source,Context),Source\=='',Item=Context.put(source,Source)),Files),
    findall(R,(member(C,Files),R=C.ruleCount),Rs),sum_list(Rs,Rule),
    findall(G,(member(C,Files),G=C.gafCount),Gs),sum_list(Gs,Gaf),
    findall(O,(member(C,Files),O=C.otherCount),Os),sum_list(Os,Other),
    Total is Rule+Gaf+Other,schema(S),
    aggregate_predicates(Files,Predicates),
    (Total=:=0,member(Declared,Files),Declared.declarationLines\=[]->DeclarationOnly=true;DeclarationOnly=false),
    (Total=:=0,DeclarationOnly==false->ReferencedOnly=true;ReferencedOnly=false),
    JSON=_{schema:S,key:Key,canonical:Canonical,label:Label,ruleCount:Rule,gafCount:Gaf,
           otherCount:Other,assertionCount:Total,declarationOnly:DeclarationOnly,referencedOnly:ReferencedOnly,
           files:Files,predicates:Predicates,
           note:"Counts are on-disk occurrences; declaration target references do not add rules/GAFs. Physical companion lines are file metrics, not MT clause counts."},
    catch((write_derived(File,JSON,mt(Key)),Result=_{path:File,status:written}),
      Error,(message_to_string(Error,M),Result=_{path:File,status:skipped,message:M})),
    Entry=_{key:Key,canonical:Canonical,label:Label,filename:Name,assertionCount:Total,
            ruleCount:Rule,gafCount:Gaf,otherCount:Other,status:Result.status}.

aggregate_predicates(Files,Predicates) :-
    findall(Key-Reference,(member(File,Files),member(P,File.predicates),Key=P.name-P.arity,
      Reference=P.put(_{source:File.source,compiled:File.compiled})),Pairs),
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),
    maplist(aggregate_predicate,Groups,Predicates).
aggregate_predicate((Name-Arity)-Files,Data) :-
    Files=[First|_],
    findall(R,(member(F,Files),R=F.ruleCount),Rs),sum_list(Rs,Rules),
    findall(G,(member(F,Files),G=F.gafCount),Gs),sum_list(Gs,Gafs),
    findall(O,(member(F,Files),O=F.otherCount),Os),sum_list(Os,Others),
    findall(D,(member(F,Files),D=F.declarationReferenceCount),Ds),sum_list(Ds,Refs),
    Head is Rules+Gafs+Others,
    Data=_{name:Name,label:First.label,arity:Arity,headOccurrenceCount:Head,
           ruleCount:Rules,gafCount:Gafs,otherCount:Others,declarationReferenceCount:Refs,files:Files}.
write_derived_catalog(Directory,Data,Result) :-
    directory_file_path(Directory,'_catalog.json',File),
    catch((write_derived(File,Data,catalog),Result=_{path:File,status:written}),
      Error,(message_to_string(Error,M),Result=_{path:File,status:skipped,message:M})).

filename_base(Term,Base) :-
    flattened_name(Term,Raw),
    atom_codes(Raw,Codes),maplist(filename_code,Codes,SafeCodes),atom_codes(Safe0,SafeCodes),
    normalize_space(atom(Safe),Safe0),
    (Safe\=='',atom_length(Safe,N),N=<140,\+reserved_name(Safe)->Base=Safe;
      crypto_data_hash(Raw,Hash,[algorithm(sha256)]),sub_atom(Hash,0,12,_,Suffix),
      atom_length(Safe,Length),Take is min(100,Length),sub_atom(Safe,0,Take,_,Prefix),
      atomic_list_concat([mt,Prefix,Suffix],'_',Base)).
flattened_name(Term,Name) :- atom(Term),!, (atom_concat(x_,Name,Term)->true;Name=Term).
flattened_name(Term,Name) :- atomic(Term),!,format(atom(Name),'~w',[Term]).
flattened_name(Term,Name) :- Term=..Parts,maplist(flattened_name,Parts,Names),atomic_list_concat(Names,'_',Name).
filename_code(Code,0'_) :- (Code<32;memberchk(Code,[0'<,0'>,0':,0'",0'/,0'\\,0'|,0'?,0'*,0'.])),!.
filename_code(Code,Code).
reserved_name(Name) :-
    upcase_atom(Name,Upper),
    (memberchk(Upper,['CON','PRN','AUX','NUL','CLOCK$','_CATALOG'])
    ;atom_concat('COM',N,Upper),catch(atom_number(N,V),_,fail),between(0,9,V)
    ;atom_concat('LPT',N,Upper),catch(atom_number(N,V),_,fail),between(0,9,V)).

write_rollups(Directory,Files,Catalog) :-
    directory_file_path(Directory,'microtheories.csv',Mts),
    findall(Row,(member(C,Catalog),Row=row(C.key,C.label,C.canonical,C.filename,C.assertionCount,C.ruleCount,C.gafCount,C.otherCount)),MtRows),
    csv_write_file(Mts,[row(key,label,canonical,filename,assertionCount,ruleCount,gafCount,otherCount)|MtRows]),
    directory_file_path(Directory,'microtheory-predicates-files.csv',Preds),
    findall(Row,
      (rollup(Key,_,_,Source,C),member(P,C.predicates),
       Row=row(Key,C.label,P.name,P.label,P.arity,Source,C.compiled,P.headOccurrenceCount,
                P.ruleCount,P.gafCount,P.otherCount,P.declarationReferenceCount)),Rows),
    csv_write_file(Preds,[row(microtheory,label,predicate,predicateLabel,arity,source,compiled,
       headOccurrenceCount,ruleCount,gafCount,otherCount,declarationReferenceCount)|Rows]),
    directory_file_path(Directory,'kb-file-counts.csv',Counts),
    maplist(file_count_row,Files,CountRows),
    csv_write_file(Counts,[row(source,sourceBytes,compiled,compiledPhysicalLines,compiledSemanticClauses,
                              originalSemanticAssertions,ruleCount,gafCount,otherCount,status)|CountRows]).

file_count_row(Data,row(Source,Size,Compiled,Lines,Clauses,N,R,G,O,Status)) :-
    Source=Data.source.path,Status=Data.status,
    optional(Data.source,sizeBytes,Size),
    (get_dict(compiled,Data,C)->optional(C,path,Compiled),optional(C,physicalLineCount,Lines),
                              optional(C,semanticClauseCount,Clauses)
    ;atom_concat(Source,'.pl',Compiled),Lines=null,Clauses=null),
    (get_dict(counts,Data,Counts)->optional(Counts,semanticAssertionCount,N),optional(Counts,ruleCount,R),
                                 optional(Counts,gafCount,G),optional(Counts,otherCount,O)
    ;N=null,R=null,G=null,O=null).
optional(Dict,Key,Value) :- (get_dict(Key,Dict,Value)->true;Value=null).
