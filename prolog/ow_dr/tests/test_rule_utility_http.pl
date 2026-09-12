:- begin_tests(rule_utility_http).
:- use_module('../kb_rule_utility_http').
:- use_module('../kb_rule_utility', []).
:- use_module('../kb_runtime', []).
:- use_module('../kb_store', []).
:- use_module('../kb_server', []).
:- use_module('../kb_paths').
:- use_module('../kb_urls', [app_base/1]).
:- use_module(library(filesex)).
:- use_module(library(uuid)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_open)).
:- use_module(library(http/json)).

fixture(State) :-
    \+kb_store:source_module(_,_,_),
    source_file(plunit_rule_utility_http:fixture(_),Here),file_directory_name(Here,Tests),
    uuid(U),atom_concat('.rule-utility-http-',U,Name),directory_file_path(Tests,Name,Dir),
    make_directory(Dir),directory_file_path(Dir,'fixture.krf',Source),
    directory_file_path(Dir,'fixture.pl',Native),
    setup_call_cleanup(open(Source,write,S,[encoding(utf8)]),
      format(S,'(in-microtheory TestMt)~n(choice A)~n(choice B)~n(<=== (pick ?X) (choice ?X))~n(<=== (dead) (choice Missing))~n(implies (p A) (q A))~n',[]),close(S)),
    findall(record(Id,Semantic,[xc_microtheory(Id,x_TestMt),xc_kb_names(Id,Names),
      xc_source_file(Id,Source),xc_source_line(Id,Line)]),record(Id,Semantic,Names,Line),Records),
    app_dir(App),directory_file_path(App,'kb_tail_loader.pl',Helper),
    setup_call_cleanup(open(Native,write,Output,[encoding(utf8)]),
      (write_native(Output,(:-use_module(Helper),kb_tail_loader:load_remaining)),
       maplist(write_record(Output),Records)),close(Output)),
    kb_runtime:native_load(Native,ow_utility_http),
    kb_cache:file_digest(Source,SourceHash),kb_cache:file_digest(Native,OutputHash),
    size_file(Source,Size),kb_store:generation(Previous),
    Info=fixture{source:Source,sourceHash:SourceHash,outputHash:OutputHash,
      normalized:Native,sizeBytes:Size,lineCount:6,status:fixture,count:5,elapsed:0,warnings:[]},
    kb_store:activate_source(entry(Source,Info,ow_utility_http,Native,Records,false)),
    kb_store:rebuild_rankings,retractall(kb_store:generation(_)),assertz(kb_store:generation(70)),
    kb_rule_utility:reset_telemetry,
    State=fixture{directory:Dir,source:Source,native:Native,previous:Previous}.
record(a701,x_choice(x_A),[],2).
record(a702,x_choice(x_B),[],3).
record(a710,(x_pick(X):-and(x_choice(X))),["?X"],4).
record(a711,(x_dead:-and(x_choice(x_Missing))),[],5).
record(a712,x_implies(x_p(x_A),x_q(x_A)),[],6).
write_native(S,Term) :- write_term(S,Term,[quoted(true),fullstop(true),nl(true)]).
write_record(S,record(Id,(Head:-Body),Metadata)) :- !,
    term_variables(Head,Inputs),In=..[vs|Inputs],
    write_native(S,(Head:-x_cid_io(Id,Body,In,vs))),maplist(write_native(S),Metadata).
write_record(S,record(Id,Head,Metadata)) :-
    write_native(S,(Head:-x_cid(Id))),maplist(write_native(S),Metadata).
cleanup(State) :-
    kb_store:remove_live_source(State.source),kb_runtime:native_unload(State.native),
    kb_store:rebuild_rankings,retractall(kb_store:generation(_)),
    assertz(kb_store:generation(State.previous)),kb_rule_utility:reset_telemetry,
    delete_directory_and_contents(State.directory).

test(read_only_unobserved_and_nonrule,[setup(fixture(S)),cleanup(cleanup(S))]) :-
    kb_rule_utility:export_telemetry(Before),
    rule_utility_read(utility{id:a710,checkSource:true,classicSTV:true},70,R),
    assertion(R.scope==cumulative),assertion(R.generation=:=70),
    assertion(R.eligibility==executable_rule),R.items=[Row],
    assertion(Row.observed==false),assertion(Row.calls==null),
    assertion(Row.classicSTV.available==false),
    assertion(Row.sourceFreshness.state==matches_loaded_source),
    rule_utility_read(utility{id:a712},70,Fact),assertion(Fact.items==[]),
    assertion(Fact.eligibility==not_executable),
    kb_rule_utility:export_telemetry(After),assertion(Before==After),
    assertion(\+kb_store:query_snapshot(_,_,_,_)).

test(actual_query_counts_and_independent_source_freshness,[setup(fixture(S)),cleanup(cleanup(S))]) :-
    kb_store:query_text_direct("(pick ?X)",x_TestMt,10,2,Query),
    assertion(Query.generation=:=70),assertion(length(Query.solutions,2)),
    rule_utility_read(utility{id:a710,classicSTV:true,checkSource:true},70,Before),
    Before.items=[Row],assertion(Row.calls=:=1),assertion(Row.results=:=2),
    assertion(Row.classicSTV.evidence.trials=:=1),
    assertion(abs(Row.classicSTV.confidence-1/801)<1.0e-12),
    setup_call_cleanup(open(S.source,append,Stream),format(Stream,'; edited source only~n',[]),close(Stream)),
    rule_utility_read(utility{id:a710,checkSource:true},70,After),After.items=[Same],
    assertion(Same.identityState==current),assertion(Same.sourceFreshness.state==changed_since_load),
    assertion(Same.contentHash==Row.contentHash),assertion(Same.calls=:=1).

test(pagination_and_generation_conflict,[setup(fixture(S)),cleanup(cleanup(S))]) :-
    rule_utility_read(utility{limit:1,sort:id},70,A),
    rule_utility_read(utility{limit:1,offset:1,sort:id},70,B),
    assertion(A.total=:=2),A.items=[First],B.items=[Second],assertion(First.id\==Second.id),
    catch(rule_utility_read(utility{},69,_),Error,true),
    assertion(Error=error(generation_conflict(69,70),_)),
    assertion(\+kb_store:query_snapshot(_,_,_,_)).

test(historical_source_is_not_guessed_after_unload,[setup(fixture(S)),cleanup(cleanup(S))]) :-
    kb_store:query_text_direct("(pick ?X)",x_TestMt,10,2,_),
    kb_store:remove_live_source(S.source),
    retractall(kb_store:generation(_)),assertz(kb_store:generation(71)),
    rule_utility_read(utility{id:a710,checkSource:true},71,R),R.items=[Row],
    assertion(R.eligibility==historical_observations),
    assertion(Row.identityState==stale),assertion(Row.provenance.basis==unavailable),
    assertion(Row.sourceFreshness.state==unavailable).

test(unknown_generation_is_not_presented_as_prior,[setup(fixture(S)),cleanup(cleanup(S))]) :-
    kb_runtime:query_modules([ow_utility_http],x_pick(_),x_TestMt,10,2,_),
    rule_utility_read(utility{id:a710},70,Reply),
    member(Observed,Reply.items),Observed.observed==true,!,
    assertion(Observed.generation==null),assertion(Observed.identityState==unknown_generation).

test(source_budget_and_missing_file_are_not_reported_fresh,[setup(fixture(S)),cleanup(cleanup(S))]) :-
    setup_call_cleanup(open(S.source,write,Out,[type(binary)]),
      (seek(Out,1048577,bof,_),put_byte(Out,32)),close(Out)),
    rule_utility_read(utility{id:a710,checkSource:true},70,Large),Large.items=[Row],
    assertion(Row.sourceFreshness.state==not_checked),
    assertion(Row.sourceFreshness.reason==size_budget),
    catch(kb_rule_utility_http:bounded_source_digest(S.source,_),Budget,true),
    assertion(Budget==source_read_budget),
    delete_file(S.source),
    rule_utility_read(utility{id:a710,checkSource:true},70,Missing),Missing.items=[Gone],
    assertion(Gone.sourceFreshness.state==missing).

test(source_hash_matches_cache_for_non_ascii_bytes,[setup(fixture(S)),cleanup(cleanup(S))]) :-
    setup_call_cleanup(open(S.source,write,Out,[type(binary)]),
      maplist(put_byte(Out),[0,10,13,128,255]),close(Out)),
    kb_cache:file_digest(S.source,Hash),
    kb_rule_utility_http:source_state(true,S.source,fixture{sourceHash:Hash},State),
    assertion(State.state==matches_loaded_source),assertion(State.sizeBytes=:=5).

test(invalid_bulk_source_check,[throws(error(domain_error(source_check_requires_assertion,any),_))]) :-
    rule_utility_read(utility{checkSource:true},any,_).
test(invalid_pagination,[throws(error(type_error(between(1,100),101),_))]) :-
    rule_utility_read(utility{limit:101},any,_).
test(invalid_assertion_path,[throws(error(domain_error(assertion_id,'../fixture'),_))]) :-
    rule_utility_read(utility{id:'../fixture'},any,_).

http_fixture(State) :-
    fixture(Base),
    http_server(http_dispatch,[port('127.0.0.1':Port),workers(2)]),
    assertz(kb_server:server_port(Port),Ref),
    State=Base.put(http{port:Port,portRef:Ref}).
http_cleanup(State) :-
    http_stop_server('127.0.0.1':State.port,[]),erase(State.portRef),cleanup(State).
get_json(Port,Query,Options,Status,Reply) :-
    app_base(Base),
    format(atom(URL),'http://127.0.0.1:~d~wapi/rule-utility~w',[Port,Base,Query]),
    setup_call_cleanup(http_open(URL,In,[status_code(Status)|Options]),
      json_read_dict(In,Reply,[value_string_as(atom)]),close(In)).

test(actual_http_endpoint_and_errors,[setup(http_fixture(S)),cleanup(http_cleanup(S))]) :-
    get_json(S.port,'?id=a710&generation=70&classic_stv=true',[],200,Unobserved),
    Unobserved.items=[Unknown],assertion(Unknown.classicSTV.available==false),
    kb_store:query_text_direct("(pick ?X)",x_TestMt,10,2,_),
    get_json(S.port,'?id=a710&generation=70&classic_stv=true',[],200,Measured),
    Measured.items=[Row],assertion(Row.calls=:=1),assertion(Row.classicSTV.k=:=800),
    get_json(S.port,'?id=a710&generation=69',[],409,Conflict),
    assertion(Conflict.error.code==generation_conflict),
    get_json(S.port,'?id=not-an-id',[],400,_),
    get_json(S.port,'?id=a999',[],404,_),
    get_json(S.port,'?id=a710',[request_header('Origin'='https://untrusted.invalid')],403,_).

:- end_tests(rule_utility_http).
