:- module(kb_llm_schema,[validate_tools/1,validate_arguments/3,validate_call/2]).
:- use_module(kb_agent_settings,[strict_keys/2]).
:- use_module(library(error)).
:- use_module(library(http/json)).
:- use_module(library(pairs)).

validate_tools(Tools) :-
    must_be(list,Tools),length(Tools,N),(N=<32->true;resource_error(llm_tool_catalog)),
    (maplist(tool_schema,Tools,Names)->true;throw(error(llm_invalid_tool_schema,_))),
    sort(Names,Unique),
    (same_length(Names,Unique)->true;domain_error(duplicate_tool_name,Names)).
tool_schema(Tool,Name) :-
    strict_keys(Tool,[function,type]),Tool.type=="function",
    F=Tool.function,strict_keys(F,[description,name,parameters]),
    Name=F.name,tool_name(Name),must_be(string,F.description),
    S=F.parameters,S.type=="object",schema(S).
tool_name(Name) :-
    must_be(string,Name),string_codes(Name,[C|Codes]),length(Codes,N),N<64,
    C=<127,(code_type(C,alpha)->true;C=:=0'_),
    forall(member(X,Codes),(X=<127,(code_type(X,alnum);memberchk(X,[0'_,0'-])))).

schema(S) :-
    must_be(dict,S),get_dict(type,S,Type),
    (memberchk(Type,["object","array","string","integer","number","boolean","null"])->true;
     domain_error(llm_schema_type,Type)),
    dict_pairs(S,_,Pairs),
    forall(member(Key-_,Pairs),allowed_schema_key(Type,Key)),
    (Type=="object"->
      S.additionalProperties==false,is_dict(S.properties),is_list(S.required),
      dict_pairs(S.properties,_,Properties),
      forall(member(_-Child,Properties),schema(Child)),
      forall(member(Required,S.required),
        (must_be(string,Required),atom_string(Key,Required),get_dict(Key,S.properties,_)))
    ;Type=="array"->schema(S.items)
    ;true),
    (get_dict(enum,S,Enum)->is_list(Enum),Enum\=[];true).
allowed_schema_key(_,Key) :- memberchk(Key,[type,description,enum]),!.
allowed_schema_key("object",Key) :- memberchk(Key,[properties,required,additionalProperties]),!.
allowed_schema_key("array",Key) :- memberchk(Key,[items,minItems,maxItems]),!.
allowed_schema_key("string",Key) :- memberchk(Key,[minLength,maxLength]),!.
allowed_schema_key(Type,Key) :- memberchk(Type,["integer","number"]),memberchk(Key,[minimum,maximum]),!.
allowed_schema_key(_,Key) :- domain_error(llm_schema_keyword,Key).

validate_arguments(Schema,Text,Arguments) :-
    must_be(string,Text),string_length(Text,N),(N=<16384->true;resource_error(llm_tool_arguments)),
    atom_json_dict(Text,Arguments,[]),must_be(dict,Arguments),
    (value(Schema,Arguments)->true;throw(error(llm_arguments_mismatch,_))).
value(S,V) :-
    typed(S.type,S,V),
    (get_dict(enum,S,Options)->memberchk(V,Options);true).
typed("object",S,V) :-
    is_dict(V),dict_pairs(V,_,Pairs),
    forall(member(K-Child,Pairs),(get_dict(K,S.properties,ChildSchema),value(ChildSchema,Child))),
    forall(member(R,S.required),(atom_string(K,R),get_dict(K,V,_))).
typed("array",S,V) :-
    is_list(V),length(V,N),bound(S,minItems,>=,N),bound(S,maxItems,=<,N),
    forall(member(Child,V),value(S.items,Child)).
typed("string",S,V) :-
    string(V),string_length(V,N),bound(S,minLength,>=,N),bound(S,maxLength,=<,N).
typed("integer",S,V) :- integer(V),bound(S,minimum,>=,V),bound(S,maximum,=<,V).
typed("number",S,V) :- number(V),bound(S,minimum,>=,V),bound(S,maximum,=<,V).
typed("boolean",_,V) :- memberchk(V,[true,false]).
typed("null",_,null).
bound(S,Key,Compare,V) :-
    (get_dict(Key,S,N)->number(N),Test=..[Compare,V,N],call(Test);true).

validate_call(Call,Tools) :-
    strict_keys(Call,[function,id,type]),must_be(string,Call.id),string_length(Call.id,N),
    between(1,128,N),Call.type=="function",
    strict_keys(Call.function,[arguments,name]),tool_name(Call.function.name),
    member(Tool,Tools),Tool.function.name==Call.function.name,
    validate_arguments(Tool.function.parameters,Call.function.arguments,_).
