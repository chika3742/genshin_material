#!/usr/bin/env bash

set -euo pipefail

# Runs the test suite with coverage, strips generated code from the report and
# prints a summary. Pass --html to additionally render an HTML report into
# coverage/html.

generate_html=false
for arg in "$@"; do
  case "$arg" in
    --html)
      generate_html=true
      ;;
    *)
      echo "Unknown argument: $arg" >&2
      echo "Usage: $0 [--html]" >&2
      exit 1
      ;;
  esac
done

if ! command -v lcov > /dev/null; then
  echo "lcov is not installed." >&2
  echo "  Debian/Ubuntu: sudo apt-get install lcov" >&2
  echo "  macOS:         brew install lcov" >&2
  exit 1
fi

if [ "$generate_html" = true ] && ! command -v genhtml > /dev/null; then
  echo "genhtml is not installed (it ships with lcov)." >&2
  echo "  Debian/Ubuntu: sudo apt-get install lcov" >&2
  echo "  macOS:         brew install lcov" >&2
  exit 1
fi

fvm flutter test --coverage

# `--ignore-errors unused` keeps the script alive when a pattern matches nothing
# (e.g. no mockito mocks were touched by the executed tests).
lcov --remove coverage/lcov.info \
  "*.g.dart" \
  "*.freezed.dart" \
  "*.drift.dart" \
  "*.steps.dart" \
  "*.mocks.dart" \
  "lib/i18n/*" \
  "lib/firebase_options.dart" \
  "lib/routes.dart" \
  --ignore-errors unused \
  -o coverage/lcov-filtered.info

lcov --summary coverage/lcov-filtered.info

if [ "$generate_html" = true ]; then
  genhtml coverage/lcov-filtered.info -o coverage/html
  echo "HTML report: coverage/html/index.html"
fi
