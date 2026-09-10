:- module(kb_load_policy, [with_runtime_load/1, require_offline/1]).
:- meta_predicate with_runtime_load(0).
:- thread_local runtime_load/0.

with_runtime_load(Goal) :-
    setup_call_cleanup(asserta(runtime_load,Ref),Goal,erase(Ref)).

require_offline(Operation) :-
    (runtime_load->
      throw(error(runtime_cache_build(Operation),
                  context(Operation,'Normal loading requires prebuilt artifacts; use the offline compiler explicitly.')))
    ;true).
