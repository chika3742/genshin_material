#!/usr/bin/env bash

set -eo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function takeScreenshotsAndroid() {
    local device_name="$1"
    local screenshot_dir="$2"
    local locales
    read -r -a locales <<< "$3"

    local port=5580
    local emu_serial="emulator-$port"

    ~/Library/Android/sdk/emulator/emulator @"$1" -port $port -netdelay none -netspeed full &
    EMU_PID=$!
    adb -s $emu_serial wait-for-device
    for locale in "${locales[@]}"; do
        takeScreenshots "$screenshot_dir" "$locale" "{index}_${locale}.png" $emu_serial android
    done
    adb -s $emu_serial emu kill
    wait $EMU_PID
}

function takeScreenshotsApple() {
    local device_name="$1"
    local screenshot_dir="$2"
    local locales
    read -r -a locales <<< "$3"
    local screenshot_type="$4"

    if ! command -v jq >/dev/null 2>&1; then
      echo "Error: jq command is required"
      exit 1
    fi
    if ! command -v magick >/dev/null 2>&1; then
      echo "Error: Imagemagick must be installed."
      exit 1
    fi

    local udids
    mapfile -t udids <<< "$(xcrun simctl list devices available -j | jq -r --arg n "$device_name" '.devices[][] | select(.name == $n) | .udid')"
    if [[ ${#udids[@]} -ne 1 ]]; then
        echo "Expected exactly one simulator named \"$device_name\", found ${#udids[@]}" >&2
        exit 1
    fi
    local udid="${udids[0]}"

    xcrun simctl boot "$udid"
    # wait for boot
    xcrun simctl bootstatus "$udid"
    # override status bar
    xcrun simctl status_bar "$udid" override --time "09:41" --dataNetwork wifi --wifiMode active --wifiBars 3 --batteryState discharging --batteryLevel 100 --cellularMode active

    for locale in "${locales[@]}"; do
        takeScreenshots "$screenshot_dir" "$locale" "{index}_${screenshot_type}_{index}.png" "$udid" ios
    done
    xcrun simctl shutdown "$udid"
}

function takeScreenshots() {
    local locale="$2"
    local unresolved_screenshot_dir
    unresolved_screenshot_dir="$(echo "$DIR/$1" | sed "s/{locale}/$locale/g")"

    mkdir -p "$unresolved_screenshot_dir"

    local screenshot_dir
    screenshot_dir="$(realpath "$unresolved_screenshot_dir")"
    local screenshot_name_format="$3"
    local device_id="$4"
    local client_os="$5"

    echo "Taking screenshots for locale: $locale, saving to: $screenshot_dir with format: $screenshot_name_format"
    # start screenshot host server
    SCREENSHOT_DIR=$screenshot_dir\
      SCREENSHOT_NAME_FORMAT=$screenshot_name_format\
      CLIENT_OS=$client_os\
      DEVICE_ID=$device_id\
      fvm dart "$DIR"/screenshot_server.dart &
    SERVER_PID=$!
    echo "Server started on pid $SERVER_PID"

    fvm flutter drive --driver\
      "$DIR/driver.dart"\
      -d "$device_id"\
      --target "$DIR/take_screenshots_test.dart"\
      --dart-define SCREENSHOT_MODE=true\
      --dart-define LOCALE="$locale"

    pkill -P $SERVER_PID
    wait $SERVER_PID 2>/dev/null || true
}

trap 'pkill -P $SERVER_PID 2>/dev/null || true' EXIT

if [[ "$1" == "android" ]]; then
    locales=("ja-JP" "en-US")
    takeScreenshotsAndroid Pixel_9 "../../android/fastlane/metadata/android/{locale}/images/phoneScreenshots" "${locales[*]}"
    takeScreenshotsAndroid 7-inch_Tablet "../../android/fastlane/metadata/android/{locale}/images/sevenInchScreenshots" "${locales[*]}"
    takeScreenshotsAndroid Medium_Tablet "../../android/fastlane/metadata/android/{locale}/images/tenInchScreenshots" "${locales[*]}"
elif [[ "$1" == "ios" ]]; then
    locales=("ja" "en-US")
    takeScreenshotsApple "iPhone 14 Plus" "../../ios/fastlane/screenshots/{locale}" "${locales[*]}" APP_IPHONE_65
    takeScreenshotsApple "iPad Pro 13-inch (M5)" "../../ios/fastlane/screenshots/{locale}" "${locales[*]}" APP_IPAD_PRO_3GEN_129
else
    echo "Invalid platform: $1"
    exit 1
fi
