#!/usr/bin/env bash

set -euo pipefail

RUNS=1000

g++ -O2 -std=c++17 a.cpp -o a
g++ -O2 -std=c++17 interactor.cpp -o interactor

for ((i=1;i<=RUNS;i++)); do
  echo "================ RUN $i ================"

  # recreate pipes
  rm -f in out
  mkfifo in out

  # open pipes to avoid blocking
  exec 3<>in
  exec 4<>out

  # start solution
  ./a < in > out &
  pid_sol=$!

  # run interactor
  set +e
  ./interactor < out > in 2> log.txt
  code_int=$?
  set -e

  # wait solution
  wait $pid_sol
  code_sol=$?

  # ================= RESULT =================

  if [ $code_int -eq 0 ]; then
    echo "Accepted"
  elif [ $code_int -eq 1 ]; then
    echo "Wrong Answer"
    cat log.txt
    exit 1
  elif [ $code_int -eq 2 ]; then
    echo "Too Many Queries"
    cat log.txt
    exit 1
  elif [ $code_int -eq 3 ]; then
    echo "Query Error"
    cat log.txt
    exit 1
  else
    echo "Unknown Error ($code_int)"
    cat log.txt
    exit 1
  fi

  if [ $code_sol -ne 0 ]; then
    echo "Solution crashed (code=$code_sol)"
    cat log.txt
    exit 1
  fi

  # close FDs
  exec 3>&-
  exec 4>&-

done

echo "✅ All $RUNS runs passed"