#! /bin/sh

BASE=../BASE/

REASONING=../Sophisticated-Reasoning/


FILES="$REASONING/Integration/SR-RE-01-truthworthiness/ontology_LKAS_2.lp $REASONING/Integration/SR-RE-01-truthworthiness/obs_init_state_LKAS.lp $REASONING/Integration/SR-RE-01-truthworthiness/reasoning_2_1.lp output_sr_re_01_01.lp"
OUTPUT=FULL-step1.txt
cat $FILES > $OUTPUT

FILES="$REASONING/Integration/SR-RE-01-truthworthiness/ontology_LKAS_2.lp $REASONING/Integration/SR-RE-01-truthworthiness/obs_init_state_LKAS.lp $REASONING/Integration/SR-RE-01-truthworthiness/reasoning_2_2.lp output_sr_re_01_02.lp"
OUTPUT=FULL-step2.txt
cat $FILES > $OUTPUT

FILES="$BASE/step1-BASE.lp $BASE/theory.lp $BASE/theory-maxint.lp output.lp $BASE/step1.lp $BASE/step2.lp"
OUTPUT=FULL-step3.txt
cat $FILES > $OUTPUT

FILES="$REASONING/Integration/SR-RE-01-truthworthiness/ontology_LKAS_2.lp $REASONING/Integration/SR-RE-01-truthworthiness/obs_init_state_LKAS.lp $REASONING/Integration/SR-RE-01-truthworthiness/reasoning_2_3.lp output_sr_re_01_03.lp"
OUTPUT=FULL-step4.txt
cat $FILES > $OUTPUT

FILES="$REASONING/Integration/SR-RE-01-truthworthiness/ontology_LKAS_2.lp $REASONING/Integration/SR-RE-01-truthworthiness/obs_init_state_LKAS.lp $REASONING/Integration/SR-RE-01-truthworthiness/reasoning_2_4.lp output_sr_re_01_04.lp"
OUTPUT=FULL-step4-ext.txt
cat $FILES > $OUTPUT

FILES="$REASONING/Integration/SR-RE-02-satisfaction/ontology_LKAS.lp $REASONING/Integration/SR-RE-02-satisfaction/obs_init_state_LKAS_0.lp $REASONING/Integration/SR-RE-02-satisfaction/reasoning_3_1.lp output_sr_re_02_01.lp"
OUTPUT=FULL-SR-ER-02-01-00.txt
cat $FILES > $OUTPUT

FILES="$REASONING/Integration/SR-RE-02-satisfaction/ontology_LKAS.lp $REASONING/Integration/SR-RE-02-satisfaction/obs_init_state_LKAS_1.lp $REASONING/Integration/SR-RE-02-satisfaction/reasoning_3_1.lp output_sr_re_02_01.lp"
OUTPUT=FULL-SR-ER-02-01-01.txt
cat $FILES > $OUTPUT

FILES="$REASONING/Integration/SR-RE-02-satisfaction/ontology_LKAS.lp $REASONING/Integration/SR-RE-02-satisfaction/obs_init_state_LKAS_2.lp $REASONING/Integration/SR-RE-02-satisfaction/reasoning_3_1.lp output_sr_re_02_01.lp"
OUTPUT=FULL-SR-ER-02-01-02.txt
cat $FILES > $OUTPUT

FILES="$REASONING/Integration/SR-RE-02-satisfaction/ontology_LKAS.lp $REASONING/Integration/SR-RE-02-satisfaction/obs_init_state_LKAS_3.lp $REASONING/Integration/SR-RE-02-satisfaction/reasoning_3_1.lp output_sr_re_02_01.lp"
OUTPUT=FULL-SR-ER-02-01-03.txt
cat $FILES > $OUTPUT

FILES="$REASONING/Integration/SR-RE-02-satisfaction/ontology_LKAS.lp $REASONING/Integration/SR-RE-02-satisfaction/obs_init_state_LKAS_4.lp $REASONING/Integration/SR-RE-02-satisfaction/reasoning_3_1.lp output_sr_re_02_01.lp"
OUTPUT=FULL-SR-ER-02-01-04.txt
cat $FILES > $OUTPUT

FILES="$REASONING/Integration/SR-RE-02-satisfaction/ontology_LKAS.lp $REASONING/Integration/SR-RE-02-satisfaction/obs_init_state_LKAS_0.lp $REASONING/Integration/SR-RE-02-satisfaction/reasoning_3_2.lp output_sr_re_02_02.lp"
OUTPUT=FULL-SR-ER-02-02-00.txt
cat $FILES > $OUTPUT

FILES="$REASONING/Integration/SR-RE-02-satisfaction/ontology_LKAS.lp $REASONING/Integration/SR-RE-02-satisfaction/obs_init_state_LKAS_1.lp $REASONING/Integration/SR-RE-02-satisfaction/reasoning_3_2.lp output_sr_re_02_02.lp"
OUTPUT=FULL-SR-ER-02-02-01.txt
cat $FILES > $OUTPUT

FILES="$REASONING/Integration/SR-RE-02-satisfaction/ontology_LKAS.lp $REASONING/Integration/SR-RE-02-satisfaction/obs_init_state_LKAS_2.lp $REASONING/Integration/SR-RE-02-satisfaction/reasoning_3_2.lp output_sr_re_02_02.lp"
OUTPUT=FULL-SR-ER-02-02-02.txt
cat $FILES > $OUTPUT

FILES="$REASONING/Integration/SR-RE-02-satisfaction/ontology_LKAS.lp $REASONING/Integration/SR-RE-02-satisfaction/obs_init_state_LKAS_3.lp $REASONING/Integration/SR-RE-02-satisfaction/reasoning_3_2.lp output_sr_re_02_02.lp"
OUTPUT=FULL-SR-ER-02-02-03.txt
cat $FILES > $OUTPUT

FILES="$REASONING/Integration/SR-RE-02-satisfaction/ontology_LKAS.lp $REASONING/Integration/SR-RE-02-satisfaction/obs_init_state_LKAS_4.lp $REASONING/Integration/SR-RE-02-satisfaction/reasoning_3_2.lp output_sr_re_02_02.lp"
OUTPUT=FULL-SR-ER-02-02-04.txt
cat $FILES > $OUTPUT
