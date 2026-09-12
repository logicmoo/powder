:- module(kb_agent_settings,
          [registered_agents/1,agent_settings/1,save_agent_settings/3,
           host_provider/1,validate_model/1,validate_budgets/1,strict_keys/2,
           provider_notice/1]).
:- use_module(kb_llm_files).
:- use_module(kb_activity,[with_application/1]).
:- use_module(library(error)).
:- use_module(library(pairs)).

registered_agents([_{id:"llm-knowledge",identity:"llm",name:"LLM knowledge agent",
                    modality:"text",settings:"llm/settings",prompt:"llm/prompt"}]).
provider_notice("emullm retains request/reply JSONL and worker logs, reuses worker contexts, and may forward externally through SNET-compatible fallback. This is not private-local-only. Send only explicitly approved nonsensitive material. Stop cannot erase logs or guarantee provider cancellation.").
host_provider(Base) :-
    (getenv('POWDER_LLM_BASE_URL',Value),Value\==''->atom_string(Value,Base);
     Base="http://127.0.0.1:8801/v1"),
    (string_concat("http://127.0.0.1:",Suffix,Base),
     split_string(Suffix,"/","",[PortText,"v1"]),string_codes(PortText,Codes),Codes\=[],
     maplist(decimal,Codes),number_string(Port,PortText),integer(Port),between(1,65535,Port)
     ->true;domain_error(host_owned_loopback_provider,Base)).
decimal(C) :- between(0'0,0'9,C).
defaults(Config) :-
    host_provider(Base),
    Config=_{schema:1,agent:"llm-knowledge",model:"gpt-5.6-sol",baseURL:Base,
      budgets:_{rounds:4,calls:8,tokens:2048,historyBytes:65536,
                outputBytes:32768,seconds:60}}.
settings_file(File) :-
    agent_state_dir(Directory),directory_file_path(Directory,'llm-knowledge.json',File).
agent_settings(Settings) :-
    settings_file(File),
    locked_file(File,
      (exists_file(File)->true;defaults(Default),atomic_json(File,Default))),
    read_bytes(File,65536,Bytes),bytes_text(Bytes,Text),
    atom_json_dict(Text,Config,[]),validate_config(Config),bytes_hash(Bytes,Revision),
    provider_notice(Notice),
    Settings=Config.put(_{revision:Revision,notice:Notice,credentialRequired:false,
                         baseEditable:false}).
save_agent_settings(Patch,Expected,Settings) :-
    strict_keys(Patch,[budgets,model]),
    validate_model(Patch.model),validate_budgets(Patch.budgets),
    with_application(save_settings_locked(Patch,Expected)),
    agent_settings(Settings).
save_settings_locked(Patch,Expected) :-
    settings_file(File),
    locked_file(File,
      (read_bytes(File,65536,Bytes),bytes_hash(Bytes,Revision),
       text_atom(Expected,ExpectedAtom),
       (ExpectedAtom==Revision->true;throw(error(agent_settings_conflict,_))),
       bytes_text(Bytes,Text),atom_json_dict(Text,Before,[]),validate_config(Before),
       Config=Before.put(_{model:Patch.model,budgets:Patch.budgets}),
       atomic_json(File,Config))).
validate_config(C) :-
    strict_keys(C,[agent,baseURL,budgets,model,schema]),
    (C.schema=:=1,C.agent=="llm-knowledge"->true;domain_error(agent_settings_schema,C.schema)),
    host_provider(Base),
    (C.baseURL==Base->true;throw(error(agent_provider_configuration_changed,_))),
    validate_model(C.model),validate_budgets(C.budgets).
validate_model(Model) :-
    must_be(string,Model),string_length(Model,N),
    (between(1,200,N),string_codes(Model,Codes),maplist(model_char,Codes)->true;
     domain_error(explicit_model_id,Model)).
model_char(C) :- C>=33,C=<126.
validate_budgets(B) :-
    strict_keys(B,[calls,historyBytes,outputBytes,rounds,seconds,tokens]),
    limit(B.rounds,1,8),limit(B.calls,0,32),limit(B.tokens,1,8192),
    limit(B.historyBytes,1024,262144),limit(B.outputBytes,256,131072),
    limit(B.seconds,1,120).
limit(Value,Low,High) :-
    must_be(integer,Value),(between(Low,High,Value)->true;domain_error(agent_budget,Value)).
strict_keys(Dict,Expected0) :-
    must_be(dict,Dict),dict_pairs(Dict,_,Pairs),pairs_keys(Pairs,Keys),sort(Expected0,Expected),
    (Keys==Expected->true;domain_error(agent_fields,Keys)).
text_atom(Text,Atom) :- (atom(Text)->Atom=Text;must_be(string,Text),atom_string(Atom,Text)).

:- use_module(library(http/json)).
