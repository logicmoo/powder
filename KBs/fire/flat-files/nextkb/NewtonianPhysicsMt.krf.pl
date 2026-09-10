:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:12,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:51,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'115136a0d06acc14c300d6bcc30e4315f862a95fc9b29d1beb9530eb1de06391',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NewtonianPhysicsMt.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:6345,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NewtonianPhysicsMt.krf',sourceHash:b0b3cd181abac69f92e584ce4f5a41b6233ea116624b5a8a79d58461af2b507d,warnings:[]}).
x_isa(x_WorkEnergyTheorem,x_LawOfNature) :- x_cid(a65b1275c9aa38).
xc_microtheory(a65b1275c9aa38,x_NewtonianPhysicsMt).
xc_source_file(a65b1275c9aa38,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NewtonianPhysicsMt.krf').
xc_source_line(a65b1275c9aa38,3).
xc_kb_names(a65b1275c9aa38,[]).
xc_mapping_rows(a65b1275c9aa38,[]).
x_isa(x_WorkEnergyTheorem,'x_Theorem-Proposition') :- x_cid(a65b1275c9aa39).
xc_microtheory(a65b1275c9aa39,x_NewtonianPhysicsMt).
xc_source_file(a65b1275c9aa39,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NewtonianPhysicsMt.krf').
xc_source_line(a65b1275c9aa39,4).
xc_kb_names(a65b1275c9aa39,[]).
xc_mapping_rows(a65b1275c9aa39,[]).
x_comment(x_WorkQuantity,"A #$DerivedMeasurableQuantityType and specialization of #$EnergyQuantity.  Each instance of #$WorkQuantity is a quantity of energy that represents the work done on an object by a #$ForceVector in an event.  (See #$workDoneOnObjectByForceIn.)  The relevant notion of \"work\" is that of classical mechanics, namely: <i>the magnitude of the displacement times the component of the force parallel to the displacement.</i>  A notable specialization is #$NetWorkQuantity.") :- x_cid(a65b1275c9aa3a).
xc_microtheory(a65b1275c9aa3a,x_NewtonianPhysicsMt).
xc_source_file(a65b1275c9aa3a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NewtonianPhysicsMt.krf').
xc_source_line(a65b1275c9aa3a,5).
xc_kb_names(a65b1275c9aa3a,[]).
xc_mapping_rows(a65b1275c9aa3a,[]).
x_comment(x_NetWorkQuantity,"A specialization of #$WorkQuantity.  Each instance of #$NetWorkQuantity is a quantity of energy that represents the net work done on an object in an event, i.e., the sum of the quantities of work done by each force acting on the object in the event.  According to the #$WorkEnergyTheorem, this is equal to the change in the kinetic energy of the object in the event.") :- x_cid(a65b1275c9aa3b).
xc_microtheory(a65b1275c9aa3b,x_NewtonianPhysicsMt).
xc_source_file(a65b1275c9aa3b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NewtonianPhysicsMt.krf').
xc_source_line(a65b1275c9aa3b,6).
xc_kb_names(a65b1275c9aa3b,[]).
xc_mapping_rows(a65b1275c9aa3b,[]).
x_comment(x_QPQuantityFn(x_NetWorkQuantity),"An unreifiable #$BinaryFunction that takes a #$PartiallyTangible and a #$TemporalThing and returns a #$NetWorkQuantity.  <code>((#$QPQuantityFn #$NetWorkQuantity) OBJ TEMP-THING)</code> denotes the net quantity of work done on <code>OBJ</code> in <code>TEMP-THING</code>, i.e., the sum of the quantities of work done by each force acting on <code>OBJ</code> in <code>TEMP-THING</code>.\n<p>\nIn classical mechanics, work is by definition the magnitude of force times the magnitude of displacement times the cosine of the angle between the force and the displacement.  In the special case where the force and the displacement are in the same direction, work is simply magnitude of force times magnitude of displacement.") :- x_cid(a65b1275c9aa3c).
xc_microtheory(a65b1275c9aa3c,x_NewtonianPhysicsMt).
xc_source_file(a65b1275c9aa3c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NewtonianPhysicsMt.krf').
xc_source_line(a65b1275c9aa3c,7).
xc_kb_names(a65b1275c9aa3c,[]).
xc_mapping_rows(a65b1275c9aa3c,[]).
x_comment(x_QPQuantityFn(x_WorkQuantity),"An unreifiable #$TernaryFunction that takes a #$PartiallyTangible, a #$ForceVector, and a #$TemporalThing, and returns a #$WorkQuantity.  <code>((#$QPQuantityFn #$WorkQuantity) OBJ FORCE TEMP-THING)</code> denotes the quantity of work done on <code>OBJECT</code> by <code>FORCE</code> in <code>TEMP-THING</code>.\n<p>\nIn classical mechanics, work is by definition the magnitude of force times the magnitude of displacement times the cosine of the angle between the force and the displacement.  In the special case where the force and the displacement are in the same direction, work is simply magnitude of force times magnitude of displacement.") :- x_cid(a65b1275c9aa3d).
xc_microtheory(a65b1275c9aa3d,x_NewtonianPhysicsMt).
xc_source_file(a65b1275c9aa3d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NewtonianPhysicsMt.krf').
xc_source_line(a65b1275c9aa3d,10).
xc_kb_names(a65b1275c9aa3d,[]).
xc_mapping_rows(a65b1275c9aa3d,[]).
x_comment(x_WorkEnergyTheorem,"An instance of #$LawOfNature (q.v.).  The work-energy theorem (or principle) states that the net work done on an object (in an event) is equal to the change in kinetic energy of that object (in that event). \n<p>\nOne formulation of the #$WorkEnergyTheorem in #$CycL is:\n<pre>\n(#$mathEquals\n  ((#$QPQuantityFn #$NetWorkQuantity) ?OBJ ?TEMP-THING)\n  (#$DifferenceFn\n    (#$MeasurementAtFn\n      ((#$QPQuantityFn #$KineticEnergyQuantity) ?OBJ)\n      (#$EndFn ?TEMP-THING))\n    (#$MeasurementAtFn\n      ((#$QPQuantityFn #$KineticEnergyQuantity) ?OBJ)\n      (#$StartFn ?TEMP-THING))))\n.</pre>") :- x_cid(a65b1275c9aa3e).
xc_microtheory(a65b1275c9aa3e,x_NewtonianPhysicsMt).
xc_source_file(a65b1275c9aa3e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NewtonianPhysicsMt.krf').
xc_source_line(a65b1275c9aa3e,13).
xc_kb_names(a65b1275c9aa3e,[]).
xc_mapping_rows(a65b1275c9aa3e,[]).
x_comment(x_KineticEnergyQuantity,"A specialization of #$EnergyQuantity.  Each instance of #$KineticEnergyQuantity is a quantity of translational (as opposed to rotational) kinetic energy had by some object  This collection is simply a rewrite of:\n<pre>\n(#$SubcollectionOfWithRelationFromTypeFn #$EnergyQuantity #$kineticEnergyOfObject #$PartiallyTangible).\n</pre>\nIn classical mechanics, the kinetic energy of an object is defined as (1/2)mv^2, i.e., 0.5 times the mass of the object times the square of the speed (i.e. magnitude of velocity) of the object.  One way of expressing this in #$CycL is:\n<pre>\n(#$mathEquals\n  (#$MeasurementAtFn\n    ((#$QPQuantityFn #$KineticEnergyQuantity) ?OBJ) ?TEMP-THING)\n  (#$TimesFn\n    0.5\n    (#$MeasurementAtFn\n      ((#$QPQuantityFn #$Mass) ?OBJ) ?TEMP-THING)\n    (#$SquaredFn\n      (#$MeasurementAtFn\n        ((#$QPQuantityFn #$Speed) ?OBJ) ?TEMP-THING)))).\n</pre>") :- x_cid(a65b1275c9aa3f).
xc_microtheory(a65b1275c9aa3f,x_NewtonianPhysicsMt).
xc_source_file(a65b1275c9aa3f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NewtonianPhysicsMt.krf').
xc_source_line(a65b1275c9aa3f,27).
xc_kb_names(a65b1275c9aa3f,[]).
xc_mapping_rows(a65b1275c9aa3f,[]).
x_comment(x_workDoneOnObjectByForceIn,"A #$QuaternaryPredicate that relates a #$PartiallyTangible to a #$ForceVector to a #$TemporalThing to an #$EnergyQuantity.  <code>(#$workDoneOnObjectByForceIn OBJ FORCE TEMP-THING QUANT)</code> means that the quantity of work done on <code>OBJ</code> by <code>FORCE</code> during <code>TEMP-THING</code> is <code>QUANT</code>.  The relevant notion of \"work\" is that of classical mechanics, namely: <i>the magnitude of the displacement times the component of the force parallel to the displacement.</i>  This is the predicate corresponding to (#$QPQuantityFn #$WorkQuantity).  See also #$netWorkDoneOnObjectIn.") :- x_cid(a65b1275c9aa40).
xc_microtheory(a65b1275c9aa40,x_NewtonianPhysicsMt).
xc_source_file(a65b1275c9aa40,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NewtonianPhysicsMt.krf').
xc_source_line(a65b1275c9aa40,44).
xc_kb_names(a65b1275c9aa40,[]).
xc_mapping_rows(a65b1275c9aa40,[]).
x_comment(x_netWorkDoneOnObjectIn,"A #$TernaryPredicate that relates a #$PartiallyTangible to a #$TemporalThing to an #$EnergyQuantity.  <code>(#$netWorkDoneOnObjectIn OBJ TEMP-THING QUANT)</code> means that the net work done on <code>OBJ</code> in <code>TEMP-THING</code> is <code>QUANT</code>; that is, <code>QUANT</code> equals the kinetic energy of <code>OBJ</code> at the end of <code>TEMP-THING</code> minus the kinetic energy of <code>OBJ</code> at the beginning of <code>TEMP-THING</code>.  This is the predicate corresponding to (#$QPQuantityFn #$NetWorkQuantity).  See also #$workDoneOnObjectByForceIn.") :- x_cid(a65b1275c9aa41).
xc_microtheory(a65b1275c9aa41,x_NewtonianPhysicsMt).
xc_source_file(a65b1275c9aa41,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NewtonianPhysicsMt.krf').
xc_source_line(a65b1275c9aa41,45).
xc_kb_names(a65b1275c9aa41,[]).
xc_mapping_rows(a65b1275c9aa41,[]).
x_comment(x_QPQuantityFn(x_KineticEnergyQuantity),"An unreifiable #$UnaryFunction that takes a #$PartiallyTangible and returns a #$KineticEnergyQuantity.  <code>((#$QPQuantityFn #$KineticEnergyQuantity) OBJ)</code> denotes the quantity of kinetic energy had by <code>OBJ</code>.  In classical mechanics, the kinetic energy of an object is defined as (1/2)mv^2, i.e. one half its mass times the square of its velocity.") :- x_cid(a65b1275c9aa42).
xc_microtheory(a65b1275c9aa42,x_NewtonianPhysicsMt).
xc_source_file(a65b1275c9aa42,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NewtonianPhysicsMt.krf').
xc_source_line(a65b1275c9aa42,46).
xc_kb_names(a65b1275c9aa42,[]).
xc_mapping_rows(a65b1275c9aa42,[]).
x_comment(x_kineticEnergyOfObject,"A #$FunctionalSlot and specialization of #$hasPhysicalQuantity that relates a #$PartiallyTangible to an #$EnergyQuantity.  <code>(#$kineticEnergyOfObject OBJ QUANT)</code> means that the quantity of (translational) kinetic energy had by <code>OBJ</code> is <code>QUANT</code>.  In general, assertions made with this predicate should be temporally qualified.\n<p>\nIn classical mechanics, the kinetic energy of an object is defined as (1/2)<i>mv</i><sup>2</sup>, where <i>m</i> is the object's mass and <i>v</i> is its velocity.\n<p>\nThis is the predicate corresponding to (#$QPQuantityFn #$KineticEnergyQuantity).") :- x_cid(a65b1275c9aa43).
xc_microtheory(a65b1275c9aa43,x_NewtonianPhysicsMt).
xc_source_file(a65b1275c9aa43,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NewtonianPhysicsMt.krf').
xc_source_line(a65b1275c9aa43,47).
xc_kb_names(a65b1275c9aa43,[]).
xc_mapping_rows(a65b1275c9aa43,[]).
kb_cache_footer(footer{count:12,digest:'115136a0d06acc14c300d6bcc30e4315f862a95fc9b29d1beb9530eb1de06391',headerDigest:'7e2849bfd79f8d09679ee0dbde256eaaf9e50f22bc1583e11fa7835307f57bca'}).
