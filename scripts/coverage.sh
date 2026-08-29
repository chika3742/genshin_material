#!/usr/bin/env bash

set -euo pipefail

DIR="$(dirname "$(realpath "$0")")"

if ! command -v lcov > /dev/null; then
  echo "lcov is not installed." >&2
  echo "  Ubuntu/Debian: sudo apt-get install lcov" >&2
  echo "  macOS:         brew install lcov" >&2
  exit 1
fi

generate_html=false
for arg in "$@"; do
  case "$arg" in
    --html) generate_html=true ;;
    *)
      echo "Unknown argument: $arg" >&2
      echo "Usage: $(basename "$0") [--html]" >&2
      exit 1
      ;;
  esac
done

cd "$DIR/.."

fvm flutter test --coverage

# Generated and localization sources are not worth measuring.
lcov --remove coverage/lcov.info \
  "*.g.dart" \
  "*.freezed.dart" \
  "*.drift.dart" \
  "*.steps.dart" \
  "*.mocks.dart" \
  "lib/i18n/*" \
  "lib/firebase_options.dart" \
  "lib/routes.dart" \
  --output-file coverage/lcov-filtered.info \
  --ignore-errors unused \
  --quiet

lcov --summary coverage/lcov-filtered.info

if [[ "$generate_html" == true ]]; then
  genhtml coverage/lcov-filtered.info --output-directory coverage/html
fi
