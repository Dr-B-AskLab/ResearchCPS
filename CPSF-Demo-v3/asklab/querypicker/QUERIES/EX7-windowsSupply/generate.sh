#! /bin/bash

BASE=../BASE/

FILES="case1.lp step1-BASE-modded.lp $BASE/theory.lp windows_scenario.lp support-module.lp output.lp"
OUTPUT=FULL-supplychain-1.txt
cat $FILES > $OUTPUT

FILES="case2.lp step1-BASE-modded.lp $BASE/theory.lp windows_scenario.lp support-module.lp output.lp"
OUTPUT=FULL-supplychain-2.txt
cat $FILES > $OUTPUT

FILES="case3.lp step1-BASE-modded.lp $BASE/theory.lp windows_scenario.lp support-module.lp output.lp"
OUTPUT=FULL-supplychain-3.txt
cat $FILES > $OUTPUT

FILES="case4.lp step1-BASE-modded.lp $BASE/theory.lp windows_scenario.lp support-module.lp output.lp"
OUTPUT=FULL-supplychain-4.txt
cat $FILES > $OUTPUT
