#!/usr/bin/env bash

function takeScreenshotsAndroid() {
    ~/Library/Android/sdk/emulator/emulator @"$1" -netdelay none -netspeed full &
    adb wait-for-device
    takeScreenshots "$2"
    kill %%
    wait %%
}

function takeScreenshotsApple() {
    xcrun simctl boot "$1"
    xcrun simctl bootstatus "$1"
    takeScreenshots "$2"
    xcrun simctl shutdown "$1"
}

function takeScreenshots() {
    script_dir=$(dirname "$0")
    flutter drive --driver "$script_dir/../test_driver/screenshot_driver.dart" --target "$script_dir/../integration_test/screenshots_test.dart" --dart-define SCREENSHOT_MODE=true --dart-define SCREENSHOT_DIR="$1"
}

if [[ "$1" == "android" ]]; then
    takeScreenshotsAndroid Pixel_8_API_35 ./screenshots/android/smartphone
    takeScreenshotsAndroid 7-inch_Tablet ./screenshots/android/7-inch-tablet
    takeScreenshotsAndroid 10-inch_Tablet ./screenshots/android/10-inch-tablet
elif [[ "$1" == "ios" ]]; then
    takeScreenshotsApple "iPhone 16 Plus" ./screenshots/apple/6.7-inch
    takeScreenshotsApple "iPad Pro 13-inch (M4)" ./screenshots/apple/13-inch
else
    echo "Invalid platform: $1"
    exit 1
fi
