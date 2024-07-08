#!/usr/bin/env bash

fvm dart run build_runner watch --delete-conflicting-outputs &
pid1=$!

fvm dart run slang watch &
pid2=$!

trap 'kill $pid1 $pid2; wait $pid1 $pid2 2>/dev/null; exit' SIGINT SIGTERM

wait $pid1 $pid2
