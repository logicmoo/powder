:- begin_tests(checkpoint_nonserving).
:- use_module('../kb_checkpoint_ipc',[]).
:- use_module('../kb_checkpoint_mode',[]).
:- use_module(library(filesex)).
:- use_module(library(process)).
:- use_module(library(qsave)).
:- use_module(library(socket),[]).
:- use_module(library(http/http_open),[]).
:- use_module(library(uuid)).
:- dynamic early_fence_verified/0.
:- volatile early_fence_verified/0.
:- initialization(plunit_checkpoint_nonserving:early_restore_probe,restore).

fixture(Directory) :-
    source_file(plunit_checkpoint_nonserving:fixture(_),Source),
    file_directory_name(Source,Tests),uuid(Id),
    atom_concat('.checkpoint-nonserving-',Id,Name),
    directory_file_path(Tests,Name,Directory),
    kb_checkpoint_ipc:private_directory(Directory).
cleanup(Directory) :- delete_directory_and_contents(Directory).
echo(Command,_{request:Command.request,value:Command.value,thread:Thread}) :-
    thread_self(Self),term_string(Self,Thread).
command(Value,_{request:Id,value:Value}) :- uuid(Id).

test(private_ipc_roundtrip_and_serial_worker,
     [setup(fixture(D)),cleanup(cleanup(D))]) :-
    setup_call_cleanup(kb_checkpoint_ipc:start_server(D,plunit_checkpoint_nonserving:echo,Worker),
      (command(first,A),kb_checkpoint_ipc:request(D,A,RA),
       command(second,B),kb_checkpoint_ipc:request(D,B,RB),
       assertion(RA.value==first),assertion(RB.value==second),
       assertion(RA.thread==RB.thread),
       directory_files(D,Files),assertion(Files==['.','..'])),
      kb_checkpoint_ipc:stop_server(Worker)),
    kb_checkpoint_ipc:snapshot_safe.

test(ipc_rejects_traversal_request_without_writing,
     [setup(fixture(D)),cleanup(cleanup(D)),
      throws(error(domain_error(checkpoint_ipc_request_id,_),_))]) :-
    kb_checkpoint_ipc:request(D,_{request:'../escape'},_).

test(existing_directory_is_not_adopted,
     [setup(fixture(D)),cleanup(cleanup(D)),
      throws(error(permission_error(create,checkpoint_mailbox,_),_))]) :-
    kb_checkpoint_ipc:private_directory(D).

test(candidate_cannot_fall_through_to_regular_resume,
     [cleanup(kb_checkpoint_mode:permit_serving)]) :-
    kb_checkpoint_mode:enter_candidate,
    catch(kb_checkpoint_mode:resume_serving,Error,true),
    assertion(Error=error(permission_error(resume,checkpoint_candidate,explicit_promotion_required),_)),
    assertion(kb_checkpoint_mode:nonserving).

test(actual_saved_network_fence_precedes_restore_initializers,
     [setup(fixture(D)),cleanup(cleanup(D))]) :-
    directory_file_path(D,'candidate.state',Image),
    directory_file_path(D,'verified',Report),
    source_file(plunit_checkpoint_nonserving:builder,Source),
    current_prolog_flag(executable,SWI),
    process_create(SWI,['-q','-f',none,'-s',Source,
      '-g','plunit_checkpoint_nonserving:builder','-t','halt(1)','--',Image],
      [process(Builder)]),
    process_wait(Builder,Built),assertion(Built==exit(0)),
    process_create(SWI,['-q','-f',none,'-x',Image,'--',Report],[process(Child)]),
    process_wait(Child,Exit),assertion(Exit==exit(0)),assertion(exists_file(Report)).
builder :-
    current_prolog_flag(argv,[Image]),kb_checkpoint_mode:seal_image,
    qsave_program(Image,[class(development),goal(plunit_checkpoint_nonserving:resumed),
      toplevel(halt),init_file(none),stand_alone(false),autoload(false),foreign(no_save),packs(false)]),
    halt.
early_restore_probe :-
    kb_checkpoint_mode:nonserving,
    catch(setup_call_cleanup(socket:tcp_socket(Socket),true,socket:tcp_close_socket(Socket)),
      SocketError,true),
    require_network_refusal(socket,SocketError),
    catch(http_open:http_open('http://127.0.0.1:9/',_,[timeout(1)]),HTTPError,true),
    require_network_refusal(http,HTTPError),
    assertz(early_fence_verified).
require_network_refusal(Label,Error) :-
    (nonvar(Error),sub_term(Term,Error),nonvar(Term),
     Term=permission_error(start,checkpoint_services,nonserving)->true;
      throw(error(test_network_fence_missing(Label,Error),_))).
resumed :-
    (early_fence_verified,kb_checkpoint_mode:nonserving->
      kb_checkpoint_mode:permit_serving,
      setup_call_cleanup(socket:tcp_socket(Socket),true,socket:tcp_close_socket(Socket)),
      current_prolog_flag(argv,[Report]),
      setup_call_cleanup(open(Report,write,S),write(S,verified),close(S)),halt(0)
    ;halt(1)).
:- end_tests(checkpoint_nonserving).
