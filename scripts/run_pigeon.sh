#!/usr/bin/env zsh

DIR="$(dirname $(realpath $0))"

fvm dart run pigeon --input "$DIR/../pigeon.dart"
