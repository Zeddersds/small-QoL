#!/bin/bash
set -euo pipefail

tools/deploy.sh ci_test
rm ci_test/*.dll
mkdir ci_test/config

#test config
cp tools/ci/ci_config.txt ci_test/config/config.txt

#c(o)p(y) extools
cp ./libbyond-extools.so ci_test/libbyond-extools.so

cd ci_test
DreamDaemon tgstation.dmb -close -trusted -verbose -params "log-directory=ci"
cd ..
cat ci_test/data/logs/ci/clean_run.lk
