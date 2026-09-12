:- module(kb_symbolic_agent_knowledge_schema,[input_spec/1]).

input_spec(obj([
    req(agent,str(1,4096)),
    req(mt,str(1,4096)),
    req(linkedMts,list(str(1,4096),200)),
    req(generation,int(0,1000000000000)),
    req(maxRecords,int(1,8192)),
    req(maxBytes,int(1024,1048576)),
    opt(seconds,num(0.01,5))
])).
