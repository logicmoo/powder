:- begin_tests(ow_api).
:- use_module('../kb_catalog').
:- use_module('../kb_server').
:- use_module('../kb_paths').

test(traversal_rejected,[throws(error(permission_error(access,kb_source,_),_))]) :-
    authorize_sources(['KBs/../AGENTS.md'],_).
test(absolute_rejected,[throws(error(permission_error(access,kb_source,_),_))]) :-
    repo_root(Root),authorize_sources([Root],_).
test(backslash_rejected,[throws(error(permission_error(access,kb_source,_),_))]) :-
    authorize_sources(['KBs\\tinyKB.kif'],_).
test(page_limits) :-
    kb_server:page([a,b,c],1,1,_{items:[b],total:3,offset:1,limit:1}).
test(empty_page) :-
    kb_server:page([a],50,10,_{items:[],total:1,offset:50,limit:10}).
test(no_generated_assets) :-
    assertion(\+kb_server:web_name('../AGENTS.md')),
    assertion(\+kb_server:web_name('app.pl')),
    assertion(kb_server:web_name('app.js')).
:- end_tests(ow_api).
