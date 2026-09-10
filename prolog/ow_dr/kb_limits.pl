:- module(kb_limits, [setting_default/2, setting_maximum/2, validate_result_limit/2, server_defaults/1]).
:- use_module(kb_paths).
:- use_module(library(http/json)).
:- use_module(library(error)).
:- dynamic definition/1.

load_definition :-
    app_dir(App),directory_file_path(App,'web/settings.json',File),
    setup_call_cleanup(open(File,read,Stream,[encoding(utf8)]),
                       json_read_dict(Stream,Definition),close(Stream)),
    forall(member(Key,[pageSize,queryLimit]),
      (get_dict(Key,Definition.defaults,Default),get_dict(Key,Definition.maximums,Maximum),
       must_be(positive_integer,Default),must_be(positive_integer,Maximum),Default=<Maximum)),
    retractall(definition(_)),assertz(definition(Definition)).
:- initialization(load_definition).

setting_default(Key,Value) :- definition(D),get_dict(Key,D.defaults,Value).
setting_maximum(Key,Value) :- definition(D),get_dict(Key,D.maximums,Value).
server_defaults(Settings) :- definition(D),Settings=D.serverDefaults.
validate_result_limit(Key,Value) :-
    must_be(integer,Value),setting_maximum(Key,Maximum),
    (between(1,Maximum,Value)->true;throw(error(domain_error(result_limit(Key,1,Maximum),Value),_))).
