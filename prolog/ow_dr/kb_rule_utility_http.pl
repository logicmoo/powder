:- module(kb_rule_utility_http, [rule_utility_read/3]).
:- use_module(kb_rule_utility, []).
:- use_module(kb_store, []).
:- use_module(kb_runtime, []).
:- use_module(kb_activity, [with_application/1]).
:- use_module(library(crypto)).
:- use_module(library(error)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_json)).
:- use_module(library(time)).

:- http_handler(openworld_dr('api/rule-utility'),utility_endpoint,[method(get)]).

utility_endpoint(Request) :-
    catch((kb_server:valid_origin(Request),
      http_parameters(Request,[id(Id,[atom,default(any)]),
        generation(Generation,[integer,optional(true)]),
        offset(Offset,[integer,default(0)]),limit(Limit,[integer,default(25)]),
        sort(Sort,[atom,default(calls)]),classic_stv(Classic,[boolean,default(false)]),
        check_source(Check,[boolean,default(false)])]),
      (var(Generation)->Expected=any;Expected=Generation),
      rule_utility_read(utility{id:Id,offset:Offset,limit:Limit,sort:Sort,
        classicSTV:Classic,checkSource:Check},Expected,Reply),
      reply_json_dict(Reply)),Error,kb_server:api_error(Error)).

rule_utility_read(Options,Expected,Reply) :-
    must_be(dict,Options),
    value(Options,id,any,Id),valid_id(Id),
    value(Options,offset,0,Offset),must_be(nonneg,Offset),
    value(Options,limit,25,Limit),must_be(between(1,100),Limit),
    value(Options,sort,calls,Sort),must_be(atom,Sort),
    value(Options,classicSTV,false,Classic),must_be(boolean,Classic),
    value(Options,checkSource,false,Check),must_be(boolean,Check),
    (Check==true,Id==any->throw(error(domain_error(source_check_requires_assertion,Id),_));true),
    with_application(setup_call_cleanup(
      acquire_snapshot(Expected,Snapshot),
      read_snapshot(Snapshot,Id,[id(Id),offset(Offset),limit(Limit),sort(Sort)],Classic,Check,Reply),
      kb_store:release_query_snapshot(Snapshot))).

value(Dict,Key,Default,Value) :- (get_dict(Key,Dict,Value)->true;Value=Default).
valid_id(any) :- !.
valid_id(Id) :-
    must_be(atom,Id),atom_length(Id,Length),
    (between(2,256,Length),atom_concat(a,Hex,Id),atom_codes(Hex,Codes),
     forall(member(C,Codes),(between(0'0,0'9,C);between(0'a,0'f,C)))->true
    ;throw(error(domain_error(assertion_id,Id),_))).

acquire_snapshot(Expected,Snapshot) :-
    with_mutex(openworld_store,
      (kb_store:generation(Current),check_generation(Expected,Current),
       kb_store:acquire_query_snapshot(Snapshot))).
check_generation(any,_) :- !.
check_generation(Expected,Current) :-
    must_be(nonneg,Expected),
    (Expected=:=Current->true;throw(error(generation_conflict(Expected,Current),_))).

read_snapshot(Snapshot,Id,Options,Classic,Check,Reply) :-
    kb_rule_utility:rule_list(Snapshot.generation,Snapshot.modules,Options,Page),
    with_mutex(openworld_store,
      (kb_store:generation(Current),check_generation(Snapshot.generation,Current),
       eligibility(Id,Page,Eligibility),
       maplist(source_reference,Page.items,References))),
    source_check(Check,References,Freshness),
    maplist(enrich_row(Classic,Freshness),References,Items),
    Reply=Page.put(utility{items:Items,scope:cumulative,generation:Snapshot.generation,
      id:Id,eligibility:Eligibility,classicSTVRequested:Classic,
      freshnessMeaning:"Content identity refers to the pinned loaded snapshot, not an unchecked source file on disk.",
      sourcePolicy:"Source checks are read-only, at most 1 MiB and 250 ms for one selected assertion. No compilation, loading, or query is performed."}).

eligibility(any,_,collection) :- !.
eligibility(Id,Page,Eligibility) :-
    (kb_store:assertion(Id,Data)->
      (kb_runtime:module_assertion(Data.module,Id,(_:-_),_)->
        Eligibility=executable_rule
      ;Page.total>0->Eligibility=historical_observations
      ;Eligibility=not_executable)
    ;Page.total>0->Eligibility=historical_observations
    ;throw(error(existence_error(assertion,Id),_))).

source_reference(Row,reference(Row,Source,Info,Provenance)) :-
    memberchk(Row.identityState,[current,prior_generation,unknown_generation]),
    kb_store:assertion(Row.id,Data),
    kb_store:source_module(Source,Data.module,_),kb_store:source_info(Source,Info),!,
    value(Info,sourceHash,null,Hash),value(Info,outputHash,null,Output),
    Provenance=utility{basis:matching_loaded_assertion,source:Data.source,line:Data.line,
      mt:Data.mt,loadedSourceHash:Hash,loadedOutputHash:Output,
      note:"This is the current matching loaded assertion's location, not a reconstructed historical source location."}.
source_reference(Row,reference(Row,none,utility{},utility{basis:unavailable,
    note:"Historical source location was not retained. This observation is not evidence about the current file."})).

source_check(true,References,Freshness) :-
    member(reference(_,Source,Info,_),References),Source\==none,!,
    source_state(true,Source,Info,Freshness).
source_check(_,_,utility{state:not_checked,reason:not_requested}).

enrich_row(Classic,Checked,reference(Row,Source,_,Provenance),Enriched) :-
    (Source==none->source_state(false,none,utility{},Freshness);Freshness=Checked),
    Base=Row.put(utility{provenance:Provenance,sourceFreshness:Freshness}),
    (Classic==true->kb_rule_utility:opencog_utility(Row,[],View),Enriched=Base.put(classicSTV,View)
    ;Enriched=Base).

source_state(_,none,_,utility{state:unavailable,reason:historical_source_not_retained}) :- !.
source_state(false,_,_,utility{state:not_checked,reason:not_requested}) :- !.
source_state(true,Source,Info,State) :-
    (get_dict(sourceHash,Info,Expected),atom(Expected),Expected\==null->
      catch((call_with_time_limit(0.25,checked_source(Source,Expected,State))->true;
        State=utility{state:unavailable,reason:read_failed}),
        Error,source_error(Error,State))
    ;State=utility{state:unavailable,reason:loaded_source_hash_missing}).
checked_source(Source,Expected,State) :-
    (exists_file(Source)->
      size_file(Source,Size),time_file(Source,Modified),
      (Size>1048576->State=utility{state:not_checked,reason:size_budget,sizeBytes:Size}
      ;bounded_source_digest(Source,Actual),
       size_file(Source,AfterSize),time_file(Source,AfterTime),
       (Size=:=AfterSize,Modified=:=AfterTime->
         (Expected==Actual->Status=matches_loaded_source;Status=changed_since_load),
         State=utility{state:Status,sourceHash:Actual,sizeBytes:Size}
       ;State=utility{state:not_checked,reason:changed_during_read}))
    ;State=utility{state:missing,reason:source_not_found}).
bounded_source_digest(Source,Digest) :-
    setup_call_cleanup(open(Source,read,Stream,[type(binary)]),
      (read_string(Stream,1048576,Bytes),
       (at_end_of_stream(Stream)->true;throw(source_read_budget))),
      close(Stream)),
    % Match kb_cache:file_digest/2's crypto encoding, including bytes above 127.
    crypto_data_hash(Bytes,Digest,[algorithm(sha256)]).
source_error(time_limit_exceeded,utility{state:not_checked,reason:time_budget}) :- !.
source_error(source_read_budget,utility{state:not_checked,reason:size_budget}) :- !.
source_error(_,utility{state:unavailable,reason:read_failed}).
