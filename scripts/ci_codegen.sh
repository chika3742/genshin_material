#!/usr/bin/env bash
# Runs every code generator in Renovate's postUpgradeTasks.
# executionMode "branch" passes no Flutter version to installTools, so install the one in .fvmrc here.
# Containerbase puts only `flutter` on PATH, so `dart` is resolved from the Flutter root.
set -euo pipefail

install-tool flutter "$(sed -n 's/.*"flutter": *"\([^"]*\)".*/\1/p' .fvmrc)"
flutter_root="$(flutter --version --machine | sed -n 's/^ *"flutterRoot": *"\(.*\)",\?$/\1/p')"
dart="$flutter_root/bin/dart"

flutter pub get
"$dart" run build_runner build
"$dart" run slang
"$dart" run pigeon --input ./pigeon.dart
