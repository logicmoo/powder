:- module(kb_dependency_resolution_policy,
          [policy_spec/1,validate_policy/2,normalize_policy_dto/2,default_policy_dto/1,
           default_policy/1,normalize_policy/2,apply_policy/3,policy_preview/3]).
:- use_module(kb_cache,[terms_digest/2]).
:- use_module(kb_kee_schema,[]).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(apply)).

/** Pure missing-information policy. Patterns are bounded literal prefixes,
suffixes or exact strings, never regular expressions or executable KB text.
Persistence must be supplied by an authenticated, audited host capability. */

kind(definition,warning).
kind(function_result_isa,warning).
kind(collection_root,warning).
kind(microtheory_declaration,warning).
kind(microtheory_attachment,info).
kind(comment,info).

policy_spec(obj([opt(rules,list(Rule,6))])) :-
    findall(Kind,kind(Kind,_),Kinds),
    Pattern=obj([req(mode,enum([exact,prefix,suffix])),req(value,str(1,128))]),
    Rule=obj([req(kind,enum(Kinds)),opt(enabled,boolean),
              opt(severity,enum([info,warning,error])),
              opt(ignoreTerms,list(str(1,4096),128)),
              opt(ignoreMts,list(str(1,4096),128)),
              opt(exemptTypes,list(str(1,4096),128)),
              opt(patterns,list(Pattern,32))]).

validate_policy(Input,json{rules:Rules}) :-
    policy_spec(Spec),kb_kee_schema:validate(Spec,Input,Typed),
    option(Typed,rules,[],Patches),
    maplist(rule_id,Patches,Ids),sort(Ids,Unique),
    (same_length(Ids,Unique)->true;domain_error(duplicate_policy_rules,Ids)),
    findall(Rule,(kind(Kind,Severity),normalize_rule(Patches,Kind,Severity,Rule)),Rules).

default_policy_dto(Policy) :- validate_policy(json{},Policy).
default_policy(Policy) :- normalize_policy(json{},Policy).
normalize_policy_dto(Input,Canonical) :-
    must_be(dict,Input),policy_spec(Spec),
    policy_json_input(Spec,Input,JSON),validate_policy(JSON,Canonical).
normalize_policy(Input,Policy) :-
    normalize_policy_dto(Input,Canonical),
    maplist(report_rule,Canonical.rules,Rules),
    terms_digest([dependency_policy_v1,Rules],Revision),
    Policy=policy{schema:dependency_policy_v1,revision:Revision,rules:Rules}.

% Existing Prolog callers use atoms for text. The strict host DTO uses strings.
policy_json_input(obj(Fields),Input,JSON) :- is_dict(Input),!,
    dict_pairs(Input,_,Pairs),maplist(policy_json_field(Fields),Pairs,Values),
    dict_pairs(JSON,json,Values).
policy_json_input(list(Spec,Max),Input,JSON) :-
    is_list(Input),length(Input,N),N=<Max,!,
    maplist(policy_json_input(Spec),Input,JSON).
policy_json_input(str(_,_),Input,JSON) :- atom(Input),!,atom_string(Input,JSON).
policy_json_input(enum(_),Input,JSON) :- atom(Input),!,atom_string(Input,JSON).
policy_json_input(_,Input,Input).
policy_json_field(Fields,Key-Input,Key-JSON) :-
    (member(Field,Fields),Field=..[_,Key,Spec]->
       policy_json_input(Spec,Input,JSON)
    ;JSON=Input).

rule_id(Input,Id) :- Id=Input.kind.
normalize_rule(Patches,Kind,Severity,Rule) :-
    (member(Patch,Patches),rule_id(Patch,Kind)->true;Patch=json{}),
    option(Patch,enabled,true,Enabled),option(Patch,severity,Severity,S),
    text_list(Patch,ignoreTerms,Terms),text_list(Patch,ignoreMts,Mts),
    text_list(Patch,exemptTypes,Types),
    option(Patch,patterns,[],Patterns),
    Rule=json{kind:Kind,enabled:Enabled,severity:S,ignoreTerms:Terms,
              ignoreMts:Mts,exemptTypes:Types,patterns:Patterns}.
text_list(Dict,Key,Values) :-
    option(Dict,Key,[],Raw),sort(Raw,Values).
report_rule(Input,Rule) :-
    maplist(atom_string,Terms,Input.ignoreTerms),
    maplist(atom_string,Mts,Input.ignoreMts),
    maplist(atom_string,Types,Input.exemptTypes),
    maplist(report_pattern,Input.patterns,Patterns),
    Rule=rule{kind:Input.kind,enabled:Input.enabled,severity:Input.severity,
              ignoreTerms:Terms,ignoreMts:Mts,exemptTypes:Types,patterns:Patterns}.
report_pattern(Input,pattern{mode:Mode,value:Value}) :-
    Mode=Input.mode,atom_string(Value,Input.value).
option(Dict,Key,Default,Value) :- (get_dict(Key,Dict,Value)->true;Value=Default).

apply_policy(Policy,Finding,Output) :-
    member(Rule,Policy.rules),Rule.kind==Finding.kind,!,
    suppression(Rule,Finding,Reason),
    (Reason==none->Disposition=active;Disposition=suppressed),
    (memberchk(Finding.status,[loaded_available,exempt,standalone_reference,loaded_or_catalog_evidence])->
       Severity=info;Severity=Rule.severity),
    Output=Finding.put(json{severity:Severity,configuredSeverity:Rule.severity,disposition:Disposition,
      policy:json{revision:Policy.revision,reason:Reason}}).
suppression(Rule,_,disabled) :- Rule.enabled==false,!.
suppression(Rule,F,term_exemption) :- memberchk(F.term,Rule.ignoreTerms),!.
suppression(Rule,F,mt_exemption) :- memberchk(F.mt,Rule.ignoreMts),!.
suppression(Rule,F,type_exemption) :-
    member(Type,F.types),memberchk(Type,Rule.exemptTypes),!.
suppression(Rule,F,literal_pattern) :-
    member(P,Rule.patterns),matches(P,F.term),!.
suppression(_,_,none).
matches(P,Term) :-
    (P.mode==exact->Term==P.value
    ;P.mode==prefix->sub_atom(Term,0,_,_,P.value)
    ;sub_atom(Term,_,_,0,P.value)).

policy_preview(Input,Findings,Reply) :-
    normalize_policy(Input,Policy),must_be(list,Findings),
    maplist(apply_policy(Policy),Findings,Items),
    Reply=json{policy:Policy,items:Items,persisted:false,
      mutationCapability:json{available:false,reason:authenticated_policy_save_not_registered}}.
