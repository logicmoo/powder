:- module(kb_ids, [assign_ids/4, reserve_ids/3, state_directory/2]).

/** <module> Durable occurrence assignments and Unix-microsecond IDs.

One shared state directory defines the uniqueness scope. Independent repository
copies must share this allocator for guaranteed cross-copy uniqueness. Preserve
the directory when pruning adjacent .pl/.index.pl caches. Identical occurrences
match by source-content key and duplicate ordinal; source line layout is not an
identity. Reservations are persisted before IDs escape, under a stable native
lock; ledger installation uses complete, validated same-directory stages.
*/

:- use_module(library(option)).
:- use_module(library(filesex)).
:- use_module(library(assoc)).
:- use_module(library(error)).
:- use_module(kb_cache).

state_directory(Options, Dir) :-
    ( option(state_dir(Input),Options)
    -> absolute_file_name(Input,Dir,[file_errors(fail),access(none)])
    ; source_file(kb_ids:state_directory(_,_), Here),
      file_directory_name(Here,App),
      directory_file_path(App,'.logos-state',Dir)
    ),
    make_directory_path(Dir).

assign_ids(Input, Assertions, Options, Ids) :-
    absolute_file_name(Input,Source,[access(none)]),
    state_directory(Options, Dir),
    file_digest_name(Source, SourceKey),
    directory_file_path(Dir, occurrences, LedgerDir),
    make_directory_path(LedgerDir),
    atom_concat(SourceKey, '.pl', Name),
    directory_file_path(LedgerDir, Name, File),
    atom_concat(File,'.lock',LockPath),
    with_mutex(logos_occurrences,
       setup_call_cleanup(
          open(LockPath,append,Lock,[lock(write),wait(true)]),
          assign_locked(File,Source,Assertions,Dir,Ids),
          close(Lock))).

file_digest_name(Source, Hash) :- terms_digest([Source],Hash).

assign_locked(File,Source,Assertions,Dir,Ids) :-
    read_ledger(File, Source, Old),
    empty_assoc(Counts0),
    occurrence_keys(Assertions, Counts0, _, Keys),
    empty_assoc(Map0),
    foldl(ledger_assoc,Old,Map0,Map),
    include(missing_key(Map), Keys, Missing),
    length(Missing,N), reserve_ids(Dir,N,NewIds),
    pairs_keys_values(New,Missing,NewIds),
    foldl(ledger_assoc,New,Map,Full),
    maplist(lookup_id(Full),Keys,Ids),
    (New=[] -> true
    ; append(Old,New,All),
      stage_path(File,Stage),
      setup_call_cleanup(true,
        ( terms_digest([Source,All],Digest),
          setup_call_cleanup(open(Stage,write,S,[encoding(utf8),newline(posix)]),
             (write_one_line(S,occurrence_ledger(1,Source,All,Digest)),flush_output(S)),
             close(S)),
          read_ledger(Stage,Source,All), install_stage(Stage,File)
        ),remove_if_exists(Stage))
    ).

read_ledger(File,Source,Pairs) :-
    (exists_file(File)
    -> setup_call_cleanup(open(File,read,S,[encoding(utf8)]),
           (read_term(S,Term,[]),read_term(S,end_of_file,[])),close(S)),
       (ground(Term),Term=occurrence_ledger(1,Source,Pairs,Digest),
        is_list(Pairs),terms_digest([Source,Pairs],Digest),
        maplist(valid_ledger_pair,Pairs),
        pairs_keys_values(Pairs,Keys,Ids),
        sort(Keys,UK),same_length(Keys,UK),
        sort(Ids,UI),same_length(Ids,UI)
       -> true
       ; throw(error(corrupt_occurrence_ledger(File),_)))
    ; Pairs=[]
    ).

valid_ledger_pair(occurrence(Hash,N)-Id) :-
    atom(Hash),integer(N),N>0,valid_assertion_id(Id).
ledger_assoc(Key-Id,A0,A) :- put_assoc(Key,A0,Id,A).
missing_key(A,Key) :- \+ get_assoc(Key,A,_).
lookup_id(A,Key,Id) :- get_assoc(Key,A,Id).

occurrence_keys([],A,A,[]).
occurrence_keys([assertion(_,_,_,_,_Props,Key)|As],A0,A,[occurrence(Hash,N)|Ks]) :-
    must_be(ground,Key),
    terms_digest([Key],Hash),
    (get_assoc(Hash,A0,N0)->N is N0+1;N=1),
    put_assoc(Hash,A0,N,A1),
    occurrence_keys(As,A1,A,Ks).

reserve_ids(_,0,[]) :- !.
reserve_ids(Dir,N,Ids) :-
    must_be(positive_integer,N),
    make_directory_path(Dir),
    directory_file_path(Dir,'allocator.lock',LockPath),
    directory_file_path(Dir,'allocator.journal',Journal),
    with_mutex(logos_allocator,
       setup_call_cleanup(
           open(LockPath,append,Lock,[lock(write),wait(true)]),
           reserve_locked(Journal,N,Ids),
           close(Lock))).

reserve_locked(File,N,Ids) :-
    read_highwater(File,Prev),
    get_time(Now), Start is max(floor(Now*1000000),Prev+1),
    End is Start+N-1,
    terms_digest([highwater(End)],Hash),
    % Append-only reservations are flushed and closed before any ID is returned.
    % A torn last record is ignored; a completed reservation is never overwritten.
    setup_call_cleanup(open(File,append,S,[encoding(utf8),newline(posix)]),
         (nl(S),write_one_line(S,reservation(End,Hash)),flush_output(S)),close(S)),
    findall(Id,(between(Start,End,I),format(atom(Id),'a~16r',[I])),Ids).

read_highwater(File,Value) :-
    (exists_file(File)
    -> setup_call_cleanup(open(File,read,S,[type(binary)]),
             highwater_lines(S,0,0,false,Value,Offset,Torn),close(S)),
       (Torn==true
       ->setup_call_cleanup(open(File,update,Out,[type(binary)]),
            (seek(Out,Offset,bof,_),set_end_of_stream(Out),flush_output(Out)),
            close(Out))
       ;true)
    ; Value=0).

highwater_lines(S,V0,O0,Torn,V,O,HadTorn) :-
    read_line_to_string(S,Line),
    (Line==end_of_file -> V=V0,O=O0,HadTorn=Torn
    ;normalize_space(string(""),Line)
    ->highwater_lines(S,V0,O0,Torn,V,O,HadTorn)
    ; (catch(term_string(reservation(N,Hash),Line,[syntax_errors(error)]),_,fail),
       integer(N),N>=0,terms_digest([highwater(N)],Hash)
      -> (Torn==false,N>V0
         ->stream_property(S,position(Pos)),
           stream_position_data(byte_count,Pos,Offset),
           highwater_lines(S,N,Offset,false,V,O,HadTorn)
         ;throw(error(corrupt_allocator_journal(V0,N),_)))
      ; highwater_lines(S,V0,O0,true,V,O,HadTorn))
    ).
