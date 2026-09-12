:- module(kb_source_editor, [editor_read/2, editor_save/2, editor_error/3, editor_limit/1]).
:- use_module(kb_catalog, [authorize_sources/2]).
:- use_module(kb_paths, [kb_root/1, runtime_root/1]).
:- use_module(kb_cache, [try_lock/2, release_lock/1, stage_path/2]).
:- use_module(library(crypto)).
:- use_module(library(error)).
:- use_module(library(shlib)).

:- if(current_prolog_flag(windows,true)).
:- prolog_load_context(directory,Here),
   directory_file_path(Here,'kb_source_editor_windows.dll',Library),
   use_foreign_library(Library).
:- endif.

editor_limit(67108864).

editor_read(Path, Reply) :-
    authorized(Path,File), editor_limit(Max), kb_root(Root),
    setup_call_cleanup(editor_native_begin(Root,File,Max,Lease,Bytes,Canonical),
      (snapshot(Canonical,Bytes,Reply),editor_native_current(Lease)),
      editor_native_end(Lease)).

editor_save(Request, Reply) :-
    must_be(dict,Request),
    required(Request,path,Path), required(Request,text,Text),
    required(Request,expectedRevision,Expected), must_be(string,Text),
    valid_revision(Expected), string_length(Text,Length), check_size(Length),
    authorized(Path,File),editor_limit(Max),kb_root(Root),
    setup_call_cleanup(editor_native_begin(Root,File,Max,Lease,Bytes,Canonical),
      save_pinned(Lease,Canonical,Bytes,Expected,Text,Reply),
      editor_native_end(Lease)).

authorized(Path,File) :-
    (current_prolog_flag(windows,true),current_predicate(editor_native_begin/6)->true;
      throw(error(source_editor(unsupported_platform,"The handle-pinned source editor requires the Windows adapter."),_))),
    (string(Path);atom(Path)), !, authorize_sources([Path],[File]).
authorized(_,_) :- throw(error(source_editor(invalid_path,"A repository KBs source path is required."),_)).

required(Dict,Key,Value) :-
    (get_dict(Key,Dict,Value)->true;
      throw(error(source_editor(invalid_request,Key),_))).
valid_revision(Revision) :-
    (atom(Revision);string(Revision)),atom_string(Atom,Revision),atom_length(Atom,64),
    atom_codes(Atom,Codes),forall(member(C,Codes),(between(0'0,0'9,C);between(0'a,0'f,C))),!.
valid_revision(_) :- throw(error(source_editor(invalid_revision,"expectedRevision must be a lowercase SHA-256."),_)).
check_size(Size) :-
    editor_limit(Max),(Size=<Max->true;
      throw(error(source_editor(too_large,_{sizeBytes:Size,maxBytes:Max}),_))).

save_pinned(Lease,File,Bytes,Expected,Text,Reply) :-
    runtime_root(Runtime),atom_concat(Runtime,'/source-editor',Managed),
    editor_native_prepare(Lease,Managed),
    downcase_atom(File,LockIdentity),
    crypto_data_hash(LockIdentity,Key,[algorithm(sha256)]),
    atomic_list_concat([Managed,'/',Key,'.lock'],LockFile),
    (mutex_trylock(LockFile)->
      setup_call_cleanup(true,
        setup_call_cleanup(try_lock(LockFile,Lock),
          (Lock==busy->throw(error(source_editor(busy,"This source is being saved in another process."),_));
            save_locked(Lease,File,Bytes,Expected,Text,Managed,Reply)),
          (Lock==busy->true;release_lock(Lock))),
        mutex_unlock(LockFile))
    ;throw(error(source_editor(busy,"This source is being saved in another request."),_))).

save_locked(Lease,File,Bytes,Expected,Text,Managed,Reply) :-
    editor_native_current(Lease),
    snapshot(File,Bytes,Before),atom_string(ExpectedAtom,Expected),
    (Before.revision==ExpectedAtom->true;
      del_dict(text,Before,_,Current),
      throw(error(source_editor(conflict,Current),_))),
    (Text==Before.text->
      del_dict(text,Before,_,Identity),Reply=Identity.put(_{saved:false,unchanged:true})
    ;Before.editable==false->
      throw(error(source_editor(unsupported_text,Before.reason),_))
    ;encode_saved(Text,Before,Encoded),
      atom_concat(Managed,'/source',Base),stage_path(Base,Stage),
      editor_native_publish(Lease,Managed,Stage,Encoded),
      snapshot(File,Encoded,After),del_dict(text,After,_,Identity),
      Reply=Identity.put(_{saved:true,unchanged:false,cachesStale:true})).

snapshot(File,Bytes,Reply) :-
    string_length(Bytes,Size),check_size(Size),
    crypto_data_hash(Bytes,Revision,[algorithm(sha256),encoding(octet)]),
    file_name_extension(_,Ext0,File),downcase_atom(Ext0,Ext),
    (Ext==metta->Encoding=utf8;Encoding=iso_latin_1),
    remove_bom(Encoding,Bytes,Bom,Payload),
    editor_native_decode(Payload,Encoding,Text,Newline),
    (Newline==mixed->Editable=false,
      Reason="Mixed CRLF/LF/CR endings are read-only. No newline conversion is performed; use an external byte-preserving editor."
    ;Editable=true,Reason=""),
    canonical_public_path(File,Public),editor_limit(Max),
    Reply=_{path:Public,text:Text,revision:Revision,encoding:Encoding,bom:Bom,
      newline:Newline,sizeBytes:Size,editable:Editable,reason:Reason,
      limits:_{maxBytes:Max},saveSemantics:file_only}.

canonical_public_path(File,Public) :-
    kb_root(Root),atom_length(Root,N),downcase_atom(Root,LowerRoot),
    sub_atom(File,0,N,_,Prefix),downcase_atom(Prefix,LowerRoot),
    sub_atom(File,N,_,0,Relative),atom_concat('KBs',Relative,Public),!.
canonical_public_path(_,_) :-
    throw(error(source_editor(invalid_path,"The canonical source escaped the KBs root."),_)).

remove_bom(utf8,Bytes,true,Payload) :-
    sub_string(Bytes,0,3,_,"\u00ef\u00bb\u00bf"),!,sub_string(Bytes,3,_,0,Payload).
remove_bom(iso_latin_1,Bytes,_,_) :-
    (sub_string(Bytes,0,3,_,"\u00ef\u00bb\u00bf");
     sub_string(Bytes,0,2,_,"\u00ff\u00fe");sub_string(Bytes,0,2,_,"\u00fe\u00ff")),!,
    throw(error(source_editor(unsupported_encoding,
      "This legacy Latin-1 source has a Unicode BOM. No encoding is guessed or converted."),_)).
remove_bom(_,Bytes,false,Bytes).

encode_saved(Text,Before,Bytes) :-
    editor_native_encode(Text,Before.encoding,Payload),
    editor_native_decode(Payload,Before.encoding,_,Newline),
    (Newline==mixed->throw(error(source_editor(unsupported_newlines,"A save cannot introduce mixed line endings."),_));true),
    (Before.newline==none;Newline==none;Before.newline==Newline),!,
    (Before.bom==true->string_concat("\u00ef\u00bb\u00bf",Payload,Bytes);Bytes=Payload),
    string_length(Bytes,Size),check_size(Size).
encode_saved(_,_,_) :-
    throw(error(source_editor(unsupported_newlines,"Preserve the original line-ending convention; automatic conversion is disabled."),_)).

editor_error(error(source_editor(Code,Details),_),Status,
             _{error:_{code:Code,message:Message,details:Details}}) :- !,
    editor_status(Code,Status),detail_message(Code,Details,Message).
editor_error(error(source_editor_io(Operation,Native),_),Status,
             _{error:_{code:Code,message:Message,operation:Operation,nativeCode:Native}}) :- !,
    (memberchk(Native,[32,33])->Code=busy,Status=423;
     Native==223->Code=too_large,Status=413;
     Native==1006->Code=conflict,Status=409;
     memberchk(Operation,[invalid_utf8,nul_character])->Code=unsupported_encoding,Status=422;
     Native==5->Code=forbidden,Status=403;
     Code=source_io,Status=500),
    format(string(Message),"Source ~w failed (Windows ~d). The original file was not partially overwritten.",[Operation,Native]).
editor_error(error(permission_error(_,_,_),_),403,
             _{error:_{code:forbidden,message:"Only authorized original sources inside repository KBs may be edited."}}) :- !.
editor_error(error(representation_error(_),_),422,
             _{error:_{code:unrepresentable_character,message:"Text cannot be represented in the original source encoding. No bytes were written."}}) :- !.
editor_error(Error,400,_{error:_{code:invalid_request,message:Message}}) :-
    message_to_string(Error,Message).
editor_status(conflict,409) :- !.
editor_status(busy,423) :- !.
editor_status(too_large,413) :- !.
editor_status(unsupported_platform,503) :- !.
editor_status(Code,422) :- atom_concat(unsupported_,_,Code),!.
editor_status(_,400).
detail_message(conflict,_,"The source changed on disk. Your buffer is retained. Explicitly reload from disk to discard it.") :- !.
detail_message(_,Details,Details) :- string(Details),!.
detail_message(Code,_,Code).
