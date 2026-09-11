:- module(kb_reader,
          [ read_source/4,
            parse_text/4,
            normalize_query/3
          ]).

/** <module> powder: inert KIF/KRF/MeTTa reader.

read_source(+File,+Options,-Assertions,-Info) returns
assertion(Semantic,Names,Microtheory,Line,Properties,OccurrenceKey).
OccurrenceKey is a SHA-256 source-content matching key, NOT an assertion ID.
The caller must distinguish repeated occurrences with the same key.

Options include strict_mappings(Boolean), features(List), encoding(Encoding),
diagnostics(Boolean), and sumo_mappings(Boolean) for explicit KIF selection.
KRF and MeTTa always bypass mappings regardless of options or source contents.
Query normalization also bypasses all mappings and source declarations.
Trusted host code may supply diagnostic_handler(Module:Closure). The closure
receives warning(File,Line,Column,Message), after duplicate-output budgeting,
so a compiler can clear its live progress line, print, and redraw. Source
data never provides or invokes a handler; diagnostics(false) disables it.
An independent trusted warning_observer(Module:Closure) receives every real
warning before output budgeting, even with diagnostics(false), allowing
accurate host-side warning counts when a later source error aborts the read.
read_source/4 also accepts a trusted progress_callback(Module:Closure),
called with (BytesRead,TotalBytes). Initial/final reports are unconditional;
periodic reports are throttled to 200ms, checking every 128 top-level forms.
A single unusually large form is parsed before its next progress check.

Reserved inert MeTTa structures: metta_value(Value) wraps standalone values,
lists and dicts; metta_exec(Value) preserves ! syntax without execution;
metta_expression([]) preserves an empty S-expression.  metta_map is the
ground dict tag.  These names/tags are structural, not semantic vocabulary.
KIF/KRF quotation is represented by x_quote/1. Row variables retain their
original sigils and occupy one variable slot; no sequence expansion occurs.

Only approved KIF/KRF formatting slots (genFormat argument 3 and argument 2
of do-prefixed predicates whose first argument is a string) are recursively
interpreted as formatting data. Their source
lists remain Prolog lists (including singleton and
nested lists), and symbols such as A-THE-WORD remain literal, normally encoded
atoms. This slot bypasses SUMO mappings. Variables retain normal sharing,
including an unconstrained ?Args query variable. Other application syntax
is unchanged; MeTTa retains its separate structural interpretation.
Approved S-expression descriptors append informative note(Message) entries
to mapping_rows AND independent notices-[Messages...] properties; they do
not enter warning callbacks, console warnings, or Info.warnings. Unexpected
application interpretations and nonfatal mapping anomalies record both
warnings(Message) markers and warnings-[Messages...] properties, and use
the source-warning pipeline. The shared creation-time recorder preserves
message order/multiplicity and omits empty diagnostic properties. Fatal
errors still throw; the compiler records errors-[Messages...] and matching
errors(Message) failure markers, without manufacturing successful assertions.
At the top of an approved formatting slot, the NIL symbol instead passes
through special-symbol encoding (NIL remains NIL). It never expands to
an empty/default list or counts format placeholders. The string "NIL"
remains a string; explicit descriptor lists retain their literal contents.
Elsewhere in KIF/KRF, recoverable numeric/string-headed applications are
retained as higher-order application data, for example (1 2) becomes t(1,2),
with an actionable source warning. They never become lists and are not
assigned numeric/string predicate execution semantics.

Microtheories may be ground symbols or native compound terms. Context
constructors reuse normal symbol/variable/argument encoding, but never
SUMO mappings, MeTTa structures, formatting-list interpretation, or scalar
application recovery. They remain metadata only, without synthetic clause
arguments or stringification.

Unknown wrapper property names use 'cyc:<OriginalKeyword>' keys. Their
values are ground inert data: sexpr(List), quoted(Atom), variable(Name,Kind),
or ordinary strings, numbers and atoms. NIL omission applies only to the
creator and creation_date properties.
*/

:- use_module(library(apply)).
:- use_module(library(assoc)).
:- use_module(kb_symbols).
:- use_module(library(crypto)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(option)).
:- use_module(library(readutil)).
:- use_module(kb_mappings).

:- dynamic source_case_cache/3.

read_source(File,Options,Assertions,Info) :-
    must_be(atom,File), must_be(list,Options),
    source_dialect(File,Dialect),
    source_encoding(Dialect,Options,Encoding),
    reader_features(Options,Features),
    validate_source_encoding(File,Encoding),
    setup_call_cleanup(
        open(File,read,Stream,[encoding(Encoding),type(text)]),
        once(read_source_stream(Stream,File,Dialect,Features,Options,Assertions,Info)),
        close(Stream)).

read_source_stream(Stream,File,Dialect,Features,Options,Assertions,Info) :-
    initialize_progress(File,Options,ProgressOptions),
    leading_trivia(Stream,File,Leading),
    source_mapping_mode(File,Dialect,Leading,Options,Mode),
    mapping_context(Mode,Map,Hash),
    default_microtheory(File,Mt),
    empty_assoc(Counts),
    Ctx=ctx(File,Dialect,Features,[warning_state(warning_counts(Counts))|ProgressOptions],Map),
    read_assertions(Stream,Ctx,Mt,[],Assertions,Warnings),
    physical_line_count(Stream,Lines),
    finish_progress(Stream,ProgressOptions),
    Info=info{dialect:Dialect,mappingHash:Hash,warnings:Warnings,lineCount:Lines}.

initialize_progress(File,Options,WithProgress) :-
    ( File\=='<text>', option(progress_callback(Handler),Options)
    -> qualified_callback(Handler), size_file(File,Total),
       statistics(walltime,[Now,_]),
       State=progress(Handler,Total,0,Now,0),
       WithProgress=[reader_progress_state(State)|Options],
       notify_progress(Handler,0,Total)
    ; WithProgress=Options ).

qualified_callback(Handler) :-
    must_be(callable,Handler),
    ( Handler=Module:Goal, atom(Module), callable(Goal) -> true
    ; throw(error(domain_error(module_qualified_progress_callback,Handler),_)) ).

tick_progress(Stream,ctx(_,_,_,Options,_)) :-
    ( option(reader_progress_state(State),Options)
    -> arg(5,State,Before), Count is Before+1,
       ( Count>=128
       -> nb_setarg(5,State,0),
          statistics(walltime,[Now,_]),arg(4,State,Previous),
          ( Now-Previous>=200 -> report_progress(Stream,State,Now,false) ; true )
       ; nb_setarg(5,State,Count) )
    ; true ).

finish_progress(Stream,Options) :-
    ( option(reader_progress_state(State),Options)
    -> statistics(walltime,[Now,_]),report_progress(Stream,State,Now,true)
    ; true ).

report_progress(Stream,State,Now,Force) :-
    arg(1,State,Handler),arg(2,State,Total),arg(3,State,PreviousBytes),
    stream_property(Stream,position(Position)),
    stream_position_data(byte_count,Position,PositionBytes),
    Bytes is min(Total,max(PreviousBytes,PositionBytes)),
    ( Force==true ; Bytes>PreviousBytes ), !,
    notify_progress(Handler,Bytes,Total),
    nb_setarg(3,State,Bytes),nb_setarg(4,State,Now).
report_progress(_,_,_,_).

notify_progress(Handler,Bytes,Total) :-
    ( call(Handler,Bytes,Total) -> true
    ; throw(error(progress_callback_failed(Handler),_)) ).

parse_text(Text,Dialect,Options,Assertions) :-
    must_be(text,Text), must_be(oneof([kif,krf,metta]),Dialect),
    must_be(list,Options), reader_features(Options,Features),
    setup_call_cleanup(
        open_string(Text,Stream),
        once(read_source_stream(Stream,'<text>',Dialect,Features,Options,Assertions,_)),
        close(Stream)), !.

normalize_query(Text,Semantic,Names) :-
    must_be(text,Text),
    setup_call_cleanup(
        open_string(Text,Stream),
        ( Ctx=ctx('<query>',kif,[],[diagnostics(false)],none),
          next_form(Stream,Ctx,Node),
          ( Node==end_of_file -> source_error('<query>',1,1,'Expected one expression') ; true ),
          next_form(Stream,Ctx,End),
          ( End==end_of_file -> true
          ; node_error(End,'<query>','Expected exactly one query expression') ),
          normalize_expression(Node,kif,'<query>',Semantic,Names)
        ),
        close(Stream)).

source_dialect(File,Dialect) :-
    file_name_extension(_,Ext,File), downcase_atom(Ext,Lower),
    ( memberchk(Lower,[kif,krf,metta]) -> Dialect=Lower
    ; source_error(File,1,1,'Unsupported source extension (expected .kif, .krf or .metta)') ).

source_encoding(metta,Options,utf8) :- !,
    ( option(encoding(Other),Options), Other \== utf8
    -> throw(error(domain_error(metta_encoding,Other),_)) ; true ).
source_encoding(_,Options,Encoding) :-
    option(encoding(Requested),Options,iso_latin_1),
    must_be(oneof([iso_latin_1,latin1,utf8]),Requested),
    ( Requested==latin1 -> Encoding=iso_latin_1 ; Encoding=Requested ).

% SWI's text decoder substitutes U+FFFD after a warning. Check UTF-8 bytes
% first so explicitly Unicode sources never silently change meaning.
validate_source_encoding(File,utf8) :- !,
    setup_call_cleanup(open(File,read,S,[type(binary)]),
                       utf8_stream(S,File,1,1),close(S)).
validate_source_encoding(_,_).

utf8_stream(Stream,File,Line,Column) :-
    get_byte(Stream,Byte),
    ( Byte=:= -1 -> true
    ; Byte<128
    -> ( Byte=:=10 -> L is Line+1, C=1
       ; Byte=:=9 -> L=Line, C is ((Column-1)//8+1)*8+1
       ; L=Line, C is Column+1 ),
       utf8_stream(Stream,File,L,C)
    ; utf8_sequence(Byte,Tail,Low,High)
    -> utf8_continuation(Stream,File,Line,Column,Low,High),
       utf8_continuations(Tail,Stream,File,Line,Column),
       C is Column+1, utf8_stream(Stream,File,Line,C)
    ; invalid_utf8(File,Line,Column)
    ).

utf8_sequence(Byte,0,128,191) :- between(194,223,Byte).
utf8_sequence(224,1,160,191).
utf8_sequence(Byte,1,128,191) :- between(225,236,Byte).
utf8_sequence(237,1,128,159).
utf8_sequence(Byte,1,128,191) :- between(238,239,Byte).
utf8_sequence(240,2,144,191).
utf8_sequence(Byte,2,128,191) :- between(241,243,Byte).
utf8_sequence(244,2,128,143).
utf8_continuations(0,_,_,_,_) :- !.
utf8_continuations(N,S,F,L,C) :-
    utf8_continuation(S,F,L,C,128,191),
    M is N-1, utf8_continuations(M,S,F,L,C).
utf8_continuation(S,F,L,C,Low,High) :-
    get_byte(S,B),
    ( between(Low,High,B) -> true ; invalid_utf8(F,L,C) ).
invalid_utf8(F,L,C) :-
    source_error(F,L,C,'Invalid UTF-8 source bytes (no replacement characters were imported)').

reader_features(Options,Features) :-
    option(features(Raw),Options,[]), must_be(list,Raw),
    maplist(feature_name,Raw,Names), sort(Names,Features).

feature_name(Raw,Name) :-
    must_be(text,Raw), text_atom(Raw,A), downcase_atom(A,Lower),
    ( atom_concat(':',Rest,Lower) -> Name=Rest ; Name=Lower ),
    ( valid_feature(Name) -> true
    ; throw(error(domain_error(reader_feature,Raw),_)) ).

text_atom(Text,Atom) :-
    ( atom(Text) -> Atom=Text ; atom_string(Atom,Text) ).

source_mapping_mode(_,Dialect,_,_,none) :- memberchk(Dialect,[krf,metta]), !.
source_mapping_mode(_,_,_,Options,sumo) :- option(sumo_mappings(true),Options,false), !.
source_mapping_mode(_,_,_,Options,global) :- option(sumo_mappings(false),Options,true), !.
source_mapping_mode(File,_,Leading,_,sumo) :-
    ( sumo_path(File) ; sumo_header(Leading) ), !.
source_mapping_mode(_,_,_,_,global).

sumo_path(File) :-
    downcase_atom(File,Lower),
    ( file_base_name(Lower,Base), memberchk(Base,['tinykb.kif','merge.kif','engformat.kif'])
    ; sub_atom(Lower,_,_,_,'sumo')
    ).
sumo_header(Leading) :-
    string_lower(Leading,Lower),
    ( split_string(Lower,"\n","\r",Lines),
      member(Line,Lines), normalize_space(string(";; logos: sumo-mappings"),Line)
    ; sub_string(Lower,_,_,_,"suggested upper merged ontology")
    ; sub_string(Lower,_,_,_,"sumo (")
    ).

default_microtheory(File,Mt) :-
    original_basename(File,Base),
    ( file_name_extension(Stem,_,Base) -> true ; Stem=Base ),
    downcase_atom(Stem,Lower),
    ( member(Suffix,[psc,mt,microtheory,kb]), atom_concat(_,Suffix,Lower)
    -> Full=Stem ; atom_concat(Stem,'Mt',Full) ),
    semantic_symbol(Full,Mt).

original_basename('<text>','<text>') :- !.
original_basename(File,Base) :-
    file_base_name(File,Supplied),
    ( current_prolog_flag(windows,true),
      file_directory_name(File,Directory),
      catch(time_file(Directory,Stamp),_,fail)
    -> with_mutex(logos_source_case,
                  directory_case_map(Directory,Stamp,Names)),
       downcase_atom(Supplied,Key),
       ( get_assoc(Key,Names,Found) -> Base=Found ; Base=Supplied )
    ; Base=Supplied ).

directory_case_map(Directory,Stamp,Names) :-
    source_case_cache(Directory,Stamp,Names), !.
directory_case_map(Directory,Stamp,Names) :-
    directory_files(Directory,Files),
    empty_assoc(Empty),
    foldl(case_name,Files,Empty,Names),
    retractall(source_case_cache(Directory,_,_)),
    assertz(source_case_cache(Directory,Stamp,Names)).

case_name(Name,A0,A) :-
    downcase_atom(Name,Lower), put_assoc(Lower,A0,Name,A).

read_assertions(Stream,Ctx,Mt,DirectiveProps,Assertions,Warnings) :-
    next_form(Stream,Ctx,Node),
    ( Node==end_of_file -> Assertions=[], Warnings=[]
    ; Ctx=ctx(File,Dialect,_,_,_),
      ( Dialect\==metta, microtheory_declaration(Node)
      -> parse_microtheory(Node,File,NewMt,NewProps),
         read_assertions(Stream,Ctx,NewMt,NewProps,Assertions,Warnings)
      ; source_assertion(Node,Ctx,Mt,DirectiveProps,Assertion,LocalWarnings),
        Assertions=[Assertion|Tail],
        append(LocalWarnings,MoreWarnings,Warnings),
        read_assertions(Stream,Ctx,Mt,DirectiveProps,Tail,MoreWarnings)
      )
    ).

source_assertion(Node,ctx(File,Dialect,_,Options,Map),DefaultMt,DirectiveProps,
                 assertion(Semantic,Names,Mt,Line,Properties,Key),Warnings) :-
    Node=n(Line,_,_),
    ( Dialect\==metta, assertion_wrapper(Node)
    -> unwrap_assertion(Node,File,Formula,WrapperProps,Override),
       ( Override==none -> Mt=DefaultMt ; Mt=Override )
    ; Formula=Node, WrapperProps=[], Mt=DefaultMt ),
    append(DirectiveProps,WrapperProps,BaseProps),
    transform_ast(Formula,Map,File,Options,Mapped,Rows,MappingWarnings),
    interpretation_events(Mapped,Dialect,File,Options,Events),
    interpretation_event_diagnostics(Events,InterpretationDiagnostics,DataWarnings),
    append(MappingWarnings,DataWarnings,Warnings),
    normalize_assertion(Mapped,Dialect,File,Semantic,Names),
    maplist(warning_diagnostic,MappingWarnings,MappingDiagnostics),
    append(MappingDiagnostics,InterpretationDiagnostics,Diagnostics),
    diagnostic_metadata(Diagnostics,DiagnosticProperties,Markers),
    append(Rows,Markers,ProvenanceRows),
    append(BaseProps,DiagnosticProperties,AllProperties),
    Properties=[mapping_rows-ProvenanceRows|AllProperties],
    strip_locations(Node,Original),
    term_string(occurrence(Dialect,Mt,DirectiveProps,Original),Identity,
                [quoted(true),ignore_ops(true)]),
    crypto_data_hash(Identity,Key,[algorithm(sha256),encoding(utf8)]).

warning_diagnostic(warning(_,_,_,Message),diagnostic(warnings,Message)).

interpretation_event_diagnostics([],[],[]).
interpretation_event_diagnostics([note(Message)|Events],
                                 [diagnostic(notices,Message)|Diagnostics],Warnings) :-
    interpretation_event_diagnostics(Events,Diagnostics,Warnings).
interpretation_event_diagnostics([warning(File,Line,Column,Message)|Events],
                                 [diagnostic(warnings,Message)|Diagnostics],
                                 [warning(File,Line,Column,Message)|Warnings]) :-
    interpretation_event_diagnostics(Events,Diagnostics,Warnings).

interpretation_events(Node,Dialect,File,Options,Events) :-
    (Dialect==metta->Interpretations=[];
      interpretation_event_nodes([Node],File,Options,Interpretations,[])),
    findall(note(Message),exceptional_constant_notice(Node,Message),Notices),
    append(Interpretations,Notices,Events).

exceptional_constant_notice(Node,Message) :-
    sub_term(Sub,Node),nonvar(Sub),Sub=n(Line,Column,Value),
    (Value=sym(Symbol);Value=quoted(Symbol);Value=mapped(Symbol)),
    semantic_symbol(Symbol,x_TheEmptyList),
    format(string(Message),
      'TheEmptyList is preserved as x_TheEmptyList data (source line ~d, column ~d), distinct from NIL and an explicit list.',
      [Line,Column]).

interpretation_event_nodes([],_,_,Tail,Tail).
interpretation_event_nodes([Node|Nodes],File,Options,Events,Tail) :-
    interpretation_event_node(Node,File,Options,Events,More),
    interpretation_event_nodes(Nodes,File,Options,More,Tail).

interpretation_event_node(n(_,_,list([Head|Arguments])),
                          File,Options,Events,Tail) :-
    format_data_slot(Head,Arguments,Predicate,Position),
    nth1(Position,Arguments,Descriptor,OtherArguments), !,
    ( descriptor_list_location(Descriptor,Line,Column)
    -> format(string(Message),
              '~w argument ~d is preserved as recursive list data (descriptor at source line ~d, column ~d), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.',
              [Predicate,Position,Line,Column]),
       Events=[note(Message)|More]
    ; Events=More ),
    interpretation_event_nodes(OtherArguments,File,Options,More,Tail).
interpretation_event_node(n(Line,Column,list([Head|Arguments])),File,Options,
                          [Warning|More],Tail) :-
    scalar_application_head(Head,Value), !,
    format(string(Message),
           'Non-symbol predicate position ~q is preserved as higher-order application data t(~q,...), not a list. Check the intended predicate or keep it as inert data; no numeric/string predicate execution semantics are assigned.',
           [Value,Value]),
    Warning=warning(File,Line,Column,Message),
    emit_source_warning(Warning,application_head(Value),Options),
    interpretation_event_nodes(Arguments,File,Options,More,Tail).
interpretation_event_node(n(Line,Column,list([])),File,Options,[Warning|Tail],Tail) :- !,
    Message="Empty expression outside a declared list-data slot retained as x_TheEmptyList.",
    Warning=warning(File,Line,Column,Message),
    emit_source_warning(Warning,empty_expression,Options).
interpretation_event_node(n(_,_,list(Nodes)),File,Options,Events,Tail) :- !,
    interpretation_event_nodes(Nodes,File,Options,Events,Tail).
interpretation_event_node(n(_,_,bound(_,_,Formula)),File,Options,Events,Tail) :- !,
    interpretation_event_node(Formula,File,Options,Events,Tail).
interpretation_event_node(n(_,_,quote(Node)),File,Options,Events,Tail) :- !,
    interpretation_event_node(Node,File,Options,Events,Tail).
interpretation_event_node(_,_,_,Tail,Tail).

descriptor_list_location(n(Line,Column,list(_)),Line,Column).
descriptor_list_location(n(_,_,quote(Node)),Line,Column) :-
    descriptor_list_location(Node,Line,Column).

scalar_application_head(n(_,_,num(Value)),Value).
scalar_application_head(n(_,_,lexnum(_,Value)),Value).
scalar_application_head(n(_,_,str(Value)),Value).

microtheory_declaration(n(_,_,list([n(_,_,sym('in-microtheory'))|_]))).
parse_microtheory(n(L,C,list([_,MtNode|Args])),File,Mt,Props) :- !,
    microtheory_symbol(MtNode,File,Mt),
    directive_options(Args,File,[],Props),
    ( ground(Mt) -> true ; source_error(File,L,C,'Microtheory must be a ground symbol or compound term') ).
parse_microtheory(Node,File,_,_) :-
    node_error(Node,File,'in-microtheory requires a ground microtheory symbol or compound term').

microtheory_symbol(n(_,_,sym(A)),_,Mt) :- !, semantic_symbol(A,Mt).
microtheory_symbol(n(_,_,quoted(A)),_,Mt) :- !, semantic_symbol(A,Mt).
microtheory_symbol(Node,File,Mt) :-
    Node=n(_,_,list([_|_])), !,
    normalize_expression(Node,context,File,Native,_),
    ( ground(Native), callable(Native), \+is_list(Native), \+is_dict(Native)
    -> Mt=Native
    ; node_error(Node,File,'Microtheory must be a ground symbol or native compound term') ).
microtheory_symbol(Node,File,_) :-
    node_error(Node,File,'Microtheory must be a ground symbol or native compound term').

directive_options([],_,_,[]).
directive_options([Key,Value|Rest],File,Seen,[exclude_globals-Boolean|Props]) :-
    node_symbol(Key,K), downcase_atom(K,':exclude-globals'), !,
    ( memberchk(exclude_globals,Seen)
    -> node_error(Key,File,'Duplicate :exclude-globals option') ; true ),
    ( node_symbol(Value,V), downcase_atom(V,Lower),
      (Lower==t -> Boolean=true ; Lower==nil -> Boolean=false)
    -> true ; node_error(Value,File,':exclude-globals expects t or nil') ),
    directive_options(Rest,File,[exclude_globals|Seen],Props).
directive_options([Node|_],File,_,_) :-
    node_error(Node,File,'Malformed or unsupported in-microtheory option').

assertion_wrapper(n(_,_,list([n(_,_,sym(Key))|_]))) :-
    atom_concat(':',Rest,Key), Rest\==''.

unwrap_assertion(n(L,C,list(Items)),File,Formula,Props,Mt) :-
    wrapper_pairs(Items,File,[],none,none,Formula,Mt,Props),
    ( Formula==none -> source_error(File,L,C,'Assertion wrapper is missing :KIF') ; true ).

wrapper_pairs([],_,_,Formula,Mt,Formula,Mt,[]).
wrapper_pairs([Key,Value|Rest],File,Seen,F0,Mt0,Formula,Mt,Props) :- !,
    ( node_symbol(Key,Keyword), atom_concat(':',_,Keyword)
    -> downcase_atom(Keyword,Lower)
    ; node_error(Key,File,'Expected a wrapper property keyword') ),
    ( memberchk(Lower,Seen) -> node_error(Key,File,'Duplicate assertion wrapper property') ; true ),
    ( Lower==':kif' -> F1=Value, Mt1=Mt0, Props=Tail
    ; Lower==':microtheory'
    -> microtheory_symbol(Value,File,Mt1), F1=F0, Props=Tail
    ; F1=F0, Mt1=Mt0,
      property_name(Lower,Keyword,Property),
      ( memberchk(Property,[creator,creation_date]), nil_node(Value)
      -> Props=Tail
      ; inert_metadata(Value,Data), Props=[Property-Data|Tail] )
    ),
    wrapper_pairs(Rest,File,[Lower|Seen],F1,Mt1,Formula,Mt,Tail).
wrapper_pairs([Node],File,_,_,_,_,_,_) :-
    node_error(Node,File,'Assertion wrapper property has no value').

property_name(':direction',_,direction) :- !.
property_name(':monotonicity',_,monotonicity) :- !.
property_name(':creator',_,creator) :- !.
property_name(':creation-date',_,creation_date) :- !.
property_name(':id',_,id) :- !.
property_name(':assertion-id',_,id) :- !.
property_name(_,Keyword,Property) :- atom_concat('cyc:',Keyword,Property).

nil_node(n(_,_,sym(A))) :- downcase_atom(A,nil).
node_symbol(n(_,_,sym(A)),A).
node_symbol(n(_,_,quoted(A)),A).

inert_metadata(n(_,_,sym(A)),A).
inert_metadata(n(_,_,quoted(A)),quoted(A)).
inert_metadata(n(_,_,var(N,K)),variable(N,K)).
inert_metadata(n(_,_,num(N)),N).
inert_metadata(n(_,_,lexnum(_,N)),N).
inert_metadata(n(_,_,str(S)),S).
inert_metadata(n(_,_,list(Nodes)),sexpr(Values)) :- maplist(inert_metadata,Nodes,Values).
inert_metadata(n(_,_,quote(Node)),quote(Value)) :- inert_metadata(Node,Value).
inert_metadata(n(_,_,execute(Node)),execute(Value)) :- inert_metadata(Node,Value).

% Preserve the historical raw-token identity while correcting decimal
% spellings (such as .5) that SWI previously left as symbols.
strip_locations(n(_,_,lexnum(Original,_)),sym(Original)) :- !.
strip_locations(n(_,_,Value),Plain) :- !,
    strip_locations(Value,Plain).
strip_locations(Term,Plain) :-
    ( compound(Term)
    -> compound_name_arguments(Term,F,Args),
       maplist(strip_locations,Args,Ps),
       compound_name_arguments(Plain,F,Ps)
    ; Plain=Term ).

normalize_assertion(n(L,C,list([n(_,_,sym('<===')),Head|Body])),Dialect,File,
                    (H :- Conjunction),Names) :-
    Dialect\==metta, !,
    norm(Head,Dialect,File,[],state([],[]),S1,H),
    callable_head(H,Head,File),
    norm_nodes(Body,Dialect,File,[],S1,S2,Goals),
    maplist(body_goal(File,L,C),Goals),
    application(and,Goals,Conjunction),
    names_for((H:-Conjunction),S2,Names).
normalize_assertion(n(L,C,list([n(_,_,sym('<==='))])),Dialect,File,_,_) :-
    Dialect\==metta, !, source_error(File,L,C,'<=== requires a head').
normalize_assertion(Node,Dialect,File,Semantic,Names) :-
    normalize_expression(Node,Dialect,File,Raw,Names),
    assertion_head(Node,Dialect,File,Raw,Semantic).

normalize_expression(Node,Dialect,File,Semantic,Names) :-
    norm(Node,Dialect,File,[],state([],[]),State,Semantic),
    names_for(Semantic,State,Names).

assertion_head(n(_,_,execute(_)),metta,_,Raw,Raw) :- !.
assertion_head(n(_,_,list([_|_])),metta,_,Raw,Semantic) :- !,
    ( (is_list(Raw); is_dict(Raw)) -> Semantic=metta_value(Raw) ; Semantic=Raw ).
assertion_head(_,metta,_,Raw,metta_value(Raw)) :- !.
assertion_head(Node,_,File,Raw,Raw) :-
    ( (Node=n(_,_,list([_|_])); Node=n(_,_,bound(_,_,_)))
    -> callable_head(Raw,Node,File)
    ; node_error(Node,File,'KIF/KRF assertions must be nonempty S-expressions') ).

callable_head(Head,Node,File) :-
    ( nonvar(Head), callable(Head), \+ is_list(Head), \+ is_dict(Head)
    -> true ; node_error(Node,File,'Assertion head must be an application') ).
body_goal(File,L,C,Goal) :-
    ( nonvar(Goal), callable(Goal), \+ is_list(Goal), \+ is_dict(Goal)
    -> true ; source_error(File,L,C,'Rule body elements must be applications') ).

names_for(Term,state(_,Registry),Names) :-
    term_variables(Term,Vars), maplist(registered_name(Registry),Vars,Names).
registered_name([Name-V|_],Var,Name) :- V==Var, !.
registered_name([_|Pairs],Var,Name) :- registered_name(Pairs,Var,Name).

norm(n(_,_,var(Name,_)),_,_,Bound,S0,S,Var) :- !,
    resolve_variable(Name,Bound,S0,S,Var).
norm(n(_,_,num(N)),_,_,_,S,S,N) :- !.
norm(n(_,_,lexnum(_,N)),_,_,_,S,S,N) :- !.
norm(n(_,_,str(Text)),_,_,_,S,S,Text) :- !.
norm(n(_,_,sym(A)),_,_,_,S,S,Term) :- !, semantic_symbol(A,Term).
norm(n(_,_,quoted(A)),_,_,_,S,S,Term) :- !, semantic_symbol(A,Term).
norm(n(_,_,mapped(A)),_,_,_,S,S,Term) :- !, semantic_symbol(A,Term).
norm(n(_,_,quote(Node)),Dialect,File,Bound,S0,S,x_quote(Term)) :- !,
    norm(Node,Dialect,File,Bound,S0,S,Term).
norm(n(_,_,execute(Node)),metta,File,Bound,S0,S,metta_exec(Term)) :- !,
    norm(Node,metta,File,Bound,S0,S,Term).
norm(n(_,_,bound(Target,Binders,Formula)),Dialect,File,Bound,S0,S,Term) :- !,
    allocate_binders(Binders,Bound,Inner,S0,S1,Vars),
    norm(Formula,Dialect,File,Inner,S1,S,Body),
    semantic_symbol(Target,Functor),
    nest_binders(Vars,Functor,Body,Term).
norm(n(L,C,list([Head|Arguments])),Dialect,File,Bound,S0,S,Term) :-
    memberchk(Dialect,[kif,krf]), format_data_slot(Head,Arguments,_,Position),
    nth1(Position,Arguments,_), !,
    norm(Head,Dialect,File,Bound,S0,S1,H),
    norm_format_arguments(Arguments,Position,Dialect,File,Bound,S1,S,Normalized),
    normalized_application(H,Normalized,Dialect,File,L,C,Term).
norm(n(_,_,list([n(_,_,sym('[]'))|Nodes])),metta,File,Bound,S0,S,Terms) :- !,
    norm_nodes(Nodes,metta,File,Bound,S0,S,Terms).
norm(n(L,C,list(Nodes)),metta,File,Bound,S0,S,Dict) :-
    Nodes\=[], maplist(pair_node,Nodes), !,
    norm_pairs(Nodes,File,Bound,S0,S,Pairs),
    pairs_keys_local(Pairs,Keys), sort(Keys,Unique),
    ( same_length(Keys,Unique)
    -> catch(dict_create(Dict,metta_map,Pairs),
             error(type_error('dict-key',BadKey),_),
             ( format(string(Message),'Unsupported MeTTa map key: ~w',[BadKey]),
               source_error(File,L,C,Message) ))
    ; source_error(File,L,C,'Duplicate MeTTa map key') ).
norm(n(_,_,list([])),metta,_,_,S,S,metta_expression([])) :- !.
norm(n(_,_,list([])),_,_,_,S,S,Empty) :- !,
    semantic_symbol('TheEmptyList',Empty).
norm(n(L,C,list([Head,Binder,Formula])),Dialect,File,Bound,S0,S,Term) :-
    Dialect\==metta, quantifier_head(Head),
    kb_mappings:binder_nodes(Binder,Binders), !,
    allocate_binders(Binders,Bound,Inner,S0,S1,_),
    norm(Head,Dialect,File,Bound,S1,S2,H),
    norm(Binder,Dialect,File,Inner,S2,S3,B),
    norm(Formula,Dialect,File,Inner,S3,S,F),
    normalized_application(H,[B,F],Dialect,File,L,C,Term).
norm(n(L,C,list([Head|Nodes])),Dialect,File,Bound,S0,S,Term) :- !,
    norm(Head,Dialect,File,Bound,S0,S1,H),
    norm_nodes(Nodes,Dialect,File,Bound,S1,S,Args),
    normalized_application(H,Args,Dialect,File,L,C,Term).
norm(Node,_,File,_,_,_,_) :-
    node_error(Node,File,'Unsupported or empty source expression').

norm_descriptor(n(_,_,list(Nodes)),File,Bound,S0,S,Values) :- !,
    norm_descriptors(Nodes,File,Bound,S0,S,Values).
norm_descriptor(n(_,_,var(Name,_)),_,Bound,S0,S,Var) :- !,
    resolve_variable(Name,Bound,S0,S,Var).
norm_descriptor(n(_,_,sym(A)),_,_,S,S,Term) :- !,semantic_symbol(A,Term).
norm_descriptor(n(_,_,quoted(A)),_,_,S,S,Term) :- !,semantic_symbol(A,Term).
norm_descriptor(n(_,_,num(N)),_,_,S,S,N) :- !.
norm_descriptor(n(_,_,lexnum(_,N)),_,_,S,S,N) :- !.
norm_descriptor(n(_,_,str(Text)),_,_,S,S,Text) :- !.
norm_descriptor(n(_,_,quote(Node)),File,Bound,S0,S,[quote,Data]) :- !,
    norm_descriptor(Node,File,Bound,S0,S,Data).
norm_descriptor(Node,File,_,_,_,_) :-
    node_error(Node,File,'Unsupported formatting descriptor data').

norm_descriptors([],_,_,S,S,[]).
norm_descriptors([Node|Nodes],F,B,S0,S,[Value|Values]) :-
    norm_descriptor(Node,F,B,S0,S1,Value),
    norm_descriptors(Nodes,F,B,S1,S,Values).

norm_format_arguments([Descriptor|Arguments],1,Dialect,File,Bound,S0,S,[Data|Terms]) :- !,
    ( nil_format_argument(Descriptor)
    -> norm(Descriptor,Dialect,File,Bound,S0,S1,Data)
    ; norm_descriptor(Descriptor,File,Bound,S0,S1,Data) ),
    norm_nodes(Arguments,Dialect,File,Bound,S1,S,Terms).
norm_format_arguments([Arg|Arguments],Position,Dialect,File,Bound,S0,S,[Term|Terms]) :-
    norm(Arg,Dialect,File,Bound,S0,S1,Term),
    Next is Position-1,
    norm_format_arguments(Arguments,Next,Dialect,File,Bound,S1,S,Terms).

nil_format_argument(Node) :-
    node_symbol(Node,Raw),
    semantic_symbol(Raw,Encoded),
    downcase_atom(Encoded,nil).

semantic_symbol(A,Symbol) :-
    (atom_concat('#$',Bare,A)->encode_symbol(Bare,Symbol);encode_symbol(A,Symbol)).

normalized_application(H,Args,_,_,_,_,Term) :-
    ( var(H); compound(H) ), !, application(t,[H|Args],Term).
normalized_application(H,Args,_,_,_,_,Term) :-
    atom(H), encoded_symbol(H), !,
    (H==':'->application(t,[H|Args],Term);application(H,Args,Term)).
normalized_application(H,Args,Dialect,_,_,_,Term) :-
    memberchk(Dialect,[kif,krf]),(number(H);string(H)), !,
    application(t,[H|Args],Term).
normalized_application(_,_,_,File,L,C,_) :-
    source_error(File,L,C,'Predicate position must be a symbol, variable or application').

application(F,[],F) :- !.
application(F,Args,Term) :- compound_name_arguments(Term,F,Args).

norm_nodes([],_,_,_,S,S,[]).
norm_nodes([Node|Nodes],D,F,B,S0,S,[Term|Terms]) :-
    norm(Node,D,F,B,S0,S1,Term), norm_nodes(Nodes,D,F,B,S1,S,Terms).

resolve_variable(Name,Bound,S,S,Var) :-
    named_variable(Name,Bound,Var), !.
resolve_variable(Name,_,state(Free,Registry),state(Free,Registry),Var) :-
    named_variable(Name,Free,Var), !.
resolve_variable(Name,_,state(Free,Registry),
                 state([Name-Var|Free],[Name-Var|Registry]),Var).

named_variable(Name,[N-V|_],V) :- N==Name, !.
named_variable(Name,[_|Rest],Var) :- named_variable(Name,Rest,Var).

allocate_binders([],Bound,Bound,S,S,[]).
allocate_binders([n(_,_,var(Name,_))|Nodes],Bound,Inner,
                 state(Free,R0),S,[V|Vars]) :-
    allocate_binders(Nodes,[Name-V|Bound],Inner,state(Free,[Name-V|R0]),S,Vars).
nest_binders([],_,Body,Body).
nest_binders([Var|Vars],F,Body,Term) :-
    nest_binders(Vars,F,Body,Inner), application(F,[Var,Inner],Term).

quantifier_head(Node) :-
    ( node_symbol(Node,A); Node=n(_,_,mapped(A)) ),
    ( atom_concat('#$',Name,A) -> true ; Name=A ),
    memberchk(Name,[forall,exists,forAll,thereExists]).

pair_node(n(_,_,list([_,_]))).
norm_pairs([],_,_,S,S,[]).
norm_pairs([n(L,C,list([K,V]))|Nodes],F,B,S0,S,[Key-Value|Pairs]) :-
    norm(K,metta,F,B,S0,S1,Key),
    ( nonvar(Key), (atom(Key);integer(Key)), Key\==[]
    -> true ; source_error(F,L,C,'MeTTa map keys must be symbols or integers') ),
    norm(V,metta,F,B,S1,S2,Value),
    norm_pairs(Nodes,F,B,S2,S,Pairs).
pairs_keys_local([],[]).
pairs_keys_local([K-_|Pairs],[K|Keys]) :- pairs_keys_local(Pairs,Keys).

next_form(Stream,Ctx,Node) :-
    Ctx=ctx(File,_,_,_,_), skip_trivia(Stream,File),
    peek_code(Stream,Code),
    ( Code=:= -1 -> Node=end_of_file
    ; read_node(Stream,Ctx,Read),
      tick_progress(Stream,Ctx),
      ( Read==skip -> next_form(Stream,Ctx,Node) ; Node=Read ) ).

read_node(Stream,Ctx,Node) :-
    Ctx=ctx(File,Dialect,_,_,_),
    skip_trivia(Stream,File),
    stream_location(Stream,L,C), get_code(Stream,Code),
    ( Code=:= -1 -> source_error(File,L,C,'Unexpected end of source')
    ; Code=:=0'( -> read_list(Stream,Ctx,L,C,Nodes), Node=n(L,C,list(Nodes))
    ; Code=:=0') -> source_error(File,L,C,'Unexpected closing parenthesis')
    ; Code=:=0'" -> read_delimited(Stream,File,L,C,0'",Codes),
      string_codes(Text,Codes), Node=n(L,C,str(Text))
    ; Code=:=0'| -> read_delimited(Stream,File,L,C,0'|,Codes),
      atom_codes(A,Codes), Node=n(L,C,quoted(A))
    ; Code=:=0'' -> required_node(Stream,Ctx,L,C,Quoted), Node=n(L,C,quote(Quoted))
    ; Code=:=0'!, Dialect==metta, peek_code(Stream,0'()
    -> required_node(Stream,Ctx,L,C,Executed), Node=n(L,C,execute(Executed))
    ; read_token(Stream,File,L,C,Code,Codes,Escaped),
      atom_codes(Token,Codes),
      ( Dialect==krf, Escaped==false, conditional_token(Token,Sign,Feature)
      -> conditional_node(Stream,Ctx,L,C,Sign,Feature,Node)
      ; Dialect==krf, Escaped==false,
        (sub_atom(Token,0,2,_,'#-');sub_atom(Token,0,2,_,'#+'))
      -> source_error(File,L,C,'Malformed KRF reader conditional')
      ; token_value(Token,Escaped,Dialect,Value), Node=n(L,C,Value) )
    ).

required_node(Stream,Ctx,L,C,_) :-
    Ctx=ctx(File,_,_,_,_), skip_trivia(Stream,File), peek_code(Stream,Code),
    ( Code=:= -1 ; Code=:=0') ), !,
    source_error(File,L,C,'Dangling reader prefix or conditional').
required_node(Stream,Ctx,_,_,Node) :- read_node(Stream,Ctx,Node).

read_list(Stream,Ctx,L,C,Nodes) :-
    Ctx=ctx(File,_,_,_,_), skip_trivia(Stream,File), peek_code(Stream,Code),
    ( Code=:= -1 -> source_error(File,L,C,'Unclosed S-expression')
    ; Code=:=0') -> get_code(Stream,_), Nodes=[]
    ; read_node(Stream,Ctx,Node),
      ( Node==skip -> Nodes=Tail ; Nodes=[Node|Tail] ),
      read_list(Stream,Ctx,L,C,Tail)
    ).

conditional_token(Token,Sign,Feature) :-
    ( atom_concat('#-:',Feature,Token) -> Sign=absent
    ; atom_concat('#+:',Feature,Token) -> Sign=present ),
    valid_feature(Feature).
valid_feature(Feature) :-
    Feature\=='', atom_codes(Feature,Codes),
    forall(member(C,Codes),(code_type(C,alnum);memberchk(C,[0'-,0'_,0'.]))).
conditional_node(Stream,Ctx,L,C,Sign,Feature,Node) :-
    Ctx=ctx(_,_,Features,_,_), downcase_atom(Feature,Lower),
    required_node(Stream,Ctx,L,C,Following),
    ( (Sign==present,memberchk(Lower,Features);
       Sign==absent,\+memberchk(Lower,Features))
    -> Node=Following ; Node=skip ).

token_value(A,true,_,quoted(A)) :- !.
token_value(A,false,Dialect,var(Name,Kind)) :-
    variable_token(A,Dialect,Kind), !, atom_string(A,Name).
token_value(A,false,_,num(N)) :-
    numeric_token(A), catch(atom_number(A,N),_,fail), !.
token_value(A,false,_,lexnum(A,N)) :-
    numeric_token(A), decimal_spelling(A,Expanded),
    catch(atom_number(Expanded,N),_,fail), !.
token_value(A,false,_,sym(A)).

variable_token(A,metta,ordinary) :- atom_concat('$',Tail,A), Tail\==''.
variable_token(A,Dialect,Kind) :-
    memberchk(Dialect,[kif,krf]),
    ( atom_concat('??',_,A) -> Kind=row
    ; atom_concat('@',Tail,A), Tail\=='' -> Kind=row
    ; atom_concat('?',Tail,A), Tail\=='' -> Kind=ordinary ).

numeric_token(A) :-
    atom_codes(A,Cs),
    Cs\=[], forall(member(C,Cs),(code_type(C,digit);memberchk(C,[0'+,0'-,0'.,0'e,0'E]))),
    member(D,Cs), code_type(D,digit).

decimal_spelling(Atom,Expanded) :-
    atom_codes(Atom,Codes), leading_decimal(Codes,Normalized),
    atom_codes(Expanded,Normalized).
leading_decimal([0'.,D|Rest],[0'0,0'.,D|Rest]) :-
    code_type(D,digit).
leading_decimal([Sign,0'.,D|Rest],[Sign,0'0,0'.,D|Rest]) :-
    memberchk(Sign,[0'+,0'-]),code_type(D,digit).

read_token(Stream,File,L,C,First,Codes,Escaped) :-
    ( First=:=0'\\
    -> get_code(Stream,Next),
       ( Next=:= -1 -> source_error(File,L,C,'Dangling symbol escape') ; true ),
       Codes=[Next|Tail], Initial=true
    ; Codes=[First|Tail], Initial=false ),
    token_tail(Stream,File,L,C,Tail,MoreEscaped),
    ( (Initial==true ; MoreEscaped==true) -> Escaped=true ; Escaped=false ).

token_tail(Stream,File,L,C,Codes,Escaped) :-
    peek_code(Stream,Next),
    ( token_delimiter(Next) -> Codes=[], Escaped=false
    ; get_code(Stream,Code),
      ( Code=:=0'\\
      -> get_code(Stream,Quoted),
         ( Quoted=:= -1 -> source_error(File,L,C,'Dangling symbol escape') ; true ),
         Codes=[Quoted|Rest], Escaped=true,
         token_tail(Stream,File,L,C,Rest,_)
      ; Codes=[Code|Rest], token_tail(Stream,File,L,C,Rest,Escaped) )
    ).
token_delimiter(-1).
token_delimiter(C) :- code_type(C,space).
token_delimiter(C) :- memberchk(C,[0'(,0'),0';,0'",0'|]).

read_delimited(Stream,File,L,C,Delimiter,Codes) :-
    get_code(Stream,Code),
    ( Code=:= -1 -> source_error(File,L,C,'Unterminated string or quoted symbol')
    ; Code=:=Delimiter -> Codes=[]
    ; Code=:=0'\\
    -> ( Delimiter=:=0'|
       -> get_code(Stream,Value),
          ( Value=:= -1 -> source_error(File,L,C,'Dangling quoted-symbol escape') ; true )
       ; escaped_code(Stream,File,L,C,Value) ),
       Codes=[Value|Tail],
       read_delimited(Stream,File,L,C,Delimiter,Tail)
    ; Codes=[Code|Tail], read_delimited(Stream,File,L,C,Delimiter,Tail)
    ).
escaped_code(Stream,File,L,C,Value) :-
    get_code(Stream,Code),
    ( Code=:= -1 -> source_error(File,L,C,'Dangling string escape')
    ; Code=:=0'n -> Value=10
    ; Code=:=0'r -> Value=13
    ; Code=:=0't -> Value=9
    ; Code=:=0'b -> Value=8
    ; Code=:=0'f -> Value=12
    ; Code=:=0'u -> read_hex(Stream,4,File,L,C,Value)
    ; Code=:=0'U -> read_hex(Stream,8,File,L,C,Value)
    ; Value=Code ).
read_hex(Stream,Length,File,L,C,Value) :-
    read_n_codes(Stream,Length,Codes),
    ( maplist(hex_digit,Codes),
      atom_codes(Digits,Codes), atom_concat('0x',Digits,Hex),
      catch(atom_number(Hex,Value),_,fail),
      Value=<0x10ffff, \+ between(0xd800,0xdfff,Value)
    -> true ; source_error(File,L,C,'Invalid Unicode escape') ).
hex_digit(C) :- code_type(C,xdigit(_)).
read_n_codes(_,0,[]) :- !.
read_n_codes(Stream,N,[C|Cs]) :-
    get_code(Stream,C), M is N-1, read_n_codes(Stream,M,Cs).

leading_trivia(Stream,File,Leading) :-
    trivia(Stream,File,Chunks,[]), atomics_to_string(Chunks,"\n",Leading).
skip_trivia(Stream,File) :- trivia(Stream,File,_,[]).
trivia(Stream,File,Chunks,Tail) :-
    peek_code(Stream,C),
    ( C=:=0xfeff -> get_code(Stream,_), trivia(Stream,File,Chunks,Tail)
    ; code_type(C,space) -> get_code(Stream,_), trivia(Stream,File,Chunks,Tail)
    ; C=:=0';
    -> read_line_to_string(Stream,Line), Chunks=[Line|More],
       trivia(Stream,File,More,Tail)
    ; C=:=0'#, peek_string(Stream,2,"#|")
    -> stream_location(Stream,L,Col), get_code(Stream,_), get_code(Stream,_),
       block_comment(Stream,File,L,Col,1),
       trivia(Stream,File,Chunks,Tail)
    ; Chunks=Tail ).

block_comment(Stream,File,L,C,Depth) :-
    get_code(Stream,Code),
    ( Code=:= -1 -> source_error(File,L,C,'Unterminated block comment')
    ; Code=:=0'#, peek_code(Stream,0'|)
    -> get_code(Stream,_), D is Depth+1, block_comment(Stream,File,L,C,D)
    ; Code=:=0'|, peek_code(Stream,0'#)
    -> get_code(Stream,_), D is Depth-1,
       ( D=:=0 -> true ; block_comment(Stream,File,L,C,D) )
    ; block_comment(Stream,File,L,C,Depth) ).

stream_location(Stream,Line,Column) :-
    stream_property(Stream,position(Position)),
    stream_position_data(line_count,Position,Line),
    stream_position_data(line_position,Position,Offset),
    Column is Offset+1.
physical_line_count(Stream,Count) :-
    stream_property(Stream,position(Position)),
    stream_position_data(char_count,Position,Chars),
    stream_position_data(line_count,Position,Line),
    stream_position_data(line_position,Position,Offset),
    ( Chars=:=0 -> Count=0 ; Offset=:=0 -> Count is Line-1 ; Count=Line ).

node_error(n(L,C,_),File,Message) :- source_error(File,L,C,Message).
source_error(File,Line,Column,Message) :-
    throw(error(source_error(File,Line,Column,Message),context(kb_reader,'Source data was not executed'))).
