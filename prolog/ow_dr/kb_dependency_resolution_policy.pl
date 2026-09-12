:- module(kb_dependency_resolution_policy,
          [default_policy/1,normalize_policy/2,apply_policy/3,policy_preview/3]).
:- use_module(kb_cache,[terms_digest/2]).
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

default_policy(Policy) :- normalize_policy(json{},Policy).
normalize_policy(Input,Policy) :-
    must_be(dict,Input),known_keys(Input,[rules]),
    option(Input,rules,[],Patches),bounded_list(Patches,6),
    maplist(rule_id,Patches,Ids),sort(Ids,Unique),
    (same_length(Ids,Unique)->true;domain_error(duplicate_policy_rules,Ids)),
    findall(Rule,(kind(Kind,Severity),normalize_rule(Patches,Kind,Severity,Rule)),Rules),
    terms_digest([dependency_policy_v1,Rules],Revision),
    Policy=policy{schema:dependency_policy_v1,revision:Revision,rules:Rules}.

rule_id(Input,Id) :-
    must_be(dict,Input),text_atom(Input.kind,Id),
    (kind(Id,_)->true;domain_error(dependency_check,Id)).
normalize_rule(Patches,Kind,Severity,Rule) :-
    (member(Patch,Patches),rule_id(Patch,Kind)->true;Patch=json{}),
    known_keys(Patch,[kind,enabled,severity,ignoreTerms,ignoreMts,exemptTypes,patterns]),
    option(Patch,enabled,true,Enabled),must_be(boolean,Enabled),
    option(Patch,severity,Severity,S0),text_atom(S0,S),
    (memberchk(S,[info,warning,error])->true;domain_error(dependency_severity,S)),
    text_list(Patch,ignoreTerms,Terms),text_list(Patch,ignoreMts,Mts),
    text_list(Patch,exemptTypes,Types),
    option(Patch,patterns,[],Patterns0),bounded_list(Patterns0,32),
    maplist(pattern,Patterns0,Patterns),
    Rule=rule{kind:Kind,enabled:Enabled,severity:S,ignoreTerms:Terms,
              ignoreMts:Mts,exemptTypes:Types,patterns:Patterns}.
text_list(Dict,Key,Values) :-
    option(Dict,Key,[],Raw),bounded_list(Raw,128),maplist(bounded_text(4096),Raw,Texts),
    sort(Texts,Values).
pattern(Input,pattern{mode:Mode,value:Value}) :-
    must_be(dict,Input),known_keys(Input,[mode,value]),
    text_atom(Input.mode,Mode),
    (memberchk(Mode,[exact,prefix,suffix])->true;domain_error(literal_pattern_mode,Mode)),
    bounded_text(128,Input.value,Value).
bounded_text(Max,Input,Text) :-
    text_atom(Input,Text),atom_length(Text,N),
    (N>0,N=<Max->true;domain_error(bounded_policy_text,Input)).
bounded_list(Input,Max) :-
    must_be(list,Input),length(Input,N),
    (N=<Max->true;domain_error(policy_list_limit,Max)).
known_keys(Dict,Allowed) :-
    dict_pairs(Dict,_,Pairs),
    forall(member(Key-_,Pairs),(memberchk(Key,Allowed)->true;domain_error(policy_property,Key))).
text_atom(Input,Atom) :-
    (atom(Input)->Atom=Input;string(Input)->atom_string(Atom,Input);type_error(text,Input)).
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
