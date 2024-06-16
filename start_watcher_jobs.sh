#!/bin/zsh

fvm dart run slang watch &
fvm dart run build_runner watch --delete-conflicting-outputs &
