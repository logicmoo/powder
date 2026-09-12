:- module(kb_kee_agent_schema,[input_spec/2,record_spec/1,canonical_json/2,validate_record/1]).
:- use_module(kb_kee_schema,[]).
:- use_module(kb_cache,[]).
:- use_module(library(http/json)).
:- use_module(library(lists)).

status_spec(enum([created,running,paused,stopped,completed,failed])).
input_spec(agent_run_create,obj([req(revision,str(64,64)),req(mt,str(1,4096)),
    req(sourceJson,str(2,16384)),req(stateJson,str(2,65536))])).
input_spec(agent_run_get,obj([req(id,str(1,128))])).
input_spec(agent_run_list,obj([req(mt,str(1,4096)),opt(offset,int(0,1000000)),opt(limit,int(1,100))])).
input_spec(agent_run_events,obj([req(id,str(1,128)),opt(offset,int(0,1000000)),opt(limit,int(1,100))])).
input_spec(agent_run_event,obj([req(revision,str(64,64)),req(id,str(1,128)),
    req(resourceRevision,str(64,64)),req(expectedEvent,int(0,10000000)),
    req(status,Status),req(step,int(0,10000000)),req(stateJson,str(2,65536)),
    req(eventKind,enum([transition,dialogue,goal,plan,action_intent,action_outcome,log,stop,error])),
    req(eventJson,str(2,16384)),req(action,nullable(Action))])) :-
    status_spec(Status),action_spec(Action).
action_spec(obj([req(tool,str(1,64)),req(callId,str(1,128)),
    req(status,enum([planned,dispatched,committed,unknown,read_complete,failed])),
    req(commitRevision,nullable(str(64,64)))])).
record_spec(obj([req(owner,obj([req(actor,str(1,256)),req(agent,str(1,256)),req(conversation,str(1,256))])),
    req(sourceJson,str(2,16384)),req(sourceRevision,str(64,64)),
    req(stateJson,str(2,65536)),req(status,Status),req(step,int(0,10000000)),
    req(eventSequence,int(0,10000000)),req(lastEvent,Event)])) :-
    status_spec(Status),action_spec(Action),
    Event=obj([req(id,str(1,128)),req(kind,enum([created,transition,dialogue,goal,plan,action_intent,action_outcome,log,stop,error])),
      req(json,str(2,16384)),req(action,nullable(Action))]).
canonical_json(Input,Canonical) :-
    (string(Input),string_length(Input,N),N=<65536->true;invalid_json),
    catch(atom_json_dict(Input,Data,[]),_,invalid_json),
    (is_dict(Data),json_depth(Data,0)->true;invalid_json),
    catch(atom_json_dict(Atom,Data,[width(0)]),_,invalid_json),atom_string(Atom,Canonical).
invalid_json :- kb_kee_schema:reject(invalid_agent_json,json{reason:bounded_json_object_required}).
json_depth(Value,N) :-
    N=<32,
    (is_dict(Value)->dict_pairs(Value,_,Pairs),Next is N+1,maplist(pair_depth(Next),Pairs)
    ;is_list(Value)->Next is N+1,maplist(value_depth(Next),Value)
    ;float(Value)->float_class(Value,Class),memberchk(Class,[zero,subnormal,normal])
    ;true).
pair_depth(N,_-Value) :- json_depth(Value,N).
value_depth(N,Value) :- json_depth(Value,N).
validate_record(R) :-
    record_spec(Spec),
    (R.deleted==false,R.kind==agent_run,string(R.id),sub_string(R.id,0,4,_,"run:"),
     R.mt\==null,kb_kee_schema:validate_stored(Spec,R.data),
     canonical_json(R.data.sourceJson,R.data.sourceJson),
     canonical_json(R.data.stateJson,R.data.stateJson),
     canonical_json(R.data.lastEvent.json,R.data.lastEvent.json),
     kb_cache:terms_digest([kee_agent_source_v1,R.data.sourceJson],Hash),
     atom_string(Hash,R.data.sourceRevision)->true;
      kb_kee_schema:reject(ledger_corrupt,json{reason:agent_record})).
