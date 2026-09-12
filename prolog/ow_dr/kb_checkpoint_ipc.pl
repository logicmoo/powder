:- module(kb_checkpoint_ipc,
          [private_directory/1,start_server/3,stop_server/1,request/3,snapshot_safe/0]).
:- use_module(library(error)).
:- use_module(library(filesex)).
:- use_module(library(http/json)).
:- use_module(library(process)).
:- use_module(library(uuid)).
:- dynamic server/3.
:- volatile server/3.
:- meta_predicate start_server(+,2,-).

% Extend the existing atomic request/readiness-file IPC, not an HTTP listener.
% Each mailbox is an owner-only directory; messages are bounded JSON data.
private_directory(Directory) :-
    must_be(atom,Directory),
    (exists_directory(Directory)->permission_error(create,checkpoint_mailbox,Directory);true),
    (current_prolog_flag(windows,true)->
      source_file(kb_checkpoint_ipc:private_directory(_),Source),
      file_directory_name(Source,App),
      directory_file_path(App,'checkpoint_private_directory.ps1',Script),
      setup_call_cleanup(
        process_create(path(powershell),
          ['-NoProfile','-NonInteractive','-ExecutionPolicy','Bypass','-File',Script],
          [stdin(pipe(In)),stdout(null),stderr(std),process(PID)]),
        (format(In,'~w~n',[Directory]),close(In),process_wait(PID,Exit),
         (Exit==exit(0)->true;throw(error(checkpoint_private_directory_failed(Exit),_)))),
        catch(close(In),_,true))
    ;make_directory(Directory),chmod(Directory,0o700)).

start_server(Directory,Handler,Thread) :-
    must_be(atom,Directory),
    (exists_directory(Directory)->true;existence_error(checkpoint_mailbox,Directory)),
    message_queue_create(Stop),
    thread_create(serve(Directory,Handler,Stop),Thread,[inherit_from(main)]),
    assertz(server(Thread,Directory,Stop)).
stop_server(Thread) :-
    (server(Thread,_,Stop)->
      thread_send_message(Stop,stop),
      thread_join(Thread,Result),
      retractall(server(Thread,_,_)),message_queue_destroy(Stop),
      (Result==true->true;throw(error(checkpoint_ipc_worker_exit(Result),_)))
    ;true).
snapshot_safe :-
    (server(_,_,_)->throw(error(checkpoint_ipc_is_not_savable,_));true).

serve(Directory,Handler,Stop) :-
    (thread_get_message(Stop,stop,[timeout(0.02)])->true;
      directory_files(Directory,Files),
      forall((member(Name,Files),command_name(Name,Id)),
        handle_message(Directory,Id,Handler)),
      serve(Directory,Handler,Stop)).
command_name(Name,Id) :-
    atom_concat('command-',Tail,Name),atom_concat(Id,'.json',Tail),valid_id(Id).
valid_id(Id) :-
    atom(Id),atom_length(Id,36),atom_codes(Id,Codes),
    forall(member(C,Codes),(between(0'0,0'9,C);between(0'a,0'f,C);C=:=0'-)).
message_path(Directory,Kind,Id,Path) :-
    (valid_id(Id)->true;domain_error(checkpoint_ipc_request_id,Id)),
    atomic_list_concat([Kind,'-',Id,'.json'],Name),directory_file_path(Directory,Name,Path).
handle_message(Directory,Id,Handler) :-
    message_path(Directory,command,Id,Input),message_path(Directory,reply,Id,Output),
    catch((read_message(Input,Command),
      (Command.request==Id->true;domain_error(checkpoint_ipc_request,Command.request)),
      call(Handler,Command,Reply)),Error,
      (message_to_string(Error,Text),Reply=_{ok:false,error:Text,request:Id})),
    publish(Output,Reply),
    delete_file(Input),
    get_time(Start),await_consumed(Output,Start).
await_consumed(File,Start) :-
    (exists_file(File),get_time(Now),Now-Start<2->
      sleep(0.01),await_consumed(File,Start);true).

request(Directory,Command,Reply) :-
    must_be(atom,Directory),must_be(dict,Command),
    message_path(Directory,command,Command.request,Input),
    message_path(Directory,reply,Command.request,Output),
    (exists_directory(Directory)->true;existence_error(checkpoint_mailbox,Directory)),
    publish(Input,Command),
    get_time(Start),await_reply(Output,Start,Reply),
    delete_file(Output).
await_reply(File,Start,Reply) :-
    (exists_file(File)->read_message(File,Reply);
      get_time(Now),
      (Now-Start<30->sleep(0.02),await_reply(File,Start,Reply);
        throw(error(checkpoint_ipc_timeout,_)))).
read_message(File,Message) :-
    size_file(File,Size),
    (Size=<4194304->true;resource_error(checkpoint_ipc_message_size)),
    setup_call_cleanup(open(File,read,S,[encoding(utf8)]),
      (json_read_dict(S,Message,[value_string_as(atom)]),
       read_string(S,_,Tail),
       (normalize_space(string(""),Tail)->true;syntax_error(checkpoint_ipc_trailing_data))),
      close(S)).
publish(File,Message) :-
    uuid(Id),atomic_list_concat([File,'.',Id,'.stage'],Stage),
    setup_call_cleanup(true,
      (setup_call_cleanup(open(Stage,write,S,[encoding(utf8),newline(posix)]),
         (json_write_dict(S,Message,[width(0)]),nl(S),flush_output(S)),close(S)),
       rename_file(Stage,File)),
      (exists_file(Stage)->delete_file(Stage);true)).
