#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function takeScreenshotsAndroid() {
    local device_name="$1"
    local screenshot_dir="$2"
    local locales="$3"

    ~/Library/Android/sdk/emulator/emulator @"$1" -netdelay none -netspeed full &
    adb wait-for-device
    for locale in "${locales[@]}"; do
        takeScreenshots $screenshot_dir "$locale" "{index}_${locale}"
    done
    kill %%
    wait %%
}

function takeScreenshotsApple() {
    local device_name="$1"
    local screenshot_dir="$2"
    local locales=($3)
    local screenshot_type="$4"

    xcrun simctl boot "$device_name"
    xcrun simctl bootstatus "$device_name"
    for locale in "${locales[@]}"; do
        takeScreenshots "$screenshot_dir" "$locale" "{index}_${screenshot_type}_{index}"
    done
    xcrun simctl shutdown "$1"
}

function takeScreenshots() {
    local locale="$2"
    local screenshot_dir=$(echo $1 | sed "s/{locale}/$locale/g")
    local screenshot_name_format="$3"

    echo "Taking screenshots for locale: $locale, saving to: $screenshot_dir with format: $screenshot_name_format"
    flutter drive --driver\
      "$DIR/../test_driver/screenshot_driver.dart"\
      --target "$DIR/../integration_test/screenshots_test.dart"\
      --dart-define SCREENSHOT_MODE=true\
      --dart-define SCREENSHOT_DIR="$screenshot_dir"\
      --dart-define LOCALE="$locale"\
      --dart-define SCREENSHOT_NAME_FORMAT="$screenshot_name_format"
}

if [[ "$1" == "android" ]]; then
    locales=("ja-JP" "en-US")
    takeScreenshotsAndroid Pixel_9_API_36 ./android/fastlane/metadata/android/{locale}/images/phoneScreenshots "${locales[*]}"
    takeScreenshotsAndroid 7-inch_Tablet_API_35 ./android/fastlane/metadata/android/{locale}/images/sevenInchScreenshots "${locales[*]}"
    takeScreenshotsAndroid 10-inch_Tablet ./android/fastlane/metadata/android/{locale}/images/tenInchScreenshots "${locales[*]}"
elif [[ "$1" == "ios" ]]; then
    locales=("ja" "en-US")
    takeScreenshotsApple "iPhone 16 Plus" ./ios/fastlane/screenshots/{locale} "${locales[*]}" APP_IPHONE_67
    takeScreenshotsApple "iPad Pro (12.9-inch) (3rd generation)" ./ios/fastlane/screenshots/{locale} "${locales[*]}" APP_IPAD_PRO_3GEN_129
else
    echo "Invalid platform: $1"
    exit 1
fi
