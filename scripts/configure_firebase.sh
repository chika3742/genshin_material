#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors
# Usage: ./scripts/configure_firebase.sh <dev [project-id] | prod>
set -euo pipefail

case "${1:-}" in
  "dev")
    project="${2:-genshin-material-dev}"
    app_id="net.chikach.genshinmaterial.dev"
    ;;
  "prod")
    project="genshin-material-v4-79ee0"
    app_id="net.chikach.genshinmaterial"
    ;;
  *)
    echo "Error: No environment specified. Use 'dev' or 'prod'." >&2
    exit 1
    ;;
esac
flavor="$1"

cd "$(dirname "$0")/.."

# Runs the Firebase CLI with --json and prints its result.
# --json writes errors to stdout as well, so they are moved to stderr here.
firebase_json() {
  local out
  if ! out=$(firebase "$@" --project "$project" --json); then
    echo "Error: firebase $1: $(jq -r ".error" <<< "$out" 2>/dev/null || echo "$out")" >&2
    return 1
  fi
  jq ".result" <<< "$out"
}

# Prints the Firebase app ID registered with $app_id, registering the app if missing.
# Returns explicitly on failure, since errexit is off inside command substitution.
find_or_create_app() {
  local platform="$1" create_flag="$2" apps id
  apps=$(firebase_json apps:list "$platform") || return 1
  id=$(jq -r --arg v "$app_id" 'first(.[] | select((.bundleId // .packageName) == $v) | .appId) // empty' <<< "$apps")
  if [[ -z "$id" ]]; then
    id=$(firebase_json apps:create "$platform" "$create_flag" "$app_id" | jq -er ".appId") || return 1
  fi
  echo "$id"
}

# Takes the contents from --json, since -o refuses to overwrite an existing file in non-interactive mode
write_sdk_config() {
  local contents
  contents=$(firebase_json apps:sdkconfig "$1" "$2" | jq -er ".fileContents")
  mkdir -p "$(dirname "$3")"
  printf "%s\n" "$contents" > "$3"
}

ios_app=$(find_or_create_app IOS --bundle-id)
android_app=$(find_or_create_app ANDROID --package-name)
write_sdk_config IOS "$ios_app" "ios/Runner/GoogleService-$flavor-Info.plist"
write_sdk_config ANDROID "$android_app" "android/app/src/$flavor/google-services.json"
