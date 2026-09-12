:- begin_tests(debug_telnet).
:- use_module('../kb_debug_telnet').
:- use_module(library(memfile)).

test(import_is_disabled) :-
    debug_telnet_status(S),assertion(S.enabled==false),debug_snapshot_safe.
test(default_port) :-
    kb_debug_telnet:configuration([],C),assertion(C.port=:=3051).
test(port_boundaries,[forall(member(P,[1,65535]))]) :-
    kb_debug_telnet:configuration([port(P)],_).
test(invalid_port,[throws(error(domain_error(debug_limit,0),_))]) :-
    kb_debug_telnet:configuration([port(0)],_).
test(no_remote_address_option,[throws(error(domain_error(debug_option,_),_))]) :-
    kb_debug_telnet:configuration([host('0.0.0.0')],_).
test(duplicate_options,[throws(error(domain_error(duplicate_debug_options,_),_))]) :-
    kb_debug_telnet:configuration([port(1),port(2)],_).
test(auth_timeout_bounded,[throws(error(domain_error(debug_timeout,0),_))]) :-
    kb_debug_telnet:configuration([auth_timeout(0)],_).
test(owner_state_volatile,[forall(member(P,[service/6,auth_digest/2,client/5,attempts/3,
                                         telnet_channel/2,stopped_profile/1,admitted_debug_command/0]))]) :-
    P=Name/Arity,functor(Head,Name,Arity),
    assertion(predicate_property(kb_debug_telnet:Head,volatile)).
test(comparison_matches) :- kb_debug_telnet:xor_codes([1,2],[1,2],0,0).
test(comparison_mismatch) :-
    kb_debug_telnet:xor_codes([1,2],[1,3],0,N),assertion(N=\=0).
test(disable_is_idempotent) :-
    start_debug_telnet([enabled(false)]),stop_debug_telnet,debug_snapshot_safe.
test(escaped_iac_is_literal_data) :-
    setup_call_cleanup(new_memory_file(F),
      (setup_call_cleanup(open_memory_file(F,write,Out,[encoding(octet)]),
         (put_byte(Out,255),put_byte(Out,255),put_byte(Out,10)),close(Out)),
       setup_call_cleanup(open_memory_file(F,read,In,[encoding(octet)]),
         kb_debug_telnet:line(In,80,[255]),close(In))),
      free_memory_file(F)).
test(profile_is_full_nonsecret_whitelist) :-
    debug_resume_profile(Profile),dict_pairs(Profile,_,Pairs),pairs_keys(Pairs,Keys),
    assertion(Keys==[attempt_limit,attempt_window,auth_timeout,enabled,idle_timeout,
                     max_line,max_sessions,port,query_timeout,session_timeout]),
    debug_profile_options(Profile,Options),
    assertion(memberchk(enabled(false),Options)).
test(profile_preserves_disabled_custom_limits) :-
    setup_call_cleanup(
      start_debug_telnet([enabled(false),port(40123),auth_timeout(7),max_line(300)]),
      (debug_resume_profile(P),assertion(P.port=:=40123),assertion(P.auth_timeout=:=7),
       assertion(P.max_line=:=300),assertion(P.enabled==false)),
      start_debug_telnet([enabled(false)])).
test(profile_rejects_unknown_fields,[throws(error(domain_error(debug_profile_fields,_),_))]) :-
    debug_resume_profile(P),debug_profile_options(P.put(extra,discard),_).
test(admission_check_requires_exclusive_gate,
     [throws(error(permission_error(check,debug_quiescence,exclusive_admission_required),_))]) :-
    debug_require_admission_quiescence.
test(command_lease_releases_after_exception) :-
    catch(kb_debug_telnet:with_debug_command(throw(test_exception)),test_exception,true),
    assertion(\+in_debug_command),kb_activity:activity_status(S),assertion(S.active=:=0).
test(admitted_host_call_cannot_change_shutdown_latch) :-
    catch(kb_debug_telnet:with_debug_command(kb_debug_admin:stop_host_debug),
          error(permission_error(administer,debug_host,client_thread),_),Rejected=true),
    assertion(Rejected==true),assertion(\+kb_debug_admin:host_shutdown),
    assertion(\+in_debug_command).
test(admission_check_requires_owned_lease) :-
    setup_call_cleanup(kb_activity:begin_admission_lease(Token),
      setup_call_cleanup(
        thread_create(debug_require_admission_quiescence,Thread,[]),
        (thread_join(Thread,Status),
         assertion(Status=exception(error(permission_error(check,debug_quiescence,
                                                          exclusive_admission_required),_)))),
        catch(thread_join(Thread,_),_,true)),
      kb_activity:end_admission_lease(Token)).
:- end_tests(debug_telnet).
