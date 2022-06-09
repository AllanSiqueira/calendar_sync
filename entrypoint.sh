#!/bin/bash -i

rm -f tmp/pids/server.pid

bundle clean

bundle check || bundle install --jobs=$(nproc) --clean

"$@"
