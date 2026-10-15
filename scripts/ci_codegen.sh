#!/usr/bin/env bash
# Runs every code generator in Renovate's postUpgradeTasks.
# Containerbase puts only `flutter` on PATH, so `dart` is resolved from the Flutter root.
set -euo pipefail

flutter_root="$(flutter --version --machine | sed -n 's/^ *"flutterRoot": *"\(.*\)",\?$/\1/p')"
dart="$flutter_root/bin/dart"

flutter pub get
"$dart" run build_runner build
"$dart" run slang
"$dart" run pigeon --input ./pigeon.dart
