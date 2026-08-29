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

# Dart emits no FN records, so lcov >= 2.5 reports "function coverage enabled
# but no corresponding coverpoints found." unless function coverage is off.
LCOV_RC=(--rc function_coverage=0)

fvm flutter test --coverage

# Generated and localization sources are not worth measuring. routes.dart is
# deliberately kept: it is handwritten wiring, and routes.g.dart is already
# covered by the *.g.dart pattern.
lcov --remove coverage/lcov.info \
  "*.g.dart" \
  "*.freezed.dart" \
  "*.drift.dart" \
  "*.steps.dart" \
  "*.mocks.dart" \
  "lib/i18n/*" \
  "lib/firebase_options.dart" \
  --output-file coverage/lcov-filtered.info \
  --ignore-errors unused \
  "${LCOV_RC[@]}" \
  --quiet

lcov --summary coverage/lcov-filtered.info "${LCOV_RC[@]}"

# lcov --list neither aggregates by directory nor reports usable rates for
# these tracefiles, so sum the per-file records ourselves.
summarize() {
  awk -F: -v mode="$1" '
    /^SF:/ { dir = $2; sub(/\/[^\/]*$/, "", dir) }
    /^LF:/ { total[dir] += $2; all_total += $2 }
    /^LH:/ { hit[dir] += $2; all_hit += $2 }
    END {
      if (mode == "total") {
        printf "%8.1f%% %7d %7d  %s\n", \
          all_total ? 100 * all_hit / all_total : 0, all_hit, all_total, "TOTAL"
      } else {
        for (d in total) {
          printf "%8.1f%% %7d %7d  %s\n", \
            total[d] ? 100 * hit[d] / total[d] : 0, hit[d], total[d], d
        }
      }
    }
  ' coverage/lcov-filtered.info
}

echo
printf "%9s %7s %7s  %s\n" "rate" "hit" "total" "directory"
summarize dirs | sort -k1,1n -k4,4
summarize total

if [[ "$generate_html" == true ]]; then
  genhtml coverage/lcov-filtered.info \
    --output-directory coverage/html \
    "${LCOV_RC[@]}"
fi
