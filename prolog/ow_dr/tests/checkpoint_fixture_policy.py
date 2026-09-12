"""Explicit test permission in a disposable copied application, never production."""
from pathlib import Path


def authorize_copied_checkpoint_fixture(app):
    app = Path(app).resolve()
    tests = Path(__file__).resolve().parent
    root = app.parent.parent
    if (root.parent != tests or not root.name.startswith((".checkpoint-", ".saved-state-frozen-"))
            or app != root / "prolog" / "ow_dr"):
        raise ValueError("Checkpoint test authorization requires an owned copied application")
    policy = app / "kb_checkpoint_policy.pl"
    current = policy.read_text(encoding="utf-8")
    if "executionPaused:true" not in current or "require_checkpoint_execution(Action) :-" not in current:
        raise ValueError("Production pause contract changed; review isolated test authorization")
    policy.write_text(
        """:- module(kb_checkpoint_policy,
  [pause_checkpoint_execution/0,checkpoint_policy/1,require_checkpoint_execution/1]).
% Authorized c06 fixture only. This file exists solely inside the copied test app.
checkpoint_policy(policy{schema:1,mode:isolated_c06_fixture,autoSave:false,
  autoValidate:true,autoStart:true,autoPromote:false,executionPaused:false,
  reason:"Authorized isolated c06 integration fixture; no production policy change."}).
pause_checkpoint_execution :-
  throw(error(permission_error(modify,fixture_policy,paused_startup_entry),_)).
require_checkpoint_execution(Action) :-
  (memberchk(Action,[build,candidate,candidate_listener,checkpoint_host,child,
    control_listener,create,promote,resume,restore,save,select,start_candidate,try])->true;
    throw(error(domain_error(fixture_checkpoint_action,Action),_))).
""", encoding="utf-8")
