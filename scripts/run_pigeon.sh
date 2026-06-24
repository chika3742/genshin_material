#!/usr/bin/env bash

DIR="$(dirname $(realpath $0))"

fvm dart run pigeon --input "$DIR/../pigeon.dart"
