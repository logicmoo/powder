:- module(kb_kee_schema,[validate/3,validate_stored/2,json_schema/2,decode_object/2,json_size/2,json_text/2,reject/2]).
:- use_module(library(http/json)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(memfile)).

reject(Code,Details) :- throw(error(kee(Code,Details),kb_kee)).
decode_object(Text,Object) :-
    (string(Text),string_length(Text,N),N=<262144->true;reject(invalid_json,json{reason:size_or_type})),
    catch(atom_json_dict(Text,Raw,[]),_,reject(invalid_json,json{reason:syntax})),
    (is_dict(Raw)->Object=Raw;reject(invalid_json,json{reason:object_root_required})).
json_size(Value,Size) :-
    json_encoding(Value,_,Size).
json_text(Value,Text) :-
    json_encoding(Value,Text,_).
json_encoding(Value,Text,Size) :-
    setup_call_cleanup(new_memory_file(Memory),
      (write_json_memory(Memory,Value),memory_file_to_string(Memory,Text,utf8),
       string_codes(Text,Codes),foldl(byte_count,Codes,0,Size)),
      free_memory_file(Memory)).
write_json_memory(Memory,Value) :-
    % The Windows JSON writer emits surrogate halves; recover scalar text before sizing UTF-8.
    setup_call_cleanup(open_memory_file(Memory,write,Stream,[encoding(utf8)]),
      json_write_dict(Stream,Value,[width(0)]),close(Stream)).
byte_count(Code,N0,N) :-
    (Code>=0,Code=<1114111,\+between(55296,57343,Code)->true;domain_error(unicode_scalar,Code)),
    (Code<128->Bytes=1;Code<2048->Bytes=2;Code<65536->Bytes=3;Bytes=4),N is N0+Bytes.

validate(Spec,Input,Output) :- checked(Spec,Input,"$",Output).
validate_stored(Spec,Value) :-
    json_text(Value,Text),atom_json_dict(Text,JSON,[]),
    validate(Spec,JSON,Canonical),Canonical==Value.
bad(Path,Reason) :-
    format(string(Text),'~q',[Reason]),reject(invalid_arguments,json{path:Path,reason:Text}).
checked(object,Input,Path,Input) :- !,
    (is_dict(Input),acyclic_term(Input)->true;bad(Path,object_required)).
checked(obj(Fields),Input,Path,Output) :- !,
    (is_dict(Input)->true;bad(Path,object_required)),
    dict_pairs(Input,_,Pairs),findall(Key,(member(F,Fields),field(F,Key,_,_)),Known),
    forall(member(Key-_,Pairs),(memberchk(Key,Known)->true;bad(Path,unknown_property(Key)))),
    findall(Key-Value,
      (member(F,Fields),field(F,Key,Spec,Required),
       (get_dict(Key,Input,Raw)->string_concat(Path,".",P0),atom_string(Key,K),string_concat(P0,K,P),
         checked(Spec,Raw,P,Value)
       ;Required==true->bad(Path,missing_property(Key));fail)),Values),
    dict_pairs(Output,json,Values).
checked(str(Min,Max),Input,Path,Input) :- !,
    (string(Input),string_length(Input,N),N>=Min,N=<Max->true;bad(Path,string_size)).
checked(int(Min,Max),Input,Path,Input) :- !,
    (integer(Input),Input>=Min,Input=<Max->true;bad(Path,integer_range)).
checked(num(Min,Max),Input,Path,Input) :- !,
    ((integer(Input);float(Input),float_class(Input,C),memberchk(C,[zero,subnormal,normal])),
     Input>=Min,Input=<Max->true;bad(Path,number_range)).
checked(boolean,Input,Path,Input) :- !,
    ((Input==true;Input==false)->true;bad(Path,boolean_required)).
checked(enum(Values),Input,Path,Value) :- !,
    (string(Input),atom_string(Value,Input),memberchk(Value,Values)->true;bad(Path,enum_value)).
checked(nullable(Spec),Input,Path,Output) :- !,
    (Input==null->Output=null;checked(Spec,Input,Path,Output)).
checked(choice(Specs),Input,Path,Output) :- !,
    (member(Spec,Specs),catch(checked(Spec,Input,Path,Output),error(kee(invalid_arguments,_),_),fail)->true;
      bad(Path,no_matching_shape)).
checked(list(Spec,Max),Input,Path,Output) :- !,
    (is_list(Input),length(Input,N),N=<Max->true;bad(Path,array_size)),
    maplist(item(Spec,Path),Input,Output).
checked(Spec,_,_,_) :- throw(error(unsupported_kee_schema(Spec),kb_kee_schema)).
item(Spec,Path,Input,Output) :- string_concat(Path,"[]",Next),checked(Spec,Input,Next,Output).
field(req(Key,Spec),Key,Spec,true).
field(opt(Key,Spec),Key,Spec,false).

json_schema(obj(Fields),Schema) :- !,
    findall(Key-S,(member(F,Fields),field(F,Key,Spec,_),json_schema(Spec,S)),Pairs),
    dict_pairs(Properties,json,Pairs),
    findall(Key,(member(F,Fields),field(F,Key,_,true)),Required),
    Schema=json{type:object,properties:Properties,required:Required,additionalProperties:false}.
json_schema(str(Min,Max),json{type:string,minLength:Min,maxLength:Max}).
json_schema(int(Min,Max),json{type:integer,minimum:Min,maximum:Max}).
json_schema(num(Min,Max),json{type:number,minimum:Min,maximum:Max}).
json_schema(boolean,json{type:boolean}).
json_schema(enum(Values),json{type:string,enum:Values}).
json_schema(nullable(Spec),json{anyOf:[json{type:"null"},Schema]}) :- json_schema(Spec,Schema).
json_schema(choice(Specs),json{anyOf:Schemas}) :- maplist(json_schema,Specs,Schemas).
json_schema(list(Spec,Max),json{type:array,items:Schema,maxItems:Max}) :- json_schema(Spec,Schema).
