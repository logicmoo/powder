:- module(kb_llm_prompt,[prompt_document/1,save_prompt_document/3,prompt_snapshot/1]).
:- use_module(kb_llm_files).
:- use_module(kb_activity,[with_application/1]).
:- use_module(library(error)).
:- use_module(library(filesex)).
:- use_module(library(utf8)).

prompt_file(File) :-
    source_file(kb_llm_prompt:prompt_snapshot(_),Source),file_directory_name(Source,App),
    directory_file_path(App,'prompts/llm-knowledge-agent.md',File).
prompt_document(Document) :- prompt_file(File),snapshot_file(File,Document).
snapshot_file(File,Document) :-
    read_bytes(File,65536,Bytes),bytes_hash(Bytes,Hash),bytes_text(Bytes,Text),
    Document=_{path:"prolog/ow_dr/prompts/llm-knowledge-agent.md",
               revision:Hash,rawHash:Hash,content:Text}.
save_prompt_document(Text,Expected,Document) :-
    must_be(string,Text),string_codes(Text,Codes),phrase(utf8_codes(Codes),Bytes),
    length(Bytes,N),(between(1,65536,N)->true;resource_error(agent_prompt_limit)),
    with_application(save_prompt_locked(Bytes,Expected)),
    prompt_document(Document).
save_prompt_locked(Bytes,Expected) :-
    prompt_file(File),
    save_prompt_file(File,Bytes,Expected).
save_prompt_file(File,Bytes,Expected) :-
    locked_file(File,
      (snapshot_file(File,Before),atom_string(Before.revision,Revision),
       ((Expected==Revision;Expected==Before.revision)->atomic_bytes(File,Bytes);
        throw(error(agent_prompt_conflict,_))))).
prompt_snapshot(Snapshot) :-
    prompt_file(File),
    locked_file(File,
      (read_bytes(File,65536,Bytes),bytes_hash(Bytes,Hash),bytes_text(Bytes,Text))),
    agent_state_dir(State),directory_file_path(State,'prompts',Directory),
    safe_owned_path(Directory),make_directory_path(Directory),
    atom_concat(Hash,'.md',Name),directory_file_path(Directory,Name,Archive),
    locked_file(Archive,
      (exists_file(Archive)->
        read_bytes(Archive,65536,Existing),bytes_hash(Existing,ExistingHash),
        (ExistingHash==Hash->true;throw(error(agent_prompt_archive_corrupt,_)));
       atomic_bytes(Archive,Bytes))),
    Snapshot=_{revision:Hash,rawHash:Hash,content:Text,
               path:"prolog/ow_dr/prompts/llm-knowledge-agent.md"}.
