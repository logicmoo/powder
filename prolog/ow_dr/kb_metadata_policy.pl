:- module(kb_metadata_policy,
          [retention_policy/1, source_mapping_mode/5, mapping_origin/2,
           source_origin/3, origin_context/2, redundant_property/1,
           filter_properties/3, filter_metadata/3, filter_records/3,
           filter_json_properties/3, metadata_stats/3, json_metadata_stats/3,
           compact_evidence/3]).
:- use_module(library(error)).
:- use_module(library(option)).
:- use_module(library(lists)).
:- use_module(library(readutil)).
:- use_module(library(crypto)).
:- use_module(library(utf8)).
:- multifile compact_evidence/3.

/** <module> Shared, allocation-time assertion metadata retention.

Only verified SUMO origin retains redundant original representations. Unknown
origin uses the non-SUMO retention rule, but is reported as unknown, not SUMO or
verified non-SUMO. Original source archives are never modified. Classification
is independent of mapping_rows: applying a global mapping proves no origin.
Byte metrics are UTF-8 serialized metadata sizes, not heap/RSS estimates.

The redundant original-cnf export is not a canonical CNF property. Intentional
cnf metadata is retained independently; retaining it grants no exemption to
original-formula, original-el-formula or original-prolog. On-demand native clause
rendering is an ephemeral response, not a reason to store a compiled-text copy.
*/

retention_policy(non_sumo_originals_v1).

source_mapping_mode(_,Dialect,_,_,none) :- memberchk(Dialect,[krf,meld,metta]), !.
source_mapping_mode(_,_,_,Options,sumo) :- option(sumo_mappings(true),Options,false), !.
source_mapping_mode(_,_,_,Options,global) :- option(sumo_mappings(false),Options,true), !.
source_mapping_mode(File,_,Leading,_,sumo) :-
    (sumo_path(File);sumo_header(Leading)), !.
source_mapping_mode(_,_,_,_,global).
mapping_origin(sumo,sumo).
mapping_origin(global,non_sumo).
mapping_origin(none,non_sumo).

sumo_path(File) :-
    downcase_atom(File,Lower),
    (file_base_name(Lower,Base),memberchk(Base,['tinykb.kif','merge.kif','engformat.kif'])
    ;sub_atom(Lower,_,_,_,'sumo')).
sumo_header(Leading) :-
    string_lower(Leading,Lower),
    (split_string(Lower,"\n","\r",Lines),
     member(Line,Lines),normalize_space(string(";; logos: sumo-mappings"),Line)
    ;sub_string(Lower,_,_,_,"suggested upper merged ontology")
    ;sub_string(Lower,_,_,_,"sumo (")).

source_origin(File0,Options,Origin) :-
    text_atom(File0,File),must_be(list,Options),
    file_name_extension(_,Ext,File),downcase_atom(Ext,Dialect), !,
    (memberchk(Dialect,[krf,meld,metta])->Origin=non_sumo
    ;Dialect==kif->
      (option(sumo_mappings(true),Options,false)->Origin=sumo
      ;option(sumo_mappings(false),Options,true)->Origin=non_sumo
      ;sumo_path(File)->Origin=sumo
      ;exists_file(File)->
        option(encoding(Encoding),Options,iso_latin_1),
        setup_call_cleanup(open(File,read,S,[encoding(Encoding)]),
          leading_comments(S,Comments),close(S)),
        source_mapping_mode(File,kif,Comments,Options,Mode),mapping_origin(Mode,Origin)
      ;Origin=unknown)
    ;Origin=unknown).
source_origin(_,_,unknown).

% Match the reader's leading semicolon-comment/header policy. Block comments
% are skipped, not used as SUMO evidence, just as in kb_reader:leading_trivia/3.
leading_comments(S,Text) :-
    leading_chunks(S,Chunks),atomics_to_string(Chunks,"\n",Text).
leading_chunks(S,Chunks) :-
    peek_code(S,C),
    (C=:=0xfeff->get_code(S,_),leading_chunks(S,Chunks)
    ;code_type(C,space)->get_code(S,_),leading_chunks(S,Chunks)
    ;C=:=0';->read_line_to_string(S,Line),Chunks=[Line|Rest],leading_chunks(S,Rest)
    ;C=:=0'#,peek_string(S,2,"#|")->
      get_code(S,_),get_code(S,_),skip_block(S,1),leading_chunks(S,Chunks)
    ;Chunks=[]).
skip_block(S,N) :-
    get_code(S,C),
    (C=:= -1->throw(error(syntax_error(unterminated_origin_header_comment),_))
    ;C=:=0'#,peek_code(S,0'|)->get_code(S,_),Next is N+1,skip_block(S,Next)
    ;C=:=0'|,peek_code(S,0'#)->get_code(S,_),Next is N-1,
      (Next=:=0->true;skip_block(S,Next))
    ;skip_block(S,N)).

origin_context(Context,Origin) :-
    (memberchk(Context,[sumo,non_sumo,unknown])->Origin=Context
    ;is_dict(Context)->
      (get_dict(dialect,Context,D),memberchk(D,[krf,meld,metta])->Origin=non_sumo
      ;context_file(Context,F),file_name_extension(_,Ext,F),
       downcase_atom(Ext,E),memberchk(E,[krf,meld,metta])->Origin=non_sumo
      ;get_dict(sourceOrigin,Context,O)->
        must_be(oneof([sumo,non_sumo,unknown]),O),Origin=O
      ;get_dict(mappingMode,Context,M)->mapping_origin(M,Origin)
      ;context_file(Context,F)->
        (get_dict(options,Context,Options)->true;Options=[]),
        old_source_origin(Context,F,Options,Origin)
      ;Origin=unknown)
    ;Origin=unknown), !.
context_file(Context,File) :-
    get_dict(source,Context,Raw),text_atom(Raw,File).
text_atom(T,A) :- (atom(T)->A=T;string(T)->atom_string(A,T);type_error(text,T)).

old_source_origin(Context,File,Options,Origin) :-
    (get_dict(sourceHash,Context,Hash),exists_file(File),
     file_name_extension(_,Ext,File),downcase_atom(Ext,kif),
     \+sumo_path(File),\+option(sumo_mappings(true),Options,false),
     \+option(sumo_mappings(false),Options,true)->
      crypto_file_hash(File,Actual,[algorithm(sha256)]),
      (Actual==Hash->source_origin(File,Options,Origin);Origin=unknown)
    ;source_origin(File,Options,Origin)).

redundant_property(Name) :-
    text_atom(Name,Atom),downcase_atom(Atom,Lower),
    (atom_concat(xc_,Bare,Lower)->true;Bare=Lower),
    atomic_list_concat(Parts,':',Bare),last(Parts,Local),
    atom_codes(Local,Codes),exclude(separator,Codes,Letters),atom_codes(Key,Letters),
    redundant_key(Key).
separator(0'-). separator(0'_).
redundant_key(originalformula).
redundant_key(originalelformula).
redundant_key(originalcnf).
redundant_key(originalprolog).
redundant_key(originalsourceexpression).
redundant_key(originalexpression).
redundant_key(sourceexpression).
redundant_key(rawprolog).
redundant_key(rawformula).
redundant_key(rawelformula).
redundant_key(rawcnf).
redundant_key(rawsourceexpression).

filter_properties(Context,Properties,Filtered) :-
    origin_context(Context,Origin),
    (Origin==sumo->Filtered=Properties;filter_pairs(Properties,Origin,Filtered)).
filter_pairs([],_,[]).
filter_pairs([Key-Value|Rest],Origin,Filtered) :-
    (Origin\==sumo,redundant_property(Key)->
      compact_pairs(Key,Value,Evidence),
      append(Evidence,Tail,Filtered)
    ;Filtered=[Key-Value|Tail]),
    filter_pairs(Rest,Origin,Tail).
compact_pairs(Key,Value,Evidence) :-
    findall(P,(compact_evidence(Key,Value,Pairs),member(P,Pairs),valid_compact(P)),Evidence).
valid_compact(Key-Value) :-
    must_be(atom,Key),must_be(ground,Value),
    (\+redundant_property(Key)->true;domain_error(compact_metadata_key,Key)).

filter_metadata(Context,Metadata,Filtered) :-
    origin_context(Context,Origin),
    (Origin==sumo->Filtered=Metadata;filter_terms(Metadata,Origin,Filtered)).
filter_terms([],_,[]).
filter_terms([Term|Rest],Origin,Filtered) :-
    compound_name_arguments(Term,Name,[Id,Value]),
    (Origin\==sumo,redundant_property(Name)->
      compact_pairs(Name,Value,Pairs),pairs_metadata(Pairs,Id,Filtered,Tail)
    ;Filtered=[Term|Tail]),
    filter_terms(Rest,Origin,Tail).
pairs_metadata([],_,Tail,Tail).
pairs_metadata([Key-Value|Rest],Id,[Term|Terms],Tail) :-
    (atom_concat(xc_,_,Key)->Name=Key;atom_concat(xc_,Key,Name)),
    compound_name_arguments(Term,Name,[Id,Value]),pairs_metadata(Rest,Id,Terms,Tail).
filter_records(Context,Records,Filtered) :-
    origin_context(Context,Origin),
    (Origin==sumo->Filtered=Records;maplist(filter_record(Origin),Records,Filtered)).
filter_record(Origin,record(Id,Semantic,Metadata),record(Id,Semantic,Filtered)) :-
    filter_terms(Metadata,Origin,Filtered).

filter_json_properties(Context,Properties,Filtered) :-
    origin_context(Context,Origin),
    (Origin==sumo->Filtered=Properties;filter_json(Properties,Origin,Filtered)).
filter_json([],_,[]).
filter_json([P|Rest],Origin,Filtered) :-
    (Origin\==sumo,redundant_property(P.name)->
      findall(_{name:Key,value:Value},
        (compact_evidence(P.name,P.value,Pairs),member(Key-Value,Pairs),
         valid_compact(Key-Value)),Evidence),append(Evidence,Tail,Filtered)
    ;Filtered=[P|Tail]),
    filter_json(Rest,Origin,Tail).

metadata_stats(Context,Metadata,Stats) :-
    origin_context(Context,Origin),filter_terms(Metadata,Origin,Filtered),
    retention_stats(Origin,Metadata,Filtered,Stats).
json_metadata_stats(Context,Properties,Stats) :-
    origin_context(Context,Origin),filter_json(Properties,Origin,Filtered),
    retention_stats(Origin,Properties,Filtered,Stats).
retention_stats(Origin,Before,After,Stats) :-
    length(Before,Count),length(After,Retained),
    serialized_bytes(Before,Bytes),serialized_bytes(After,RetainedBytes),
    (Origin==sumo->Dropped=0;
     include(redundant_item,Before,Removed),length(Removed,Dropped)),
    Added is Retained-Count+Dropped,Saved is Bytes-RetainedBytes,
    Stats=_{origin:Origin,propertyCount:Count,retainedPropertyCount:Retained,
      droppedPropertyCount:Dropped,addedCompactPropertyCount:Added,
      metadataBytes:Bytes,retainedMetadataBytes:RetainedBytes,
      removedMetadataBytes:Saved,byteMetric:serialized_utf8}.
redundant_item(Item) :-
    (is_dict(Item)->Key=Item.name;compound_name_arguments(Item,Key,[_,_])),
    redundant_property(Key).
serialized_bytes(Terms,Bytes) :-
    maplist(term_bytes,Terms,Sizes),sum_list(Sizes,Bytes).
term_bytes(Term,Bytes) :-
    % Anonymous JSON dict tags must not turn variable addresses into byte noise.
    copy_term(Term,Copy),numbervars(Copy,0,_),
    with_output_to(codes(Codes),
      write_term(Copy,[quoted(true),ignore_ops(true),numbervars(true)])),
    phrase(utf8_codes(Codes),Octets),length(Octets,N),Bytes is N+2.
