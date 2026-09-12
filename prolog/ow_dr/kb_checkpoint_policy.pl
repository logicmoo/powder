:- module(kb_checkpoint_policy,
          [pause_checkpoint_execution/0, checkpoint_policy/1,
           require_checkpoint_execution/1]).
:- use_module(kb_config, [settings_file/1]).
:- use_module(kb_cache, []).
:- use_module(library(filesex)).
:- use_module(library(http/json)).

% Fail closed until save-only/manual intent and non-serving IPC are integrated.
% There is deliberately no HTTP, environment or saved-image opt-out.
checkpoint_policy(policy{schema:1,mode:manual_only,autoSave:false,
    autoValidate:false,autoStart:false,autoPromote:false,executionPaused:true,
    reason:"Checkpoint execution is paused by user request. Manual save-only and non-serving candidate integration is pending."}).

pause_checkpoint_execution :-
    checkpoint_policy(Policy),settings_file(Settings),
    file_directory_name(Settings,Directory),make_directory_path(Directory),
    directory_file_path(Directory,'checkpoint-policy.json',File),
    atom_concat(File,'.lock',LockFile),kb_cache:try_lock(LockFile,Lock),
    (Lock==busy->throw(error(checkpoint_policy_busy,_));
     setup_call_cleanup(true,write_policy(File,Policy),kb_cache:release_lock(Lock))).

write_policy(File,Policy) :-
    kb_cache:stage_path(File,Stage),
    setup_call_cleanup(true,
      (setup_call_cleanup(open(Stage,write,S,[encoding(utf8),newline(posix)]),
         (json_write_dict(S,Policy,[width(0)]),nl(S),flush_output(S)),close(S)),
       kb_cache:install_stage(Stage,File)),
      kb_cache:remove_if_exists(Stage)).

require_checkpoint_execution(Action) :-
    throw(error(checkpoint_execution_paused(Action),
      context(kb_checkpoint_policy,
        'Automatic checkpointing is OFF. Checkpoint processes remain paused until manual-only, non-serving candidate support is integrated.'))).
