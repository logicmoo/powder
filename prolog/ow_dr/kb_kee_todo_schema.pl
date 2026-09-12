:- module(kb_kee_todo_schema,[input_spec/2,data_spec/1]).

input_spec(ledger_status,obj([])).
input_spec(ledger_call_status,obj([req(callId,str(1,128))])).
input_spec(todo_list,obj([req(mt,nullable(str(1,4096))),opt(status,enum([open,in_progress,blocked,done,cancelled])),
    opt(offset,int(0,1000000)),opt(limit,int(1,100))])).
input_spec(todo_get,obj([req(id,str(1,128))])).
input_spec(todo_create,obj([req(revision,str(64,96)),req(mt,nullable(str(1,4096))),req(data,Data)])) :-
    data_spec(Data).
input_spec(todo_update,obj([req(revision,str(64,96)),req(id,str(1,128)),req(resourceRevision,str(64,64)),
    req(mt,nullable(str(1,4096))),req(data,Data)])) :- data_spec(Data).
input_spec(todo_delete,obj([req(revision,str(64,96)),req(id,str(1,128)),req(resourceRevision,str(64,64))])).
input_spec(ledger_audit,obj([req(mt,nullable(str(1,4096))),opt(offset,int(0,1000000)),opt(limit,int(1,100))])).
input_spec(ledger_undo,Spec) :- inverse_spec(Spec).
input_spec(ledger_redo,Spec) :- inverse_spec(Spec).
inverse_spec(obj([req(revision,str(64,96)),req(changeset,str(1,128))])).
data_spec(obj([req(title,str(1,256)),req(description,str(0,16000)),
    req(status,enum([open,in_progress,blocked,done,cancelled])),req(priority,int(0,100)),
    req(dependencies,list(str(1,128),100)),
    req(evidence,list(obj([req(kind,enum([assertion,query,changeset,reference])),
      req(reference,str(1,1024)),req(note,str(0,4096))]),100)),
    req(acceptance,list(obj([req(given,str(1,4096)),req(when,str(1,4096)),req(then,str(1,4096))]),100)),
    req(links,obj([req(conversation,nullable(str(1,256))),req(agent,nullable(str(1,256))),
      req(changesets,list(str(1,128),100)),req(assertions,list(str(1,128),100))]))])).
