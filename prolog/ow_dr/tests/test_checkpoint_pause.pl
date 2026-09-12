:- begin_tests(checkpoint_pause).
:- use_module('../kb_checkpoint_policy').
:- use_module('../kb_saved_state', []).
:- use_module('../kb_checkpoint', []).
:- use_module('../kb_checkpoint_http', []).
:- use_module('../kb_checkpoint_host', []).

test(all_automation_off) :-
    checkpoint_policy(P),
    assertion(P.autoSave==false),assertion(P.autoValidate==false),
    assertion(P.autoStart==false),assertion(P.autoPromote==false),
    assertion(P.executionPaused==true).

test(automatic_selected_image_not_resumed) :-
    kb_saved_state:startup_saved_state([],none).

test(explicit_source_selection_preserved) :-
    kb_saved_state:startup_saved_state(['KBs/tinyKB.krf'],sources(['KBs/tinyKB.krf'])).

test(process_entry_points_fail_before_side_effects) :-
    forall(member(case(Action,Goal),[
      case(save,kb_saved_state:create_saved_state("unused",0,none,_)),
      case(resume,kb_saved_state:run_saved_state(unused,[],_)),
      case(build,kb_saved_state:build_image(unused,unused)),
      case(child,kb_saved_state:run_child(unused,[],unused,1)),
      case(start_candidate,kb_checkpoint:try_checkpoint(unused,0,_)),
      case(promote,kb_checkpoint:promote_checkpoint(unused,0,_)),
      case(candidate,kb_checkpoint:candidate_entry(unused,_)),
      case(control_listener,kb_checkpoint:start_managed_instance(3050,_)),
      case(checkpoint_host,kb_checkpoint_host:start_host(_,_,_,_)),
      case(candidate_listener,kb_checkpoint:runtime_hook(start_candidate,_,_)),
      case(create,kb_checkpoint_http:submit_checkpoint_operation(create,_,_))
    ]),
      (catch((call(Goal),Outcome=unexpected_success),Error,Outcome=Error),
       assertion(Outcome=error(checkpoint_execution_paused(Action),_)))),
    assertion(\+kb_checkpoint:instance(_)),
    assertion(\+kb_checkpoint_http:operation(_,_,_)),
    assertion(\+kb_checkpoint_host:host(_)).

test(api_reports_pause) :-
    kb_checkpoint_http:error_description(error(checkpoint_execution_paused(create),_),
      409,checkpoint_paused,_).

:- end_tests(checkpoint_pause).
