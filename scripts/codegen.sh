#!/usr/bin/env bash

fvm dart run build_runner build --delete-conflicting-outputs --force-aot
fvm dart run slang
