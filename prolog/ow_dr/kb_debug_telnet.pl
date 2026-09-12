:- module(kb_debug_telnet,
          [start_debug_telnet/0, start_debug_telnet/1, stop_debug_telnet/0,
           debug_telnet_status/1, debug_credentials_file/1, debug_snapshot_safe/0]).

:- use_module(library(socket)).
:- use_module(library(crypto)).
:- use_module(library(http/json)).
:- use_module(library(process)).
:- use_module(library(readutil)).
:- use_module(library(error)).
:- use_module(library(option)).
:- use_module(library(time)).
:- use_module(library(utf8)).
:- use_module(library(aggregate)).

:- dynamic service/6, auth_digest/2, client/5, attempts/3.
:- volatile service/6, auth_digest/2, client/5, attempts/3.
:- thread_local telnet_channel/2.

% No initialization: importing this module cannot start a listener.
start_debug_telnet :- start_debug_telnet([]).
start_debug_telnet(Options) :-
    configuration(Options,Config),
    (Config.enabled==false -> stop_debug_telnet;
     with_mutex(powder_debug_lifecycle,
       (service(_,running,_,_,Existing,_) ->
          (Existing==Config -> true;permission_error(reconfigure,running_debug_service,stop_first))
       ;service(_,_,_,_,_,_) -> permission_error(start,debug_service,stopping)
       ;start_service(Config)))).

configuration(Options,C) :-
    must_be(list,Options),maplist(known_option,Options),
    findall(Name,(member(O,Options),functor(O,Name,1)),Names),
    sort(Names,Unique),length(Names,N),length(Unique,U),
    (N=:=U->true;domain_error(duplicate_debug_options,Names)),
    option(enabled(Enabled),Options,true),must_be(boolean,Enabled),
    option(port(Port),Options,3051),integer_between(Port,1,65535),
    option(max_sessions(Max),Options,2),integer_between(Max,1,16),
    option(attempt_limit(Rate),Options,10),integer_between(Rate,1,1000),
    option(max_line(Line),Options,16384),integer_between(Line,128,65536),
    timed_option(auth_timeout,Options,5,Auth),
    timed_option(idle_timeout,Options,300,Idle),
    timed_option(session_timeout,Options,900,Session),
    timed_option(query_timeout,Options,30,Query),
    timed_option(attempt_window,Options,60,Window),
    C=debug_config{enabled:Enabled,port:Port,max_sessions:Max,attempt_limit:Rate,
       max_line:Line,auth_timeout:Auth,idle_timeout:Idle,session_timeout:Session,
       query_timeout:Query,attempt_window:Window}.
known_option(O) :-
    (compound(O),functor(O,Name,1),
     memberchk(Name,[enabled,port,max_sessions,attempt_limit,max_line,auth_timeout,
                     idle_timeout,session_timeout,query_timeout,attempt_window]) -> true;
     domain_error(debug_option,O)).
integer_between(N,Low,High) :-
    must_be(integer,N),(between(Low,High,N)->true;domain_error(debug_limit,N)).
timed_option(Name,Options,Default,N) :-
    O=..[Name,N],option(O,Options,Default),must_be(number,N),
    (N>=0.05,N=<86400->true;domain_error(debug_timeout,N)).

start_service(Config) :-
    (current_prolog_flag(windows,true)->true;
     permission_error(start,private_debug_credentials,unsupported_platform)),
    Owned=owned(none,none,none),
    setup_call_catcher_cleanup(tcp_socket(Socket),
      (tcp_bind(Socket,ip(127,0,0,1):Config.port),
       tcp_listen(Socket,Config.max_sessions),
       sig_atomic(
         (create_credentials(Config.port,File,Hash),nb_setarg(1,Owned,File),
          crypto_n_random_bytes(16,Bytes),
          crypto_data_hash(Bytes,Generation,[algorithm(sha256),encoding(octet)]),
          nb_setarg(2,Owned,Generation),
          thread_create(accept_main(Generation,Socket,Config),Manager,[]),
          nb_setarg(3,Owned,Manager),
          assertz(auth_digest(Generation,Hash)),
          assertz(service(Generation,running,Socket,Manager,Config,File)),
          thread_send_message(Manager,start)))),
      Catcher,(Catcher==exit->true;failed_start(Socket,Owned))).
failed_start(Socket,owned(File,G,Manager)) :-
    (Manager==none->true;signal_stop(Manager)),
    close_socket(Socket),
    (Manager==none->true;catch(wait_threads([Manager],3),_,true)),
    (G==none->true;retractall(auth_digest(G,_)),retractall(service(G,_,_,_,_,_))),
    (File==none->true;remove_credentials(File)).

stop_debug_telnet :-
    thread_self(Self),
    (client(_,_,Self,_,_)->permission_error(stop,debug_service,client_thread);true),
    with_mutex(powder_debug_lifecycle,stop_service).
stop_service :-
    (service(G,State,Socket,Manager,Config,File) ->
       (State==running ->
         retract(service(G,State,Socket,Manager,Config,File)),
         assertz(service(G,stopping,Socket,Manager,Config,File));true),
       retractall(auth_digest(G,_)),
       signal_stop(Manager),close_socket(Socket),
       with_mutex(powder_debug_clients,
         findall(Thread,client(G,_,Thread,_,_),Clients)),
       maplist(signal_stop,Clients),
       wait_threads([Manager|Clients],3),
       remove_credentials(File),
       retractall(service(G,_,_,_,_,_)),retractall(attempts(G,_,_))
    ;true).
signal_stop(Thread) :- catch(thread_signal(Thread,throw(debug_stop)),_,true).
wait_threads(Threads,Seconds) :-
    statistics(walltime,[Start,_]),Deadline is Start+Seconds*1000,
    wait_threads_until(Threads,Deadline).
wait_threads_until(Threads,Deadline) :-
    include(thread_running,Threads,Running),
    (Running==[] -> maplist(join_thread,Threads);
     statistics(walltime,[Now,_]),
     (Now>=Deadline -> length(Running,N),throw(error(debug_threads_still_running(N),_));
      sleep(0.02),wait_threads_until(Threads,Deadline))).
thread_running(T) :- catch(thread_property(T,status(running)),_,fail).
join_thread(T) :- catch(thread_join(T,_),_,true).

accept_main(G,Socket,C) :-
    catch((thread_get_message(start),accept_loop(G,Socket,C)),_,
      (close_socket(Socket),
       with_mutex(powder_debug_clients,
         (retract(service(G,running,Socket,Manager,Config,File)) ->
            retractall(auth_digest(G,_)),
            assertz(service(G,failed,Socket,Manager,Config,File))
         ;true)))).
accept_loop(G,Socket,C) :-
    Ownership=owner(local),
    setup_call_cleanup(tcp_accept(Socket,Slave,Peer),
      (Peer==ip(127,0,0,1),admit_client(G,Slave,C,Ownership)),
      (arg(1,Ownership,local)->close_socket(Slave);true)),
    !,accept_loop(G,Socket,C).
accept_loop(G,Socket,C) :- accept_loop(G,Socket,C).

admit_client(G,Socket,C,Ownership) :-
    with_mutex(powder_debug_clients,
      sig_atomic((service(G,running,_,_,_,_),
       aggregate_all(count,client(G,_,_,_,_),Count),Count<C.max_sessions,
       allow_attempt(G,C),
       crypto_n_random_bytes(8,Nonce),
       crypto_data_hash(Nonce,Id,[algorithm(sha256),encoding(octet)]),
       setup_call_catcher_cleanup(
         thread_create(client_main(G,Id,Socket,C),Thread,[detached(true)]),
         (assertz(client(G,Id,Thread,Socket,authenticating)),
          nb_setarg(1,Ownership,transferred),thread_send_message(Thread,start)),
         Catcher,(Catcher==exit->true;signal_stop(Thread)))))).
allow_attempt(G,C) :-
    statistics(walltime,[Now,_]),
    (retract(attempts(G,Start,Count)) ->
       (Now-Start>=C.attempt_window*1000 -> Next=1,Since=Now;
        Next is Count+1,Since=Start)
    ;Next=1,Since=Now),
    assertz(attempts(G,Since,Next)),Next=<C.attempt_limit.

client_main(G,Id,Socket,C) :-
    setup_call_cleanup(true,
      catch((thread_get_message(start),
        setup_call_cleanup(tcp_open_socket(Socket,In,Out),
          (set_stream(In,encoding(octet)),set_stream(Out,encoding(utf8)),
           set_stream(Out,newline(posix)),set_stream(Out,buffer(false)),
           set_stream(Out,timeout(C.query_timeout)),
           setup_call_cleanup(asserta(telnet_channel(In,Out),Channel),
             call_with_time_limit(C.session_timeout,
               client_session(G,Id,In,Out,C),debug_session),
             erase(Channel))),
          (close_stream(In),close_stream(Out)))),_,true),
      (close_socket(Socket),
       with_mutex(powder_debug_clients,retractall(client(G,Id,_,_,_))))).

client_session(G,Id,In,Out,C) :-
    format(Out,'POWDER DEBUG 1~nAUTH required~n',[]),flush_output(Out),
    (catch(call_with_time_limit(C.auth_timeout,authenticate(G,In)),_,fail) ->
       with_mutex(powder_debug_clients,
         (retract(client(G,Id,T,S,authenticating)),
          assertz(client(G,Id,T,S,authenticated)))),
       set_prolog_IO(In,Out,Out),
       format(Out,'OK~nSame-process Prolog. One goal per line; end_of_file. disconnects.~n',[]),
       repl(In,Out,C)
    ;format(Out,'DENIED~n',[]),flush_output(Out)).
authenticate(G,In) :-
    line(In,80,Codes),append([65,85,84,72,32],Token,Codes),
    length(Token,64),maplist(hex_code,Token),
    string_codes(Text,Token),crypto_data_hash(Text,Hash,[algorithm(sha256),encoding(utf8)]),
    auth_digest(G,Expected),atom_codes(Hash,A),atom_codes(Expected,B),
    xor_codes(A,B,0,Difference),Difference=:=0.
hex_code(C) :- (between(0'0,0'9,C);between(0'a,0'f,C)).
xor_codes([],[],D,D).
xor_codes([A|As],[B|Bs],D0,D) :-
    D1 is D0 \/ (A xor B),xor_codes(As,Bs,D1,D).

line(In,Limit,Codes) :- line_codes(In,Limit,[],Reverse),reverse(Reverse,Codes).
line_codes(In,Left,Acc,Codes) :-
    Wire is Left*4+256,
    telnet_line_codes(In,Left,Acc,Codes,budget(Wire,32)).
telnet_line_codes(In,Left,Acc,Codes,Budget) :-
    telnet_byte(In,Budget,B),
    (B=:= -1 -> (Acc==[]->throw(debug_client_eof);throw(debug_incomplete_line));
     B=:=10 -> Codes=Acc;
     B=:=13 -> telnet_byte(In,Budget,Next),
       (memberchk(Next,[10,0])->Codes=Acc;throw(debug_invalid_newline));
     (B<32;B=:=127) -> throw(debug_protocol_control);
     Left>0 -> Rest is Left-1,telnet_line_codes(In,Rest,[B|Acc],Codes,Budget);
     throw(debug_line_limit)).

wire_byte(In,Budget,B) :-
    arg(1,Budget,Left),
    (Left>0->Next is Left-1,nb_setarg(1,Budget,Next),get_byte(In,B);
     throw(debug_telnet_wire_limit)).
telnet_byte(In,Budget,B) :-
    wire_byte(In,Budget,Byte),
    (Byte=:=255 ->
       wire_byte(In,Budget,Command),
       (Command=:=255->B=255;
       negotiation_budget(Budget),
       telnet_command(Command,In,Budget),
       telnet_byte(In,Budget,B))
    ;B=Byte).
negotiation_budget(Budget) :-
    arg(2,Budget,Left),
    (Left>0->Next is Left-1,nb_setarg(2,Budget,Next);
     throw(debug_telnet_negotiation_limit)).
telnet_command(Command,In,Budget) :-
    memberchk(Command,[251,252,253,254]),!,
    wire_byte(In,Budget,Option),
    (Option>=0->true;throw(debug_client_eof)),
    (Command=:=251->telnet_reply(In,254,Option);
     Command=:=253->telnet_reply(In,252,Option);true).
telnet_command(250,In,Budget) :- !,telnet_subnegotiation(In,Budget,256).
telnet_command(Command,_,_) :-
    memberchk(Command,[241,242,243,244,245,246,247,248,249]),!.
telnet_command(_,_,_) :- throw(debug_telnet_invalid_command).
telnet_subnegotiation(In,Budget,Left) :-
    (Left>0->true;throw(debug_telnet_subnegotiation_limit)),
    wire_byte(In,Budget,B),Rest is Left-1,
    (B=:= -1->throw(debug_client_eof);
     B=:=255 ->
       (Rest>0->true;throw(debug_telnet_subnegotiation_limit)),
       wire_byte(In,Budget,Next),Remaining is Rest-1,
       (Next=:=240->true;
       Next=:=255->telnet_subnegotiation(In,Budget,Remaining);
       throw(debug_telnet_invalid_subnegotiation))
    ;telnet_subnegotiation(In,Budget,Rest)).
telnet_reply(In,Command,Option) :-
    (telnet_channel(In,Out)->true;
     % Authenticated clients already alive during a code-only publication.
     current_input(Current),Current==In,current_output(Out)->true;
     throw(debug_telnet_reconnect_required)),
    stream_property(Out,encoding(Encoding)),
    setup_call_cleanup(set_stream(Out,encoding(octet)),
      (put_byte(Out,255),put_byte(Out,Command),put_byte(Out,Option),flush_output(Out)),
      set_stream(Out,encoding(Encoding))).

repl(In,Out,C) :-
    format(Out,'?- ',[]),flush_output(Out),
    call_with_time_limit(C.idle_timeout,line(In,C.max_line,Bytes)),
    phrase(utf8_codes(Codes),Bytes),string_codes(Text,Codes),
    (normalize_space(string(Trimmed),Text),Trimmed=="" -> repl(In,Out,C);
     catch((term_string(Goal,Text,[module(user),variable_names(Names),syntax_errors(error)]),
            Parsed=true),
           Error,(query_error(Out,Error),Parsed=false)),
     (Parsed==false -> repl(In,Out,C);
      Goal==end_of_file -> true;
      catch(call_with_time_limit(C.query_timeout,answers(Goal,Names,In,Out,C)),
            Error,query_exception(Error,Out)),
      repl(In,Out,C))).

answers(Goal,Names,In,Out,C) :-
    (call_cleanup(user:Goal,Det=true),
     print_bindings(Out,Names),
     (Det==true -> !;
      format(Out,'more (; / Enter): ',[]),flush_output(Out),
      more(In,C,Choice),
      (Choice==next -> fail;!))
    ;format(Out,'false.~n',[])).
more(In,C,Choice) :-
    call_with_time_limit(C.idle_timeout,line(In,128,Bytes)),
    string_codes(Text,Bytes),normalize_space(string(Value),Text),
    (Value==";" -> Choice=next;
     Value=="" -> Choice=done;
     Value=="end_of_file." -> throw(debug_client_eof);
     throw(error(domain_error(debug_alternative,Value),_))).
print_bindings(Out,Names) :-
    (Names==[] -> format(Out,'true.~n',[]);
     copy_term(Names,Copy,Residuals),numbervars(Copy-Residuals,0,_),
     print_names(Copy,Out),
     (Residuals==[]->true;
       format(Out,'Constraints: ',[]),
       write_term(Out,Residuals,[quoted(true),numbervars(true),max_depth(40),cycles(true)]),
       nl(Out))),
    flush_output(Out).
print_names([],_) .
print_names([Name=Value|Rest],Out) :-
    format(Out,'~w = ',[Name]),
    write_term(Out,Value,[quoted(true),numbervars(true),max_depth(40),cycles(true)]),
    format(Out,'.~n',[]),print_names(Rest,Out).
query_exception(debug_stop,_) :- !,throw(debug_stop).
query_exception(debug_client_eof,_) :- !,throw(debug_client_eof).
query_exception(time_limit_exceeded(debug_session),_) :- !,
    throw(time_limit_exceeded(debug_session)).
query_exception(Error,Out) :- query_error(Out,Error).
query_error(Out,Error) :-
    message_to_string(Error,Message),format(Out,'ERROR: ~s~n',[Message]),flush_output(Out).

debug_telnet_status(Status) :-
    with_mutex(powder_debug_lifecycle,
      (service(G,State,_,_,C,_) ->
        aggregate_all(count,client(G,_,_,_,_),Count),
        (State==running->Enabled=true;Enabled=false),
        Status=_{enabled:Enabled,state:State,host:"127.0.0.1",port:C.port,sessions:Count,
                 maxSessions:C.max_sessions}
      ;Status=_{enabled:false,state:stopped,sessions:0})).
debug_credentials_file(File) :- service(_,running,_,_,_,File).
debug_snapshot_safe :-
    ((service(_,_,_,_,_,_);client(_,_,_,_,_);auth_digest(_,_);attempts(_,_,_)) ->
       permission_error(save,debug_service,active);true).

create_credentials(Port,File,Hash) :-
    crypto_n_random_bytes(32,Bytes),
    crypto_data_hash(Bytes,Token,[algorithm(sha256),encoding(octet)]),
    crypto_data_hash(Token,Hash,[algorithm(sha256),encoding(utf8)]),
    current_prolog_flag(pid,PID),
    credential_process(create,[],
      _{version:1,host:"127.0.0.1",port:Port,pid:PID,token:Token},File).
remove_credentials(File) :-
    credential_process(remove,['-CredentialFile',File],none,_).
credential_process(Mode,Extra,Data,Output) :-
    source_file(kb_debug_telnet:debug_credentials_file(_),Source),
    file_directory_name(Source,Directory),
    directory_file_path(Directory,'debug_private_credentials.ps1',Script),
    getenv('SystemRoot',Windows),
    directory_file_path(Windows,'System32\\WindowsPowerShell\\v1.0\\powershell.exe',Exe),
    append(['-NoProfile','-NonInteractive','-ExecutionPolicy','Bypass',
            '-File',Script,'-Mode',Mode],Extra,Args),
    setup_call_cleanup(
      process_create(Exe,Args,[stdin(pipe(In)),stdout(pipe(Out)),stderr(null),process(PID)]),
      (set_stream(In,encoding(utf8)),set_stream(Out,encoding(utf8)),
       (Data==none->true;json_write_dict(In,Data,[width(0)]),nl(In)),
       close(In),process_wait(PID,Exit,[timeout(15)]),
       (Exit==timeout->throw(error(private_debug_credentials_timeout(Mode),_));true),
       read_line_to_string(Out,Line),
       (Exit==exit(0),Line\==end_of_file->atom_string(Output,Line);
        throw(error(private_debug_credentials_failed(Mode),_)))),
      (close_stream(In),close_stream(Out),
       catch((process_wait(PID,State,[timeout(0)]),
         (State==timeout->process_kill(PID,term),process_wait(PID,_);true)),_,true))).
close_stream(S) :- catch(close(S,[force(true)]),_,true).
close_socket(S) :- catch(tcp_close_socket(S),_,true).
