:- begin_tests(source_formats).
:- use_module('../kb_compile').
:- use_module('../kb_cache').
:- use_module('../kb_reader').
:- use_module('../kb_catalog',[]).
:- use_module('../kb_store',[]).
:- use_module('../kb_runtime',[]).
:- use_module('../kb_config',[]).
:- use_module('../kb_qlf',[]).
:- use_module('../kb_paths').
:- use_module(library(filesex)).
:- use_module(library(process)).
:- use_module(library(readutil)).

fixture(Dir) :- tmp_file(powder_formats,Dir),make_directory(Dir).
cleanup(Dir) :-
    absolute_file_name(Dir,Absolute),
    findall(Path,(kb_store:source_info(Path,_),file_directory_name(Path,Absolute)),Paths),
    forall(member(Path,Paths),(kb_store:generation(G),kb_store:unload_source(Path,G,_))),
    delete_directory_and_contents(Dir).
source(Dir,Name,Text,File) :-
    directory_file_path(Dir,Name,File),
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),format(S,'~s',[Text]),close(S)).
options(Dir,[state_dir(State),progress(none),diagnostics(false)]) :-
    directory_file_path(Dir,state,State).

test(explicit_files_fall_back_to_kif_without_broadening_discovery,
     [setup(fixture(D)),cleanup(cleanup(D))]) :-
    source(D,'facts',"(p a)",Bare),source(D,'facts.txt',"(p b)",Text),
    source(D,'known.kif',"(p c)",Kif),source(D,'known.krf',"(p d)",Krf),
    source(D,'known.METTA',"(p e)",Metta),
    source(D,'known.MELD',"(p f)",Meld),
    source(D,'ignored.pl',"not a source",_),
    maplist(kb_compile:source_absolute,[Kif,Krf,Meld,Metta],Canonical),sort(Canonical,Expected),
    discover_sources([D],Expected),
    discover_sources([D,Bare,Text,Bare],Selected),
    length(Selected,6),
    forall(member(File,[Bare,Text]),(source_dialect(File,kif),\+kb_catalog:supported(File))),
    source_dialect(Krf,krf),source_dialect(Metta,metta),
    source_dialect(Meld,krf),source_dialect('typo.melf',kif),
    assertion(kb_catalog:supported(Metta)),
    assertion(kb_catalog:supported(Meld)),
    kb_config:canonical_source(Meld,_),
    empty_assoc(Seen),kb_compile:discover_queue([D],Seen,_,Portable,[]),
    sort(Portable,PortableSorted),sort([Kif,Krf,Meld,Metta],PortableSorted).

test(explicit_fallback_compiles_as_kif_with_stable_ids,
     [setup(fixture(D)),cleanup(cleanup(D))]) :-
    options(D,Options),
    forall(member(Name,[facts,'facts.txt']),
      (source(D,Name,"(=> (p ?X) (q ?X))\n(= a b)\n",F),
       file_digest(F,Original),compile_source(F,Options,Cold),
       read_cache(Cold.normalized,Header,
         [record(Id,x_implies(x_p(X),x_q(Y)),_),record(_,x_equals(x_a,x_b),_)]),
       assertion(X==Y),assertion(Header.dialect==kif),
       atom_concat(F,'.pl',PL),assertion(same_file(Cold.normalized,PL)),
       compile_source(F,Options,Warm),assertion(Warm.status==cache_hit),
       read_cache(Warm.normalized,_,[record(Id,_,_)|_]),file_digest(F,Original))).

test(compiler_cli_accepts_bare_and_unknown_extension_paths,
     [setup(fixture(D)),cleanup(cleanup(D))]) :-
    source(D,'facts',"(p a)",Bare),source(D,'facts.custom',"(q b)",Custom),
    source(D,'data.metta',"(= (f $x) $x)",Metta),
    source(D,'data.krf',"(instance a Class)",Krf),
    app_dir(App),directory_file_path(App,'compile_kb.pl',Script),
    directory_file_path(D,state,State),atom_concat('--state-dir=',State,StateOption),
    current_prolog_flag(executable,Executable),
    setup_call_cleanup(
      process_create(Executable,['-q','-s',Script,'--','--no-progress',StateOption,Bare,Custom,Metta,Krf],
        [process(Pid),stdout(null),stderr(pipe(Err))]),
      read_string(Err,_,Output),close(Err)),
    process_wait(Pid,Exit),
    assertion(Exit==exit(0)),
    assertion(sub_string(Output,_,_,_,'generated=4')),
    atom_concat(Metta,'.pl',MP),read_cache(MP,MH,[record(_,'x_metta='(x_f(X),Y),_)]),
    assertion(MH.dialect==metta),assertion(X==Y),
    atom_concat(Krf,'.pl',KP),read_cache(KP,KH,[record(_,x_instance(x_a,x_Class),_)]),
    assertion(KH.dialect==krf).

test(metta_browser_cache_preserves_types_equations_unicode_and_inert_forms,
     [setup(fixture(D)),cleanup(cleanup(D))]) :-
    source(D,'data.metta',
      "; data only\n(: f Type)\n(: s (-> Atom Atom))\n(: s (typesig))\n(= (f $x) $x)\n(instance a Class)\n(label \"\u03bb\")\n!(= (f danger) result)\n(<=== (derived a) (base a))\n([] a b)\n((a b) (c d))\n",F),
    options(D,Options),file_digest(F,Original),
    compile_source(F,Options,Compiled),assertion(Compiled.warnings==[]),
    kb_store:load_sources([F],any,Status),assertion(Status.counts.assertions=:=10),
    kb_store:active_modules([Module]),
    kb_runtime:module_assertion(Module,Id,'x_metta='(x_f(X),Y),Ref),
    assertion(X==Y),clause_property(Ref,file(_)),clause_property(Ref,line_count(_)),
    kb_runtime:module_metadata(Module,kb_names,Id,["$x"]),
    kb_runtime:module_assertion(Module,_,'x_:'(x_f,x_Type),_),
    kb_runtime:module_assertion(Module,_,'x_:'(x_s,'x_->'(x_Atom,x_Atom)),_),
    kb_runtime:module_assertion(Module,_,'x_:'(x_s,x_typesig),_),
    kb_runtime:module_assertion(Module,_,x_label("\u03bb"),_),
    kb_runtime:module_assertion(Module,_,metta_exec('x_metta='(x_f(x_danger),x_result)),_),
    kb_runtime:module_assertion(Module,_,metta_value([x_a,x_b]),_),
    kb_runtime:module_assertion(Module,_,metta_value(metta_map{x_a:x_b,x_c:x_d}),_),
    assertion(\+current_predicate(Module:x_derived/1)),
    assertion(\+current_predicate(Module:x_f/1)),
    assertion(kb_store:term_exists('x_metta=')),
    assertion(\+kb_store:term_exists(x_equals)),
    kb_store:assertion(Id,Data),assertion(Data.expression.head.value=='x_metta='),
    kb_store:load_sources([F],Status.generation,Reloaded),
    assertion(Reloaded.counts.assertions=:=10),file_digest(F,Original),
    kb_store:unload_source(F,Reloaded.generation,Empty),assertion(Empty.files==[]).

test(runtime_explicit_kif_fallback_keeps_krf_and_metta_distinct,
     [setup(fixture(D)),cleanup(cleanup(D))]) :-
    source(D,'facts.txt',"(= a b)",Kif),
    source(D,'facts.krf',"(= a b)\n(instance a Class)",Krf),
    source(D,'facts.metta',"(= a b)\n(instance a Class)",Metta),
    options(D,Options),compile_sources([Kif,Krf,Metta],Options,Compiled),
    assertion(Compiled.failures=:=0),
    kb_store:load_sources([Kif,Krf,Metta],any,Status),
    assertion(Status.counts.assertions=:=5),
    assertion(kb_store:term_exists(x_equals)),assertion(kb_store:term_exists('x_metta=')),
    assertion(kb_store:term_exists(x_instance)),assertion(\+kb_store:term_exists(x_isa)).

test(recovery_for_fallback_files_requires_explicit_selection,
     [setup(fixture(D)),cleanup(cleanup(D))]) :-
    source(D,'facts.custom',"(p a)",F),options(D,Options),compile_source(F,Options,Compiled),
    atom_concat(F,'.pl.tmp',Marker),
    setup_call_cleanup(open(Marker,write,S),write_one_line(S,kb_compile_claim(1,F,0,0)),close(S)),
    recover_sources([D],Options,None),assertion(None.results==[]),assertion(exists_file(Marker)),
    recover_sources([F],Options,Recovered),assertion(Recovered.failures=:=0),
    assertion(Recovered.cacheHits=:=1),assertion(\+exists_file(Marker)),
    assertion(exists_file(Compiled.normalized)).

test(meld_uses_krf_reader_conditionals_equality_and_no_mappings,
     [setup(fixture(D)),cleanup(cleanup(D))]) :-
    source(D,'SUMO.meld',
      ";; logos: sumo-mappings\n#-:rc4 (instance a Class)\n#+:rc4 (instance skipped Entity)\n(=> (p ?X) (q ?X))\n(= a b)\n",F),
    options(D,Options),
    compile_source(F,[sumo_mappings(true),strict_mappings(true)|Options],Compiled),
    read_cache(Compiled.normalized,Header,
      [record(_,x_instance(x_a,x_Class),_),
       record(_,'x_=>'(x_p(X),x_q(Y)),_),
       record(_,x_equals(x_a,x_b),_)]),
    assertion(X==Y),assertion(Header.dialect==krf),assertion(Header.mappingHash==none),
    assertion(Compiled.warnings==[]),
    atom_concat(F,'.pl',PL),assertion(same_file(Compiled.normalized,PL)),
    kb_qlf:discover_companions([D],[Found]),assertion(same_file(Found,PL)),
    kb_qlf:companion_path(PL,_),
    read_source(F,[features([rc4]),sumo_mappings(true)],
      [assertion(x_instance(x_skipped,x_Entity),[],_,_,_,_)|_],Info),
    assertion(Info.dialect==krf),assertion(Info.mappingHash==none).

:- end_tests(source_formats).
