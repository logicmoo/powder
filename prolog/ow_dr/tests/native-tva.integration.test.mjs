import test from 'node:test';
import assert from 'node:assert/strict';
import { spawn } from 'node:child_process';
import { readdir, rm } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { annotationSummary, assertionPriorSummary, createTVAClient, cycPropertyUnion, selectTVARows,
  createAssertionAnnotationController, createNativePairController } from '../web/native-tva.js';

const here = dirname(fileURLToPath(import.meta.url));
const application = dirname(here);

test('frontend consumes actual native backend DTOs from an isolated SWI process', { timeout: 30000 }, async () => {
  const prefix = `native-tva-fixture-${process.pid}-${process.hrtime.bigint()}`;
  const file = join(here, `${prefix}.pl`);
  const goal = `
    use_module(kb_native_annotations),use_module(kb_store,[]),use_module(library(http/json)),
    kb_native_annotations:native_status(S0),get_dict(revision,S0,R0),
    kb_native_annotations:native_update([
      put(nars,default,null,nars_truth_value(0.5,0.0)),
      put(opencog,default,null,stv(0.9,0.9)),
      put(nars,x_Target,null,[false]),
      put(opencog,x_MtFn(x_FullContext),null,stv(0.1,0.0)),
      put(cyc,default,utility,0.5),
      put(cyc,x_Target,utility,0),
      put(cyc,x_MtFn(x_FullContext),enabled,false),
      put(cyc,default,vendor,vendor_record(false,[],9007199254740993,1r3,"<script>literal</script>"))
    ],R0,_),
    kb_native_annotations:native_batch([x_Target,x_Other],x_MtFn(x_FullContext),_{family:cyc,property:absent},Batch),
    get_dict(items,Batch,Items),member(Row,Items),get_dict(entity,Row,x_Target),get_dict(families,Row,Families),
    get_dict(nars,Families,NarsFamily),get_dict(effective,NarsFamily,NarsEffective),get_dict(recordRevision,NarsEffective,NR),
    kb_native_annotations:native_detail(x_Target,x_MtFn(x_FullContext),nars,null,NR,Nars),
    get_dict(cyc,Families,CycFamily),get_dict(properties,CycFamily,Props),member(Prop,Props),get_dict(property,Prop,"vendor"),
    get_dict(effective,Prop,VE),get_dict(recordRevision,VE,VR),
    kb_native_annotations:native_detail(x_Target,x_MtFn(x_FullContext),cyc,vendor,VR,Vendor),
    kb_native_annotations:native_settings(null,Before),get_dict(revision,Before,BR),
    kb_native_annotations:save_native_settings(null,_{monotonic_strength:0,default_strength:0.9,utility:0},BR,Global),
    get_dict(revision,Global,GR),
    kb_native_annotations:save_native_settings(x_MtFn(x_FullContext),_{utility:0,direction:":BACKWARD"},GR,Mt),
    get_dict(revision,Mt,MR),
    kb_native_annotations:save_native_settings(x_MtFn(x_FullContext),_{utility:null,direction:null},MR,Cleared),
    get_dict(revision,Cleared,CR),
    kb_native_annotations:save_native_settings(null,_{asserted_positive_truth:1,asserted_monotonic_confidence:0.97,asserted_default_confidence:0.66},CR,PriorGlobal),
    get_dict(revision,PriorGlobal,PGR),
    kb_native_annotations:save_native_settings(x_MtFn(x_FullContext),_{asserted_monotonic_confidence:0.34},PGR,PriorMt),
    kb_terms:term_ast(x_p(x_A),[],PositiveAST),kb_terms:term_ast(x_not(x_p(x_A)),[],NegativeAST),
    assertz(kb_store:assertion(a123,_{properties:[_{name:monotonicity,value:':MONOTONIC'}],expression:PositiveAST,source:'KBs/isolated.krf',line:4})),
    assertz(kb_store:assertion(a124,_{properties:[_{name:monotonicity,value:':MONOTONIC'},_{name:'cyc::original-tv',value:':FALSE-DEF'},_{name:truth,value:false}],expression:NegativeAST,source:'KBs/isolated.krf',line:5})),
    assertz(kb_store:assertion(a125,_{properties:[_{name:monotonicity,value:':DEFAULT'}],expression:PositiveAST,source:'KBs/isolated.krf',line:6})),
    kb_native_annotations:assertion_interpretation(a123,x_MtFn(x_FullContext),PositivePrior),
    kb_native_annotations:assertion_interpretation(a124,x_MtFn(x_FullContext),NegativePrior),
    kb_native_annotations:assertion_interpretation(a125,x_MtFn(x_FullContext),DefaultPrior),
    kb_native_annotations:native_summary(x_Target,x_MtFn(x_FullContext),NativeAfter),
    kb_native_annotations:native_summary(a124,null,NegativeNative),
    kb_native_annotations:native_pair_settings(null,PairBefore),
    get_dict(revision,PairBefore,PairRevision),
    kb_native_annotations:save_native_pair(null,nars,_{frequency:0,confidence:0},PairRevision,false,PairAfter),
    kb_native_annotations:assertion_annotation_settings(a123,x_MtFn(x_FullContext),EditorBefore),
    get_dict(revision,EditorBefore,ER),get_dict(identity,EditorBefore,EI),get_dict(generation,EditorBefore,EG),
    kb_native_annotations:save_assertion_annotations(a123,x_MtFn(x_FullContext),_{monotonicity:":DEFAULT",direction:":FORWARD"},
      _{revision:ER,identity:EI,generation:EG},EditorAfter),
    json_write_dict(current_output,_{batch:Batch,nars:Nars,vendor:Vendor,before:Before,global:Global,mt:Mt,cleared:Cleared,
      priorGlobal:PriorGlobal,priorMt:PriorMt,positive:PositivePrior,negative:NegativePrior,defaultPrior:DefaultPrior,nativeAfter:NativeAfter,negativeNative:NegativeNative,
      pairBefore:PairBefore,pairAfter:PairAfter,editorBefore:EditorBefore,editorAfter:EditorAfter})
  `;
  try {
    const result = await new Promise((resolve, reject) => {
      const child = spawn(process.env.SWIPL || 'swipl', ['-q', '-g', goal, '-t', 'halt'], {
        cwd: application, env: { ...process.env, POWDER_NATIVE_TVA_FILE: file }, windowsHide: true,
        stdio: ['ignore', 'pipe', 'pipe'],
      });
      const stdout = [], stderr = [];
      child.stdout.on('data', data => stdout.push(data));
      child.stderr.on('data', data => stderr.push(data));
      const timer = setTimeout(() => { child.kill(); reject(new Error('Isolated native annotation fixture timed out')); }, 25000);
      child.once('error', error => { clearTimeout(timer); reject(error); });
      child.once('close', code => {
        clearTimeout(timer);
        if (code !== 0) reject(new Error(`SWI fixture exited ${code}: ${Buffer.concat(stderr).toString('utf8')}`));
        else resolve(JSON.parse(Buffer.concat(stdout).toString('utf8')));
      });
    });
    const { batch, nars, vendor, before, global, mt, cleared } = result;
    const row = batch.items.find(item => item.entity === 'x_Target');
    assert.equal(row.context, batch.context);
    assert.equal(row.contextExpression.type, 'application');
    assert.equal(row.contextExpression.head.value, 'x_MtFn');
    assert.equal(row.families.nars.effective.origin, 'atom');
    assert.equal(annotationSummary('nars', row.families.nars.effective).text, 'List · 1 items');
    assert.equal(annotationSummary('nars', row.families.nars.effective).noEvidence, undefined);
    assert.equal(row.families.opencog.effective.origin, 'mt');
    assert.equal(row.families.opencog.effective.supplierExpression.head.value, 'x_MtFn');
    assert.equal(annotationSummary('opencog', row.families.opencog.effective).text, 'Strength 0.1 · confidence 0 · no evidence');
    assert.deepEqual(cycPropertyUnion(batch.items), ['absent', 'enabled', 'utility', 'vendor']);
    assert.equal(row.families.cyc.properties.find(item => item.property === 'absent').effective.status, 'uninitialized');
    assert.equal(row.families.cyc.properties.find(item => item.property === 'utility').effective.summary.value, 0);
    assert.equal(row.families.cyc.properties.find(item => item.property === 'enabled').effective.summary.value, false);
    assert.deepEqual(nars.records[0].data, { type: 'list', items: [{ type: 'atom', value: 'false' }] });
    assert.equal(nars.records[0].text, '[false].\n');
    assert.equal(vendor.records[0].data.args[2].type, 'integer');
    assert.equal(vendor.records[0].data.args[2].text, '9007199254740993');
    assert.equal(vendor.records[0].data.args[3].type, 'rational');
    assert.equal(vendor.records[0].data.args[4].value, '<script>literal</script>');
    assert.equal(before.effective.direction.status, 'uninitialized');
    assert.equal(before.effective.monotonic_strength.status, 'uninitialized');
    assert.equal(before.effective.asserted_positive_truth.status, 'uninitialized');
    assert.equal(before.effective.asserted_monotonic_confidence.status, 'uninitialized');
    assert.equal(before.effective.asserted_default_confidence.status, 'uninitialized');
    assert.equal(global.effective.monotonic_strength.summary.value, 0);
    assert.equal(global.effective.default_strength.summary.value, .9);
    assert.equal(mt.effective.utility.origin, 'mt');
    assert.equal(mt.effective.direction.summary.value, ':BACKWARD');
    assert.equal(cleared.overrides.utility, false);
    assert.equal(cleared.effective.utility.summary.value, 0);
    assert.equal(cleared.effective.utility.origin, 'default');
    assert.equal(cleared.effective.direction.status, 'uninitialized');
    assert.equal(result.priorGlobal.effective.monotonic_strength.summary.value, 0);
    assert.equal(result.priorGlobal.effective.default_strength.summary.value, .9);
    assert.equal(result.priorGlobal.effective.asserted_positive_truth.summary.value, 1);
    assert.equal(result.priorGlobal.effective.asserted_monotonic_confidence.summary.value, .97);
    assert.equal(result.priorGlobal.effective.asserted_default_confidence.summary.value, .66);
    assert.equal(assertionPriorSummary(result.positive).status, 'initialized');
    assert.equal(result.positive.assertionPrior.truth.origin, 'default');
    assert.equal(result.positive.assertionPrior.truth.summary.value, 1);
    assert.equal(result.positive.assertionPrior.confidence.origin, 'mt');
    assert.equal(result.positive.assertionPrior.confidence.summary.value, .34);
    assert.deepEqual(result.positive.assertionPrior.sourceMonotonicity, [':MONOTONIC']);
    assert.equal(result.positive.assertionPrior.affectsNativeTVA, false);
    assert.equal(result.positive.assertionPrior.observed, false);
    assert.equal(result.defaultPrior.assertionPrior.confidence.summary.value, .66);
    assert.equal(assertionPriorSummary(result.negative).status, 'initialized');
    assert.equal(result.negative.assertionPrior.polarity, 'negative');
    assert.equal(result.negative.assertionPrior.scope, 'asserted_formula');
    assert.equal(result.negative.assertionPrior.truth.summary.value, 1);
    assert.equal(result.negative.assertionPrior.confidence.summary.value, .34);
    assert.equal(result.negative.assertionPrior.families.nars.notation, '%1;0.34%');
    assert.equal(result.negative.assertionPrior.families.opencog.notation, '(stv 1 0.34)');
    assert.equal(result.negative.assertionPrior.families.nars.stored, false);
    assert.equal(result.negative.assertionPrior.families.opencog.summary.strength, 1);
    assert.equal(result.defaultPrior.assertionPrior.families.nars.summary.confidence, .66);
    assert.equal(result.negativeNative.families.opencog.effective.summary.strength, .9);
    assert.equal(result.negativeNative.families.opencog.effective.summary.confidence, .9);
    assert.equal(result.negativeNative.families.opencog.effective.origin, 'default');
    assert.equal(result.negativeNative.families.nars.effective.summary.confidence, 0);
    assert.deepEqual(result.negative.monotonicity, [':MONOTONIC']);
    assert.equal(annotationSummary('nars', result.nativeAfter.families.nars.effective).text, 'List · 1 items');
    assert.equal(result.nativeAfter.families.opencog.effective.summary.confidence, 0);
    assert.deepEqual(selectTVARows(batch.items, { family: 'cyc', property: 'utility', field: 'value' }).map(item => item.entity),
      ['x_Target', 'x_Other']);
    const client = createTVAClient({ fetchSummaries: async () => batch, fetchDetail: async () => nars });
    const summary = await client.summary('x_Target', batch.context);
    const lazy = await client.detail({ entity: summary.entity, context: summary.context, family: 'nars', property: null,
      recordRevision: summary.families.nars.effective.recordRevision });
    assert.equal(lazy.records[0].text, '[false].\n');
    client.dispose();
    const editorCalls = [];
    const editor = createAssertionAnnotationController({ entity: 'a123', initialContext: result.editorBefore.context,
      readAssertion: async () => result.editorBefore,
      saveAssertion: async body => { editorCalls.push(body); return result.editorAfter; },
    });
    await editor.load(); editor.edit('monotonicity', ':DEFAULT'); editor.edit('direction', ':FORWARD');
    assert.equal(await editor.save(), true);
    assert.equal(editorCalls[0].identity, result.editorBefore.identity);
    assert.equal(editorCalls[0].generation, result.editorBefore.generation);
    assert.deepEqual(editor.get().snapshot.recorded.monotonicity, [':MONOTONIC']);
    assert.equal(editor.get().snapshot.effective.monotonicity.summary.value, ':DEFAULT');
    assert.equal(editor.get().snapshot.effective.monotonicity.origin, 'atom');
    assert.equal(editor.get().snapshot.interpretation.assertionPrior.confidence.summary.value, .66);
    assert.equal(editor.get().snapshot.layers.mt.direction.status, 'uninitialized');
    editor.dispose();
    const pairCalls = [];
    const pairEditor = createNativePairController({ family: 'nars',
      readPairs: async () => result.pairBefore,
      savePair: async body => { pairCalls.push(body); return result.pairAfter; },
    });
    await pairEditor.load(); pairEditor.edit('frequency', '0'); pairEditor.edit('confidence', '0');
    assert.equal(await pairEditor.save(), true); assert.deepEqual(pairCalls[0].pair, { frequency: 0, confidence: 0 });
    assert.equal(pairEditor.get().snapshot.families.nars.effective.origin, 'default');
    assert.equal(pairEditor.get().snapshot.families.opencog.exact.status, 'initialized');
    assert.equal(pairEditor.get().snapshot.families.opencog.exact.summary.strength, .9);
    assert.equal(pairEditor.get().snapshot.families.opencog.exact.summary.confidence, .9);
    pairEditor.dispose();
  } finally {
    for (const name of await readdir(here)) if (name.startsWith(prefix)) await rm(join(here, name), { force: true });
  }
});
